<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Daos.DashboardDAO" %>
<%@ page import="Beans.Eventos" %>
<%@ page import="java.util.List" %>

<%
  // Instanciar el DAO y obtener datos
  DashboardDAO dashboardDAO = new DashboardDAO();
  int userId = 1; // Simula el userId; en producción, obtén el userId del usuario autenticado
  int animalesAyudados = dashboardDAO.obtenerAnimalesAyudados(userId);
  int publicacionesRealizadas = dashboardDAO.obtenerPublicacionesRealizadas(userId);
  int eventosInscritos = dashboardDAO.obtenerEventosInscritos(userId);
  String actividadPrincipal = dashboardDAO.obtenerActividadPrincipal(userId);
  Eventos proximoEvento = dashboardDAO.obtenerProximoEvento(userId);
  List<String> actualizaciones = dashboardDAO.obtenerUltimasActualizaciones(userId);
%>

<!DOCTYPE html>
<html lang="es" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact" dir="ltr" data-theme="theme-semi-dark" data-assets-path="../../assets/" data-template="vertical-menu-template-semi-dark">
<head>
  <meta charset="utf-8" />
  <title>Inicio</title>
  <!-- Agrega aquí tus enlaces a CSS y scripts -->
</head>
<body style="background-color: #e6eeff72;">
<div class="container-xxl flex-grow-1 container-p-y">
  <div class="card border-0 mb-4 p-3">
    <div class="card-body row p-0 pb-3">
      <div class="col-12 col-md-8 card-separator">
        <h3 class="text-dark">¡Bienvenido, Adolfo! 👋🏻</h3>
        <p>Reporte semanal</p>
        <div class="d-flex justify-content-between flex-wrap gap-3 me-5">
          <div class="d-flex align-items-center gap-3 me-4 me-sm-0">
                            <span class="bg-label-primary p-2 rounded">
                                <i class='bx bx-laptop bx-sm'></i>
                            </span>
            <div class="content-right">
              <p class="mb-0">Animales ayudados</p>
              <h4 class="text-primary mb-0"><%= animalesAyudados %></h4>
            </div>
          </div>
          <div class="d-flex align-items-center gap-3">
                            <span class="bg-label-info p-2 rounded">
                                <i class='bx bx-bulb bx-sm'></i>
                            </span>
            <div class="content-right">
              <p class="mb-0">Publicaciones realizadas</p>
              <h4 class="text-info mb-0"><%= publicacionesRealizadas %></h4>
            </div>
          </div>
          <div class="d-flex align-items-center gap-3">
                            <span class="bg-label-warning p-2 rounded">
                                <i class='bx bx-check-circle bx-sm'></i>
                            </span>
            <div class="content-right">
              <p class="mb-0">Eventos inscritos</p>
              <h4 class="text-warning mb-0"><%= eventosInscritos %></h4>
            </div>
          </div>
        </div>
      </div>

      <div class="col-12 col-md-4 ps-md-3 ps-lg-5 pt-3 pt-md-0">
        <h5 class="mb-2">Tiempo empleado</h5>
        <p class="mb-4">Reporte semanal</p>
        <h3 class="mb-2">5<span class="text-muted">h</span> 14<span class="text-muted">m</span></h3>
        <span class="badge bg-label-success">+10%</span>
      </div>
    </div>
  </div>

  <!-- Principal actividad -->
  <div class="card h-100">
    <h5 class="card-title m-0 me-2">Principal actividad</h5>
    <p><%= actividadPrincipal %></p>
  </div>

  <!-- Próximo evento -->
  <div class="card h-100">
    <h4 class="mb-2 pb-1">Próximo evento</h4>
    <% if (proximoEvento != null) { %>
    <p>Nombre: <%= proximoEvento.getNombreEvento() %></p>
    <p>Fecha: <%= proximoEvento.getFechaEvento() %></p>
    Lugar: <%= proximoEvento.getLugarEventoId() %>
    <% } else { %>
    <p>No hay próximos eventos.</p>
    <% } %>
  </div>

  <!-- Últimas actualizaciones -->
  <div class="card h-100">
    <h5 class="card-title m-0 me-2">Últimas actualizaciones</h5>
    <ul>
      <% for (String actualizacion : actualizaciones) { %>
      <li><%= actualizacion %></li>
      <% } %>
    </ul>
  </div>
</div>
</body>
</html>
