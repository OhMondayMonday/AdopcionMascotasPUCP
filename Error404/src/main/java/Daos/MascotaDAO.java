package Daos;

import Beans.Comentarios;
import Beans.Mascotas;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MascotaDAO extends BaseDao{

    public void agregarMascota(Mascotas mascota){
        String sql = "INSERT INTO mascotas(nombre, raza_id, foto_id, edad_aproximada, genero, tamanio) values (?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, mascota.getNombre());
            pstmt.setInt(2, mascota.getRaza().getRazaId());
            pstmt.setInt(3, mascota.getFoto().getFotoId());
            pstmt.setInt(4, mascota.getEdadAproximada());
            pstmt.setString(5, mascota.getGenero());
            pstmt.setString(6, mascota.getTamanio());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int obtenerIdUltimaMascota(){
        int id = 0;
        String sql = "SELECT * FROM mascotas ORDER BY mascota_id DESC LIMIT 1";
        try (Connection conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)){
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                id = rs.getInt("mascota_id");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return id;
    }
}
