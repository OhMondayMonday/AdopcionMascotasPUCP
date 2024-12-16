<%--
  Created by IntelliJ IDEA.
  User: Luis Joaquin Pozo
  Date: 10/11/2024
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Daos.MiHogarTemporalDAO" %>
<%@ page import="Beans.Mascotas" %>
<%@ page import="Beans.Solicitudes" %>
<%@ page import="Beans.Razas" %>
<%@ page import="Beans.Usuarios" %>
<%@ page import="Beans.Roles" %>
<%@ page import="Beans.Distritos" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Mi Hogar Temporal</title>


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
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/logo_Alianza_Animal_-removebg-preview.png" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&amp;display=swap" rel="stylesheet">

    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>

    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">

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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-bs5/datatables.bootstrap5.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-buttons-bs5/buttons.bootstrap5.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/animate-css/animate.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/form-validation.css" />
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
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>


        /* Reducción de tamaño de las tarjetas */
        .card {
            display: flex;
            flex-direction: column;
            height: auto; /* Altura dinámica */
            height: 500px; /* Mantener un tamaño mínimo */
        }

        .card-body {
            flex: 1; /* Ocupa todo el espacio restante */
            overflow: hidden; /* Evitar scroll no deseado */
        }

        .user-avatar-section img {
            height: 80px; /* Reducción de la imagen de avatar */
            width: 80px;
        }

        .user-info h4 {
            font-size: 18px; /* Reducir tamaño del texto */
            margin-bottom: 5px;
        }

        /* Ajustar el tamaño de la lista de solicitudes */



    </style>
    <style>
        /* Ajusta el campo de búsqueda */
        #solicitudesTable_filter {
            display: flex;
            justify-content: flex-start; /* Alinea el campo de búsqueda a la izquierda */
            margin-bottom: 10px; /* Espacio adicional si es necesario */
            margin-right: 20px; /* Ajusta el margen derecho para separarlo del borde */
        }

        #solicitudesTable_filter label {
            display: flex;
            align-items: center; /* Centra el texto "Buscar" verticalmente */
            gap: 10px; /* Espacio entre la etiqueta y el input */
        }

        #solicitudesTable_filter input {
            padding: 5px 10px; /* Ajusta el espacio interno del campo */
            border-radius: 5px; /* Bordes redondeados */
            border: 1px solid #ddd; /* Borde ligero */
        }

        #solicitudesTable_filter {
            margin-bottom: 15px; /* Separación hacia abajo */
            margin-top: 15px; /* Separación hacia arriba */
        }

        /* Eliminar scroll innecesario */
        body, html {
            overflow-x: hidden; /* Evita el scroll horizontal */
            margin: 0;
            padding: 0;
        }

    </style>

    <style>
        /* Corrige el ancho del contenedor de paginación */
        .col-md-4, .col-sm-12 {
            flex: 0 0 100% !important; /* Ajusta el ancho al 100% */
            max-width: 100% !important;
        }

        /* Centra la paginación */
        #solicitudesTable_paginate {
            display: flex;
            justify-content: center !important;
            margin-top: 20px; /* Ajusta la separación superior */
        }
    </style>

    <style>
        @keyframes fadeOut {
            from {
                opacity: 1;
                transform: scale(1);
            }
            to {
                opacity: 0;
                transform: scale(0.95);
            }
        }

        .fade-out {
            animation: fadeOut 0.5s forwards;
        }
    </style>
