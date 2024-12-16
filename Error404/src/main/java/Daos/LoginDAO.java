package Daos;

import Beans.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class LoginDAO extends BaseDao {
    public Usuarios validarUsuario(String email, String contrasenia) {
        String sql = "SELECT u.*, r.nombre_rol, d.nombre_distrito, z.nombre_zona, f.url_foto, d.zona_distrito_id " +
                "FROM usuarios u " +
                "LEFT JOIN roles r ON u.rol_id = r.rol_id " +
                "LEFT JOIN distritos d ON u.distrito_id = d.distrito_id " +
                "LEFT JOIN zonas z ON d.zona_distrito_id = z.zona_id " +
                "LEFT JOIN fotos f ON u.foto_id = f.foto_id " +
                "WHERE u.email = ? AND u.contrasenia = ?";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            // Hash de la contraseña
            contrasenia = hashPassword(contrasenia);
            statement.setString(1, email);
            statement.setString(2, contrasenia);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    // Crear objeto usuario
                    Usuarios usuario = new Usuarios();
                    usuario.setUserId(resultSet.getInt("user_id"));
                    usuario.setUsername(resultSet.getString("username"));
                    usuario.setEmail(resultSet.getString("email"));
                    usuario.setNombre(resultSet.getString("nombre"));
                    usuario.setApellido(resultSet.getString("apellido"));
                    usuario.setDni(resultSet.getString("dni"));
                    usuario.setDescripcion(resultSet.getString("descripcion"));
                    usuario.setDireccion(resultSet.getString("direccion"));
                    usuario.setEstadoCuenta(resultSet.getString("estado_cuenta"));
                    usuario.setFechaRegistro(resultSet.getTimestamp("fecha_registro"));
                    usuario.setNombreAlbergue(resultSet.getString("nombre_albergue"));
                    usuario.setCapacidadNuevosAnimales(resultSet.getInt("capacidad_nuevos_animales"));
                    usuario.setAnimalesAlbergados(resultSet.getInt("animales_albergados"));
                    usuario.setAnioCreacion(resultSet.getDate("anio_creacion"));
                    usuario.setUrlFacebook(resultSet.getString("url_facebook"));
                    usuario.setUrlInstagram(resultSet.getString("url_instagram"));
                    usuario.setPuntoAcopio(resultSet.getString("punto_acopio"));
                    usuario.setDireccionDonaciones(resultSet.getString("direccion_donaciones"));
                    usuario.setNombreContactoDonaciones(resultSet.getString("nombre_contacto_donaciones"));
                    usuario.setNumeroContactoDonaciones(resultSet.getString("numero_contacto_donaciones"));
                    usuario.setNumeroYapePlin(resultSet.getString("numero_yape_plin"));
                    usuario.setFechaNacimiento(resultSet.getString("fecha_nacimiento"));
                    usuario.setFechaContratacion(resultSet.getString("fecha_contratacion"));

                    // Rol
                    Roles rol = new Roles();
                    rol.setRolId(resultSet.getInt("rol_id"));
                    rol.setNombreRol(resultSet.getString("nombre_rol"));
                    usuario.setRol(rol);

                    // Distrito
                    Distritos distrito = new Distritos();
                    distrito.setDistritoId(resultSet.getInt("distrito_id"));
                    distrito.setNombreDistrito(resultSet.getString("nombre_distrito"));
                    usuario.setDistrito(distrito);

                    // Zona
                    Zonas zona = new Zonas();
                    zona.setZonaId(resultSet.getInt("zona_id"));
                    zona.setNombreZona(resultSet.getString("nombre_zona"));
                    distrito.setZona(zona);

                    // Foto
                    Fotos foto = new Fotos();
                    foto.setFotoId(resultSet.getInt("foto_id"));
                    foto.setUrlFoto(resultSet.getString("url_foto"));
                    usuario.setFoto(foto);

                    return usuario;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public boolean EmailRepetido(String email) {
        String sql = """
        SELECT user_id
        FROM usuarios
        WHERE email = ?
        UNION
        SELECT solicitud_id
        FROM solicitudes
        WHERE email = ? AND estado_solicitud IN ('pendiente', 'aprobada')
    """;

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, email);
            pstmt.setString(2, email);

            try (ResultSet resultSet = pstmt.executeQuery()) {
                return resultSet.next();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean UsernameRepetido(String username) {
        String sql = """
        SELECT user_id
        FROM usuarios
        WHERE username = ?
        UNION
        SELECT solicitud_id
        FROM solicitudes
        WHERE username = ? AND estado_solicitud IN ('pendiente', 'aprobada')
    """;

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, username);
            pstmt.setString(2, username);

            try (ResultSet resultSet = pstmt.executeQuery()) {
                return resultSet.next();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public boolean DNIRepetido(String dni) {
        String sql = """
        SELECT user_id
        FROM usuarios
        WHERE dni = ?
        UNION
        SELECT solicitud_id
        FROM solicitudes
        WHERE DNI = ? AND estado_solicitud IN ('pendiente', 'aprobada')
    """;

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, dni);
            pstmt.setString(2, dni);

            try (ResultSet resultSet = pstmt.executeQuery()) {
                return resultSet.next();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }



    public boolean registrarSolicitud(String username, String email, String nombre, String apellido, String direccion, String dni, String distrito_id) {
        Connection connection = null;
        PreparedStatement statement = null;
        boolean registrado = false;

        try {
            connection = getConnection();

            String sql = "INSERT INTO solicitudes (username, email, nombre, apellido, direccion, dni, distrito_id, tipo_solicitud_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            // Crear el PreparedStatement
            statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, email);
            statement.setString(3, nombre);
            statement.setString(4, apellido);
            statement.setString(5, direccion);
            statement.setString(6, dni);
            statement.setString(7, distrito_id);
            statement.setInt(8, 1);

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

    public int getUserIdByEmail(String email) {
        String sql = "SELECT user_id FROM usuarios WHERE email = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next() ? rs.getInt("user_id") : -1;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // Actualiza la contraseña del usuario
    public boolean updatePassword(int userId, String newPassword) {
        String sql = "UPDATE usuarios SET contrasenia = ? WHERE user_id = ?";
        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            String hashedPassword = hashPassword(newPassword);
            pstmt.setString(1, hashedPassword);
            pstmt.setInt(2, userId);

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    public String hashPassword(String password) throws NoSuchAlgorithmException {
        // Crear una instancia del algoritmo SHA-256
        MessageDigest digest = MessageDigest.getInstance("SHA-256");

        // Aplicar el hash a la contraseña
        byte[] hashedBytes = digest.digest(password.getBytes());

        // Convertir el hash a formato hexadecimal
        StringBuilder hexString = new StringBuilder();
        for (byte b : hashedBytes) {
            hexString.append(String.format("%02x", b));
        }

        return hexString.toString();
    }
}
