<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.stream.*" %>
<%@ page import="java.util.*" %>

<%
    // Obtener los datos del Servlet con validaciones seguras
    String nombreAdministrador = (String) request.getAttribute("nombreAdministrador");
    String fotoPerfil = (String) request.getAttribute("fotoPerfil");
    int totalDonantes = (int) request.getAttribute("totalDonantes");
    double montoTotalDonaciones = (double) request.getAttribute("montoTotalDonaciones");
    int alberguesRegistrados = (int) request.getAttribute("alberguesRegistrados");
    int totalMascotasPerdidas = (int) request.getAttribute("totalMascotasPerdidas");
    List<Map<String, Object>> mascotasEncontradas = (List<Map<String, Object>>) request.getAttribute("mascotasEncontradas");
    List<Map<String, Object>> usuariosMasDonaciones = (List<Map<String, Object>>) request.getAttribute("usuariosMasDonaciones");
    List<Map<String, Object>> alberguesMasDonaciones = (List<Map<String, Object>>) request.getAttribute("alberguesMasDonaciones");
    List<Map<String, String>> ultimasActualizaciones = (List<Map<String, String>>) request.getAttribute("ultimasActualizaciones");
%>

<!DOCTYPE html>
<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="../../assets/" data-template="vertical-menu-template-semi-dark">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
    <title>Admin-inicio</title>

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
    <link rel="icon" type="image/x-icon" href="<%= request.getContextPath() %>/assets/img/logo_Alianza_Animal_-removebg-preview.png" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&amp;display=swap" rel="stylesheet">

    <!-- Icons -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendor/fonts/boxicons.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendor/fonts/fontawesome.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendor/fonts/flag-icons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendor/css/rtl/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendor/css/rtl/theme-semi-dark.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendor/libs/typeahead-js/typeahead.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendor/libs/quill/typography.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendor/libs/quill/katex.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendor/libs/quill/editor.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendor/libs/select2/select2.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendor/libs/dropzone/dropzone.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendor/libs/flatpickr/flatpickr.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendor/libs/tagify/tagify.css" />

    <!-- Page CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/vendor/css/pages/page-faq.css" />

    <!-- Helpers -->
    <script src="<%= request.getContextPath() %>/assets/vendor/js/helpers.js"></script>

    <!-- Config -->
    <script src="<%= request.getContextPath() %>/assets/js/config.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        body, footer {
            background-color: #d4edda;
            margin: 0;
            padding: 0;
        }

        .bg-footer-theme {
            background-color: #d4edda !important;
        }

        footer {
            padding: 10px 0;
            text-align: center;
            background-color: #d4edda;
        }
    </style>
</head>

<body>

