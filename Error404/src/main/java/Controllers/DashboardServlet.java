package Controllers;

import Beans.Eventos;
import Beans.Logs;
import Beans.Usuarios;
import Daos.DashboardDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "DashboardServlet", urlPatterns = "/Dashboard")
public class DashboardServlet extends HttpServlet {
    private DashboardDAO dashboardDAO;

    @Override
    public void init() throws ServletException {
        dashboardDAO = new DashboardDAO();
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

        HttpSession session = request.getSession();
        if (session.getAttribute("usuariosession") == null) {
            String redirect = "/Dashboard";
            session.setAttribute("redirect", redirect);
            response.sendRedirect(request.getContextPath() + "/login");
        } else {
            Usuarios usuario = (Usuarios) session.getAttribute("usuariosession");
            int userId = usuario.getUserId();

            try {
                String nombreUsuario = dashboardDAO.obtenerNombreUsuario(userId);
                String fotoPerfil = dashboardDAO.obtenerFotoPerfil(userId);

                // Obtener datos desde el DashboardDAO
                int animalesAyudados = dashboardDAO.obtenerAnimalesAyudados(userId);
                int publicacionesRealizadas = dashboardDAO.obtenerPublicacionesRealizadas(userId);
                int eventosInscritos = dashboardDAO.obtenerEventosInscritos(userId);
                String actividadPrincipal = dashboardDAO.obtenerActividadPrincipal(userId);
                Eventos proximoEvento = dashboardDAO.obtenerProximoEvento(userId);

                List<Logs> actualizaciones = dashboardDAO.getLast4LogsByUserId(userId);

                // Pasar los datos al JSP
                request.setAttribute("nombreUsuario", nombreUsuario);
                request.setAttribute("fotoPerfil", fotoPerfil);
                request.setAttribute("animalesAyudados", animalesAyudados);
                request.setAttribute("publicacionesRealizadas", publicacionesRealizadas);
                request.setAttribute("eventosInscritos", eventosInscritos);
                request.setAttribute("actividadPrincipal", actividadPrincipal);
                request.setAttribute("proximoEvento", proximoEvento);
                request.setAttribute("actualizaciones", actualizaciones);

                // Redirigir al JSP del Dashboard
                request.getRequestDispatcher("/WEB-INF/UsuarioFinal/Inicio-usuario.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al cargar el Dashboard");
            }
        }
    }
}


