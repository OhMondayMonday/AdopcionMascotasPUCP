package Daos;

import Beans.HogaresTemporales;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;

public class PostularHogarTemporalDAO extends BaseDao {

    // Método para guardar una nueva postulación de hogar temporal
    public boolean guardarHogarTemporal(HogaresTemporales hogarTemporal) {
        String sql = "INSERT INTO hogares_temporales (direccion, distrito, cantidad_cuartos, metraje_vivienda, tiene_mascotas, " +
                "cantidad_mascotas, tipo_mascotas, tiene_hijos, vive_solo, trabaja, persona_referencia, contacto_referencia, " +
                "tiempo_temporal, rango_fecha_inicio, rango_fecha_fin, estado_temporal) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, hogarTemporal.getDireccion());
            pstmt.setInt(2, hogarTemporal.getDistrito().getDistritoId());
            pstmt.setInt(3, hogarTemporal.getCantidadCuartos());
            pstmt.setDouble(4, hogarTemporal.getMetrajeVivienda());
            pstmt.setBoolean(5, hogarTemporal.isTieneMascotas());
            pstmt.setInt(6, hogarTemporal.getCantidadMascotas());
            pstmt.setString(7, hogarTemporal.getTipoMascotas());
            pstmt.setBoolean(8, hogarTemporal.isTieneHijos());
            pstmt.setBoolean(9, hogarTemporal.isViveSolo());
            pstmt.setString(10, hogarTemporal.getTrabaja());
            pstmt.setString(11, hogarTemporal.getPersonaReferencia());
            pstmt.setString(12, hogarTemporal.getContactoReferencia());
            pstmt.setInt(13, hogarTemporal.getTiempoTemporal());
            pstmt.setDate(14, new java.sql.Date(hogarTemporal.getRangoFechaInicio().getTime()));
            pstmt.setDate(15, new java.sql.Date(hogarTemporal.getRangoFechaFin().getTime()));

            pstmt.setString(16, hogarTemporal.getEstadoTemporal());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Puedes agregar otros métodos como actualizar, eliminar y consultar si es necesario.
}

