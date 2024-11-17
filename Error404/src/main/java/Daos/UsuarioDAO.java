package Daos;

import Beans.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAO extends BaseDao {

    public Usuarios validarUsuario(String username, String contrasenia) {
        Usuarios usuario = null;

        try (Connection connection = getConnection();
             PreparedStatement stmt = connection.prepareStatement(
                     "SELECT * FROM usuarios WHERE username = ? AND contrasenia = ? AND estadoCuenta = 'activa'")) {

            stmt.setString(1, username);
            stmt.setString(2, contrasenia);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                usuario = new Usuarios();
                usuario.setUserId(rs.getInt("userId"));
                usuario.setUsername(rs.getString("username"));
                usuario.setContrasenia(rs.getString("contrasenia"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
                usuario.setEmail(rs.getString("email"));
                usuario.setDni(rs.getString("dni"));
                usuario.setDescripcion(rs.getString("descripcion"));
                usuario.setDireccion(rs.getString("direccion"));

                Fotos foto = new Fotos();
                foto.setFotoId(rs.getInt("foto_id"));
                usuario.setFoto(foto);

                Distritos distrito = new Distritos();
                distrito.setDistritoId(rs.getInt("distrito_id"));
                usuario.setDistrito(distrito);

                usuario.setEstadoCuenta(rs.getString("estadoCuenta"));

                Roles rol = new Roles();
                rol.setRolId(rs.getInt("rol_id"));
                usuario.setRol(rol);

                usuario.setFechaRegistro(rs.getTimestamp("fechaRegistro"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usuario;
    }

    public boolean registrarUsuario(Usuarios usuario) {
        boolean registrado = false;

        String sql = "INSERT INTO usuarios (username, contrasenia, nombre, apellido, email, dni, descripcion, direccion, distrito_id, estadoCuenta, rol_id) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setString(1, usuario.getUsername());
            stmt.setString(2, usuario.getContrasenia());
            stmt.setString(3, usuario.getNombre());
            stmt.setString(4, usuario.getApellido());
            stmt.setString(5, usuario.getEmail());
            stmt.setString(6, usuario.getDni());
            stmt.setString(7, usuario.getDescripcion());
            stmt.setString(8, usuario.getDireccion());

            if (usuario.getDistrito() != null) {
                stmt.setInt(9, usuario.getDistrito().getDistritoId());
            } else {
                stmt.setNull(9, java.sql.Types.INTEGER);
            }

            stmt.setString(10, "activa");
            stmt.setInt(11, 1);

            registrado = stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return registrado;
    }
}


