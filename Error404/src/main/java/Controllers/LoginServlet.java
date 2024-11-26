package Controllers;

import Daos.LoginDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    private final LoginDAO loginDAO = new LoginDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/Login/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        String contrasenia = request.getParameter("contrasenia");

        int userId = loginDAO.validarUsuario(email, contrasenia);

        if (userId != -1) {
            HttpSession session = request.getSession();
            session.setAttribute("userID", userId);

            response.sendRedirect("DashboardServlet");
        } else {
            request.setAttribute("error", "Correo o contraseña incorrectos");
            request.getRequestDispatcher("WEB-INF/Login/login.jsp").forward(request, response);
        }
    }
}

