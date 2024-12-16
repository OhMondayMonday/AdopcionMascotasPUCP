package Controllers;
import Beans.*;
import DTO.HogarTemporalDTO;

import Daos.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;


import java.io.IOException;
import java.sql.Date;
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
            // 1. Verifica el parámetro id para las acciones "verMiPerfilDetalles" y "editarPerfil"
            String idStr = request.getParameter("id");
            if ("verMiPerfilDetalles".equals(action) || "editarPerfil".equals(action)) {
                if (idStr == null || idStr.isEmpty()) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID no proporcionado");
                    return;  // Termina el flujo de ejecución aquí, no se realiza más ningún forward o sendError después.
                }
            }

            // 2. Maneja las diferentes acciones
            switch (action) {
                case "listarSolicitudesHogar":
                    listarSolicitudesHogar(request, response);
                    break;
                case "listarGestionHogares":
                    listarGestionHogares(request, response);
                    break;
                case "banearHogarTemporal":
                    banearHogarTemporal(request, response);
                    break;
                case "editarPerfil":
                    try {
                        int id = Integer.parseInt(idStr);
                        Usuarios coordinador = coordinadorDAO.obtenerInformacionCoordinador(id);
                        if (coordinador == null) {
                            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Coordinador no encontrado");
                            return; // Termina el flujo aquí
                        }
                        request.setAttribute("usuario", coordinador);
                        request.getRequestDispatcher("/WEB-INF/coordinador/coordinador-editar-perfil.jsp").forward(request, response);
                    } catch (NumberFormatException e) {
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de ID no válido");
                        return; // Termina el flujo aquí
                    }
                    break;
                case "verMiPerfilSeguridad":
                    request.getRequestDispatcher("/WEB-INF/coordinador/coordinador-ver-miperfil-seguridad.jsp").forward(request, response);
                    break;
                // Dentro del caso para "verMiPerfilDetalles"
                case "verMiPerfilDetalles":
                    try {
                        int id = Integer.parseInt(idStr);
                        Usuarios coordinadorDetalle = coordinadorDAO.obtenerInformacionCoordinador(id);
                        if (coordinadorDetalle == null) {
                            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Coordinador no encontrado");
                            return; // Termina el flujo aquí
                        }
                        request.setAttribute("usuario", coordinadorDetalle);

                        // Obtén el ID de la zona que está asociada al coordinador
                        // Obtener los distritos por zona
                        int zonaId = coordinadorDetalle.getZona().getZonaId(); // Zona asociada al coordinador
                        List<Distritos> distritos = coordinadorDAO.obtenerDistritosPorZona(zonaId);

// Asegúrate de que la lista de distritos no esté vacía
                        if (distritos == null || distritos.isEmpty()) {
                            System.out.println("No hay distritos para esta zona.");
                        } else {
                            System.out.println("Distritos obtenidos: " + distritos.size());
                        }

// Pasar los distritos al JSP
                        request.setAttribute("distritos", distritos);

                        // Redirigir a la página del perfil
                        request.getRequestDispatcher("/WEB-INF/coordinador/coordinador-miperfil-detalles.jsp").forward(request, response);
                    } catch (NumberFormatException e) {
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de ID no válido");
                        return; // Termina el flujo aquí
                    }
                    break;

            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Ocurrió un error al procesar la solicitud.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // Define la respuesta en formato JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Obtener ID de solicitud y temporal (según el tipo de solicitud)
        String solicitudIdStr = request.getParameter("solicitudId");
        String temporalIdStr = request.getParameter("temporalId");

        // Verifica que los IDs de solicitud o temporal sean válidos
        int solicitudId = (solicitudIdStr != null && !solicitudIdStr.isEmpty()) ? Integer.parseInt(solicitudIdStr) : -1;
        int temporalId = (temporalIdStr != null && !temporalIdStr.isEmpty()) ? Integer.parseInt(temporalIdStr) : -1;

        // Lógica para manejar las diferentes acciones
        if ("registrar".equals(action)) {
            registrarCoordinador(request, response);
        } else if ("actualizar".equals(action)) {
            actualizarCoordinador(request, response);
        } else if ("seleccionarZona".equals(action)) { // Acción para manejar la zona
            String zonaIdStr = request.getParameter("zonaId");

            // Validar que zonaId no esté vacío o nulo
            if (zonaIdStr != null && !zonaIdStr.isEmpty()) {
                try {
                    int zonaId = Integer.parseInt(zonaIdStr); // Obtener zonaId como entero
                    List<Distritos> distritos = coordinadorDAO.obtenerDistritosPorZona(zonaId); // Obtener distritos

                    // Pasar distritos a la JSP
                    if (distritos.isEmpty()) {
                        request.setAttribute("mensaje", "No hay distritos para esta zona.");
                    } else {
                        request.setAttribute("distritos", distritos);
                    }

                    // Redirigir de nuevo a la vista donde se muestran los distritos
                    request.getRequestDispatcher("/WEB-INF/coordinador/coordinador-editar-perfil.jsp").forward(request, response);

                } catch (NumberFormatException e) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de zona ID no válido");
                }
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Zona no seleccionada");
            }

        } else if ("aprobarHogar".equals(action)) { // Acción para aprobar la solicitud de hogar temporal
            boolean success = coordinadorDAO.aprobarHogarTemporal(temporalId);  // Llamada al método para aprobar
            String jsonResponse = success
                    ? "{\"success\": true, \"message\": \"Solicitud aprobada con éxito.\"}"
                    : "{\"success\": false, \"message\": \"Error al aprobar la solicitud.\"}";

            response.getWriter().write(jsonResponse);

        } else if ("rechazarHogar".equals(action)) { // Acción para rechazar la solicitud de hogar temporal
            boolean success = coordinadorDAO.rechazarHogarTemporal(temporalId);  // Llamada al método para rechazar
            String jsonResponse = success
                    ? "{\"success\": true, \"message\": \"Solicitud rechazada con éxito.\"}"
                    : "{\"success\": false, \"message\": \"Error al rechazar la solicitud.\"}";

            response.getWriter().write(jsonResponse);

        } else if ("aprobarMascota".equals(action)) { // Acción para aprobar la solicitud de mascota perdida
            boolean success = coordinadorDAO.aprobarSolicitudMascota(solicitudId);  // Llamada al método para aprobar solicitud de mascota perdida
            String jsonResponse = success
                    ? "{\"success\": true, \"message\": \"Solicitud de mascota perdida aprobada con éxito.\"}"
                    : "{\"success\": false, \"message\": \"Error al aprobar la solicitud de mascota perdida.\"}";

            response.getWriter().write(jsonResponse);

        } else if ("rechazarMascota".equals(action)) { // Acción para rechazar la solicitud de mascota perdida
            boolean success = coordinadorDAO.rechazarSolicitudMascota(solicitudId);  // Llamada al método para rechazar solicitud de mascota perdida
            String jsonResponse = success
                    ? "{\"success\": true, \"message\": \"Solicitud de mascota perdida rechazada con éxito.\"}"
                    : "{\"success\": false, \"message\": \"Error al rechazar la solicitud de mascota perdida.\"}";

            response.getWriter().write(jsonResponse);
        }
    }


    // Método auxiliar para enviar la respuesta JSON
    private void enviarRespuesta(HttpServletResponse response, boolean success, String message) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String jsonResponse = "{\"success\": " + success + ", \"message\": \"" + message + "\"}";
        out.write(jsonResponse);
        out.flush();
    }



    private void registrarCoordinador(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Usuarios coordinador = new Usuarios();
            // Obtener los parámetros del formulario
            coordinador.setUsername(request.getParameter("username"));
            coordinador.setContrasenia(request.getParameter("contrasenia"));
            coordinador.setNombre(request.getParameter("nombre"));
            coordinador.setApellido(request.getParameter("apellido"));
            coordinador.setEmail(request.getParameter("email"));
            coordinador.setDni(request.getParameter("dni"));
            coordinador.setDireccion(request.getParameter("direccion"));

            // Manejo del año de creación
            String anioCreacionStr = request.getParameter("anioCreacion");
            if (anioCreacionStr != null && !anioCreacionStr.isBlank()) { // Validar nulo o vacío
                try {
                    Date anioCreacion = Date.valueOf(anioCreacionStr); // Formato yyyy-MM-dd
                    coordinador.setAnioCreacion(anioCreacion);
                } catch (IllegalArgumentException e) {
                    response.getWriter().write("Error: Fecha de creación inválida");
                    return;
                }
            } else {
                coordinador.setAnioCreacion(null); // Establecer como nulo si no se proporciona
            }


            // Guardar en la base de datos
            if (coordinadorDAO.registrarCoordinador(coordinador)) {
                response.sendRedirect("coordinador?action=verMiPerfilDetalles");
            } else {
                response.getWriter().write("Error: No se pudo registrar el coordinador");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }

    private void actualizarCoordinador(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            // Configuración de caracteres
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");

            // Obtener y verificar el ID del usuario
            String idStr = request.getParameter("id");
            if (idStr == null || idStr.isEmpty()) {
                response.getWriter().write("Error: ID no proporcionado");
                return;
            }
            int id;
            try {
                id = Integer.parseInt(idStr);
            } catch (NumberFormatException e) {
                response.getWriter().write("Error: Formato de ID no válido");
                return;
            }

            System.out.println("ID Capturado en el Servlet: " + id);
            Usuarios coordinador = new Usuarios();
            coordinador.setUserId(id);
            coordinador.setUsername(request.getParameter("username")); // Username
            coordinador.setNombre(request.getParameter("nombre")); // Nombre de persona
            coordinador.setApellido(request.getParameter("apellido"));
            coordinador.setEmail(request.getParameter("email"));
            coordinador.setDireccion(request.getParameter("direccion"));
            coordinador.setNumeroYapePlin(request.getParameter("numeroYapePlin"));

            String zonaSeleccionada = request.getParameter("zona");
            if (zonaSeleccionada != null && !zonaSeleccionada.isEmpty()) {
                Zonas zona = new Zonas();
                zona.setZonaId(Integer.parseInt(zonaSeleccionada)); // Asignamos la zona seleccionada
                coordinador.setZona(zona); // Establecemos la zona en el objeto coordinador
            } else {
                coordinador.setZona(null);
            }

            if (coordinadorDAO.actualizarInformacionCoordinador(coordinador)) {
                // Redirigir al perfil con los detalles actualizados
                response.sendRedirect("coordinador?action=verMiPerfilDetalles&id=" + id);
            } else {
                response.getWriter().write("Error: No se pudo actualizar la información del coordinador. Verifique los datos y vuelva a intentarlo.");
            }
        } catch (Exception e) {
            // Manejo general de excepciones
            e.printStackTrace();
            response.getWriter().write("Error: Ocurrió un error al procesar la solicitud. Detalles: " + e.getMessage());
        }
    }

    // Método para listar solicitudes de hogares temporales (paginadas)
    private void listarSolicitudesHogar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageSize = 10;
        int currentPage = getCurrentPage(request);
        int offset = (currentPage - 1) * pageSize;
        int coordinadorId = 4; // Cambiar por el ID real del coordinador cuando esté disponible

        List<HogarTemporalDTO> solicitudes = coordinadorDAO.obtenerSolicitudesHogarPaginadas(offset, pageSize, coordinadorId);

        System.out.println("Tamaño de la lista solicitudes: " + solicitudes.size());
        for (HogarTemporalDTO hogarDTO : solicitudes) {
            System.out.println("Hogar ID: " + hogarDTO.getTemporalId() + ", Dirección: " + hogarDTO.getDireccion());
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
            System.out.println("Hogar ID: " + hogar.getTemporalId() + ", Dirección: " + hogar.getDireccion());
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
