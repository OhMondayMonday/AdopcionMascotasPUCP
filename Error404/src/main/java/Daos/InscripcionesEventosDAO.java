package Daos;

import Beans.*;

import java.sql.*;
import java.util.List;

public class InscripcionesEventosDAO extends BaseDao{

    public boolean inscribirUsuarioEnEvento(int userId, int eventId) {
        String query = "INSERT INTO inscripciones_eventos (user_id, event_id, fecha_inscripcion) VALUES (?, ?, NOW())";

        try (Connection connection = this.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {

            ps.setInt(1, userId);
            ps.setInt(2, eventId);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean verificarInscripcionExistente(int userId, int eventId) {
        boolean existe = false;
        String sql = "SELECT COUNT(*) FROM inscripciones_eventos WHERE user_id = ? AND event_id = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, eventId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    existe = rs.getInt(1) > 0; // Si el conteo es mayor a 0, ya existe
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return existe;
    }


}
