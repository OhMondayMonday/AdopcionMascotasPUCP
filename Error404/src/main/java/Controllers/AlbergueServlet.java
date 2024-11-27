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
import Beans.Distritos;

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
