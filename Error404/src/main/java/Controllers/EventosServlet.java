package Controllers;

import Beans.*;
import Daos.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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

            case "verEventosDeUsuario":
                // Para ver Eventos creados de un albergue o eventos que un usuario final se ha inscrto
                verEventosDeUsuario(request, response);
                break;

            case "verTodosEventos":
                // Para ver todos los eventos de la base de datos (activos)
                verTodosEventos(request, response);
                break;

            case "verDetallesEvento":
                verDetallesEvento(request, response);
                break;

            case "verFormularioEvento":
                verFormularioEvento(request, response);
                break;

            case "verEditarEvento":
                verEditarEvento(request, response);
                break;

            case "inscribirEvento":
                inscribirEvento(request, response);
                break;

            default:
                response.sendRedirect("index.jsp");
                break;
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect("EventosServlet?action=verTodosEventos");
        }

        // Agregar el metodo de editarEvento


        // Metodo para crear evento
        if ("crearEvento".equals(action)) {
            try {
                // Obtener la sesión y el user_id
                HttpSession session = request.getSession(false);
                if (session == null || session.getAttribute("userID") == null) {
                    response.sendRedirect("login");
                    return;
                }
                int userId = (Integer) session.getAttribute("userID"); // Obtener el user_id de la sesión

                // Obtener parámetros del lugar
                int distritoId = Integer.parseInt(request.getParameter("distritoId"));
                String direccionLugar = request.getParameter("direccionLugar");
                int aforo = Integer.parseInt(request.getParameter("aforo"));

                // Crear objeto Lugar
                LugaresEventos lugar = new LugaresEventos();
                Distritos distritos = new Distritos();
                distritos.setDistritoId(distritoId);
                lugar.setDistrito(distritos);
                lugar.setDireccionLugar(direccionLugar);
                lugar.setAforoMaximo(aforo);

                // Insertar el lugar y obtener su ID
                LugaresEventosDAO lugaresDAO = new LugaresEventosDAO();
                int lugarIdGenerado = lugaresDAO.crearLugarEvento(lugar);

                if (lugarIdGenerado > 0) {
                    // Obtener parámetros del evento
                    String nombreEvento = request.getParameter("nombreEvento");
                    Date fechaEvento = Date.valueOf(request.getParameter("fechaEvento"));
                    int tipoEventoId = Integer.parseInt(request.getParameter("tipoEventoId"));
                    String descripcion = request.getParameter("descripcionEvento");
                    String entrada = request.getParameter("entrada");
                    String artistas = request.getParameter("artistasProveedores");
                    String razon = request.getParameter("razonEvento");

                    Usuarios usuario = new Usuarios();
                    usuario.setUserId(userId);

                    // Crear objeto Evento
                    Eventos evento = new Eventos();
                    evento.setNombreEvento(nombreEvento);
                    evento.setFechaEvento(fechaEvento);
                    TiposEventos tiposEventos = new TiposEventos();
                    tiposEventos.setTipoEventoId(tipoEventoId);
                    evento.setTipoEvento(tiposEventos);
                    evento.setDescripcionEvento(descripcion);
                    evento.setEntrada(entrada);
                    evento.setArtistasProveedores(artistas);
                    evento.setRazonEvento(razon);
                    evento.setUsuario(usuario);

                    // Insertar el evento
                    EventosDAO eventosDAO = new EventosDAO();
                    boolean eventoCreado = eventosDAO.crearEvento(evento, lugarIdGenerado);

                    if (eventoCreado) {
                        response.sendRedirect("EventosServlet?action=verTodosEventos");
                    } else {
                        response.getWriter().write("Error al crear el evento.");
                    }
                } else {
                    response.getWriter().write("Error al crear el lugar del evento.");
                }

            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().write("Error: " + e.getMessage());
            }
        }

        switch (action){

            case "editarEvento":
                int eventId = Integer.parseInt(request.getParameter("eventId"));
                String nombreEvento = request.getParameter("nombreEvento");
                Date fechaEvento = Date.valueOf(request.getParameter("fechaEvento"));
                String direccionLugar = request.getParameter("direccionLugar");
                int distritoId = Integer.parseInt(request.getParameter("distritoId"));
                int aforo = Integer.parseInt(request.getParameter("aforo"));
                int tipoEventoId = Integer.parseInt(request.getParameter("tipoEventoId"));
                String descripcionEvento = request.getParameter("descripcionEvento");
                String entrada = request.getParameter("entrada");
                String artistas = request.getParameter("artistasProveedores");
                String razon = request.getParameter("razonEvento");

                // Obtener lugar del evento
                Eventos evento = eventosDAO.obtenerDetalleEvento(eventId);
                if (evento != null) {
                    // Actualizar datos del lugar
                    LugaresEventos lugar = evento.getLugarEvento();
                    lugar.setDireccionLugar(direccionLugar);
                    lugar.setAforoMaximo(aforo);

                    Distritos distrito = new Distritos();
                    distrito.setDistritoId(distritoId);
                    lugar.setDistrito(distrito);

                    // Setear nuevos datos del evento
                    evento.setNombreEvento(nombreEvento);
                    evento.setFechaEvento(fechaEvento);
                    evento.setDescripcionEvento(descripcionEvento);
                    evento.setEntrada(entrada);
                    evento.setArtistasProveedores(artistas);
                    evento.setRazonEvento(razon);

                    TiposEventos tipoEvento = new TiposEventos();
                    tipoEvento.setTipoEventoId(tipoEventoId);
                    evento.setTipoEvento(tipoEvento);

                    // Llamar al metodo para actualizar
                    eventosDAO.actualizarEventoYLugar(evento);
                }

                response.sendRedirect("EventosServlet?action=verMisEventos");
                break;


        }

    }

    private void inscribirEvento(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userID");
        int eventId = Integer.parseInt(request.getParameter("event_id"));

        InscripcionesEventosDAO inscripcionesDAO = new InscripcionesEventosDAO();

        // Verificar si la inscripción ya existe
        if (inscripcionesDAO.verificarInscripcionExistente(userId, eventId)) {
            System.out.println("El usuario ya está inscrito en este evento.");
            response.sendRedirect("EventosServlet?action=verEventosDeUsuario"); // Redirigir si ya existe
            return;
        }

        // Realizar la inscripción
        boolean exito = inscripcionesDAO.inscribirUsuarioEnEvento(userId, eventId);
        if (exito) {
            System.out.println("Inscripción exitosa.");
            response.sendRedirect("EventosServlet?action=verEventosDeUsuario");
        } else {
            System.out.println("Error al inscribir el evento.");
            response.sendRedirect("ver-eventos-usuario.jsp");
        }
    }




    private void listarEventos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Eventos> eventos = eventosDAO.obtenerEventos();
        request.setAttribute("eventos", eventos);
        request.getRequestDispatcher("/WEB-INF/jsp/albergue-ver-eventos.jsp").forward(request, response);
    }


    private void verEditarEvento(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int eventoId = Integer.parseInt(request.getParameter("event_id")); // Obtener el ID del evento
            Eventos evento = eventosDAO.obtenerDetalleEvento(eventoId); // Obtener detalles del evento

            if (evento != null) {
                request.setAttribute("evento", evento); // Pasar detalles del evento al JSP
                // También cargar listas para los selectores
                DistritosDAO distritosDAO = new DistritosDAO();
                List<Distritos> distritos = distritosDAO.obtenerDistritos();
                TiposEventosDAO tiposEventosDAO = new TiposEventosDAO();
                List<TiposEventos> tiposEventos = tiposEventosDAO.obtenerTiposEventos();

                request.setAttribute("distritos", distritos);
                request.setAttribute("tiposEventos", tiposEventos);

                request.getRequestDispatcher("/WEB-INF/albergue/albergue-editar-evento.jsp").forward(request, response);
            } else {
                response.sendRedirect("EventosServlet?action=verTodosEventos");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("EventosServlet?action=verTodosEventos");
        }
    }

    private void verFormularioEvento(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect("login");
            return;
        }

        DistritosDAO distritosDAO = new DistritosDAO();
        List<Distritos> distritos = distritosDAO.obtenerDistritos();

        TiposEventosDAO tiposEventosDAO = new TiposEventosDAO();
        List<TiposEventos> tiposEventos = tiposEventosDAO.obtenerTiposEventos();

        request.setAttribute("distritos", distritos);
        request.setAttribute("tiposEventos", tiposEventos);

        // Redirigir al formulario
        request.getRequestDispatcher("/WEB-INF/albergue/albergue-crear-evento.jsp").forward(request, response);
    }


    // Metodo para ver detalles de un evento específico
    private void verDetallesEvento(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            LoginDAO loginDAO = new LoginDAO();

            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("userID") == null) {
                response.sendRedirect("login");
                return;
            }

            Integer userId = (Integer) session.getAttribute("userID");
            int rolId = loginDAO.obtenerRolPorUserId(userId);

            if (rolId==2){ // Albergue
                int eventoId = Integer.parseInt(request.getParameter("event_id")); // Obtener ID del evento desde la URL
                Eventos eventoDetalles = eventosDAO.obtenerDetalleEvento(eventoId); // Obtener los detalles del evento

                if (eventoDetalles != null) {
                    request.setAttribute("evento", eventoDetalles); // Pasar el evento como atributo al JSP
                    request.getRequestDispatcher("/WEB-INF/albergue/albergue-ver-eventos-detalles.jsp").forward(request, response);
                } else {
                    response.sendRedirect("EventosServlet?action=verTodosEventos"); // Si no se encuentra el evento, redirigir
                }
            } else if (rolId==1) { // Usuario Final
                int eventoId = Integer.parseInt(request.getParameter("event_id")); // Obtener ID del evento desde la URL
                Eventos eventoDetalles = eventosDAO.obtenerDetalleEvento(eventoId); // Obtener los detalles del evento

                if (eventoDetalles != null) {
                    request.setAttribute("evento", eventoDetalles); // Pasar el evento como atributo al JSP
                    request.getRequestDispatcher("/WEB-INF/UsuarioFinal/ver-evento-detalles-usuario.jsp").forward(request, response);
                } else {
                    response.sendRedirect("EventosServlet?action=verTodosEventos"); // Si no se encuentra el evento, redirigir
                }

            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("EventosServlet?action=verTodosEventos"); // Redirigir en caso de error
        }
    }

    // Mostrar TODOS los eventos ACTIVOS que existan. Incluye lógica de filtros
    private void verTodosEventos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuariosession") == null) {
            response.sendRedirect("login");
            return;
        }

        Usuarios usuario = (Usuarios) session.getAttribute("usuariosession");
        int rolId = usuario.getRol().getRolId();

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

        if (rolId == 2) { // Usuario tipo Albergue
            request.getRequestDispatcher("/WEB-INF/albergue/albergue-ver-eventos.jsp").forward(request, response);
        } else if (rolId == 1) { // Usuario final
            request.getRequestDispatcher("/WEB-INF/UsuarioFinal/ver-eventos-usuario.jsp").forward(request, response);
        } else {
            response.sendRedirect("login");
        }

    }

    private void verEventosDeUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuariosession") == null) {
            response.sendRedirect("login");
            return;
        }

        Usuarios usuario = (Usuarios) session.getAttribute("usuariosession");
        int userId = usuario.getUserId();
        LoginDAO loginDAO = new LoginDAO();
        int rolId = usuario.getRol().getRolId();

        if (rolId == 2) { // Usuario tipo Albergue

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
            int recordsPerPage = 6;

            List<Eventos> eventos;
            int totalRecords;
            if (tipoEventoId != null || distritoId != null || fechaInicio != null || fechaFin != null) {
                totalRecords = eventosDAO.contarMisEventosActivosConFiltros(userId, tipoEventoId, distritoId, fechaInicio, fechaFin);
                eventos = eventosDAO.verMisEventosActivos(userId, tipoEventoId, distritoId, fechaInicio, fechaFin, page, recordsPerPage);
            } else {
                totalRecords = eventosDAO.contarMisEventosActivos(userId);
                eventos = eventosDAO.obtenerMisEventosActivosConPaginacion(userId, page, recordsPerPage);
            }

            int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);

            request.setAttribute("totalPages", totalPages);
            request.setAttribute("page", page);
            request.setAttribute("totalRecords", totalRecords);
            request.setAttribute("eventosInscritos", eventos);

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

            // System.out.println("Tipos de eventos: " + tiposEventos.size());
            // System.out.println("Eventos activos: " + eventos.size());
            // System.out.println("Filtro de distrito ID: " + distritoId);
            // System.out.println("Fecha Inicio: " + fechaInicio);
            // System.out.println("Fecha Fin: " + fechaFin);
            // System.out.println("Cantidad de eventos: " + (eventos != null ? eventos.size() : "null"));
            // System.out.println("Cantidad de tipos de eventos: " + (tiposEventos != null ? tiposEventos.size() : "null"));
            // System.out.println("Cantidad de distritos: " + (distritos != null ? distritos.size() : "null"));

            request.getRequestDispatcher("/WEB-INF/albergue/albergue-ver-miseventos.jsp").forward(request, response);

        } else if (rolId == 1) { // Usuario Final

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
            int recordsPerPage = 6;

            List<Eventos> eventos;
            int totalRecords;
            if (tipoEventoId != null || distritoId != null || fechaInicio != null || fechaFin != null) {
                totalRecords = eventosDAO.contarEventosInscritosConFiltrosUsuario(userId, tipoEventoId, distritoId, fechaInicio, fechaFin);
                eventos = eventosDAO.verMisEventosInscritosUsuario(userId, tipoEventoId, distritoId, fechaInicio, fechaFin, page, recordsPerPage);
            } else {
                totalRecords = eventosDAO.contarEventosInscritosUsuario(userId);
                eventos = eventosDAO.obtenerMisEventosInscritosUsuarioConPaginacion(userId, page, recordsPerPage);
            }


            int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);

            request.setAttribute("totalPages", totalPages);
            request.setAttribute("page", page);
            request.setAttribute("totalRecords", totalRecords);
            request.setAttribute("eventosInscritos", eventos);

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

            // System.out.println("Tipos de eventos: " + tiposEventos.size());
            // System.out.println("Eventos activos: " + eventos.size());
            // System.out.println("Filtro de distrito ID: " + distritoId);
            // System.out.println("Fecha Inicio: " + fechaInicio);
            // System.out.println("Fecha Fin: " + fechaFin);
            // System.out.println("Cantidad de eventos: " + (eventos != null ? eventos.size() : "null"));
            // System.out.println("Cantidad de tipos de eventos: " + (tiposEventos != null ? tiposEventos.size() : "null"));
            // System.out.println("Cantidad de distritos: " + (distritos != null ? distritos.size() : "null"));

            request.getRequestDispatcher("/WEB-INF/UsuarioFinal/ver-miseventos-usuario.jsp").forward(request, response);

        } else {
            response.sendRedirect("login");
        }

    }


}
