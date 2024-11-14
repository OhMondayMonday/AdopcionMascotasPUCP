package Daos;

import Beans.HogaresTemporales;
import Beans.Usuarios;
import Beans.Fotos;
import Beans.Distritos;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HogarTemporalDAO extends BaseDao {

    // Método para obtener todas las publicaciones activas de hogares temporales
    public List<HogaresTemporales> obtenerPublicacionesHogaresTemporales() {
        List<HogaresTemporales> hogares = new ArrayList<>();
        String query = "SELECT p.publicacion_id, p.titulo, p.descripcion, f.url_foto AS foto_url, " +
                "u.nombre AS nombre_usuario, ht.tipo_mascotas, ht.distrito, ht.estado_temporal " +
                "FROM publicaciones p " +
                "JOIN fotos f ON p.foto_id = f.foto_id " +
                "JOIN usuarios u ON p.user_id = u.user_id " +
                "JOIN hogares_temporales ht ON u.user_id = ht.user_id " +
                "WHERE p.tipo_publicacion_id = 2 AND p.estado_publicacion = 'activa'";

        try (Connection connection = getConnection();
             PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                HogaresTemporales hogar = new HogaresTemporales();
                hogar.setTemporalId(rs.getInt("publicacion_id"));
                hogar.setTipoMascotas(rs.getString("tipo_mascotas"));
                hogar.setEstadoTemporal(rs.getString("estado_temporal"));

                // Relación con el objeto Fotos
                Fotos foto = new Fotos();
                foto.setUrlFoto(rs.getString("foto_url"));
                hogar.setFoto(foto);

                // Relación con el objeto Usuarios
                Usuarios usuario = new Usuarios();
                usuario.setNombre(rs.getString("nombre_usuario"));
                hogar.setUsuario(usuario);

                // Relación con el objeto Distritos
                Distritos distrito = new Distritos();
                distrito.setNombreDistrito(rs.getString("distrito"));
                hogar.setDistrito(distrito);

                hogares.add(hogar);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hogares;
    }

    // Método para obtener detalles de una publicación de hogar temporal específica
    public HogaresTemporales obtenerDetallesHogarTemporal(int temporalId) {
        HogaresTemporales hogar = null;
        String query = "SELECT ht.temporal_id, ht.edad, ht.genero, ht.celular, ht.direccion, ht.distrito, " +
                "ht.cantidad_cuartos, ht.metraje_vivienda, ht.tiene_mascotas, ht.tipo_mascotas, " +
                "ht.persona_referencia, ht.contacto_referencia, ht.tiempo_temporal, ht.rango_fecha_inicio, " +
                "ht.rango_fecha_fin, ht.estado_temporal " +
                "FROM hogares_temporales ht " +
                "WHERE ht.temporal_id = ?";

        try (Connection connection = getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setInt(1, temporalId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                hogar = new HogaresTemporales();
                hogar.setTemporalId(rs.getInt("temporal_id"));
                hogar.setEdad(rs.getInt("edad"));
                hogar.setGenero(rs.getString("genero"));
                hogar.setCelular(rs.getString("celular"));
                hogar.setDireccion(rs.getString("direccion"));
                hogar.setCantidadCuartos(rs.getInt("cantidad_cuartos"));
                hogar.setMetrajeVivienda(rs.getDouble("metraje_vivienda"));
                hogar.setTieneMascotas(rs.getBoolean("tiene_mascotas"));
                hogar.setTipoMascotas(rs.getString("tipo_mascotas"));
                hogar.setPersonaReferencia(rs.getString("persona_referencia"));
                hogar.setContactoReferencia(rs.getString("contacto_referencia"));
                hogar.setTiempoTemporal(rs.getInt("tiempo_temporal"));
                hogar.setRangoFechaInicio(rs.getDate("rango_fecha_inicio"));
                hogar.setRangoFechaFin(rs.getDate("rango_fecha_fin"));
                hogar.setEstadoTemporal(rs.getString("estado_temporal"));
                // Relación con el objeto Distritos
                Distritos distrito = new Distritos();
                distrito.setNombreDistrito(rs.getString("distrito"));
                hogar.setDistrito(distrito);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hogar;
    }

    // Método para filtrar publicaciones de hogares temporales por tipo de mascota, palabra clave y ubicación
    public List<HogaresTemporales> filtrarPublicacionesHogares(String tipoMascota, String palabraClave, String ubicacion) {
        List<HogaresTemporales> hogares = new ArrayList<>();
        StringBuilder query = new StringBuilder(
                "SELECT p.publicacion_id, p.titulo, p.descripcion, f.url_foto AS foto_url, " +
                        "u.nombre AS nombre_usuario, ht.tipo_mascotas, ht.distrito, ht.estado_temporal " +
                        "FROM publicaciones p " +
                        "JOIN fotos f ON p.foto_id = f.foto_id " +
                        "JOIN usuarios u ON p.user_id = u.user_id " +
                        "JOIN hogares_temporales ht ON u.user_id = ht.user_id " +
                        "WHERE p.tipo_publicacion_id = 2 AND p.estado_publicacion = 'activa'"
        );

        if (tipoMascota != null && !tipoMascota.isEmpty()) {
            query.append(" AND ht.tipo_mascotas LIKE ?");
        }
        if (palabraClave != null && !palabraClave.isEmpty()) {
            query.append(" AND (p.titulo LIKE ? OR p.descripcion LIKE ?)");
        }
        if (ubicacion != null && !ubicacion.isEmpty()) {
            query.append(" AND ht.distrito = ?");
        }

        try (Connection connection = getConnection();
             PreparedStatement stmt = connection.prepareStatement(query.toString())) {

            int index = 1;
            if (tipoMascota != null && !tipoMascota.isEmpty()) {
                stmt.setString(index++, "%" + tipoMascota + "%");
            }
            if (palabraClave != null && !palabraClave.isEmpty()) {
                stmt.setString(index++, "%" + palabraClave + "%");
                stmt.setString(index++, "%" + palabraClave + "%");
            }
            if (ubicacion != null && !ubicacion.isEmpty()) {
                stmt.setString(index, ubicacion);
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                HogaresTemporales hogar = new HogaresTemporales();
                hogar.setTemporalId(rs.getInt("publicacion_id"));
                hogar.setTipoMascotas(rs.getString("tipo_mascotas"));
                hogar.setEstadoTemporal(rs.getString("estado_temporal"));

                // Relación con el objeto Fotos
                Fotos foto = new Fotos();
                foto.setUrlFoto(rs.getString("foto_url"));
                hogar.setFoto(foto);

                // Relación con el objeto Usuarios
                Usuarios usuario = new Usuarios();
                usuario.setNombre(rs.getString("nombre_usuario"));
                hogar.setUsuario(usuario);

                // Relación con el objeto Distritos
                Distritos distrito = new Distritos();
                distrito.setNombreDistrito(rs.getString("distrito"));
                hogar.setDistrito(distrito);
                hogares.add(hogar);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hogares;
    }
}
