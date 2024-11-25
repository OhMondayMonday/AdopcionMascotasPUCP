package Daos;

import Beans.Eventos;
import Beans.LugaresEventos;
import Beans.Logs;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Dashboard2DAO extends BaseDao {

    // Obtener el nombre del albergue
    public String obtenerNombreAlbergue(int albergueId) {
        String sql = "SELECT nombre_albergue FROM Usuarios WHERE user_id = ? AND nombre_albergue IS NOT NULL";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, albergueId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("nombre_albergue");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Albergue";
    }

    // Obtener la foto de perfil del albergue
    public String obtenerFotoPerfilAlbergue(int albergueId) {
        String sql = "SELECT f.url_foto FROM fotos f JOIN usuarios u ON f.foto_id = u.foto_id WHERE u.user_id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, albergueId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("url_foto");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "assets/img/default-profile.jpg"; // Imagen por defecto
    }

    // Obtener el conteo de animales ayudados
    public int obtenerAnimalesAyudados(int albergueId) { // Cambiado a obtenerAnimalesAyudados
        String sql = "SELECT animales_albergados FROM Usuarios WHERE user_id = ? AND nombre_albergue IS NOT NULL";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, albergueId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("animales_albergados");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Obtener el conteo de publicaciones realizadas
    public int obtenerPublicacionesRealizadas(int albergueId) {
        String sql = "SELECT COUNT(*) FROM Publicaciones WHERE user_id = ? AND estado_publicacion = 'activa'";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, albergueId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Obtener el conteo de eventos organizados
    public int obtenerEventosOrganizados(int albergueId) {
        String sql = "SELECT COUNT(*) FROM Eventos WHERE user_id = ? AND estado_evento = 'activa'";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, albergueId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Obtener información del próximo evento
    public Eventos obtenerProximoEvento(int albergueId) {
        String sql = "SELECT e.event_id, e.nombre_evento, e.fecha_evento, e.hora_evento, e.foto_id, " +
                "le.lugar_id, le.nombre_lugar, f.url_foto " +
                "FROM Eventos e " +
                "JOIN Lugares_Eventos le ON e.lugar_evento_id = le.lugar_id " +
                "LEFT JOIN Fotos f ON e.foto_id = f.foto_id " +
                "WHERE e.user_id = ? AND e.fecha_evento > NOW() " +
                "ORDER BY e.fecha_evento ASC LIMIT 1";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, albergueId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Eventos evento = new Eventos();
                evento.setEventId(rs.getInt("event_id"));
                evento.setNombreEvento(rs.getString("nombre_evento"));
                evento.setFechaEvento(rs.getDate("fecha_evento"));
                evento.setHoraEvento(rs.getTime("hora_evento"));

                LugaresEventos lugarEvento = new LugaresEventos();
                lugarEvento.setLugarId(rs.getInt("lugar_id"));
                lugarEvento.setNombreLugar(rs.getString("nombre_lugar"));
                evento.setLugarEvento(lugarEvento);

                String urlFoto = rs.getString("url_foto");
                evento.setUrlFoto(urlFoto != null ? urlFoto : "assets/img/default-event.jpg");
                return evento;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Obtener las últimas actualizaciones
    public List<Logs> obtenerUltimasActualizaciones(int albergueId) {
        List<Logs> actualizaciones = new ArrayList<>();
        String sql = "SELECT log_id, descripcion, fecha, user_id FROM logs WHERE user_id = ? ORDER BY fecha DESC LIMIT 4";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, albergueId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Logs log = new Logs();
                log.setLogId(rs.getInt("log_id"));
                log.setDescripcion(rs.getString("descripcion"));
                log.setFecha(rs.getTimestamp("fecha"));
                log.setUserId(rs.getInt("user_id"));
                actualizaciones.add(log);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return actualizaciones;
    }
}