</head>
<body style="background-color: #d4e1ffa9;">

    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>

    <div class="layout-wrapper layout-content-navbar  ">
        <%
            // Recuperar los objetos desde la solicitud
            Usuarios usuario = (Usuarios) request.getAttribute("usuario");
            List<Solicitudes> solicitudesMascotas = (List<Solicitudes>) request.getAttribute("solicitudesMascotas");

        %>
        <div class="layout-container">
            <!-- Menu -->

            <jsp:include page="/WEB-INF/includes/sidebarUF.jsp" />

            <div class="layout-page">
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
                                <p class="mb-0 fst-normal fw-semibold ff-"><span class="text-muted">Usuario / Mi hogar temporal / </span>Solicitudes</p>
                              </span>
                            </div>
                        </div>

                        <ul class="navbar-nav flex-row align-items-center ms-0">

                            <!-- Notification -->
                            <span class="text-body" style="margin-left: 10px; margin-right: 2px; font-weight: bold;">¡Hola, <%= usuario.getNombre() %>!</span>

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
                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/ver-miperfil-usuario-detalles.html">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0 me-3">
                                                    <div class="avatar avatar-online">
                                                        <img src="https://img.freepik.com/vector-gratis/diseno-plantilla-imagen-perfil_742173-22027.jpg?t=st=1726637844~exp=1726641444~hmac=f81927ff296e19d666bcbbd27413900024f764855e07caa5d1a64d3e3d1c4f9d&w=826" alt class="w-px-40 h-auto rounded-circle">
                                                    </div>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <span class="fw-medium d-block"> Adolfo Contreras</span>
                                                    <small class="text-muted">Usuario</small>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <div class="dropdown-divider"></div>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/ver-miperfil-usuario-seguridad.html">
                                            <i class="bx bx-lock me-2" style="color: #1f4397;"></i>
                                            <span class="align-middle" style="color: #1f4397;">Seguridad</span>
                                        </a>
                                    </li>


                                    <li>
                                        <div class="dropdown-divider"></div>
                                    </li>
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
                                    <li>
                                        <div class="dropdown-divider"></div>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/Preguntas-frecuentes.html">
                                            <i class="bx bx-help-circle"></i>
                                            <span class="align-middle">Preguntas frecuentes</span>
                                        </a>
                                    </li>
                                    <li>
                                        <div class="dropdown-divider"></div>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="../index.html" >
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
                <!-- / Navbar -->



                <!-- Content wrapper -->
                <div class="content-wrapper">

                    <!-- Content -->

                    <div class="container-xxl flex-grow-1 container-p-y">

                        <div class="row">

                            <!-- User Sidebar -->
                            <div class="col-md-5 mb-4 d-flex">
                                <!-- User Card -->
                                <div class="card flex-grow-1 h-100">
                                    <div class="card-body">
                                        <%

                                            // Verificar si los objetos no son nulos
                                            if (usuario != null && solicitudesMascotas != null) {
                                        %>
                                        <div class="user-avatar-section">
                                            <div class="d-flex align-items-center flex-column">
                                                <!-- Mostrar foto de perfil del usuario -->
                                                <img class="img-fluid rounded my-4" src="<%= usuario.getFoto().getUrlFoto() %>" height="110" width="110" alt="User avatar" />
                                                <div class="user-info text-center">
                                                    <!-- Mostrar el nombre y rol del usuario -->
                                                    <h4 class="mb-2" style="color: #1f4397;"><%= usuario.getNombre() + " " + usuario.getApellido() %></h4>
                                                    <span class="badge bg-label-info"><%= usuario.getRol().getNombreRol() %></span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="d-flex justify-content-around flex-wrap my-4 py-3">
                                            <!-- Mostrar el número de solicitudes del usuario -->
                                            <div class="d-flex align-items-start me-4 mt-3 gap-3">
                                                <span class="badge bg-label-primary p-2 rounded"><i class='bx bx-check bx-sm'></i></span>
                                                <div>
                                                    <h5 class="mb-0"><%= solicitudesMascotas.size() %></h5> <!-- Número de solicitudes -->
                                                    <span>Solicitudes</span>
                                                </div>
                                            </div>

                                            <!-- Mostrar el número de mascotas asociadas al usuario -->
                                            <div class="d-flex align-items-start mt-3 gap-3">
                                                <span class="badge bg-label-primary p-2 rounded"><i class='bx bx-customize bx-sm'></i></span>
                                                <div>
                                                    <h5 class="mb-0"><%= usuario.getHogarTemporal().getCantidadMascotas() %></h5> <!-- Número de mascotas -->
                                                    <span>Mascotas</span>
                                                </div>
                                            </div>
                                        </div>

                                        <h5 class="pb-2 border-bottom mb-4">Detalles</h5>
                                        <div class="row">
                                            <div class="col-6 mb-2">
                                                <span class="fw-medium">Nombre de usuario:</span>
                                                <p class="mb-0 text-muted"><%= usuario.getUsername() %></p>
                                            </div>
                                            <div class="col-6 mb-2">
                                                <span class="fw-medium">Correo:</span>
                                                <p class="mb-0 text-muted"><%= usuario.getEmail() %></p>
                                            </div>
                                            <div class="col-6 mb-2">
                                                <span class="fw-medium">Estado:</span>
                                                <p class="mb-0"><span class="badge bg-success"><%= usuario.getEstadoCuenta() %></span></p>
                                            </div>
                                            <div class="col-6 mb-2">
                                                <span class="fw-medium">Rol:</span>
                                                <p class="mb-0 text-muted"><%= usuario.getRol().getNombreRol() %></p>
                                            </div>
                                            <div class="col-6 mb-2">
                                                <span class="fw-medium">Distrito:</span>
                                                <p class="mb-0 text-muted"><%= usuario.getDistrito().getNombreDistrito() %></p>
                                            </div>
                                            <div class="col-6 mb-2">
                                                <span class="fw-medium">Contacto:</span>
                                                <p class="mb-0 text-muted"><%= usuario.getHogarTemporal().getCelular() %></p>
                                            </div>
                                        </div>

                                        <% } else { %>
                                        <p>No se encontraron los datos del usuario o solicitudes.</p>
                                        <% } %>
                                    </div>
                                </div>
                                <!-- /User Card -->
                            </div>
                            <!--/ User Sidebar -->

                            <!-- User Content -->
                            <div class="col-md-7 mb-4 d-flex">
                                <div class="card flex-grow-1 h-100">
                                    <div class="card-header d-flex justify-content-between align-items-center">
                                        <h5 class="mb-0">Lista de solicitudes</h5>
                                    </div>
                                    <div class="card-body p-0">
                                        <div class="table-responsive">
                                            <%
                                                Boolean mostrarAviso = (Boolean) request.getAttribute("mostrarAviso");
                                            %>
                                            <% if (mostrarAviso == null || !mostrarAviso) { %>
                                            <table id="solicitudesTable" class="table table-hover mb-0">
                                                <thead class="bg-light">
                                                <tr>
                                                    <th>Nombre</th>
                                                    <th>Descripción</th>
                                                    <th>Edad</th>
                                                    <th>Raza</th>
                                                    <th class="text-center">Acciones</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <%
                                                    if (solicitudesMascotas != null && !solicitudesMascotas.isEmpty()) {
                                                        for (Solicitudes solicitud : solicitudesMascotas) {
                                                %>
                                                <tr id="solicitud-<%= solicitud.getSolicitudId() %>">
                                                    <td><%= solicitud.getMascota().getNombre() %></td>
                                                    <td><%= solicitud.getMascota().getDescripcion() %></td>
                                                    <td><%= solicitud.getMascota().getEdadAproximada() %></td>
                                                    <td><%= solicitud.getMascota().getRaza() != null ? solicitud.getMascota().getRaza().getNombreRaza() : "Sin raza" %></td>
                                                    <td class="text-center">
                                                        <!-- Botón Aceptar -->
                                                        <!-- Botón Aceptar -->
                                                        <button class="btn btn-sm btn-success" title="Aceptar"
                                                                onclick="confirmarAccion('Aceptar', '<%= solicitud.getSolicitudId() %>', '<%= usuario.getHogarTemporal().getTemporalId() %>')">
                                                            <i class="bx bx-check"></i>
                                                        </button>

                                                        <!-- Botón Rechazar -->
                                                        <button class="btn btn-sm btn-danger" title="Rechazar"
                                                                onclick="confirmarAccion('Rechazar', '<%= solicitud.getSolicitudId() %>')">
                                                            <i class="bx bx-x"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                                <%
                                                    }
                                                } else {
                                                %>
                                                <tr>
                                                    <td colspan="5" class="text-center">No hay solicitudes disponibles.</td>
                                                </tr>
                                                <% }} %>
                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                    <div class="px-3 py-2" style="text-align: center; padding: 0;">
                                        <!-- Aquí se centra la paginación -->
                                        <div id="solicitudesTable_paginate" style="display: inline-block;"></div>
                                    </div>
                                </div>
                            </div>
                            <!--/ User Content -->
                        </div>



                    </div>
                    <!-- / Content -->

                    <!-- Footer -->
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
                    <!-- / Footer -->




                    <div class="content-backdrop fade"></div>
                </div>
                <!-- Content wrapper -->
            </div>
            <!-- / Layout page -->
        </div>



        <!-- Overlay -->
        <div class="layout-overlay layout-menu-toggle"></div>


        <!-- Drag Target Area To SlideIn Menu On Small Screens -->
        <div class="drag-target"></div>

    </div>

    <script src="${pageContext.request.contextPath}/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/libs/popper/popper.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/libs/hammer/hammer.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/libs/i18n/i18n.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/js/menu.js"></script>

    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="${pageContext.request.contextPath}/assets/vendor/libs/moment/moment.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/libs/apex-charts/apexcharts.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/libs/cleavejs/cleave.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/libs/cleavejs/cleave-phone.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/libs/@form-validation/popular.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/libs/@form-validation/bootstrap5.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/libs/@form-validation/auto-focus.js"></script>

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>


    <!-- Page JS -->
    <script src="${pageContext.request.contextPath}/assets/js/modal-edit-user.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/app-user-view.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/app-academy-dashboard.js"></script>
    <!-- Titulos tabla -->
    <script src="${pageContext.request.contextPath}/assets/js/app-user-view-account.js"></script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            if (document.getElementById("solicitudesTable")) {
                $('#solicitudesTable').DataTable({
                    "paging": true,
                    "lengthChange": false,
                    "pageLength": 6,
                    "info": false,
                    "language": {
                        "paginate": {
                            "previous": "Anterior",
                            "next": "Siguiente"
                        },
                        "emptyTable": "No hay solicitudes disponibles",
                        "search": "Buscar:"
                    },
                    "columnDefs": [
                        { "orderable": false, "targets": 4 }
                    ]
                });
            }
        });
    </script>
    <script>
        function confirmarAccion(accion, solicitudId, hogarTemporalId) {
            let mensaje = accion === 'Aceptar'
                ? "¿Estás seguro de aceptar esta mascota?"
                : "¿Estás seguro de eliminar esta solicitud?";

            Swal.fire({
                title: mensaje,
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: accion === 'Aceptar' ? "#28a745" : "#d33", // Verde para aceptar, rojo para rechazar
                cancelButtonColor: "#3085d6",
                confirmButtonText: accion === 'Aceptar' ? "Aceptar" : "Eliminar",
                cancelButtonText: "Cancelar",
            }).then((result) => {
                if (result.isConfirmed) {
                    let form = document.createElement("form");
                    form.method = "POST";
                    form.action = "UsuarioServlet";

                    let actionInput = document.createElement("input");
                    actionInput.type = "hidden";
                    actionInput.name = "action";
                    actionInput.value = accion === 'Aceptar' ? "aceptarMascota" : "rechazarMascota";
                    form.appendChild(actionInput);

                    let solicitudInput = document.createElement("input");
                    solicitudInput.type = "hidden";
                    solicitudInput.name = "solicitudId";
                    solicitudInput.value = solicitudId;
                    form.appendChild(solicitudInput);

                    if (accion === 'Aceptar') {
                        let hogarInput = document.createElement("input");
                        hogarInput.type = "hidden";
                        hogarInput.name = "hogarTemporalId";
                        hogarInput.value = hogarTemporalId;
                        form.appendChild(hogarInput);
                    }

                    document.body.appendChild(form);
                    form.submit();
                }
            });
        }
    </script>

    <script>
        <% if (mostrarAviso != null && mostrarAviso) { %>
        window.onload = function () {
            Swal.fire({
                title: 'Acceso restringido',
                text: 'Para ver solicitudes, primero debes postular como hogar temporal.',
                icon: 'warning',
                confirmButtonText: 'Postular ahora',
                allowOutsideClick: false
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = 'UsuarioServlet?action=postularHogarTemporal'; // Redirige a postulación
                }
            });
        }
        <% } %>
    </script>
</body>
</html>
