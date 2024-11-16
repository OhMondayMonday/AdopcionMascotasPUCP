<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Daos.DashboardDAO" %>
<%@ page import="Beans.Eventos" %>
<%@ page import="Beans.Logs" %>
<%@ page import="java.util.List" %>

<%
    // Instanciar el DAO y obtener datos simulados
    DashboardDAO dashboardDAO = new DashboardDAO();
    int userId = 1; // Simula el userId; en producción, usa el userId del usuario autenticado
    int animalesAyudados = dashboardDAO.obtenerAnimalesAyudados(userId);
    int publicacionesRealizadas = dashboardDAO.obtenerPublicacionesRealizadas(userId);
    int eventosInscritos = dashboardDAO.obtenerEventosInscritos(userId);
    String actividadPrincipal = dashboardDAO.obtenerActividadPrincipal(userId);
    Eventos proximoEvento = dashboardDAO.obtenerProximoEvento(userId);
%>

<!DOCTYPE html>

<html lang="es" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact" dir="ltr" data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Inicio</title>


    <meta name="description" content="Most Powerful &amp; Comprehensive Bootstrap 5 Admin Dashboard built for developers!" />
    <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
    <!-- Canonical SEO -->
    <link rel="canonical" href="https://themeselection.com/item/sneat-dashboard-pro-bootstrap/">


    <!-- ? PROD Only: Google Tag Manager (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
            new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
        j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
        '../../../../www.googletagmanager.com/gtm5445.html?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-5DDHKGP');</script>
    <!-- End Google Tag Manager -->

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/logo_Alianza_Animal_-removebg-preview.png" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&amp;display=swap" rel="stylesheet">

    <!-- Icons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/fonts/boxicons.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/fonts/fontawesome.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/fonts/flag-icons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/rtl/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/rtl/theme-semi-dark.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/quill/typography.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/quill/katex.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/quill/editor.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/dropzone/dropzone.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/flatpickr/flatpickr.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/tagify/tagify.css" />

    <!-- Page CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/pages/page-faq.css" />

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>

    <!-- Config -->
    <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>


</head>


<body style="background-color: #e6eeff72;">


