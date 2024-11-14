package Controllers;

import Beans.Eventos;
import java.util.ArrayList;
import Daos.EventosDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CalendarioServlet", urlPatterns = "/CalendarioServlet")
public class CalendarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = 1;

        EventosDAO eventosDAO = new EventosDAO();

        List<Eventos> todosLosEventos = eventosDAO.obtenerEventosActivos();
        List<Eventos> eventosInscritos = new ArrayList<>();
        List<Eventos> eventosNoInscritos = new ArrayList<>();

        for (Eventos evento : todosLosEventos) {
            if (eventosDAO.estaInscrito(userId, evento.getEventId())) {
                eventosInscritos.add(evento);
            } else {
                eventosNoInscritos.add(evento);
            }
        }

        request.setAttribute("eventosInscritos", eventosInscritos);
        request.setAttribute("eventosNoInscritos", eventosNoInscritos);
        request.getRequestDispatcher("WEB-INF/UsuarioFinal/usuario-ver-calendario.jsp").forward(request, response);
    }
}
