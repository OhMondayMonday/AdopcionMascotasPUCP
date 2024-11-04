package Daos;

import Beans.DenunciasMaltratoAnimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DenunciaMaltratoDAO extends BaseDao {

    // Método para agregar una nueva denuncia de maltrato
    public void agregarDenunciaMaltrato(DenunciasMaltratoAnimal denuncia) {
        String query = "INSERT INTO denuncias_maltrato_animal (user_id, descripcion, tipo_maltrato, nombre_maltratador, direccion_maltrato, tamanio, animal, tipo_raza, denuncia_policial) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, denuncia.getUserId());
            pstmt.setString(2, denuncia.getDescripcion());
            pstmt.setString(3, denuncia.getTipoMaltrato());
            pstmt.setString(4, denuncia.getNombreMaltratador());
            pstmt.setString(5, denuncia.getDireccionMaltrato());
            pstmt.setString(6, denuncia.getTamanio());
            pstmt.setString(7, denuncia.getAnimal());
            pstmt.setString(8, denuncia.getTipoRaza());
            pstmt.setBoolean(9, denuncia.isDenunciaPolicial());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Método para descartar la denuncia de maltrato
    public void descartarDenunciaMaltrato(int denunciaId) {
        String query = "DELETE FROM denuncias_maltrato_animal WHERE report_id = ?";

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, denunciaId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Otros métodos CRUD para gestionar las denuncias de maltrato...
}
