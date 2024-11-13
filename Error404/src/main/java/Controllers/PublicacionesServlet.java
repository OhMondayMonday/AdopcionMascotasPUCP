package Controllers;

import Beans.Publicaciones;
import Beans.PublicacionesAdopcion;
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
        int pagina = 1;
        int PublisPorPagina = 6;
        if (request.getParameter("pagina") != null) {
            pagina = Integer.parseInt(request.getParameter("pagina"));
        }

        int inicio = (pagina - 1) * PublisPorPagina;
        int cantidadDePublis = publicacionesDAO.obtenerCantidadDePublicaciones();
        int cantidadDePaginas = (int) Math.ceil(cantidadDePublis*1.0/PublisPorPagina);

        request.setAttribute("cantidadDePaginas", cantidadDePaginas);
        request.setAttribute("paginaActual", pagina);
        request.setAttribute("paginaAnterior", (pagina > 1) ? pagina -1 : 1);
        request.setAttribute("paginaSiguiente", (pagina < cantidadDePaginas) ? pagina + 1 : cantidadDePaginas);

        List<Publicaciones> publicaciones = publicacionesDAO.obtenerPublicaciones(inicio);
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
                switch (publicacion.getTipoPublicacion().getTipoPublicacionId()){
                    case 1:
                        PublicacionesAdopcion publicacionAdopcion = publicacionesDAO.obtenerPublicacionAdopcion(id);
                        request.setAttribute("adopcion", publicacionAdopcion);
                        break;
                    case 2:
                        break;
                    case 3:
                        break;
                    default:
                        break;
                }
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
