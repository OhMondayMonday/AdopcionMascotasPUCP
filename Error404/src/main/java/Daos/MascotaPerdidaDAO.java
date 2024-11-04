package Daos;

import Beans.PublicacionesMascotaPerdida;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MascotaPerdidaDAO extends BaseDao {

    // Método para agregar una nueva publicación de Mascota Perdida
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

    // Método para descartar la publicación de Mascota Perdida
    public void descartarPublicacionMascotaPerdida(int publicacionId) {
        String query = "DELETE FROM publicaciones_mascota_perdida WHERE publicacion_id = ?";

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, publicacionId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    // Otros métodos CRUD para gestionar las publicaciones de mascotas perdidas...
}

