package Controllers;

import Beans.Usuarios;
import Daos.AlbergueDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AlbergueServlet", value = "/albergue")
public class AlbergueServlet extends HttpServlet {

    private AlbergueDAO albergueDAO;

    @Override
    public void init() throws ServletException {
        albergueDAO = new AlbergueDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "listar";
        }

        switch (action) {
            case "listar":
                listarAlbergue(request, response);
                break;
            case "editar":
                mostrarFormularioEdicion(request, response);
                break;
            default:
                listarAlbergue(request, response);
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
        }
    }

    private void listarAlbergue(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Aquí podrías obtener una lista de todos los albergues y enviarla al JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("ruta_a_tu_lista.jsp");
        dispatcher.forward(request, response);
    }

    private void mostrarFormularioEdicion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Usuarios albergue = albergueDAO.obtenerInformacionAlbergue(id);

        request.setAttribute("albergue", albergue);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ruta_a_tu_formulario_edicion.jsp");
        dispatcher.forward(request, response);
    }

    private void registrarAlbergue(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Usuarios albergue = new Usuarios();
        albergue.setUsername(request.getParameter("username"));
        albergue.setContrasenia(request.getParameter("contrasena"));
        albergue.setNombre(request.getParameter("nombre"));
        albergue.setApellido(request.getParameter("apellido"));
        albergue.setEmail(request.getParameter("email"));
        albergue.setDni(request.getParameter("dni"));
        albergue.setDireccion(request.getParameter("direccion"));
        albergue.setDistrito(Integer.parseInt(request.getParameter("distritoId")));
        albergue.setNombreAlbergue(request.getParameter("nombreAlbergue"));
        albergue.setCapacidadNuevosAnimales(Integer.parseInt(request.getParameter("capacidadNuevosAnimales")));
        albergue.setAnimalesAlbergados(Integer.parseInt(request.getParameter("animalesAlbergados")));
        albergue.setAnioCreacion(Integer.parseInt(request.getParameter("anioCreacion")));
        albergue.setUrlFacebook(request.getParameter("urlFacebook"));
        albergue.setUrlInstagram(request.getParameter("urlInstagram"));
        albergue.setUrlTwitter(request.getParameter("urlTwitter"));
        albergue.setPuntoAcopio(request.getParameter("puntoAcopio"));
        albergue.setDireccionDonaciones(request.getParameter("direccionDonaciones"));
        albergue.setNombreContactoDonaciones(request.getParameter("nombreContactoDonaciones"));
        albergue.setNumeroContactoDonaciones(request.getParameter("numeroContactoDonaciones"));
        albergue.setNumeroYapePlin(request.getParameter("numeroYapePlin"));
        albergue.setZonaId(Integer.parseInt(request.getParameter("zonaId")));

        if (albergueDAO.registrarAlbergue(albergue)) {
            response.sendRedirect("ruta_a_tu_lista.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    private void actualizarAlbergue(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Usuarios albergue = new Usuarios();
        albergue.setUserId(Integer.parseInt(request.getParameter("id")));
        albergue.setNombre(request.getParameter("nombre"));
        albergue.setApellido(request.getParameter("apellido"));
        albergue.setEmail(request.getParameter("email"));
        albergue.setDireccion(request.getParameter("direccion"));
        albergue.setDistritoId(Integer.parseInt(request.getParameter("distritoId")));
        albergue.setCapacidadNuevosAnimales(Integer.parseInt(request.getParameter("capacidadNuevosAnimales")));
        albergue.setAnimalesAlbergados(Integer.parseInt(request.getParameter("animalesAlbergados")));
        albergue.setUrlFacebook(request.getParameter("urlFacebook"));
        albergue.setUrlInstagram(request.getParameter("urlInstagram"));
        albergue.setUrlTwitter(request.getParameter("urlTwitter"));
        albergue.setPuntoAcopio(request.getParameter("puntoAcopio"));
        albergue.setDireccionDonaciones(request.getParameter("direccionDonaciones"));
        albergue.setNombreContactoDonaciones(request.getParameter("nombreContactoDonaciones"));
        albergue.setNumeroContactoDonaciones(request.getParameter("numeroContactoDonaciones"));
        albergue.setNumeroYapePlin(request.getParameter("numeroYapePlin"));

        if (albergueDAO.actualizarInformacionAlbergue(albergue)) {
            response.sendRedirect("ruta_a_tu_lista.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    private void desactivarAlbergue(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        if (albergueDAO.desactivarCuentaAlbergue(id)) {
            response.sendRedirect("ruta_a_tu_lista.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
