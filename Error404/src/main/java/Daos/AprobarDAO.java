package Daos;

import Beans.Fotos;
import Beans.HogaresTemporales;
import Beans.Publicaciones;
import Beans.Usuarios;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AprobarDAO extends BaseDao {

    /**
     * Genera filtros dinámicos en la consulta SQL basados en los parámetros de búsqueda.
     */
    private String agregarFiltrosDinamicos(String palabraClave, String tipoSolicitud, String ubicacion) {
        StringBuilder filtros = new StringBuilder();

        if (palabraClave != null && !palabraClave.trim().isEmpty()) {
            filtros.append(" AND (p.titulo LIKE ? OR p.descripcion LIKE ?)");
        }
        if (tipoSolicitud != null && !tipoSolicitud.equalsIgnoreCase("Todas") && !tipoSolicitud.isEmpty()) {
            filtros.append(" AND ht.tipo_mascotas = ?");
        }
        if (ubicacion != null && !ubicacion.equalsIgnoreCase("Todas") && !ubicacion.isEmpty()) {
            filtros.append(" AND ht.direccion LIKE ?");
        }
        return filtros.toString();
    }

    /**
     * Obtiene una lista de hogares temporales con filtros aplicados y paginación.
     */
    public List<HogaresTemporales> obtenerHogaresFiltrados(String palabraClave, String tipoSolicitud, String ubicacion, int start, int pageSize) {
        List<HogaresTemporales> hogaresList = new ArrayList<>();

        // Consulta SQL que recupera más campos
        String baseQuery = "SELECT ht.temporal_id, ht.tipo_mascotas, ht.direccion, ht.estado_temporal, " +
                "ht.edad, ht.genero, ht.celular, ht.cantidad_cuartos, ht.metraje_vivienda, " +
                "ht.cantidad_mascotas, ht.tiene_hijos, ht.vive_solo, ht.trabaja, ht.persona_referencia, " +
                "ht.contacto_referencia, ht.tiempo_temporal, f.url_foto, " +
                "u.nombre AS nombre_usuario, u.apellido AS apellido_usuario " +
                "FROM hogares_temporales ht " +
                "LEFT JOIN fotos f ON ht.foto_id = f.foto_id " + // Relación con fotos
                "JOIN usuarios u ON ht.user_id = u.user_id " + // Relación con usuarios
                "WHERE ht.estado_temporal = 'pendiente'";

        String sql = baseQuery + agregarFiltrosDinamicos(palabraClave, tipoSolicitud, ubicacion) + " LIMIT ?, ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Configura los parámetros dinámicos
            int index = setearParametros(pstmt, palabraClave, tipoSolicitud, ubicacion);
            pstmt.setInt(index++, Math.max(0, start)); // Inicio de la paginación
            pstmt.setInt(index, Math.max(1, pageSize)); // Tamaño de la página

            System.out.println("Ejecutando SQL: " + sql);
            System.out.println("Parámetros: start=" + start + ", pageSize=" + pageSize);

            // Procesa los resultados de la consulta
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    HogaresTemporales hogar = new HogaresTemporales();

                    // Datos básicos
                    hogar.setTemporalId(rs.getInt("temporal_id"));
                    hogar.setTipoMascotas(rs.getString("tipo_mascotas"));
                    hogar.setDireccion(rs.getString("direccion"));
                    hogar.setEstadoTemporal(rs.getString("estado_temporal"));

                    // Datos adicionales
                    hogar.setEdad(rs.getInt("edad"));
                    hogar.setGenero(rs.getString("genero"));
                    hogar.setCelular(rs.getString("celular"));
                    hogar.setCantidadCuartos(rs.getInt("cantidad_cuartos"));
                    hogar.setMetrajeVivienda(rs.getDouble("metraje_vivienda"));
                    hogar.setCantidadMascotas(rs.getInt("cantidad_mascotas"));
                    hogar.setTieneHijos(rs.getBoolean("tiene_hijos"));
                    hogar.setViveSolo(rs.getBoolean("vive_solo"));
                    hogar.setTrabaja(rs.getString("trabaja"));
                    hogar.setPersonaReferencia(rs.getString("persona_referencia"));
                    hogar.setContactoReferencia(rs.getString("contacto_referencia"));
                    hogar.setTiempoTemporal(rs.getInt("tiempo_temporal"));

                    // Información de la foto
                    Fotos foto = new Fotos();
                    String urlFoto = rs.getString("url_foto");
                    foto.setUrlFoto(urlFoto != null ? urlFoto : "/assets/img/default.jpg");
                    hogar.setFoto(foto);

                    // Información del usuario
                    Usuarios usuario = new Usuarios();
                    usuario.setNombre(rs.getString("nombre_usuario"));
                    usuario.setApellido(rs.getString("apellido_usuario"));
                    hogar.setUsuario(usuario);

                    hogaresList.add(hogar);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error en obtenerHogaresFiltrados: " + e.getMessage());
            e.printStackTrace();
        }
        return hogaresList;
    }





    /**
     * Cuenta el total de hogares temporales según los filtros aplicados.
     */
    public int contarHogaresFiltrados(String palabraClave, String tipoSolicitud, String ubicacion) {
        String baseQuery = "SELECT COUNT(*) AS total " +
                "FROM hogares_temporales ht " +
                "LEFT JOIN publicaciones p ON ht.temporal_id = p.publicacion_id " +
                "WHERE ht.estado_temporal = 'pendiente'";

        String sql = baseQuery + agregarFiltrosDinamicos(palabraClave, tipoSolicitud, ubicacion);

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            setearParametros(pstmt, palabraClave, tipoSolicitud, ubicacion);

            System.out.println("Ejecutando SQL (conteo): " + sql);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    int total = rs.getInt("total");
                    System.out.println("Total hogares encontrados: " + total);
                    return total;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error en contarHogaresFiltrados: " + e.getMessage());
            e.printStackTrace();
        }
        return 0;
    }


    /**
     * Configura los parámetros para el PreparedStatement.
     */
    private int setearParametros(PreparedStatement pstmt, String palabraClave, String tipoSolicitud, String ubicacion) throws SQLException {
        int index = 1;

        if (palabraClave != null && !palabraClave.trim().isEmpty()) {
            pstmt.setString(index++, "%" + palabraClave + "%");
            pstmt.setString(index++, "%" + palabraClave + "%");
        }
        if (tipoSolicitud != null && !tipoSolicitud.equalsIgnoreCase("Todas") && !tipoSolicitud.isEmpty()) {
            pstmt.setString(index++, tipoSolicitud);
        }
        if (ubicacion != null && !ubicacion.equalsIgnoreCase("Todas") && !ubicacion.isEmpty()) {
            pstmt.setString(index++, "%" + ubicacion + "%");
        }
        return index;
    }

    /**
     * Actualiza el estado de un hogar temporal a 'activa'.
     */
    public boolean aprobarHogarTemporal(int temporalId) {
        String sql = "UPDATE hogares_temporales SET estado_temporal = 'activa', fecha_aprobacion = NOW() WHERE temporal_id = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, temporalId);
            int filasActualizadas = pstmt.executeUpdate();

            System.out.println("Filas actualizadas (aprobarHogarTemporal): " + filasActualizadas);
            return filasActualizadas > 0;
        } catch (SQLException e) {
            System.err.println("Error en aprobarHogarTemporal: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
}
