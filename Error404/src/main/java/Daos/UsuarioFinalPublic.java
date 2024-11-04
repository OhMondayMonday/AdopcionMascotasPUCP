package Daos;

import Beans.Publicaciones;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuarioFinalPublic extends BaseDao {

    // Método para obtener todas las publicaciones
    public List<Publicaciones> obtenerPublicaciones() {
        List<Publicaciones> publicaciones = new ArrayList<>();
        String query = "SELECT * FROM publicaciones";

        try (Connection connection = getConnection();
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

    // Método para agregar una nueva publicación
    public void agregarPublicacion(Publicaciones publicacion) {
        String query = "INSERT INTO publicaciones (user_id, titulo, descripcion, comentario, tipo_publicacion_id, estado_publicacion) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = getConnection();
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

    // Método para actualizar una publicación
    public void actualizarPublicacion(Publicaciones publicacion) {
        String query = "UPDATE publicaciones SET titulo = ?, descripcion = ?, comentario = ?, tipo_publicacion_id = ?, estado_publicacion = ? WHERE publicacion_id = ?";
        try (Connection connection = getConnection();
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

    // Método para eliminar una publicación
    public void eliminarPublicacion(int id) {
        String query = "DELETE FROM publicaciones WHERE publicacion_id = ?";
        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}