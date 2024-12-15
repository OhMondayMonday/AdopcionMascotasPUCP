package Daos;

import Beans.Distritos;
import Beans.Fotos;
import Beans.LugaresEventos;
import Beans.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class AdminDAO extends BaseDao{
    public List<LugaresEventos> obtenerLugaresEventosConDisponibilidad() {
        List<LugaresEventos> lugaresEventos = new ArrayList<>();
        String sql = "SELECT le.lugar_id, le.nombre_lugar, le.direccion_lugar, le.aforo_maximo, le.activo, " +
                "d.distrito_id, d.nombre_distrito, f.foto_id, f.url_foto " +
                "FROM lugares_eventos le " +
                "JOIN distritos d ON le.distrito_id = d.distrito_id " +
                "JOIN fotos f ON le.foto_id = f.foto_id";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                // Crear el objeto relacionado de Distrito
                Distritos distrito = new Distritos();
                distrito.setDistritoId(rs.getInt("distrito_id"));
                distrito.setNombreDistrito(rs.getString("nombre_distrito"));

                // Crear el objeto relacionado de Foto
                Fotos foto = new Fotos();
                foto.setFotoId(rs.getInt("foto_id"));
                foto.setUrlFoto(rs.getString("ruta_foto"));

                // Crear el objeto LugaresEventos
                LugaresEventos lugar = new LugaresEventos();
                lugar.setLugarId(rs.getInt("lugar_id"));
                lugar.setNombreLugar(rs.getString("nombre_lugar"));
                lugar.setDireccionLugar(rs.getString("direccion_lugar"));
                lugar.setAforoMaximo(rs.getInt("aforo_maximo"));
                lugar.setActivo(rs.getBoolean("activo"));
                lugar.setDistrito(distrito);
                lugar.setFoto(foto);

                // Verificar disponibilidad del lugar
                lugar.setDisponible(esLugarDisponible(lugar.getLugarId()));

                lugaresEventos.add(lugar);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener lugares de eventos", e);
        }

        return lugaresEventos;
    }

    // Método auxiliar para verificar la disponibilidad
    public boolean esLugarDisponible(int lugarId) {
        String sql = "SELECT COUNT(*) AS eventos_ocupados " +
                "FROM eventos " +
                "WHERE lugar_evento_id = ? " +
                "  AND estado_evento = 'activa' " +
                "  AND fecha_evento <= CURDATE() " +
                "  AND fecha_fin >= CURDATE()";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, lugarId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int eventosOcupados = rs.getInt("eventos_ocupados");
                    return eventosOcupados == 0; // Si no hay eventos activos, el lugar está disponible
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al verificar la disponibilidad del lugar", e);
        }

        return false;
    }

    public List<Usuarios> obtenerUsuarios() {
        List<Usuarios> usuarios = new ArrayList<>();

        String query = """
            SELECT 
                u.user_id,
                u.username,
                u.email,
                u.fecha_registro,
                u.nombre,
                u.apellido,
                u.nombre_albergue,
                u.direccion,
                u.estado_cuenta,
                d.nombre_distrito AS distrito_nombre,
                r.rol_id,
                r.nombre_rol AS rol_nombre
            FROM 
                usuarios u
            JOIN 
                roles r ON u.rol_id = r.rol_id
            LEFT JOIN 
                distritos d ON u.distrito_id = d.distrito_id
            WHERE 
                u.rol_id NOT IN (3, 4);
            """;

        try (Connection connection = this.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Usuarios usuario = new Usuarios();

                // Mapear campos básicos
                usuario.setUserId(resultSet.getInt("user_id"));
                usuario.setUsername(resultSet.getString("username"));
                usuario.setEmail(resultSet.getString("email"));
                usuario.setFechaRegistro(resultSet.getTimestamp("fecha_registro"));

                // Mapear nombre completo o nombre del albergue
                usuario.setNombre(resultSet.getString("nombre"));
                usuario.setApellido(resultSet.getString("apellido"));
                usuario.setNombreAlbergue(resultSet.getString("nombre_albergue"));
                usuario.setEstadoCuenta(resultSet.getString("estado_cuenta"));
                // Mapear dirección
                usuario.setDireccion(resultSet.getString("direccion"));

                // Mapear distrito
                Distritos distrito = new Distritos();
                distrito.setNombreDistrito(resultSet.getString("distrito_nombre"));
                usuario.setDistrito(distrito);

                // Mapear rol
                Roles rol = new Roles();
                rol.setRolId(resultSet.getInt("rol_id"));
                rol.setNombreRol(resultSet.getString("rol_nombre"));
                usuario.setRol(rol);

                usuarios.add(usuario);
            }

        } catch (SQLException e) {
            // Manejo del error
            System.err.println("Error al obtener usuarios: " + e.getMessage());
            e.printStackTrace();
        }

        return usuarios; // Devuelve la lista, aunque esté vacía en caso de error
    }

    public boolean suspenderCuenta(int userId) {
        String sql = "UPDATE usuarios SET estado_cuenta = 'baneada' WHERE user_id = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean desbloquearCuenta(int userId) {
        String sql = "UPDATE usuarios SET estado_cuenta = 'activa' WHERE user_id = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Solicitudes> obtenerSolicitudesDonacionDinero(){
        List<Solicitudes> solicitudes = new ArrayList<>();
        String query = "SELECT s.solicitud_id, s.tipo_solicitud_id, s.solicitante_id, s.solicitado_id, " +
                "s.fecha_solicitud, s.estado_solicitud, s.dinero_donado, s.medio_pago, " +
                "ts.tipo_solicitud, " +
                "u_solicitante.nombre AS nombre_solicitante, u_solicitante.apellido AS apellido_solicitante, " +
                "u_solicitado.nombre_albergue AS nombre_albergue " +
                "FROM solicitudes s " +
                "INNER JOIN tipos_solicitudes ts ON s.tipo_solicitud_id = ts.tipo_solicitud_id " +
                "LEFT JOIN usuarios u_solicitante ON s.solicitante_id = u_solicitante.user_id " +
                "LEFT JOIN usuarios u_solicitado ON s.solicitado_id = u_solicitado.user_id " +
                "WHERE ts.tipo_solicitud = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, "donacion_dinero");
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Solicitudes solicitud = new Solicitudes();
                    solicitud.setSolicitudId(resultSet.getInt("solicitud_id"));

                    Usuarios solicitante = new Usuarios();
                    solicitante.setNombre(resultSet.getString("nombre_solicitante"));
                    solicitante.setApellido(resultSet.getString("apellido_solicitante"));
                    solicitud.setSolicitante(solicitante);

                    Usuarios solicitado = new Usuarios();
                    solicitado.setNombreAlbergue(resultSet.getString("nombre_albergue"));
                    solicitud.setSolicitado(solicitado);


                    solicitud.setFechaSolicitud(resultSet.getTimestamp("fecha_solicitud"));
                    solicitud.setEstadoSolicitud(resultSet.getString("estado_solicitud"));
                    solicitud.setDineroDonado(resultSet.getDouble("dinero_donado"));
                    solicitud.setMedioPago(resultSet.getString("medio_pago"));

                    solicitudes.add(solicitud);
                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return solicitudes;
    }

}
