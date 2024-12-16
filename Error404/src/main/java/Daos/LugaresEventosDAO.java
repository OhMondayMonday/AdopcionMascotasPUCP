package Daos;

import Beans.LugaresEventos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LugaresEventosDAO extends BaseDao {

    public int crearLugarEvento(LugaresEventos lugar) {
        int lugarIdGenerado = -1;
        String sql = "INSERT INTO lugares_eventos (nombre_lugar, foto_id, distrito_id, direccion_lugar, aforo_maximo, activo) VALUES ('nombre', 1, ?, ?, ?, ?)";

        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, lugar.getDistrito().getDistritoId());
            ps.setString(2, lugar.getDireccionLugar());
            ps.setInt(3, lugar.getAforoMaximo());
            ps.setBoolean(4, true);

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                lugarIdGenerado = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return lugarIdGenerado;
    }

    public void actualizarLugarEvento(LugaresEventos lugar) {
        String sql = "UPDATE lugares_eventos SET direccion_lugar = ?, aforo_maximo = ?, distrito_id = ? WHERE lugar_id = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, lugar.getDireccionLugar());
            ps.setInt(2, lugar.getAforoMaximo());
            ps.setInt(3, lugar.getDistrito().getDistritoId());
            ps.setInt(4, lugar.getLugarId());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
