package Daos;

import Beans.*;
import DTO.HogarTemporalDTO;
import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



public class CoordinadorDao extends BaseDao {

    private static final Logger logger = LoggerFactory.getLogger(CoordinadorDao.class);


    // 1. Obtener solicitudes de hogares temporales pendientes
    public List<Solicitudes> obtenerSolicitudesHogarPendientes() {
        List<Solicitudes> solicitudes = new ArrayList<>();
        String sql = "SELECT s.solicitud_id, ts.tipo_solicitud, u.nombre AS solicitante, s.fecha_solicitud, " +
                "COALESCE(m.nombre, '-') AS mascota " +
                "FROM solicitudes s " +
                "JOIN tipos_solicitudes ts ON s.tipo_solicitud_id = ts.tipo_solicitud_id " +
                "JOIN usuarios u ON s.solicitante_id = u.user_id " +
                "LEFT JOIN mascotas m ON s.mascota_id = m.mascota_id " +
                "WHERE s.estado_solicitud = 'pendiente' " +
                "AND ts.tipo_solicitud = 'hogar_temporal' " +
                "ORDER BY s.fecha_solicitud DESC";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Solicitudes solicitud = new Solicitudes();
                solicitud.setSolicitudId(rs.getInt("solicitud_id"));
                TiposSolicitudes tipoSolicitud = new TiposSolicitudes();
                tipoSolicitud.setTipoSolicitud(rs.getString("tipo_solicitud"));
                solicitud.setTipoSolicitud(tipoSolicitud);

                Usuarios solicitante = new Usuarios();
                solicitante.setNombre(rs.getString("solicitante"));
                solicitud.setSolicitante(solicitante);

                solicitud.setFechaSolicitud(rs.getString("fecha_solicitud"));

                Mascotas mascota = new Mascotas();
                mascota.setNombre(rs.getString("mascota"));
                solicitud.setMascota(mascota);

                solicitudes.add(solicitud);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return solicitudes;
    }

