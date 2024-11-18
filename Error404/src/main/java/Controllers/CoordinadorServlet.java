package Controllers;

import Beans.*;
import Daos.CoordinadorDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/coordinador")
public class CoordinadorServlet extends HttpServlet {
    private CoordinadorDao coordinadorDAO;

    @Override
    public void init() throws ServletException {
        coordinadorDAO = new CoordinadorDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            if (action == null) {
                action = "listarSolicitudesHogar";
            }

            switch (action) {
                case "listarSolicitudesHogar":
                    listarSolicitudesHogar(request, response);
                    break;
                case "listarGestionHogares":
                    listarGestionHogares(request, response);
                    break;
                case "aprobarSolicitudHogar":
                    aprobarSolicitudHogar(request, response);
                    break;
                case "rechazarSolicitudHogar":
                    rechazarSolicitudHogar(request, response);
                    break;
                case "banearHogarTemporal":
                    banearHogarTemporal(request, response);
                    break;
                default:
                    listarSolicitudesHogar(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Redirige a una página de error o muestra un mensaje amigable
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Ocurrió un error al procesar la solicitud.");
        }
    }


    // Método para listar las solicitudes de hogares temporales (pendientes de aprobación)
    private void listarSolicitudesHogar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Parámetros de paginación
        int pageSize = 10; // Número de elementos por página
        String pageParam = request.getParameter("page");
        int currentPage = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;

        // Calcular el offset para la consulta
        int offset = (currentPage - 1) * pageSize;

        // Obtener las solicitudes paginadas y el total de solicitudes
        List<HogaresTemporales> solicitudes = coordinadorDAO.obtenerSolicitudesHogarPaginadas(offset, pageSize);
        int totalSolicitudes = coordinadorDAO.contarTotalHogaresTemporales();
        int totalPages = (int) Math.ceil((double) totalSolicitudes / pageSize);

        // Configurar los atributos para el JSP
        request.setAttribute("solicitudes", solicitudes);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        // Reenviar la solicitud al JSP
        request.getRequestDispatcher("/WEB-INF/coordinador/coordinador-ver-solicitud-hogarestemporales.jsp").forward(request, response);
    }


    // Método para listar la gestión de hogares temporales (aprobados, rechazados, etc.)
    private void listarGestionHogares(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageSize = 10; // Tamaño de la página
        int currentPage = 1; // Página actual por defecto

        // Obtener el parámetro de página si está presente
        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            currentPage = Integer.parseInt(pageParam);
        }

        // Calcular el offset para la consulta
        int offset = (currentPage - 1) * pageSize;

        // Obtener las solicitudes paginadas y el total de solicitudes
        List<HogaresTemporales> gestionHogares = coordinadorDAO.obtenerSolicitudesHogarPaginadas(offset, pageSize);
        int totalSolicitudes = coordinadorDAO.contarTotalHogaresTemporales();
        int totalPages = (int) Math.ceil((double) totalSolicitudes / pageSize);

        // Configurar los atributos para el JSP
        request.setAttribute("gestionHogares", gestionHogares);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageSize", pageSize);

        // Redirigir a la vista JSP
        request.getRequestDispatcher("/WEB-INF/coordinador/coordinador-tables-hogaresTemporales.jsp").forward(request, response);
    }


    // Método para aprobar una solicitud de hogar temporal
    private void aprobarSolicitudHogar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int solicitudId = Integer.parseInt(request.getParameter("solicitudId"));
        boolean aprobado = coordinadorDAO.aprobarSolicitudHogar(solicitudId);
        if (aprobado) {
            response.sendRedirect("coordinador?action=listarSolicitudesHogar&mensaje=aprobado");
        } else {
            response.sendRedirect("coordinador?action=listarSolicitudesHogar&mensaje=error");
        }
    }

    // Método para rechazar una solicitud de hogar temporal
    private void rechazarSolicitudHogar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int solicitudId = Integer.parseInt(request.getParameter("solicitudId"));
        boolean rechazado = coordinadorDAO.rechazarSolicitudHogar(solicitudId);
        if (rechazado) {
            response.sendRedirect("coordinador?action=listarSolicitudesHogar&mensaje=rechazado");
        } else {
            response.sendRedirect("coordinador?action=listarSolicitudesHogar&mensaje=error");
        }
    }

    // Método para banear un hogar temporal manualmente
    private void banearHogarTemporal(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int temporalId = Integer.parseInt(request.getParameter("temporalId"));
        boolean baneado = coordinadorDAO.banearHogarTemporalManual(temporalId);
        if (baneado) {
            response.sendRedirect("coordinador?action=listarGestionHogares&mensaje=baneado");
        } else {
            response.sendRedirect("coordinador?action=listarGestionHogares&mensaje=error");
        }
    }
}
