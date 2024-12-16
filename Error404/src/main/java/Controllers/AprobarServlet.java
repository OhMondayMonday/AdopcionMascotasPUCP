package Controllers;

import Beans.HogaresTemporales;
import Daos.AprobarDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AprobarServlet", urlPatterns = "/AprobarSolicitudes")
public class AprobarServlet extends HttpServlet {
    private AprobarDAO aprobarDAO;

    @Override
    public void init() throws ServletException {
        aprobarDAO = new AprobarDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            action = "listarSolicitudes";
        }

        try {
            switch (action) {
                case "listarSolicitudes":
                    listarSolicitudes(request, response);
                    break;
                case "aprobarHogar":
                    aprobarHogar(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Acción no válida");
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Ocurrió un error interno: " + e.getMessage());
        }
    }

    private void listarSolicitudes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Parámetros de filtro: si son "Todas" o nulos, los consideramos como vacíos.
            String palabraClave = (request.getParameter("palabraClave") != null) ? request.getParameter("palabraClave").trim() : "";
            String tipoSolicitud = (request.getParameter("tipoSolicitud") != null && !request.getParameter("tipoSolicitud").equalsIgnoreCase("Todas"))
                    ? request.getParameter("tipoSolicitud").trim() : "";
            String ubicacion = (request.getParameter("ubicacion") != null && !request.getParameter("ubicacion").equalsIgnoreCase("Todas"))
                    ? request.getParameter("ubicacion").trim() : "";

            // Parámetros de paginación
            int page = 1;
            int pageSize = 6; // Número de registros por página
            try {
                page = Integer.parseInt(request.getParameter("page"));
                if (page < 1) page = 1;
            } catch (NumberFormatException ignored) {
            }

            // Cálculo del inicio para la paginación
            int start = (page - 1) * pageSize;

            // Obtener hogares temporales y el total de registros
            List<HogaresTemporales> hogares = aprobarDAO.obtenerHogaresFiltrados(palabraClave, tipoSolicitud, ubicacion, start, pageSize);
            int totalHogares = aprobarDAO.contarHogaresFiltrados(palabraClave, tipoSolicitud, ubicacion);
            int totalPages = (int) Math.ceil((double) totalHogares / pageSize);

            // Evitar que la página actual sea mayor al total de páginas
            if (page > totalPages && totalPages > 0) {
                page = totalPages;
                start = (page - 1) * pageSize;
                hogares = aprobarDAO.obtenerHogaresFiltrados(palabraClave, tipoSolicitud, ubicacion, start, pageSize);
            }

            // Atributos para el JSP
            request.setAttribute("solicitudes", hogares);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("pageSize", pageSize);
            request.setAttribute("palabraClave", palabraClave);
            request.setAttribute("tipoSolicitud", tipoSolicitud.isEmpty() ? "Todas" : tipoSolicitud);
            request.setAttribute("ubicacion", ubicacion.isEmpty() ? "Todas" : ubicacion);

            // Redirección al JSP
            request.getRequestDispatcher("/WEB-INF/coordinador/coordinador-ver-solicitud-hogarestemporales.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al listar solicitudes: " + e.getMessage());
        }
    }

    private void aprobarHogar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String temporalIdStr = request.getParameter("temporalId");
        if (temporalIdStr != null) {
            try {
                int temporalId = Integer.parseInt(temporalIdStr);
                boolean aprobado = aprobarDAO.aprobarHogarTemporal(temporalId);

                if (aprobado) {
                    response.getWriter().write("{\"success\": true, \"message\": \"Solicitud aprobada correctamente.\"}");
                } else {
                    response.getWriter().write("{\"success\": false, \"message\": \"No se pudo aprobar la solicitud.\"}");
                }
            } catch (NumberFormatException e) {
                response.getWriter().write("{\"success\": false, \"message\": \"ID no válido.\"}");
            }
        } else {
            response.getWriter().write("{\"success\": false, \"message\": \"ID no proporcionado.\"}");
        }
    }
}
