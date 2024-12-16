<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="Beans.Usuarios" %>
<%
    Usuarios usuario = (Usuarios) session.getAttribute("usuariosession");
    String nombre = usuario.getNombre();
    String apellido = usuario.getApellido();
    String rol = usuario.getRol().getNombreRol();
%>

<nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme" id="layout-navbar">


    <div class="layout-menu-toggle navbar-nav align-items-xl-center me-1 me-xl-0   d-xl-none ">
        <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
            <i class="bx bx-menu bx-sm"></i>
        </a>
    </div>


    <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">

        <div class="w-75 align-items-center me-auto">
            <div class="nav-item navbar-search-wrapper mb-0">
              <span class="d-inline-block justify-content-center">
              <p class="mb-0 fst-normal fw-semibold ff-"><%=request.getParameter("recurso")%></p>
            </span>
            </div>
        </div>

        <ul class="navbar-nav flex-row align-items-center ms-0">

            <!-- Notification -->
            <span class="text-body" style="margin-left: 10px; margin-right: 2px; font-weight: bold;">¡Hola!, <%= nombre %></span>
            <!--/ Notification -->
            <!-- User -->
            <li class="nav-item navbar-dropdown dropdown-user dropdown">
                <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                        <img src="https://img.freepik.com/vector-gratis/diseno-plantilla-imagen-perfil_742173-22027.jpg?t=st=1726637844~exp=1726641444~hmac=f81927ff296e19d666bcbbd27413900024f764855e07caa5d1a64d3e3d1c4f9d&w=826" alt class="w-px-40 h-auto rounded-circle">
                    </div>
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/UsuarioServlet?action=verMiPerfilDetalles&id=<%=usuario.getUserId()%>">
                            <div class="d-flex">
                                <div class="flex-shrink-0 me-3">
                                    <div class="avatar avatar-online">
                                        <img src="https://img.freepik.com/vector-gratis/diseno-plantilla-imagen-perfil_742173-22027.jpg?t=st=1726637844~exp=1726641444~hmac=f81927ff296e19d666bcbbd27413900024f764855e07caa5d1a64d3e3d1c4f9d&w=826" alt class="w-px-40 h-auto rounded-circle">
                                    </div>
                                </div>
                                <div class="flex-grow-1">
                                    <span class="fw-medium d-block"> <%=nombre%> <%=apellido%></span>
                                    <small class="text-muted"><%=rol%></small>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <div class="dropdown-divider"></div>
                    </li>
                    <li>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/UsuarioServlet?action=verMiPerfilSeguridad&">
                            <i class="bx bx-lock me-2" style="color: #1f4397;"></i>
                            <span class="align-middle" style="color: #1f4397;">Seguridad</span>
                        </a>
                    </li>


                    <li>
                        <div class="dropdown-divider"></div>
                    </li>
                    <li>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/Publicaciones?action=verTodasMisPublicaciones&user_id=<%=usuario.getUserId()%>">
                            <i class="bx bx-building-house"></i>
                            <span class="align-middle">Mis publicaciones</span>
                        </a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/EventosServlet?action=verEventosDeUsuario">
                            <i class="bx bx-bone"></i>
                            <span class="align-middle">Mis eventos</span>
                        </a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/Calendario">
                            <i class="bx bx-calendar"></i>
                            <span class="align-middle">Mi Calendario</span>
                        </a>
                    </li>
                    <li>
                        <div class="dropdown-divider"></div>
                    </li>
                    <li>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/FAQ">
                            <i class="bx bx-help-circle"></i>
                            <span class="align-middle">Preguntas frecuentes</span>
                        </a>
                    </li>
                    <li>
                        <div class="dropdown-divider"></div>
                    </li>
                    <li>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/logout" >
                            <i class="bx bx-power-off me-2" style="color: rgb(231, 0, 0);"></i>
                            <span class="align-middle" style="color: rgb(231, 0, 0);">Salir</span>
                        </a>
                    </li>
                </ul>
            </li>
            <!--/ User -->

        </ul>
    </div>


    <!-- Search Small Screens -->
    <div class="navbar-search-wrapper search-input-wrapper  d-none">
        <input type="text" class="form-control search-input container-xxl border-0" placeholder="Search..." aria-label="Search...">
        <i class="bx bx-x bx-sm search-toggler cursor-pointer"></i>
    </div>


</nav>