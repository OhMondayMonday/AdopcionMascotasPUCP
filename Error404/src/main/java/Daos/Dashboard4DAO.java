package Daos;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.*;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;

public class Dashboard4DAO extends BaseDao {

    // Método para obtener el nombre del administrador
    public String obtenerNombreAdministrador(int administradorId) {
        String sql = "SELECT nombre FROM usuarios WHERE user_id = ? AND rol_id = 4";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, administradorId);
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
    public String obtenerFotoPerfil(int administradorId) {
        String sql = """
                SELECT url_foto 
                FROM fotos 
                JOIN usuarios ON fotos.foto_id = usuarios.foto_id 
                WHERE user_id = ? AND rol_id = 4
                """;
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, administradorId);
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

// Donantes

    public int obtenerTotalDonantes() {
        String sql = """
        SELECT COUNT(DISTINCT p.user_id) AS total
        FROM publicaciones_donaciones pd
        JOIN publicaciones p ON pd.publicacion_id = p.publicacion_id;
    """;

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                int totalDonantes = rs.getInt("total");
                System.out.println("Total de donantes: " + totalDonantes); // Depuración
                return totalDonantes;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // Retorna 0 si no hay resultados
    }





    public List<Map<String, Object>> obtenerDonantesUltimosMeses(int meses) {
        String sql = """
        SELECT
            MONTH(fecha_recepcion_inicio) AS mes_num,
            MONTHNAME(fecha_recepcion_inicio) AS mes,
            COUNT(DISTINCT p.user_id) AS total
        FROM
            publicaciones_donaciones pd
        JOIN
            publicaciones p ON pd.publicacion_id = p.publicacion_id
        WHERE
            fecha_recepcion_inicio >= DATE_SUB(CURRENT_DATE, INTERVAL ? MONTH)
        GROUP BY
            YEAR(fecha_recepcion_inicio), MONTH(fecha_recepcion_inicio), MONTHNAME(fecha_recepcion_inicio)
        ORDER BY
            YEAR(fecha_recepcion_inicio) DESC, MONTH(fecha_recepcion_inicio) DESC;
    """;

        List<Map<String, Object>> resultados = new ArrayList<>();

        // Mapa para traducir los meses de inglés a español
        Map<String, String> mesesEnEspañol = new HashMap<>();
        mesesEnEspañol.put("January", "Enero");
        mesesEnEspañol.put("February", "Febrero");
        mesesEnEspañol.put("March", "Marzo");
        mesesEnEspañol.put("April", "Abril");
        mesesEnEspañol.put("May", "Mayo");
        mesesEnEspañol.put("June", "Junio");
        mesesEnEspañol.put("July", "Julio");
        mesesEnEspañol.put("August", "Agosto");
        mesesEnEspañol.put("September", "Septiembre");
        mesesEnEspañol.put("October", "Octubre");
        mesesEnEspañol.put("November", "Noviembre");
        mesesEnEspañol.put("December", "Diciembre");

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, meses); // Establece el parámetro meses
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String mesEnIngles = rs.getString("mes"); // Obtiene el mes en inglés
                    int totalDonantes = rs.getInt("total");

                    // Depuración
                    System.out.println("Mes: " + mesEnIngles + " - Total Donantes: " + totalDonantes);

                    Map<String, Object> dato = new HashMap<>();
                    String mesEnEspañolTraducido = mesesEnEspañol.getOrDefault(mesEnIngles, mesEnIngles); // Traduce a español

