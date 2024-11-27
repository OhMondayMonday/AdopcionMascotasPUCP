package Daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO extends BaseDao {
    public int validarUsuario(String email, String contrasenia) {
        String sql = "SELECT user_id FROM usuarios WHERE email = ? AND contrasenia = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, email);
            statement.setString(2, contrasenia);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("user_id");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public int obtenerRolPorUserId(int userId) {
        String query = "SELECT rol_id FROM usuarios WHERE user_id = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("rol_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

}
