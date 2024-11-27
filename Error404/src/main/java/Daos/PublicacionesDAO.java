package Daos;

import Beans.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PublicacionesDAO extends BaseDao {


    private Publicaciones fetchPublicacionDatos(ResultSet rs) throws SQLException {
        Publicaciones publicacion = new Publicaciones();
        publicacion.setPublicacionId(rs.getInt(1));

        Usuarios usuario = new Usuarios();
        usuario.setUserId(rs.getInt("u.user_id"));
        usuario.setUsername(rs.getString("u.username"));
        usuario.setNombre(rs.getString("u.nombre"));
        usuario.setApellido(rs.getString("u.apellido"));
        publicacion.setUsuario(usuario);

        publicacion.setTitulo(rs.getString(3));
        publicacion.setDescripcion(rs.getString(4));

        Fotos foto = new Fotos();
        foto.setFotoId(rs.getInt("f.foto_id"));
        foto.setUrlFoto(rs.getString("f.url_foto"));
        publicacion.setFoto(foto);

        publicacion.setComentario(rs.getString(6));
        publicacion.setFechaCreacion(rs.getTimestamp(7));

        TiposPublicaciones tipoPublicacion = new TiposPublicaciones();
        if((rs.getInt("tp.tipo_publicacion_id")) != 0){
            tipoPublicacion.setTipoPublicacionId(rs.getInt("tp.tipo_publicacion_id"));
            tipoPublicacion.setTipoPublicacion(rs.getString("tp.tipo_publicacion"));
            publicacion.setTipoPublicacion(tipoPublicacion);
        }
        publicacion.setEstadoPublicacion(rs.getString(9));

        return publicacion;
    }

    // Metodo para obtener detalles de una publicación por su ID
    public Publicaciones obtenerDetallesPublicacion(int publicacionId) {
        String query = "SELECT * FROM publicaciones p\n" +
                "INNER JOIN usuarios u ON p.user_id = u.user_id\n" +
                "INNER JOIN fotos f ON f.foto_id = p.foto_id\n" +
                "INNER JOIN tipos_publicaciones tp ON p.tipo_publicacion_id = tp.tipo_publicacion_id\n" +
                "WHERE p.publicacion_id = ?";
        Publicaciones publicacion = new Publicaciones();
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, publicacionId);

            try (ResultSet rs = pstmt.executeQuery()){
                if (rs.next()) {
                    publicacion = fetchPublicacionDatos(rs);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publicacion;
    }

    public int contarPublicacionesActivas() {
        String query = "SELECT COUNT(*) FROM publicaciones WHERE estado_publicacion = 'activa'";
        int totalrecords = 0;
        try (Connection conn = this.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query)) {
            if(rs.next()){
                totalrecords = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalrecords;
    }

    public int contarPublicacionesActivasConFiltros(Integer tipoPublicacionId, Date fechaInicio, Date fechaFin) {
        StringBuilder query = new StringBuilder("SELECT COUNT(*) FROM publicaciones p ");
        query.append("JOIN tipos_publicaciones tp ON p.tipo_publicacion_id = tp.tipo_publicacion_id ");
        query.append("WHERE p.estado_publicacion = 'activa' ");

        List<Object> parametros = new ArrayList<>();

        if(tipoPublicacionId != null){
            query.append(" AND tp.tipo_publicacion_id = ?");
            parametros.add(tipoPublicacionId);
        }
        if(fechaInicio != null && fechaFin != null){
            query.append(" AND p.fecha_creacion BETWEEN ? AND ? ");
            parametros.add(fechaInicio);
            parametros.add(fechaFin);
        }

        try (Connection conn = this.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(query.toString())){

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

    public List<Publicaciones> obtenerPublicacionesActivasConPaginacion(int page, int recordsPerPage) {
        List<Publicaciones> publicaciones = new ArrayList<>();
        int offset = (page - 1) * recordsPerPage;

        String query = "SELECT p.publicacion_id, p.titulo, p.descripcion, p.comentario, p.fecha_creacion, " +
                "tp.tipo_publicacion_id, tp.tipo_publicacion, f.foto_id, f.url_foto " +
                "FROM publicaciones p " +
                "JOIN tipos_publicaciones tp ON p.tipo_publicacion_id = tp.tipo_publicacion_id " +
                "LEFT JOIN fotos f ON p.foto_id = f.foto_id " +
                " WHERE p.estado_publicacion= 'activa' " +
                "ORDER BY p.fecha_creacion DESC LIMIT ? OFFSET ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, recordsPerPage);
            pstmt.setInt(2, offset);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Publicaciones publicacion = new Publicaciones();
                    publicacion.setPublicacionId(rs.getInt("publicacion_id"));
                    publicacion.setTitulo(rs.getString("titulo"));
                    publicacion.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
                    publicacion.setDescripcion(rs.getString("descripcion"));
                    publicacion.setComentario(rs.getString("comentario"));

                    TiposPublicaciones tipoPublicacion = new TiposPublicaciones();
                    tipoPublicacion.setTipoPublicacionId(rs.getInt("tipo_publicacion_id"));
                    tipoPublicacion.setTipoPublicacion(rs.getString("tipo_publicacion"));
                    publicacion.setTipoPublicacion(tipoPublicacion);

                    Fotos foto = new Fotos();
                    foto.setFotoId(rs.getInt("foto_id"));
                    foto.setUrlFoto(rs.getString("url_foto"));
                    publicacion.setFoto(foto);

                    publicaciones.add(publicacion);
                }
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return publicaciones;
    }

    public List<Publicaciones> verPublicacionesActivos(Integer tipoPublicacionId, Date fechaInicio, Date fechaFin, int page, int recordsPerPage) {
        List<Publicaciones> publicaciones = new ArrayList<>();
        StringBuilder query = new StringBuilder("SELECT p.publicacion_id, p.titulo, p.descripcion, p.comentario, p.fecha_creacion, ");
        query.append("tp.tipo_publicacion_id, tp.tipo_publicacion, f.foto_id, f.url_foto ");
        query.append("FROM publicaciones p ");
        query.append("JOIN tipos_publicaciones tp ON p.tipo_publicacion_id = tp.tipo_publicacion_id ");
        query.append("LEFT JOIN fotos f ON p.foto_id = f.foto_id ");
        query.append(" WHERE p.estado_publicacion= 'activa'");

        List<Object> parametros = new ArrayList<>();

        if(tipoPublicacionId != null){
            query.append("AND tp.tipo_publicacion_id = ?");
            parametros.add(tipoPublicacionId);
        }
        if(fechaInicio != null && fechaFin != null){
            query.append(" AND p.fecha_creacion BETWEEN ? AND ? ");
            parametros.add(fechaInicio);
            parametros.add(fechaFin);
        }

        query.append(" ORDER BY p.fecha_creacion DESC LIMIT ? OFFSET ?");
        parametros.add(recordsPerPage);
        parametros.add((page - 1) * recordsPerPage);

        try (Connection conn = this.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(query.toString())) {

            for (int i = 0; i < parametros.size(); i++) {
                pstmt.setObject(i + 1, parametros.get(i));
            }

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Publicaciones publicacion = new Publicaciones();
                publicacion.setPublicacionId(rs.getInt("publicacion_id"));
                publicacion.setTitulo(rs.getString("titulo"));
                publicacion.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
                publicacion.setDescripcion(rs.getString("descripcion"));
                publicacion.setComentario(rs.getString("comentario"));

                TiposPublicaciones tipoPublicacion = new TiposPublicaciones();
                tipoPublicacion.setTipoPublicacionId(rs.getInt("tipo_publicacion_id"));
                tipoPublicacion.setTipoPublicacion(rs.getString("tipo_publicacion"));
                publicacion.setTipoPublicacion(tipoPublicacion);

                Fotos foto = new Fotos();
                foto.setFotoId(rs.getInt("foto_id"));
                foto.setUrlFoto(rs.getString("url_foto"));
                publicacion.setFoto(foto);

                publicaciones.add(publicacion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publicaciones;
    }




    // Metodo para agregar una nueva publicación
    public void agregarPublicacion(Publicaciones publicacion) {
        String query = "INSERT INTO publicaciones (user_id, titulo, descripcion, foto_id, tipo_publicacion_id) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, publicacion.getUsuario().getUserId());
            pstmt.setString(2, publicacion.getTitulo());
            pstmt.setString(3, publicacion.getDescripcion());
            pstmt.setInt(4, publicacion.getFoto().getFotoId());
            pstmt.setInt(5, publicacion.getTipoPublicacion().getTipoPublicacionId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Metodo para actualizar una publicación sin verificacion
    public void actualizarPublicacion(Publicaciones publicacion) {
        String query = "UPDATE publicaciones SET titulo = ?, descripcion = ?, comentario = ?, tipo_publicacion_id = ?, estado_publicacion = ? WHERE publicacion_id = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, publicacion.getTitulo());
            pstmt.setString(2, publicacion.getDescripcion());
            pstmt.setString(3, publicacion.getComentario());
            pstmt.setInt(4, publicacion.getTipoPublicacion().getTipoPublicacionId());
            pstmt.setString(5, publicacion.getEstadoPublicacion());
            pstmt.setInt(6, publicacion.getPublicacionId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Metodo para eliminar una publicación sin verificacion
    public void eliminarPublicacion(int id) {
        String query = "UPDATE publicaciones SET estado_publicacion = ? WHERE publicacion_id = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, "eliminada");
            pstmt.setInt(2, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



}