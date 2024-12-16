package Daos;

import Beans.Comentarios;
import Beans.Mascotas;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;

public class MascotaDAO extends BaseDao {

    public int agregarMascota(Mascotas mascota) {
        int mascotaId = -1;
        String sql = "INSERT INTO mascotas(nombre, raza_id, descripcion, foto_id, edad_aproximada, genero, tamanio) values (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, mascota.getNombre());
            pstmt.setInt(2, mascota.getRaza().getRazaId());
            pstmt.setString(3, mascota.getDescripcion()); // Aquí asignas la descripción
            pstmt.setInt(4, mascota.getFoto().getFotoId());
            pstmt.setInt(5, mascota.getEdadAproximada());
            pstmt.setString(6, mascota.getGenero());
            pstmt.setString(7, mascota.getTamanio());

            pstmt.executeUpdate();

            // Obtener el ID generado automáticamente
            ResultSet rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                mascotaId = rs.getInt(1); // Asignar el ID a la variable
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mascotaId; // Devuelve el ID generado
    }

    public int obtenerIdUltimaMascota() {
        int id = 0;
        String sql = "SELECT * FROM mascotas ORDER BY mascota_id DESC LIMIT 1";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                id = rs.getInt("mascota_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    public void actualizarMascota(Mascotas mascota){
        String sql = "UPDATE mascotas SET nombre = ?, raza_id = ?, edad_aproximada = ?, genero = ?, tamanio = ? WHERE mascota_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, mascota.getNombre());
            pstmt.setInt(2, mascota.getRaza().getRazaId());
            pstmt.setInt(3, mascota.getEdadAproximada());
            pstmt.setString(4, mascota.getGenero());
            pstmt.setString(5, mascota.getTamanio());
            pstmt.setInt(6, mascota.getMascotaId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
