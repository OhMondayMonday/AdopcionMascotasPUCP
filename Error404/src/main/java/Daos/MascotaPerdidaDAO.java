package Daos;

import Beans.PublicacionesMascotaPerdida;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MascotaPerdidaDAO extends BaseDao {

    // Metodo para agregar una nueva publicación de Mascota Perdida
    public void agregarPublicacionMascotaPerdida(PublicacionesMascotaPerdida publicacion) {
        String query = "INSERT INTO publicaciones_mascota_perdida (publicacion_id, mascota_id, lugar_perdida, fecha_perdida, descripcion_adicional, mascota_encontrada) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, publicacion.getPublicacionId());
            pstmt.setInt(2, publicacion.getMascotaId());
            pstmt.setString(3, publicacion.getLugarPerdida());
            pstmt.setDate(4, Date.valueOf(publicacion.getFechaPerdida()));
            pstmt.setString(5, publicacion.getDescripcionAdicional());
            pstmt.setBoolean(6, publicacion.isMascotaEncontrada());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Metodo para descartar la publicación de Mascota Perdida
    public void descartarPublicacionMascotaPerdida(int publicacionId) {
        String query = "UPDATE publicaciones SET estado_publicacion = ? WHERE publicacion_id = ?";

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, "eliminada");
            pstmt.setInt(2, publicacionId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    // Otros métodos CRUD para gestionar las publicaciones de mascotas perdidas...
}

