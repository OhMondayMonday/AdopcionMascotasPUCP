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
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Mis Solicitudes de Temporal</title>


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
<body style="background-color: #d4e1ffa9;">

    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>

    <div class="layout-wrapper layout-content-navbar  ">
        <div class="layout-container">
            <!-- Menu -->

            <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">


                <div class="app-brand demo px-3">
                    <a href="javascript:void(0);" class="app-brand-link">
                      <span class="app-brand-logo demo">
                        <img class = "h-px-50 tf-icon" src="${pageContext.request.contextPath}/assets/img/logo_Alianza_Animal_-removebg-preview.png" alt="logo">
                      </span>
                    </a>

                    <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto">
                        <i class="bx bx-chevron-left bx-sm align-middle"></i>
                    </a>
                </div>

                <div class="menu-inner-shadow"></div>

                    <ul class="menu-inner py-1">

                        <li class="menu-item">
                            <a href="${pageContext.request.contextPath}/UsuarioServlet?action=home" class="menu-link">

                            <i class="menu-icon tf-icons bx bx-home"></i>
                                <div class="text-truncate" data-i18n="Inicio">Inicio</div>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="ver-publicaciones-usuario.html"  class="menu-link">
                                <i class="menu-icon tf-icons bx bx-building-house"></i>
                                <div class="text-truncate" data-i18n="Publicaciones">Publicaciones</div>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="ver-eventos-usuario.html"  class="menu-link">
                                <i class="menu-icon tf-icons bx bx-calendar-event"></i>
                                <div class="text-truncate" data-i18n="Eventos">Eventos</div>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="postular-hogarestemporales.html"  class="menu-link">
                                <i class="menu-icon tf-icons bx bx-building-house"></i>
                                <div class="text-truncate" data-i18n="Hogares temporales">Hogares temporales</div>
                            </a>
                        </li>
                        <!-- Gestion -->
                        <li class="menu-header small text-uppercase">
                            <span class="menu-header-text" data-i18n="Gestion">Gestion</span>
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
                        <li class="menu-header small text-uppercase"><span class="menu-header-text" data-i18n="Otros">Otros</span></li>
                        <li class="menu-item">
                            <a href="Preguntas-frecuentes.html"  class="menu-link">
                                <i class="menu-icon tf-icons bx bx-help-circle"></i>
                                <div class="text-truncate" data-i18n="Preguntas frecuentes">Preguntas frecuentes</div>
                            </a>
                        </li>
                    </ul>



            </aside>

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
                            <span class="text-body" style="margin-left: 10px; margin-right: 2px; font-weight: bold;">¡Hola, Adolfo!</span>

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
                            <%
                                // Recuperar los objetos desde la solicitud
                                Usuarios usuario = (Usuarios) request.getAttribute("usuario");
                                List<Solicitudes> solicitudesMascotas = (List<Solicitudes>) request.getAttribute("solicitudesMascotas");

                            %>
                            <!-- User Sidebar -->
                            <div class="col-xl-4 col-lg-5 col-md-5 order-1 order-md-0">
                                <!-- User Card -->
                                <div class="card">
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
                                                    <h5 class="mb-0"><%= usuario.getAnimalesAlbergados() %></h5> <!-- Número de mascotas -->
                                                    <span>Mascotas</span>
                                                </div>
                                            </div>
                                        </div>

                                        <h5 class="pb-2 border-bottom mb-4">Detalles</h5>
                                        <div class="info-container">
                                            <ul class="list-unstyled">
                                                <li class="mb-3">
                                                    <span class="fw-medium me-2">Nombre de usuario:</span>
                                                    <span><%= usuario.getUsername() %></span>
                                                </li>
                                                <li class="mb-3">
                                                    <span class="fw-medium me-2">Correo:</span>
                                                    <span><%= usuario.getEmail() %></span>
                                                </li>
                                                <li class="mb-3">
                                                    <span class="fw-medium me-2">Estado:</span>
                                                    <span class="badge bg-label-success"><%= usuario.getEstadoCuenta() %></span>
                                                </li>
                                                <li class="mb-3">
                                                    <span class="fw-medium me-2">Rol:</span>
                                                    <span><%= usuario.getRol().getNombreRol() %></span>
                                                </li>
                                                <li class="mb-3">
                                                    <span class="fw-medium me-2">ID:</span>
                                                    <span><%= usuario.getUserId() %></span>
                                                </li>
                                                <li class="mb-3">
                                                    <span class="fw-medium me-2">Contacto:</span>
                                                    <span><%= usuario.getNumeroContactoDonaciones() %></span>
                                                </li>
                                                <li class="mb-3">
                                                    <span class="fw-medium me-2">Distrito:</span>
                                                    <span><%= usuario.getDistrito().getNombreDistrito() %></span>
                                                </li>
                                            </ul>
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
                            <div class="col-xl-8 col-lg-7 col-md-7 order-0 order-md-1">
                                <!-- User Pills -->
                                <ul class="nav nav-pills flex-column flex-md-row mb-3">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="usuario-mi-hogar-temporal.html">
                                            <i class="fas fa-file-alt me-1"></i> Solicitudes
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="usuario-mi-hogar-temporal-registro.html">
                                            <i class="fas fa-history me-1"></i> Historial
                                        </a>
                                    </li>
                                </ul>
                                <!-- /User Pills -->

                                <!-- Project table -->
                                <div class="card mb-4">
                                    <h5 class="card-header">Lista de solicitudes</h5>
                                    <div class="table-responsive mb-3">
                                        <table class="table datatable-project border-top">
                                            <thead>
                                            <tr>
                                                <th>Nombre</th>
                                                <th>Descripcion</th>
                                                <th>Edad</th>
                                                <th>Raza</th>
                                                <th>Fecha</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <%
                                                // Verificar si hay solicitudes

                                                if (solicitudesMascotas != null && !solicitudesMascotas.isEmpty()) {
                                                    for (Solicitudes solicitud : solicitudesMascotas) {
                                            %>
                                            <tr>
                                                <td><%= solicitud.getMascota().getNombre() %></td>
                                                <td><%= solicitud.getMascota().getDescripcion() %></td>
                                                <td><%= solicitud.getMascota().getEdadAproximada() %></td>
                                                <td><%= solicitud.getMascota().getRaza() != null ? solicitud.getMascota().getRaza().getNombreRaza() : "Sin raza" %></td>
                                                <td><%= solicitud.getFechaSolicitud() != null ? solicitud.getFechaSolicitud() : "Sin fecha" %></td>
                                            </tr>
                                            <%
                                                }
                                            } else {
                                            %>
                                            <tr>
                                                <td colspan="5">No hay solicitudes disponibles.</td>
                                            </tr>
                                            <% } %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- /Project table -->
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

</body>
</html>
