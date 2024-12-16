package Controllers;

import Beans.HogaresTemporales;
import Beans.Usuarios;
import Beans.Solicitudes;
import Beans.Distritos;
import Beans.Fotos;
import Beans.Roles;
import Daos.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.nio.file.Paths; // Para trabajar con rutas de archivos
import jakarta.servlet.http.Part; // Para manejar la parte del archivo en el formulario
import jakarta.servlet.annotation.MultipartConfig;
import java.io.File;

import java.io.IOException;
import java.util.List;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)

@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {

    private UsuarioDAO usuarioDAO = new UsuarioDAO();
    private UsuarioFinalDAO usuarioFinalDAO = new UsuarioFinalDAO();
    private HogarTemporalDAO hogarTemporalDAO = new HogarTemporalDAO();
    private MiHogarTemporalDAO miHogarTemporalDAO = new MiHogarTemporalDAO();
    private PostularHogarTemporalDAO postularHogarTemporalDAO = new PostularHogarTemporalDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "home" : request.getParameter("action");
        RequestDispatcher rd;

        switch (action) {

            case "verMiPerfil":
                mostrarDetallesPerfil(request, response, "ver-miperfil-usuario-detalles");
                break;

            case "verMiSeguridad":
                mostrarDetallesPerfil(request, response, "ver-miperfil-usuario-seguridad");
                break;

            case "miHogarTemporal":
                Usuarios usuarioLogueado = (Usuarios) request.getSession().getAttribute("usuariosession");
                if (usuarioLogueado == null) {
                    response.sendRedirect("login");
                    return;
                }

                // Usa el ID del usuario logueado para obtener las solicitudes y detalles
                Usuarios usuario = miHogarTemporalDAO.obtenerDetallesUsuarioTemporal(usuarioLogueado.getUserId());


                if (usuario == null || usuario.getHogarTemporal() == null || usuario.getHogarTemporal().getTemporalId() == 0) {
                    // Usuario no es hogar temporal
                    request.setAttribute("mostrarAviso", true);
                    request.setAttribute("solicitudesMascotas", null); // No enviar lista de solicitudes
                } else {
                    // Usuario es hogar temporal
                    List<Solicitudes> solicitudesMascotas = miHogarTemporalDAO.obtenerTodasLasSolicitudes();
                    request.setAttribute("mostrarAviso", false);
                    request.setAttribute("solicitudesMascotas", solicitudesMascotas);
                }

                request.setAttribute("usuario", usuario);

                rd = request.getRequestDispatcher("/WEB-INF/UsuarioFinal/UF-MiHogarTemporal.jsp");
                rd.forward(request, response);
                break;

            case "hogarTemporal":

                mostrarHogaresTemporales(request, response);
                break;
            case "postularHogarTemporal":
                usuarioLogueado = (Usuarios) request.getSession().getAttribute("usuariosession");

                if (usuarioLogueado != null) {
                    // Asignar los atributos del usuario logueado
                    request.setAttribute("nombreUsuario", usuarioLogueado.getNombre());
                    request.setAttribute("apellidoUsuario", usuarioLogueado.getApellido());
                } else {
                    // Si no hay usuario logueado, redirigir al login
                    response.sendRedirect("login");
                    return;
                }

                // Mostrar el formulario de postulación
                mostrarFormularioPostulacion(request, response);
                break;

            default:
                rd = request.getRequestDispatcher("/WEB-INF/Inicio-usuario.jsp");
                rd.forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "aceptarMascota":
                aceptarMascota(request, response);
                break;

            case "rechazarMascota":
                rechazarSolicitud(request, response);
                break;
            case "registrarSolicitud":
                registrarSolicitud(request, response);
                break;

            case "guardarHogarTemporal":
                guardarHogarTemporal(request, response);
                break;
            case "actualizarContrasenia":
                cambiarContrasenia(request, response);
                break;

            default:
                request.getRequestDispatcher("/WEB-INF/Inicio-usuario.jsp").forward(request, response);
                break;
        }
    }
    private void aceptarMascota(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Leer parámetros del JSP
        String solicitudIdParam = request.getParameter("solicitudId");
        String hogarTemporalIdParam = request.getParameter("hogarTemporalId");

        // Convertir a enteros (si falla, se captura la excepción)
        try {
            int solicitudId = Integer.parseInt(solicitudIdParam);
            int hogarTemporalId = Integer.parseInt(hogarTemporalIdParam);


            // Llamar al DAO
            boolean exito = miHogarTemporalDAO.aceptarMascota(solicitudId, hogarTemporalId);

            if (exito) {
                System.out.println("Solicitud aceptada exitosamente.");
                response.sendRedirect("UsuarioServlet?action=miHogarTemporal&mensaje=aceptada");
            } else {
                System.out.println("Error al aceptar la solicitud en la base de datos.");
                response.sendRedirect("UsuarioServlet?action=miHogarTemporal&error=errorAceptar");
            }
        } catch (NumberFormatException e) {
            System.out.println("Error al convertir los parámetros a enteros: " + e.getMessage());
            response.sendRedirect("UsuarioServlet?action=miHogarTemporal&error=parametrosInvalidos");
        }
    }

    private void rechazarSolicitud(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int solicitudId = Integer.parseInt(request.getParameter("solicitudId"));

        // Llamar al método DAO para eliminar la solicitud
        boolean exito = miHogarTemporalDAO.eliminarSolicitud(solicitudId);

        if (exito) {
            // Redirige con un mensaje de éxito
            response.sendRedirect("UsuarioServlet?action=miHogarTemporal");
        } else {
            // Manejar error al eliminar la solicitud
            request.setAttribute("error", "No se pudo eliminar la solicitud.");
            request.getRequestDispatcher("/WEB-INF/UsuarioFinal/UF-MiHogarTemporal.jsp").forward(request, response);
        }
    }
    // Metodo para obtener todos mis detalles de usuario
    private void mostrarDetallesPerfil(HttpServletRequest request, HttpServletResponse response, String view) throws ServletException, IOException {
        int userId = 1; // ID de usuario para simulación

        // Obtener detalles del usuario desde el DAO
        Usuarios usuario = usuarioFinalDAO.obtenerInformacionUsuario(userId);

        if (usuario != null) {
            // Pasar datos al JSP
            request.setAttribute("usuario", usuario);
        } else {
            // Manejar el caso en que no se encuentre el usuario
            request.setAttribute("error", "No se encontraron detalles para el usuario especificado.");
        }

        // Para redirigir a los jsps
        String jspPath = "/WEB-INF/UsuarioFinal/" + view + ".jsp";
        RequestDispatcher rd = request.getRequestDispatcher(jspPath);
        rd.forward(request, response);

    }

    // Metodo para enviar la contraseña del formulario en perfil seguridad usuario
    private void cambiarContrasenia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = 1; // Simulación
        String nuevaContrasenia = request.getParameter("newPassword");

        if (nuevaContrasenia == null || nuevaContrasenia.isEmpty()) {
            request.setAttribute("error", "La contraseña no puede estar vacía.");
            request.getRequestDispatcher("/WEB-INF/UsuarioFinal/ver-miperfil-usuario-seguridad.jsp").forward(request, response);
            return;
        }

        boolean exito = usuarioFinalDAO.actualizarContrasenia(userId, nuevaContrasenia);

        if (exito) {
            request.setAttribute("mensaje", "Contraseña actualizada exitosamente.");
        } else {
            request.setAttribute("error", "Hubo un problema al actualizar la contraseña.");
        }

        response.sendRedirect("UsuarioServlet?action=verMiSeguridad");
    }


    // Metodo para manejar la visualización de "Hogar Temporal" con filtros
    private void mostrarHogaresTemporales(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            MiHogarTemporalDAO miHogarTemporalDAO = new MiHogarTemporalDAO();

// Recuperar el usuario logueado desde la sesión
            Usuarios usuarioLogueado = (Usuarios) request.getSession().getAttribute("usuariosession");

            if (usuarioLogueado == null) {
                response.sendRedirect("login");
                return;
            }

// Obtener detalles del usuario usando el DAO correcto
            Usuarios usuario = miHogarTemporalDAO.obtenerDetallesUsuarioTemporal(usuarioLogueado.getUserId());

// Pasar el usuario al JSP
            request.setAttribute("usuario", usuario);
            // Obtener los parámetros de filtro desde el formulario del JSP
            String tipoMascota = request.getParameter("tipoMascota");
            String palabraClave = request.getParameter("palabraClave");
            String distrito = request.getParameter("distrito");

            if (tipoMascota != null && tipoMascota.equalsIgnoreCase("Todas")) {
                tipoMascota = null; // No aplicar este filtro
            }

            if (palabraClave != null && palabraClave.trim().isEmpty()) {
                palabraClave = null; // No aplicar este filtro
            }

            if (distrito != null && distrito.equalsIgnoreCase("Todas")) {
                distrito = null; // No aplicar este filtro
            }

            int page = 1; // Página por defecto
            int size = 6; // Elementos por página

            if (request.getParameter("page") != null) {
                try {
                    page = Integer.parseInt(request.getParameter("page"));
                } catch (NumberFormatException e) {
                    page = 1; // Valor por defecto si hay error
                }
            }

            int start = (page - 1) * size;

            // DAO para obtener datos
            List<HogaresTemporales> hogares = hogarTemporalDAO.filtrarHogaresConPaginacion(palabraClave, tipoMascota, distrito, start, size);
            int totalRecords = hogarTemporalDAO.contarTotalPublicacionesFiltradas(palabraClave, tipoMascota, distrito);
            int totalPages = (int) Math.ceil((double) totalRecords / size);

            // Atributos para el JSP
            request.setAttribute("hogares", hogares);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("tipoMascota", tipoMascota);
            request.setAttribute("palabraClave", palabraClave);
            request.setAttribute("distrito", distrito);

            // Redirigir al JSP correcto
            request.getRequestDispatcher("/WEB-INF/UsuarioFinal/UF-HogaresTemporales.jsp").forward(request, response);
        } catch (Exception e) {
            // Registrar errores y redirigir a un JSP de error
            System.err.println("Error en mostrarHogaresTemporales: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("mensajeError", "Ocurrió un error al cargar las publicaciones.");
            request.getRequestDispatcher("/WEB-INF/UsuarioFinal/UF-Error.jsp").forward(request, response);
        }
    }

    // Método para registrar una nueva solicitud
    private void registrarSolicitud(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int solicitanteId = Integer.parseInt(request.getParameter("solicitanteId"));
        int solicitadoId = Integer.parseInt(request.getParameter("solicitadoId"));
        int mascotaId = Integer.parseInt(request.getParameter("mascotaId"));
        String descripcion = request.getParameter("descripcion");
        String fechaSolicitud = request.getParameter("fechaSolicitud");

        boolean exito = miHogarTemporalDAO.registrarSolicitud(solicitanteId, solicitadoId, mascotaId, descripcion, fechaSolicitud);

        if (exito) {
            request.setAttribute("mensaje", "Solicitud registrada exitosamente.");
        } else {
            request.setAttribute("mensaje", "Error al registrar la solicitud.");
        }

        request.getRequestDispatcher("/WEB-INF/views/postularHogarTemporal.jsp").forward(request, response);
    }

    private void mostrarFormularioPostulacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/UsuarioFinal/UF-PostularTemporal.jsp").forward(request, response);
    }


    private void guardarHogarTemporal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Crear una instancia del objeto HogaresTemporales
        HogaresTemporales hogarTemporal = new HogaresTemporales();


        // Relación con el usuario
        Usuarios usuarioLogueado = (Usuarios) request.getSession().getAttribute("usuarioLogueado");
        if (usuarioLogueado == null) {
            response.sendRedirect("login");
            return;
        }
        hogarTemporal.setUsuario(usuarioLogueado); // Asigna el usuario logueado al objeto


        hogarTemporal.setEdad(parseOrDefault(request.getParameter("edad"), 0));
        hogarTemporal.setGenero(request.getParameter("genero"));
        hogarTemporal.setCelular(request.getParameter("celular"));
        hogarTemporal.setDireccion(request.getParameter("direccion"));

        // Relación con distritos
        Distritos distrito = new Distritos();
        distrito.setDistritoId(parseOrDefault(request.getParameter("distrito"), 0));
        hogarTemporal.setDistrito(distrito);

        hogarTemporal.setCantidadCuartos(Integer.parseInt(request.getParameter("cantidad_cuartos")));
        hogarTemporal.setMetrajeVivienda(Double.parseDouble(request.getParameter("metraje_vivienda")));
        hogarTemporal.setTieneMascotas(Boolean.parseBoolean(request.getParameter("tiene_mascotas")));
        hogarTemporal.setTipoMascotas(request.getParameter("tipo_mascotas"));
        hogarTemporal.setTieneHijos(Boolean.parseBoolean(request.getParameter("tiene_hijos")));
        hogarTemporal.setViveSolo(Boolean.parseBoolean(request.getParameter("vive_solo")));
        hogarTemporal.setTrabaja(request.getParameter("trabaja"));
        hogarTemporal.setPersonaReferencia(request.getParameter("persona_referencia"));
        hogarTemporal.setContactoReferencia(request.getParameter("contacto_referencia"));

        hogarTemporal.setRangoFechaInicio(java.sql.Date.valueOf(request.getParameter("rango_fecha_inicio")));
        hogarTemporal.setRangoFechaFin(java.sql.Date.valueOf(request.getParameter("rango_fecha_fin")));
        Part imagenPart = request.getPart("imagen");
        if (imagenPart != null && imagenPart.getSize() > 0) {
            // Ruta de almacenamiento
            String nombreArchivo = Paths.get(imagenPart.getSubmittedFileName()).getFileName().toString();
            String rutaSubida = getServletContext().getRealPath("") + File.separator + "assets" + File.separator + "img" + File.separator + "Pub-HogarTemp" + File.separator + nombreArchivo;

            // Guardar la imagen en el servidor
            File uploadsDir = new File(getServletContext().getRealPath("") + File.separator + "assets" + File.separator + "img" + File.separator + "Pub-HogarTemp");
            if (!uploadsDir.exists()) {
                uploadsDir.mkdirs();
            }
            imagenPart.write(rutaSubida);
            // Actualizar en el objeto HogaresTemporales
            hogarTemporal.setFoto(new Fotos("assets/img/Pub-HogarTemp/" + nombreArchivo));
            System.out.println("URL de la foto almacenada: " + hogarTemporal.getFoto().getUrlFoto());
        }else{
            System.err.println("No se recibió ninguna imagen o el archivo está vacío.");
            return;
        }

        hogarTemporal.setEstadoTemporal("pendiente");

        // Obtener las descripciones del formulario
        String descripcionHogar = request.getParameter("descripcionHogar"); // Descripción de hogares_temporales
        String descripcionPublicacion = request.getParameter("descripcionPublicacion"); // Descripción de publicaciones
        String tituloPublicacion = request.getParameter("tituloPublicacion");

        if (tituloPublicacion == null || tituloPublicacion.trim().isEmpty()) {
            request.setAttribute("mensaje", "El título de la publicación es obligatorio.");
            request.getRequestDispatcher("/WEB-INF/UsuarioFinal/UF-PostularTemporal.jsp").forward(request, response);
            return;
        }


        // Asignar la descripción de hogares_temporales al objeto
        hogarTemporal.setDescripcion(descripcionHogar);

        // Llamar al DAO para guardar el hogar temporal
        boolean exito = postularHogarTemporalDAO.guardarHogarTemporal(hogarTemporal, descripcionPublicacion, tituloPublicacion);

        // Redirigir o mostrar mensaje según el resultado
        if (exito) {
            // Redirigir a la página de Hogares Temporales para mostrar el nuevo registro
            response.sendRedirect("UsuarioServlet?action=hogarTemporal");
        } else {
            request.setAttribute("mensaje", "Error al registrar el hogar temporal.");
            request.getRequestDispatcher("/WEB-INF/UsuarioFinal/UF-PostularTemporal.jsp").forward(request, response);
        }
    }

    private int parseOrDefault(String value, int defaultValue) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    private boolean parseBooleanFromString(String value) {
        return "si".equalsIgnoreCase(value) || "true".equalsIgnoreCase(value);
    }

}
