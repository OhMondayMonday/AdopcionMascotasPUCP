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

    //Metodo para actualizar un Evento sin verificacion
    public void actualizarEventoYLugar(Eventos evento) {
        try (Connection connection = this.getConnection()) {
            // Iniciar transacción
            connection.setAutoCommit(false);

            // Actualizar lugar del evento
            String updateLugarSQL = "UPDATE lugares_eventos SET direccion_lugar = ?, aforo_maximo = ?, distrito_id = ? WHERE lugar_id = ?";
            try (PreparedStatement psLugar = connection.prepareStatement(updateLugarSQL)) {
                psLugar.setString(1, evento.getLugarEvento().getDireccionLugar());
                psLugar.setInt(2, evento.getLugarEvento().getAforoMaximo());
                psLugar.setInt(3, evento.getLugarEvento().getDistrito().getDistritoId());
                psLugar.setInt(4, evento.getLugarEvento().getLugarId());
                psLugar.executeUpdate();
            }

            // Actualizar evento
            String updateEventoSQL = "UPDATE eventos SET nombre_evento = ?, fecha_evento = ?, tipo_evento_id = ?, descripcion_evento = ?, entrada = ?, artistas_proveedores = ?, razon_evento = ? WHERE event_id = ?";
            try (PreparedStatement psEvento = connection.prepareStatement(updateEventoSQL)) {
                psEvento.setString(1, evento.getNombreEvento());
                psEvento.setDate(2, evento.getFechaEvento());
                psEvento.setInt(3, evento.getTipoEvento().getTipoEventoId());
                psEvento.setString(4, evento.getDescripcionEvento());
                psEvento.setString(5, evento.getEntrada());
                psEvento.setString(6, evento.getArtistasProveedores());
                psEvento.setString(7, evento.getRazonEvento());
                psEvento.setInt(8, evento.getEventId());
                psEvento.executeUpdate();
            }

            // Confirmar transacción
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
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

    // Metodo para crear un Evento (crearEvento)
    public boolean crearEvento(Eventos evento, int lugarId) {
        String sql = "INSERT INTO eventos (nombre_evento, fecha_evento, lugar_evento_id, tipo_evento_id, descripcion_evento, entrada, artistas_proveedores, razon_evento, user_id, hora_evento, hora_fin, fecha_fin, foto_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, '10:00:00', '12:00:00', '2024-12-20', 1)";

        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, evento.getNombreEvento());
            ps.setDate(2, new java.sql.Date(evento.getFechaEvento().getTime()));
            ps.setInt(3, lugarId); // FK lugar_evento_id
            ps.setInt(4, evento.getTipoEvento().getTipoEventoId());
            ps.setString(5, evento.getDescripcionEvento());
            ps.setString(6, evento.getEntrada());
            ps.setString(7, evento.getArtistasProveedores());
            ps.setString(8, evento.getRazonEvento());
            ps.setInt(9, evento.getUsuario().getUserId());

            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }



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
                evento.setHoraEvento(rs.getTime("hora_evento"));
                evento.setFechaFin(rs.getDate("fecha_fin"));
                evento.setHoraFin(rs.getTime("hora_fin"));
                evento.setEntrada(rs.getString("entrada"));
                evento.setDescripcionEvento(rs.getString("descripcion_evento"));
                evento.setEstadoEvento(rs.getString("estado_evento"));
                evento.setArtistasProveedores("artistas_proveedores");

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

    // Metodo para mostrar la lista de TODOS los Eventos INSCRITOS que tiene un usuario específico usando la tabla de inscripciones_eventos y eventos, incluye lógica de filtros
    public List<Eventos> verMisEventosInscritosUsuario(int userId, Integer tipo_evento_id, Integer distritoId, Date fechaInicio, Date fechaFin, int page, int recordsPerPage){

        List<Eventos> eventosInscritos = new ArrayList<>();

        StringBuilder query = new StringBuilder("SELECT e.event_id, e.nombre_evento, e.fecha_evento, e.fecha_fin, e.descripcion_evento, ");
        query.append("te.tipo_id AS tipo_evento_id, te.nombre_tipo, f.foto_id, f.url_foto, d.distrito_id, d.nombre_distrito ");
        query.append("FROM inscripciones_eventos ie ");
        query.append("JOIN eventos e ON ie.event_id = e.event_id ");
        query.append("JOIN lugares_eventos le ON e.lugar_evento_id = le.lugar_id ");
        query.append("JOIN distritos d ON le.distrito_id = d.distrito_id ");
        query.append("JOIN tipos_eventos te ON e.tipo_evento_id = te.tipo_id ");
        query.append("LEFT JOIN fotos f ON e.foto_id = f.foto_id ");
        query.append("WHERE ie.activa = 1 AND ie.user_id = ? ");

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

    //Metodo para una lista de todos los Eventos ACTIVOS sin importar usuario
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

    // Metodo para obtener la cantidad de Eventos CREADOS ACTIVOS que tiene un Albergue
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

    // Metodo para obtener la cantidad de Eventos INSCRITOS ACTIVOS que tiene un Usuario Final
    public int contarEventosInscritosUsuario(int userId) {
        String query = "SELECT COUNT(*) FROM inscripciones_eventos WHERE activa = 1 AND user_id = ?";

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

    // Metodo para contar TODOS los eventos ACTIVOS para los filtros, sin importar usuario
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

    //Metodo para una lista de todos los Eventos ACTIVOS creados de un Albergue
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

    //Metodo para una lista de todos los Eventos ACTIVOS INSCRITOS de un usuario final usando tabla inscripciones_eventos
    public List<Eventos> obtenerMisEventosInscritosUsuarioConPaginacion(Integer userId, int page, int recordsPerPage) {

        List<Eventos> eventosInscritos = new ArrayList<>();
        int offset = (page - 1) * recordsPerPage;

        String query = "SELECT e.event_id, e.nombre_evento, e.fecha_evento, e.fecha_fin, e.descripcion_evento, " +
                "te.tipo_id AS tipo_evento_id, te.nombre_tipo, f.foto_id, f.url_foto, d.distrito_id, d.nombre_distrito " +
                "FROM inscripciones_eventos ie " +
                "JOIN eventos e ON ie.event_id = e.event_id " +
                "JOIN lugares_eventos le ON e.lugar_evento_id = le.lugar_id " +
                "JOIN distritos d ON le.distrito_id = d.distrito_id " +
                "JOIN tipos_eventos te ON e.tipo_evento_id = te.tipo_id " +
                "LEFT JOIN fotos f ON e.foto_id = f.foto_id " +
                "WHERE ie.activa = 1 AND ie.user_id = ? " +
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

    // Metodo para contar los eventos ACTIVOS de un ALBERGUE. Con Filtros
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

    // Metodo para contar los eventos inscritos de un usuario segun la tabla de inscripciones_eventos. Con lógica si se aplican filtros
    public int contarEventosInscritosConFiltrosUsuario(Integer userId, Integer tipoEventoId, Integer distritoId, Date fechaInicio, Date fechaFin) {

        StringBuilder query = new StringBuilder("SELECT COUNT(*) ");
        query.append("FROM inscripciones_eventos ie ");
        query.append("JOIN eventos e ON ie.event_id = e.event_id ");
        query.append("JOIN lugares_eventos le ON e.lugar_evento_id = le.lugar_id ");
        query.append("JOIN distritos d ON le.distrito_id = d.distrito_id ");
        query.append("JOIN tipos_eventos te ON e.tipo_evento_id = te.tipo_id ");
        query.append("WHERE ie.activa = 1 AND ie.user_id = ? ");

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
