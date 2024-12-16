package Controllers;
import Beans.LugaresEventos;
import Beans.Solicitudes;
import Beans.Usuarios;
import Daos.AdminDAO;
import Daos.LoginDAO;
import Services.EmailService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.mail.MessagingException;
import java.io.IOException;
import java.nio.file.Path;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.List;
import java.util.Random;

@WebServlet(name = "AdminServlet", urlPatterns = {"/crearLugares", "/lugares-eventos", "/gestionUsuarios", "/gestionDonaciones", "/crearCoordinador", "/crearUsuarios", "/crearAlbergues"})
public class AdminServlet extends HttpServlet{

    private final AdminDAO adminDAO = new AdminDAO();
    private final LoginDAO loginDAO = new LoginDAO();
    EmailService emailService = new EmailService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        switch(request.getServletPath()){
            case "/lugares-eventos" -> {
                // Obtener la lista de lugares de eventos con disponibilidad
                List<LugaresEventos> lugaresEventos = adminDAO.obtenerLugaresEventosConDisponibilidad();

                // Pasar la lista como atributo a la solicitud
                request.setAttribute("lugaresEventos", lugaresEventos);

                // Redirigir al JSP que mostrará los datos
                request.getRequestDispatcher("WEB-INF/administrador/Administrador-ver-lugares-eventos.jsp").forward(request, response);
            }
            case "/gestionUsuarios" -> {

                List<Usuarios> usuarios = adminDAO.obtenerUsuarios();

                // Pasar la lista de usuarios como atributo al JSP
                request.setAttribute("listaUsuarios", usuarios);

                // Redirigir al JSP
                request.getRequestDispatcher("WEB-INF/administrador/Administrador-gestionar-usuarios.jsp").forward(request, response);
            }
            case "/gestionDonaciones" -> {
                List<Solicitudes> donacionesDinero = adminDAO.obtenerSolicitudesDonacionDinero();

                request.setAttribute("listaSolicitudes", donacionesDinero);

                System.out.println(donacionesDinero);

                request.getRequestDispatcher("WEB-INF/administrador/Administrador-gestionar-donaciones.jsp").forward(request, response);
            }
            case "/crearCoordinador" -> {
                request.getRequestDispatcher("WEB-INF/administrador/Administrador-crear-coordinador.jsp").forward(request, response);
            }
            case "/crearLugares" -> {
                request.getRequestDispatcher("WEB-INF/administrador/Administrador-crear-lugares.jsp").forward(request, response);
            }
            case "/crearUsuarios" -> {
                List<Solicitudes> solicitudesUsuarios = adminDAO.obtenerSolicitudesCreacionUsuario();

                request.setAttribute("listaSolicitudes", solicitudesUsuarios);

                request.getRequestDispatcher("WEB-INF/administrador/Administrador-crear-usuarios.jsp").forward(request, response);
            }
            case "/crearAlbergues" -> {
                List<Solicitudes> solicitudesAlbergue = adminDAO.obtenerSolicitudesAlbergue();

                request.setAttribute("listaSolicitudes", solicitudesAlbergue);

                request.getRequestDispatcher("WEB-INF/administrador/Administrador-crear-albergues.jsp").forward(request, response);
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");

        switch (request.getServletPath()){
            case "/gestionUsuarios" -> {
                switch (action) {
                    case "suspender" -> {
                        int userId = Integer.parseInt(request.getParameter("userId"));
                        boolean exito = adminDAO.suspenderCuenta(userId);
                        if (exito) {
                            response.getWriter().write("Cuenta suspendida exitosamente.");
                        } else {
                            response.getWriter().write("Error al suspender la cuenta.");
                        }
                    }

                    case "desbloquear" -> {
                        int userId = Integer.parseInt(request.getParameter("userId"));
                        boolean exito = adminDAO.desbloquearCuenta(userId);
                        if (exito) {
                            response.getWriter().write("Cuenta desbloqueada exitosamente.");
                        } else {
                            response.getWriter().write("Error al desbloquear la cuenta.");
                        }
                    }

                    default -> {
                        response.getWriter().write("Acción no válida.");
                    }
                }
            }
            case "/crearUsuarios" -> {
                String accion = request.getParameter("action");
                switch (accion){
                    case "aceptar" -> {
                        System.out.println("Si quiera esto se ejecuta?");
                        int solicitudId = Integer.parseInt(request.getParameter("solicitudId"));
                        Solicitudes solicitud1 = adminDAO.obtenerSolicitudPorId(solicitudId);
                        String contrasenia = generarContraseniaAleatoria();
                        String contraseniaHash;
                        try {
                            contraseniaHash = loginDAO.hashPassword(contrasenia);
                        } catch (NoSuchAlgorithmException e) {
                            throw new RuntimeException(e);
                        }
                        boolean exito = adminDAO.insertarUsuario(solicitud1, contraseniaHash);
                        System.out.println("Esto se ejecuta bien carajo");
                        response.getWriter().write("{\"status\": \"success\", \"message\": \"La solicitud ha sido procesada exitosamente.\"}");
                        System.out.println("Esto se ejecuta bien carajo x2222");
                        if (exito) {
                            adminDAO.cambiarEstadoAAceptado(solicitudId);
                            try{
                                String subject = "Creación de cuenta exitosa";
                                String body = "Hola, \n\n" +
                                        "¡Bienvenido! Hemos creado una cuenta para ti en nuestro sistema. Aquí están los detalles de tu cuenta:\n\n" +
                                        "Usuario: " + solicitud1.getUsername() + "\n" +
                                        "Contraseña: " + contrasenia + "\n\n" +
                                        "Te recomendamos cambiar tu contraseña una vez inicies sesión por motivos de seguridad.\n\n" +
                                        "Si tienes alguna pregunta o necesitas asistencia, no dudes en contactarnos.\n\n" +
                                        "Saludos,\nEl equipo.";

                                String email = solicitud1.getEmail();
                                emailService.sendEmail(email, subject, body);
                                System.out.println("success cuenta creada");
                            }
                            catch (MessagingException e) {
                                e.printStackTrace();
                            }

                        } else {
                            response.getWriter().write("{\"status\": \"error\", \"message\": \"Hubo un error al procesar la solicitud.\"}");
                        }
                    }
                    case "rechazar" -> {
                        int solicitudId = Integer.parseInt(request.getParameter("solicitudId"));
                        Solicitudes solicitud2 = adminDAO.obtenerSolicitudPorId(solicitudId);
                        boolean exito = adminDAO.cambiarEstadoARechazado(solicitudId);
                        System.out.println(exito);
                        if (exito) {
                            response.getWriter().write("{\"status\": \"success\", \"message\": \"La solicitud ha sido procesada exitosamente.\"}");
                            System.out.println("Esto se ejecuta mal carajo");
                        }
                        else {
                            response.getWriter().write("{\"status\": \"error\", \"message\": \"Hubo un error al procesar la solicitud.\"}");
                        }
                        if (exito) {
                            System.out.println("Esto se ejecuta bien carajo 1");
                            String recipientEmail = solicitud2.getEmail();
                            System.out.println(recipientEmail); // Obtener el email del solicitante
                            String subject = "Solicitud de cuenta rechazada";
                            String body = "Hola, \n\n" +
                                    "Lamentablemente, tu solicitud para crear una cuenta ha sido rechazada. " +
                                    "Esto puede deberse a varias razones, como información incompleta o incorrecta. " +
                                    "Si tienes alguna duda o deseas más información, por favor contáctanos.\n\n" +
                                    "Saludos,\n" +
                                    "El equipo de Alianza Animal.";

                            try {
                                System.out.println("quiero enviar correo xdxd");
                                emailService.sendEmail(recipientEmail, subject, body);
                                System.out.println("Correo de cuenta rechazada enviado.");
                            } catch (MessagingException e) {
                                e.printStackTrace();
                                System.out.println("No se pudo enviar el correo de cuenta rechazada.");
                            }
                        }
                    }
                }
            }
            case "/crearAlbergues" -> {
                String accion = request.getParameter("action");
                switch (accion) {
                    case "aceptar" -> {
                        int SolicitudId = Integer.parseInt(request.getParameter("solicitudId"));
                        Solicitudes solicitud3 = adminDAO.obtenerSolicitudPorId(SolicitudId);
                        String recipientEmail = solicitud3.getSolicitante().getEmail();
                        if(adminDAO.actualizarUsuarioPorSolicitud(solicitud3)){
                            response.getWriter().write("{\"status\": \"success\", \"message\": \"La solicitud ha sido procesada exitosamente.\"}");
                            adminDAO.cambiarEstadoAAceptado(SolicitudId);
                            System.out.println(recipientEmail);
                            String subject = "Actualización de Datos de Cuenta de Albergue";
                            String body = "Hola, \n\n" +
                                    "Te informamos que los datos de tu cuenta de albergue han sido actualizados exitosamente. A continuación, te mostramos los detalles actualizados de tu cuenta:\n\n" +
                                    "Nombre del albergue: " + solicitud3.getNombreAlbergue() + "\n" +
                                    "Nombre del encargado: " + solicitud3.getNombreEncargado() + " " + solicitud3.getApellidoEncargado() + "\n" +
                                    "Correo electrónico del albergue: " + solicitud3.getEmail_albergue() + "\n\n" +
                                    "Si tienes alguna pregunta o necesitas realizar más cambios, no dudes en contactarnos.\n\n" +
                                    "Saludos,\nEl equipo de gestión de albergues.";
                            try {
                                emailService.sendEmail(recipientEmail, subject, body);
                                System.out.println("Correo de cuenta rechazada enviado.");
                            } catch (MessagingException e) {
                                e.printStackTrace();
                                System.out.println("No se pudo enviar el correo de cuenta rechazada.");
                            }
                        }
                        else{
                            response.getWriter().write("{\"status\": \"error\", \"message\": \"Hubo un error al procesar la solicitud.\"}");
                        }

                    }
                    case "rechazar" -> {
                        int SolicitudId = Integer.parseInt(request.getParameter("solicitudId"));
                        Solicitudes solicitud4 = adminDAO.obtenerSolicitudPorId(SolicitudId);
                        String recipientEmail = solicitud4.getSolicitante().getEmail();
                        if(adminDAO.actualizarUsuarioPorSolicitud(solicitud4)){
                            response.getWriter().write("{\"status\": \"success\", \"message\": \"La solicitud ha sido procesada exitosamente.\"}");
                            adminDAO.cambiarEstadoARechazado(solicitud4.getSolicitudId());
                            String subject = "Solicitud de Cuenta de Albergue Rechazada";
                            String body = "Hola, \n\n" +
                                    "Lamentablemente, tu solicitud de cuenta de albergue ha sido rechazada. A continuación, te proporcionamos más detalles sobre la solicitud:\n\n" +
                                    "Nombre del albergue: " + solicitud4.getNombreAlbergue() + "\n" +
                                    "Nombre del encargado: " + solicitud4.getNombreEncargado() + " " + solicitud4.getApellidoEncargado() + "\n" +
                                    "Correo electrónico del albergue: " + solicitud4.getEmail_albergue() + "\n\n" +
                                    "Si tienes alguna pregunta o deseas obtener más detalles sobre el motivo del rechazo, por favor no dudes en contactarnos.\n\n" +
                                    "Saludos,\nEl equipo de gestión de albergues.";
                            try {
                                emailService.sendEmail(recipientEmail, subject, body);
                                System.out.println("Correo de cuenta rechazada enviado.");
                            } catch (MessagingException e) {
                                e.printStackTrace();
                                System.out.println("No se pudo enviar el correo de cuenta rechazada.");
                            }
                        }
                    }
                }
            }
        }
    }

    private String generarContraseniaAleatoria() {
        String caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+";
        StringBuilder contrasenia = new StringBuilder();
        Random random = new Random();

        for (int i = 0; i < 12; i++) {  // Genera una contraseña de 12 caracteres
            int index = random.nextInt(caracteres.length());
            contrasenia.append(caracteres.charAt(index));
        }

        return contrasenia.toString();
    }
}
