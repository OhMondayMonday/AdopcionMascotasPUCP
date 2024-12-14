package Controllers;

import Beans.*;
import Daos.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {
    private UsuarioFinalDAO usuarioFinalDAO = new UsuarioFinalDAO();  // Instanciamos el DAO
    private UsuarioDAO usuarioDAO = new UsuarioDAO();
    private HogarTemporalDAO hogarTemporalDAO = new HogarTemporalDAO();
    private MiHogarTemporalDAO miHogarTemporalDAO = new MiHogarTemporalDAO();
    private PostularHogarTemporalDAO postularHogarTemporalDAO = new PostularHogarTemporalDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
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
                        Usuarios usuario = usuarioFinalDAO.obtenerInformacionUsuario(id);
                        if (usuario == null) {
                            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Usuario no encontrado");
                            return;
                        }

                        request.setAttribute("usuario", usuario);
                        request.getRequestDispatcher("/WEB-INF/UsuarioFinal/usuario-editar-perfil.jsp").forward(request, response);
                    } catch (NumberFormatException e) {
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de ID no válido");
                    }
                    break;

                case "verMiPerfilSeguridad":
                    request.getRequestDispatcher("/WEB-INF/UsuarioFinal/ver-miperfil-usuario-seguridad.jsp").forward(request, response);
                    break;

                case "verMiPerfilDetalles":
                    String idDetalle = request.getParameter("id");
                    if (idDetalle == null || idDetalle.isEmpty()) {
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID no proporcionado");
                        return;
                    }
                    try {
                        int id = Integer.parseInt(idDetalle);
                        Usuarios usuarioDetalle = usuarioFinalDAO.obtenerInformacionUsuario(id);
                        if (usuarioDetalle == null) {
                            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Usuario no encontrado");
                            return;
                        }
                        request.setAttribute("usuario", usuarioDetalle);
                        request.getRequestDispatcher("/WEB-INF/UsuarioFinal/ver-miperfil-detalles.jsp").forward(request, response);
                    } catch (NumberFormatException e) {
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de ID no válido");
                    }
                    break;

                default:
                    request.getRequestDispatcher("/WEB-INF/UsuarioFinal/ver-miperfil-usuario-detalles.jsp").forward(request, response);
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

        if ("registrarSolicitud".equals(action)) {
            registrarSolicitud(request, response);
        } else if ("actualizarContrasenia".equals(action)) {
            cambiarContrasenia(request, response);
        } else if ("registrarUsuario".equals(action)) {
            registrarUsuario(request, response);
        } else if ("actualizarUsuario".equals(action)) {
            actualizarUsuario(request, response);
        } else {
            // Acción por defecto, si no se pasa ninguna acción válida.
            request.getRequestDispatcher("/WEB-INF/UsuarioFinal/ver-miperfil-usuario-detalles.jsp").forward(request, response);
        }
    }


    private void registrarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Usuarios usuario = new Usuarios();

            // Obtener los parámetros del formulario
            usuario.setUsername(request.getParameter("username"));
            usuario.setContrasenia(request.getParameter("contrasenia"));
            usuario.setNombre(request.getParameter("nombre"));
            usuario.setApellido(request.getParameter("apellido"));
            usuario.setEmail(request.getParameter("email"));
            usuario.setDni(request.getParameter("dni"));
            usuario.setDireccion(request.getParameter("direccion"));

            // Obtener campos adicionales
            // Distrito
            String distritoIdStr = request.getParameter("distrito");
            if (distritoIdStr != null && !distritoIdStr.isEmpty()) {
                try {
                    int distritoId = Integer.parseInt(distritoIdStr);
                    Distritos distrito = new Distritos();
                    distrito.setDistritoId(distritoId);
                    usuario.setDistrito(distrito);
                } catch (NumberFormatException e) {
                    response.getWriter().write("Error: Distrito ID no válido.");
                    return;
                }
            }

            // Capacidad de nuevos animales y animales albergados
            String capacidadNuevosAnimalesStr = request.getParameter("capacidadNuevosAnimales");
            if (capacidadNuevosAnimalesStr != null && !capacidadNuevosAnimalesStr.isEmpty()) {
                try {
                    int capacidadNuevosAnimales = Integer.parseInt(capacidadNuevosAnimalesStr);
                    usuario.setCapacidadNuevosAnimales(capacidadNuevosAnimales);
                } catch (NumberFormatException e) {
                    response.getWriter().write("Error: Capacidad de nuevos animales no válida.");
                    return;
                }
            }

            String animalesAlbergadosStr = request.getParameter("animalesAlbergados");
            if (animalesAlbergadosStr != null && !animalesAlbergadosStr.isEmpty()) {
                try {
                    int animalesAlbergados = Integer.parseInt(animalesAlbergadosStr);
                    usuario.setAnimalesAlbergados(animalesAlbergados);
                } catch (NumberFormatException e) {
                    response.getWriter().write("Error: Animales albergados no válidos.");
                    return;
                }
            }

            // Redes sociales
            usuario.setUrlFacebook(request.getParameter("urlFacebook"));
            usuario.setUrlInstagram(request.getParameter("urlInstagram"));

            // YapePlin
            usuario.setNumeroYapePlin(request.getParameter("numeroYapePlin"));

            // Asignar rol (rol_id = 1 para usuario final)
            Roles rol = new Roles();
            rol.setRolId(1);
            usuario.setRol(rol);

            // Asignar zona si es necesario
            String zonaIdStr = request.getParameter("zona_id");
            if (zonaIdStr != null && !zonaIdStr.isEmpty()) {
                try {
                    int zonaId = Integer.parseInt(zonaIdStr);
                    Zonas zona = new Zonas();
                    zona.setZonaId(zonaId);
                    usuario.setZona(zona);
                } catch (NumberFormatException e) {
                    response.getWriter().write("Error: Zona ID no válido.");
                    return;
                }
            }

            // Guardar en la base de datos
            if (usuarioFinalDAO.registrarUsuario(usuario)) {
                response.sendRedirect("UsuarioServlet?action=verMiPerfilDetalles");
            } else {
                response.getWriter().write("Error: No se pudo registrar el usuario.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }

    private void actualizarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
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
            Usuarios usuario = new Usuarios();
            usuario.setUserId(id);
            usuario.setUsername(request.getParameter("username")); // Username
            usuario.setNombre(request.getParameter("nombre")); // Nombre de persona
            usuario.setApellido(request.getParameter("apellido"));
            usuario.setEmail(request.getParameter("email"));
            usuario.setDireccion(request.getParameter("direccion"));
            usuario.setDescripcion(request.getParameter("descripcion"));
            usuario.setNumeroYapePlin(request.getParameter("numeroYapePlin"));

            // Asignar el distrito
            String distritoIdStr = request.getParameter("distritoId");
            if (distritoIdStr != null && !distritoIdStr.isEmpty()) {
                try {
                    int distritoId = Integer.parseInt(distritoIdStr);
                    Distritos distrito = new Distritos();
                    distrito.setDistritoId(distritoId);
                    usuario.setDistrito(distrito);
                } catch (NumberFormatException e) {
                    response.getWriter().write("Error: Distrito ID no válido");
                    return;
                }
            } else {
                response.getWriter().write("Error: Distrito ID no proporcionado o vacío");
                return;
            }

            // Asignar la capacidad de nuevos animales y animales albergados
            String capacidadNuevosAnimalesStr = request.getParameter("capacidadNuevosAnimales");
            if (capacidadNuevosAnimalesStr != null && !capacidadNuevosAnimalesStr.isEmpty()) {
                try {
                    int capacidadNuevosAnimales = Integer.parseInt(capacidadNuevosAnimalesStr);
                    usuario.setCapacidadNuevosAnimales(capacidadNuevosAnimales);
                } catch (NumberFormatException e) {
                    response.getWriter().write("Error: Capacidad de nuevos animales no válida.");
                    return;
                }
            }

            String animalesAlbergadosStr = request.getParameter("animalesAlbergados");
            if (animalesAlbergadosStr != null && !animalesAlbergadosStr.isEmpty()) {
                try {
                    int animalesAlbergados = Integer.parseInt(animalesAlbergadosStr);
                    usuario.setAnimalesAlbergados(animalesAlbergados);
                } catch (NumberFormatException e) {
                    response.getWriter().write("Error: Animales albergados no válidos.");
                    return;
                }
            }

            // Asignar las redes sociales
            usuario.setUrlFacebook(request.getParameter("urlFacebook"));
            usuario.setUrlInstagram(request.getParameter("urlInstagram"));

            // Asignar zona si es necesario
            String zonaIdStr = request.getParameter("zona_id");
            if (zonaIdStr != null && !zonaIdStr.isEmpty()) {
                try {
                    int zonaId = Integer.parseInt(zonaIdStr);
                    Zonas zona = new Zonas();
                    zona.setZonaId(zonaId);
                    usuario.setZona(zona);
                } catch (NumberFormatException e) {
                    response.getWriter().write("Error: Zona ID no válido.");
                    return;
                }
            }

            // Llamar al método del DAO para actualizar la información
            if (usuarioFinalDAO.actualizarInformacionUsuario(usuario)) {
                // Redirigir al perfil con los detalles actualizados
                response.sendRedirect("UsuarioServlet?action=verMiPerfilDetalles&id=" + id);
            } else {
                response.getWriter().write("Error: No se pudo actualizar la información del usuario. Verifique los datos y vuelva a intentarlo.");
            }
        } catch (Exception e) {
            // Manejo general de excepciones
            e.printStackTrace();
            response.getWriter().write("Error: Ocurrió un error al procesar la solicitud. Detalles: " + e.getMessage());
        }
    }

    // Metodo para cambiar la contraseña del usuario
    private void cambiarContrasenia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Aquí mantendremos el método estático, asignando un userId fijo o manejándolo de otra manera
        int userId = 1; // Simulación, ya que no se están manejando sesiones
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

        response.sendRedirect("UsuarioServlet?action=verMiPerfilSeguridad");
    }

    // Método para registrar una nueva solicitud
    private void registrarSolicitud(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
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
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("mensaje", "Error: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/postularHogarTemporal.jsp").forward(request, response);
        }
    }
}
