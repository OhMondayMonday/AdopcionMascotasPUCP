package Controllers;
import Beans.Usuarios;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(urlPatterns = {"/FAQ"})
public class FAQ extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Usuarios usuario = (Usuarios) session.getAttribute("usuariosession");

        switch (usuario.getRol().getNombreRol()) {
            case "Coordinador Zonal" ->
                    request.getRequestDispatcher("/WEB-INF/auxiliares/preguntas-frecuentes-coordinador.jsp").forward(request, response);
            case "Albergue" ->
                    request.getRequestDispatcher("/WEB-INF/auxiliares/preguntas-frecuentes-albergue.jsp").forward(request, response);
            case "Usuario Final" ->
                    request.getRequestDispatcher("/WEB-INF/auxiliares/preguntas-frecuentes-usuario.jsp").forward(request, response);
        }
    }

}

