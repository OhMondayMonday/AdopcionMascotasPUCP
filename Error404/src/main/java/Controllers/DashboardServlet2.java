package Controllers;

import Beans.Eventos;
import Beans.Logs;
import Daos.Dashboard2DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DashboardServlet", urlPatterns = "/Dashboard2")
public class DashboardServlet2 extends HttpServlet {
    private Dashboard2DAO dashboard2DAO; // Instancia de Dashboard2DAO

    @Override
    public void init() throws ServletException {
        dashboard2DAO = new Dashboard2DAO(); // Inicializa el Dashboard2DAO
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null || action.isEmpty()) {
            action = "mostrarDashboard";
        }

        switch (action) {
            case "mostrarDashboard":
                mostrarDashboard(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Acción no válida");
                break;
        }
    }

    private void mostrarDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Simular el albergueId; en un entorno real, deberías obtenerlo del usuario autenticado
        int albergueId = 1; // Cambia a 2 para usar el ID del albergue "Huellas"

        try {
            // Obtener datos del albergue desde el Dashboard2DAO
            String nombreAlbergue = dashboard2DAO.obtenerNombreAlbergue(albergueId);
            String fotoPerfil = dashboard2DAO.obtenerFotoPerfilAlbergue(albergueId); // Corregido
            int animalesAyudados = dashboard2DAO.obtenerAnimalesAyudados(albergueId); // Corregido
            int publicacionesRealizadas = dashboard2DAO.obtenerPublicacionesRealizadas(albergueId);
            int eventosOrganizados = dashboard2DAO.obtenerEventosOrganizados(albergueId);
            Eventos proximoEvento = dashboard2DAO.obtenerProximoEvento();
            List<Logs> actualizaciones = dashboard2DAO.getLast4LogsByUserId(albergueId);

            // Pasar los datos al JSP
            request.setAttribute("nombreAlbergue", nombreAlbergue);
            request.setAttribute("fotoPerfil", fotoPerfil);
            request.setAttribute("animalesAyudados", animalesAyudados); // Corregido
            request.setAttribute("publicacionesRealizadas", publicacionesRealizadas);
            request.setAttribute("eventosOrganizados", eventosOrganizados);
            request.setAttribute("proximoEvento", proximoEvento);
            request.setAttribute("actualizaciones", actualizaciones);

            // Redirigir al JSP del Dashboard del albergue
            request.getRequestDispatcher("/WEB-INF/albergue/albergue-ver-inicio.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al cargar el Dashboard del albergue");
        }
    }
}
