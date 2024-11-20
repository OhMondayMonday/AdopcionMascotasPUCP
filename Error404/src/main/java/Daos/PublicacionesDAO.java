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

    // Metodo para obtener todas las publicaciones
    public List<Publicaciones> obtenerPublicaciones(int inicio) {
        List<Publicaciones> publicaciones = new ArrayList<>();
        String query = "SELECT * FROM publicaciones p\n" +
                "INNER JOIN usuarios u ON p.user_id = u.user_id\n" +
                "INNER JOIN fotos f ON f.foto_id = p.foto_id\n" +
                "INNER JOIN tipos_publicaciones tp ON p.tipo_publicacion_id = tp.tipo_publicacion_id\n" +
                "WHERE p.estado_publicacion = 'activa'\n" +
                "ORDER BY p.publicacion_id DESC\n" +
                "LIMIT ? OFFSET ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query);) {
            pstmt.setInt(1, 6);
            pstmt.setInt(2, inicio);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Publicaciones publicacion = fetchPublicacionDatos(rs);
                publicaciones.add(publicacion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publicaciones;
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

    public int obtenerCantidadDePublicaciones() {
        String query = "SELECT COUNT(*) FROM publicaciones";
        int cantidad = 0;
        try (Connection conn = this.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query)) {
            if(rs.next()){
                cantidad = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cantidad;
    }

    // Metodo en UsuarioFinalPublicDAO para obtener datos de una publicacion de adopción
    public PublicacionesAdopcion obtenerPublicacionAdopcion(int publicacionId) {
        PublicacionesAdopcion publicacionAdopcion = new PublicacionesAdopcion();
        String query = "SELECT * FROM publicaciones_adopcion pa\n" +
                "INNER JOIN mascotas m ON m.mascota_id = pa.mascota_id\n" +
                "INNER JOIN razas r ON r.raza_id = m.raza_id\n" +
                "INNER JOIN fotos f ON m.foto_id = f.foto_id\n" +
                "WHERE pa.publicacion_id = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)){

            pstmt.setInt(1, publicacionId);

            try (ResultSet rs = pstmt.executeQuery()){
                if(rs.next()){
                    publicacionAdopcion.setPublicacion_id(rs.getInt("pa.publicacion_id"));

                    Mascotas mascota = new Mascotas();
                    mascota.setMascotaId(rs.getInt("m.mascota_id"));
                    mascota.setNombre(rs.getString("m.nombre"));

                    Razas raza = new Razas();
                    raza.setRazaId(rs.getInt("r.raza_id"));
                    raza.setNombreRaza(rs.getString("r.nombreRaza"));
                    raza.setTipoAnimal(rs.getString("r.tipoAnimal"));
                    mascota.setRaza(raza);

                    mascota.setDescripcion(rs.getString("m.descripcion"));

                    Fotos foto = new Fotos();
                    foto.setFotoId(rs.getInt("f.foto_id"));
                    foto.setUrlFoto(rs.getString("f.url_foto"));
                    foto.setFechaSubida(rs.getTimestamp("f.fecha_subida"));
                    mascota.setFoto(foto);

                    mascota.setEdadAproximada(rs.getInt("m.edad_aproximada"));
                    mascota.setGenero(rs.getString("m.genero"));
                    mascota.setTamanio(rs.getString("m.tamanio"));
                    mascota.setDistintivo(rs.getString("m.distintivo"));
                    mascota.setEnHogarTemporal(rs.getBoolean("m.en_hogar_temporal"));
                    publicacionAdopcion.setMascota(mascota);

                    publicacionAdopcion.setLugarEncontrado(rs.getString("pa.lugar_encontrado"));
                    publicacionAdopcion.setCondicionesAdopcion(rs.getString("pa.condiciones_adopcion"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publicacionAdopcion;
    }

    public PublicacionesMascotaPerdida obtenerPublicacionMascotaPerdida(int publicacionId) {
        PublicacionesMascotaPerdida mascotaPerdida = new PublicacionesMascotaPerdida();
        String query = "SELECT * FROM publicaciones_mascota_perdida mp\n" +
                "INNER JOIN mascotas m ON m.mascota_id = mp.mascota_id\n" +
                "INNER JOIN razas r ON r.raza_id = m.raza_id\n" +
                "INNER JOIN fotos f ON m.foto_id = f.foto_id\n" +
                "WHERE mp.publicacion_id = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)){

            pstmt.setInt(1, publicacionId);

            try (ResultSet rs = pstmt.executeQuery()){
                if(rs.next()){
                    mascotaPerdida.setPublicacion_id(rs.getInt("mp.publicacion_id"));

                    Mascotas mascota = new Mascotas();
                    mascota.setMascotaId(rs.getInt("m.mascota_id"));
                    mascota.setNombre(rs.getString("m.nombre"));

                    Razas raza = new Razas();
                    raza.setRazaId(rs.getInt("r.raza_id"));
                    raza.setNombreRaza(rs.getString("r.nombreRaza"));
                    raza.setTipoAnimal(rs.getString("r.tipoAnimal"));
                    mascota.setRaza(raza);

                    mascota.setDescripcion(rs.getString("m.descripcion"));

                    Fotos foto = new Fotos();
                    foto.setFotoId(rs.getInt("f.foto_id"));
                    foto.setUrlFoto(rs.getString("f.url_foto"));
                    foto.setFechaSubida(rs.getTimestamp("f.fecha_subida"));
                    mascota.setFoto(foto);

                    mascota.setGenero(rs.getString("m.genero"));
                    mascota.setTamanio(rs.getString("m.tamanio"));
                    mascota.setDistintivo(rs.getString("m.distintivo"));

                    mascotaPerdida.setLugarPerdida(rs.getString("mp.lugar_perdida"));
                    mascotaPerdida.setFechaPerdida(rs.getTimestamp("mp.fecha_perdida"));
                    if(rs.getString("mp.descripcion_adicional") != null){
                        mascotaPerdida.setDescripcionAdicional(rs.getString("mp.descripcion_adicional"));
                    }
                    mascotaPerdida.setMascotaEncontrada(rs.getBoolean("mp.mascota_encontrada"));
                    mascotaPerdida.setMascota(mascota);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mascotaPerdida;
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



}