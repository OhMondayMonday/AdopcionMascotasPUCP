package Daos;

import Beans.Usuarios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AlbergueDAO extends BaseDao {

    // 1. Registrar Albergue
    public boolean registrarAlbergue(Usuarios albergue) {
        String sql = "INSERT INTO usuarios (username, contraseña, nombre, apellido, email, DNI, direccion, distrito_id, " +
                "estado_cuenta, rol_id, fecha_registro, nombre_albergue, capacidad_nuevos_animales, animales_albergados, " +
                "anio_creacion, url_facebook, url_instagram, punto_acopio, direccion_donaciones, " +
                "nombre_contacto_donaciones, numero_contacto_donaciones, numero_yape_plin, codigo_qr, zona_id) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, albergue.getUsername());
            stmt.setString(2, albergue.getContrasenia());
            stmt.setString(3, albergue.getNombre());
            stmt.setString(4, albergue.getApellido());
            stmt.setString(5, albergue.getEmail());
            stmt.setString(6, albergue.getDni());
            stmt.setString(7, albergue.getDireccion());
            stmt.setInt(8, albergue.getDistrito().getDistritoId());
            stmt.setString(9, "pendiente"); // Estado inicial de la cuenta
            stmt.setInt(10, albergue.getRol().getRolId());
            stmt.setString(11, albergue.getNombreAlbergue());
            stmt.setInt(12, albergue.getCapacidadNuevosAnimales());
            stmt.setInt(13, albergue.getAnimalesAlbergados());
            stmt.setInt(14, albergue.getAnioCreacion());
            stmt.setString(15, albergue.getUrlFacebook());
            stmt.setString(16, albergue.getUrlInstagram());
            stmt.setString(17, albergue.getPuntoAcopio());
            stmt.setString(18, albergue.getDireccionDonaciones());
            stmt.setString(19, albergue.getNombreContactoDonaciones());
            stmt.setString(20, albergue.getNumeroContactoDonaciones());
            stmt.setString(21, albergue.getNumeroYapePlin());
            stmt.setBytes(22, albergue.getCodigoQr());
            stmt.setInt(23, albergue.getZona().getZonaId());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 2. Obtener Información del Albergue
    public Usuarios obtenerInformacionAlbergue(int albergueId) {
        String sql = "SELECT user_id, username, nombre, apellido, email, direccion, distrito_id, " +
                "estado_cuenta, nombre_albergue, capacidad_nuevos_animales, animales_albergados, " +
                "anio_creacion, url_facebook, url_instagram, punto_acopio, direccion_donaciones, " +
                "nombre_contacto_donaciones, numero_contacto_donaciones, numero_yape_plin, zona_id " +
                "FROM usuarios WHERE user_id = ? AND rol_id = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, albergueId);
            stmt.setInt(2, 3); // Suponiendo que el rolId de albergues es 3
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Usuarios albergue = new Usuarios();
                albergue.setUserId(rs.getInt("user_id"));
                albergue.setUsername(rs.getString("username"));
                albergue.setNombre(rs.getString("nombre"));
                albergue.setApellido(rs.getString("apellido"));
                albergue.setEmail(rs.getString("email"));
                albergue.setDireccion(rs.getString("direccion"));

                // Crear y asignar el objeto Distritos
                Beans.Distritos distrito = new Beans.Distritos();
                distrito.setDistritoId(rs.getInt("distrito_id"));
                albergue.setDistrito(distrito);

                albergue.setEstadoCuenta(rs.getString("estado_cuenta"));
                albergue.setNombreAlbergue(rs.getString("nombre_albergue"));
                albergue.setCapacidadNuevosAnimales(rs.getInt("capacidad_nuevos_animales"));
                albergue.setAnimalesAlbergados(rs.getInt("animales_albergados"));
                albergue.setAnioCreacion(rs.getInt("anio_creacion"));
                albergue.setUrlFacebook(rs.getString("url_facebook"));
                albergue.setUrlInstagram(rs.getString("url_instagram"));
                albergue.setPuntoAcopio(rs.getString("punto_acopio"));
                albergue.setDireccionDonaciones(rs.getString("direccion_donaciones"));
                albergue.setNombreContactoDonaciones(rs.getString("nombre_contacto_donaciones"));
                albergue.setNumeroContactoDonaciones(rs.getString("numero_contacto_donaciones"));
                albergue.setNumeroYapePlin(rs.getString("numero_yape_plin"));

                // Crear y asignar el objeto Zonas
                Beans.Zonas zona = new Beans.Zonas();
                zona.setZonaId(rs.getInt("zona_id"));
                albergue.setZona(zona);

                return albergue;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // 3. Actualizar Información del Albergue
    public boolean actualizarInformacionAlbergue(Usuarios albergue) {
        String sql = "UPDATE usuarios SET nombre = ?, apellido = ?, email = ?, direccion = ?, distrito_id = ?, capacidad_nuevos_animales = ?, animales_albergados = ?, url_facebook = ?, url_instagram = ?, punto_acopio = ?, direccion_donaciones = ?, nombre_contacto_donaciones = ?, numero_contacto_donaciones = ?, numero_yape_plin = ? WHERE user_id = ? AND rol_id = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, albergue.getNombre());
            stmt.setString(2, albergue.getApellido());
            stmt.setString(3, albergue.getEmail());
            stmt.setString(4, albergue.getDireccion());
            stmt.setInt(5, albergue.getDistrito().getDistritoId());
            stmt.setInt(6, albergue.getCapacidadNuevosAnimales());
            stmt.setInt(7, albergue.getAnimalesAlbergados());
            stmt.setString(8, albergue.getUrlFacebook());
            stmt.setString(9, albergue.getUrlInstagram());
            stmt.setString(10, albergue.getPuntoAcopio());
            stmt.setString(11, albergue.getDireccionDonaciones());
            stmt.setString(12, albergue.getNombreContactoDonaciones());
            stmt.setString(13, albergue.getNumeroContactoDonaciones());
            stmt.setString(14, albergue.getNumeroYapePlin());
            stmt.setInt(15, albergue.getUserId());
            stmt.setInt(16, 3); // Suponiendo que el rolId de albergues es 3

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 4. Desactivar Cuenta del Albergue
    public boolean desactivarCuentaAlbergue(int albergueId) {
        String sql = "UPDATE usuarios SET estado_cuenta = 'eliminada' WHERE user_id = ? AND rol_id = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, albergueId);
            stmt.setInt(2, 3); // Suponiendo que el rolId de albergues es 3
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
