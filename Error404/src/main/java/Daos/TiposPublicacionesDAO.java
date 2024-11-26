package Daos;

import Beans.TiposPublicaciones;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TiposPublicacionesDAO extends BaseDao{

    public List<TiposPublicaciones> obtenerTiposPublicaciones(){
        ArrayList<TiposPublicaciones> listaTiposPublicaciones = new ArrayList<>();

        String query = "select * from tipos_publicaciones";

        try(Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(query)){
            try(ResultSet rs = ps.executeQuery()){
                while (rs.next()){
                    TiposPublicaciones tiposPublicaciones = new TiposPublicaciones();
                    tiposPublicaciones.setTipoPublicacionId(rs.getInt("tipo_publicacion_id"));
                    tiposPublicaciones.setTipoPublicacion(rs.getString("tipo_publicacion"));
                    listaTiposPublicaciones.add(tiposPublicaciones);
                }
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return listaTiposPublicaciones;
    }
}