    // 2. Obtener solicitudes de publicaciones de mascotas perdidas pendientes
    public List<PublicacionesMascotaPerdida> obtenerSolicitudesPublicacionesPendientes() {
        List<PublicacionesMascotaPerdida> publicaciones = new ArrayList<>();
        String sql = "SELECT pmp.publicacion_id, m.nombre AS mascota, pmp.lugar_perdida, pmp.fecha_perdida, " +
                "u.nombre AS usuario, pub.estado_publicacion " +
                "FROM publicaciones_mascota_perdida pmp " +
                "JOIN publicaciones pub ON pmp.publicacion_id = pub.publicacion_id " +
                "JOIN mascotas m ON pmp.mascota_id = m.mascota_id " +
                "JOIN usuarios u ON pub.user_id = u.user_id " +
                "WHERE pub.estado_publicacion = 'pendiente' " +
                "ORDER BY pmp.fecha_perdida DESC";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                PublicacionesMascotaPerdida publicacion = new PublicacionesMascotaPerdida();
                publicacion.setPublicacion_id(rs.getInt("publicacion_id"));

                Mascotas mascota = new Mascotas();
                mascota.setNombre(rs.getString("mascota"));
                publicacion.setMascota(mascota);

                publicacion.setLugarPerdida(rs.getString("lugar_perdida"));
                publicacion.setFechaPerdida(rs.getDate("fecha_perdida"));

                Usuarios usuario = new Usuarios();
                usuario.setNombre(rs.getString("usuario"));
                publicacion.setUsuarios(usuario);

                publicaciones.add(publicacion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publicaciones;
    }


    // 3. Aprobar solicitud de hogar temporal
    public boolean aprobarSolicitudHogar(int solicitudId) {
        String sql = "UPDATE solicitudes SET estado_solicitud = 'aprobada', fecha_entrega = NOW() " +
                "WHERE solicitud_id = ? AND estado_solicitud = 'pendiente'";

        try (Connection conn = this.getConnection()) {
            conn.setAutoCommit(false);  // Iniciar transacción

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, solicitudId);
                int filasAfectadas = stmt.executeUpdate();

                if (filasAfectadas > 0) {
                    conn.commit();  // Confirmar transacción si la actualización fue exitosa
                    logger.info("Solicitud {} aprobada exitosamente.", solicitudId);
                    return true;
                } else {
                    conn.rollback();  // Revertir cambios si no se actualizó ninguna fila
                    return false;
                }
            } catch (SQLException e) {
                conn.rollback();  // Revertir cambios en caso de error
                logger.error("Error al aprobar la solicitud de hogar: {}", e.getMessage(), e);
                return false;
            }
        } catch (SQLException e) {
            logger.error("Error al iniciar la conexión para aprobar la solicitud de hogar: {}", e.getMessage(), e);
            return false;
        }
    }


    // 4. Rechazar solicitud de hogar temporal
    public boolean rechazarSolicitudHogar(int solicitudId) {
        String sql = "UPDATE hogares_temporales ht " +
                "SET ht.estado_temporal = 'rechazada', ht.fecha_rechazo = NOW() " +
                "WHERE ht.temporal_id = (SELECT s.temporal_id FROM solicitudes s WHERE s.solicitud_id = ?) " +
                "AND ht.estado_temporal = 'pendiente'";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, solicitudId);  // Setear el ID de la solicitud

            // Ejecutar la actualización
            int filasAfectadas = stmt.executeUpdate();
            return filasAfectadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }



    // 5. Aprobar publicación de mascota perdida
    public boolean aprobarPublicacionMascota(int publicacionId) {
        String sql = "UPDATE publicaciones SET estado_publicacion = 'activa' " +
                "WHERE publicacion_id = ? AND estado_publicacion = 'pendiente'";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, publicacionId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    // 6. Rechazar publicación de mascota perdida
    public boolean rechazarPublicacionMascota(int publicacionId) {
        String sql = "UPDATE publicaciones SET estado_publicacion = 'rechazada', fecha_creacion = NOW() " +
                "WHERE publicacion_id = ? AND estado_publicacion = 'pendiente'";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Asignar el parámetro publicacionId
            stmt.setInt(1, publicacionId);

            // Ejecutar la actualización
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error al rechazar la publicación de mascota perdida: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }


    // 8. Baneo manual de un hogar temporal
    public boolean banearHogarTemporalManual(int temporalId) {
        String sql = "UPDATE hogares_temporales SET estado_temporal = 'suspendida' WHERE temporal_id = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, temporalId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 9. Baneo automático si un usuario ha sido rechazado 3 veces
    public boolean banearUsuarioPorRechazos() {
        String sql = "UPDATE usuarios " +
                "SET estado_cuenta = 'suspendida' " +
                "WHERE user_id IN ( " +
                "    SELECT solicitante_id " +
                "    FROM solicitudes " +
                "    WHERE tipo_solicitud_id = 1 " +
                "    AND estado_solicitud = 'rechazada' " +
                "    GROUP BY solicitante_id " +
                "    HAVING COUNT(*) >= 3 " +
                ")";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 7. Obtener los 5 comentarios más recientes del coordinador
    public List<Comentarios> obtenerComentariosRecientes(int publicacionId) {
        List<Comentarios> comentarios = new ArrayList<>();
        String sql = "SELECT c.comentario, c.fecha_actualizacion " +
                "FROM comentarios c " +
                "JOIN usuarios u ON c.usuario_id = u.user_id " +
                "JOIN roles r ON u.rol_id = r.rol_id " +
                "WHERE r.nombre_rol = 'coordinador' " +
                "AND c.publicacion_id = ? " +
                "ORDER BY c.fecha_actualizacion DESC " +
                "LIMIT 5";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, publicacionId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Comentarios comentario = new Comentarios();
                comentario.setComentario(rs.getString("comentario"));
                comentario.setFechaActualizacion(rs.getTimestamp("fecha_actualizacion"));
                comentarios.add(comentario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comentarios;
    }

    public List<Solicitudes> obtenerTodasLasSolicitudesHogar() {
        List<Solicitudes> solicitudes = new ArrayList<>();
        String sql = "SELECT s.solicitud_id, ts.tipo_solicitud, u.nombre AS solicitante, s.fecha_solicitud, " +
                "s.estado_solicitud, COALESCE(m.nombre, '-') AS mascota " +
                "FROM solicitudes s " +
                "JOIN tipos_solicitudes ts ON s.tipo_solicitud_id = ts.tipo_solicitud_id " +
                "JOIN usuarios u ON s.solicitante_id = u.user_id " +
                "LEFT JOIN mascotas m ON s.mascota_id = m.mascota_id " +
                "ORDER BY s.fecha_solicitud DESC";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Solicitudes solicitud = new Solicitudes();
                solicitud.setSolicitudId(rs.getInt("solicitud_id"));

                TiposSolicitudes tipoSolicitud = new TiposSolicitudes();
                tipoSolicitud.setTipoSolicitud(rs.getString("tipo_solicitud"));
                solicitud.setTipoSolicitud(tipoSolicitud);

                Usuarios solicitante = new Usuarios();
                solicitante.setNombre(rs.getString("solicitante"));
                solicitud.setSolicitante(solicitante);

                solicitud.setFechaSolicitud(rs.getString("fecha_solicitud"));
                solicitud.setEstadoSolicitud(rs.getString("estado_solicitud"));

                Mascotas mascota = new Mascotas();
                mascota.setNombre(rs.getString("mascota"));
                solicitud.setMascota(mascota);

                solicitudes.add(solicitud);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return solicitudes;
    }


    public List<HogarTemporalDTO> obtenerSolicitudesHogarPaginadas(int offset, int pageSize, int coordinadorId) {
        List<HogarTemporalDTO> hogaresTemporalesDTO = new ArrayList<>();
        String sql = "SELECT ht.temporal_id, ht.direccion, ht.distrito_id, d.nombre_distrito, " +
                "z.nombre_zona, u.nombre AS usuario_nombre, u.apellido AS usuario_apellido, " +
                "ht.edad, ht.genero, ht.celular, ht.estado_temporal, s.fecha_solicitud, ts.tipo_solicitud, " +
                "m.nombre AS mascota_nombre " +  // Nombre de la mascota
                "FROM hogares_temporales ht " +
                "JOIN distritos d ON ht.distrito_id = d.distrito_id " +
                "JOIN zonas z ON d.zona_distrito_id = z.zona_id " +
                "JOIN usuarios u ON u.zona_id = z.zona_id " +
                "JOIN solicitudes s ON s.temporal_id = ht.temporal_id " +
                "JOIN tipos_solicitudes ts ON ts.tipo_solicitud_id = s.tipo_solicitud_id " +
                "LEFT JOIN mascotas m ON s.mascota_id = m.mascota_id " +  // LEFT JOIN con la tabla mascotas
                "WHERE z.zona_id = (SELECT zona_id FROM usuarios WHERE user_id = ?) " +  // Relación con zona_id del coordinador
                "ORDER BY ht.temporal_id DESC " + // Ordenar por temporal_id
                "LIMIT ? OFFSET ?"; // Paginación

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Setear parámetros
            stmt.setInt(1, coordinadorId);  // ID del coordinador
            stmt.setInt(2, pageSize);        // Número de elementos por página
            stmt.setInt(3, offset);          // Desplazamiento para la paginación

            // Ejecutar consulta
            try (ResultSet resultSet = stmt.executeQuery()) {
                while (resultSet.next()) {
                    // Crear el DTO con los valores de la consulta
                    HogarTemporalDTO hogarDTO = new HogarTemporalDTO(
                            resultSet.getInt("temporal_id"),           // ID del hogar
                            resultSet.getString("usuario_nombre"),     // Nombre del usuario
                            resultSet.getString("usuario_apellido"),   // Apellido del usuario
                            resultSet.getString("direccion"),          // Dirección
                            resultSet.getString("estado_temporal"),    // Estado del hogar temporal
                            resultSet.getDate("fecha_solicitud"),      // Fecha de solicitud
                            resultSet.getString("tipo_solicitud"),     // Tipo de solicitud
                            resultSet.getInt("edad"),                  // Edad
                            resultSet.getString("genero"),             // Género
                            resultSet.getString("celular"),            // Celular
                            resultSet.getString("mascota_nombre")      // Nombre de la mascota (si existe)
                    );

                    // Agregar el DTO a la lista
                    hogaresTemporalesDTO.add(hogarDTO);
                }
            }
        } catch (SQLException e) {
            // Manejo de errores
            logger.error("Error al obtener solicitudes de hogares temporales para el coordinador {}", coordinadorId, e);
            throw new RuntimeException("Error al obtener solicitudes de hogares temporales", e);
        }

        logger.debug("Tamaño de la lista hogaresTemporalesDTO: {}", hogaresTemporalesDTO.size());
        return hogaresTemporalesDTO;
    }



    public int contarTotalHogaresTemporales(int coordinadorId) {
        int total = 0;
        String sql = "SELECT COUNT(*) AS total " +
                "FROM hogares_temporales ht " +
                "JOIN distritos d ON ht.distrito_id = d.distrito_id " +
                "JOIN zonas z ON d.zona_distrito_id = z.zona_id " +
                "WHERE z.zona_id = (SELECT zona_id FROM usuarios WHERE user_id = ?)";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, coordinadorId);  // Filtrar por el ID del coordinador

            try (ResultSet resultSet = stmt.executeQuery()) {
                if (resultSet.next()) {
                    total = resultSet.getInt("total");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    // 10. Editar perfil de coordinador
    public boolean registrarCoordinador(Usuarios coordinador) {
        // Aquí la consulta SQL se ajusta para registrar el coordinador con la zona
        String sql = "INSERT INTO usuarios (username, contrasenia, nombre, apellido, email, DNI, direccion, " +
                "estado_cuenta, rol_id, fecha_registro, numero_yape_plin, zona_id) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), ?, ?)";  // Se agrega zona_id

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, coordinador.getUsername());
            stmt.setString(2, coordinador.getContrasenia());
            stmt.setString(3, coordinador.getNombre());
            stmt.setString(4, coordinador.getApellido());
            stmt.setString(5, coordinador.getEmail());
            stmt.setString(6, coordinador.getDni());
            stmt.setString(7, coordinador.getDireccion());

            // Estado inicial "pendiente"
            stmt.setString(8, "pendiente");

            // Rol de coordinador (supongo que el rol es 3)
            stmt.setInt(9, coordinador.getRol().getRolId());

            // Fecha de registro
            if (coordinador.getFechaRegistro() == null) {
                coordinador.setFechaRegistro(new Timestamp(System.currentTimeMillis())); // Asignar fecha actual si no está definida
            }
            stmt.setTimestamp(10, coordinador.getFechaRegistro());

            stmt.setString(11, coordinador.getNumeroYapePlin());

            // Asignar la zona_id directamente (sin usar distritos)
            if (coordinador.getZona() != null) {
                stmt.setInt(12, coordinador.getZona().getZonaId()); // Asignar zona_id del coordinador
            } else {
                stmt.setNull(12, java.sql.Types.INTEGER);  // Asignar null si la zona no está definida
            }

            // Ejecutar la inserción
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    public Usuarios obtenerInformacionCoordinador(int coordinadorId) {
        String sql = "SELECT user_id, username, nombre, apellido, email, direccion, estado_cuenta, " +
                "numero_yape_plin, zona_id, fecha_registro " +  // Cambio aquí: zona_id en vez de distrito_id
                "FROM usuarios WHERE user_id = ? AND rol_id = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, coordinadorId);
            stmt.setInt(2, 3); // Suponiendo que el rolId de coordinadores es 3
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Usuarios coordinador = new Usuarios();
                coordinador.setUserId(rs.getInt("user_id"));
                coordinador.setUsername(rs.getString("username"));
                coordinador.setNombre(rs.getString("nombre"));
                coordinador.setApellido(rs.getString("apellido"));
                coordinador.setEmail(rs.getString("email"));
                coordinador.setDireccion(rs.getString("direccion"));
                coordinador.setEstadoCuenta(rs.getString("estado_cuenta"));
                coordinador.setNumeroYapePlin(rs.getString("numero_yape_plin"));

                // Obtener la fecha de registro
                Timestamp fechaRegistro = rs.getTimestamp("fecha_registro");
                coordinador.setFechaRegistro(fechaRegistro);

                // Asignar Zona si está disponible
                Beans.Zonas zona = new Beans.Zonas();
                zona.setZonaId(rs.getInt("zona_id")); // Asignamos el zona_id en lugar de distrito_id
                coordinador.setZona(zona);

                return coordinador;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public boolean actualizarInformacionCoordinador(Usuarios coordinador) {
        // Actualización de zona en lugar de distrito
        String sql = "UPDATE usuarios SET username = ?, nombre = ?, apellido = ?, email = ?, direccion = ?, zona_id = ?, numero_yape_plin = ? " +
                "WHERE user_id = ? AND rol_id = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Imprimir los valores para depuración
            System.out.println("Actualizando el coordinador con los siguientes datos:");
            System.out.println("Username: " + coordinador.getUsername());
            System.out.println("Nombre: " + coordinador.getNombre());
            System.out.println("Apellido: " + coordinador.getApellido());
            System.out.println("Email: " + coordinador.getEmail());
            System.out.println("Dirección: " + coordinador.getDireccion());
            System.out.println("Zona ID: " + (coordinador.getZona() != null ? coordinador.getZona().getZonaId() : "No asignada"));
            System.out.println("Yape Plin: " + coordinador.getNumeroYapePlin());

            stmt.setString(1, coordinador.getUsername());
            stmt.setString(2, coordinador.getNombre());
            stmt.setString(3, coordinador.getApellido());
            stmt.setString(4, coordinador.getEmail());
            stmt.setString(5, coordinador.getDireccion());

            // Aquí cambiamos de distrito_id a zona_id
            if (coordinador.getZona() != null) {
                stmt.setInt(6, coordinador.getZona().getZonaId()); // Usamos zona_id
            } else {
                stmt.setNull(6, java.sql.Types.INTEGER); // Si la zona es nula, insertamos un valor nulo
            }

            stmt.setString(7, coordinador.getNumeroYapePlin());
            stmt.setInt(8, coordinador.getUserId());
            stmt.setInt(9, 3); // Suponiendo que el rolId de coordinadores es 3

            // Verificar si la actualización fue exitosa
            int filasAfectadas = stmt.executeUpdate();
            if (filasAfectadas > 0) {
                System.out.println("Actualización exitosa.");
            } else {
                System.out.println("No se actualizaron filas.");
            }
            return filasAfectadas > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    public List<Distritos> obtenerDistritosPorZona(int zonaId) {
        List<Distritos> distritos = new ArrayList<>();
        String sql = "SELECT distrito_id, nombre_distrito FROM distritos WHERE zona_distrito_id = ?";  // Filtrar distritos por zona_id

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, zonaId);  // Usamos el ID de zona para obtener los distritos relacionados
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Distritos distrito = new Distritos();
                distrito.setDistritoId(rs.getInt("distrito_id"));
                distrito.setNombreDistrito(rs.getString("nombre_distrito"));
                distritos.add(distrito);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return distritos;
    }


    // Método para obtener todas las zonas (necesario para el formulario)
    public List<Zonas> obtenerZonas() {
        List<Zonas> zonas = new ArrayList<>();
        String sql = "SELECT zona_id, nombre_zona FROM zonas";  // Consulta para obtener todas las zonas

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Zonas zona = new Zonas();
                zona.setZonaId(rs.getInt("zona_id"));
                zona.setNombreZona(rs.getString("nombre_zona"));
                zonas.add(zona);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return zonas;
    }


}
