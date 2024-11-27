package Daos;

import Beans.HogaresTemporales;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import java.sql.Date;

public class PostularHogarTemporalDAO extends BaseDao {

    // Método para guardar una nueva postulación de hogar temporal
    public boolean guardarHogarTemporal(HogaresTemporales hogarTemporal, String descripcionPublicacion, String tituloPublicacion) {
        // Consultas SQL
        String sqlInsertFoto = "INSERT INTO fotos (url_foto, fecha_subida) VALUES (?, NOW())";
        String sqlPublicacion = "INSERT INTO publicaciones (user_id, titulo, descripcion, foto_id, tipo_publicacion_id, estado_publicacion) VALUES (?, ?, ?, ?, 2, 'activa')";
        String sqlHogar = "INSERT INTO hogares_temporales (user_id, foto_id, edad, genero, celular, direccion, distrito, " +
                "cantidad_cuartos, metraje_vivienda, tiene_mascotas, tipo_mascotas, tiene_hijos, " +
                "vive_solo, trabaja, persona_referencia, contacto_referencia, rango_fecha_inicio, " +
                "rango_fecha_fin, tiempo_temporal, estado_temporal, descripcion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String verificarPublicacion = "SELECT COUNT(*) FROM publicaciones WHERE user_id = ? AND tipo_publicacion_id = 2 AND estado_publicacion = 'activa'";

        try (Connection conn = this.getConnection()) {
            // Iniciar transacción
            conn.setAutoCommit(false);



            // 1. Insertar foto
            try (PreparedStatement pstmtFoto = conn.prepareStatement(sqlInsertFoto, Statement.RETURN_GENERATED_KEYS)) {
                pstmtFoto.setString(1, hogarTemporal.getFoto().getUrlFoto());
                int rowsFoto = pstmtFoto.executeUpdate();
                if (rowsFoto == 0) {
                    System.err.println("Error: No se pudo insertar la foto.");
                    conn.rollback();
                    return false;
                }

                // Obtener ID de la foto generada
                try (ResultSet generatedKeysFoto = pstmtFoto.getGeneratedKeys()) {
                    if (generatedKeysFoto.next()) {
                        hogarTemporal.getFoto().setFotoId(generatedKeysFoto.getInt(1));
                    } else {
                        System.err.println("Error: No se pudo obtener el ID de la foto generada.");
                        conn.rollback();
                        return false;
                    }
                }
            }

            // 2. Insertar publicación
            try (PreparedStatement pstmtPublicacion = conn.prepareStatement(sqlPublicacion, Statement.RETURN_GENERATED_KEYS)) {
                pstmtPublicacion.setInt(1, hogarTemporal.getUsuario().getUserId());
                pstmtPublicacion.setString(2, tituloPublicacion);
                pstmtPublicacion.setString(3, descripcionPublicacion);
                pstmtPublicacion.setInt(4, hogarTemporal.getFoto().getFotoId());

                int rowsPublicacion = pstmtPublicacion.executeUpdate();
                if (rowsPublicacion == 0) {
                    System.err.println("Error: No se pudo insertar la publicación.");
                    conn.rollback();
                    return false;
                }

                // Obtener el ID generado de la publicación
                try (ResultSet rsPublicacion = pstmtPublicacion.getGeneratedKeys()) {
                    if (rsPublicacion.next()) {
                        System.out.println("Publicación insertada con éxito. ID generado: " + rsPublicacion.getInt(1));
                    } else {
                        System.err.println("Error: No se pudo obtener el ID de la publicación generada.");
                        conn.rollback();
                        return false;
                    }
                }
            }

            // 3. Insertar hogar temporal
            try (PreparedStatement pstmtHogar = conn.prepareStatement(sqlHogar)) {
                pstmtHogar.setInt(1, hogarTemporal.getUsuario().getUserId());
                pstmtHogar.setInt(2, hogarTemporal.getFoto().getFotoId());
                pstmtHogar.setInt(3, hogarTemporal.getEdad());
                pstmtHogar.setString(4, hogarTemporal.getGenero());
                pstmtHogar.setString(5, hogarTemporal.getCelular());
                pstmtHogar.setString(6, hogarTemporal.getDireccion());
                pstmtHogar.setInt(7, hogarTemporal.getDistrito().getDistritoId());
                pstmtHogar.setInt(8, hogarTemporal.getCantidadCuartos());
                pstmtHogar.setDouble(9, hogarTemporal.getMetrajeVivienda());
                pstmtHogar.setBoolean(10, hogarTemporal.isTieneMascotas());
                pstmtHogar.setString(11, hogarTemporal.getTipoMascotas());
                pstmtHogar.setBoolean(12, hogarTemporal.isTieneHijos());
                pstmtHogar.setBoolean(13, hogarTemporal.isViveSolo());
                pstmtHogar.setString(14, hogarTemporal.getTrabaja());
                pstmtHogar.setString(15, hogarTemporal.getPersonaReferencia());
                pstmtHogar.setString(16, hogarTemporal.getContactoReferencia());
                pstmtHogar.setDate(17, new java.sql.Date(hogarTemporal.getRangoFechaInicio().getTime()));
                pstmtHogar.setDate(18, new java.sql.Date(hogarTemporal.getRangoFechaFin().getTime()));
                pstmtHogar.setInt(19, hogarTemporal.getTiempoTemporal());
                pstmtHogar.setString(20, "pendiente");
                pstmtHogar.setString(21, hogarTemporal.getDescripcion());

                int rowsHogar = pstmtHogar.executeUpdate();
                if (rowsHogar == 0) {
                    System.err.println("Error: No se pudo insertar el hogar temporal.");
                    conn.rollback();
                    return false;
                }
            }

            // Confirmar transacción
            conn.commit();
            return true;

        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }






    // Puedes agregar otros métodos como actualizar, eliminar y consultar si es necesario.
}

