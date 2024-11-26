package Daos;

import Beans.Solicitudes;
import Beans.Usuarios;
import Beans.Roles;
import Beans.Mascotas;
import Beans.Razas;
import Beans.Fotos;
import Beans.Distritos;
import java.sql.*;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class MiHogarTemporalDAO extends BaseDao{

    // Método para obtener los detalles del usuario
    public Usuarios obtenerDetallesUsuarioTemporal(int userId) {
        Usuarios usuario = null;
        String query = "SELECT u.username, u.email, u.estado_cuenta, r.nombre_rol AS rol, u.user_id AS id, " +
                "u.nombre, u.apellido, u.numero_contacto_donaciones AS contacto, d.nombre_distrito AS distrito, f.url_foto " +
                "FROM usuarios u " +
                "JOIN roles r ON u.rol_id = r.rol_id " +
                "JOIN distritos d ON u.distrito_id = d.distrito_id " +
                "JOIN fotos f ON u.foto_id = f.foto_id " +
                "WHERE u.user_id = 1";

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {


            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                usuario = new Usuarios();
                usuario.setUserId(rs.getInt("id"));
                usuario.setUsername(rs.getString("username"));
                usuario.setEmail(rs.getString("email"));
                usuario.setEstadoCuenta(rs.getString("estado_cuenta"));
                usuario.setNombre(rs.getString("nombre")); // Asignar el nombre
                usuario.setApellido(rs.getString("apellido")); // Asignar el apellido
                usuario.setNumeroContactoDonaciones(rs.getString("contacto"));

                // Crear un objeto Roles y asignarlo al usuario
                Roles rol = new Roles();
                rol.setNombreRol(rs.getString("rol"));
                usuario.setRol(rol); // Asignar el objeto Roles al usuario

                // Crear el objeto Foto y asignarlo al usuario si existe URL de foto
                Fotos foto = new Fotos();
                foto.setUrlFoto(rs.getString("url_foto")); // Asegúrate de que "url_foto" esté en tu consulta SQL
                usuario.setFoto(foto); // Asignar el objeto Foto al usuario

                // Crear y asignar el objeto Distrito
                Distritos distrito = new Distritos();
                distrito.setNombreDistrito(rs.getString("distrito"));
                usuario.setDistrito(distrito);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    // Método para registrar una nueva solicitud
    public boolean registrarSolicitud(int solicitanteId, int solicitadoId, int mascotaId, String descripcion, String fechaSolicitud) {
        String query = "INSERT INTO solicitudes (solicitante_id, solicitado_id, mascota_id, descripcion, fecha_solicitud, estado_solicitud) " +
                "VALUES (?, ?, ?, ?, ?, 'pendiente')";

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, solicitanteId);   // Usuario que recibe la solicitud
            pstmt.setInt(2, solicitadoId);    // Albergue que envía la solicitud
            pstmt.setInt(3, mascotaId);       // Mascota involucrada en la solicitud
            pstmt.setString(4, descripcion);  // Descripción de la solicitud
            pstmt.setString(5, fechaSolicitud); // Fecha de la solicitud en formato "YYYY-MM-DD"

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0; // Retorna true si la solicitud se insertó correctamente

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Retorna false en caso de error
    }

    // Método para obtener la lista de mascotas solicitadas por un usuario
    public List<Solicitudes> obtenerSolicitudesPorUsuario(int userId) {
        List<Solicitudes> solicitudes  = new ArrayList<>();
        String query = "SELECT m.mascota_id, m.nombre, m.descripcion, m.edad_aproximada, " +
                "r.nombre_raza, m.genero, m.tamanio, s.fecha_solicitud " +
                "FROM solicitudes s " +
                "JOIN mascotas m ON s.mascota_id = m.mascota_id " +
                "JOIN razas r ON m.raza_id = r.raza_id " +
                "ORDER BY s.fecha_solicitud DESC";

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            //pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Mascotas mascota = new Mascotas();
                mascota.setMascotaId(rs.getInt("mascota_id"));
                mascota.setNombre(rs.getString("nombre"));
                mascota.setDescripcion(rs.getString("descripcion"));
                mascota.setEdadAproximada(rs.getInt("edad_aproximada"));
                mascota.setGenero(rs.getString("genero"));
                mascota.setTamanio(rs.getString("tamanio"));

                // Crear el objeto Razas y asignarlo a la mascota
                Razas raza = new Razas();
                raza.setNombreRaza(rs.getString("nombre_raza"));
                mascota.setRaza(raza);

                // Crear el objeto Solicitudes y asignar la fecha
                Solicitudes solicitud = new Solicitudes();
                solicitud.setFechaSolicitud(rs.getString("fecha_solicitud"));
                solicitud.setMascota(mascota);  // Asignar la mascota a la solicitud

                solicitudes.add(solicitud);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return solicitudes;
    }

}
