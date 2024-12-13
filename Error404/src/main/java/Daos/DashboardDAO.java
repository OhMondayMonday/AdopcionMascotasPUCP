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

public class DashboardDAO extends BaseDao {
    // Obtener el nombre del usuario
    public String obtenerNombreUsuario(int userId) {
        String sql = "SELECT nombre FROM Usuarios WHERE user_id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("nombre");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Usuario";
    }

    public String obtenerFotoPerfil(int userId) {
        String sql = "SELECT f.url_foto FROM fotos f JOIN usuarios u ON f.foto_id = u.foto_id WHERE u.user_id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("url_foto");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "assets/img/FotoPerfil/perfil_user1.jpg"; //una por defeto puem
    }


    public int obtenerAnimalesAyudados(int userId) {
        // Ajusta esta consulta para reflejar la relación correcta
        String sql = "SELECT COUNT(*) FROM Mascotas m " +
                "JOIN Hogares_Temporales ht ON m.mascota_id = ht.mascota_id " +
                "WHERE ht.user_id = ? AND m.en_hogar_temporal = FALSE";
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
    } // Obtener el conteo de animales ayudados



    // Obtener el conteo de publicaciones realizadas
    public int obtenerPublicacionesRealizadas(int userId) {
        // Cambiado el estado a 'activa' para que coincida con la base de datos
        String sql = "SELECT COUNT(*) FROM Publicaciones WHERE user_id = ? AND estado_publicacion = 'activa'";
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
    public Eventos obtenerProximoEvento(int userId) {
        String sql = "SELECT e.event_id, e.nombre_evento, e.fecha_evento, e.hora_evento, e.foto_id, " +
                "le.lugar_id, le.nombre_lugar, f.url_foto " +
                "FROM Eventos e " +
                "JOIN Lugares_Eventos le ON e.lugar_evento_id = le.lugar_id " +
                "LEFT JOIN Fotos f ON e.foto_id = f.foto_id " + // JOIN para obtener la URL de la imagen
                "WHERE e.user_id = ? AND e.fecha_evento > NOW() " +
                "ORDER BY e.fecha_evento ASC LIMIT 1";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Eventos evento = new Eventos();
                evento.setEventId(rs.getInt("event_id"));
                evento.setNombreEvento(rs.getString("nombre_evento"));
                evento.setFechaEvento(rs.getDate("fecha_evento"));
                evento.setHoraEvento(rs.getTime("hora_evento"));

                // Configurar el lugar del evento
                LugaresEventos lugarEvento = new LugaresEventos();
                lugarEvento.setLugarId(rs.getInt("lugar_id"));
                lugarEvento.setNombreLugar(rs.getString("nombre_lugar"));
                evento.setLugarEvento(lugarEvento);

                // Configurar la URL de la imagen
                String urlFoto = rs.getString("url_foto");
                evento.setUrlFoto(urlFoto != null ? urlFoto : "assets/img/illustrations/boy-app-academy.png"); // Imagen por defecto si es null

                return evento;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }




    // Obtener las últimas actualizaciones (ajustada para asegurar que se obtengan correctamente)
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

    public void registrarSesion(int userId) {
        String sql = "INSERT INTO sesiones_usuarios (user_id) VALUES (?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void finalizarSesion(int sesionId) {
        String sql = "UPDATE sesiones_usuarios SET fin_sesion = NOW(), " +
                "duracion_sesion = TIMESTAMPDIFF(SECOND, inicio_sesion, NOW()) WHERE sesion_id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, sesionId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int obtenerTiempoTotalEmpleado(int userId) {
        String sql = "SELECT SUM(duracion_sesion) FROM sesiones_usuarios WHERE user_id = ?";
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


    // Dao para actualizaciones (revisado para manejar mejor las excepciones)
    public List<Logs> getLast4LogsByUserId(int userId) {
        List<Logs> logs = new ArrayList<>();
        String sql = "SELECT log_id, descripcion, fecha, user_id FROM logs WHERE user_id = ? ORDER BY fecha DESC LIMIT 4";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Logs log = new Logs();
                log.setLogId(rs.getInt("log_id"));
                log.setDescripcion(rs.getString("descripcion"));
                log.setFecha(rs.getTimestamp("fecha"));
                log.setUserId(rs.getInt("user_id"));
                logs.add(log);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return logs;
    }
}
