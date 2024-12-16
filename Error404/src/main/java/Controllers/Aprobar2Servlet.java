package Controllers;

import Beans.Publicaciones;
import Daos.Aprobar2DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Aprobar2Servlet", urlPatterns = "/AprobarPublicaciones")
public class Aprobar2Servlet extends HttpServlet {
    private Aprobar2DAO aprobar2DAO;

    @Override
    public void init() throws ServletException {
        aprobar2DAO = new Aprobar2DAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            action = "listarPublicaciones";
        }

        try {
            switch (action) {
                case "listarPublicaciones":
                    listarPublicaciones(request, response);
                    break;
                case "aprobarPublicacion":
                    aprobarPublicacion(request, response);
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

    /**
     * Método para listar publicaciones con filtros y paginación.
     */
    private void listarPublicaciones(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Parámetros de filtro: si son "Todas" o nulos, los consideramos vacíos
            String palabraClave = (request.getParameter("palabraClave") != null) ? request.getParameter("palabraClave").trim() : "";
            String tipoPublicacion = (request.getParameter("tipoPublicacion") != null && !request.getParameter("tipoPublicacion").equalsIgnoreCase("Todas"))
                    ? request.getParameter("tipoPublicacion").trim() : "";
            String fechaFiltro = (request.getParameter("fechaFiltro") != null && !request.getParameter("fechaFiltro").equalsIgnoreCase("Todas"))
                    ? request.getParameter("fechaFiltro").trim() : "";

            // Parámetros de paginación
            int page = 1;
            int pageSize = 6; // Número de registros por página
            try {
                page = Integer.parseInt(request.getParameter("page"));
                if (page < 1) page = 1;
            } catch (NumberFormatException ignored) {}

            // Cálculo del inicio para la paginación
            int start = (page - 1) * pageSize;

            // Obtener publicaciones y el total de registros
            List<Publicaciones> publicaciones = aprobar2DAO.obtenerPublicacionesFiltradas(palabraClave, tipoPublicacion, fechaFiltro, start, pageSize);
            int totalPublicaciones = aprobar2DAO.contarPublicacionesFiltradas(palabraClave, tipoPublicacion, fechaFiltro);
            int totalPages = (int) Math.ceil((double) totalPublicaciones / pageSize);

            // Evitar que la página actual sea mayor al total de páginas
            if (page > totalPages && totalPages > 0) {
                page = totalPages;
                start = (page - 1) * pageSize;
                publicaciones = aprobar2DAO.obtenerPublicacionesFiltradas(palabraClave, tipoPublicacion, fechaFiltro, start, pageSize);
            }

            // Atributos para el JSP
            request.setAttribute("publicaciones", publicaciones);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("pageSize", pageSize);
            request.setAttribute("palabraClave", palabraClave);
            request.setAttribute("tipoPublicacion", tipoPublicacion.isEmpty() ? "Todas" : tipoPublicacion);
            request.setAttribute("fechaFiltro", fechaFiltro.isEmpty() ? "Todas" : fechaFiltro);

            // Redirección al JSP
            request.getRequestDispatcher("/WEB-INF/coordinador/coordinador-ver-solicitudes-mascotasPerdidas.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al listar publicaciones: " + e.getMessage());
        }
    }

    /**
     * Método para aprobar una publicación (cambiar su estado a 'activa').
     */
    private void aprobarPublicacion(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String publicacionIdStr = request.getParameter("publicacionId");
        if (publicacionIdStr != null) {
            try {
                int publicacionId = Integer.parseInt(publicacionIdStr);
                boolean aprobado = aprobar2DAO.aprobarPublicacion(publicacionId);

                if (aprobado) {
                    response.getWriter().write("{\"success\": true, \"message\": \"Publicación aprobada correctamente.\"}");
                } else {
                    response.getWriter().write("{\"success\": false, \"message\": \"No se pudo aprobar la publicación.\"}");
                }
            } catch (NumberFormatException e) {
                response.getWriter().write("{\"success\": false, \"message\": \"ID no válido.\"}");
            }
        } else {
            response.getWriter().write("{\"success\": false, \"message\": \"ID no proporcionado.\"}");
        }
    }
}
