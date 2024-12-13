package Controllers;

import Daos.Dashboard4DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet("/DashboardServlet4")
public class DashboardServlet4 extends HttpServlet {
    private Dashboard4DAO dashboard4DAO = new Dashboard4DAO();

    @Override
    public void init() throws ServletException {
        // Inicializa el DAO cuando el servlet se crea
        dashboard4DAO = new Dashboard4DAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null || action.isEmpty()) {
            action = "mostrarDashboard"; // Acción predeterminada
        }

        // Maneja las diferentes acciones
        switch (action) {
            case "mostrarDashboard":
                mostrarDashboard(request, response);
                break;
            default:
                // Envía un error 404 si la acción no es válida
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Acción no válida");
                break;
        }
    }

    // Método para mostrar el Dashboard
    private void mostrarDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int administradorId = 51; // Simulación: Cambia esto a la lógica real para obtener el ID del usuario autenticado

        try {
            String nombreAdministrador = dashboard4DAO.obtenerNombreAdministrador(administradorId);
            String fotoPerfil = dashboard4DAO.obtenerFotoPerfil(administradorId);

            // Obtener el monto total de donaciones en el mes actual
            double montoTotalDonaciones = dashboard4DAO.obtenerMontoTotalDonacionesMesActual();

            // Obtener el monto total de donaciones realizadas hoy
            double montoTotalDonacionesHoy = dashboard4DAO.obtenerMontoTotalDonacionesHoy();

            // Obtener el número de albergues registrados
            int alberguesRegistrados = dashboard4DAO.obtenerAlberguesRegistrados();

            // Obtener el total de mascotas reportadas como perdidas
            int totalMascotasPerdidas = dashboard4DAO.obtenerTotalMascotasPerdidas();

            List<Map<String, Object>> mascotasPorMez = dashboard4DAO.obtenerMascotasPerdidasUltimosMeses(4);

            // Obtener el total de mascotas encontradas por mes
            int totalMascotasEncontradas = dashboard4DAO.obtenerTotalMascotasEncontradasUltimosMeses(4);

            List<Map<String, Object>> mascotasPorMes = dashboard4DAO.obtenerMascotasEncontradasUltimosMeses(4);

            // Obtener el total de donantes
            int totalDonantes = dashboard4DAO.obtenerTotalDonantes();
            // Obtener los donantes por mes en los últimos 4 meses
            List<Map<String, Object>> donantesUltimosMeses = dashboard4DAO.obtenerDonantesUltimosMeses(4);

            // Obtener los donantes con más donaciones realizadas
            List<Map<String, Object>> donantesConMasDonaciones = dashboard4DAO.obtenerDonantesConMasDonaciones();

            // Obtener los albergues con más donaciones recibidas
            List<Map<String, Object>> alberguesConMasDonaciones = dashboard4DAO.obtenerAlberguesConMasDonaciones();

            // Validar datos nulos o vacíos y asignar valores predeterminados
            nombreAdministrador = (nombreAdministrador != null) ? nombreAdministrador : "Anónimo";
            fotoPerfil = (fotoPerfil != null) ? fotoPerfil : "assets/img/default-profile.jpg";

            mascotasPorMez = (mascotasPorMez != null && !mascotasPorMez.isEmpty()) ? mascotasPorMez : Collections.emptyList();
            mascotasPorMes = (mascotasPorMes != null && !mascotasPorMes.isEmpty()) ? mascotasPorMes : Collections.emptyList();

            if (donantesUltimosMeses == null || donantesUltimosMeses.isEmpty()) {
                donantesUltimosMeses = new ArrayList<>();
                // Si no hay resultados, agregar un valor por defecto (puedes usar el mes actual)
                Map<String, Object> defaultData = new HashMap<>();
                defaultData.put("mes", "Enero");  // Mes por defecto
                defaultData.put("total", 0);      // Total de donantes por defecto
                donantesUltimosMeses.add(defaultData);
            }

            // Validar donantes con más donaciones
            if (donantesConMasDonaciones == null || donantesConMasDonaciones.isEmpty()) {
                donantesConMasDonaciones = new ArrayList<>();
                // Agregar un valor por defecto si no hay donantes con más donaciones
                Map<String, Object> defaultData = new HashMap<>();
                defaultData.put("nombre", "Sin Donantes");
                defaultData.put("total_donado", 0.0);
                defaultData.put("porcentaje_total", 0.0);
                donantesConMasDonaciones.add(defaultData);
            }

            // Validar albergues con más donaciones
            if (alberguesConMasDonaciones == null || alberguesConMasDonaciones.isEmpty()) {
                alberguesConMasDonaciones = new ArrayList<>();
                // Agregar un valor por defecto si no hay albergues con más donaciones
                Map<String, Object> defaultData = new HashMap<>();
                defaultData.put("nombre_albergue", "Sin Albergues");
                defaultData.put("total_donado", 0.0);
                defaultData.put("porcentaje_total", 0.0);
                alberguesConMasDonaciones.add(defaultData);
            }

            // Pasar los datos al JSP
            request.setAttribute("nombreAdministrador", nombreAdministrador);
            request.setAttribute("fotoPerfil", fotoPerfil);
            request.setAttribute("montoTotalDonaciones", montoTotalDonaciones);
            request.setAttribute("montoTotalDonacionesHoy", montoTotalDonacionesHoy); // Agregar el monto total de donaciones hoy
            request.setAttribute("alberguesRegistrados", alberguesRegistrados);
            request.setAttribute("totalMascotasEncontradas", totalMascotasEncontradas);
            request.setAttribute("totalMascotasPerdidas", totalMascotasPerdidas);
            request.setAttribute("mascotasPorMez", mascotasPorMez);
            request.setAttribute("mascotasPorMes", mascotasPorMes);
            request.setAttribute("totalDonantes", totalDonantes);
            request.setAttribute("donantesUltimosMeses", donantesUltimosMeses);
            request.setAttribute("donantesConMasDonaciones", donantesConMasDonaciones);
            request.setAttribute("alberguesConMasDonaciones", alberguesConMasDonaciones);

            // Redirigir al JSP de inicio del administrador
            request.getRequestDispatcher("/WEB-INF/administrador/Administrador-inicio.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            // Manejo de errores
            request.setAttribute("errorMessage", "Error al cargar el Dashboard. Intente nuevamente más tarde.");
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al cargar el Dashboard");
        }
    }
}
