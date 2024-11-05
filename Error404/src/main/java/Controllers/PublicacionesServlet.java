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
            case "detalles":
                mostrarDetallesPublicacion(request, response);
                break;
            case "filtrar":
                filtrarPublicaciones(request, response);
                break;
            default:
                listarPublicaciones(request, response);
                break;
        }
    }

    private void listarPublicaciones(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Publicaciones> publicaciones = publicacionesDAO.obtenerPublicaciones();
        request.setAttribute("publicaciones", publicaciones);
        request.getRequestDispatcher("/path/a/tu/vista.jsp").forward(request, response);
    }

    private void mostrarDetallesPublicacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Publicaciones publicacion = publicacionesDAO.obtenerDetallePublicacion(id);
        request.setAttribute("publicacion", publicacion);
        request.getRequestDispatcher("/path/a/tu/detalles.jsp").forward(request, response);
    }

    private void filtrarPublicaciones(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String palabraClave = request.getParameter("palabraClave");
        String tipo = request.getParameter("tipo");
        String fechaInicio = request.getParameter("fechaInicio");
        String fechaFin = request.getParameter("fechaFin");

        // Aplica filtros según los parámetros recibidos
        List<Publicaciones> publicaciones;
        if (palabraClave != null && !palabraClave.isEmpty()) {
            publicaciones = publicacionesDAO.obtenerPublicacionesPorPalabraClave(palabraClave);
        } else if (tipo != null && !tipo.isEmpty()) {
            publicaciones = publicacionesDAO.obtenerPublicacionesPorTipo(tipo);
        } else if (fechaInicio != null && fechaFin != null) {
            publicaciones = publicacionesDAO.obtenerPublicacionesPorRangoDeFechas(fechaInicio, fechaFin);
        } else {
            publicaciones = publicacionesDAO.obtenerPublicaciones();
        }

        request.setAttribute("publicaciones", publicaciones);
        request.getRequestDispatcher("/path/a/tu/vista.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Aquí puedes manejar el método POST para agregar o actualizar publicaciones
    }
}
