package Daos;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import Beans.Distritos;
import Beans.Zonas;

public class DistritosDAO extends BaseDao{

    public List<Distritos> obtenerDistritos() {
        String query = "SELECT distrito_id, nombre_distrito, zona_distrito_id FROM distritos";
        List<Distritos> distritos = new ArrayList<>();

        try (Connection connection = this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()){
                Distritos distrito = new Distritos();
                distrito.setDistritoId(rs.getInt("distrito_id"));
                distrito.setNombreDistrito(rs.getString("nombre_distrito"));
                Zonas zona = new Zonas();
                zona.setZonaId(rs.getInt("zona_distrito_id"));
                distrito.setZona(zona);
                distritos.add(distrito);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return distritos;
    }

}
