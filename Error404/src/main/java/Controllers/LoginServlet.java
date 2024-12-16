package Controllers;

import Daos.LoginDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Beans.Usuarios;
import Services.EmailService;
import Daos.TokenDAO;

import javax.mail.AuthenticationFailedException;
import javax.mail.MessagingException;
import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login", "/register", "/recuperar", "/reset-password", "/logout"})
public class LoginServlet extends HttpServlet {
    private final LoginDAO loginDAO = new LoginDAO();
    private final TokenDAO tokenDAO = new TokenDAO(); // Acceso a la base de datos para tokens
    private final EmailService emailService = new EmailService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String path = request.getServletPath();


        switch (path) {
            case "/login" -> {
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                response.setHeader("Pragma", "no-cache");
                response.setDateHeader("Expires", 0);

                HttpSession session = request.getSession(false);
                if (session != null && session.getAttribute("usuariosession") != null) {
                    response.sendRedirect(request.getContextPath() + "/");
                    return;
                }

                request.getRequestDispatcher("/WEB-INF/Login/login.jsp").forward(request, response);
            }
            case "/register" -> {
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                response.setHeader("Pragma", "no-cache");
                response.setDateHeader("Expires", 0);

                request.getRequestDispatcher("/WEB-INF/Login/register.jsp").forward(request, response);
            }
            case "/recuperar" -> {
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                response.setHeader("Pragma", "no-cache");
                response.setDateHeader("Expires", 0);

                HttpSession session = request.getSession(false);
                if (session != null && session.getAttribute("usuariosession") != null) {
                    response.sendRedirect(request.getContextPath() + "/Dashboard");
                    return;
                }

                request.getRequestDispatcher("/WEB-INF/Login/recuperar.jsp").forward(request, response);
            }
            case "/reset-password" -> {
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                response.setHeader("Pragma", "no-cache");
                response.setDateHeader("Expires", 0);
                String token = request.getParameter("token");

                if (tokenDAO.validateToken(token)== -1) {
                    response.sendRedirect(request.getContextPath() + "/Dashboard");
                    return;
                }

                HttpSession session = request.getSession(false);
                if (session != null && session.getAttribute("usuariosession") != null) {
                    response.sendRedirect(request.getContextPath() + "/Dashboard");
                    return;
                }

                request.getRequestDispatcher("/WEB-INF/Login/reset.jsp").forward(request, response);
            }
            case "/logout" -> {
                if (request.getSession(false) != null) {
                    request.getSession().invalidate();
                }

                response.sendRedirect(request.getContextPath() + "/login");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String path = request.getServletPath();

        switch (path) {
            case "/login" -> {
                String email = request.getParameter("email");
                String contrasenia = request.getParameter("contrasenia");

                Usuarios usuario = loginDAO.validarUsuario(email, contrasenia);

                HttpSession session = request.getSession(false);
                if (session != null && session.getAttribute("usuariosession") != null) {
                    response.sendRedirect(request.getContextPath());
                }

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                if (usuario != null) {
                    session.setAttribute("usuariosession", usuario);
                    String redirect = (String) session.getAttribute("redirect");
                    if (redirect == null || redirect.isEmpty()) {
                        redirect = request.getContextPath();
                    }
                    redirect = request.getContextPath() + redirect;
                    System.out.println(redirect);

                    // Responder con JSON
                    response.getWriter().write("{\"loginExitoso\": true, \"redirect\": \"" + redirect + "\"}");
                } else {

                    response.getWriter().write("{\"loginExitoso\": false, \"error\": \"Correo o contraseña incorrectos\"}");
                }
            }
            case "/register" -> {
                String action = request.getParameter("action");
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                if ("validateEmail".equals(action)) {
                    String email = request.getParameter("email");
                    boolean emailRepetido = loginDAO.EmailRepetido(email);

                    // Enviar respuesta
                    response.getWriter().write("{\"valid\": " + !emailRepetido + "}");

                } else if ("validateUsername".equals(action)) {
                    String username = request.getParameter("username");
                    boolean UsernameRepetido = loginDAO.UsernameRepetido(username);

                    response.getWriter().write("{\"valid\": " + !UsernameRepetido + "}");

                } else if ("validateDNI".equals(action)) {
                    String dni = request.getParameter("dni");
                    boolean DNIRepetido = loginDAO.DNIRepetido(dni);

                    response.getWriter().write("{\"valid\": " + !DNIRepetido + "}");

                } else if ("registerUser".equals(action)) {
                    String username = request.getParameter("multiStepsUsername");
                    String email = request.getParameter("multiStepsEmail");
                    String nombre = request.getParameter("multiStepsFirstName");
                    String apellido = request.getParameter("multiStepsLastName");
                    String direccion = request.getParameter("multiStepsAddress");
                    String dni = request.getParameter("multiStepsDocument");
                    String distrito_id = request.getParameter("multiStepsState");

                    // Lógica para guardar el usuario en la base de datos
                    boolean userRegistered = loginDAO.registrarSolicitud(username, email, nombre, apellido, direccion, dni, distrito_id);

                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");

                    // Enviar la respuesta como JSON
                    if (userRegistered) {
                        response.getWriter().write("{\"status\": \"success\", \"message\": \"Usuario registrado con éxito\"}");
                    } else {
                        response.getWriter().write("{\"status\": \"error\", \"message\": \"Error al registrar el usuario. Intente nuevamente.\"}");
                    }
                }
            }
            case "/recuperar" -> {
                String action = request.getParameter("action");
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                String email = request.getParameter("email");

                HttpSession session = request.getSession(false);
                if (session != null && session.getAttribute("usuariosession") != null) {
                    response.sendRedirect(request.getContextPath());
                }

                int userId = loginDAO.getUserIdByEmail(email);
                System.out.println(userId);

                if (userId == -1) {
                    response.getWriter().write("{\"status\":\"error\", \"message\":\"El correo no está registrado.\"}");
                    return;
                }

                String token = UUID.randomUUID().toString();
                tokenDAO.saveToken(userId, token);

                // Construye el enlace de recuperación
                String resetLink = request.getRequestURL().toString().replace("/recuperar", "/reset-password?token=") + token;
                System.out.println("Enlace" + resetLink);

                // Envía el correo al usuario
                String subject = "Recuperación de contraseña";
                String body = "Hola, \n\n" +
                        "Hemos recibido una solicitud para restablecer tu contraseña. Haz clic en el siguiente enlace para restablecerla:\n" +
                        resetLink + "\n\n" +
                        "Si no solicitaste este cambio, ignora este correo.\n\n" +
                        "Saludos,\nEl equipo.";

                try {
                    emailService.sendEmail(email, subject, body);
                    System.out.println("success ");
                    response.getWriter().write("{\"status\":\"success\", \"message\":\"Se envió un correo de recuperación.\"}");
                } catch (MessagingException  e) {
                    e.printStackTrace();
                    response.getWriter().write("{\"status\":\"error\", \"message\":\"No se pudo enviar el correo.\"}");
                }
            }
            case "/reset-password" -> {
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                String token = request.getParameter("token");
                String newPassword = request.getParameter("password");

                try {
                    int userId = tokenDAO.validateToken(token);
                    if (userId == -1) {
                        response.getWriter().write("{\"status\":\"error\", \"message\":\"El token es inválido o ha expirado.\"}");
                        return;
                    }

                    boolean passwordUpdated = loginDAO.updatePassword(userId, newPassword);
                    if (passwordUpdated) {
                        // Eliminar el token después de actualizar la contraseña
                        tokenDAO.deleteToken(token);
                        response.getWriter().write("{\"status\":\"success\", \"message\":\"Contraseña actualizada correctamente.\"}");
                    } else {
                        // Error al actualizar la contraseña
                        response.getWriter().write("{\"status\":\"error\", \"message\":\"No se pudo actualizar la contraseña. Inténtalo de nuevo.\"}");
                    }
                } catch (Exception e) {
                    // Manejo de errores inesperados
                    e.printStackTrace();
                    response.getWriter().write("{\"status\":\"error\", \"message\":\"Ocurrió un error inesperado. Inténtalo más tarde.\"}");
                }
            }
        }
    }
}

