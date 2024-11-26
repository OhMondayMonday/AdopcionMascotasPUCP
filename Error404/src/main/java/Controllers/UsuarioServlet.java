package Controllers;

import Beans.HogaresTemporales;
import Beans.Usuarios;
import Beans.Solicitudes;
import Beans.Roles;
import Daos.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

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
                Usuarios usuario = miHogarTemporalDAO.obtenerDetallesUsuarioTemporal(1);
                List<Solicitudes> solicitudesMascotas = miHogarTemporalDAO.obtenerSolicitudesPorUsuario(1);

                request.setAttribute("usuario", usuario);
                request.setAttribute("solicitudesMascotas", solicitudesMascotas);

                rd = request.getRequestDispatcher("/WEB-INF/UsuarioFinal/UF-MiHogarTemporal.jsp");
                rd.forward(request, response);
                break;
            case "hogarTemporal":
                mostrarHogaresTemporales(request, response);
                break;
            case "detalleHogarTemporal":
                mostrarDetalleHogarTemporal(request, response);
                break;
            case "postularHogarTemporal":
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
            case "registrarSolicitud":
                registrarSolicitud(request, response);
                break;

            case "actualizarContrasenia":
                cambiarContrasenia(request, response);
                break;

            default:
                request.getRequestDispatcher("/WEB-INF/Inicio-usuario.jsp").forward(request, response);
                break;
        }
    }

    // Metodo para obtener todos mis detalles de usuario
    private void mostrarDetallesPerfil(HttpServletRequest request, HttpServletResponse response, String view) throws ServletException, IOException {
        int userId = 1; // ID de usuario para simulación

        // Obtener detalles del usuario desde el DAO
        Usuarios usuario = usuarioFinalDAO.obtenerUsuarioPorId(userId);

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
        String tipoMascota = request.getParameter("tipoMascota");
        String palabraClave = request.getParameter("palabraClave");
        String ubicacion = request.getParameter("ubicacion");

        //List<HogaresTemporales> hogares = hogarTemporalDAO.obtenerPublicacionesHogaresTemporales();

       // request.setAttribute("hogares", hogares);
        request.getRequestDispatcher("/WEB-INF/UsuarioFinal/UF-HogaresTemporales.jsp").forward(request, response);
    }

    private void mostrarDetalleHogarTemporal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int temporalId = Integer.parseInt(request.getParameter("temporalId"));
          //  HogaresTemporales hogar = hogarTemporalDAO.obtenerDetallesHogarTemporal(temporalId);

          //  request.setAttribute("hogar", hogar);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/DetalleHogarTemporal.jsp");
            rd.forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("UsuarioServlet?action=hogarTemporal");
        }
    }

    // Método para mostrar el formulario de postulación como hogar temporal
    private void mostrarFormularioPostulacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/postularHogarTemporal.jsp").forward(request, response);
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
}
