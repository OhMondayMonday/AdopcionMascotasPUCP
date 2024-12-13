package Daos;
import Beans.Usuarios;

import java.sql.Connection;
import Beans.Distritos;
import Beans.Roles;
import Beans.Fotos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class UsuarioFinalDAO extends BaseDao {

    // Metodo para obtener todos los detalles de un usuario específico
    public Usuarios obtenerUsuarioPorId(int userId) {
        String query = "SELECT u.user_id, u.username, u.nombre, u.apellido, u.email, u.DNI, u.descripcion, u.direccion, u.estado_cuenta, u.fecha_registro, " +
                "       u.url_facebook, u.url_instagram, u.numero_yape_plin, u.fecha_nacimiento, " +
                "       r.rol_id AS rol_id, r.nombre_rol, f.foto_id, f.url_foto, d.distrito_id, d.nombre_distrito " +
                "FROM usuarios u " +
                "LEFT JOIN fotos f ON u.foto_id = f.foto_id " +
                "LEFT JOIN distritos d ON u.distrito_id = d.distrito_id " +
                "LEFT JOIN roles r ON u.rol_id = r.rol_id " +
                "WHERE u.user_id = ?";
        Usuarios usuario = null;

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, userId);
            //System.out.println("Query ejecutada: " + query);
            //System.out.println("Con parámetro: user_id = " + userId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    usuario = new Usuarios();
                    usuario.setUserId(rs.getInt("user_id"));
                    usuario.setUsername(rs.getString("username"));
                    usuario.setNombre(rs.getString("nombre"));
                    usuario.setApellido(rs.getString("apellido"));
                    usuario.setEmail(rs.getString("email"));
                    usuario.setDni(rs.getString("DNI"));
                    usuario.setDescripcion(rs.getString("descripcion"));
                    usuario.setDireccion(rs.getString("direccion"));

                    // Foto relacionada
                    Fotos foto = new Fotos();
                    if (rs.getObject("foto_id") != null) {
                        foto.setFotoId(rs.getInt("foto_id"));
                        foto.setUrlFoto(rs.getString("url_foto"));
                    }
                    usuario.setFoto(foto);

                    // Distrito relacionado
                    Distritos distrito = new Distritos();
                    if (rs.getObject("distrito_id") != null) {
                        distrito.setDistritoId(rs.getInt("distrito_id"));
                        distrito.setNombreDistrito(rs.getString("nombre_distrito"));
                    }
                    usuario.setDistrito(distrito);

                    // Rol relacionado
                    Roles rol = new Roles();
                    rol.setRolId(rs.getInt("rol_id"));
                    rol.setNombreRol(rs.getString("nombre_rol"));
                    usuario.setRol(rol);

                    usuario.setEstadoCuenta(rs.getString("estado_cuenta"));
                    usuario.setFechaRegistro(rs.getTimestamp("fecha_registro"));
                    usuario.setUrlFacebook(rs.getString("url_facebook"));
                    usuario.setUrlInstagram(rs.getString("url_instagram"));
                    usuario.setNumeroYapePlin(rs.getString("numero_yape_plin"));
                    usuario.setFechaNacimiento(rs.getString("fecha_nacimiento"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    // Crear un nuevo usuario
    public boolean crearUsuario(Usuarios usuario) {
        String query = "INSERT INTO Usuarios (username, contrasenia, nombre, apellido, email, DNI, direccion, distrito_id, estado_cuenta, rol_id, fecha_registro) " +
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
            ps.setTimestamp(11, usuario.getFechaRegistro());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Metodo para actualizar contraseña de un usuario (seguridad perfil)
    public boolean actualizarContrasenia(int userId, String nuevaContrasenia) {
        String query = "UPDATE usuarios SET contrasenia = ? WHERE user_id = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, nuevaContrasenia);
            pstmt.setInt(2, userId);

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    // Actualizar un usuario existente
    public boolean actualizarUsuario(Usuarios usuario) {
        String query = "UPDATE Usuarios SET username = ?, contrasenia = ?, nombre = ?, apellido = ?, email = ?, DNI = ?, direccion = ?, distrito_id = ?, " +
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