<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
            <div class="app-brand demo px-3">
                <a href="javascript:void(0);" class="app-brand-link">
            <span class="app-brand-logo demo">
                <img class="h-px-50 tf-icon" src="<%= request.getContextPath() %>/assets/img/logo_Alianza_Animal_-removebg-preview.png" alt="logo">
            </span>
                </a>

                <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto">
                    <i class="bx bx-chevron-left bx-sm align-middle"></i>
                </a>
            </div>
            <ul class="menu-inner py-1">

                <li class="menu-item">
                    <a href="<%= request.getContextPath() %>/Principal_Administrador.jsp" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-home"></i>
                        <div class="text-truncate" data-i18n="Inicio">Inicio</div>
                    </a>
                </li>

                <!-- Gestion -->
                <li class="menu-header small text-uppercase">
                    <span class="menu-header-text" data-i18n="Gestion">Gestion</span>
                </li>
                <li class="menu-item">
                    <a href="<%= request.getContextPath() %>/GestionarUsua_Admin.jsp" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-calendar-event"></i>
                        <div class="text-truncate" data-i18n="Gestionar Cuentas">Gestionar Cuentas</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="<%= request.getContextPath() %>/Donacion_Admin.jsp" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-building-house"></i>
                        <div class="text-truncate" data-i18n="Donaciones">Donaciones</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="<%= request.getContextPath() %>/Solicitud_Admin.jsp" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-list-check"></i>
                        <div class="text-truncate" data-i18n="Solicitudes">Solicitudes</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="<%= request.getContextPath() %>/AdminVerCoordinadores.jsp" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-collection"></i>
                        <div class="text-truncate" data-i18n="Coordinadores de zona">Coordinadores De Zona</div>
                    </a>
                </li>

                <li class="menu-item">
                    <a href="<%= request.getContextPath() %>/Admin_VerLugares.jsp" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-food-menu"></i>
                        <div class="text-truncate" data-i18n="Lugares Registrados">Lugares Registrados</div>
                    </a>
                </li>

                <li class="menu-header small text-uppercase">
                    <span class="menu-header-text" data-i18n="Crear">Crear</span>
                </li>

                <li class="menu-item">
                    <a href="<%= request.getContextPath() %>/Admin_CreaCoordinador.jsp" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-detail"></i>
                        <div class="text-truncate" data-i18n="Crear Coordinador">Crear Coordinador</div>
                    </a>
                </li>

                <li class="menu-item">
                    <a href="<%= request.getContextPath() %>/Admin_CreaLugarEvento.jsp" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-detail"></i>
                        <div class="text-truncate" data-i18n="Lugar Para Eventos">Lugar Para Eventos</div>
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
                        <!-- User -->
                        <li class="nav-item navbar-dropdown dropdown-user dropdown">
                            <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                                <div class="avatar avatar-online">
                                    <img src="${pageContext.request.contextPath}/<%= fotoPerfil %>" alt="fotoperfil" class="w-px-40 h-auto rounded-circle">
                                </div>
                            </a>


                            <ul class="dropdown-menu dropdown-menu-end">
                                <li>
                                    <a class="dropdown-item">
                                        <div class="d-flex align-items-center">
                                            <div class="flex-shrink-0 me-2">
                                                <div class="avatar avatar-online">
                                                    <img src="${pageContext.request.contextPath}/<%= fotoPerfil %>" alt="fotoperfil" class="w-px-40 h-auto rounded-circle">
                                                </div>
                                            </div>

                                            <div class="flex-grow-1">
                                                <span class="fw-medium d-block"><%= nombreAdministrador %></span>
                                                <small class="text-muted">Administrador</small>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>

                                <li>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/Admin_Calendario.jsp">
                                        <i class="menu-icon tf-icons bx bx-calendar-event"></i>
                                        <span class="align-middle">Calendario</span>
                                    </a>
                                </li>
                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/index.jsp">
                                        <i class="bx bx-power-off me-2"></i>
                                        <span class="align-middle">Cerrar sesión</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>

                <div class="navbar-search-wrapper search-input-wrapper d-none">
                    <input type="text" class="form-control search-input container-xxl border-0" placeholder="Search..." aria-label="Search...">
                    <i class="bx bx-x bx-sm search-toggler cursor-pointer"></i>
                </div>

            </nav>

            <div class="content-wrapper">
                <div class="container-xxl flex-grow-1 container-p-y">
                    <div class="row">
                        <div class="col-xl-6 col-lg-4 col-md-6 order-1">
                            <div class="row">
                                <div class="col-xl-6 col-lg-6 col-md-12 col-6 mb-4">
                                    <div class="card" style="min-height: 190px;">
                                        <div class="card-body pb-2">
                                            <span class="d-block fw-medium mb-1">Número total de donantes (mes actual):</span>
                                            <h3 class="card-title mb-1">${totalDonantes}</h3>
                                            <div class="chart-container-especifico" style="height: 100px;">
                                                <canvas id="donantesChart"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-12 col-6 mb-4">
                                    <div class="card" style="min-height: 190px;">
                                        <div class="card-body">
                                            <div class="card-title d-flex align-items-start justify-content-between">
                                                <div class="avatar flex-shrink-0">
                                                    <!-- Cargar la imagen dinámicamente -->
                                                    <img src="<%= request.getAttribute("imagePath") != null ? request.getAttribute("imagePath") : "/assets/img/soles.png" %>" alt="Monto Total de Donaciones" style="width: 36px; height: 36px;">
                                                </div>
                                                <div class="dropdown"></div>
                                            </div>
                                            <span>Monto total de donaciones:</span>
                                            <h3 class="card-title text-nowrap mb-1">S/<%= request.getAttribute("montoTotalDonaciones") != null ? request.getAttribute("montoTotalDonaciones") : "1,000,000" %></h3>
                                            <small class="text-success fw-medium">
                                                <i class='bx bx-up-arrow-alt'></i> +S/<%= request.getAttribute("montoHoy") != null ? request.getAttribute("montoHoy") : "20,000" %> (Hoy)
                                            </small>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="col-xl-6 col-12 col-md-8 col-lg-4 order-3 order-md-2">
                            <div class="row">
                                <div class="col-xl-6 col-5 mb-4">
                                    <div class="card" style="min-height: 190px;">
                                        <div class="card-body">
                                            <span class="d-block mb-1">Albergues registrados</span>
                                            <h3 class="card-title text-nowrap mb-2">${alberguesRegistrados}</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-7 mb-4">
                                    <div class="card" style="min-height: 190px;">
                                        <div class="card-body pb-2">
                                            <span class="d-block fw-medium mb-1">Total mascotas reportadas perdidas:</span>
                                            <h3 class="card-title mb-1">${totalMascotasPerdidas}</h3>
                                            <div id="revenue">
                                                <canvas id="myChart" style="width: 100%; height: 100px;"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xl-6 col-md-5 col-lg-4 col-xl-4 order-0 mb-4">
                            <div class="card h-100">
                                <div class="card-header d-flex align-items-center justify-content-between pb-0">
                                    <div class="card-title mb-0">
                                        <h5 class="m-0 me-2">Cantidad de mascotas encontradas por mes</h5>
                                        <p></p>
                                        <small class="text-muted">Últimos 4 meses:</small>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <div class="d-flex flex-column align-items-center gap-1">
                                            <h2 class="mb-2">Total: ${mascotasEncontradas.size()}</h2>
                                            <span>Mascotas encontradas</span>
                                        </div>
                                    </div>
                                    <ul class="p-0 m-0">
                                        <c:forEach var="mes" items="${mascotasEncontradas}">
                                            <li class="d-flex mb-4 pb-1">
                                                <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-primary">
                              <i class="fas fa-calendar-day" style="font-size: 36px; color: #4CAF50;"></i>
                            </span>
                                                </div>
                                                <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                    <div class="me-2">
                                                        <h6 class="mb-0">${mes.nombre}</h6>
                                                    </div>
                                                    <div class="user-progress">
                                                        <small class="fw-medium">${mes.total}</small>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    const ctx = document.getElementById('myChart').getContext('2d');
    const data = {
        labels: ['SEP', 'AGO', 'JUL', 'JUN'],
        datasets: [{
            data: [40, 35, 30, 28], // Valores dinámicos
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
            tooltip: { callbacks: { label: function(tooltipItem) { return 'Valor: ' + tooltipItem.raw; }}},
            legend: { display: false }
        }
    };

    const myChart = new Chart(ctx, {
        type: 'bar',
        data: data,
        options: options
    });
</script>

<!-- build:js assets/vendor/js/core.js -->
<script src="<%= request.getContextPath() %>/assets/vendor/libs/jquery/jquery.js"></script>
<script src="<%= request.getContextPath() %>/assets/vendor/libs/popper/popper.js"></script>
<script src="<%= request.getContextPath() %>/assets/vendor/js/bootstrap.js"></script>
<script src="<%= request.getContextPath() %>/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="<%= request.getContextPath() %>/assets/vendor/libs/hammer/hammer.js"></script>
<script src="<%= request.getContextPath() %>/assets/vendor/libs/i18n/i18n.js"></script>
<script src="<%= request.getContextPath() %>/assets/vendor/libs/typeahead-js/typeahead.js"></script>
<script src="<%= request.getContextPath() %>/assets/vendor/js/menu.js"></script>

<!-- endbuild -->

<!-- Vendors JS -->
<script src="<%= request.getContextPath() %>/assets/vendor/libs/apex-charts/apexcharts.js"></script>

<!-- Main JS -->
<script src="<%= request.getContextPath() %>/assets/js/main.js"></script>

<script src="<%= request.getContextPath() %>/assets/js/dashboards-analytics.js"></script>
<!-- Page JS -->

<script>
    const ctxDonantes = document.getElementById('donantesChart').getContext('2d');
    const donantesChart = new Chart(ctxDonantes, {
        type: 'line',
        data: {
            labels: ['Junio', 'Julio', 'Agosto', 'Septiembre'],
            datasets: [{
                label: 'Número de Donantes',
                data: [300, 250, 320, 400], // Valores dinámicos
                borderColor: 'rgba(75, 192, 192, 1)',
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                fill: true,
                tension: 0.3,
                pointRadius: 4,
                pointHoverRadius: 6,
                borderWidth: 2
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: { display: false },
                tooltip: { callbacks: { label: function(context) { return `Donantes: ${context.raw}`; }}}
            },
            scales: {
                y: { beginAtZero: true, ticks: { display: true }, title: { display: false } },
                x: { ticks: { display: true } }
            }
        }
    });
</script>

<script>
    window.addEventListener('resize', function() {
        donantesChart.resize();  // Redimensiona el gráfico de donantes
        myChart.resize();  // Redimensiona el gráfico de mascotas perdidas
    });
</script>
</body>
</html>
