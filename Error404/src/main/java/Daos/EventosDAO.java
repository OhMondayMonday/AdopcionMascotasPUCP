package Daos;

import Beans.Eventos;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
                evento.setUserId(rs.getInt("user_id"));
                evento.setNombreEvento(rs.getString("nombre_evento"));
                evento.setFechaEvento(rs.getString("fecha_evento"));
                evento.setHoraEvento(rs.getString("hora_evento"));
                evento.setLugarEventoId(rs.getInt("lugar_evento_id"));
                evento.setEntrada(rs.getString("entrada"));
                evento.setDescripcionEvento(rs.getString("descripcion_evento"));
                evento.setArtistasProveedores(rs.getString("artistas_proveedores"));
                evento.setRazonEvento(rs.getString("razon_evento"));
                evento.setFechaCreacion(rs.getString("fecha_creacion"));
                evento.setEstadoEvento(rs.getString("estado_evento"));
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
                evento.setUserId(rs.getInt("user_id"));
                evento.setNombreEvento(rs.getString("nombre_evento"));
                evento.setFechaEvento(rs.getString("fecha_evento"));
                evento.setHoraEvento(rs.getString("hora_evento"));
                evento.setLugarEventoId(rs.getInt("lugar_evento_id"));
                evento.setEntrada(rs.getString("entrada"));
                evento.setDescripcionEvento(rs.getString("descripcion_evento"));
                evento.setArtistasProveedores(rs.getString("artistas_proveedores"));
                evento.setRazonEvento(rs.getString("razon_evento"));
                evento.setFechaCreacion(rs.getString("fecha_creacion"));
                evento.setEstadoEvento(rs.getString("estado_evento"));
                eventos.add(evento);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return eventos;
    }

    //Metodo para agregar Evento
    public void agregarEvento(Eventos evento) {
        String query = "INSERT INTO eventos (event_id, user_id, nombre_evento, fecha_evento, hora_evento, lugar_evento_id, entrada, descripcion_evento, artistas_proveedores, razon_evento, fecha_creacion, estado_evento) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, evento.getEventId());
            pstmt.setInt(2, evento.getUserId());
            pstmt.setString(3, evento.getNombreEvento());
            pstmt.setString(4, evento.getFechaEvento());
            pstmt.setString(5, evento.getHoraEvento());
            pstmt.setInt(6, evento.getLugarEventoId());
            pstmt.setString(7, evento.getEntrada());
            pstmt.setString(8, evento.getDescripcionEvento());
            pstmt.setString(9, evento.getArtistasProveedores());
            pstmt.setString(10, evento.getRazonEvento());
            pstmt.setString(11, evento.getFechaCreacion());
            pstmt.setString(12, evento.getEstadoEvento());
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
            pstmt.setString(2, evento.getFechaEvento());
            pstmt.setString(3, evento.getHoraEvento());
            pstmt.setInt(4, evento.getLugarEventoId());
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
            pstmt.setString(2, evento.getFechaEvento());
            pstmt.setString(3, evento.getHoraEvento());
            pstmt.setInt(4, evento.getLugarEventoId());
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
                evento.setUserId(rs.getInt("user_id"));
                evento.setNombreEvento(rs.getString("nombre_evento"));
                evento.setFechaEvento(rs.getString("fecha_evento"));
                evento.setHoraEvento(rs.getString("hora_evento"));
                evento.setLugarEventoId(rs.getInt("lugar_evento_id"));
                evento.setEntrada(rs.getString("entrada"));
                evento.setDescripcionEvento(rs.getString("descripcion_evento"));
                evento.setArtistasProveedores(rs.getString("artistas_proveedores"));
                evento.setRazonEvento(rs.getString("razon_evento"));
                evento.setFechaCreacion(rs.getString("fecha_creacion"));
                evento.setEstadoEvento(rs.getString("estado_evento"));
                eventos.add(evento);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return eventos;
    }
}
