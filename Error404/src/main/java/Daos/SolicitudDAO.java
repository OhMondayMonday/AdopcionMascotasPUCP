package Daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class SolicitudDAO extends BaseDao {

    // Método para insertar una solicitud de mascota
    public boolean insertarSolicitudMascota(int solicitanteId, int solicitadoId, int mascotaId) {
        String sql = "INSERT INTO solicitudes (tipo_solicitud_id, solicitante_id, solicitado_id, mascota_id, fecha_solicitud, estado_solicitud) "
                + "VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP, 'pendiente')";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, 1); // Tipo de solicitud: 1 (Solicitud de mascota)
            ps.setInt(2, solicitanteId); // Albergue solicitante
            ps.setInt(3, solicitadoId);  // Hogar temporal solicitado
            ps.setInt(4, mascotaId);     // Mascota asociada

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Solicitud insertada correctamente.");
                return true; // Operación exitosa
            } else {
                System.out.println("No se insertó la solicitud.");
                return false; // No se insertó nada
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error al insertar la solicitud.");
            return false; // Error en la operación
        }
    }
}
