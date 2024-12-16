package Controllers;

import Beans.Eventos;
import Beans.Logs;
import Beans.Usuarios;
import Daos.Dashboard2DAO;
import Daos.Dashboard3DAO;
import Daos.Dashboard4DAO;
import Daos.DashboardDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.*;

@WebServlet(name = "DashboardServlet", urlPatterns = "/Dashboard")
public class DashboardServlet extends HttpServlet {
    private final DashboardDAO dashboardDAO = new DashboardDAO();
    private final Dashboard2DAO dashboard2DAO = new Dashboard2DAO();
    private final Dashboard3DAO dashboard3DAO = new Dashboard3DAO();
    private final Dashboard4DAO dashboard4DAO = new Dashboard4DAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Usuarios usuario = (Usuarios) request.getSession().getAttribute("usuariosession");
        switch (usuario.getRol().getNombreRol()) {
            case "Usuario Final" -> mostrarDashboard1(request, response, usuario.getUserId());
            case "Albergue" -> mostrarDashboard2(request, response, usuario.getUserId());
            case "Coordinador Zonal" -> mostrarDashboard3(request, response, usuario.getUserId());
            case "Administrador" -> mostrarDashboard4(request, response, usuario.getUserId());
        }
    }

    private void mostrarDashboard1(HttpServletRequest request, HttpServletResponse response, int userId) throws ServletException, IOException {

        try {
            String nombreUsuario = dashboardDAO.obtenerNombreUsuario(userId);
            String fotoPerfil = dashboardDAO.obtenerFotoPerfil(userId);

            // Obtener datos desde el DashboardDAO
            int animalesAyudados = dashboardDAO.obtenerAnimalesAyudados(userId);
            int publicacionesRealizadas = dashboardDAO.obtenerPublicacionesRealizadas(userId);
            int eventosInscritos = dashboardDAO.obtenerEventosInscritos(userId);
            String actividadPrincipal = dashboardDAO.obtenerActividadPrincipal(userId);
            Eventos proximoEvento = dashboardDAO.obtenerProximoEvento();

            List<Logs> actualizaciones = dashboardDAO.getLast4LogsByUserId(userId);

            // Pasar los datos al JSP
            request.setAttribute("nombreUsuario", nombreUsuario);
            request.setAttribute("fotoPerfil", fotoPerfil);
            request.setAttribute("animalesAyudados", animalesAyudados);
            request.setAttribute("publicacionesRealizadas", publicacionesRealizadas);
            request.setAttribute("eventosInscritos", eventosInscritos);
            request.setAttribute("actividadPrincipal", actividadPrincipal);
            request.setAttribute("proximoEvento", proximoEvento);
            request.setAttribute("actualizaciones", actualizaciones);

            // Redirigir al JSP del Dashboard
            request.getRequestDispatcher("/WEB-INF/UsuarioFinal/Inicio-usuario.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al cargar el Dashboard");
        }
    }

    private void mostrarDashboard2(HttpServletRequest request, HttpServletResponse response, int albergueId) throws ServletException, IOException {


        try {
            // Obtener datos del albergue desde el Dashboard2DAO
            String nombreAlbergue = dashboard2DAO.obtenerNombreAlbergue(albergueId);
            String fotoPerfil = dashboard2DAO.obtenerFotoPerfilAlbergue(albergueId); // Corregido
            int animalesAyudados = dashboard2DAO.obtenerAnimalesAyudados(albergueId); // Corregido
            int publicacionesRealizadas = dashboard2DAO.obtenerPublicacionesRealizadas(albergueId);
            int eventosOrganizados = dashboard2DAO.obtenerEventosOrganizados(albergueId);
            Eventos proximoEvento = dashboard2DAO.obtenerProximoEvento();
            List<Logs> actualizaciones = dashboard2DAO.getLast4LogsByUserId(albergueId);

            // Pasar los datos al JSP
            request.setAttribute("nombreAlbergue", nombreAlbergue);
            request.setAttribute("fotoPerfil", fotoPerfil);
            request.setAttribute("animalesAyudados", animalesAyudados); // Corregido
            request.setAttribute("publicacionesRealizadas", publicacionesRealizadas);
            request.setAttribute("eventosOrganizados", eventosOrganizados);
            request.setAttribute("proximoEvento", proximoEvento);
            request.setAttribute("actualizaciones", actualizaciones);

            // Redirigir al JSP del Dashboard del albergue
            request.getRequestDispatcher("/WEB-INF/albergue/albergue-ver-inicio.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al cargar el Dashboard del albergue");
        }
    }

    private void mostrarDashboard3(HttpServletRequest request, HttpServletResponse response, int coordinadorId) throws ServletException, IOException {

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

    private void mostrarDashboard4(HttpServletRequest request, HttpServletResponse response, int administradorId) throws ServletException, IOException {

        try {
            String nombreAdministrador = dashboard4DAO.obtenerNombreAdministrador(administradorId);
            String fotoPerfil = dashboard4DAO.obtenerFotoPerfil(administradorId);

            // Obtener el monto total de donaciones en el mes actual
            double montoTotalDonaciones = dashboard4DAO.obtenerMontoTotalDonacionesMesActual();

            // Obtener el monto total de donaciones realizadas hoy
            double montoTotalDonacionesHoy = dashboard4DAO.obtenerMontoTotalDonacionesHoy();

            // Obtener el número de albergues registrados
            int alberguesRegistrados = dashboard4DAO.obtenerAlberguesRegistrados();

            int alberguesRegistradosHoy = dashboard4DAO.obtenerAlberguesRegistradosHoy();


            // Obtener el total de mascotas reportadas como perdidas
            int totalMascotasPerdidas = dashboard4DAO.obtenerTotalMascotasPerdidas();

            List<Map<String, Object>> mascotasPorMez = dashboard4DAO.obtenerMascotasPerdidasUltimosMeses(4);

            // Obtener el total de mascotas encontradas por mes
            int totalMascotasEncontradas = dashboard4DAO.obtenerTotalMascotasEncontradasUltimosMeses(4);

            List<Map<String, Object>> mascotasPorMes = dashboard4DAO.obtenerMascotasEncontradasUltimosMeses(4);

            // Obtener el total de donantes
            int totalDonantes = dashboard4DAO.obtenerTotalDonantes();
            // Obtener los donantes por mes en los últimos 4 meses
            List<Map<String, Object>> donantesUltimosMeses = dashboard4DAO.obtenerDonantesUltimosMeses(4);

            // Obtener los donantes con más donaciones realizadas
            List<Map<String, Object>> donantesConMasDonaciones = dashboard4DAO.obtenerDonantesConMasDonaciones();

            // Obtener los albergues con más donaciones recibidas
            List<Map<String, Object>> alberguesConMasDonaciones = dashboard4DAO.obtenerAlberguesConMasDonaciones();

            // Validar datos nulos o vacíos y asignar valores predeterminados
            nombreAdministrador = (nombreAdministrador != null) ? nombreAdministrador : "Anónimo";
            fotoPerfil = (fotoPerfil != null) ? fotoPerfil : "assets/img/default-profile.jpg";

            mascotasPorMez = (mascotasPorMez != null && !mascotasPorMez.isEmpty()) ? mascotasPorMez : Collections.emptyList();
            mascotasPorMes = (mascotasPorMes != null && !mascotasPorMes.isEmpty()) ? mascotasPorMes : Collections.emptyList();

            if (donantesUltimosMeses == null || donantesUltimosMeses.isEmpty()) {
                donantesUltimosMeses = new ArrayList<>();
                // Si no hay resultados, agregar un valor por defecto (puedes usar el mes actual)
                Map<String, Object> defaultData = new HashMap<>();
                defaultData.put("mes", "Enero");  // Mes por defecto
                defaultData.put("total", 0);      // Total de donantes por defecto
                donantesUltimosMeses.add(defaultData);
            }

            // Validar donantes con más donaciones
            if (donantesConMasDonaciones == null || donantesConMasDonaciones.isEmpty()) {
                donantesConMasDonaciones = new ArrayList<>();
                // Agregar un valor por defecto si no hay donantes con más donaciones
                Map<String, Object> defaultData = new HashMap<>();
                defaultData.put("nombre", "Sin Donantes");
                defaultData.put("total_donado", 0.0);
                defaultData.put("porcentaje_total", 0.0);
                donantesConMasDonaciones.add(defaultData);
            }

            // Validar albergues con más donaciones
            if (alberguesConMasDonaciones == null || alberguesConMasDonaciones.isEmpty()) {
                alberguesConMasDonaciones = new ArrayList<>();
                // Agregar un valor por defecto si no hay albergues con más donaciones
                Map<String, Object> defaultData = new HashMap<>();
                defaultData.put("nombre_albergue", "Sin Albergues");
                defaultData.put("total_donado", 0.0);
                defaultData.put("porcentaje_total", 0.0);
                alberguesConMasDonaciones.add(defaultData);
            }

            // Pasar los datos al JSP
            request.setAttribute("nombreAdministrador", nombreAdministrador);
            request.setAttribute("fotoPerfil", fotoPerfil);
            request.setAttribute("montoTotalDonaciones", montoTotalDonaciones);
            request.setAttribute("montoTotalDonacionesHoy", montoTotalDonacionesHoy); // Agregar el monto total de donaciones hoy
            request.setAttribute("alberguesRegistrados", alberguesRegistrados);
            request.setAttribute("alberguesRegistradosHoy", alberguesRegistradosHoy);
            request.setAttribute("totalMascotasEncontradas", totalMascotasEncontradas);
            request.setAttribute("totalMascotasPerdidas", totalMascotasPerdidas);
            request.setAttribute("mascotasPorMez", mascotasPorMez);
            request.setAttribute("mascotasPorMes", mascotasPorMes);
            request.setAttribute("totalDonantes", totalDonantes);
            request.setAttribute("donantesUltimosMeses", donantesUltimosMeses);
            request.setAttribute("donantesConMasDonaciones", donantesConMasDonaciones);
            request.setAttribute("alberguesConMasDonaciones", alberguesConMasDonaciones);

            // Redirigir al JSP de inicio del administrador
            request.getRequestDispatcher("/WEB-INF/administrador/Administrador-inicio.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            // Manejo de errores
            request.setAttribute("errorMessage", "Error al cargar el Dashboard. Intente nuevamente más tarde.");
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al cargar el Dashboard");
        }
    }
}


