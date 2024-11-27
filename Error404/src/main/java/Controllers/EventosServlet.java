package Controllers;

import Beans.*;
import Daos.DistritosDAO;
import Daos.EventosDAO;
import Daos.TiposEventosDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.sql.*;

@WebServlet("/EventosServlet")
public class EventosServlet extends HttpServlet {
    private EventosDAO eventosDAO;

    @Override
    public void init() throws ServletException {
        eventosDAO = new EventosDAO();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "verTodosEventos";
        }

        switch (action) {
            case "listar":
                listarEventos(request, response);
                break;

            case "verDetallesEvento":
                verDetallesEvento(request, response);
                break;

            case "verMisEventosAlbergue":
                // Para ver los eventos que ha creado un Albergue
                verMisEventosAlbergue(request, response);
                break;

            case "verEventosInscritosUsuario":
                // Para ver los eventos a los que está inscrito un Usuario Final
                verEventosInscritosUsuario(request, response);
                break;

            case "verTodosEventos":
                // Para ver todos los eventos de la base de datos (activos)
                verTodosEventos(request, response);
                break;

            default:
                response.sendRedirect("index.jsp");
                break;
        }
    }

    private void listarEventos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Eventos> eventos = eventosDAO.obtenerEventos();
        request.setAttribute("eventos", eventos);
        request.getRequestDispatcher("/WEB-INF/jsp/albergue-ver-eventos.jsp").forward(request, response);
    }

    // d

    // Metodo para ver detalles de un evento específico
    private void verDetallesEvento(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int eventoId = Integer.parseInt(request.getParameter("event_id")); // Obtener ID del evento desde la URL
            Eventos eventoDetalles = eventosDAO.obtenerDetalleEvento(eventoId); // Obtener los detalles del evento

            if (eventoDetalles != null) {
                request.setAttribute("evento", eventoDetalles); // Pasar el evento como atributo al JSP
                request.getRequestDispatcher("/WEB-INF/UsuarioFinal/ver-evento-detalles-usuario.jsp").forward(request, response);
            } else {
                response.sendRedirect("EventosServlet?action=verTodosEventos"); // Si no se encuentra el evento, redirigir
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("EventosServlet?action=verTodosEventos"); // Redirigir en caso de error
        }
    }

    // Ver los eventos creados por un albergue, puede aplicar filtros
    private void verMisEventosAlbergue(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int userId = 3; // Para la simulación

        // Obtener filtros si se aplican
        String tipoEventoIdParam = request.getParameter("tipoEventoId");
        String distritoIdParam = request.getParameter("distritoId");
        String fechaInicioParam = request.getParameter("fechaInicio");
        String fechaFinParam = request.getParameter("fechaFin");

        Integer tipoEventoId = (tipoEventoIdParam != null && !tipoEventoIdParam.isEmpty())
                ? Integer.parseInt(tipoEventoIdParam)
                : null;

        Integer distritoId = (distritoIdParam != null && !distritoIdParam.isEmpty())
                ? Integer.parseInt(distritoIdParam)
                : null;

        Date fechaInicio = (fechaInicioParam != null && !fechaInicioParam.isEmpty())
                ? Date.valueOf(fechaInicioParam)
                : null;

        Date fechaFin = (fechaFinParam != null && !fechaFinParam.isEmpty())
                ? Date.valueOf(fechaFinParam)
                : null;

        // Paginación
        int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        int recordsPerPage = 6; // Mostrar 6 eventos por página

        List<Eventos> eventosInscritos;
        int totalRecords;

        if (tipoEventoId != null || distritoId != null || fechaInicio != null || fechaFin != null) {
            totalRecords = eventosDAO.contarMisEventosActivosConFiltros(userId, tipoEventoId, distritoId, fechaInicio, fechaFin);
            eventosInscritos = eventosDAO.verMisEventosActivos(userId, tipoEventoId, distritoId, fechaInicio, fechaFin, page, recordsPerPage);
        } else {
            // Si no hay filtros
            totalRecords = eventosDAO.contarMisEventosActivos(userId);
            eventosInscritos = eventosDAO.obtenerMisEventosActivosConPaginacion(userId, page, recordsPerPage);
        }

        int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);

        request.setAttribute("totalPages", totalPages);
        request.setAttribute("page", page);
        request.setAttribute("totalRecords", totalRecords);
        request.setAttribute("eventosInscritos", eventosInscritos);

        DistritosDAO distritosDAO = new DistritosDAO();
        List<Distritos> distritos = distritosDAO.obtenerDistritos();
        request.setAttribute("distritos", distritos);

        TiposEventosDAO tiposEventosDAO = new TiposEventosDAO();
        List<TiposEventos> tiposEventos = tiposEventosDAO.obtenerTiposEventos();
        request.setAttribute("tiposEventos", tiposEventos);

        // Pasar los eventos y filtros a la JSP
        request.setAttribute("filtros", new HashMap<String, Object>() {{
            put("tipoEventoId", tipoEventoId);
            put("distritoId", distritoId);
            put("fechaInicio", fechaInicioParam);
            put("fechaFin", fechaFinParam);
        }});

        System.out.println("Tipos de eventos: " + tiposEventos.size());
        System.out.println("Eventos activos: " + eventosInscritos.size());
        System.out.println("Filtro de distrito ID: " + distritoId);
        System.out.println("Fecha Inicio: " + fechaInicio);
        System.out.println("Fecha Fin: " + fechaFin);
        System.out.println("Cantidad de eventos: " + (eventosInscritos != null ? eventosInscritos.size() : "null"));
        System.out.println("Cantidad de tipos de eventos: " + (tiposEventos != null ? tiposEventos.size() : "null"));
        System.out.println("Cantidad de distritos: " + (distritos != null ? distritos.size() : "null"));

        request.getRequestDispatcher("/WEB-INF/albergue/albergue-ver-miseventos.jsp").forward(request, response);

        // request.getRequestDispatcher("/WEB-INF/UsuarioFinal/ver-miseventos-usuario.jsp").forward(request, response);
    }

    // Ver los eventos inscritos por el usuario, puede aplicar filtros
    private void verEventosInscritosUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int userId=1; // simulacion

        // Obtener filtros si se aplican
        String tipoEventoIdParam = request.getParameter("tipoEventoId");
        String distritoIdParam = request.getParameter("distritoId");
        String fechaInicioParam = request.getParameter("fechaInicio");
        String fechaFinParam = request.getParameter("fechaFin");

        Integer tipoEventoId = (tipoEventoIdParam != null && !tipoEventoIdParam.isEmpty())
                ? Integer.parseInt(tipoEventoIdParam)
                : null;

        Integer distritoId = (distritoIdParam != null && !distritoIdParam.isEmpty())
                ? Integer.parseInt(distritoIdParam)
                : null;

        Date fechaInicio = (fechaInicioParam != null && !fechaInicioParam.isEmpty())
                ? Date.valueOf(fechaInicioParam)
                : null;

        Date fechaFin = (fechaFinParam != null && !fechaFinParam.isEmpty())
                ? Date.valueOf(fechaFinParam)
                : null;

        // Paginación
        int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        int recordsPerPage = 6; // Mostrar 6 eventos por página

        List<Eventos> eventosInscritos;
        int totalRecords;

        if (tipoEventoId != null || distritoId != null || fechaInicio != null || fechaFin != null) {
            totalRecords = eventosDAO.contarEventosInscritosConFiltrosUsuario(userId, tipoEventoId, distritoId, fechaInicio, fechaFin); // Para contar los eventos inscritos filtrados de un usuario en la tabla inscripciones_eventos junto con eventos
            eventosInscritos = eventosDAO.verMisEventosInscritosUsuario(userId, tipoEventoId, distritoId, fechaInicio, fechaFin, page, recordsPerPage);
        } else {
            // Si no hay filtros
            totalRecords = eventosDAO.contarEventosInscritosUsuario(userId); // Para contar los eventos inscritos de un usuario en la tabla inscripciones_eventos
            eventosInscritos = eventosDAO.obtenerMisEventosInscritosUsuarioConPaginacion(userId, page, recordsPerPage);
        }

        int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);

        request.setAttribute("totalPages", totalPages);
        request.setAttribute("page", page);
        request.setAttribute("totalRecords", totalRecords);
        request.setAttribute("eventosInscritos", eventosInscritos);

        DistritosDAO distritosDAO = new DistritosDAO();
        List<Distritos> distritos = distritosDAO.obtenerDistritos();
        request.setAttribute("distritos", distritos);

        TiposEventosDAO tiposEventosDAO = new TiposEventosDAO();
        List<TiposEventos> tiposEventos = tiposEventosDAO.obtenerTiposEventos();
        request.setAttribute("tiposEventos", tiposEventos);

        // Pasar los eventos y filtros a la JSP
        request.setAttribute("filtros", new HashMap<String, Object>() {{
            put("tipoEventoId", tipoEventoId);
            put("distritoId", distritoId);
            put("fechaInicio", fechaInicioParam);
            put("fechaFin", fechaFinParam);
        }});

        System.out.println("Tipos de eventos: " + tiposEventos.size());
        System.out.println("Eventos activos: " + eventosInscritos.size());
        System.out.println("Filtro de distrito ID: " + distritoId);
        System.out.println("Fecha Inicio: " + fechaInicio);
        System.out.println("Fecha Fin: " + fechaFin);
        System.out.println("Cantidad de eventos: " + (eventosInscritos != null ? eventosInscritos.size() : "null"));
        System.out.println("Cantidad de tipos de eventos: " + (tiposEventos != null ? tiposEventos.size() : "null"));
        System.out.println("Cantidad de distritos: " + (distritos != null ? distritos.size() : "null"));

        request.getRequestDispatcher("/WEB-INF/UsuarioFinal/ver-miseventos-usuario.jsp").forward(request, response);
    }

    // Mostrar TODOS los eventos ACTIVOS que existan. Incluye lógica de filtros
    private void verTodosEventos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Simulación para redirigir a usuario o albergue
        int rolId = 2;

        // Obtener filtros si se aplican
        String tipoEventoIdParam = request.getParameter("tipoEventoId");
        String distritoIdParam = request.getParameter("distritoId");
        String fechaInicioParam = request.getParameter("fechaInicio");
        String fechaFinParam = request.getParameter("fechaFin");

        Integer tipoEventoId = (tipoEventoIdParam != null && !tipoEventoIdParam.isEmpty())
                ? Integer.parseInt(tipoEventoIdParam)
                : null;

        Integer distritoId = (distritoIdParam != null && !distritoIdParam.isEmpty())
                ? Integer.parseInt(distritoIdParam)
                : null;

        Date fechaInicio = (fechaInicioParam != null && !fechaInicioParam.isEmpty())
                ? Date.valueOf(fechaInicioParam)
                : null;

        Date fechaFin = (fechaFinParam != null && !fechaFinParam.isEmpty())
                ? Date.valueOf(fechaFinParam)
                : null;

        int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        int recordsPerPage = 6; // Mostrar 6 eventos por página

        int totalRecords;

        // Llamar a los métodos del DAO si se aplica filtros o si no se aplican filtros
        List<Eventos> eventos;
        if (tipoEventoId !=null || distritoId != null || fechaInicio != null || fechaFin != null) {
            // Si se aplican filtros
            totalRecords = eventosDAO.contarEventosActivosConFiltros(tipoEventoId, distritoId, fechaInicio, fechaFin);
            eventos = eventosDAO.verEventosActivos(tipoEventoId, distritoId, fechaInicio, fechaFin, page, recordsPerPage); // Metodo con filtros para obtener todos los eventos
        } else {
            // Si no hay filtros
            totalRecords = eventosDAO.contarEventosActivos();
            eventos = eventosDAO.obtenerEventosActivosConPaginacion(page, recordsPerPage); // Metodo para obtener todos los eventos sin filtros
        }

        int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);

        DistritosDAO distritosDAO = new DistritosDAO();
        List<Distritos> distritos = distritosDAO.obtenerDistritos();

        TiposEventosDAO tiposEventosDAO = new TiposEventosDAO();
        List<TiposEventos> tiposEventos = tiposEventosDAO.obtenerTiposEventos();

        request.setAttribute("totalPages", totalPages);
        request.setAttribute("page", page);
        request.setAttribute("totalRecords", totalRecords);
        request.setAttribute("eventos", eventos);
        request.setAttribute("distritos", distritos);
        request.setAttribute("tiposEventos", tiposEventos);
        // Pasar los eventos y filtros a la JSP
        request.setAttribute("filtros", new HashMap<String, Object>() {{
            put("tipoEventoId", tipoEventoId);
            put("distritoId", distritoId);
            put("fechaInicio", fechaInicioParam);
            put("fechaFin", fechaFinParam);
        }});
        // System.out.println("Tipos de eventos: " + tiposEventos.size());
        // System.out.println("Eventos activos: " + eventos.size());
        // System.out.println("Filtro de distrito ID: " + distritoId);
        // System.out.println("Fecha Inicio: " + fechaInicio);
        // System.out.println("Fecha Fin: " + fechaFin);
        // System.out.println("Cantidad de eventos: " + (eventos != null ? eventos.size() : "null"));
        // System.out.println("Cantidad de tipos de eventos: " + (tiposEventos != null ? tiposEventos.size() : "null"));
        // System.out.println("Cantidad de distritos: " + (distritos != null ? distritos.size() : "null"));
        // for (TiposEventos tipo : tiposEventos) {
        //     System.out.println("Tipo Evento ID: " + tipo.getTipoEventoId() + ", Nombre: " + tipo.getNombreTipo());
        // }

        if (rolId==2){
            request.getRequestDispatcher("/WEB-INF/albergue/albergue-ver-eventos.jsp").forward(request, response);
        }
        else {
            request.getRequestDispatcher("/WEB-INF/UsuarioFinal/ver-eventos-usuario.jsp").forward(request, response);
        }

    }


}
