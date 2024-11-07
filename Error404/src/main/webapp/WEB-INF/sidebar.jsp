<%--
  Created by IntelliJ IDEA.
  User: Luis Joaquin Pozo
  Date: 6/11/2024
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Sidebar</title>
  </head>
  <body>
  <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
    <div class="app-brand demo px-3">
      <a href="javascript:void(0);" class="app-brand-link">
      <span class="app-brand-logo demo">
        <img class="h-px-50 tf-icon" src="${pageContext.request.contextPath}/assets/img/logo_Alianza_Animal_-removebg-preview.png" alt="logo">
      </span>
      </a>
      <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto">
        <i class="bx bx-chevron-left bx-sm align-middle"></i>
      </a>
    </div>

    <div class="menu-inner-shadow"></div>

    <ul class="menu-inner py-1">
      <li class="menu-item">
        <a href="${pageContext.request.contextPath}/ver-inicio-usuario.jsp" class="menu-link">
          <i class="menu-icon tf-icons bx bx-home"></i>
          <div class="text-truncate" data-i18n="Inicio">Inicio</div>
        </a>
      </li>
      <li class="menu-item">
        <a href="${pageContext.request.contextPath}/ver-publicaciones-usuario.jsp" class="menu-link">
          <i class="menu-icon tf-icons bx bx-building-house"></i>
          <div class="text-truncate" data-i18n="Publicaciones">Publicaciones</div>
        </a>
      </li>
      <li class="menu-item">
        <a href="${pageContext.request.contextPath}/ver-eventos-usuario.jsp" class="menu-link">
          <i class="menu-icon tf-icons bx bx-calendar-event"></i>
          <div class="text-truncate" data-i18n="Eventos">Eventos</div>
        </a>
      </li>
      <li class="menu-item">
        <a href="${pageContext.request.contextPath}/postular-hogarestemporales.jsp" class="menu-link">
          <i class="menu-icon tf-icons bx bx-building-house"></i>
          <div class="text-truncate" data-i18n="Hogares temporales">Hogares temporales</div>
        </a>
      </li>

      <!-- Gestion Section -->
      <li class="menu-header small text-uppercase">
        <span class="menu-header-text" data-i18n="Gestion">Gestión</span>
      </li>
      <li class="menu-item">
        <a href="${pageContext.request.contextPath}/ver-mispublicaciones-usuario.jsp" class="menu-link">
          <i class="menu-icon tf-icons bx bx-building-house"></i>
          <div class="text-truncate" data-i18n="Mis publicaciones">Mis publicaciones</div>
        </a>
      </li>
      <li class="menu-item">
        <a href="${pageContext.request.contextPath}/ver-miseventos-usuario.jsp" class="menu-link">
          <i class="menu-icon tf-icons bx bx-calendar-event"></i>
          <div class="text-truncate" data-i18n="Mis eventos">Mis eventos</div>
        </a>
      </li>
      <li class="menu-item">
        <a href="${pageContext.request.contextPath}/usuario-mi-hogar-temporal.jsp" class="menu-link">
          <i class="menu-icon tf-icons bx bxs-building-house"></i>
          <div class="text-truncate" data-i18n="Mi Hogar Temporal">Mi Hogar Temporal</div>
        </a>
      </li>

      <!-- Misc Section -->
      <li class="menu-header small text-uppercase"><span class="menu-header-text" data-i18n="Otros">Otros</span></li>
      <li class="menu-item">
        <a href="${pageContext.request.contextPath}/Preguntas-frecuentes.jsp" class="menu-link">
          <i class="menu-icon tf-icons bx bx-help-circle"></i>
          <div class="text-truncate" data-i18n="Preguntas frecuentes">Preguntas frecuentes</div>
        </a>
      </li>
    </ul>
  </aside>

  </body>
</html>
