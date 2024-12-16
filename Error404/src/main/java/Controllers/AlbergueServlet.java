package Controllers;

import Beans.Usuarios;
import Beans.HogaresTemporales;
import java.sql.Date;
import Daos.AlbergueDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import Beans.Distritos;
import Beans.Mascotas;
import Beans.Razas;
import Beans.Fotos;
import Daos.HogarTemporalDAO;
import java.io.File;
import Daos.MascotaDAO;
import Daos.FotosDAO;
import Daos.SolicitudDAO;
import Daos.RazasDao;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.sql.SQLException;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 5,   // 5MB
        maxRequestSize = 1024 * 1024 * 10 // 10MB
)
@WebServlet("/albergue")
public class AlbergueServlet extends HttpServlet {

    private AlbergueDAO albergueDAO;
    private HogarTemporalDAO hogarTemporalDAO;
    @Override
    public void init() throws ServletException {
        albergueDAO = new AlbergueDAO();
        hogarTemporalDAO = new HogarTemporalDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "editarPerfil";
        }

        switch (action) {
            case "inicio":
                // Redirige al JSP del dashboard del albergue
                request.getRequestDispatcher("/WEB-INF/albergue/albergue-ver-inicio.jsp").forward(request, response);
                break;
            case "editarPerfil":
                String idStr = request.getParameter("id");
                if (idStr == null || idStr.isEmpty()) {
                    response.getWriter().write("Error: ID no proporcionado");
                    return;
                }
                try {
                    int id = Integer.parseInt(idStr); // Usa la variable 'id' aquí
                    Usuarios albergue = albergueDAO.obtenerInformacionAlbergue(id);
                    if (albergue == null) {
                        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Albergue no encontrado");
                        return;
                    }

                    request.setAttribute("usuario", albergue);
                    request.getRequestDispatcher("/WEB-INF/albergue/albergue-editar-perfil.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de ID no válido");
                }
                break;
            case "verMiPerfilSeguridad":
                request.getRequestDispatcher("/WEB-INF/albergue/albergue-ver-miperfil-seguridad.jsp").forward(request, response);
                break;
            case "verMiPerfilDetalles":
                String idDetalle = request.getParameter("id");
                if (idDetalle == null || idDetalle.isEmpty()) {
                    System.out.println("Error: ID no proporcionado para ver detalles.");
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID no proporcionado");
                    return;
                }
                try {
                    int id = Integer.parseInt(idDetalle);
                    Usuarios albergueDetalle = albergueDAO.obtenerInformacionAlbergue(id);
                    if (albergueDetalle == null) {
                        System.out.println("Error: Albergue con ID " + id + " no encontrado.");
                        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Albergue no encontrado");
                        return;
                    }
                    System.out.println("Albergue recuperado: " + albergueDetalle.getNombreAlbergue());
                    request.setAttribute("usuario", albergueDetalle);
                    request.getRequestDispatcher("/WEB-INF/albergue/albergue-ver-miperfil-detalles.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                    System.out.println("Error: ID en formato incorrecto.");
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de ID no válido");
                }
                break;

            case "hogaresTemporales":
                HogarTemporalDAO hogarTemporalDAO = new HogarTemporalDAO();

                // Parámetros para filtros (puedes obtenerlos del request si los estás usando)
                String palabraClave = request.getParameter("palabraClave");
                String tipoMascota = request.getParameter("tipoMascota");
                String distrito = request.getParameter("distrito");

                // Manejo del filtro "Todas" en distrito

                if (distrito != null && "Todas".equals(distrito)) {
                    distrito = null; // Asigna null si es "Todas"
                }

                // Valores por defecto para paginación
                int page = 1;
                int size = 6; // Cantidad de resultados por página
                if (request.getParameter("page") != null) {
                    page = Integer.parseInt(request.getParameter("page"));
                }
                int start = (page - 1) * size;

                // Obtén la lista de hogares temporales
                List<HogaresTemporales> hogares = hogarTemporalDAO.filtrarHogaresConPaginacion(palabraClave, tipoMascota, distrito, start, size);

                // Contar total de registros para la paginación
                int totalRegistros = hogarTemporalDAO.contarTotalPublicacionesFiltradas(palabraClave, tipoMascota, distrito);
                int totalPages = (int) Math.ceil((double) totalRegistros / size);

                // Configura atributos para el JSP
                request.setAttribute("hogares", hogares);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);

                // Redirige a la vista JSP
                request.getRequestDispatcher("/WEB-INF/albergue/AL-HogaresTemporales.jsp").forward(request, response);
                break;

            case "enviarSolicitud":
                // Redirige al formulario JSP para enviar la solicitud
                request.getRequestDispatcher("/WEB-INF/albergue/AL-EnviarSolicitud.jsp").forward(request, response);
                break;

            default:
                request.getRequestDispatcher("/WEB-INF/albergue/albergue-ver-miperfil-detalles.jsp").forward(request, response);

                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("registrar".equals(action)) {
            registrarAlbergue(request, response);
        } else if ("actualizar".equals(action)) {
            actualizarAlbergue(request, response);
        } else if ("desactivar".equals(action)) {
            desactivarAlbergue(request, response);
        } else if ("enviarSolicitud".equals(action)) {
            enviarSolicitudMascota(request, response); // Llama al método que implementaremos
        }
    }

