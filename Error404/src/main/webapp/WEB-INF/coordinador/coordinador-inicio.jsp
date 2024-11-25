<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.stream.*" %>
<%@ page import="java.util.*" %>

<%
    // Obtener los datos del Servlet con validaciones seguras
    String nombreCoordinador = (String) request.getAttribute("nombreCoordinador");
    String fotoPerfil = (String) request.getAttribute("fotoPerfil");
    int hogaresTemporalesRegistrados = request.getAttribute("hogaresTemporalesRegistrados") != null ? (int) request.getAttribute("hogaresTemporalesRegistrados") : 0;
    int totalMascotasPerdidas = request.getAttribute("totalMascotasPerdidas") != null ? (int) request.getAttribute("totalMascotasPerdidas") : 0;
    int totalMascotasEncontradas = request.getAttribute("totalMascotasEncontradas") != null ? (int) request.getAttribute("totalMascotasEncontradas") : 0;
    List<Map<String, String>> actualizaciones = request.getAttribute("ultimasActualizaciones") != null
            ? (List<Map<String, String>>) request.getAttribute("ultimasActualizaciones")
            : java.util.Collections.emptyList();

    List<Map<String, Object>> mascotasPorMes = request.getAttribute("mascotasPorMes") instanceof List
            ? (List<Map<String, Object>>) request.getAttribute("mascotasPorMes")
            : java.util.Collections.emptyList();

    List<Map<String, Object>> mascotasPorMez = request.getAttribute("mascotasPorMez") instanceof List
            ? (List<Map<String, Object>>) request.getAttribute("mascotasPorMez")
            : java.util.Collections.emptyList();
%>



<!DOCTYPE html>
<html lang="es" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact" dir="ltr" data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/">



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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/rtl/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/rtl/theme-semi-dark.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demo.css" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/apex-charts/apex-charts.css" />

    <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>





