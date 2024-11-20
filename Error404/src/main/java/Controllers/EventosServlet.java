package Controllers;

import Beans.Eventos;
import Beans.TiposEventos;
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

            case "verMisEventos":
                verMisEventosConSinFiltro(request, response);
                break;

            case "verDetalles":
                verDetalles(request, response);
                break;

            case "verTodosEventos":
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

    private void mostrarDetallesEvento(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Eventos eventos = eventosDAO.obtenerDetalleEvento(id);
        request.setAttribute("eventos", eventos);
        request.getRequestDispatcher("/WEB-INF/jsp/albergue-ver-eventos-detalles").forward(request, response);
    }

    private void verMisEventos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EventosDAO eventosDAO = new EventosDAO();
        int usuarioId = Integer.parseInt(request.getParameter("usuarioId"));
        List<Eventos> eventosInscritos = eventosDAO.obtenerMisEventos(usuarioId);

        request.setAttribute("eventosInscritos", eventosInscritos);
        request.getRequestDispatcher("/WEB-INF/jsp/ver-miseventos-usuario.jsp").forward(request, response);
    }

    private void verDetalles(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EventosDAO eventosDAO = new EventosDAO();
        int eventoId = Integer.parseInt(request.getParameter("eventoId"));
        Eventos evento = eventosDAO.obtenerDetalleEvento(eventoId);

        request.setAttribute("evento", evento);
        request.getRequestDispatcher("/WEB-INF/jsp/usuario-detalles-evento.jsp").forward(request, response);

    }

    // Ver los eventos inscritos por el usuario, puede aplicar filtros
    private void verMisEventosConSinFiltro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int usuarioId = Integer.parseInt(request.getParameter("usuarioId"));

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

        // Llamar al DAO para obtener los eventos filtrados o sin filtrar
        List<Eventos> eventosInscritos;
        if (tipoEventoId != null || distritoId != null || fechaInicio != null || fechaFin != null) {
            eventosInscritos = eventosDAO.verMisEventos(usuarioId, tipoEventoId, distritoId, fechaInicio, fechaFin);
        } else {
            eventosInscritos = eventosDAO.obtenerMisEventos(usuarioId);
        }
        // Pasar los datos filtrados a la JSP
        request.setAttribute("eventos", eventosInscritos);
        request.setAttribute("filtros", new HashMap<String, Object>() {{
            put("tipoEventoId", tipoEventoId);
            put("distritoId", distritoId);
            put("fechaInicio", fechaInicioParam);
            put("fechaFin", fechaFinParam);
        }});

        request.getRequestDispatcher("/WEB-INF/jsp/ver-miseventos-usuario.jsp").forward(request, response);
    }

    // Ver todos los Eventos sin ser del usuario
    private void verTodosEventos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        // Llamar al DAO con o sin filtros
        List<Eventos> eventos;
        if (tipoEventoId != null || distritoId != null || fechaInicio != null || fechaFin != null) {
            eventos = eventosDAO.verEventosActivos(tipoEventoId, distritoId, fechaInicio, fechaFin); // Metodo con filtros para obtener todos los eventos
        } else {
            eventos = eventosDAO.obtenerEventosActivos(); // Metodo para obtener todos los eventos sin filtros
        }

        // Crear una instancia de TiposEventosDAO
        TiposEventosDAO tiposEventosDAO = new TiposEventosDAO();
        List<TiposEventos> tiposEventos = tiposEventosDAO.obtenerTiposEventos();

        // Enviar la lista de tipos de eventos a la JSP
        request.setAttribute("tiposEventos", tiposEventos);

        // Pasar los eventos y filtros a la JSP
        request.setAttribute("eventos", eventos);
        request.setAttribute("filtros", new HashMap<String, Object>() {{
            put("tipoEventoId", tipoEventoId);
            put("distritoId", distritoId);
            put("fechaInicio", fechaInicioParam);
            put("fechaFin", fechaFinParam);
        }});

        request.getRequestDispatcher("/WEB-INF/UsuarioFinal/ver-eventos-usuario.jsp").forward(request, response);
    }


}