    private void enviarSolicitudMascota(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        System.out.println("---- Depuración: Inicio de enviarSolicitudMascota ----");
        System.out.println("razaId (param): " + request.getParameter("razaId"));
        System.out.println("solicitadoId (param): " + request.getParameter("solicitadoId"));
        System.out.println("foto (part): " + request.getPart("foto").getSubmittedFileName());
        System.out.println("nombreMascota: " + request.getParameter("nombreMascota"));
        System.out.println("edadAproximada: " + request.getParameter("edadAproximada"));
        System.out.println("genero: " + request.getParameter("genero"));
        System.out.println("tamanio: " + request.getParameter("tamanio"));
        System.out.println("descripcion: " + request.getParameter("descripcion"));
        System.out.println("usuarioId (session): " + request.getSession().getAttribute("usuarioId"));


        String razaIdParam = request.getParameter("razaId");
        String solicitadoIdParam = request.getParameter("solicitadoId");

        if (razaIdParam == null || razaIdParam.isEmpty() || solicitadoIdParam == null || solicitadoIdParam.isEmpty()) {
            System.out.println("Error: razaId o solicitadoId están vacíos o nulos");
            request.setAttribute("error", "Debe seleccionar la raza y proporcionar un ID válido.");
            request.getRequestDispatcher("/WEB-INF/albergue/AL-EnviarSolicitud.jsp").forward(request, response);
            return;
        }

        int razaId = Integer.parseInt(request.getParameter("razaId"));
        int solicitadoId = Integer.parseInt(request.getParameter("solicitadoId")); // ID del hogar temporal

        // Manejo de la imagen
        Part part = request.getPart("foto");
        int fotoId = subirImagen(part); // Guarda la imagen en la carpeta Mascotas

        // Crea el objeto mascota
        Mascotas mascota = new Mascotas();
        mascota.setNombre(request.getParameter("nombreMascota"));
        mascota.setEdadAproximada(Integer.parseInt(request.getParameter("edadAproximada")));
        mascota.setGenero(request.getParameter("genero"));
        mascota.setTamanio(request.getParameter("tamanio"));
        mascota.setDescripcion(request.getParameter("descripcion"));

        Razas raza = new Razas();
        raza.setRazaId(razaId);
        mascota.setRaza(raza);

        Fotos foto = new Fotos();
        foto.setFotoId(fotoId); // Aquí usas el URL retornado por subirImagen()
        mascota.setFoto(foto);

        // Inserta la mascota en la base de datos
        MascotaDAO mascotaDAO = new MascotaDAO();
        int mascotaId = mascotaDAO.agregarMascota(mascota);

        // Inserta la solicitud en la tabla solicitudes
        SolicitudDAO solicitudDAO = new SolicitudDAO();
        int solicitanteId = (int) request.getSession().getAttribute("usuarioId"); // Obtener ID del albergue de sesión
        boolean exito = solicitudDAO.insertarSolicitudMascota(solicitanteId, solicitadoId, mascotaId);

        if (exito) {
            response.sendRedirect("albergue?action=hogaresTemporales&mensaje=exito");
        } else {
            request.setAttribute("error", "No se pudo enviar la solicitud. Inténtalo nuevamente.");
            request.getRequestDispatcher("/WEB-INF/albergue/AL-EnviarSolicitud.jsp").forward(request, response);
        }
    }

    private int subirImagen(Part part) throws IOException {
        String nombreArchivo = part.getSubmittedFileName();

        // Guardar la URL relativa
        FotosDAO fotosDAO = new FotosDAO();
        String urlFoto = "assets/img/Mascotas/" + nombreArchivo; // URL relativa
        fotosDAO.agregarFotoPubli(urlFoto);

        // Obtener el ID de la foto
        return fotosDAO.obtenerIdPorUrl(urlFoto).getFotoId();
    }

