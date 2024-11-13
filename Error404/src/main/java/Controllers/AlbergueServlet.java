package Controllers;

import Beans.Usuarios;
import java.sql.Date;
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
            action = "editarPerfil";
        }

        switch (action) {
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
                request.getRequestDispatcher("/WEB-INF/albergue/albergue-ver-miperfil-detalles.jsp").forward(request, response);
                break;
            default:
                request.getRequestDispatcher("/WEB-INF/albergue/albergue-editar-perfil.jsp").forward(request, response);
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
            if (anioCreacionStr != null && !anioCreacionStr.isEmpty()) {
                try {
                    Date anioCreacion = Date.valueOf(anioCreacionStr); // Debe estar en formato yyyy-MM-dd
                    albergue.setAnioCreacion(anioCreacion);
                } catch (IllegalArgumentException e) {
                    e.printStackTrace();
                    response.getWriter().write("Error: Fecha de creación inválida");
                    return;
                }
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
            String idStr = request.getParameter("id");
            if (idStr == null || idStr.isEmpty()) {
                response.getWriter().write("Error: ID no proporcionado");
                return;
            }

            int id = Integer.parseInt(idStr);

            Usuarios albergue = new Usuarios();
            albergue.setUserId(id);
            albergue.setNombre(request.getParameter("nombre"));
            albergue.setApellido(request.getParameter("apellido"));
            albergue.setEmail(request.getParameter("email"));
            albergue.setDireccion(request.getParameter("direccion"));
            albergue.setNombreAlbergue(request.getParameter("nombreAlbergue"));

            // Actualizar en la base de datos
            if (albergueDAO.actualizarInformacionAlbergue(albergue)) {
                response.sendRedirect("albergue?action=verMiPerfilDetalles");
            } else {
                response.getWriter().write("Error: No se pudo actualizar la información del albergue");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.getWriter().write("Error: ID no válido");
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
