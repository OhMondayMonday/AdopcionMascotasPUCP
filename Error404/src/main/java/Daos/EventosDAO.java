package Daos;

import Beans.*;

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

                // Crear y asignar el objeto Usuario
                Beans.Usuarios usuario = new Beans.Usuarios();
                usuario.setUserId(rs.getInt("user_id")); // Asegúrate de que "lugar_evento_id" es el nombre correcto de la columna
                evento.setUsuario(usuario);

                // Crear y asignar el objeto LugaresEventos
                Beans.LugaresEventos lugarEvento = new Beans.LugaresEventos();
                lugarEvento.setLugarId(rs.getInt("lugar_evento_id")); // Asegúrate de que "lugar_evento_id" es el nombre correcto de la columna
                evento.setLugarEvento(lugarEvento);

                // Crear y asignar el objeto TiposEventos
                Beans.TiposEventos tipoEvento = new Beans.TiposEventos();
                tipoEvento.setTipoEventoId(rs.getInt("tipo_evento_id"));
                evento.setTipoEvento(tipoEvento);

                evento.setNombreEvento(rs.getString("nombre_evento"));
                evento.setFechaEvento(rs.getDate("fecha_evento"));
                evento.setHoraEvento(rs.getTime("hora_evento"));
                evento.setFechaFin(rs.getDate("fecha_fin"));
                evento.setHoraFin(rs.getTime("hora_fin"));
                evento.setEntrada(rs.getString("entrada"));
                evento.setDescripcionEvento(rs.getString("descripcion_evento"));
                evento.setArtistasProveedores(rs.getString("artistas_proveedores"));
                evento.setRazonEvento(rs.getString("razon_evento"));
                evento.setFechaCreacion(rs.getDate("fecha_creacion"));
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

                Usuarios usuario = new Usuarios();
                usuario.setUserId(rs.getInt("user_id"));
                evento.setUsuario(usuario);

                TiposEventos tipoEvento = new TiposEventos();
                tipoEvento.setTipoEventoId(rs.getInt("tipo_evento_id"));
                evento.setTipoEvento(tipoEvento);

                LugaresEventos lugaresEventos = new LugaresEventos();
                lugaresEventos.setLugarId(rs.getInt("lugar_evento_id"));
                evento.setLugarEvento(lugaresEventos);


                evento.setNombreEvento(rs.getString("nombre_evento"));
                evento.setFechaEvento(rs.getDate("fecha_evento"));
                evento.setHoraEvento(rs.getTime("hora_evento"));
                evento.setEntrada(rs.getString("entrada"));
                evento.setDescripcionEvento(rs.getString("descripcion_evento"));
                evento.setArtistasProveedores(rs.getString("artistas_proveedores"));
                evento.setRazonEvento(rs.getString("razon_evento"));
                evento.setFechaCreacion(rs.getDate("fecha_creacion"));
                evento.setEstadoEvento(rs.getString("estado_evento"));
                evento.setFechaFin(rs.getDate("fecha_fin"));
                evento.setHoraFin(rs.getTime("hora_fin"));
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

    // Metodo para agregar Evento
    public void agregarEvento(Eventos evento) {
        String query = "INSERT INTO eventos (event_id, user_id, tipo_evento_id, nombre_evento, fecha_evento, hora_evento, lugar_evento_id, entrada, descripcion_evento, artistas_proveedores, razon_evento, fecha_creacion, estado_evento) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, evento.getEventId());
            pstmt.setInt(2, evento.getUsuario().getUserId());
                                    pstmt.setInt(3, evento.getTipoEvento().getTipoEventoId());
            pstmt.setString(4, evento.getNombreEvento());
            pstmt.setDate(5, evento.getFechaEvento());
            pstmt.setTime(6, evento.getHoraEvento());
            pstmt.setInt(7, evento.getLugarEvento().getLugarId());
            pstmt.setString(8, evento.getEntrada());
            pstmt.setString(9, evento.getDescripcionEvento());
            pstmt.setString(10, evento.getArtistasProveedores());
            pstmt.setString(11, evento.getRazonEvento());
            pstmt.setDate(12, evento.getFechaCreacion());
            pstmt.setString(13, evento.getEstadoEvento());
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    //Metodo para actualizar un Evento sin verificacion
    public void actualizarEvento(Eventos evento) {
        String query = "UPDATE eventos SET nombre_evento = ?, fecha_evento = ?, hora_evento = ?, lugar_evento_id = ?, tipo_evento_id = ?,entrada = ?, descripcion_evento = ?, artistas_proveedores = ?, razon_evento = ? WHERE event_id = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, evento.getNombreEvento());
            pstmt.setDate(2, evento.getFechaEvento());
            pstmt.setTime(3, evento.getHoraEvento());
            pstmt.setInt(4, evento.getLugarEvento().getLugarId());
            pstmt.setInt(5, evento.getTipoEvento().getTipoEventoId());
            pstmt.setString(6, evento.getEntrada());
            pstmt.setString(7, evento.getDescripcionEvento());
            pstmt.setString(8, evento.getArtistasProveedores());
            pstmt.setString(9, evento.getRazonEvento());
            pstmt.setInt(10, evento.getEventId());
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
        String query = "UPDATE eventos SET nombre_evento = ?, fecha_evento = ?, hora_evento = ?, lugar_evento_id = ?, lugar_evento_id = ?, entrada = ?, descripcion_evento = ?, artistas_proveedores = ?, razon_evento = ? WHERE event_id = ? and user_id = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, evento.getNombreEvento());
            pstmt.setDate(2, evento.getFechaEvento());
            pstmt.setTime(3, evento.getHoraEvento());
            pstmt.setInt(4, evento.getLugarEvento().getLugarId());
            pstmt.setInt(5, evento.getTipoEvento().getTipoEventoId());
            pstmt.setString(6, evento.getEntrada());
            pstmt.setString(7, evento.getDescripcionEvento());
            pstmt.setString(8, evento.getArtistasProveedores());
            pstmt.setString(9, evento.getRazonEvento());
            pstmt.setInt(10, evento.getEventId());
            pstmt.setInt(11, userID);
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

                Beans.TiposEventos tipoEvento = new Beans.TiposEventos();
                tipoEvento.setTipoEventoId(rs.getInt("tipo_evento_id"));
                evento.setTipoEvento(tipoEvento);

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
                evento.setFechaCreacion(rs.getDate("fecha_creacion"));
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

            TiposEventos tipoEvento = new TiposEventos();
            tipoEvento.setTipoEventoId(rs.getInt("tipo_evento_id"));
            evento.setTipoEvento(tipoEvento);

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
            evento.setFechaCreacion(rs.getDate("fecha_creacion"));
            evento.setEstadoEvento(rs.getString("estado_evento"));

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return evento;
    }

    // Metodo para mostrar Eventos inscritos del usuario con o sin filtros
    public List<Eventos> verMisEventos(int usuarioId, Integer tipo_evento_id, Integer distritoId, Date fecha_evento, Date fecha_fin){
        StringBuilder query = new StringBuilder(
                "SELECT e.* FROM eventos e " +
                        "JOIN lugares_eventos le ON e.lugar_evento_id = le.lugar_id " +
                        "JOIN distritos d ON le.distrito_id = d.distrito_id " +
                        "JOIN tipos_eventos te ON e.tipo_evento_id = te.tipo_id " +
                        "WHERE e.user_id = ?"
        );

        List<Object> parametros = new ArrayList<>();
        parametros.add(usuarioId);

        // Construcción dinámica de la consulta
        if (tipo_evento_id != null) {
            query.append(" AND te.tipo_id = ?");
            parametros.add(tipo_evento_id);
        }

        if (distritoId != null) {
            query.append(" AND d.distrito_id = ?");
            parametros.add(distritoId);
        }

        if (fecha_evento != null) {
            query.append(" AND e.fecha_evento >= ?");
            parametros.add(fecha_evento);
        }

        if (fecha_fin != null) {
            query.append(" AND e.fecha_fin <= ?");
            parametros.add(fecha_fin);
        }

        List<Eventos> eventos = new ArrayList<>();

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query.toString())) {

            // Asignar parámetros dinámicamente
            for (int i = 0; i < parametros.size(); i++) {
                pstmt.setObject(i + 1, parametros.get(i));
            }

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Eventos evento = new Eventos();
                evento.setEventId(rs.getInt("event_id"));
                evento.setNombreEvento(rs.getString("nombre_evento"));
                evento.setFechaEvento(rs.getDate("fecha_evento"));
                evento.setFechaFin(rs.getDate("fecha_fin"));

                Usuarios usuario = new Usuarios();
                usuario.setUserId(rs.getInt("user_id"));
                evento.setUsuario(usuario);

                TiposEventos tipoEvento = new TiposEventos();
                tipoEvento.setTipoEventoId(rs.getInt("tipo_evento_id"));
                evento.setTipoEvento(tipoEvento);

                LugaresEventos lugarEvento = new LugaresEventos();
                lugarEvento.setLugarId(rs.getInt("lugar_evento_id"));
                evento.setLugarEvento(lugarEvento);

                Fotos foto = new Fotos();
                foto.setFotoId(rs.getInt("foto_id"));
                evento.setFoto(foto);

                evento.setHoraEvento(rs.getTime("hora_evento"));
                evento.setHoraFin(rs.getTime("hora_fin"));
                evento.setEntrada(rs.getString("entrada"));
                evento.setDescripcionEvento(rs.getString("descripcion_evento"));
                evento.setArtistasProveedores(rs.getString("artistas_proveedores"));
                evento.setRazonEvento(rs.getString("razon_evento"));
                evento.setFechaCreacion(rs.getDate("fecha_creacion"));
                evento.setEstadoEvento(rs.getString("estado_evento"));

                eventos.add(evento);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return eventos;
    }

    public List<Eventos> verEventosActivos(Integer tipoEventoId, Integer distritoId, Date fechaInicio, Date fechaFin) {
        StringBuilder query = new StringBuilder(
                "SELECT e.* " +
                        "FROM eventos e " +
                        "JOIN lugares_eventos le ON e.lugar_evento_id = le.lugar_id " +
                        "JOIN distritos d ON le.distrito_id = d.distrito_id " +
                        "JOIN tipos_eventos te ON e.tipo_evento_id = te.id " +
                        "WHERE 1=1"
        );

        List<Object> parametros = new ArrayList<>();

        // Agregar condiciones dinámicamente según los filtros
        if (tipoEventoId != null) {
            query.append(" AND te.id = ?");
            parametros.add(tipoEventoId);
        }

        if (distritoId != null) {
            query.append(" AND d.distrito_id = ?");
            parametros.add(distritoId);
        }

        if (fechaInicio != null) {
            query.append(" AND e.fecha_evento >= ?");
            parametros.add(fechaInicio);
        }

        if (fechaFin != null) {
            query.append(" AND e.fecha_fin <= ?");
            parametros.add(fechaFin);
        }

        List<Eventos> eventos = new ArrayList<>();

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query.toString())) {

            // Asignar parámetros dinámicamente
            for (int i = 0; i < parametros.size(); i++) {
                pstmt.setObject(i + 1, parametros.get(i));
            }

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Eventos evento = new Eventos();
                evento.setEventId(rs.getInt("event_id"));
                evento.setNombreEvento(rs.getString("nombre_evento"));
                evento.setFechaEvento(rs.getDate("fecha_evento"));
                evento.setFechaFin(rs.getDate("fecha_fin"));

                TiposEventos tipoEvento = new TiposEventos();
                tipoEvento.setTipoEventoId(rs.getInt("tipo_evento_id"));
                evento.setTipoEvento(tipoEvento);

                LugaresEventos lugarEvento = new LugaresEventos();
                lugarEvento.setLugarId(rs.getInt("lugar_evento_id"));
                evento.setLugarEvento(lugarEvento);

                Fotos foto = new Fotos();
                foto.setFotoId(rs.getInt("foto_id"));
                evento.setFoto(foto);

                evento.setHoraEvento(rs.getTime("hora_evento"));
                evento.setHoraFin(rs.getTime("hora_fin"));
                evento.setEntrada(rs.getString("entrada"));
                evento.setDescripcionEvento(rs.getString("descripcion_evento"));
                evento.setArtistasProveedores(rs.getString("artistas_proveedores"));
                evento.setRazonEvento(rs.getString("razon_evento"));
                evento.setFechaCreacion(rs.getDate("fecha_creacion"));
                evento.setEstadoEvento(rs.getString("estado_evento"));

                eventos.add(evento);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return eventos;
    }


}