<body style="background-color: #fef8e5;">
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
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
                <!-- Menú principal -->
                <li class="menu-item"><a href="coordinador-inicio.jsp" class="menu-link"><i class="menu-icon tf-icons bx bx-home"></i><div>Inicio</div></a></li>
                <li class="menu-item"><a href="coordinador-ver-publicaciones.jsp" class="menu-link"><i class="menu-icon tf-icons bx bx-building-house"></i><div>Publicaciones</div></a></li>
                <li class="menu-item"><a href="coordinador-ver-hogarestemporales.jsp" class="menu-link"><i class="menu-icon tf-icons bx bx-building-house"></i><div>Hogares temporales</div></a></li>
                <li class="menu-header small text-uppercase"><span>Gestión</span></li>
                <li class="menu-item"><a href="coordinador-tablas-gestion.jsp" class="menu-link"><i class="menu-icon tf-icons bx bx-building-house"></i><div>Todas</div></a></li>
                <li class="menu-item"><a href="coordinador-tablas-publicaciones.jsp" class="menu-link"><i class="menu-icon tf-icons bx bx-calendar-event"></i><div>Mascotas Perdidas</div></a></li>
                <li class="menu-item"><a href="coordinador-tables-hogaresTemporales.jsp" class="menu-link"><i class="menu-icon tf-icons bx bxs-building-house"></i><div>Hogares temporales</div></a></li>
                <li class="menu-header small text-uppercase"><span>Solicitudes</span></li>
                <li class="menu-item"><a href="coordinador-solicitudes.jsp" class="menu-link"><i class="menu-icon tf-icons bx bx-building-house"></i><div>Todas</div></a></li>
                <li class="menu-item"><a href="coordinador-ver-solicitud-hogarestemporales.jsp" class="menu-link"><i class="menu-icon tf-icons bx bx-calendar-event"></i><div>Hogares temporales</div></a></li>
                <li class="menu-item"><a href="coordinador-ver-solicitudes-mascotasPerdidas.jsp" class="menu-link"><i class="menu-icon tf-icons bx bxs-building-house"></i><div>Publicaciones</div></a></li>
                <li class="menu-header small text-uppercase"><span>Otros</span></li>
                <li class="menu-item"><a href="coordinador-Preguntas-frecuentes.jsp" class="menu-link"><i class="menu-icon tf-icons bx bx-help-circle"></i><div>Preguntas Frecuentes</div></a></li>
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


                        <span style="margin-left: 10px; font-weight: bold; color: rgba(163, 108, 20, 0.83);">Coordinador <%= nombreCoordinador %>!</span>
                        <!-- User Dropdown -->

                        <li class="nav-item navbar-dropdown dropdown-user dropdown">
                            <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                                <div class="avatar avatar-online">
                                    <img src="${pageContext.request.contextPath}/<%= fotoPerfil %>" alt="fotoperfil" class="w-px-40 h-auto rounded-circle">
                                </div>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/coordinador-miperfil-detalles.jsp">
                                        <div class="d-flex">
                                            <div class="flex-shrink-0 me-3">
                                                <div class="avatar avatar-online">
                                                    <img src="${pageContext.request.contextPath}/<%= fotoPerfil %>" alt="fotoperfil" class="w-px-40 h-auto rounded-circle">
                                                </div>
                                            </div>
                                            <div class="flex-grow-1">
                                                <span class="fw-medium d-block"><%= nombreCoordinador %></span>
                                                <small class="text-muted">Coordinador</small>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/coordinador-miperfil-detalles.jsp">
                                        <i class="bx bx-user me-2"></i>
                                        <span class="align-middle">Mi perfil</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/coordinador-ver-miperfil-seguridad.jsp">
                                        <i class="bx bx-lock me-2"></i>
                                        <span class="align-middle">Seguridad</span>
                                    </a>
                                </li>
                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/coordinador-tablas-gestion.jsp">
                                        <i class="bx bx-task me-2"></i>
                                        <span class="align-middle">Gestión</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/coordinador-solicitudes.jsp">
                                        <i class="bx bx-envelope me-2"></i>
                                        <span class="align-middle">Solicitudes</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/coordinador-Preguntas-frecuentes.jsp">
                                        <i class="bx bx-help-circle me-2"></i>
                                        <span class="align-middle">Preguntas frecuentes</span>
                                    </a>
                                </li>
                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/LogoutServlet">
                                        <i class="bx bx-power-off me-2"></i>
                                        <span class="align-middle">Salir</span>
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










            <div class="content-wrapper" style="background-color: #fef8e5;">
                <!-- Content -->
                <div class="container-xxl flex-grow-1 container-p-y">
                    <div class="row">
                        <div class="col-xl-4 col-lg-4 col-md-12 col-12 order-md-0 mb-4">
                            <div class="row">
                                <div class="col-12 mb-4">
                                    <div class="card" style="height: 190px;">
                                        <div class="card-body">
                                            <div class="card-title d-flex align-items-start justify-content-between">
                                                <div class="avatar flex-shrink-0">
                                                    <i class="fas fa-home" style="font-size: 36px; color: #d4a15f;"></i> <!-- Icono de hogares -->
                                                </div>
                                                <div class="dropdown"></div>
                                            </div>
                                            <span class="d-block mb-1"> Hogares temporales > Registrados </span>
                                            <h3 class="card-title text-nowrap mb-2"><%= hogaresTemporalesRegistrados %></h3>
                                            <small class="text fw-medium">
                                                <i class='bx bx-up-arrow-alt'></i>
                                                <span class="text-success">+14.82%</span>
                                            </small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 mb-4">
                                    <div class="card" style="height: 190px;">
                                        <div class="card-body pb-2">
                                            <span class="d-block fw-medium mb-1">Total mascotas reportadas perdidas:</span>
                                            <h3 class="card-title mb-1"><%= totalMascotasPerdidas %></h3>
                                            <div id="revenue">
                                                <canvas id="myChart" style="width: 100%; height: 100px;"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-6 col-12 order-md-1 mb-4">
                            <div class="card h-100">
                                <div class="card-header d-flex align-items-center justify-content-between pb-0">
                                    <div class="card-title mb-0">
                                        <h5 class="m-0 me-2">Cantidad de mascotas encontradas por mes</h5>
                                        <small class="text-muted">Últimos 4 meses:</small>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <div class="d-flex flex-column align-items-center gap-1">
                                            <h2 class="mb-2">Total: <%= request.getAttribute("totalMascotasEncontradas") != null ? request.getAttribute("totalMascotasEncontradas") : 0 %></h2>
                                            <span>Mascotas encontradas</span>
                                        </div>
                                    </div>
                                    <ul class="p-0 m-0">
                                        <%
                                            // Obtener el atributo "mascotasPorMes" del request y manejar posibles errores de tipo o nulos
                                            Object mascotasPorMesObj = request.getAttribute("mascotasPorMes");
                                            List<Map<String, Object>> mascotaspormes = null;

                                            if (mascotasPorMesObj instanceof List) {
                                                mascotasPorMes = (List<Map<String, Object>>) mascotasPorMesObj;
                                            } else {
                                                mascotasPorMes = java.util.Collections.emptyList(); // Si no es del tipo esperado, lista vacía
                                            }

                                            if (mascotasPorMes != null && !mascotasPorMes.isEmpty()) {
                                                for (Map<String, Object> dato : mascotasPorMes) {
                                                    String mes = dato.containsKey("mes") ? (String) dato.get("mes") : "Sin mes";
                                                    Object total = dato.containsKey("total") ? dato.get("total") : 0;
                                        %>
                                        <li class="d-flex mb-4 pb-1">
                                            <div class="avatar flex-shrink-0 me-3">
                <span class="avatar-initial rounded bg-label-primary">
                    <i class="fas fa-calendar-alt" style="font-size: 36px; color: #FFA500;"></i>
                </span>
                                            </div>
                                            <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                <div class="me-2">
                                                    <h6 class="mb-0"><%= mes %></h6>
                                                    <small class="text-muted">Detalles de mes</small>
                                                </div>
                                                <div class="user-progress">
                                                    <small class="fw-medium"><%= total %></small>
                                                </div>
                                            </div>
                                        </li>
                                        <%
                                            }
                                        } else {
                                        %>
                                        <li class="d-flex mb-4 pb-1">
                                            <div class="d-flex w-100 flex-wrap align-items-center justify-content-center">
                                                <h6 class="mb-0 text-muted">No se encontraron datos para los últimos 4 meses.</h6>
                                            </div>
                                        </li>
                                        <% } %>
                                    </ul>
                                </div>

                            </div>
                        </div>




                        <div class="col-xl-4 col-lg-4 col-md-6 col-12 order-md-2 mb-4">
                            <div class="card">
                                <div class="card-header d-flex align-items-center justify-content-between">
                                    <h5 class="card-title m-0 me-2">Ultimas actualizaciones:</h5>
                                    <div class="dropdown">
                                        <button class="btn p-0" type="button" id="timelineWapper" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="timelineWapper">
                                            <a class="dropdown-item" href="javascript:void(0)">Recargar</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <ul class="timeline">
                                        <%
                                            if (actualizaciones != null && !actualizaciones.isEmpty()) {
                                                for (Map<String, String> actualizacion : actualizaciones) {
                                                    String descripcion = actualizacion.get("descripcion");
                                                    String tiempo = actualizacion.get("tiempo");
                                        %>
                                        <li class="timeline-item timeline-item-transparent">
            <span class="timeline-point-wrapper">
                <span class="timeline-point timeline-point-primary"></span>
            </span>
                                            <div class="timeline-event">
                                                <div class="timeline-header mb-1">
                                                    <h6 class="mb-0"><%= descripcion %></h6>
                                                    <small class="text-muted"><%= tiempo %></small>
                                                </div>
                                            </div>
                                        </li>
                                        <%
                                            }
                                        } else {
                                        %>
                                        <li class="timeline-item timeline-item-transparent">
                                            <span class="timeline-point-wrapper">
                                                <span class="timeline-point timeline-point-secondary"></span>
                                            </span>
                                            <div class="timeline-event">
                                                <div class="timeline-header mb-1">
                                                    <h6 class="mb-0">No hay actualizaciones recientes.</h6>
                                                </div>
                                            </div>
                                        </li>
                                        <%
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

                <!-- Scripts principales -->
                <script src="${pageContext.request.contextPath}/assets/vendor/libs/jquery/jquery.js"></script>
                <script src="${pageContext.request.contextPath}/assets/vendor/libs/popper/popper.js"></script>
                <script src="${pageContext.request.contextPath}/assets/vendor/js/bootstrap.js"></script>
                <script src="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
                <script src="${pageContext.request.contextPath}/assets/vendor/libs/hammer/hammer.js"></script>
                <script src="${pageContext.request.contextPath}/assets/vendor/libs/i18n/i18n.js"></script>
                <script src="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.js"></script>
                <script src="${pageContext.request.contextPath}/assets/vendor/js/menu.js"></script>
                <script src="${pageContext.request.contextPath}/assets/vendor/libs/apex-charts/apexcharts.js"></script>

                <!-- Script principal -->
                <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

                <!-- JSP: Preparación de datos para el gráfico -->
                    <%
    StringBuilder etiquetasMeses = new StringBuilder();
    StringBuilder valoresTotales = new StringBuilder();

    // Convertir los datos en formato adecuado para el gráfico
    if (mascotasPorMez != null && !mascotasPorMez.isEmpty()) {
        for (Map<String, Object> dato : mascotasPorMez) {
            etiquetasMeses.append("'").append(dato.get("mes")).append("',");
            valoresTotales.append(dato.get("total")).append(",");
        }

        // Eliminar la última coma sobrante
        if (etiquetasMeses.length() > 0) etiquetasMeses.setLength(etiquetasMeses.length() - 1);
        if (valoresTotales.length() > 0) valoresTotales.setLength(valoresTotales.length() - 1);
    }
%>

                <!-- Script para el gráfico -->
                <script>
                    const etiquetasMeses = [<%= etiquetasMeses.length() > 0 ? etiquetasMeses.toString() : "'Sin datos'" %>];
                    const valoresTotales = [<%= valoresTotales.length() > 0 ? valoresTotales.toString() : "0" %>];

                    const ctx = document.getElementById('myChart').getContext('2d');
                    const data = {
                        labels: etiquetasMeses,
                        datasets: [{
                            data: valoresTotales,
                            backgroundColor: 'rgba(54, 162, 235, 0.5)',
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 1
                        }]
                    };
                    const options = {
                        responsive: true,
                        maintainAspectRatio: false,
                        scales: {
                            y: { beginAtZero: true }
                        },
                        plugins: {
                            tooltip: {
                                callbacks: {
                                    label: function(tooltipItem) {
                                        return 'Valor: ' + tooltipItem.raw;
                                    }
                                }
                            },
                            legend: { display: false }
                        }
                    };
                    const myChart = new Chart(ctx, {
                        type: 'bar',
                        data: data,
                        options: options
                    });
                </script>

</body>
</html>

