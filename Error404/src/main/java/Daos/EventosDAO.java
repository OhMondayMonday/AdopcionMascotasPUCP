package Daos;

import Beans.Eventos;
import Beans.LugaresEventos;
import Beans.Usuarios;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalTime;
import java.time.Duration;

public class EventosDAO extends BaseDao {

    //Metodo para obtener todos los Eventos
    public List<Eventos> obtenerEventos() {
        List<Eventos> eventos = new ArrayList<>();
        String query = "SELECT * FROM eventos";

        try (Connection connection = this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Eventos evento = new Eventos();
                evento.setEventId(rs.getInt("event_id"));

                Beans.Usuarios usuario = new Beans.Usuarios();
                usuario.setUserId(rs.getInt("user_id")); // Asegúrate de que "lugar_evento_id" es el nombre correcto de la columna
                evento.setUsuario(usuario);

                evento.setNombreEvento(rs.getString("nombre_evento"));
                evento.setFechaEvento(rs.getDate("fecha_evento"));
                evento.setHoraEvento(rs.getTime("hora_evento"));

                // Crear y asignar el objeto LugaresEventos
                Beans.LugaresEventos lugarEvento = new Beans.LugaresEventos();
                lugarEvento.setLugarId(rs.getInt("lugar_evento_id")); // Asegúrate de que "lugar_evento_id" es el nombre correcto de la columna
                evento.setLugarEvento(lugarEvento);

                evento.setEntrada(rs.getString("entrada"));
                evento.setDescripcionEvento(rs.getString("descripcion_evento"));
                evento.setArtistasProveedores(rs.getString("artistas_proveedores"));
                evento.setRazonEvento(rs.getString("razon_evento"));
                evento.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
                evento.setEstadoEvento(rs.getString("estado_evento"));
                evento.setHoraInicio(rs.getTime("hora_inicio").toLocalTime()); // Conversión Time a LocalTime
                evento.setHoraFin(rs.getTime("hora_fin").toLocalTime()); // Conversión Time a LocalTime
                eventos.add(evento);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return eventos;
    }

    //Metodo para obtener todos los Eventos activos
    public List<Eventos> obtenerEventosActivos() {
        List<Eventos> eventos = new ArrayList<>();
        String query = "SELECT * FROM eventos WHERE estado_evento = 'activa'";

        try (Connection connection = this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Eventos evento = new Eventos();
                evento.setEventId(rs.getInt("event_id"));

                Usuarios usuario = new Usuarios();
                usuario.setUserId(rs.getInt("user_id"));
                evento.setUsuario(usuario);

                evento.setNombreEvento(rs.getString("nombre_evento"));
                evento.setFechaEvento(rs.getDate("fecha_evento"));
                evento.setHoraEvento(rs.getTime("hora_evento"));

                LugaresEventos lugaresEventos = new LugaresEventos();
                lugaresEventos.setLugarId(rs.getInt("lugar_evento_id"));
                evento.setLugarEvento(lugaresEventos);

                evento.setEntrada(rs.getString("entrada"));
                evento.setDescripcionEvento(rs.getString("descripcion_evento"));
                evento.setArtistasProveedores(rs.getString("artistas_proveedores"));
                evento.setRazonEvento(rs.getString("razon_evento"));
                evento.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
                evento.setEstadoEvento(rs.getString("estado_evento"));
                eventos.add(evento);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return eventos;
    }

    public boolean estaInscrito(int userId, int eventId) {
        String sql = "SELECT COUNT(*) FROM inscripciones_eventos WHERE user_id = ? AND event_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            stmt.setInt(2, eventId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //Metodo para agregar Evento
    public void agregarEvento(Eventos evento) {
        String query = "INSERT INTO eventos (event_id, user_id, nombre_evento, fecha_evento, hora_evento, lugar_evento_id, entrada, descripcion_evento, artistas_proveedores, razon_evento, fecha_creacion, estado_evento) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, evento.getEventId());
            pstmt.setInt(2, evento.getUsuario().getUserId());
            pstmt.setString(3, evento.getNombreEvento());
            pstmt.setDate(4, evento.getFechaEvento());
            pstmt.setTime(5, evento.getHoraEvento());
            pstmt.setInt(6, evento.getLugarEvento().getLugarId());
            pstmt.setString(7, evento.getEntrada());
            pstmt.setString(8, evento.getDescripcionEvento());
            pstmt.setString(9, evento.getArtistasProveedores());
            pstmt.setString(10, evento.getRazonEvento());
            pstmt.setTimestamp(11, evento.getFechaCreacion());
            pstmt.setString(12, evento.getEstadoEvento());
            pstmt.setTime(13, Time.valueOf(evento.getHoraInicio())); // Conversión LocalTime a Time
            pstmt.setTime(14, Time.valueOf(evento.getHoraFin())); // Conversión LocalTime a Time
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    //Metodo para actualizar un Evento sin verificacion
    public void actualizarEvento(Eventos evento) {
        String query = "UPDATE eventos SET nombre_evento = ?, fecha_evento = ?, hora_evento = ?, lugar_evento_id = ?, entrada = ?, descripcion_evento = ?, artistas_proveedores = ?, razon_evento = ? WHERE event_id = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, evento.getNombreEvento());
            pstmt.setDate(2, evento.getFechaEvento());
            pstmt.setTime(3, evento.getHoraEvento());
            pstmt.setInt(4, evento.getLugarEvento().getLugarId());
            pstmt.setString(5, evento.getEntrada());
            pstmt.setString(6, evento.getDescripcionEvento());
            pstmt.setString(7, evento.getArtistasProveedores());
            pstmt.setString(8, evento.getRazonEvento());
            pstmt.setInt(9, evento.getEventId());
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    //Metodo para eliminar un Evento sin verificacion
    public void eliminarEvento(int event_id) {
        String query = "UPDATE eventos SET estado_evento = ? WHERE event_id = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, "eliminada");
            pstmt.setInt(2, event_id);
            pstmt.executeUpdate();
        } catch(SQLException ex) {
            ex.printStackTrace();
        }
    }

    //Metodo para actualizar un Evento con verificacion
    public void actualizarEventoVerificacion(Eventos evento, int userID) {
        String query = "UPDATE eventos SET nombre_evento = ?, fecha_evento = ?, hora_evento = ?, lugar_evento_id = ?, entrada = ?, descripcion_evento = ?, artistas_proveedores = ?, razon_evento = ? WHERE event_id = ? and user_id = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, evento.getNombreEvento());
            pstmt.setDate(2, evento.getFechaEvento());
            pstmt.setTime(3, evento.getHoraEvento());
            pstmt.setInt(4, evento.getLugarEvento().getLugarId());
            pstmt.setString(5, evento.getEntrada());
            pstmt.setString(6, evento.getDescripcionEvento());
            pstmt.setString(7, evento.getArtistasProveedores());
            pstmt.setString(8, evento.getRazonEvento());
            pstmt.setInt(9, evento.getEventId());
            pstmt.setInt(10, userID);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    //Metodo para eliminar un Evento con verificacion
    public void eliminarEventoVerificacion(int event_id, int user_id) {
        String query = "UPDATE eventos SET estado_evento = ? WHERE event_id = ? and user_id = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, "eliminada");
            pstmt.setInt(2, event_id);
            pstmt.setInt(3, user_id);
            pstmt.executeUpdate();
        } catch(SQLException ex) {
            ex.printStackTrace();
        }
    }

    //Metodo para obtener mis eventos
    public List<Eventos> obtenerMisEventos(int user_id) {
        List<Eventos> eventos = new ArrayList<>();
        String query = "SELECT * FROM eventos WHERE user_id = " + user_id;

        try (Connection connection = this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Eventos evento = new Eventos();
                evento.setEventId(rs.getInt("event_id"));
                Beans.Usuarios usuario = new Beans.Usuarios();
                usuario.setUserId(rs.getInt("user_id"));
                evento.setUsuario(usuario); // Asignar el objeto usuario al evento
                evento.setNombreEvento(rs.getString("nombre_evento"));
                evento.setFechaEvento(rs.getDate("fecha_evento"));
                evento.setHoraEvento(rs.getTime("hora_evento"));

                Beans.LugaresEventos lugarEvento = new Beans.LugaresEventos();
                lugarEvento.setLugarId(rs.getInt("lugar_evento_id"));
                evento.setLugarEvento(lugarEvento);

                evento.setEntrada(rs.getString("entrada"));
                evento.setDescripcionEvento(rs.getString("descripcion_evento"));
                evento.setArtistasProveedores(rs.getString("artistas_proveedores"));
                evento.setRazonEvento(rs.getString("razon_evento"));
                evento.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
                evento.setEstadoEvento(rs.getString("estado_evento"));
                eventos.add(evento);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return eventos;
    }

    public Eventos obtenerDetalleEvento(int event_id) {
        Eventos evento = new Eventos();
        String query = "SELECT * FROM eventos WHERE event_id = ?";

        try (Connection connection = this.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(query)){
            pstmt.setInt(1, event_id);
            ResultSet rs = pstmt.executeQuery();

                evento.setEventId(rs.getInt("event_id"));

                Usuarios usuario = new Usuarios();
                usuario.setUserId(rs.getInt("user_id"));
                evento.setUsuario(usuario);

                evento.setNombreEvento(rs.getString("nombre_evento"));
                evento.setFechaEvento(rs.getDate("fecha_evento"));
                evento.setHoraEvento(rs.getTime("hora_evento"));

                LugaresEventos lugarEvento = new LugaresEventos();
                lugarEvento.setLugarId(rs.getInt("lugar_evento_id"));
                evento.setLugarEvento(lugarEvento);

                evento.setEntrada(rs.getString("entrada"));
                evento.setDescripcionEvento(rs.getString("descripcion_evento"));
                evento.setArtistasProveedores(rs.getString("artistas_proveedores"));
                evento.setRazonEvento(rs.getString("razon_evento"));
                evento.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
                evento.setEstadoEvento(rs.getString("estado_evento"));

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return evento;
    }

    // Método para inscribir a un usuario en un evento específico
    public boolean inscribirUsuarioEvento(int userId, int eventoId) {
        String sql = "INSERT INTO inscripciones_eventos (user_id, evento_id, fecha_inscripcion, activa) VALUES (?, ?, NOW(), 1)";

        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, eventoId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Método para obtener todos los eventos a los que un usuario está inscrito
    public List<Eventos> obtenerEventosUsuario(int userId) {
        String sql = "SELECT e.event_id, e.nombre_evento, e.fecha_evento, e.hora_inicio, e.hora_fin " +
                "FROM eventos e " +
                "JOIN inscripciones_eventos ie ON e.event_id = ie.evento_id " +
                "WHERE ie.user_id = ? AND ie.activa = 1";

        List<Eventos> eventosUsuario = new ArrayList<>();

        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Eventos evento = new Eventos();
                evento.setEventId(rs.getInt("event_id"));
                evento.setNombreEvento(rs.getString("nombre_evento"));
                evento.setHoraInicio(rs.getTime("hora_inicio").toLocalTime());
                evento.setHoraFin(rs.getTime("hora_fin").toLocalTime());
                eventosUsuario.add(evento);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return eventosUsuario;
    }


}
