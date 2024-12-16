<%@ page import="Beans.Usuarios" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme" id="layout-navbar">
    <div class="layout-menu-toggle navbar-nav align-items-xl-center me-1 me-xl-0 d-xl-none">
        <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
            <i class="bx bx-menu bx-sm"></i>
        </a>
    </div>

    <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
        <div class="w-75 align-items-center me-auto">
            <div class="nav-item navbar-search-wrapper mb-0">
                <span class="d-inline-block justify-content-center">
                    <p class="mb-0 fst-normal fw-semibold"><%=request.getParameter("vista")%></p>
                </span>
            </div>
        </div>

        <ul class="navbar-nav flex-row align-items-center ms-0">
            <!-- User -->
            <li class="nav-item navbar-dropdown dropdown-user dropdown">
                <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                        <img src="${pageContext.request.contextPath}/assets/img/AvatarAdmin.webp" alt="" class="w-px-40 h-auto rounded-circle">
                    </div>
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                        <a class="dropdown-item">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0 me-2">
                                    <div class="avatar avatar-online">
                                        <img src="${pageContext.request.contextPath}/assets/img/AvatarAdmin.webp" alt="" class="w-px-40 h-auto rounded-circle">
                                    </div>
                                </div>
                                <div class="flex-grow-1">
                                    <span class="fw-medium d-block">Admin</span>
                                    <small class="text-muted">Administrador</small>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <div class="dropdown-divider"></div>
                    </li>
                    <li>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/Calendario">
                            <i class="menu-icon tf-icons bx bx-calendar-event"></i>
                            <span class="align-middle">Calendario</span>
                        </a>
                    </li>
                    <li>
                        <div class="dropdown-divider"></div>
                    </li>
                    <li>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">
                            <i class="bx bx-power-off me-2"></i>
                            <span class="align-middle">Cerrar sesión</span>
                        </a>
                    </li>
                </ul>
            </li>
            <!--/ User -->
        </ul>
    </div>

    <!-- Search Small Screens -->
    <div class="navbar-search-wrapper search-input-wrapper d-none">
        <input type="text" class="form-control search-input container-xxl border-0" placeholder="Buscar..." aria-label="Buscar...">
        <i class="bx bx-x bx-sm search-toggler cursor-pointer"></i>
    </div>
</nav>
