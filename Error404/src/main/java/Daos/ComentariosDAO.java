package Daos;

import Beans.Comentarios;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ComentariosDAO extends BaseDao{

    public List<Comentarios> obtenerComentariosPublis(int publicacion_id) {
        List<Comentarios> comentariosPublis = new ArrayList<Comentarios>();
        String sql = "select * from comentarios where publicacion_id=? order by fecha_actualizacion desc limit 5";

        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1,publicacion_id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                Comentarios comentario = new Comentarios();
                comentario.setComentarioId(rs.getInt(1));
                comentario.setPublicacionId(rs.getInt(2));
                comentario.setUsuarioId(rs.getInt(3));
                comentario.setComentario(rs.getString(4));
                comentario.setFechaActualizacion(rs.getTimestamp(5));
                comentariosPublis.add(comentario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comentariosPublis;
    }

    public void agregarComentario(Comentarios comentario) {
        String sql = "INSERT INTO comentarios (publicacion_id, usuario_id, comentario) VALUES (?,?,?)";

        try (Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1,comentario.getPublicacionId());
            pstmt.setInt(2,comentario.getUsuarioId());
            pstmt.setString(3, comentario.getComentario());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
