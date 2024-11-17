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
}


