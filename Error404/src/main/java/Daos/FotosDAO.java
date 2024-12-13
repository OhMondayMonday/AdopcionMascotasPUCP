package Daos;

import Beans.Fotos;
import jakarta.servlet.http.Part;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FotosDAO extends BaseDao{

    public void agregarFotoPubli(String url){
        String sql = "insert into fotos (url_foto) values(?)";

        try (Connection conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1,url);
            pstmt.executeUpdate();

        }catch(SQLException e){
            e.printStackTrace();
        }
    }

    public Fotos obtenerIdPorUrl(String url){
        String sql = "select * from fotos where url_foto = ?";
        Fotos foto = new Fotos();

        try (Connection conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,url);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                foto.setFotoId(rs.getInt("foto_id"));
            }

        }catch(SQLException e){
            e.printStackTrace();
        }
        return foto;
    }

}
