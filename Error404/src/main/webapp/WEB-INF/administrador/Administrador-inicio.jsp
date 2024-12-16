<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.stream.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList, java.util.Map" %>


<%
    // Obtener los datos del Servlet con validaciones seguras
    String nombreAdministrador = (String) request.getAttribute("nombreAdministrador");
    String fotoPerfil = (String) request.getAttribute("fotoPerfil");
    double montoTotalDonaciones = (double) request.getAttribute("montoTotalDonaciones");
    double montoTotalDonacionesHoy = (double) request.getAttribute("montoTotalDonacionesHoy");  // Nuevo valor
    int alberguesRegistrados = (int) request.getAttribute("alberguesRegistrados");
    int alberguesRegistradosHoy = (int) request.getAttribute("alberguesRegistradosHoy");
    int totalMascotasPerdidas = (int) request.getAttribute("totalMascotasPerdidas");
    int totalMascotasEncontradas = request.getAttribute("totalMascotasEncontradas") != null ? (int) request.getAttribute("totalMascotasEncontradas") : 0;

    // Obtener listas, con verificación para evitar errores si son null
    List<Map<String, Object>> mascotasEncontradas = (List<Map<String, Object>>) request.getAttribute("mascotasEncontradas");
    mascotasEncontradas = mascotasEncontradas != null ? mascotasEncontradas : java.util.Collections.emptyList();

    List<Map<String, Object>> usuariosMasDonaciones = (List<Map<String, Object>>) request.getAttribute("usuariosMasDonaciones");
    usuariosMasDonaciones = usuariosMasDonaciones != null ? usuariosMasDonaciones : java.util.Collections.emptyList();

    List<Map<String, Object>> alberguesMasDonaciones = (List<Map<String, Object>>) request.getAttribute("alberguesMasDonaciones");
    alberguesMasDonaciones = alberguesMasDonaciones != null ? alberguesMasDonaciones : java.util.Collections.emptyList();

    List<Map<String, String>> ultimasActualizaciones = (List<Map<String, String>>) request.getAttribute("ultimasActualizaciones");
    ultimasActualizaciones = ultimasActualizaciones != null ? ultimasActualizaciones : java.util.Collections.emptyList();

    List<Map<String, Object>> mascotasPorMes = (List<Map<String, Object>>) request.getAttribute("mascotasPorMes");
    mascotasPorMes = (mascotasPorMes != null) ? mascotasPorMes : java.util.Collections.emptyList();

    List<Map<String, Object>> mascotasPorMez = (List<Map<String, Object>>) request.getAttribute("mascotasPorMez");
    mascotasPorMez = (mascotasPorMez != null) ? mascotasPorMez : java.util.Collections.emptyList();

    // Nuevos datos del servlet
    List<Map<String, Object>> donantesConMasDonaciones = (List<Map<String, Object>>) request.getAttribute("donantesConMasDonaciones");
    donantesConMasDonaciones = donantesConMasDonaciones != null ? donantesConMasDonaciones : java.util.Collections.emptyList();

    List<Map<String, Object>> alberguesConMasDonaciones = (List<Map<String, Object>>) request.getAttribute("alberguesConMasDonaciones");
    alberguesConMasDonaciones = alberguesConMasDonaciones != null ? alberguesConMasDonaciones : java.util.Collections.emptyList();

    int totalDonantes = (Integer) request.getAttribute("totalDonantes");

    List<Map<String, Object>> donantesUltimosMeses = (List<Map<String, Object>>) request.getAttribute("donantesUltimosMeses");
    donantesUltimosMeses = (donantesUltimosMeses != null) ? donantesUltimosMeses : java.util.Collections.emptyList();

    // Rellenar los datos de los meses y los donantes
    List<String> meses = new ArrayList<>();
    List<Integer> donantes = new ArrayList<>();
    for (Map<String, Object> donante : donantesUltimosMeses) {
        meses.add((String) donante.get("mes"));
        donantes.add((Integer) donante.get("total"));
    }
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

<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>

