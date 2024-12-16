package Daos;

import Beans.*;

import java.sql.*;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

public class HogarTemporalDAO extends BaseDao {



    public List<HogaresTemporales> filtrarHogaresConPaginacion(String palabraClave, String tipoMascota, String distrito, int start, int size) {
        List<HogaresTemporales> hogaresList = new ArrayList<>();
        String sql = "SELECT p.publicacion_id, p.titulo, p.descripcion, f.url_foto AS foto_url, " +
                "u.nombre AS nombre_usuario, u.apellido AS apellido_usuario, ht.tipo_mascotas, ht.distrito, " +
                "ht.estado_temporal, ht.descripcion AS hogar_descripcion, ht.celular, ht.direccion, ht.cantidad_mascotas " +
                "FROM publicaciones p " +
                "JOIN fotos f ON p.foto_id = f.foto_id " +
                "JOIN usuarios u ON p.user_id = u.user_id " +
                "JOIN hogares_temporales ht ON u.user_id = ht.user_id " +
                "WHERE p.tipo_publicacion_id = 2 AND p.estado_publicacion = 'activa' ";

        // Agregar condiciones dinámicas de los filtros
        if (palabraClave != null && !palabraClave.trim().isEmpty()) {
            sql += " AND (p.titulo LIKE ? OR p.descripcion LIKE ?)";
        }
        if (tipoMascota != null && !tipoMascota.equals("Todas")) {
            sql += " AND ht.tipo_mascotas = ?";
        }
        if (distrito != null && !distrito.equals("Todas")) {
            sql += " AND ht.distrito = ?";
        }

        // Agregar paginación
        sql += " LIMIT ?, ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            int parameterIndex = 1;

            // Setear parámetros dinámicos
            if (palabraClave != null && !palabraClave.trim().isEmpty()) {
                pstmt.setString(parameterIndex++, "%" + palabraClave + "%");
                pstmt.setString(parameterIndex++, "%" + palabraClave + "%");
            }
            if (tipoMascota != null && !tipoMascota.equals("Todas")) {
                pstmt.setString(parameterIndex++, tipoMascota);
            }
            if (distrito != null && !distrito.equals("Todas")) {
                pstmt.setString(parameterIndex++, distrito);
            }

            // Setear los parámetros de paginación
            pstmt.setInt(parameterIndex++, start);
            pstmt.setInt(parameterIndex, size);

            // Ejecutar la consulta
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    HogaresTemporales hogar = new HogaresTemporales();

                    // Mapear datos específicos de Hogares Temporales
                    hogar.setTemporalId(rs.getInt("publicacion_id"));
                    hogar.setTipoMascotas(rs.getString("tipo_mascotas"));
                    hogar.setEstadoTemporal(rs.getString("estado_temporal"));
                    hogar.setDescripcion(rs.getString("hogar_descripcion"));
                    hogar.setCelular(rs.getString("celular"));
                    hogar.setDireccion(rs.getString("direccion"));
                    hogar.setCantidadMascotas(rs.getInt("cantidad_mascotas"));

                    // Mapear datos de Publicaciones
                    Publicaciones publicacion = new Publicaciones();
                    publicacion.setTitulo(rs.getString("titulo"));
                    publicacion.setDescripcion(rs.getString("descripcion"));
                    hogar.setPublicacion(publicacion);

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
                    Distritos distritoObj = new Distritos();
                    distritoObj.setNombreDistrito(rs.getString("distrito"));
                    hogar.setDistrito(distritoObj);

                    // Agregar a la lista
                    hogaresList.add(hogar);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hogaresList;
    }

    public int contarTotalPublicacionesFiltradas(String palabraClave, String tipoMascota, String direccion) {
        String sql = "SELECT COUNT(*) AS total " +
                "FROM hogares_temporales ht " +
                "JOIN publicaciones p ON ht.user_id = p.user_id " +
                "WHERE p.tipo_publicacion_id = 2 AND p.estado_publicacion = 'activa' ";

        // Agregar condiciones dinámicas de los filtros
        if (palabraClave != null && !palabraClave.trim().isEmpty()) {
            sql += " AND (p.titulo LIKE ? OR p.descripcion LIKE ?)";
        }
        if (tipoMascota != null && !tipoMascota.equals("Todas")) {
            sql += " AND ht.tipo_mascotas = ?";
        }
        if (direccion != null && !direccion.equals("Todas")) {
            sql += " AND ht.direccion = ?";
        }

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            int parameterIndex = 1;

            // Setear parámetros dinámicos
            if (palabraClave != null && !palabraClave.trim().isEmpty()) {
                pstmt.setString(parameterIndex++, "%" + palabraClave + "%");
                pstmt.setString(parameterIndex++, "%" + palabraClave + "%");
            }
            if (tipoMascota != null && !tipoMascota.equals("Todas")) {
                pstmt.setString(parameterIndex++, tipoMascota);
            }
            if (direccion != null && !direccion.equals("Todas")) {
                pstmt.setString(parameterIndex++, direccion);
            }

            // Ejecutar la consulta
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("total");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // Retornar 0 si hay algún error o no se encuentran registros
    }


    public Usuarios obtenerUsuarioPorCredenciales(String username, String password) {
        Usuarios usuario = null;
        String sql = "SELECT * FROM usuarios WHERE username = ? AND password = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    usuario = new Usuarios();
                    usuario.setUserId(rs.getInt("user_id"));
                    usuario.setNombre(rs.getString("nombre"));
                    usuario.setApellido(rs.getString("apellido"));
                    usuario.setEmail(rs.getString("email"));
                    usuario.setDni(rs.getString("dni"));
                    usuario.setDireccion(rs.getString("direccion"));
                    // Asigna otros atributos si los necesitas
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }


}
