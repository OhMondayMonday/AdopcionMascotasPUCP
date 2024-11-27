package Daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Dashboard4DAO extends BaseDao {

    // Método para obtener el nombre del administrador
    public String obtenerNombreAdministrador(int adminitradorId) {
        String sql = "SELECT nombre FROM usuarios WHERE user_id = ? AND rol_id = 4";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, adminitradorId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("nombre");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Retorna null si no se encuentra el administrador
    }

    // Método para obtener la foto de perfil del administrador
    public String obtenerFotoPerfil(int adminitradorId) {
        String sql = """
                SELECT url_foto 
                FROM fotos 
                JOIN usuarios ON fotos.foto_id = usuarios.foto_id 
                WHERE user_id = ? AND rol_id = 4
                """;
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, adminitradorId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("url_foto");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "assets/img/default-profile.jpg"; // Ruta predeterminada si no se encuentra la foto
    }
    // Método para obtener el número total de donantes del mes actual
    public int obtenerNumeroDonantesMesActual() {
        String sql = """
            SELECT COUNT(*) AS total
            FROM publicaciones_donaciones
            WHERE fecha_recepcion_inicio >= DATE_FORMAT(NOW(), '%Y-%m-01') 
            AND fecha_recepcion_fin <= LAST_DAY(NOW())
        """;
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // Retorna 0 si no hay resultados
    }

    // Método para obtener el monto total de donaciones en el mes actual
    public double obtenerMontoTotalDonacionesMesActual() {
        String sql = """
            SELECT SUM(cantidad) AS total_donaciones
            FROM publicaciones_donaciones
            WHERE fecha_recepcion_inicio >= DATE_FORMAT(NOW(), '%Y-%m-01') 
            AND fecha_recepcion_fin <= LAST_DAY(NOW())
        """;
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getDouble("total_donaciones");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0.0; // Retorna 0 si no hay resultados
    }

    // Método para obtener el número de albergues registrados
    public int obtenerAlberguesRegistrados() {
        String sql = "SELECT COUNT(*) FROM usuarios WHERE rol_id = 2";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // Retorna 0 si no hay resultados
    }

    // Método para obtener el total de mascotas reportadas como perdidas
    public int obtenerTotalMascotasPerdidas() {
        String sql = """
                SELECT COUNT(*) 
                FROM publicaciones_mascota_perdida 
                WHERE mascota_encontrada = FALSE
                """;
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // Retorna 0 si no hay resultados
    }

    // Método para obtener el total de mascotas encontradas por mes
    public List<Map<String, Object>> obtenerMascotasEncontradasPorMes(int meses) {
        String sql = """
            SELECT
                MONTH(fecha_perdida) AS mes_num,
                MONTHNAME(fecha_perdida) AS mes,
                COUNT(*) AS total
            FROM
                publicaciones_mascota_perdida
            WHERE
                mascota_encontrada = TRUE
                AND fecha_perdida >= DATE_SUB(CURDATE(), INTERVAL ? MONTH)
            GROUP BY
                YEAR(fecha_perdida), MONTH(fecha_perdida), MONTHNAME(fecha_perdida)
            ORDER BY
                YEAR(fecha_perdida) DESC, MONTH(fecha_perdida) DESC
        """;
        List<Map<String, Object>> resultados = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, meses); // Establece el parámetro meses
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> dato = new HashMap<>();
                    dato.put("mes", rs.getString("mes"));
                    dato.put("total", rs.getInt("total"));
                    resultados.add(dato);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultados;
    }

    // Método para obtener usuarios con más donaciones
    public List<Map<String, Object>> obtenerUsuariosConMasDonaciones() {
        String sql = """
            SELECT 
                u.nombre, 
                SUM(pd.cantidad) AS total_donado
            FROM usuarios u
            JOIN publicaciones_donaciones pd ON u.user_id = pd.user_id
            GROUP BY u.user_id
            ORDER BY total_donado DESC
            LIMIT 10
        """;
        List<Map<String, Object>> usuarios = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Map<String, Object> usuario = new HashMap<>();
                usuario.put("nombre", rs.getString("nombre"));
                usuario.put("total_donado", rs.getDouble("total_donado"));
                usuarios.add(usuario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuarios;
    }

    // Método para obtener albergues con más donaciones
    public List<Map<String, Object>> obtenerAlberguesConMasDonaciones() {
        String sql = """
            SELECT 
                u.nombre_albergue, 
                SUM(pd.cantidad) AS total_donado
            FROM usuarios u
            JOIN publicaciones_donaciones pd ON u.user_id = pd.user_id
            WHERE u.rol_id = 2
            GROUP BY u.user_id
            ORDER BY total_donado DESC
            LIMIT 10
        """;
        List<Map<String, Object>> albergues = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Map<String, Object> albergue = new HashMap<>();
                albergue.put("nombre_albergue", rs.getString("nombre_albergue"));
                albergue.put("total_donado", rs.getDouble("total_donado"));
                albergues.add(albergue);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return albergues;
    }

    // Método para obtener las últimas actualizaciones
    public List<Map<String, String>> obtenerUltimasActualizaciones(int adminitradorId) {
        String sql = """
            SELECT descripcion, 
                   DATE_FORMAT(fecha, '%d/%m/%Y %H:%i:%s') AS fecha_formateada,
                   TIMESTAMPDIFF(MINUTE, fecha, NOW()) AS minutos_transcurridos
            FROM logs 
            ORDER BY fecha DESC 
            LIMIT 5
        """;
        List<Map<String, String>> actualizaciones = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Map<String, String> actualizacion = new HashMap<>();
                actualizacion.put("descripcion", rs.getString("descripcion"));
                actualizacion.put("fecha", rs.getString("fecha_formateada"));
                int minutos = rs.getInt("minutos_transcurridos");
                if (minutos < 60) {
                    actualizacion.put("tiempo", "Hace " + minutos + " minutos");
                } else if (minutos < 1440) {
                    actualizacion.put("tiempo", "Hace " + (minutos / 60) + " horas");
                } else {
                    actualizacion.put("tiempo", "Hace " + (minutos / 1440) + " días");
                }
                actualizaciones.add(actualizacion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return actualizaciones;
    }
}
