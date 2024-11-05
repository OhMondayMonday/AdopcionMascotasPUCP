package Daos;

import Beans.Publicaciones;
import Beans.PublicacionesAdopcion;
import Beans.PublicacionesDonaciones;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PublicacionesDAO extends BaseDao {

    // Metodo para obtener todas las publicaciones
    public List<Publicaciones> obtenerPublicaciones() {
        List<Publicaciones> publicaciones = new ArrayList<>();
        String query = "SELECT * FROM publicaciones";

        try (Connection connection = this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Publicaciones publicacion = new Publicaciones();
                publicacion.setPublicacionId(rs.getInt("publicacion_id"));
                publicacion.setUserId(rs.getInt("user_id"));
                publicacion.setTitulo(rs.getString("titulo"));
                publicacion.setDescripcion(rs.getString("descripcion"));
                publicacion.setComentario(rs.getString("comentario"));
                publicacion.setFechaCreacion(rs.getString("fecha_creacion"));
                publicacion.setTipoPublicacionId(rs.getInt("tipo_publicacion_id"));
                publicacion.setEstadoPublicacion(rs.getString("estado_publicacion"));
                publicaciones.add(publicacion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publicaciones;
    }

    // Metodo en UsuarioFinalPublicDAO para obtener publicaciones de adopción
    public List<PublicacionesAdopcion> obtenerPublicacionesAdopcion() {
        List<PublicacionesAdopcion> publicaciones = new ArrayList<>();
        String query = "SELECT * FROM publicaciones_adopcion INNER JOIN publicaciones ON publicaciones_adopcion.publicacion_id = publicaciones.publicacion_id";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                PublicacionesAdopcion publicacion = new PublicacionesAdopcion();
                publicacion.setPublicacionId(rs.getInt("publicacion_id"));
                publicacion.setMascotaId(rs.getInt("mascota_id"));
                publicacion.setLugarEncontrado(rs.getString("lugar_encontrado"));
                publicacion.setCondicionesAdopcion(rs.getString("condiciones_adopcion"));
                // Agrega otros atributos según sea necesario
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
        String query = "SELECT * FROM publicaciones_donaciones INNER JOIN publicaciones ON publicaciones_donaciones.publicacion_id = publicaciones.publicacion_id";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                PublicacionesDonaciones publicacion = new PublicacionesDonaciones();
                publicacion.setPublicacionId(rs.getInt("publicacion_id"));
                publicacion.setPuntoAcopio(rs.getString("punto_acopio"));
                publicacion.setTipoDonacionId(rs.getInt("tipo_donacion_id"));
                publicacion.setCantidad(rs.getDouble("cantidad"));
                publicacion.setMarca(rs.getString("marca"));
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
    public List<Object> obtenerTodasLasPublicacionesVisibles() {
        List<Object> todasLasPublicaciones = new ArrayList<>();

        // Agregar publicaciones generales
        todasLasPublicaciones.addAll(obtenerPublicaciones());

        // Agregar publicaciones de adopción
        todasLasPublicaciones.addAll(obtenerPublicacionesAdopcion());

        // Agregar publicaciones de donaciones
        todasLasPublicaciones.addAll(obtenerPublicacionesDonaciones());

        // Puedes agregar otros tipos de publicaciones si es necesario
        return todasLasPublicaciones;
    }


    // Metodo para agregar una nueva publicación
    public void agregarPublicacion(Publicaciones publicacion) {
        String query = "INSERT INTO publicaciones (user_id, titulo, descripcion, comentario, tipo_publicacion_id, estado_publicacion) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, publicacion.getUserId());
            pstmt.setString(2, publicacion.getTitulo());
            pstmt.setString(3, publicacion.getDescripcion());
            pstmt.setString(4, publicacion.getComentario());
            pstmt.setInt(5, publicacion.getTipoPublicacionId());
            pstmt.setString(6, publicacion.getEstadoPublicacion());
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
            pstmt.setInt(4, publicacion.getTipoPublicacionId());
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
        String query = "UPDATE publicaciones SET titulo = ?, descripcion = ?, comentario = ?, tipo_publicacion_id = ?, estado_publicacion = ? WHERE publicacion_id = ? AND user_id = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, publicacion.getTitulo());
            pstmt.setString(2, publicacion.getDescripcion());
            pstmt.setString(3, publicacion.getComentario());
            pstmt.setInt(4, publicacion.getTipoPublicacionId());
            pstmt.setString(5, publicacion.getEstadoPublicacion());
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
    public Publicaciones obtenerDetallePublicacion(int publicacionId) {
        Publicaciones publicacion = null;
        String query = "SELECT * FROM publicaciones WHERE publicacion_id = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, publicacionId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                publicacion = new Publicaciones();
                publicacion.setPublicacionId(rs.getInt("publicacion_id"));
                publicacion.setUserId(rs.getInt("user_id"));
                publicacion.setTitulo(rs.getString("titulo"));
                publicacion.setDescripcion(rs.getString("descripcion"));
                publicacion.setComentario(rs.getString("comentario"));
                publicacion.setFechaCreacion(rs.getString("fecha_creacion"));
                publicacion.setTipoPublicacionId(rs.getInt("tipo_publicacion_id"));
                publicacion.setEstadoPublicacion(rs.getString("estado_publicacion"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publicacion;
    }

    //FILTROS

    // Metodo para obtener publicaciones filtradas por palabra clave
    public List<Publicaciones> obtenerPublicacionesPorPalabraClave(String palabraClave) {
        List<Publicaciones> publicaciones = new ArrayList<>();
        String query = "SELECT * FROM publicaciones WHERE titulo LIKE ? OR descripcion LIKE ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            // Usar '%' para realizar una búsqueda parcial
            pstmt.setString(1, "%" + palabraClave + "%");
            pstmt.setString(2, "%" + palabraClave + "%");
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Publicaciones publicacion = new Publicaciones();
                publicacion.setPublicacionId(rs.getInt("publicacion_id"));
                publicacion.setUserId(rs.getInt("user_id"));
                publicacion.setTitulo(rs.getString("titulo"));
                publicacion.setDescripcion(rs.getString("descripcion"));
                publicacion.setComentario(rs.getString("comentario"));
                publicacion.setFechaCreacion(rs.getString("fecha_creacion"));
                publicacion.setTipoPublicacionId(rs.getInt("tipo_publicacion_id"));
                publicacion.setEstadoPublicacion(rs.getString("estado_publicacion"));
                publicaciones.add(publicacion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publicaciones;
    }


    // Metodo para obtener publicaciones filtradas por rango de fechas
    public List<Publicaciones> obtenerPublicacionesPorRangoDeFechas(String fechaInicio, String fechaFin) {
        List<Publicaciones> publicaciones = new ArrayList<>();
        String query = "SELECT * FROM publicaciones WHERE fecha_creacion BETWEEN ? AND ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, fechaInicio);
            pstmt.setString(2, fechaFin);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Publicaciones publicacion = new Publicaciones();
                publicacion.setPublicacionId(rs.getInt("publicacion_id"));
                publicacion.setUserId(rs.getInt("user_id"));
                publicacion.setTitulo(rs.getString("titulo"));
                publicacion.setDescripcion(rs.getString("descripcion"));
                publicacion.setComentario(rs.getString("comentario"));
                publicacion.setFechaCreacion(rs.getString("fecha_creacion"));
                publicacion.setTipoPublicacionId(rs.getInt("tipo_publicacion_id"));
                publicacion.setEstadoPublicacion(rs.getString("estado_publicacion"));
                publicaciones.add(publicacion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publicaciones;
    }




}