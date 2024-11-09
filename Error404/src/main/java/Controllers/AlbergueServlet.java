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
        request.getRequestDispatcher("/WEB-INF/albergue/albergue-editar-perfil.jsp").forward(request, response);
    }

    private void mostrarFormularioEdicion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Usuarios albergue = albergueDAO.obtenerInformacionAlbergue(id);

        request.setAttribute("albergue", albergue);
        request.getRequestDispatcher("/WEB-INF/albergue/albergue-editar-perfil.jsp").forward(request, response);
    }

    private void registrarAlbergue(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Usuarios albergue = new Usuarios();
        // Código para obtener y configurar los parámetros...

        if (albergueDAO.registrarAlbergue(albergue)) {
            // Redirige a la acción "listar" después de registrar
            response.sendRedirect("albergue?action=listar");
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    private void actualizarAlbergue(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Usuarios albergue = new Usuarios();
        // Código para obtener y configurar los parámetros...

        if (albergueDAO.actualizarInformacionAlbergue(albergue)) {
            // Redirige a la acción "listar" después de actualizar
            response.sendRedirect("albergue?action=listar");
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    private void desactivarAlbergue(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        if (albergueDAO.desactivarCuentaAlbergue(id)) {
            // Redirige a la acción "listar" después de desactivar
            response.sendRedirect("albergue?action=listar");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
