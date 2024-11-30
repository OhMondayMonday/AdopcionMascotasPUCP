package Daos;

import Beans.HogaresTemporales;
import Beans.Publicaciones;
import Beans.Usuarios;
import Beans.Fotos;
import Beans.Distritos;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HogarTemporalDAO extends BaseDao {



    public List<HogaresTemporales> obtenerPublicacionesPaginadas(Integer start, Integer size) {
        List<HogaresTemporales> hogares = new ArrayList<>();
        String query = "SELECT p.publicacion_id, p.titulo, p.descripcion, f.url_foto AS foto_url, " +
                "u.nombre AS nombre_usuario, u.apellido AS apellido_usuario, ht.tipo_mascotas, ht.distrito, " +
                "ht.estado_temporal AS hogar_descripcion, ht.celular, ht.direccion, ht.cantidad_mascotas " +
                "FROM publicaciones p " +
                "JOIN fotos f ON p.foto_id = f.foto_id " +
                "JOIN usuarios u ON p.user_id = u.user_id " +
                "JOIN hogares_temporales ht ON u.user_id = ht.user_id " +
                "WHERE p.tipo_publicacion_id = 2 AND p.estado_publicacion = 'activa' " +
                "LIMIT ?, ?";

        // Validar los parámetros
        if (start == null || start < 0 || size == null || size <= 0) {
            throw new IllegalArgumentException("Los parámetros de paginación no son válidos.");
        }

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, start); // Desde qué registro comenzar
            pstmt.setInt(2, size); // Cuántos registros obtener

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    HogaresTemporales hogar = new HogaresTemporales();
                    hogar.setTemporalId(rs.getInt("publicacion_id"));
                    hogar.setTipoMascotas(rs.getString("tipo_mascotas"));
                    hogar.setEstadoTemporal(rs.getString("estado_temporal"));
                    // hogar.setDescripcion(rs.getString("hogar_descripcion"));
                    hogar.setCelular(rs.getString("celular"));
                    hogar.setDireccion(rs.getString("direccion"));
                    hogar.setCantidadMascotas(rs.getInt("cantidad_mascotas"));

                    Publicaciones publicacion = new Publicaciones();
                    publicacion.setDescripcion(rs.getString("descripcion"));
                    publicacion.setTitulo(rs.getString("titulo"));
                    // hogar.setPublicacion(publicacion);

                    // Relación con el objeto Fotos
                    Fotos foto = new Fotos();
                    foto.setUrlFoto(rs.getString("foto_url"));
                    hogar.setFoto(foto);

                    // Relación con el objeto Usuarios
                    Usuarios usuario = new Usuarios();
                    usuario.setNombre(rs.getString("nombre_usuario"));
                    usuario.setApellido(rs.getString("apellido_usuario"));
                    hogar.setUsuario(usuario);

                    // Relación con el objeto Distritos
                    Distritos distrito = new Distritos();
                    distrito.setNombreDistrito(rs.getString("distrito"));
                    hogar.setDistrito(distrito);


                    hogares.add(hogar);

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return hogares;
    }

    public int contarTotalPublicaciones() {
        String sql = "SELECT COUNT(*) AS total FROM publicaciones p " +
                "JOIN hogares_temporales ht ON p.user_id = ht.user_id " +
                "WHERE p.tipo_publicacion_id = 2 AND p.estado_publicacion = 'activa'";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error al contar las publicaciones activas", e);
        }

        return 0; // Retornar 0 si hay algún error o no se encuentran registros
    }

}