<!-- ?PROD Only: Google Tag Manager (noscript) (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">

        <!-- Menú -->
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
                    <a href="ver-inicio-usuario.html" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-home"></i>
                        <div class="text-truncate" data-i18n="Inicio">Inicio</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="ver-publicaciones-usuario.html" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-building-house"></i>
                        <div class="text-truncate" data-i18n="Publicaciones">Publicaciones</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="ver-eventos-usuario.html" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-calendar-event"></i>
                        <div class="text-truncate" data-i18n="Eventos">Eventos</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="postular-hogarestemporales.html" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-building-house"></i>
                        <div class="text-truncate" data-i18n="Hogares temporales">Hogares temporales</div>
                    </a>
                </li>
                <!-- Gestion -->
                <li class="menu-header small text-uppercase">
                    <span class="menu-header-text" data-i18n="Gestion">Gestión</span>
                </li>
                <li class="menu-item">
                    <a href="ver-mispublicaciones-usuario.html" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-building-house"></i>
                        <div class="text-truncate" data-i18n="Mis publicaciones">Mis publicaciones</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="ver-miseventos-usuario.html" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-calendar-event"></i>
                        <div class="text-truncate" data-i18n="Mis eventos">Mis eventos</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="usuario-mi-hogar-temporal.html" class="menu-link">
                        <i class="menu-icon tf-icons bx bxs-building-house"></i>
                        <div class="text-truncate" data-i18n="Mi Hogar Temporal">Mi Hogar Temporal</div>
                    </a>
                </li>
                <!-- Misc -->
                <li class="menu-header small text-uppercase">
                    <span class="menu-header-text" data-i18n="Otros">Otros</span>
                </li>
                <li class="menu-item">
                    <a href="Preguntas-frecuentes.html" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-help-circle"></i>
                        <div class="text-truncate" data-i18n="Preguntas frecuentes">Preguntas frecuentes</div>
                    </a>
                </li>
            </ul>
        </aside>


        <div class="layout-page">
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
            <p class="mb-0 fst-normal fw-semibold ff-">Inicio</p>
          </span>
                        </div>
                    </div>

                    <ul class="navbar-nav flex-row align-items-center ms-0">
                        <span class="text-body" style="margin-left: 10px; margin-right: 2px; font-weight: bold;">¡Hola, Adolfo!</span>

                        <!-- User Dropdown -->
                        <li class="nav-item navbar-dropdown dropdown-user dropdown">
                            <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                                <div class="avatar avatar-online">
                                    <img class="w-px-40 h-auto rounded-circle" src="https://img.freepik.com/vector-gratis/diseno-plantilla-imagen-perfil_742173-22027.jpg?t=st=1726637844~exp=1726641444~hmac=f81927ff296e19d666bcbbd27413900024f764855e07caa5d1a64d3e3d1c4f9d&amp;w=826" alt="fotoperfil">
                                </div>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/ver-miperfil-usuario-detalles.html">
                                        <div class="d-flex">
                                            <div class="flex-shrink-0 me-3">
                                                <div class="avatar avatar-online">
                                                    <img class="w-px-40 h-auto rounded-circle" src="https://img.freepik.com/vector-gratis/diseno-plantilla-imagen-perfil_742173-22027.jpg?t=st=1726637844~exp=1726641444~hmac=f81927ff296e19d666bcbbd27413900024f764855e07caa5d1a64d3e3d1c4f9d&amp;w=826" alt="fotoperfil">
                                                </div>
                                            </div>
                                            <div class="flex-grow-1">
                                                <span class="fw-medium d-block">Adolfo Contreras</span>
                                                <small class="text-muted">Usuario</small>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li><div class="dropdown-divider"></div></li>
                                <li>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/ver-miperfil-usuario-seguridad.html">
                                        <i class="bx bx-lock me-2" style="color: #1f4397;"></i>
                                        <span class="align-middle" style="color: #1f4397;">Seguridad</span>
                                    </a>
                                </li>
                                <li><div class="dropdown-divider"></div></li>
                                <li>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/ver-mispublicaciones-usuario.html">
                                        <i class="bx bx-building-house"></i>
                                        <span class="align-middle">Mis publicaciones</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/ver-miseventos-usuario.html">
                                        <i class="bx bx-bone"></i>
                                        <span class="align-middle">Mis eventos</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/ver-calendario-usuario.html">
                                        <i class="bx bx-calendar"></i>
                                        <span class="align-middle">Mi Calendario</span>
                                    </a>
                                </li>
                                <li><div class="dropdown-divider"></div></li>
                                <li>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/Preguntas-frecuentes.html">
                                        <i class="bx bx-help-circle"></i>
                                        <span class="align-middle">Preguntas frecuentes</span>
                                    </a>
                                </li>
                                <li><div class="dropdown-divider"></div></li>
                                <li>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/LogoutServlet">
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
                <div class="navbar-search-wrapper search-input-wrapper d-none">
                    <input type="text" class="form-control search-input container-xxl border-0" placeholder="Search..." aria-label="Search...">
                    <i class="bx bx-x bx-sm search-toggler cursor-pointer"></i>
                </div>

            </nav>
            <!-- Content wrapper -->
            <div class="content-wrapper">

            <!-- Contenido Principal -->
            <div class="container-xxl flex-grow-1 container-p-y">
                <div class="card border-0 mb-4 p-3">
                    <div class="card-body row p-0 pb-3">
                        <div class="col-12 col-md-8 card-separator">
                            <h3 class="text-dark">¡Bienvenido, Adolfo! 👋🏻</h3>
                            <p>Reporte semanal</p>
                            <div class="d-flex justify-content-between flex-wrap gap-3 me-5">
                                <div class="d-flex align-items-center gap-3 me-4">
                                    <span class="bg-label-primary p-2 rounded"><i class='bx bx-laptop bx-sm'></i></span>
                                    <div class="content-right"><p>Animales ayudados</p><h4 class="text-primary"><%= animalesAyudados %></h4></div>
                                </div>
                                <div class="d-flex align-items-center gap-3">
                                    <span class="bg-label-info p-2 rounded"><i class='bx bx-bulb bx-sm'></i></span>
                                    <div class="content-right"><p>Publicaciones realizadas</p><h4 class="text-info"><%= publicacionesRealizadas %></h4></div>
                                </div>
                                <div class="d-flex align-items-center gap-3">
                                    <span class="bg-label-warning p-2 rounded"><i class='bx bx-check-circle bx-sm'></i></span>
                                    <div class="content-right"><p>Eventos inscritos</p><h4 class="text-warning"><%= eventosInscritos %></h4></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-4 ps-md-3 ps-lg-5 pt-3 pt-md-0">
                            <h5 class="mb-2">Tiempo empleado</h5>
                            <p>Reporte semanal</p>
                            <h3>5<span class="text-muted">h</span> 14<span class="text-muted">m</span></h3>
                            <span class="badge bg-label-success">+10%</span>
                        </div>
                    </div>
                </div>

                <!-- Actividad Principal -->
                <div class="row mb-4 g-3">
                    <div class="col-xl-4">
                        <div class="card h-100">
                            <div class="card-header"><h5>Principal actividad</h5></div>
                            <div class="d-flex justify-content-center align-items-center h-100 p-3"> <!-- Añadido padding con "p-3" -->
                                <img class="img-fluid rounded" src="https://img.freepik.com/vector-gratis/diseno-plantilla-imagen-perfil_742173-22027.jpg?t=st=1726637844~exp=1726641444~hmac=f81927ff296e19d666bcbbd27413900024f764855e07caa5d1a64d3e3d1c4f9d&w=826" alt="fotoperfil">
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-4">
                        <div class="card h-100">
                            <div class="card-body">
                                <h4 class="mb-2 pb-1">Próximo evento</h4>
                                <% if (proximoEvento != null) { %>
                                <p class="small">Sigue compartiendo con los demás por un bien animal</p>
                                <div class="row mb-3">
                                    <div class="col-6 d-flex align-items-center">
                                        <div class="avatar flex-shrink-0 me-2">
                            <span class="avatar-initial rounded bg-label-primary">
                                <i class="bx bx-calendar-exclamation bx-sm"></i>
                            </span>
                                        </div>
                                        <div>
                                            <h6 class="mb-0 text-nowrap"><%= proximoEvento.getFechaEvento() %></h6>
                                            <small>Nuevo evento</small>
                                        </div>
                                    </div>
                                    <div class="col-6 d-flex align-items-center">
                                        <div class="avatar flex-shrink-0 me-2">
                            <span class="avatar-initial rounded bg-label-primary">
                                <i class="bx bx-time-five bx-sm"></i>
                            </span>
                                        </div>
                                        <div>
                                            <h6 class="mb-0 text-nowrap"><%= proximoEvento.getLugarEvento().getNombreLugar() %></h6>
                                            <small>Lugar</small>
                                        </div>
                                    </div>
                                </div>
                                <a href="#" class="btn btn-primary w-100 mb-1">Participar en el evento</a>
                                <div class="text-center">
                                    <small>¿Deseas crear una nueva publicación?</small>
                                </div>
                                <a href="crear-publicacion-usuariofinal-normal.html" class="btn btn-facebook w-100">Nueva publicación</a>
                                <% } else { %>
                                <p>No hay próximos eventos.</p>
                                <% } %>
                            </div>
                        </div>
                    </div>


                    <div class="col-xl-4">
                        <div class="card h-100">
                            <div class="card-header"><h5>Últimas actualizaciones:</h5></div>
                            <div class="card-body">
                                <ul class="timeline">
                                    <%
                                        List<Logs> actualizaciones = (List<Logs>) request.getAttribute("actualizaciones");

                                        if (actualizaciones != null && !actualizaciones.isEmpty()) {
                                            for (Logs log : actualizaciones) {
                                    %>
                                    <li class="timeline-item timeline-item-transparent">
        <span class="timeline-point-wrapper">
            <span class="timeline-point timeline-point-primary"></span>
        </span>
                                        <div class="timeline-event">
                                            <div class="timeline-header mb-1">
                                                <h6 class="mb-0"><%= log.getDescripcion() %></h6> <!-- Muestra la descripción del log -->
                                                <small class="text-muted"><%= log.getFecha() %></small> <!-- Muestra la fecha del log -->
                                            </div>
                                        </div>
                                    </li>
                                    <%
                                            }
                                        }
                                    %>
                                    <li class="timeline-end-indicator">
                                        <i class="bx bx-check-circle"></i>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>


                <footer class="footer">
                <div class="container-fluid d-flex flex-md-row flex-column justify-content-between align-items-md-center gap-1 container-p-x py-3">
                    <div>
                        <a href="<%= request.getContextPath() %>/home" class="footer-link me-4 text-muted">©2024 Alianza Animal S.A. Todos los derechos reservados.</a>
                    </div>
                    <div>
                        <a href="<%= request.getContextPath() %>/ayuda" class="footer-link me-4 text-muted">Ayuda</a>
                        <a href="<%= request.getContextPath() %>/contactos" class="footer-link me-4 text-muted">Contactos</a>
                        <a href="<%= request.getContextPath() %>/terminos" class="footer-link text-muted">Términos &amp; Condiciones</a>
                    </div>
                </div>

        </footer>


            <!-- / Layout page -->
        </div>



        <!-- Overlay -->
        <div class="layout-overlay layout-menu-toggle"></div>


        <!-- Drag Target Area To SlideIn Menu On Small Screens -->


    </div>
</div>
    <!-- / Layout wrapper -->


    <!-- / Footer -->
    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->

<script src="${pageContext.request.contextPath}/assets/vendor/libs/jquery/jquery.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/popper/popper.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/hammer/hammer.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/i18n/i18n.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/js/menu.js"></script>

<!-- Vendors JS -->
<script src="${pageContext.request.contextPath}/assets/vendor/libs/moment/moment.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/apex-charts/apexcharts.js"></script>

<!-- Main JS -->
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

<!-- Page JS -->
<script src="${pageContext.request.contextPath}/assets/js/app-academy-dashboard.js"></script>

</body>

</html>
