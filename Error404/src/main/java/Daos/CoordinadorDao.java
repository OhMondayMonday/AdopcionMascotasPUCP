package Daos;

import Beans.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CoordinadorDao extends BaseDao {

    // 1. Obtener solicitudes de hogares temporales pendientes
    public List<Solicitudes> obtenerSolicitudesHogarPendientes() {
        List<Solicitudes> solicitudes = new ArrayList<>();
        String sql = "SELECT s.solicitud_id, ts.tipo_solicitud, u.nombre AS solicitante, s.fecha_solicitud, " +
                "COALESCE(m.nombre, '-') AS mascota " +
                "FROM solicitudes s " +
                "JOIN tipos_solicitudes ts ON s.tipo_solicitud_id = ts.tipo_solicitud_id " +
                "JOIN usuarios u ON s.solicitante_id = u.user_id " +
                "LEFT JOIN mascotas m ON s.mascota_id = m.mascota_id " +
                "WHERE s.estado_solicitud = 'pendiente' " +
                "AND ts.tipo_solicitud = 'hogar_temporal' " +
                "ORDER BY s.fecha_solicitud DESC";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Solicitudes solicitud = new Solicitudes();
                solicitud.setSolicitudId(rs.getInt("solicitud_id"));
                TiposSolicitudes tipoSolicitud = new TiposSolicitudes();
                tipoSolicitud.setTipoSolicitud(rs.getString("tipo_solicitud"));
                solicitud.setTipoSolicitud(tipoSolicitud);

                Usuarios solicitante = new Usuarios();
                solicitante.setNombre(rs.getString("solicitante"));
                solicitud.setSolicitante(solicitante);

                solicitud.setFechaSolicitud(rs.getString("fecha_solicitud"));

                Mascotas mascota = new Mascotas();
                mascota.setNombre(rs.getString("mascota"));
                solicitud.setMascota(mascota);

                solicitudes.add(solicitud);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return solicitudes;
    }

    // 2. Obtener solicitudes de publicaciones de mascotas perdidas pendientes
    public List<PublicacionesMascotaPerdida> obtenerSolicitudesPublicacionesPendientes() {
        List<PublicacionesMascotaPerdida> publicaciones = new ArrayList<>();
        String sql = "SELECT p.publicacion_id, m.nombre AS mascota, p.lugar_perdida, p.fecha_perdida, u.nombre AS usuario " +
                "FROM publicaciones_mascota_perdida p " +
                "JOIN mascotas m ON p.mascota_id = m.mascota_id " +
                "JOIN usuarios u ON p.user_id = u.user_id " +
                "WHERE p.estado_publicacion = 'pendiente' " +
                "ORDER BY p.fecha_perdida DESC";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                PublicacionesMascotaPerdida publicacion = new PublicacionesMascotaPerdida();
                publicacion.setPublicacion_id(rs.getInt("publicacion_id"));

                Mascotas mascota = new Mascotas();
                mascota.setNombre(rs.getString("nombre")); // Asume que "nombre" es el nombre de la mascota
                publicacion.setMascota(mascota);

                publicacion.setLugarPerdida(rs.getString("lugar_perdida"));
                publicacion.setFechaPerdida(rs.getDate("fecha_perdida"));
                publicacion.setTelefonoContacto(rs.getString("telefono_contacto"));
                publicacion.setNombreContacto(rs.getString("nombre_contacto"));
                publicacion.setRecompensa(rs.getString("recompensa"));
                publicacion.setMascotaEncontrada(rs.getBoolean("mascota_encontrada"));

                publicaciones.add(publicacion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publicaciones;
    }

    // 3. Aprobar solicitud de hogar temporal
    public boolean aprobarSolicitudHogar(int solicitudId) {
        String sql = "UPDATE solicitudes SET estado_solicitud = 'aprobada', fecha_entrega = NOW() " +
                "WHERE solicitud_id = ? AND estado_solicitud = 'pendiente'";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, solicitudId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 4. Rechazar solicitud de hogar temporal
    public boolean rechazarSolicitudHogar(int solicitudId) {
        String sql = "UPDATE solicitudes SET estado_solicitud = 'rechazada', fecha_revision = NOW() " +
                "WHERE solicitud_id = ? AND estado_solicitud = 'pendiente'";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, solicitudId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 5. Aprobar publicación de mascota perdida
    public boolean aprobarPublicacionMascota(int publicacionId) {
        String sql = "UPDATE publicaciones_mascota_perdida SET estado_publicacion = 'activa', fecha_actualizacion = NOW() " +
                "WHERE publicacion_id = ? AND estado_publicacion = 'pendiente'";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, publicacionId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 6. Rechazar publicación de mascota perdida
    public boolean rechazarPublicacionMascota(int publicacionId) {
        String sql = "UPDATE publicaciones_mascota_perdida SET estado_publicacion = 'rechazada', fecha_actualizacion = NOW() " +
                "WHERE publicacion_id = ? AND estado_publicacion = 'pendiente'";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, publicacionId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 8. Baneo manual de un hogar temporal
    public boolean banearHogarTemporalManual(int temporalId) {
        String sql = "UPDATE hogares_temporales SET estado_temporal = 'suspendida' WHERE temporal_id = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, temporalId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 9. Baneo automático si un usuario ha sido rechazado 3 veces
    public boolean banearUsuarioPorRechazos() {
        String sql = "UPDATE usuarios " +
                "SET estado_cuenta = 'suspendida' " +
                "WHERE user_id IN ( " +
                "    SELECT solicitante_id " +
                "    FROM solicitudes " +
                "    WHERE tipo_solicitud_id = 1 " +
                "    AND estado_solicitud = 'rechazada' " +
                "    GROUP BY solicitante_id " +
                "    HAVING COUNT(*) >= 3 " +
                ")";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 7. Obtener los 5 comentarios más recientes del coordinador
    public List<Comentarios> obtenerComentariosRecientes(int publicacionId) {
        List<Comentarios> comentarios = new ArrayList<>();
        String sql = "SELECT ap.comentario, ap.fecha_actualizacion " +
                "FROM actualizaciones_publicacion ap " +
                "JOIN usuarios u ON ap.publicacion_id = u.user_id " +
                "JOIN roles r ON u.rol_id = r.rol_id " +
                "WHERE r.nombre_rol = 'coordinador' " +
                "AND ap.publicacion_id = ? " +
                "ORDER BY ap.fecha_actualizacion DESC " +
                "LIMIT 5";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, publicacionId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Comentarios comentario = new Comentarios();
                comentario.setComentario(rs.getString("comentario"));
                comentario.setFechaActualizacion(rs.getTimestamp("fecha_actualizacion"));
                comentarios.add(comentario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comentarios;
    }
    public List<Solicitudes> obtenerTodasLasSolicitudesHogar() {
        List<Solicitudes> solicitudes = new ArrayList<>();
        String sql = "SELECT s.solicitud_id, ts.tipo_solicitud, u.nombre AS solicitante, s.fecha_solicitud, " +
                "s.estado_solicitud, COALESCE(m.nombre, '-') AS mascota " +
                "FROM solicitudes s " +
                "JOIN tipos_solicitudes ts ON s.tipo_solicitud_id = ts.tipo_solicitud_id " +
                "JOIN usuarios u ON s.solicitante_id = u.user_id " +
                "LEFT JOIN mascotas m ON s.mascota_id = m.mascota_id " +
                "ORDER BY s.fecha_solicitud DESC";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Solicitudes solicitud = new Solicitudes();
                solicitud.setSolicitudId(rs.getInt("solicitud_id"));

                TiposSolicitudes tipoSolicitud = new TiposSolicitudes();
                tipoSolicitud.setTipoSolicitud(rs.getString("tipo_solicitud"));
                solicitud.setTipoSolicitud(tipoSolicitud);

                Usuarios solicitante = new Usuarios();
                solicitante.setNombre(rs.getString("solicitante"));
                solicitud.setSolicitante(solicitante);

                solicitud.setFechaSolicitud(rs.getString("fecha_solicitud"));
                solicitud.setEstadoSolicitud(rs.getString("estado_solicitud"));

                Mascotas mascota = new Mascotas();
                mascota.setNombre(rs.getString("mascota"));
                solicitud.setMascota(mascota);

                solicitudes.add(solicitud);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return solicitudes;
    }


    public List<HogaresTemporales> obtenerSolicitudesHogarPaginadas(int offset, int pageSize) {
        List<HogaresTemporales> hogaresTemporales = new ArrayList<>();
        String sql = "SELECT * FROM hogares_temporales LIMIT ? OFFSET ?";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, pageSize); // Tamaño de página
            stmt.setInt(2, offset);   // Offset para la paginación

            try (ResultSet resultSet = stmt.executeQuery()) {
                while (resultSet.next()) {
                    HogaresTemporales hogar = new HogaresTemporales();
                    hogar.setTemporalId(resultSet.getInt("temporal_id"));
                    // Asigna el resto de atributos del hogar
                    hogar.setEdad(resultSet.getInt("edad"));
                    hogar.setGenero(resultSet.getString("genero"));
                    hogar.setCelular(resultSet.getString("celular"));
                    hogar.setDireccion(resultSet.getString("direccion"));
                    // Completa los demás atributos de acuerdo a tu esquema
                    hogaresTemporales.add(hogar);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hogaresTemporales;
    }


    public int contarTotalHogaresTemporales() {
        int total = 0;
        String sql = "SELECT COUNT(*) AS total FROM hogares_temporales";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet resultSet = stmt.executeQuery()) {

            if (resultSet.next()) {
                total = resultSet.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }


}
