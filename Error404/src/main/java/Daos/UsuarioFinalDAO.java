package Daos;
import Beans.Usuarios;

import java.beans.Beans;
import java.sql.Connection;
import Beans.Distritos;
import Beans.Roles;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class UsuarioFinalDAO extends BaseDao {

    // Obtener un usuario por ID
    public Usuarios obtenerUsuarioPorId(int userId) {
        String query = "SELECT * FROM Usuarios WHERE user_id = ?";
        Usuarios usuario = null;

        try (Connection connection = this.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {

            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    usuario = new Usuarios();
                    usuario.setUserId(rs.getInt("user_id"));
                    usuario.setUsername(rs.getString("username"));
                    usuario.setContrasenia(rs.getString("contrasenia"));
                    usuario.setNombre(rs.getString("nombre"));
                    usuario.setApellido(rs.getString("apellido"));
                    usuario.setEmail(rs.getString("email"));
                    usuario.setDni(rs.getString("DNI"));
                    usuario.setDireccion(rs.getString("direccion"));


                    // Crear y asignar el objeto Distritos
                    Distritos distrito = new Distritos();
                    distrito.setDistritoId(rs.getInt("distrito_id"));
                    usuario.setDistrito(distrito);  // Asegúrate de que este método esté bien definido

                    usuario.setEstadoCuenta(rs.getString("estado_cuenta"));

                    Roles roles = new Roles();
                    roles.setRolId(rs.getInt("rol_id"));
                    usuario.setRol(roles);

                    usuario.setFechaRegistro(rs.getString("fecha_registro"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    // Crear un nuevo usuario
    public boolean crearUsuario(Usuarios usuario) {
        String query = "INSERT INTO Usuarios (username, contraseña, nombre, apellido, email, DNI, direccion, distrito_id, estado_cuenta, rol_id, fecha_registro) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = this.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {

            ps.setString(1, usuario.getUsername());
            ps.setString(2, usuario.getContrasenia());
            ps.setString(3, usuario.getNombre());
            ps.setString(4, usuario.getApellido());
            ps.setString(5, usuario.getEmail());
            ps.setString(6, usuario.getDni());
            ps.setString(7, usuario.getDireccion());
            ps.setInt(8, usuario.getDistrito().getDistritoId());
            ps.setString(9, usuario.getEstadoCuenta()); // Estado inicial 'pendiente'
            ps.setInt(10, usuario.getRol().getRolId());
            ps.setString(11, usuario.getFechaRegistro());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Actualizar un usuario existente
    public boolean actualizarUsuario(Usuarios usuario) {
        String query = "UPDATE Usuarios SET username = ?, contraseña = ?, nombre = ?, apellido = ?, email = ?, DNI = ?, direccion = ?, distrito_id = ?, " +
                "estado_cuenta = ?, rol_id = ? WHERE user_id = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {

            ps.setString(1, usuario.getUsername());
            ps.setString(2, usuario.getContrasenia());
            ps.setString(3, usuario.getNombre());
            ps.setString(4, usuario.getApellido());
            ps.setString(5, usuario.getEmail());
            ps.setString(6, usuario.getDni());
            ps.setString(7, usuario.getDireccion());
            ps.setInt(8, usuario.getDistrito().getDistritoId());
            ps.setString(9, usuario.getEstadoCuenta());
            ps.setInt(10, usuario.getRol().getRolId());
            ps.setInt(11, usuario.getUserId());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Cambiar el estado de la cuenta de un usuario a 'eliminada' para una eliminación lógica
    public boolean eliminarUsuarioLogicamente(int userId) {
        String query = "UPDATE Usuarios SET estado_cuenta = 'eliminada' WHERE user_id = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {

            ps.setInt(1, userId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Cambiar el estado de la cuenta (por ejemplo, 'activa', 'baneada')
    public boolean actualizarEstadoCuenta(int userId, String nuevoEstado) {
        String query = "UPDATE Usuarios SET estado_cuenta = ? WHERE user_id = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {

            ps.setString(1, nuevoEstado);
            ps.setInt(2, userId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

