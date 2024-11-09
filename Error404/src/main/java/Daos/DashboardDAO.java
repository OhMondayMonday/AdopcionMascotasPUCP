package Daos;

import Beans.Usuarios;
import Beans.Eventos; // Importa correctamente el Bean "Eventos"
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.text.SimpleDateFormat; // Importa para formatear las fechas
import java.util.Date;

public class DashboardDAO extends BaseDao {

    // Obtener el conteo de animales ayudados
    public int obtenerAnimalesAyudados(int userId) {
        String sql = "SELECT COUNT(*) FROM Mascotas WHERE user_id = ? AND en_hogar_temporal = FALSE";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Obtener el conteo de publicaciones realizadas
    public int obtenerPublicacionesRealizadas(int userId) {
        String sql = "SELECT COUNT(*) FROM Publicaciones WHERE user_id = ? AND estado_publicacion = 'aprobado'";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Obtener el conteo de eventos inscritos
    public int obtenerEventosInscritos(int userId) {
        String sql = "SELECT COUNT(*) FROM Inscripciones_Eventos WHERE user_id = ? AND activa = TRUE";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Obtener información de la actividad principal del usuario
    public String obtenerActividadPrincipal(int userId) {
        String sql = "SELECT titulo FROM Publicaciones WHERE user_id = ? ORDER BY fecha_creacion DESC LIMIT 1";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("titulo");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "No hay actividad reciente";
    }

    // Obtener el próximo evento
    public Eventos obtenerProximoEvento(int userId)
    {
        String sql = "SELECT e.event_id, e.nombre_evento, e.fecha_evento, le.nombre_lugar " +
                "FROM Eventos e JOIN Lugares_Eventos le ON e.lugar_evento_id = le.lugar_id " +
                "WHERE e.user_id = ? AND e.fecha_evento > NOW() ORDER BY e.fecha_evento ASC LIMIT 1";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Eventos evento = new Eventos();
                evento.setEventId(rs.getInt("event_id"));
                evento.setNombreEvento(rs.getString("nombre_evento"));

                // Convertir java.sql.Date a String
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String fechaEventoStr = sdf.format(rs.getDate("fecha_evento"));
                evento.setFechaEvento(fechaEventoStr); // Ajuste: Usa el String en lugar de Date

                evento.setLugarEventoId(rs.getInt("lugarEventoId")); // Asegúrate de usar el método correcto
                return evento;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Obtener las últimas actualizaciones
    public List<String> obtenerUltimasActualizaciones(int userId) {
        List<String> actualizaciones = new ArrayList<>();
        String sql = "SELECT comentario FROM Publicaciones WHERE user_id = ? ORDER BY fecha_creacion DESC LIMIT 5";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                actualizaciones.add(rs.getString("comentario"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return actualizaciones;
    }
}
