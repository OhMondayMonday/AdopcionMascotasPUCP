package Controllers;

import Beans.Usuarios;
import Daos.AlbergueDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/albergue")
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
            case "editarPerfil":
                request.getRequestDispatcher("/WEB-INF/albergue/albergue-editar-perfil.jsp").forward(request, response);
                break;
            case "verMiPerfilSeguridad":
                request.getRequestDispatcher("/WEB-INF/albergue/albergue-ver-miperfil-seguridad.jsp").forward(request, response);
                break;
            case "verMiPerfilDetalles":
                request.getRequestDispatcher("/WEB-INF/albergue/albergue-ver-miperfil-detalles.jsp").forward(request, response);
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
        // Aquí puedes agregar lógica para listar albergues si es necesario
        request.getRequestDispatcher("/WEB-INF/albergue/albergue-editar-perfil.jsp").forward(request, response);
    }

    private void mostrarFormularioEdicion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Usuarios albergue = albergueDAO.obtenerInformacionAlbergue(id);

            if (albergue != null) {
                request.setAttribute("albergue", albergue);
                request.getRequestDispatcher("/WEB-INF/albergue/albergue-editar-perfil.jsp").forward(request, response);
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    private void registrarAlbergue(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Usuarios albergue = new Usuarios();
            // Código para obtener y configurar los parámetros...
            albergue.setUsername(request.getParameter("username"));
            albergue.setContrasenia(request.getParameter("contrasena"));
            albergue.setNombre(request.getParameter("nombre"));
            albergue.setApellido(request.getParameter("apellido"));
            albergue.setEmail(request.getParameter("email"));
            albergue.setDni(request.getParameter("dni"));
            albergue.setDireccion(request.getParameter("direccion"));
            albergue.setNombreAlbergue(request.getParameter("nombreAlbergue"));
            // Configura otros atributos según lo necesario

            if (albergueDAO.registrarAlbergue(albergue)) {
                // Redirige a la acción "listar" después de registrar
                response.sendRedirect("albergue?action=listar");
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    private void actualizarAlbergue(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Usuarios albergue = new Usuarios();
            // Código para obtener y configurar los parámetros...
            albergue.setUserId(Integer.parseInt(request.getParameter("id")));
            albergue.setNombre(request.getParameter("nombre"));
            albergue.setApellido(request.getParameter("apellido"));
            albergue.setEmail(request.getParameter("email"));
            albergue.setDireccion(request.getParameter("direccion"));
            albergue.setNombreAlbergue(request.getParameter("nombreAlbergue"));
            // Configura otros atributos según lo necesario

            if (albergueDAO.actualizarInformacionAlbergue(albergue)) {
                // Redirige a la acción "listar" después de actualizar
                response.sendRedirect("albergue?action=listar");
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    private void desactivarAlbergue(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            if (albergueDAO.desactivarCuentaAlbergue(id)) {
                // Redirige a la acción "listar" después de desactivar
                response.sendRedirect("albergue?action=listar");
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
