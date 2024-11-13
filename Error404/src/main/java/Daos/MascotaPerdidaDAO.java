package Daos;

import Beans.PublicacionesMascotaPerdida;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MascotaPerdidaDAO extends BaseDao {



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

