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

@WebServlet(name = "CalendarioServlet", urlPatterns = "/CalendarioServlet")
public class CalendarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            EventosDAO eventosDAO = new EventosDAO();
            List<Eventos> eventosActivos = eventosDAO.obtenerEventosActivos();
            request.setAttribute("eventos", eventosActivos);
            request.getRequestDispatcher("WEB-INF/UsuarioFinal/usuario-ver-calendario.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Ocurrió un error al procesar la solicitud.");
        }
    }
}
