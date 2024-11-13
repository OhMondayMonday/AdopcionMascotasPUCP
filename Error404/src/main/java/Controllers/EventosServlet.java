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
import java.time.LocalTime;
import java.time.Duration;
import java.time.format.DateTimeFormatter;

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


    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("inscribir".equals(action)) {
            inscribirUsuarioEvento(request, response);
        }
    }

    private void inscribirUsuarioEvento(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int eventoId = Integer.parseInt(request.getParameter("eventoId"));
        int userId = Integer.parseInt(request.getParameter("userId"));

        // Obtener los detalles del evento al que se quiere inscribir
        Eventos nuevoEvento = eventosDAO.obtenerDetalleEvento(eventoId);

        // Convertir las horas de inicio y fin del nuevo evento a LocalTime
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
        LocalTime horaInicioNuevo = LocalTime.parse(request.getParameter("horaInicio"), timeFormatter);
        LocalTime horaFinNuevo = LocalTime.parse(request.getParameter("horaFin"), timeFormatter);

        nuevoEvento.setHoraInicio(horaInicioNuevo);
        nuevoEvento.setHoraFin(horaFinNuevo);

        // Verificar traslape con otros eventos del usuario
        boolean traslape = verificarTraslape(nuevoEvento, userId);
        if (traslape) {
            request.setAttribute("error", "El horario de este evento traslapa con otro al que estás inscrito.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } else {
            eventosDAO.inscribirUsuarioEvento(userId, eventoId);
            response.sendRedirect("eventos.jsp");
        }
    }

    private boolean verificarTraslape(Eventos nuevoEvento, int userId) {
        List<Eventos> eventosUsuario = eventosDAO.obtenerEventosUsuario(userId);
        LocalTime inicioNuevo = nuevoEvento.getHoraInicio();
        LocalTime finNuevo = nuevoEvento.getHoraFin();

        return eventosUsuario.stream().anyMatch(evento ->
                evento.getFechaEvento().equals(nuevoEvento.getFechaEvento()) &&
                        (inicioNuevo.isBefore(evento.getHoraFin()) && finNuevo.isAfter(evento.getHoraInicio()))
        );
    }
}
