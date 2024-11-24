package Daos;

import Beans.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EventosDAO extends BaseDao {

    //Metodo para obtener una lista de TODOS los Eventos existentes
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
                usuario.setUserId(rs.getInt("user_id"));
                evento.setUsuario(usuario);

                // Crear y asignar el objeto TiposEventos
                Beans.TiposEventos tipoEvento = new Beans.TiposEventos();
                tipoEvento.setTipoEventoId(rs.getInt("tipo_evento_id"));
                evento.setTipoEvento(tipoEvento);

                evento.setNombreEvento(rs.getString("nombre_evento"));
                evento.setFechaEvento(rs.getDate("fecha_evento"));
                evento.setHoraEvento(rs.getTime("hora_evento"));
                evento.setFechaFin(rs.getDate("fecha_fin"));
                evento.setHoraFin(rs.getTime("hora_fin"));

                Fotos foto = new Fotos();
                foto.setFotoId(rs.getInt("foto_id"));
                evento.setFoto(foto);

                // Crear y asignar el objeto LugaresEventos
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

    //Metodo para una lista de todos los Eventos ACTIVOS
    public List<Eventos> obtenerEventosActivos() {
        List<Eventos> eventos = new ArrayList<>();
        String query = "SELECT e.*, te.nombre_tipo, f.foto_id, f.url_foto FROM eventos e JOIN lugares_eventos le ON e.lugar_evento_id = le.lugar_id JOIN distritos d ON le.distrito_id = d.distrito_id JOIN tipos_eventos te ON e.tipo_evento_id = te.tipo_id LEFT JOIN fotos f ON e.foto_id = f.foto_id WHERE e.estado_evento = 'activa'";

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
                tipoEvento.setNombreTipo(rs.getString("nombre_tipo"));
                evento.setTipoEvento(tipoEvento);

                evento.setNombreEvento(rs.getString("nombre_evento"));
                evento.setFechaEvento(rs.getDate("fecha_evento"));
                evento.setHoraEvento(rs.getTime("hora_evento"));
                evento.setFechaFin(rs.getDate("fecha_fin"));
                evento.setHoraFin(rs.getTime("hora_fin"));

                Fotos foto = new Fotos();
                foto.setFotoId(rs.getInt("foto_id"));
                foto.setUrlFoto(rs.getString("url_foto"));
                evento.setFoto(foto);

                LugaresEventos lugaresEventos = new LugaresEventos();
                lugaresEventos.setLugarId(rs.getInt("lugar_evento_id"));
                evento.setLugarEvento(lugaresEventos);

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

    // Metodo para verificar si el usuario está está inscrito en un evento específico
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

    //

    // Metodo para obtener todos los detalles de un evento específico
    public Eventos obtenerDetalleEvento(int eventId) {
        String query = "SELECT e.*, " +
                "te.tipo_id AS tipoEventoId, te.nombre_tipo AS nombreTipo, " +
                "le.lugar_id AS lugarId, le.direccion_lugar AS direccionLugar, le.aforo_maximo AS aforoMaximo, " +
                "d.nombre_distrito AS nombreDistrito, " +
                "f.foto_id AS fotoId, f.url_foto AS urlFoto " +
                "FROM eventos e " +
                "JOIN tipos_eventos te ON e.tipo_evento_id = te.tipo_id " +
                "JOIN lugares_eventos le ON e.lugar_evento_id = le.lugar_id " +
                "JOIN distritos d ON le.distrito_id = d.distrito_id " +
                "LEFT JOIN fotos f ON e.foto_id = f.foto_id " +
                "WHERE e.event_id = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, eventId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                Eventos evento = new Eventos();
                evento.setEventId(rs.getInt("event_id"));
                evento.setNombreEvento(rs.getString("nombre_evento"));
                evento.setFechaEvento(rs.getDate("fecha_evento"));
                evento.setFechaFin(rs.getDate("fecha_fin"));
                evento.setDescripcionEvento(rs.getString("descripcion_evento"));
                evento.setEstadoEvento(rs.getString("estado_evento"));

                // Asignar tipo de evento
                TiposEventos tipoEvento = new TiposEventos();
                tipoEvento.setTipoEventoId(rs.getInt("tipoEventoId"));
                tipoEvento.setNombreTipo(rs.getString("nombreTipo"));
                evento.setTipoEvento(tipoEvento);

                // Asignar lugar del evento
                LugaresEventos lugarEvento = new LugaresEventos();
                lugarEvento.setLugarId(rs.getInt("lugarId"));
                lugarEvento.setDireccionLugar(rs.getString("direccionLugar"));
                lugarEvento.setAforoMaximo(rs.getInt("aforoMaximo"));

                // Asignar distrito
                Distritos distrito = new Distritos();
                distrito.setNombreDistrito(rs.getString("nombreDistrito"));
                lugarEvento.setDistrito(distrito);
                evento.setLugarEvento(lugarEvento);

                // Asignar foto
                Fotos foto = new Fotos();
                foto.setFotoId(rs.getInt("fotoId"));
                foto.setUrlFoto(rs.getString("urlFoto"));
                evento.setFoto(foto);

                return evento;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }


    // Metodo para mostrar la lista de TODOS los Eventos ACTIVOS que tiene un usuario específico, incluye lógica de filtros
    public List<Eventos> verMisEventosActivos(int userId, Integer tipo_evento_id, Integer distritoId, Date fechaInicio, Date fechaFin, int page, int recordsPerPage){
        List<Eventos> eventosInscritos = new ArrayList<>();
        StringBuilder query = new StringBuilder("SELECT e.event_id, e.nombre_evento, e.fecha_evento, e.fecha_fin, e.descripcion_evento, ");
        query.append("te.tipo_id AS tipo_evento_id, te.nombre_tipo, f.foto_id, f.url_foto, d.distrito_id, d.nombre_distrito ");
        query.append("FROM eventos e ");
        query.append("JOIN lugares_eventos le ON e.lugar_evento_id = le.lugar_id ");
        query.append("JOIN distritos d ON le.distrito_id = d.distrito_id ");
        query.append("JOIN tipos_eventos te ON e.tipo_evento_id = te.tipo_id ");
        query.append("LEFT JOIN fotos f ON e.foto_id = f.foto_id ");
        query.append("WHERE e.estado_evento = 'activa' ");
        query.append("AND user_id = ? ");

        List<Object> parametros = new ArrayList<>();
        parametros.add(userId);

        // Construcción dinámica de la consulta
        if (tipo_evento_id != null) {
            query.append(" AND te.tipo_id = ?");
            parametros.add(tipo_evento_id);
        }

        if (distritoId != null) {
            query.append(" AND d.distrito_id = ?");
            parametros.add(distritoId);
        }

        if (fechaInicio != null && fechaFin != null) {
            query.append(" AND eventos.fecha_evento BETWEEN ? AND ?");
            parametros.add(fechaInicio);
            parametros.add(fechaFin);
        }

        query.append(" ORDER BY e.fecha_creacion DESC LIMIT ? OFFSET ?");
        parametros.add(recordsPerPage);
        parametros.add((page - 1) * recordsPerPage);

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query.toString())) {

            // Asignar parámetros dinámicamente
            for (int i = 0; i < parametros.size(); i++) {
                pstmt.setObject(i + 1, parametros.get(i));
            }

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Eventos eventoInscrito = new Eventos();
                eventoInscrito.setEventId(rs.getInt("event_id"));
                eventoInscrito.setNombreEvento(rs.getString("nombre_evento"));
                eventoInscrito.setFechaEvento(rs.getDate("fecha_evento"));
                eventoInscrito.setFechaFin(rs.getDate("fecha_fin"));
                eventoInscrito.setDescripcionEvento(rs.getString("descripcion_evento"));

                TiposEventos tipoEvento = new TiposEventos();
                tipoEvento.setTipoEventoId(rs.getInt("tipo_evento_id"));
                tipoEvento.setNombreTipo(rs.getString("nombre_tipo"));
                eventoInscrito.setTipoEvento(tipoEvento);

                Fotos foto = new Fotos();
                foto.setFotoId(rs.getInt("foto_id"));
                foto.setUrlFoto(rs.getString("url_foto"));
                eventoInscrito.setFoto(foto);

                eventosInscritos.add(eventoInscrito);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return eventosInscritos;
    }

    // Metodo para obtener la lista de TODOS los eventos ACTIVOS (de cualquier usuario) que existan. Incluye lógica de filtros
    public List<Eventos> verEventosActivos(Integer tipoEventoId, Integer distritoId, Date fechaInicio, Date fechaFin, int page, int recordsPerPage) {
        List<Eventos> eventos = new ArrayList<>();
        StringBuilder query = new StringBuilder("SELECT e.event_id, e.nombre_evento, e.fecha_evento, e.fecha_fin, e.descripcion_evento, ");
        query.append("te.tipo_id AS tipo_evento_id, te.nombre_tipo, f.foto_id, f.url_foto, d.distrito_id, d.nombre_distrito ");
        query.append("FROM eventos e ");
        query.append("JOIN lugares_eventos le ON e.lugar_evento_id = le.lugar_id ");
        query.append("JOIN distritos d ON le.distrito_id = d.distrito_id ");
        query.append("JOIN tipos_eventos te ON e.tipo_evento_id = te.tipo_id ");
        query.append("LEFT JOIN fotos f ON e.foto_id = f.foto_id ");
        query.append("WHERE e.estado_evento = 'activa' ");

        List<Object> parametros = new ArrayList<>();

        // Filtro por tipo de evento
        if (tipoEventoId != null) {
            query.append(" AND te.tipo_id = ?");
            parametros.add(tipoEventoId);
        }

        // Filtro por distrito
        if (distritoId != null) {
            query.append(" AND d.distrito_id = ?");
            parametros.add(distritoId);
        }

        // Filtro por rango de fechas
        if (fechaInicio != null && fechaFin != null) {
            query.append(" AND e.fecha_evento BETWEEN ? AND ?");
            parametros.add(fechaInicio);
            parametros.add(fechaFin);
        }

        query.append(" ORDER BY e.fecha_creacion DESC LIMIT ? OFFSET ?");
        parametros.add(recordsPerPage);
        parametros.add((page - 1) * recordsPerPage);

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query.toString())) {

            // Asignar parámetros dinámicamente
            for (int i = 0; i < parametros.size(); i++) {
                pstmt.setObject(i + 1, parametros.get(i));
            }

            ResultSet rs = pstmt.executeQuery();

            // System.out.println("Query generada: " + query.toString());
            // System.out.println("Parámetros: " + parametros);
            // System.out.println("Parámetros utilizados en la query: " + parametros);

            while (rs.next()) {
                Eventos evento = new Eventos();
                evento.setEventId(rs.getInt("event_id"));
                evento.setNombreEvento(rs.getString("nombre_evento"));
                evento.setFechaEvento(rs.getDate("fecha_evento"));
                evento.setFechaFin(rs.getDate("fecha_fin"));
                evento.setDescripcionEvento(rs.getString("descripcion_evento"));

                TiposEventos tipoEvento = new TiposEventos();
                tipoEvento.setTipoEventoId(rs.getInt("tipo_evento_id"));
                tipoEvento.setNombreTipo(rs.getString("nombre_tipo"));
                evento.setTipoEvento(tipoEvento);

                Fotos foto = new Fotos();
                foto.setFotoId(rs.getInt("foto_id"));
                foto.setUrlFoto(rs.getString("url_foto"));
                evento.setFoto(foto);

                eventos.add(evento);

                // System.out.println("Evento encontrado: " + rs.getString("nombre_evento"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return eventos;
    }

    //Metodo para una lista de todos los Eventos ACTIVOS
    public List<Eventos> obtenerEventosActivosConPaginacion(int page, int recordsPerPage) {
        List<Eventos> eventos = new ArrayList<>();
        int offset = (page - 1) * recordsPerPage;

        String query = "SELECT e.event_id, e.nombre_evento, e.fecha_evento, e.fecha_fin, e.descripcion_evento, " +
                "te.tipo_id AS tipo_evento_id, te.nombre_tipo, f.foto_id, f.url_foto, d.distrito_id, d.nombre_distrito " +
                "FROM eventos e " +
                "JOIN lugares_eventos le ON e.lugar_evento_id = le.lugar_id " +
                "JOIN distritos d ON le.distrito_id = d.distrito_id " +
                "JOIN tipos_eventos te ON e.tipo_evento_id = te.tipo_id " +
                "LEFT JOIN fotos f ON e.foto_id = f.foto_id " +
                "WHERE e.estado_evento = 'activa' " +
                "ORDER BY e.fecha_creacion DESC LIMIT ? OFFSET ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, recordsPerPage);
            pstmt.setInt(2, offset);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Eventos evento = new Eventos();
                    evento.setEventId(rs.getInt("event_id"));
                    evento.setNombreEvento(rs.getString("nombre_evento"));
                    evento.setFechaEvento(rs.getDate("fecha_evento"));
                    evento.setFechaFin(rs.getDate("fecha_fin"));
                    evento.setDescripcionEvento(rs.getString("descripcion_evento"));

                    TiposEventos tipoEvento = new TiposEventos();
                    tipoEvento.setTipoEventoId(rs.getInt("tipo_evento_id"));
                    tipoEvento.setNombreTipo(rs.getString("nombre_tipo"));
                    evento.setTipoEvento(tipoEvento);

                    Fotos foto = new Fotos();
                    foto.setFotoId(rs.getInt("foto_id"));
                    foto.setUrlFoto(rs.getString("url_foto"));
                    evento.setFoto(foto);

                    eventos.add(evento);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return eventos;
    }

    // Metodo para obtener la cantidad TOTAL de Eventos ACTIVOS de toda la base de datos
    public int contarEventosActivos() {
        String query = "SELECT COUNT(*) FROM eventos WHERE estado_evento = 'activa'";
        int totalRecords = 0;

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                totalRecords = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalRecords;
    }

    // Metodo para obtener la cantidad de Eventos ACTIVOS que tiene un Usuario
    public int contarMisEventosActivos(int userId) {
        String query = "SELECT COUNT(*) FROM eventos WHERE estado_evento = 'activa' AND  user_id = ?";

        int totalRecords = 0;


        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)){
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                totalRecords = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalRecords;
    }

    // Metodo para contar TODOS los eventos ACTIVOS para los filtros
    public int contarEventosActivosConFiltros(Integer tipoEventoId, Integer distritoId, Date fechaInicio, Date fechaFin) {
        StringBuilder query = new StringBuilder("SELECT COUNT(*) FROM eventos e ");
        query.append("JOIN lugares_eventos le ON e.lugar_evento_id = le.lugar_id ");
        query.append("JOIN distritos d ON le.distrito_id = d.distrito_id ");
        query.append("JOIN tipos_eventos te ON e.tipo_evento_id = te.tipo_id ");
        query.append("WHERE e.estado_evento = 'activa' ");

        List<Object> parametros = new ArrayList<>();

        if (tipoEventoId != null) {
            query.append(" AND te.tipo_id = ?");
            parametros.add(tipoEventoId);
        }
        if (distritoId != null) {
            query.append(" AND d.distrito_id = ?");
            parametros.add(distritoId);
        }
        if (fechaInicio != null && fechaFin != null) {
            query.append(" AND e.fecha_evento BETWEEN ? AND ?");
            parametros.add(fechaInicio);
            parametros.add(fechaFin);
        }

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query.toString())) {

            for (int i = 0; i < parametros.size(); i++) {
                pstmt.setObject(i + 1, parametros.get(i));
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    //Metodo para una lista de todos los Eventos ACTIVOS de un Usuario
    public List<Eventos> obtenerMisEventosActivosConPaginacion(Integer userId, int page, int recordsPerPage) {
        List<Eventos> eventosInscritos = new ArrayList<>();
        int offset = (page - 1) * recordsPerPage;

        String query = "SELECT e.event_id, e.nombre_evento, e.fecha_evento, e.fecha_fin, e.descripcion_evento, " +
                "te.tipo_id AS tipo_evento_id, te.nombre_tipo, f.foto_id, f.url_foto, d.distrito_id, d.nombre_distrito " +
                "FROM eventos e " +
                "JOIN lugares_eventos le ON e.lugar_evento_id = le.lugar_id " +
                "JOIN distritos d ON le.distrito_id = d.distrito_id " +
                "JOIN tipos_eventos te ON e.tipo_evento_id = te.tipo_id " +
                "LEFT JOIN fotos f ON e.foto_id = f.foto_id " +
                "WHERE e.estado_evento = 'activa' " +
                "AND  user_id = ? " +
                "ORDER BY e.fecha_creacion DESC LIMIT ? OFFSET ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, userId);
            pstmt.setInt(2, recordsPerPage);
            pstmt.setInt(3, offset);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Eventos eventoInscrito = new Eventos();
                    eventoInscrito.setEventId(rs.getInt("event_id"));
                    eventoInscrito.setNombreEvento(rs.getString("nombre_evento"));
                    eventoInscrito.setFechaEvento(rs.getDate("fecha_evento"));
                    eventoInscrito.setFechaFin(rs.getDate("fecha_fin"));
                    eventoInscrito.setDescripcionEvento(rs.getString("descripcion_evento"));

                    TiposEventos tipoEvento = new TiposEventos();
                    tipoEvento.setTipoEventoId(rs.getInt("tipo_evento_id"));
                    tipoEvento.setNombreTipo(rs.getString("nombre_tipo"));
                    eventoInscrito.setTipoEvento(tipoEvento);

                    Fotos foto = new Fotos();
                    foto.setFotoId(rs.getInt("foto_id"));
                    foto.setUrlFoto(rs.getString("url_foto"));
                    eventoInscrito.setFoto(foto);

                    eventosInscritos.add(eventoInscrito);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return eventosInscritos;
    }

    // Metodo para contar los eventos ACTIVOS INSCRITOS (que le pertenecen) de un usuario. Con Filtros
    public int contarMisEventosActivosConFiltros(Integer userId, Integer tipoEventoId, Integer distritoId, Date fechaInicio, Date fechaFin) {
        StringBuilder query = new StringBuilder("SELECT COUNT(*) FROM eventos e ");
        query.append("JOIN lugares_eventos le ON e.lugar_evento_id = le.lugar_id ");
        query.append("JOIN distritos d ON le.distrito_id = d.distrito_id ");
        query.append("JOIN tipos_eventos te ON e.tipo_evento_id = te.tipo_id ");
        query.append("WHERE e.estado_evento = 'activa' ");
        query.append("AND user_id = ? ");

        List<Object> parametros = new ArrayList<>();

        parametros.add(userId);

        if (tipoEventoId != null) {
            query.append(" AND te.tipo_id = ?");
            parametros.add(tipoEventoId);
        }
        if (distritoId != null) {
            query.append(" AND d.distrito_id = ?");
            parametros.add(distritoId);
        }
        if (fechaInicio != null && fechaFin != null) {
            query.append(" AND e.fecha_evento BETWEEN ? AND ?");
            parametros.add(fechaInicio);
            parametros.add(fechaFin);
        }

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query.toString())) {

            for (int i = 0; i < parametros.size(); i++) {
                pstmt.setObject(i + 1, parametros.get(i));
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

}
