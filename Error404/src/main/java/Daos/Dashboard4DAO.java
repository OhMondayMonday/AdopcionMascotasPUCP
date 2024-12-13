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
        // SQL para obtener el monto total de las donaciones de cualquier tipo en los últimos 4 meses
        String sql = """
    SELECT SUM(COALESCE(pd.cantidad, 0)) AS total_donado
    FROM publicaciones_donaciones pd
    JOIN publicaciones p ON pd.publicacion_id = p.publicacion_id
    WHERE pd.cantidad IS NOT NULL
    AND pd.fecha_recepcion_inicio >= CURDATE() - INTERVAL 4 MONTH;
    """;

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

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

    public double obtenerMontoTotalDonacionesHoy() {
        // SQL para obtener el monto total de las donaciones realizadas hoy
        String sql = """
        SELECT SUM(COALESCE(pd.cantidad, 0)) AS total_donado_hoy
        FROM publicaciones_donaciones pd
        JOIN publicaciones p ON pd.publicacion_id = p.publicacion_id
        WHERE pd.cantidad IS NOT NULL
        AND pd.fecha_recepcion_inicio = CURDATE();
    """;

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            // Ejecutar la consulta y obtener el resultado
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Retornar el monto total donado hoy
                    return rs.getDouble("total_donado_hoy");
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

    public List<Map<String, Object>> obtenerDonantesConMasDonaciones() {
        String sql = """
    SELECT 
        u.nombre, 
        u.foto_id, 
        SUM(pd.cantidad) AS total_donado,
        (SUM(pd.cantidad) / (SELECT SUM(cantidad) FROM publicaciones_donaciones)) * 100 AS porcentaje_total
    FROM 
        publicaciones_donaciones pd
    JOIN 
        publicaciones p ON pd.publicacion_id = p.publicacion_id
    JOIN 
        usuarios u ON p.user_id = u.user_id
    WHERE 
        pd.cantidad IS NOT NULL
    GROUP BY 
        u.user_id
    ORDER BY 
        total_donado DESC;
    """;

        List<Map<String, Object>> resultados = new ArrayList<>();

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            // Depuración: Imprimir la consulta SQL ejecutada
            System.out.println("Ejecutando consulta SQL para obtener los donantes con más donaciones: " + sql);

            while (rs.next()) {
                Map<String, Object> dato = new HashMap<>();
                dato.put("nombre", rs.getString("nombre"));
                dato.put("foto_id", rs.getInt("foto_id"));
                dato.put("total_donado", rs.getDouble("total_donado"));
                dato.put("porcentaje_total", rs.getDouble("porcentaje_total"));
                resultados.add(dato);

                // Depuración: Mostrar los resultados de cada fila
                System.out.println("Donante: " + rs.getString("nombre") + ", Total Donado: " + rs.getDouble("total_donado") + ", Porcentaje Total: " + rs.getDouble("porcentaje_total"));
            }
        } catch (SQLException e) {
            // Depuración: Mostrar el error de SQL
            System.err.println("Error al ejecutar la consulta SQL para obtener los donantes con más donaciones: " + e.getMessage());
            e.printStackTrace();
        }
        return resultados;
    }

    public List<Map<String, Object>> obtenerAlberguesConMasDonaciones() {
        String sql = """
    SELECT 
        u.nombre_albergue, 
        u.foto_id, 
        SUM(pd.cantidad) AS total_donado,
        (SUM(pd.cantidad) / (SELECT SUM(cantidad) FROM publicaciones_donaciones)) * 100 AS porcentaje_total
    FROM 
        publicaciones_donaciones pd
    JOIN 
        publicaciones p ON pd.publicacion_id = p.publicacion_id
    JOIN 
        usuarios u ON p.user_id = u.user_id
    WHERE 
        u.nombre_albergue IS NOT NULL
    GROUP BY 
        u.nombre_albergue, u.foto_id
    ORDER BY 
        total_donado DESC
    LIMIT 7;
    """;

        List<Map<String, Object>> resultados = new ArrayList<>();

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            // Depuración: Imprimir la consulta SQL ejecutada
            System.out.println("Ejecutando consulta SQL para obtener los albergues con más donaciones: " + sql);

            while (rs.next()) {
                Map<String, Object> dato = new HashMap<>();
                dato.put("nombre_albergue", rs.getString("nombre_albergue"));
                dato.put("foto_id", rs.getInt("foto_id"));
                dato.put("total_donado", rs.getDouble("total_donado"));
                dato.put("porcentaje_total", rs.getDouble("porcentaje_total"));
                resultados.add(dato);

                // Depuración: Mostrar los resultados de cada fila
                System.out.println("Albergue: " + rs.getString("nombre_albergue") + ", Total Donado: " + rs.getDouble("total_donado") + ", Porcentaje Total: " + rs.getDouble("porcentaje_total"));
            }
        } catch (SQLException e) {
            // Depuración: Mostrar el error de SQL
            System.err.println("Error al ejecutar la consulta SQL para obtener los albergues con más donaciones: " + e.getMessage());
            e.printStackTrace();
        }
        return resultados;
    }







}
