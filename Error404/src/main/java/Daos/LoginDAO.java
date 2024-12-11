package Daos;

import Beans.Usuarios;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO extends BaseDao {
    public Usuarios validarUsuario(String email, String contrasenia) {
        String sql = "SELECT user_id FROM usuarios WHERE email = ? AND contrasenia = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, email);
            statement.setString(2, contrasenia);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    Usuarios usuario = new Usuarios();
                    usuario.setUserId(resultSet.getInt("user_id"));
                    return usuario;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean EmailRepetido(String email) {
        String sql = "SELECT user_id FROM usuarios WHERE email = ?";
        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, email);

            try (ResultSet resultSet = pstmt.executeQuery()) {
                return resultSet.next();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean UsernameRepetido(String username) {
        String sql = "SELECT user_id FROM usuarios WHERE username = ?";
        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, username);

            try (ResultSet resultSet = pstmt.executeQuery()) {
                return resultSet.next();
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean DNIRepetido(String dni) {
        String sql = "SELECT user_id FROM usuarios WHERE dni = ?";
        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, dni);

            try (ResultSet resultSet = pstmt.executeQuery()) {
                return resultSet.next();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean registrarUsuario(String username, String email, String nombre, String apellido, String direccion, String dni, String distrito_id, String contrasenia) {
        Connection connection = null;
        PreparedStatement statement = null;
        boolean registrado = false;

        try {
            connection = getConnection();

            String sql = "INSERT INTO usuarios (username, email, nombre, apellido, direccion, dni, distrito_id, contrasenia) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            // Crear el PreparedStatement
            statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, email);
            statement.setString(3, nombre);
            statement.setString(4, apellido);
            statement.setString(5, direccion);
            statement.setString(6, dni);
            statement.setString(7, distrito_id);
            statement.setString(8, contrasenia);

            // Ejecutar la consulta de inserción
            int filasAfectadas = statement.executeUpdate();

            // Si la inserción fue exitosa, se insertó al usuario
            if (filasAfectadas > 0) {
                registrado = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            registrado = false;
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Retornar si el usuario fue registrado exitosamente o no
        return registrado;
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
