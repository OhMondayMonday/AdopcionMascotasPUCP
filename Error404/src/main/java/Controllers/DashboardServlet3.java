package Controllers;

import Daos.Dashboard3DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@WebServlet("/DashboardServlet3")
public class DashboardServlet3 extends HttpServlet {
    private Dashboard3DAO dashboard3DAO;

    @Override
    public void init() throws ServletException {
        dashboard3DAO = new Dashboard3DAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null || action.isEmpty()) {
            action = "mostrarDashboard";
        }

        switch (action) {
            case "mostrarDashboard":
                mostrarDashboard(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Acción no válida");
                break;
        }
    }

    // Método para mostrar el Dashboard
    private void mostrarDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int coordinadorId = 3;

        try {
            // Obtener datos desde el Dashboard3DAO
            String nombreCoordinador = dashboard3DAO.obtenerNombreCoordinador(coordinadorId);
            String fotoPerfil = dashboard3DAO.obtenerFotoPerfil(coordinadorId);
            int hogaresTemporalesRegistrados = dashboard3DAO.obtenerHogaresTemporalesRegistrados();
            double porcentajeAumentoHogaresHoy = dashboard3DAO.obtenerPorcentajeAumentoHogaresHoy(); // Nuevo DAO
            int totalMascotasPerdidas = dashboard3DAO.obtenerTotalMascotasPerdidas();
            List<Map<String, Object>> mascotasPorMes = dashboard3DAO.obtenerMascotasEncontradasUltimosMeses(4);
            int totalMascotasEncontradas = dashboard3DAO.obtenerTotalMascotasEncontradasUltimosMeses(4);
            List<Map<String, Object>> mascotasPorMez = dashboard3DAO.obtenerMascotasPerdidasUltimosMeses(4);
            List<Map<String, String>> ultimasActualizaciones = dashboard3DAO.obtenerUltimasActualizaciones();

            // Validar datos nulos o vacíos y asignar valores predeterminados
            nombreCoordinador = (nombreCoordinador != null) ? nombreCoordinador : "Coordinador Anónimo";
            fotoPerfil = (fotoPerfil != null) ? fotoPerfil : "assets/img/default-profile.jpg";
            mascotasPorMes = (mascotasPorMes != null && !mascotasPorMes.isEmpty()) ? mascotasPorMes : Collections.emptyList();
            mascotasPorMez = (mascotasPorMez != null && !mascotasPorMez.isEmpty()) ? mascotasPorMez : Collections.emptyList();
            ultimasActualizaciones = (ultimasActualizaciones != null && !ultimasActualizaciones.isEmpty()) ? ultimasActualizaciones : List.of(Map.of(
                    "descripcion", "No hay actualizaciones recientes.",
                    "fecha", "",
                    "tiempo", ""
            ));

            // Depuración para revisar los valores
            System.out.println("Nombre Coordinador: " + nombreCoordinador);
            System.out.println("Foto Perfil: " + fotoPerfil);
            System.out.println("Hogares Temporales Registrados: " + hogaresTemporalesRegistrados);
            System.out.println("Porcentaje Aumento Hogares Hoy: " + porcentajeAumentoHogaresHoy + "%");
            System.out.println("Total Mascotas Perdidas: " + totalMascotasPerdidas);
            System.out.println("Mascotas por Mes: " + mascotasPorMez);
            System.out.println("Total Mascotas Encontradas: " + totalMascotasEncontradas);
            System.out.println("Últimas Actualizaciones: " + ultimasActualizaciones);

            // Pasar los datos al JSP
            request.setAttribute("nombreCoordinador", nombreCoordinador);
            request.setAttribute("fotoPerfil", fotoPerfil);
            request.setAttribute("hogaresTemporalesRegistrados", hogaresTemporalesRegistrados);
            request.setAttribute("porcentajeAumentoHogaresHoy", porcentajeAumentoHogaresHoy); // Nuevo atributo
            request.setAttribute("totalMascotasPerdidas", totalMascotasPerdidas);
            request.setAttribute("mascotasPorMez", mascotasPorMez);
            request.setAttribute("totalMascotasEncontradas", totalMascotasEncontradas);
            request.setAttribute("mascotasPorMes", mascotasPorMes);
            request.setAttribute("ultimasActualizaciones", ultimasActualizaciones);

            // Redirigir al JSP del Dashboard del Coordinador
            request.getRequestDispatcher("/WEB-INF/coordinador/coordinador-inicio.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            // Manejo de errores
            request.setAttribute("errorMessage", "Error al cargar el Dashboard. Intente nuevamente más tarde.");
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al cargar el Dashboard");
        }
    }
}
