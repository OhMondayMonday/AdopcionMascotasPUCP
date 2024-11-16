package Controllers;

import Beans.Eventos;
import Daos.EventosDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

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
            action = "listar";
        }

        switch (action) {
            case "listar":
                listarEventos(request, response);
                break;

            case "verMisEventos":
                verMisEventos(request, response);
                break;

            case "verDetalles":
                verDetalles(request, response);
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
        List<Eventos> eventosInscritos = eventosDAO.obtenerEventosInscritos(usuarioId);

        request.setAttribute("eventosInscritos", eventosInscritos);
        request.getRequestDispatcher("ver-miseventos-usuario.jsp").forward(request, response);
    }

    private void verDetalles(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EventosDAO eventosDAO = new EventosDAO();
        int eventoId = Integer.parseInt(request.getParameter("eventoId"));
        Eventos evento = eventosDAO.obtenerDetalleEvento(eventoId);

        request.setAttribute("evento", evento);
        request.getRequestDispatcher("/WEB-INF/jsp/usuario-detalles-evento.jsp").forward(request, response);

    }

}
