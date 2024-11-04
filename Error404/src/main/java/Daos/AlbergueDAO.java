package Daos;

import Beans.Usuarios;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AlbergueDAO extends BaseDao {

    // 1. Registrar Albergue
    public boolean registrarAlbergue(Usuarios albergue) {
        String sql = "INSERT INTO usuario (username, contrasena, nombre, apellido, email, dni, direccion, distritoId, " +
                "estadoCuenta, rolId, fechaRegistro, nombreAlbergue, capacidadNuevosAnimales, animalesAlbergados, " +
                "anioCreacion, urlFacebook, urlInstagram, urlTwitter, puntoAcopio, direccionDonaciones, " +
                "nombreContactoDonaciones, numeroContactoDonaciones, numeroYapePlin, codigoQr, zonaId) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";


        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, albergue.getUsername());
            stmt.setString(2, albergue.getContrasena());
            stmt.setString(3, albergue.getNombre());
            stmt.setString(4, albergue.getApellido());
            stmt.setString(5, albergue.getEmail());
            stmt.setString(6, albergue.getDni());
            stmt.setString(7, albergue.getDireccion());
            stmt.setInt(8, albergue.getDistritoId());
            stmt.setString(9, "pendiente"); // Estado inicial de la cuenta
            stmt.setInt(10, albergue.getRolId());
            stmt.setString(11, albergue.getNombreAlbergue());
            stmt.setInt(12, albergue.getCapacidadNuevosAnimales());
            stmt.setInt(13, albergue.getAnimalesAlbergados());
            stmt.setInt(14, albergue.getAnioCreacion());
            stmt.setString(15, albergue.getUrlFacebook());
            stmt.setString(16, albergue.getUrlInstagram());
            stmt.setString(17, albergue.getUrlTwitter());
            stmt.setString(18, albergue.getPuntoAcopio());
            stmt.setString(19, albergue.getDireccionDonaciones());
            stmt.setString(20, albergue.getNombreContactoDonaciones());
            stmt.setString(21, albergue.getNumeroContactoDonaciones());
            stmt.setString(22, albergue.getNumeroYapePlin());
            stmt.setBytes(23, albergue.getCodigoQr());
            stmt.setInt(24, albergue.getZonaId());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 2. Obtener Información del Albergue
    public Usuarios obtenerInformacionAlbergue(int albergueId) {
        String sql = "SELECT userId, username, nombre, apellido, email, direccion, distritoId, estadoCuenta, nombreAlbergue, capacidadNuevosAnimales, animalesAlbergados, anioCreacion, urlFacebook, urlInstagram, urlTwitter, puntoAcopio, direccionDonaciones, nombreContactoDonaciones, numeroContactoDonaciones, numeroYapePlin, zonaId " +
                "FROM usuario WHERE userId = ? AND rolId = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, albergueId);
            stmt.setInt(2, 3); // Suponiendo que rolId de albergues es 3
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Usuarios albergue = new Usuarios();
                albergue.setUserId(rs.getInt("userId"));
                albergue.setUsername(rs.getString("username"));
                albergue.setNombre(rs.getString("nombre"));
                albergue.setApellido(rs.getString("apellido"));
                albergue.setEmail(rs.getString("email"));
                albergue.setDireccion(rs.getString("direccion"));
                albergue.setDistritoId(rs.getInt("distritoId"));
                albergue.setEstadoCuenta(rs.getString("estadoCuenta"));
                albergue.setNombreAlbergue(rs.getString("nombreAlbergue"));
                albergue.setCapacidadNuevosAnimales(rs.getInt("capacidadNuevosAnimales"));
                albergue.setAnimalesAlbergados(rs.getInt("animalesAlbergados"));
                albergue.setAnioCreacion(rs.getInt("anioCreacion"));
                albergue.setUrlFacebook(rs.getString("urlFacebook"));
                albergue.setUrlInstagram(rs.getString("urlInstagram"));
                albergue.setUrlTwitter(rs.getString("urlTwitter"));
                albergue.setPuntoAcopio(rs.getString("puntoAcopio"));
                albergue.setDireccionDonaciones(rs.getString("direccionDonaciones"));
                albergue.setNombreContactoDonaciones(rs.getString("nombreContactoDonaciones"));
                albergue.setNumeroContactoDonaciones(rs.getString("numeroContactoDonaciones"));
                albergue.setNumeroYapePlin(rs.getString("numeroYapePlin"));
                albergue.setZonaId(rs.getInt("zonaId"));
                return albergue;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // 3. Actualizar Información del Albergue
    public boolean actualizarInformacionAlbergue(Usuarios albergue) {
        String sql = "UPDATE usuario SET nombre = ?, apellido = ?, email = ?, direccion = ?, distritoId = ?, capacidadNuevosAnimales = ?, animalesAlbergados = ?, urlFacebook = ?, urlInstagram = ?, urlTwitter = ?, puntoAcopio = ?, direccionDonaciones = ?, nombreContactoDonaciones = ?, numeroContactoDonaciones = ?, numeroYapePlin = ? WHERE userId = ? AND rolId = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, albergue.getNombre());
            stmt.setString(2, albergue.getApellido());
            stmt.setString(3, albergue.getEmail());
            stmt.setString(4, albergue.getDireccion());
            stmt.setInt(5, albergue.getDistritoId());
            stmt.setInt(6, albergue.getCapacidadNuevosAnimales());
            stmt.setInt(7, albergue.getAnimalesAlbergados());
            stmt.setString(8, albergue.getUrlFacebook());
            stmt.setString(9, albergue.getUrlInstagram());
            stmt.setString(10, albergue.getUrlTwitter());
            stmt.setString(11, albergue.getPuntoAcopio());
            stmt.setString(12, albergue.getDireccionDonaciones());
            stmt.setString(13, albergue.getNombreContactoDonaciones());
            stmt.setString(14, albergue.getNumeroContactoDonaciones());
            stmt.setString(15, albergue.getNumeroYapePlin());
            stmt.setInt(16, albergue.getUserId());
            stmt.setInt(17, 3); // Suponiendo rolId de albergues es 3

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 4. Desactivar Cuenta del Albergue
    public boolean desactivarCuentaAlbergue(int albergueId) {
        String sql = "UPDATE usuario SET estadoCuenta = 'inactivo' WHERE userId = ? AND rolId = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, albergueId);
            stmt.setInt(2, 3); // Suponiendo rolId de albergues es 3
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}

