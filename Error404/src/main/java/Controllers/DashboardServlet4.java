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
        int adminitradorId = 51; // Simulación: Cambia esto a la lógica real para obtener el ID del usuario autenticado


        try {
            String nombreAdministrador = dashboard4DAO.obtenerNombreAdministrador(adminitradorId);
            String fotoPerfil = dashboard4DAO.obtenerFotoPerfil(adminitradorId);



            // Obtener el número total de donantes en el mes actual
            int totalDonantes = dashboard4DAO.obtenerNumeroDonantesMesActual();

            // Obtener el monto total de donaciones en el mes actual
            double montoTotalDonaciones = dashboard4DAO.obtenerMontoTotalDonacionesMesActual();

            // Obtener el número de albergues registrados
            int alberguesRegistrados = dashboard4DAO.obtenerAlberguesRegistrados();

            // Obtener el total de mascotas reportadas como perdidas
            int totalMascotasPerdidas = dashboard4DAO.obtenerTotalMascotasPerdidas();

            // Obtener el total de mascotas encontradas por mes
            List<Map<String, Object>> mascotasEncontradas = dashboard4DAO.obtenerMascotasEncontradasPorMes(4);

            // Obtener usuarios con más donaciones
            List<Map<String, Object>> usuariosMasDonaciones = dashboard4DAO.obtenerUsuariosConMasDonaciones();

            // Obtener albergues con más donaciones
            List<Map<String, Object>> alberguesMasDonaciones = dashboard4DAO.obtenerAlberguesConMasDonaciones();

            // Obtener las últimas actualizaciones
            List<Map<String, String>> ultimasActualizaciones = dashboard4DAO.obtenerUltimasActualizaciones(adminitradorId);

            // Validar datos nulos o vacíos y asignar valores predeterminados
            nombreAdministrador = (nombreAdministrador != null) ? nombreAdministrador : "Anónimo";
            fotoPerfil = (fotoPerfil != null) ? fotoPerfil : "assets/img/default-profile.jpg";

            // Pasar los datos al JSP
            request.setAttribute("nombreAdministrador", nombreAdministrador);
            request.setAttribute("fotoPerfil", fotoPerfil);
            request.setAttribute("totalDonantes", totalDonantes);
            request.setAttribute("montoTotalDonaciones", montoTotalDonaciones);
            request.setAttribute("alberguesRegistrados", alberguesRegistrados);
            request.setAttribute("totalMascotasPerdidas", totalMascotasPerdidas);
            request.setAttribute("mascotasEncontradas", mascotasEncontradas);
            request.setAttribute("usuariosMasDonaciones", usuariosMasDonaciones);
            request.setAttribute("alberguesMasDonaciones", alberguesMasDonaciones);
            request.setAttribute("ultimasActualizaciones", ultimasActualizaciones);


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
