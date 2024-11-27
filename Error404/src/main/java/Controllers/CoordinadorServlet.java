package Controllers;
import DTO.HogarTemporalDTO;

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
        String action = request.getParameter("action");
        if (action == null) {
            action = "listarSolicitudesHogar";
        }

        try {
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
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Ocurrió un error al procesar la solicitud.");
        }
    }

    // Método para listar solicitudes de hogares temporales (paginadas)
    private void listarSolicitudesHogar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageSize = 10;
        int currentPage = getCurrentPage(request);

        int offset = (currentPage - 1) * pageSize;

        // ID del coordinador (por ahora manual, hasta que se implemente sesión)
        int coordinadorId = 4; // Cambiar por el ID real del coordinador cuando esté disponible

        // Llamadas al DAO
        List<HogarTemporalDTO> solicitudes = coordinadorDAO.obtenerSolicitudesHogarPaginadas(offset, pageSize, coordinadorId);

        // **Depuración: Verificar el tamaño de la lista y sus elementos**
        System.out.println("Tamaño de la lista solicitudes: " + solicitudes.size());
        for (HogarTemporalDTO hogarDTO : solicitudes) {
            System.out.println("Hogar ID: " + hogarDTO.getHogarId() + ", Dirección: " + hogarDTO.getDireccion());
        }

        int totalSolicitudes = solicitudes.size(); // Si necesitas contar registros, ajusta el método en el DAO.
        int totalPages = calculateTotalPages(totalSolicitudes, pageSize);

        request.setAttribute("solicitudes", solicitudes);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("id", coordinadorId);

        request.getRequestDispatcher("/WEB-INF/coordinador/coordinador-ver-solicitud-hogarestemporales.jsp").forward(request, response);
    }



    // Método para listar gestión de hogares temporales (paginadas)
    private void listarGestionHogares(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageSize = 10;
        int currentPage = getCurrentPage(request);

        int offset = (currentPage - 1) * pageSize;

        // ID del coordinador (temporal por ahora)
        int coordinadorId = 4; // Cambia este valor según necesites

        // Llamadas al DAO con el ID del coordinador
        List<HogarTemporalDTO> solicitudes = coordinadorDAO.obtenerSolicitudesHogarPaginadas(offset, pageSize, coordinadorId);

        // **Depuración: Imprimir tamaño de la lista y sus elementos**
        System.out.println("Tamaño de la lista solicitudes: " + solicitudes.size());
        for (HogarTemporalDTO hogar : solicitudes) {
            System.out.println("Hogar ID: " + hogar.getHogarId() + ", Dirección: " + hogar.getDireccion());
        }

        int totalSolicitudes = coordinadorDAO.contarTotalHogaresTemporales(coordinadorId);
        int totalPages = calculateTotalPages(totalSolicitudes, pageSize);

        // Pasar la lista correcta al request
        request.setAttribute("gestionHogares", solicitudes);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("id", coordinadorId);

        // Redirigir a la página de JSP
        request.getRequestDispatcher("/WEB-INF/coordinador/coordinador-tables-hogaresTemporales.jsp").forward(request, response);
    }



    // Método para aprobar solicitud de hogar temporal
    private void aprobarSolicitudHogar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int solicitudId = parseParameterToInt(request, "solicitudId");
        boolean aprobado = coordinadorDAO.aprobarSolicitudHogar(solicitudId);
        redirectWithMessage(response, "listarSolicitudesHogar", aprobado ? "aprobado" : "error");
    }

    // Método para rechazar solicitud de hogar temporal
    private void rechazarSolicitudHogar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int solicitudId = parseParameterToInt(request, "solicitudId");
        boolean rechazado = coordinadorDAO.rechazarSolicitudHogar(solicitudId);
        redirectWithMessage(response, "listarSolicitudesHogar", rechazado ? "rechazado" : "error");
    }

    // Método para banear un hogar temporal manualmente
    private void banearHogarTemporal(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int temporalId = parseParameterToInt(request, "temporalId");
        boolean baneado = coordinadorDAO.banearHogarTemporalManual(temporalId);
        redirectWithMessage(response, "listarGestionHogares", baneado ? "baneado" : "error");
    }

    // Métodos auxiliares para el servlet

    // Obtener página actual del request
    private int getCurrentPage(HttpServletRequest request) {
        String pageParam = request.getParameter("page");
        return (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;
    }

    // Calcular total de páginas para paginación
    private int calculateTotalPages(int totalItems, int pageSize) {
        return (int) Math.ceil((double) totalItems / pageSize);
    }

    // Redirigir con un mensaje
    private void redirectWithMessage(HttpServletResponse response, String action, String message) throws IOException {
        response.sendRedirect("coordinador?action=" + action + "&mensaje=" + message);
    }

    // Parsear parámetros de request a enteros
    private int parseParameterToInt(HttpServletRequest request, String paramName) {
        String paramValue = request.getParameter(paramName);
        return (paramValue != null && !paramValue.isEmpty()) ? Integer.parseInt(paramValue) : 0;
    }
}
