package Daos;

import Beans.Razas;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class RazasDao extends BaseDao {

    public ArrayList<Razas> listarRazas() {
        ArrayList<Razas> listaRazas = new ArrayList<>();
        String sql = "select * from razas";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()){
                Razas raza = new Razas();
                raza.setRazaId(rs.getInt(1));
                raza.setNombreRaza(rs.getString(2));
                raza.setTipoAnimal(rs.getString(3));
                listaRazas.add(raza);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  listaRazas;
    }
}
