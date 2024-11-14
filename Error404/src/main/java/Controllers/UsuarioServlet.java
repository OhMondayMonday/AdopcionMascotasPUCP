package Controllers;

import Beans.HogaresTemporales;
import Beans.Usuarios;
import Beans.Mascotas;
import Beans.Solicitudes;
import Daos.MiHogarTemporalDAO;
import Daos.HogarTemporalDAO;
import Daos.PostularHogarTemporalDAO;
import java.util.ArrayList;

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

    private HogarTemporalDAO hogarTemporalDAO = new HogarTemporalDAO();
    private MiHogarTemporalDAO miHogarTemporalDAO = new MiHogarTemporalDAO();
    private PostularHogarTemporalDAO postularHogarTemporalDAO = new PostularHogarTemporalDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action")== null ? "home" : request.getParameter("action");
        String vista;
        RequestDispatcher rd;

        switch (action) {
            case "miHogarTemporal":
                Usuarios usuario = miHogarTemporalDAO.obtenerDetallesUsuarioTemporal(1);
                List<Solicitudes> solicitudesMascotas = miHogarTemporalDAO.obtenerSolicitudesPorUsuario(1);

                // Asignar los objetos a los atributos de la solicitud
                request.setAttribute("usuario", usuario);
                request.setAttribute("solicitudesMascotas", solicitudesMascotas);

                rd = request.getRequestDispatcher("/WEB-INF/UsuarioFinal/UF-MiHogarTemporal.jsp");
                rd.forward(request, response);
                break;
            case "hogarTemporal":
                mostrarHogaresTemporales(request, response);
                break;
            case "postularHogarTemporal":
                mostrarFormularioPostulacion(request, response);
                break;
            default:
                String contextPath = request.getContextPath();
                request.getRequestDispatcher("/WEB-INF/Inicio-usuario.jsp").forward(request, response);
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
            default:
                String contextPath = request.getContextPath();
                request.getRequestDispatcher("/WEB-INF/Inicio-usuario.jsp").forward(request, response);
                break;
        }
    }

    // Método para manejar la visualización de "Mi Hogar Temporal"
   // private void mostrarMiHogarTemporal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     //   int userId = Integer.parseInt(request.getParameter("userId"));

     //   Usuarios usuario = miHogarTemporalDAO.obtenerDetallesUsuarioTemporal(userId);


        //request.setAttribute("usuario", usuario);
        //request.setAttribute("solicitudesMascotas", solicitudesMascotas);
      //  request.getRequestDispatcher("/WEB-INF/UsuarioFinal/UF-MiHogarTemporal.jsp").forward(request, response);
    //}

    // Método para manejar la visualización de "Hogar Temporal" con filtros
    private void mostrarHogaresTemporales(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tipoMascota = request.getParameter("tipoMascota");
        String ubicacion = request.getParameter("ubicacion");

        List<HogaresTemporales> hogares;

        if (tipoMascota != null && !tipoMascota.isEmpty()) {
            hogares = hogarTemporalDAO.filtrarHogaresPorTipoMascota(tipoMascota);
        } else if (ubicacion != null && !ubicacion.isEmpty()) {
            hogares = hogarTemporalDAO.filtrarHogaresPorUbicacion(ubicacion);
        } else {
            hogares = hogarTemporalDAO.obtenerHogaresTemporales();
        }

        request.setAttribute("hogares", hogares);
        request.getRequestDispatcher("/hogarTemporal.jsp").forward(request, response);
    }

    // Método para mostrar el formulario de postulación como hogar temporal
    private void mostrarFormularioPostulacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/postularHogarTemporal.jsp").forward(request, response);
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

        request.getRequestDispatcher("/postularHogarTemporal.jsp").forward(request, response);
    }


}
