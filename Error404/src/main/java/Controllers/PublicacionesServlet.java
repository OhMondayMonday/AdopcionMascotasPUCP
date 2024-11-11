package Controllers;

import Beans.Publicaciones;
import Daos.PublicacionesDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/PublicacionesServlet")
public class PublicacionesServlet extends HttpServlet {
    private PublicacionesDAO publicacionesDAO;

    @Override
    public void init() throws ServletException {
        publicacionesDAO = new PublicacionesDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "listar";
        }

        switch (action) {
            case "listar":
                listarPublicaciones(request, response);
                break;
            case "mostrar":
                mostrarDetallesPublicacion(request, response);
                break;
        }
    }

    private void listarPublicaciones(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Publicaciones> publicaciones = publicacionesDAO.obtenerPublicaciones();
        request.setAttribute("listaPublicaciones", publicaciones);
        request.getRequestDispatcher("/html/dentro/ver-publicaciones-usuario.jsp").forward(request, response);
    }

    private void mostrarDetallesPublicacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("id") != null) {
            String idString = request.getParameter("id");
            int id = 0;
            try {
                id = Integer.parseInt(idString);
            } catch (NumberFormatException e) {
                response.sendRedirect("PublicacionesServlet");
            }
            Publicaciones publicacion = publicacionesDAO.obtenerDetallesPublicacion(id);
            if(publicacion != null) {
                request.setAttribute("publicacion", publicacion);
                request.getRequestDispatcher("/html/dentro/ver-publicaciones-detalles-usuario.jsp").forward(request, response);
            }else {
                response.sendRedirect("PublicacionesServlet");
            }
        }else{
            response.sendRedirect("PublicacionesServlet");
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Aquí puedes manejar el metodo POST para agregar o actualizar publicaciones
    }
}
