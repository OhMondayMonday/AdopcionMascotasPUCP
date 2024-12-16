package Daos;

import Beans.Fotos;
import Beans.Publicaciones;
import Beans.Usuarios;
import Beans.TiposPublicaciones;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Aprobar2DAO extends BaseDao {

    /**
     * Genera filtros dinámicos en la consulta SQL basados en los parámetros de búsqueda.
     */
    private String agregarFiltrosDinamicos(String palabraClave, String tipoPublicacion, String fechaFiltro) {
        StringBuilder filtros = new StringBuilder();

        if (palabraClave != null && !palabraClave.trim().isEmpty()) {
            filtros.append(" AND (p.titulo LIKE ? OR p.descripcion LIKE ?)");
        }
        if (tipoPublicacion != null && !tipoPublicacion.trim().isEmpty() && !tipoPublicacion.equalsIgnoreCase("Todas")) {
            filtros.append(" AND tp.tipo_publicacion = ?");
        }
        if (fechaFiltro != null && !fechaFiltro.trim().isEmpty() && !fechaFiltro.equalsIgnoreCase("Todas")) {
            filtros.append(fechaFiltroQuery(fechaFiltro));
        }

        return filtros.toString();
    }


    /**
     * Genera condiciones para el filtro de fecha.
     */
    private String fechaFiltroQuery(String fechaFiltro) {
        switch (fechaFiltro) {
            case "Ultimas 24 horas":
                return " AND p.fecha_creacion >= NOW() - INTERVAL 1 DAY";
            case "Ultima semana":
                return " AND p.fecha_creacion >= NOW() - INTERVAL 7 DAY";
            case "Ultimo mes":
                return " AND p.fecha_creacion >= NOW() - INTERVAL 1 MONTH";
            case "Ultimo año":
                return " AND p.fecha_creacion >= NOW() - INTERVAL 1 YEAR";
            default:
                return "";
        }
    }

    /**
     * Obtiene una lista de publicaciones con filtros aplicados y paginación.
     */
    public List<Publicaciones> obtenerPublicacionesFiltradas(String palabraClave, String tipoPublicacion, String fechaFiltro, int start, int pageSize) {
        List<Publicaciones> publicacionesList = new ArrayList<>();

        String baseQuery = "SELECT p.publicacion_id, " +
                "       p.titulo, " +
                "       p.descripcion, " +
                "       p.fecha_creacion, " +
                "       p.estado_publicacion, " +
                "       CASE " +
                "           WHEN p.tipo_publicacion_id IN (2, 3) THEN u.nombre_albergue " +
                "           WHEN p.tipo_publicacion_id IN (4, 5) THEN CONCAT(u.nombre, ' ', u.apellido) " +
                "           WHEN p.tipo_publicacion_id = 1 THEN NULL " +
                "           ELSE 'null' " +
                "       END AS informacion_usuario, " +
                "       f.url_foto, " +
                "       tp.tipo_publicacion " +
                "FROM publicaciones p " +
                "JOIN usuarios u ON p.user_id = u.user_id " +
                "JOIN tipos_publicaciones tp ON p.tipo_publicacion_id = tp.tipo_publicacion_id " +
                "LEFT JOIN fotos f ON p.foto_id = f.foto_id " +
                "WHERE p.estado_publicacion = 'pendiente'";

        String filtrosDinamicos = agregarFiltrosDinamicos(palabraClave, tipoPublicacion, fechaFiltro);
        String sql = baseQuery + filtrosDinamicos + " LIMIT ?, ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            int index = setearParametros(pstmt, palabraClave, tipoPublicacion, fechaFiltro);
            pstmt.setInt(index++, Math.max(0, start));
            pstmt.setInt(index, Math.max(1, pageSize));

            System.out.println("SQL Generado: " + sql);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Publicaciones publicacion = new Publicaciones();

                    // Datos generales de la publicación
                    publicacion.setPublicacionId(rs.getInt("publicacion_id"));
                    publicacion.setTitulo(rs.getString("titulo"));
                    publicacion.setDescripcion(rs.getString("descripcion"));
                    publicacion.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
                    publicacion.setEstadoPublicacion(rs.getString("estado_publicacion"));

                    // Foto
                    Fotos foto = new Fotos();
                    foto.setUrlFoto(rs.getString("url_foto") != null ? rs.getString("url_foto") : "/assets/img/default.jpg");
                    publicacion.setFoto(foto);

                    // Información del usuario
                    Usuarios usuario = new Usuarios();
                    String tipoPublicacionActual = rs.getString("tipo_publicacion");
                    String infoUsuario = rs.getString("informacion_usuario");

                    if ("Normal".equals(tipoPublicacionActual)) {
                        usuario.setNombre("N/A");
                    } else if ("Adopcion".equals(tipoPublicacionActual) || "Donaciones".equals(tipoPublicacionActual)) {
                        usuario.setNombreAlbergue(infoUsuario != null ? infoUsuario : "null");
                    } else if ("Mascota Perdida".equals(tipoPublicacionActual) || "Denuncia Maltrato".equals(tipoPublicacionActual)) {
                        String[] nombreCompleto = infoUsuario != null ? infoUsuario.split(" ", 2) : new String[]{"null", "null"};
                        usuario.setNombre(nombreCompleto.length > 0 ? nombreCompleto[0] : "null");
                        usuario.setApellido(nombreCompleto.length > 1 ? nombreCompleto[1] : "null");
                    }
                    publicacion.setUsuario(usuario);

                    // Configurar tipo de publicación en el Bean TiposPublicaciones
                    TiposPublicaciones tipo = new TiposPublicaciones();
                    tipo.setTipoPublicacion(rs.getString("tipo_publicacion"));
                    publicacion.setTipoPublicacion(tipo);

                    publicacionesList.add(publicacion);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error en obtenerPublicacionesFiltradas: " + e.getMessage());
            e.printStackTrace();
        }
        return publicacionesList;
    }





    /**
     * Cuenta el total de publicaciones filtradas.
     */
    public int contarPublicacionesFiltradas(String palabraClave, String tipoPublicacion, String fechaFiltro) {
        String baseQuery = "SELECT COUNT(*) AS total " +
                "FROM publicaciones p " +
                "JOIN tipos_publicaciones tp ON p.tipo_publicacion_id = tp.tipo_publicacion_id " +
                "WHERE p.estado_publicacion = 'pendiente'";

        // Generar la consulta SQL con filtros dinámicos
        String sql = baseQuery + agregarFiltrosDinamicos(palabraClave, tipoPublicacion, fechaFiltro);

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Configurar parámetros solo si hay filtros dinámicos
            if (sql.contains("?")) {
                setearParametros(pstmt, palabraClave, tipoPublicacion, fechaFiltro);
            }

            System.out.println("SQL Contar: " + sql);

            // Ejecutar la consulta
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("total");
                }
            }
        } catch (SQLException e) {
            System.err.println("Error en contarPublicacionesFiltradas: " + e.getMessage());
            e.printStackTrace();
        }
        return 0;
    }


    /**
     * Configura los parámetros para el PreparedStatement.
     */
    private int setearParametros(PreparedStatement pstmt, String palabraClave, String tipoPublicacion, String fechaFiltro) throws SQLException {
        int index = 1;

        if (palabraClave != null && !palabraClave.trim().isEmpty()) {
            pstmt.setString(index++, "%" + palabraClave + "%");
            pstmt.setString(index++, "%" + palabraClave + "%");
        }
        if (tipoPublicacion != null && !tipoPublicacion.trim().isEmpty() && !tipoPublicacion.equalsIgnoreCase("Todas")) {
            pstmt.setString(index++, tipoPublicacion);
        }
        return index;
    }



    /**
     * Cambia el estado de una publicación a 'activa'.
     */
    public boolean aprobarPublicacion(int publicacionId) {
        String sql = "UPDATE publicaciones SET estado_publicacion = 'activa' WHERE publicacion_id = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, publicacionId);
            return pstmt.executeUpdate() > 0;

        } catch (SQLException e) {
            System.err.println("Error en aprobarPublicacion: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
}
