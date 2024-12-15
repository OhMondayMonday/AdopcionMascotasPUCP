package Controllers;
import Beans.*;
import DTO.HogarTemporalDTO;

import Daos.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
                case "aprobarSolicitudHogar":
                    aprobarSolicitudHogar(request, response);
                    break;
                case "rechazarSolicitudHogar":
                    rechazarSolicitudHogar(request, response);
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
                    System.out.println("Zona ID seleccionado: " + zonaId);  // Depuración del zonaId

                    List<Distritos> distritos = coordinadorDAO.obtenerDistritosPorZona(zonaId); // Obtener distritos
                    System.out.println("Distritos encontrados: " + distritos.size());  // Depuración de los distritos encontrados

                    // Pasar distritos a la JSP
                    if (distritos.isEmpty()) {
                        System.out.println("No hay distritos para esta zona.");
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
        } else if ("aprobar".equals(action)) {
            manejarSolicitud(request, response, true);
        } else if ("rechazar".equals(action)) {
            manejarSolicitud(request, response, false); // Rechazar solicitud
        } else if ("banear".equals(action)) {
            manejarBaneo(request, response);
        }
    }

    private void manejarSolicitud(HttpServletRequest request, HttpServletResponse response, boolean aprobar) throws IOException {
        int solicitudId = parseParameterToInt(request, "solicitudId");

        boolean exito = aprobar
                ? coordinadorDAO.rechazarSolicitudHogar(solicitudId)
                : coordinadorDAO.rechazarSolicitudHogar(solicitudId);

        String mensaje = exito
                ? (aprobar ? "Solicitud aprobada exitosamente." : "Solicitud rechazada exitosamente.")
                : "Error al procesar la solicitud.";
        redirectWithMessage(response, "listarSolicitudesHogar", mensaje);
    }

    private void manejarBaneo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int temporalId = parseParameterToInt(request, "temporalId");

        boolean baneado = coordinadorDAO.banearHogarTemporalManual(temporalId);
        String mensaje = baneado
                ? "Hogar temporal baneado exitosamente."
                : "Error al banear el hogar temporal.";
        redirectWithMessage(response, "listarGestionHogares", mensaje);
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

            // Crear el objeto Usuarios y establecer los datos del formulario
            Usuarios coordinador = new Usuarios();
            coordinador.setUserId(id);
            coordinador.setUsername(request.getParameter("username")); // Username
            coordinador.setNombre(request.getParameter("nombre")); // Nombre de persona
            coordinador.setApellido(request.getParameter("apellido"));
            coordinador.setEmail(request.getParameter("email"));
            coordinador.setDireccion(request.getParameter("direccion"));
            coordinador.setNumeroYapePlin(request.getParameter("numeroYapePlin"));

            // Obtener la zona seleccionada
            String zonaSeleccionada = request.getParameter("zona");
            if (zonaSeleccionada != null && !zonaSeleccionada.isEmpty()) {
                Zonas zona = new Zonas();
                zona.setZonaId(Integer.parseInt(zonaSeleccionada)); // Asignamos la zona seleccionada
                coordinador.setZona(zona); // Establecemos la zona en el objeto coordinador
            } else {
                // Si la zona no es seleccionada, se puede dejar en null o asignar una zona por defecto
                coordinador.setZona(null);
            }

            // Llamar al método del DAO para actualizar la información
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

        // Verificar si la actualización fue exitosa y redirigir con el mensaje correspondiente
        String mensaje = aprobado ? "Solicitud aprobada con éxito" : "Error al aprobar solicitud";
        redirectWithMessage(response, "listarSolicitudesHogar", mensaje);
    }

    private void rechazarSolicitudHogar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int solicitudId = parseParameterToInt(request, "solicitudId");
        boolean rechazado = coordinadorDAO.rechazarSolicitudHogar(solicitudId);

        // Verificar si la actualización fue exitosa y redirigir con el mensaje correspondiente
        String mensaje = rechazado ? "Solicitud rechazada con éxito" : "Error al rechazar solicitud";
        redirectWithMessage(response, "listarSolicitudesHogar", mensaje);
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