    private void registrarAlbergue(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Usuarios albergue = new Usuarios();
            // Obtener los parámetros del formulario
            albergue.setUsername(request.getParameter("username"));
            albergue.setContrasenia(request.getParameter("contrasena"));
            albergue.setNombre(request.getParameter("nombre"));
            albergue.setApellido(request.getParameter("apellido"));
            albergue.setEmail(request.getParameter("email"));
            albergue.setDni(request.getParameter("dni"));
            albergue.setDireccion(request.getParameter("direccion"));
            albergue.setNombreAlbergue(request.getParameter("nombreAlbergue"));

            // Manejo del año de creación
            String anioCreacionStr = request.getParameter("anioCreacion");
            if (anioCreacionStr != null && !anioCreacionStr.isBlank()) { // Validar nulo o vacío
                try {
                    Date anioCreacion = Date.valueOf(anioCreacionStr); // Formato yyyy-MM-dd
                    albergue.setAnioCreacion(anioCreacion);
                } catch (IllegalArgumentException e) {
                    response.getWriter().write("Error: Fecha de creación inválida");
                    return;
                }
            } else {
                albergue.setAnioCreacion(null); // Establecer como nulo si no se proporciona
            }


            // Guardar en la base de datos
            if (albergueDAO.registrarAlbergue(albergue)) {
                response.sendRedirect("albergue?action=verMiPerfilDetalles");
            } else {
                response.getWriter().write("Error: No se pudo registrar el albergue");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }

    private void actualizarAlbergue(HttpServletRequest request, HttpServletResponse response) throws IOException {
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
            Usuarios albergue = new Usuarios();
            albergue.setUserId(id);
            albergue.setUsername(request.getParameter("username")); // Username
            albergue.setNombre(request.getParameter("nombre")); // Nombre de persona
            albergue.setNombreAlbergue(request.getParameter("nombreAlbergue")); // Nombre de albergue
            albergue.setApellido(request.getParameter("apellido"));
            albergue.setEmail(request.getParameter("email"));
            albergue.setDireccion(request.getParameter("direccion"));
            albergue.setDescripcion(request.getParameter("descripcion"));
            albergue.setUrlTwitter(request.getParameter("urlTwitter")); // Agregar Twitter
            albergue.setUrlFacebook(request.getParameter("urlFacebook"));
            albergue.setUrlInstagram(request.getParameter("urlInstagram"));
            albergue.setNumeroYapePlin(request.getParameter("numeroYapePlin"));
            albergue.setDireccionDonaciones(request.getParameter("direccionDonaciones"));
            albergue.setNombreContactoDonaciones(request.getParameter("nombreContactoDonaciones"));
            albergue.setNumeroContactoDonaciones(request.getParameter("numeroContactoDonaciones"));
            albergue.setPuntoAcopio(request.getParameter("puntoAcopio"));

            String anioCreacionStr = request.getParameter("anioCreacion");
            if (anioCreacionStr != null && !anioCreacionStr.isBlank()) { // isBlank() maneja nulos y espacios
                try {
                    Date anioCreacion = Date.valueOf(anioCreacionStr); // Formato yyyy-MM-dd
                    albergue.setAnioCreacion(anioCreacion);
                } catch (IllegalArgumentException e) {
                    response.getWriter().write("Error: Fecha de creación inválida");
                    return;
                }
            } else {
                albergue.setAnioCreacion(null); // Manejarlo como `null` si está vacío o no proporcionado
            }

            String capacidadStr = request.getParameter("capacidad");
            if (capacidadStr != null && !capacidadStr.isBlank()) {
                try {
                    albergue.setCapacidadNuevosAnimales(Integer.parseInt(capacidadStr));
                } catch (NumberFormatException e) {
                    System.out.println("Capacidad inválida: " + capacidadStr);
                    response.getWriter().write("Error: Capacidad inválida");
                    return;
                }
            } else {
                albergue.setCapacidadNuevosAnimales(null);
            }

            // Asignar el distrito
            String distritoIdStr = request.getParameter("distritoId");
            if (distritoIdStr != null && !distritoIdStr.isEmpty()) {
                try {
                    int distritoId = Integer.parseInt(distritoIdStr);
                    Distritos distrito = new Distritos();
                    distrito.setDistritoId(distritoId);
                    albergue.setDistrito(distrito);
                } catch (NumberFormatException e) {
                    response.getWriter().write("Error: Distrito ID no válido");
                    return;
                }
            } else {
                response.getWriter().write("Error: Distrito ID no proporcionado o vacío");
                return;
            }

            // Llamar al método del DAO para actualizar la información
            if (albergueDAO.actualizarInformacionAlbergue(albergue)) {
                // Redirigir al perfil con los detalles actualizados
                response.sendRedirect("albergue?action=verMiPerfilDetalles&id=" + id);
            } else {
                response.getWriter().write("Error: No se pudo actualizar la información del albergue. Verifique los datos y vuelva a intentarlo.");
            }
        } catch (Exception e) {
            // Manejo general de excepciones
            e.printStackTrace();
            response.getWriter().write("Error: Ocurrió un error al procesar la solicitud. Detalles: " + e.getMessage());
        }
    }



    private void desactivarAlbergue(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            if (albergueDAO.desactivarCuentaAlbergue(id)) {
                response.sendRedirect("albergue?action=verMiPerfilDetalles");
            } else {
                response.getWriter().write("Error: No se pudo desactivar la cuenta del albergue");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.getWriter().write("Error: ID no válido");
        }
    }
}
