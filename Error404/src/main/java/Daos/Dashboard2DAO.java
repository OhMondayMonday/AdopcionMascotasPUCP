package Daos;

import Beans.Eventos;
import Beans.LugaresEventos;
import Beans.Logs;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        return "/assets/img/FotoPerfil/perfil_user1.jpg"; // Imagen por defecto
    }

    public int obtenerAnimalesAyudados(int albergueId) {
        String sql = "SELECT COUNT(*) AS animales_ayudados " +
                "FROM mascotas " +
                "WHERE EXISTS (" +
                "    SELECT 1 " +
                "    FROM usuarios " +
                "    WHERE rol_id = 2 AND user_id = ? " +  // Filtrar por el albergueId o userId
                ") AND en_hogar_temporal = 1"; // O ajusta la condición de estado
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, albergueId); // Aquí se puede reemplazar 1 por albergueId
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("animales_ayudados");
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
    public Eventos obtenerProximoEvento() {
        String sql = "SELECT e.event_id, e.nombre_evento, e.fecha_evento, e.hora_evento, e.foto_id, " +
                "le.lugar_id, le.nombre_lugar, f.url_foto " +
                "FROM Eventos e " +
                "JOIN Lugares_Eventos le ON e.lugar_evento_id = le.lugar_id " +
                "LEFT JOIN Fotos f ON e.foto_id = f.foto_id " +
                "WHERE e.fecha_evento > NOW() " +
                "ORDER BY e.fecha_evento ASC LIMIT 1";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                // Crear un nuevo objeto Evento
                Eventos evento = new Eventos();
                evento.setEventId(rs.getInt("event_id"));
                evento.setNombreEvento(rs.getString("nombre_evento"));

                // Asignar la fecha del evento
                java.sql.Date fechaSql = rs.getDate("fecha_evento");
                if (fechaSql != null) {
                    evento.setFechaEvento(fechaSql);
                }

                // Obtener la hora del evento
                evento.setHoraEvento(rs.getTime("hora_evento"));

                // Crear objeto LugarEvento y asignarlo al evento
                LugaresEventos lugarEvento = new LugaresEventos();
                lugarEvento.setLugarId(rs.getInt("lugar_id"));
                lugarEvento.setNombreLugar(rs.getString("nombre_lugar"));
                evento.setLugarEvento(lugarEvento);

                // Obtener la URL de la foto
                String urlFoto = rs.getString("url_foto");
                System.out.println("URL Foto obtenida de la base de datos: " + urlFoto);  // Depuración

                // Verificar si la URL es válida y asignar la foto correspondiente
                if (urlFoto != null && !urlFoto.isEmpty()) {
                    evento.setUrlFoto(urlFoto);  // Asignar la URL de la foto si está disponible
                    System.out.println("Asignando URL de la foto: " + urlFoto);  // Depuración
                } else {
                    evento.setUrlFoto("/assets/img/illustrations/sitting-girl-with-laptop-dark.png");
                    System.out.println("Asignando URL de la foto por defecto: /assets/img/illustrations/sitting-girl-with-laptop-dark.png");  // Depuración
                }

                return evento;  // Devolver el evento más cercano
            }

        } catch (SQLException e) {
            System.err.println("Error al obtener el próximo evento: " + e.getMessage());
            e.printStackTrace();
        }

        return null;
    }


    // Dao para actualizaciones (revisado para manejar mejor las excepciones)
    public List<Logs> getLast4LogsByUserId(int albergueId) {
        List<Logs> logs = new ArrayList<>();
        String sql = """
        SELECT log_id, descripcion, 
               DATE_FORMAT(fecha, '%d/%m/%Y %H:%i:%s') AS fecha_formateada,
               TIMESTAMPDIFF(MINUTE, fecha, NOW()) AS minutos_transcurridos, 
               user_id 
        FROM logs 
        WHERE user_id = ? 
        ORDER BY fecha DESC 
        LIMIT 4
    """;

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, albergueId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Logs log = new Logs();
                log.setLogId(rs.getInt("log_id"));
                log.setDescripcion(rs.getString("descripcion"));
                log.setFechaFormateada(rs.getString("fecha_formateada"));
                log.setUserId(rs.getInt("user_id"));

                // Calcular el tiempo transcurrido
                int minutos = rs.getInt("minutos_transcurridos");
                String tiempoTranscurrido = "";
                if (minutos < 60) {
                    tiempoTranscurrido = "Hace " + minutos + " minutos";
                } else if (minutos < 1440) {
                    tiempoTranscurrido = "Hace " + (minutos / 60) + " horas";
                } else {
                    tiempoTranscurrido = "Hace " + (minutos / 1440) + " días";
                }
                log.setTiempoTranscurrido(tiempoTranscurrido);

                logs.add(log);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return logs;
    }
}