                    dato.put("mes", mesEnEspañolTraducido);  // Mes en español
                    dato.put("total", totalDonantes); // Total de donantes para ese mes
                    resultados.add(dato);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultados;
    }






    public double obtenerMontoTotalDonacionesMesActual() {
        // SQL para obtener el monto total de las donaciones de tipo "dinero" en los últimos 4 meses
        String sql = """
        SELECT SUM(COALESCE(pd.cantidad, 0)) AS total_donado
        FROM publicaciones_donaciones pd
        JOIN publicaciones p ON pd.publicacion_id = p.publicacion_id
        WHERE p.tipo_publicacion_id = 1  -- Tipo de publicación: Donación
        AND pd.tipo_donacion_id = 1      -- Tipo de donación: Dinero
        AND pd.cantidad IS NOT NULL
        AND pd.fecha_recepcion_inicio >= ?  -- Fecha inicio de los últimos 4 meses
        AND pd.fecha_recepcion_fin <= ?     -- Fecha fin de los últimos 4 meses
    """;

        // Obtener la fecha de inicio y fin de los últimos 4 meses
        LocalDate fechaFin = LocalDate.now();  // Fecha actual
        LocalDate fechaInicio = fechaFin.minusMonths(4);  // Fecha hace 4 meses

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            // Establecer las fechas de inicio y fin en el PreparedStatement
            ps.setDate(1, Date.valueOf(fechaInicio));
            ps.setDate(2, Date.valueOf(fechaFin));

            // Ejecutar la consulta y obtener el resultado
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Retornar el monto total donado en los últimos 4 meses
                    return rs.getDouble("total_donado");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();  // Manejo de excepciones
        }

        // Si no hay resultados o ocurre un error, retornar 0
        return 0.0;
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
    // Método para obtener mascotas perdidas por mes en los últimos meses
    public List<Map<String, Object>> obtenerMascotasPerdidasUltimosMeses(int meses) {
        String sql = """
        SELECT
            MONTH(fecha_perdida) AS mes_num,
            MONTHNAME(fecha_perdida) AS mes,
            COUNT(*) AS total
        FROM
            publicaciones_mascota_perdida
        WHERE
            mascota_encontrada = FALSE  -- Filtramos por las mascotas que están perdidas
            AND fecha_perdida >= DATE_SUB(CURDATE(), INTERVAL ? MONTH)
        GROUP BY
            YEAR(fecha_perdida), MONTH(fecha_perdida), MONTHNAME(fecha_perdida)
        ORDER BY
            YEAR(fecha_perdida) DESC, MONTH(fecha_perdida) DESC
    """;
        List<Map<String, Object>> resultados = new ArrayList<>();

        // Mapa para traducir los meses de inglés a español
        Map<String, String> mesesEnEspañol = new HashMap<>();
        mesesEnEspañol.put("January", "Enero");
        mesesEnEspañol.put("February", "Febrero");
        mesesEnEspañol.put("March", "Marzo");
        mesesEnEspañol.put("April", "Abril");
        mesesEnEspañol.put("May", "Mayo");
        mesesEnEspañol.put("June", "Junio");
        mesesEnEspañol.put("July", "Julio");
        mesesEnEspañol.put("August", "Agosto");
        mesesEnEspañol.put("September", "Septiembre");
        mesesEnEspañol.put("October", "Octubre");
        mesesEnEspañol.put("November", "Noviembre");
        mesesEnEspañol.put("December", "Diciembre");

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, meses); // Establece el parámetro meses
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> dato = new HashMap<>();
                    String mesEnIngles = rs.getString("mes"); // Obtiene el mes en inglés
                    String mesEnEspañol = mesesEnEspañol.getOrDefault(mesEnIngles, mesEnIngles); // Traduce a español

                    dato.put("mes", mesEnEspañol);  // Mes en español
                    dato.put("total", rs.getInt("total")); // Total de mascotas perdidas
                    resultados.add(dato);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultados;
    }



    // Método para obtener el total de mascotas encontradas en los últimos meses
    public int obtenerTotalMascotasEncontradasUltimosMeses(int meses) {
        String sql = """
                SELECT COUNT(*) AS total
                FROM publicaciones_mascota_perdida 
                WHERE mascota_encontrada = TRUE 
                AND fecha_perdida >= DATE_SUB(CURDATE(), INTERVAL ? MONTH)
                """;
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, meses); // Establece el parámetro meses
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("total");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Método para obtener mascotas encontradas por mes en los últimos meses
    public List<Map<String, Object>> obtenerMascotasEncontradasUltimosMeses(int meses) {
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

        // Mapa para traducir los meses de inglés a español
        // Mapa para traducir los meses de inglés a español
        Map<String, String> mesesEnEspañol = new HashMap<>();
        mesesEnEspañol.put("January", "Enero");
        mesesEnEspañol.put("February", "Febrero");
        mesesEnEspañol.put("March", "Marzo");
        mesesEnEspañol.put("April", "Abril");
        mesesEnEspañol.put("May", "Mayo");
        mesesEnEspañol.put("June", "Junio");
        mesesEnEspañol.put("July", "Julio");
        mesesEnEspañol.put("August", "Agosto");
        mesesEnEspañol.put("September", "Septiembre");
        mesesEnEspañol.put("October", "Octubre");
        mesesEnEspañol.put("November", "Noviembre");
        mesesEnEspañol.put("December", "Diciembre");

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, meses); // Establece el parámetro meses
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> dato = new HashMap<>();
                    String mesEnIngles = rs.getString("mes"); // Obtiene el mes en inglés
                    String mesEnEspañol = mesesEnEspañol.getOrDefault(mesEnIngles, mesEnIngles); // Traduce a español

                    dato.put("mes", mesEnEspañol);  // Mes en español
                    dato.put("total", rs.getInt("total")); // Total de mascotas encontradas
                    resultados.add(dato);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultados;
    }

    // Método para obtener los usuarios con más donaciones
    public List<Map<String, Object>> obtenerUsuariosConMasDonaciones() {
        String sql = """
        SELECT 
            u.nombre, 
            SUM(pd.cantidad) AS total_donado
        FROM 
            usuarios u
        JOIN 
            publicaciones_donaciones pd ON u.user_id = pd.user_id
        GROUP BY 
            u.user_id
        ORDER BY 
            total_donado DESC
        LIMIT 10
    """;

        List<Map<String, Object>> usuarios = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            // Recorremos los resultados y los añadimos a la lista
            while (rs.next()) {
                Map<String, Object> usuario = new HashMap<>();
                usuario.put("nombre", rs.getString("nombre"));
                usuario.put("total_donado", rs.getDouble("total_donado"));
                usuarios.add(usuario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usuarios;  // Retorna la lista de usuarios con más donaciones
    }

    // Método para obtener albergues con más donaciones
    public List<Map<String, Object>> obtenerAlberguesConMasDonaciones() {
        String sql = """
        SELECT 
            u.nombre_albergue, 
            SUM(pd.cantidad) AS total_donado
        FROM usuarios u
        JOIN publicaciones_donaciones pd ON u.user_id = pd.user_id
        WHERE u.rol_id = 2  -- Filtro para albergues
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
    public List<Map<String, String>> obtenerUltimasActualizaciones(int administradorId) {
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
                actualizacion.put("minutos_transcurridos", String.valueOf(rs.getInt("minutos_transcurridos")));
                actualizaciones.add(actualizacion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return actualizaciones;
    }
}
