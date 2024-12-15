package Controllers;
import Beans.LugaresEventos;
import Beans.Solicitudes;
import Beans.Usuarios;
import Daos.AdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.nio.file.Path;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminServlet", urlPatterns = {"/crearLugares", "/lugares-eventos", "/listarUsuarios", "/gestionDonaciones", "/crearCoordinador"})
public class AdminServlet extends HttpServlet{

    private final AdminDAO adminDAO = new AdminDAO();

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
            case "/listarUsuarios" -> {

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
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");

        switch (request.getServletPath()){
            case "/listarUsuarios" -> {
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
                        break;
                    }
                }
            }
        }
    }
}
