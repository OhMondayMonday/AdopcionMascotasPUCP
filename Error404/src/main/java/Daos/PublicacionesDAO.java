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

        TiposPublicaciones tipoPublicacion = null;
        if((rs.getInt("tp.tipo_publicacion_id")) != 0){
            tipoPublicacion.setTipoPublicacionId(rs.getInt("tp.tipo_publicacion_id"));
            tipoPublicacion.setTipoPublicacion(rs.getString("tp.tipo_publicacion"));
            publicacion.setTipoPublicacion(tipoPublicacion);
        }
        publicacion.setEstadoPublicacion(rs.getString(9));

        return publicacion;
    }

    // Metodo para obtener todas las publicaciones
    public List<Publicaciones> obtenerPublicaciones() {
        List<Publicaciones> publicaciones = new ArrayList<>();
        String query = "SELECT * FROM publicaciones p\n" +
                "INNER JOIN usuarios u ON p.user_id = u.user_id\n" +
                "INNER JOIN fotos f ON f.foto_id = p.foto_id\n" +
                "INNER JOIN tipos_publicaciones tp ON p.tipo_publicacion_id = tp.tipo_publicacion_id";

        try (Connection connection = this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Publicaciones publicacion = fetchPublicacionDatos(rs);
                publicaciones.add(publicacion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publicaciones;
    }

    // Metodo en UsuarioFinalPublicDAO para obtener publicaciones de adopción
    public List<Publicaciones> obtenerPublicacionesAdopcion() {
        List<Publicaciones> publicaciones = new ArrayList<>();
        String query = "SELECT * FROM publicaciones p\n" +
                "INNER JOIN usuarios u ON p.user_id = u.user_id\n" +
                "INNER JOIN fotos f ON f.foto_id = p.foto_id\n" +
                "INNER JOIN tipos_publicaciones tp ON p.tipo_publicacion_id = tp.tipo_publicacion_id\n" +
                "WHERE tp.tipo_publicacion_id = 1";

        try (Connection connection = this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Publicaciones publicacion = fetchPublicacionDatos(rs);
                publicaciones.add(publicacion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publicaciones;
    }

    // Metodo en UsuarioFinalPublicDAO para obtener publicaciones de donaciones
    public List<PublicacionesDonaciones> obtenerPublicacionesDonaciones() {
        List<PublicacionesDonaciones> publicaciones = new ArrayList<>();
        String query = "SELECT * FROM publicaciones_donaciones pd\n" +
                "INNER JOIN publicaciones p ON pd.publicacion_id = p.publicacion_id";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                PublicacionesDonaciones publicacion = new PublicacionesDonaciones();

                Publicaciones publicacionBase = new Publicaciones();
                publicacionBase.setPublicacionId(rs.getInt("publicacion_id"));

// Asignar el objeto Publicaciones a la PublicacionesDonaciones
                publicacion.setPublicacion(publicacionBase);
                publicacion.setPuntoAcopio(rs.getString("punto_acopio"));

                // Manejo de tipo de donación como un objeto relacionado
                TiposDonaciones tipoDonacion = new TiposDonaciones();
                tipoDonacion.setTipoDonacionId(rs.getInt("tipo_donacion_id"));
                publicacion.setTipoDonacion(tipoDonacion);
                publicacion.setCantidad(rs.getDouble("cantidad"));
                publicacion.setMarca(rs.getString("marca"));
                // Manejo de fechas como objetos Date
                publicacion.setFechaRecepcionInicio(rs.getString("fecha_recepcion_inicio"));
                publicacion.setFechaRecepcionFin(rs.getString("fecha_recepcion_fin"));
                publicacion.setHoraRecepcion(rs.getString("hora_recepcion"));

                publicacion.setTelefonoContacto(rs.getString("telefono_contacto"));
                publicacion.setNombreContacto(rs.getString("nombre_contacto"));
                publicacion.setMotivoDonacion(rs.getString("motivo_donacion"));

                // Agrega otros atributos según sea necesario
                publicaciones.add(publicacion);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publicaciones;
    }

    // Metodo para obtener todas las publicaciones visibles para el usuario final
    public List<Publicaciones> obtenerPublicacionesVisibles() {
        List<Publicaciones> publicaciones = new ArrayList<>();
        String query = "SELECT * FROM publicaciones p\n" +
                "INNER JOIN usuarios u ON p.user_id = u.user_id\n" +
                "INNER JOIN fotos f ON f.foto_id = p.foto_id\n" +
                "INNER JOIN tipos_publicaciones tp ON p.tipo_publicacion_id = tp.tipo_publicacion_id" +
                "WHERE p.estado_publicacion = 'activa'";

        try (Connection connection = this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Publicaciones publicacion = fetchPublicacionDatos(rs);
                publicaciones.add(publicacion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publicaciones;
    }


    // Metodo para agregar una nueva publicación
    public void agregarPublicacion(Publicaciones publicacion) {
        String query = "INSERT INTO publicaciones (user_id, titulo, descripcion, comentario, tipo_publicacion_id) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, publicacion.getUsuario().getUserId());
            pstmt.setString(2, publicacion.getTitulo());
            pstmt.setString(3, publicacion.getDescripcion());
            pstmt.setString(4, publicacion.getComentario());
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

    // Metodo para actualizar una publicación con verificacion
    public void actualizarPublicacionVerificacion(Publicaciones publicacion, int userID) {
        String query = "UPDATE publicaciones SET titulo = ?, descripcion = ?, comentario = ?, tipo_publicacion_id = ? WHERE publicacion_id = ? AND user_id = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, publicacion.getTitulo());
            pstmt.setString(2, publicacion.getDescripcion());
            pstmt.setString(3, publicacion.getComentario());
            pstmt.setInt(4, publicacion.getTipoPublicacion().getTipoPublicacionId());
            pstmt.setInt(6, publicacion.getPublicacionId());
            pstmt.setInt(7, userID);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Metodo para eliminar una publicación con verificacion
    public void eliminarPublicacionVerificacion(int id, int userID) {
        String query = "UPDATE publicaciones SET estado_publicacion = ? WHERE publicacion_id = ? AND user_id = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, "eliminada");
            pstmt.setInt(2, id);
            pstmt.setInt(3, userID);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Metodo para obtener detalles de una publicación por su ID
    public Publicaciones obtenerDetallesPublicacion(int publicacionId) {
        String query = "SELECT * FROM publicaciones WHERE publicacion_id = ?";
        Publicaciones publicacion = null;
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, publicacionId);
            ResultSet rs = pstmt.executeQuery();

            publicacion = fetchPublicacionDatos(rs);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publicacion;
    }

}