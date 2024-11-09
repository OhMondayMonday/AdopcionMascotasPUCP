package Daos;

import Beans.HogaresTemporales;
import Beans.HogaresTemporales;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HogarTemporalDAO extends BaseDao {

    // Método para obtener todas las publicaciones de hogares temporales
    public List<HogaresTemporales> obtenerHogaresTemporales() {
        List<HogaresTemporales> hogares = new ArrayList<>();
        String query = "SELECT * FROM hogares_temporales";

        try (Connection connection = getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                HogaresTemporales hogar = crearHogarTemporalDesdeResultSet(rs);
                hogares.add(hogar);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hogares;
    }

    // Método para filtrar hogares temporales por tipo de mascota
    public List<HogaresTemporales> filtrarHogaresPorTipoMascota(String tipoMascota) {
        List<HogaresTemporales> hogares = new ArrayList<>();
        String query = "SELECT * FROM hogares_temporales WHERE tipo_mascotas LIKE ?";

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, "%" + tipoMascota + "%");
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                HogaresTemporales hogar = crearHogarTemporalDesdeResultSet(rs);
                hogares.add(hogar);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hogares;
    }

    // Método para filtrar hogares temporales por ubicación
    public List<HogaresTemporales> filtrarHogaresPorUbicacion(String ubicacion) {
        List<HogaresTemporales> hogares = new ArrayList<>();
        String query = "SELECT * FROM hogares_temporales WHERE distrito = ?";

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, ubicacion);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                HogaresTemporales hogar = crearHogarTemporalDesdeResultSet(rs);
                hogares.add(hogar);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hogares;
    }

    // Método para obtener detalles de un hogar temporal específico
    public HogaresTemporales obtenerDetalleHogarTemporal(int temporalId) {
        HogaresTemporales hogar = null;
        String query = "SELECT * FROM hogares_temporales WHERE temporal_id = ?";

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, temporalId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                hogar = crearHogarTemporalDesdeResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hogar;
    }

    // Método auxiliar para crear un objeto HogarTemporal desde ResultSet
    private HogaresTemporales crearHogarTemporalDesdeResultSet(ResultSet rs) throws SQLException {
        HogaresTemporales hogar = new HogaresTemporales();
        hogar.setTemporalId(rs.getInt("temporal_id"));

        Beans.Usuarios usuario = new Beans.Usuarios();
        usuario.setUserId(rs.getInt("user_id"));
        hogar.setUsuario(usuario);

        hogar.setEdad(rs.getInt("edad"));
        hogar.setGenero(rs.getString("genero"));
        hogar.setCelular(rs.getString("celular"));
        hogar.setDireccion(rs.getString("direccion"));

        Beans.Distritos distrito = new Beans.Distritos();
        distrito.setDistritoId(rs.getInt("distrito_id"));
        hogar.setDistrito(distrito);

        hogar.setCantidadCuartos(rs.getInt("cantidad_cuartos"));
        hogar.setMetrajeVivienda(rs.getDouble("metraje_vivienda"));
        hogar.setTieneMascotas(rs.getBoolean("tiene_mascotas"));
        hogar.setCantidadMascotas(rs.getInt("cantidad_mascotas"));
        hogar.setTipoMascotas(rs.getString("tipo_mascotas"));
        hogar.setTieneHijos(rs.getBoolean("tiene_hijos"));
        hogar.setViveSolo(rs.getBoolean("vive_solo"));
        hogar.setTrabaja(rs.getString("trabaja"));
        hogar.setPersonaReferencia(rs.getString("persona_referencia"));
        hogar.setContactoReferencia(rs.getString("contacto_referencia"));
        hogar.setTiempoTemporal(rs.getInt("tiempo_temporal"));
        hogar.setRangoFechaInicio(rs.getDate("rango_fecha_inicio"));
        hogar.setRangoFechaFin(rs.getDate("rango_fecha_fin"));
        hogar.setEstadoTemporal(rs.getString("estado_temporal"));
        hogar.setFechaAprobacion(rs.getTimestamp("fecha_aprobacion"));
        return hogar;
    }
}


