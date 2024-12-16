package Daos;
import Beans.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class UsuarioFinalDAO extends BaseDao {

    // Metodo para obtener todos los detalles de un usuario específico
    public boolean registrarUsuario(Usuarios usuario) {
        String sql = "INSERT INTO usuarios (username, contrasenia, nombre, apellido, email, DNI, direccion, distrito_id, " +
                "estado_cuenta, rol_id, fecha_registro, anio_creacion, numero_yape_plin, zona_id) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), ?, ?, ?)";
        boolean isSuccess = false;

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, usuario.getUsername());
            stmt.setString(2, usuario.getContrasenia());
            stmt.setString(3, usuario.getNombre());
            stmt.setString(4, usuario.getApellido());
            stmt.setString(5, usuario.getEmail());
            stmt.setString(6, usuario.getDni());
            stmt.setString(7, usuario.getDireccion());

            if (usuario.getDistrito() != null) {
                stmt.setInt(8, usuario.getDistrito().getDistritoId());
            } else {
                stmt.setNull(8, java.sql.Types.INTEGER);
            }

            stmt.setString(9, "pendiente"); // Estado inicial
            stmt.setInt(10, usuario.getRol().getRolId());
            stmt.setString(11, usuario.getNumeroYapePlin());

            if (usuario.getZona() != null) {
                stmt.setInt(12, usuario.getZona().getZonaId());
            } else {
                stmt.setNull(12, java.sql.Types.INTEGER);
            }

            int affectedRows = stmt.executeUpdate();
            isSuccess = affectedRows > 0;

            if (isSuccess) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        int generatedId = rs.getInt(1);
                        usuario.setUserId(generatedId); // Asigna el userId al objeto usuario
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isSuccess;
    }


    // 2. Obtener Información del Albergue
    public Usuarios obtenerInformacionUsuario(int usuarioId) {
        String sql = "SELECT user_id, username, nombre, apellido, email, direccion, descripcion, distrito_id, " +
                "estado_cuenta, nombre_albergue, capacidad_nuevos_animales, animales_albergados, " +
                "anio_creacion, url_facebook, url_instagram, punto_acopio, direccion_donaciones, " +
                "nombre_contacto_donaciones, numero_contacto_donaciones, numero_yape_plin, zona_id " +
                "FROM usuarios WHERE user_id = ? AND rol_id = ?";


        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, usuarioId);
            stmt.setInt(2, 1);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Usuarios usuario = new Usuarios();
                usuario.setUserId(rs.getInt("user_id"));
                usuario.setUsername(rs.getString("username"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
                usuario.setEmail(rs.getString("email"));
                usuario.setDireccion(rs.getString("direccion"));
                usuario.setDescripcion(rs.getString("descripcion")); // Descripción agregada

                // Asignar Distrito
                if (rs.getObject("distrito_id") != null) {
                    Distritos distrito = new Distritos();
                    distrito.setDistritoId(rs.getInt("distrito_id"));
                    distrito.setNombreDistrito(rs.getString("nombre_distrito")); // Agregar nombre
                    usuario.setDistrito(distrito);
                }

                usuario.setEstadoCuenta(rs.getString("estado_cuenta"));
                usuario.setAnioCreacion(rs.getDate("anio_creacion"));
                usuario.setNumeroYapePlin(rs.getString("numero_yape_plin"));

                usuario.setUrlFacebook(rs.getString("url_facebook"));
                usuario.setUrlInstagram(rs.getString("url_instagram"));

                return usuario;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // 3. Actualizar Información del Albergue
    public boolean actualizarInformacionUsuario(Usuarios usuario) {
        String sql = "UPDATE usuarios SET username = ?, nombre = ?, apellido = ?, email = ?, direccion = ?, distrito_id = ?, " +
                "capacidad_nuevos_animales = ?, animales_albergados = ?, url_facebook = ?, url_instagram = ?, " +
                "punto_acopio = ?, direccion_donaciones = ?, nombre_contacto_donaciones = ?, " +
                "numero_contacto_donaciones = ?, numero_yape_plin = ?, descripcion = ?, nombre_albergue = ? " +
                "WHERE user_id = ? AND rol_id = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, usuario.getUsername());
            stmt.setString(2, usuario.getNombre());
            stmt.setString(3, usuario.getApellido());
            stmt.setString(4, usuario.getEmail());
            stmt.setString(5, usuario.getDireccion());

            if (usuario.getDistrito() != null) {
                stmt.setInt(6, usuario.getDistrito().getDistritoId());
            } else {
                stmt.setNull(6, java.sql.Types.INTEGER);
            }

            stmt.setString(7, usuario.getNumeroYapePlin());
            stmt.setString(8, usuario.getDescripcion());

            // Asignar zona_id
            if (usuario.getZona() != null) {
                stmt.setInt(9, usuario.getZona().getZonaId());
            } else {
                stmt.setNull(9, java.sql.Types.INTEGER);
            }

            stmt.setString(10, usuario.getUrlFacebook());
            stmt.setString(11, usuario.getUrlInstagram());
            stmt.setInt(12, usuario.getUserId());
            stmt.setInt(13, 1);

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
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