<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">

        <jsp:include page="/WEB-INF/includes/sidebarAdmin.jsp" />

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
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/WEB-INF/index.jsp">
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
                                            <span class="d-block fw-medium mb-1">Número total de donantes:</span>
                                            <h3 class="card-title mb-1">
                                                <!-- Mostrar total de donantes usando JSTL -->
                                                <c:out value="${totalDonantes}" />
                                            </h3>
                                            <div class="chart-container-especifico" style="height: 100px;">
                                                <!-- Gráfico de donantes -->
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
                                                    <img src="<%= request.getContextPath() %>/assets/img/soles.png" alt="soles" style="width: 36px; height: 36px;">
                                                </div>
                                                <div class="dropdown"></div>
                                            </div>
                                            <span>Monto total de donaciones:</span>
                                            <h3 class="card-title text-nowrap mb-1">S/<%= request.getAttribute("montoTotalDonaciones") != null ? request.getAttribute("montoTotalDonaciones") : "0" %></h3>
                                            <small class="text-success fw-medium">
                                                <i class='bx bx-up-arrow-alt'></i> +S/<%= request.getAttribute("montoTotalDonacionesHoy") != null ? request.getAttribute("montoTotalDonacionesHoy") : "0" %> (Hoy)
                                            </small>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="col-xl-6 col-12 col-md-8 col-lg-4 order-3 order-md-2">
                            <div class="row">
                                <!-- Card de Albergues Registrados -->
                                <div class="col-xl-6 col-5 mb-4">
                                    <div class="card" style="min-height: 190px;">
                                        <div class="card-body">
                                            <div class="card-title d-flex align-items-start justify-content-between">
                                                <div class="avatar flex-shrink-0">
                                                    <!-- Icono de la casa verde -->
                                                    <i class="fas fa-home" style="font-size: 36px; color: #4CAF50;"></i> <!-- Albergues Registrados -->
                                                </div>
                                            </div>
                                            <span class="d-block mb-1">Albergues registrados</span>
                                            <!-- Cargar dinámicamente el número de albergues registrados -->
                                            <h3 class="card-title text-nowrap mb-2">${alberguesRegistrados}</h3>
                                            <small class="text-success fw-medium">
                                                <i class='bx bx-up-arrow-alt'></i> +${alberguesRegistradosHoy != null ? alberguesRegistradosHoy : 0} (Hoy)
                                            </small>
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


                        <div class="col-md-6 order-3 order-lg-4 mb-4 mb-lg-0">
                            <div class="card text-center">
                                <div class="card-header py-3">
                                    <ul class="nav nav-pills" role="tablist">
                                        <li class="nav-item">
                                            <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-browser" aria-controls="navs-pills-browser" aria-selected="true">Usuarios con más donaciones</button>
                                        </li>
                                        <li class="nav-item">
                                            <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-os" aria-controls="navs-pills-os" aria-selected="false">Albergues con más donaciones</button>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tab-content pt-0">
                                    <!-- Usuarios con más donaciones -->
                                    <div class="tab-pane fade show active" id="navs-pills-browser" role="tabpanel">
                                        <div class="table-responsive text-start">
                                            <table class="table table-borderless text-nowrap">
                                                <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Nombre</th>
                                                    <th>Donado</th>
                                                    <th class="w-50">Porcentaje del total</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <% int no = 1; %> <!-- Declaramos no para los usuarios -->
                                                <% for (Map<String, Object> donante : donantesConMasDonaciones) { %>
                                                <tr>
                                                    <td><%= no++ %></td>
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                                            <img src="<%= donante.get("foto_url") %>" alt="Avatar" height="24" class="me-2">
                                                            <span><%= donante.get("nombre") %></span>
                                                        </div>
                                                    </td>
                                                    <td>S/ <%= donante.get("total_donado") %></td> <!-- Símbolo de soles -->
                                                    <td>
                                                        <div class="d-flex justify-content-between align-items-center gap-3">
                                                            <div class="progress w-100" style="height:10px;">
                                                                <div class="progress-bar" role="progressbar" style="width: <%= donante.get("porcentaje_total") %>%" aria-valuenow="<%= donante.get("porcentaje_total") %>" aria-valuemin="0" aria-valuemax="100"></div>
                                                            </div>
                                                            <small class="fw-medium"><%= donante.get("porcentaje_total") %>%</small>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <% } %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <!-- Albergues con más donaciones -->
                                    <div class="tab-pane fade" id="navs-pills-os" role="tabpanel">
                                        <div class="table-responsive text-start">
                                            <table class="table table-borderless text-nowrap">
                                                <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Nombre del Albergue</th>
                                                    <th>Donado</th>
                                                    <th class="w-50">Porcentaje del total</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <% int noAlbergue = 1; %> <!-- Declaramos noAlbergue para los albergues, comenzando desde el siguiente número -->
                                                <% for (Map<String, Object> albergue : alberguesConMasDonaciones) { %>
                                                <tr>
                                                    <td><%= noAlbergue++ %></td>
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                                            <img src="<%= albergue.get("foto_id") %>" alt="Albergue" height="24" class="me-2">
                                                            <span><%= albergue.get("nombre_albergue") %></span>
                                                        </div>
                                                    </td>
                                                    <td>S/ <%= albergue.get("total_donado") %></td> <!-- Símbolo de soles -->
                                                    <td>
                                                        <div class="d-flex justify-content-between align-items-center gap-3">
                                                            <div class="progress w-100" style="height:10px;">
                                                                <div class="progress-bar" role="progressbar" style="width: <%= albergue.get("porcentaje_total") %>%" aria-valuenow="<%= albergue.get("porcentaje_total") %>" aria-valuemin="0" aria-valuemax="100"></div>
                                                            </div>
                                                            <small class="fw-medium"><%= albergue.get("porcentaje_total") %>%</small>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <% } %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>











                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


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


<script>
    const ctxDonantes = document.getElementById('donantesChart').getContext('2d');
    const donantesChart = new Chart(ctxDonantes, {
        type: 'line',
        data: {
            labels: <%= new org.json.JSONArray(meses) %>, // Meses de los últimos 4 meses
            datasets: [{
                label: 'Número de Donantes',
                data: <%= new org.json.JSONArray(donantes) %>, // Total de donantes por mes
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
    });
</script>



</body>
</html>
