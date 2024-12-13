package Controllers;

import Beans.Eventos;
import java.util.ArrayList;

import Beans.Usuarios;
import Daos.EventosDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CalendarioServlet", urlPatterns = "/Calendario")
public class CalendarioServlet extends HttpServlet {

    private final EventosDAO eventosDAO = new EventosDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Usuarios usuario = (Usuarios) session.getAttribute("usuariosession");
        if (usuario == null) {
            response.sendRedirect(request.getContextPath() + "/login");
        }
        else {
            int userId = usuario.getUserId();
            int rolId = usuario.getRol().getRolId();

            switch (rolId) {
                case 1 -> {
                }
                case 2 -> {
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
                case 3 -> {}
                case 4 -> {}
            }
        }
    }
}
