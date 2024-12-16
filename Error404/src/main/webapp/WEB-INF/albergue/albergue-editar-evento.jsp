<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="es" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="../../assets/" data-template="vertical-menu-template-semi-dark">


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:06 GMT -->
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Editar Evento</title>


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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/bs-stepper/bs-stepper.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/bootstrap-select/bootstrap-select.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/form-validation.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/quill/typography.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/quill/katex.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/quill/editor.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/dropzone/dropzone.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/flatpickr/flatpickr.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/bootstrap-datepicker/bootstrap-datepicker.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/bootstrap-daterangepicker/bootstrap-daterangepicker.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/tagify/tagify.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/jquery-timepicker/jquery-timepicker.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/pickr/pickr-themes.css" />

    <!-- Page CSS -->


    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>

    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>

</head>

<body>


<!-- ?PROD Only: Google Tag Manager (noscript) (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar" style="background-color: #fff1ef;">
    <div class="layout-container">

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
                    <a href="albergue-ver-inicio.html" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-home"></i>
                        <div class="text-truncate" data-i18n="Inicio">Inicio</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="albergue-ver-publicaciones.html" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-building-house"></i>
                        <div class="text-truncate" data-i18n="Publicaciones">Publicaciones</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="albergue-ver-eventos.html" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-calendar-event"></i>
                        <div class="text-truncate" data-i18n="Eventos">Eventos</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="albergue-ver-hogarestemporales.html" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-building-house"></i>
                        <div class="text-truncate" data-i18n="Hogares temporales">Hogares temporales</div>
                    </a>
                </li>
                <!-- Gestion -->
                <li class="menu-header small text-uppercase">
                    <span class="menu-header-text" data-i18n="Gestion">Gestion</span>
                </li>
                <li class="menu-item">
                    <a href="albergue-ver-mispublicaciones.html" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-building-house"></i>
                        <div class="text-truncate" data-i18n="Mis publicaciones">Mis publicaciones</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="albergue-ver-miseventos.html" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-calendar-event"></i>
                        <div class="text-truncate" data-i18n="Mis eventos">Mis eventos</div>
                    </a>
                </li>

                <!-- Misc -->
                <li class="menu-header small text-uppercase"><span class="menu-header-text" data-i18n="Otros">Otros</span></li>
                <li class="menu-item">
                    <a href="albergue-preguntas-frecuentes.html" class="menu-link">
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
                <p class="mb-0 fst-normal fw-semibold ff-">Editar Evento </p>
              </span>
                        </div>
                    </div>

                    <ul class="navbar-nav flex-row align-items-center ms-0">
                        <span class="text-body" style="margin-left: 10px; margin-right: 2px; font-weight: bold;">Albergue Huellas</span>
                        <!-- User -->
                        <li class="nav-item navbar-dropdown dropdown-user dropdown">
                            <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                                <div class="avatar avatar-online">
                                    <img src="${pageContext.request.contextPath}/assets/img/huella.jpg" alt class="w-px-40 h-auto rounded-circle">
                                </div>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li>
                                    <a class="dropdown-item" href="albergue-ver-inicio.html">
                                        <div class="d-flex">
                                            <div class="flex-shrink-0 me-3">
                                                <div class="avatar avatar-online">
                                                    <img src="${pageContext.request.contextPath}/assets/img/huella.jpg" alt class="w-px-40 h-auto rounded-circle">
                                                </div>
                                            </div>
                                            <div class="flex-grow-1">
                                                <span class="fw-medium d-block"> Huellas </span>
                                                <small class="text-muted">Albergue</small>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="albergue-ver-miperfil-detalles.html">
                                        <i class="bx bx-user me-2"></i>
                                        <span class="align-middle">Mi perfil</span>
                                    </a>
                                </li>


                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="albergue-ver-mispublicaciones.html">
                                        <i class="bx bx-building-house"></i>
                                        <span class="align-middle">Mis publicaciones</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="albergue-ver-miseventos.html">
                                        <i class="bx bx-bone"></i>
                                        <span class="align-middle">Mis eventos</span>
                                    </a>
                                </li>
                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="../index.html">
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
                <div class="navbar-search-wrapper search-input-wrapper  d-none">
                    <input type="text" class="form-control search-input container-xxl border-0" placeholder="Search..." aria-label="Search...">
                    <i class="bx bx-x bx-sm search-toggler cursor-pointer"></i>
                </div>


            </nav>


            <!-- Content wrapper -->
            <div class="content-wrapper">

                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">

                    <!-- CREAR EVENTO -->
                    <div class="d-flex flex-wrap justify-content-between align-items-center mb-0">

                        <div class="d-flex flex-column justify-content-center">
                            <h4 class="mb-1 mt-3">Crear Evento</h4>
                            <p class="text-muted">Rellena los campos abajo</p>
                        </div>
                        <div class="d-flex align-content-center flex-wrap gap-3">
                            <button class="btn btn-danger">Descartar</button>
                        </div>

                    </div>
                    <div class="row">
                        <!-- Multistep -->
                        <div class="col-12 mb-2">
                            <div class="bs-stepper wizard-numbered mt-2">
                                <div class="bs-stepper-header">
                                    <div class="step" data-target="#datos-evento">
                                        <button type="button" class="step-trigger">
                                            <span class="bs-stepper-circle">1</span>
                                            <span class="bs-stepper-label mt-1">
                                              <span class="bs-stepper-title">Evento</span>
                                              <span class="bs-stepper-subtitle">Datos del Evento</span>
                                            </span>
                                        </button>
                                    </div>
                                    <div class="line">
                                        <i class="bx bx-chevron-right"></i>
                                    </div>
                                    <div class="step" data-target="#datos-albergue">
                                        <button type="button" class="step-trigger">
                                            <span class="bs-stepper-circle">2</span>
                                            <span class="bs-stepper-label mt-1">
                                              <span class="bs-stepper-title">Datos del Albergue</span>
                                              <span class="bs-stepper-subtitle">Añada información sobre el Albergue</span>
                                            </span>
                                        </button>
                                    </div>
                                </div>
                                <div class="bs-stepper-content">
                                    <!-- Formulario para crear evento -->
                                    <form action="EventosServlet?action=editarEvento" method="POST">
                                        <input type="hidden" name="event_id" value="${evento.eventId}">
                                        <!-- Detalles Evento -->
                                        <div id="datos-evento" class="content">
                                            <div class="content-header mb-3">
                                                <h6 class="mb-0">Evento</h6>
                                                <small>Ingrese datos del Evento</small>
                                            </div>

                                            <div class="row g-3">
                                                <div class="col-sm-6">
                                                    <label class="form-label" for="nombreEvento">Nombre del Evento</label>
                                                    <input type="text" id="nombreEvento" name="nombreEvento" class="form-control" value="${evento.nombreEvento}" placeholder="Nombre del evento" required>
                                                </div>
                                                <div class="col-sm-6">
                                                    <label class="form-label" for="fechaEvento">Fecha del Evento</label>
                                                    <input type="text" class="form-control" id="fechaEvento" name="fechaEvento" value="${evento.fechaEvento}" placeholder="AAAA-MM-DD">
                                                </div>

                                                <div class="col-sm-6">
                                                    <label class="form-label" for="direccionLugar">Dirección del lugar</label>
                                                    <input type="text" class="form-control" id="direccionLugar" value="${evento.lugarEvento.direccionLugar}" required name="direccionLugar" placeholder="Dirección del lugar">
                                                </div>
                                                <div class="col-sm-6">
                                                    <label for="tipoEventoId" class="form-label">Tipo de evento</label>

                                                    <select id="tipoEventoId" name="tipoEventoId" class="selectpicker w-100" data-style="btn-default">

                                                        <option value="" disabled>Seleccione un tipo de Evento</option>

                                                        <c:forEach var="tipo" items="${tiposEventos}">
                                                            <option value="${tipo.tipoEventoId}"
                                                                ${tipo.tipoEventoId == evento.tipoEvento.tipoEventoId ? 'selected' : ''}>
                                                                    ${tipo.nombreTipo}
                                                            </option>
                                                        </c:forEach>
                                                    </select>

                                                </div>

                                                <div class="col-12">
                                                    <label class="form-label" for="descripcionEvento">Descripcion</label>
                                                    <textarea class="form-control" id="descripcionEvento" name="descripcionEvento" rows="8" required placeholder="Ingrese una descripción detallada del evento">${evento.descripcionEvento}</textarea>
                                                </div>

                                                <div class="col-12 d-flex justify-content-between">
                                                    <button class="btn btn-label-secondary btn-prev" disabled>
                                                        <i class="bx bx-chevron-left bx-sm ms-sm-n2"></i>
                                                        <span class="align-middle d-sm-inline-block d-none">Anterior</span>
                                                    </button>
                                                    <a href="#datos-albergue" class="btn btn-primary btn-next">
                                                        <span class="align-middle d-sm-inline-block d-none me-sm-1">Siguiente</span>
                                                        <i class="bx bx-chevron-right bx-sm me-sm-n2"></i>
                                                    </a>
                                                </div>

                                            </div>

                                        </div>
                                        <!-- Personal Info -->
                                        <div id="datos-albergue" class="content">
                                            <div class="content-header mb-3">
                                                <h6 class="mb-0">Datos del Albergue</h6>
                                                <small>Ingrese datos sobre el Albergue</small>
                                            </div>

                                            <div class="row g-3">
                                                <div class="col-sm-6">
                                                    <label for="distritoId" class="form-label">Distrito</label>
                                                    <select id="distritoId" name="distritoId" class="selectpicker w-100" data-style="btn-default">
                                                        <option value="">Seleccione un distrito</option>
                                                        <c:forEach var="distrito" items="${distritos}">
                                                            <option value="${distrito.distritoId}"
                                                                    ${distrito.distritoId == evento.lugarEvento.distrito.distritoId ? 'selected' : ''}>
                                                                    ${distrito.nombreDistrito}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="col-sm-6">
                                                    <label class="form-label" for="aforo">Aforo</label>
                                                    <input type="number" required class="form-control" value="${evento.lugarEvento.aforoMaximo}" id="aforo" placeholder="Indique el Aforo" name="aforo">
                                                </div>
                                                <div class="col-sm-6">
                                                    <label class="form-label" for="entrada">Entrada</label>
                                                    <input type="text" class="form-control" id="entrada" name="entrada" value="${evento.entrada}" placeholder="Indique costo o requerimiento de la entrada">
                                                </div>
                                                <div class="col-sm-6">
                                                    <label class="form-label" for="artistasProveedores">Artistas Invitados</label>
                                                    <input type="text" class="form-control" id="artistasProveedores" name="artistasProveedores" value="${evento.artistasProveedores}" placeholder="Indique algún Artista Invitado">
                                                </div>
                                                <div class="col-12">
                                                    <label class="form-label" for="razonEvento">Razón</label>
                                                    <input type="text" class="form-control" id="razonEvento" value="${evento.razonEvento}" placeholder="Indique la Razón del Evento" name="razonEvento">
                                                </div>

                                                <div class="col-12 d-flex justify-content-between">
                                                    <a href="#datos-evento" class="btn btn-primary btn-prev">
                                                        <i class="bx bx-chevron-left bx-sm ms-sm-n2"></i>
                                                        <span class="align-middle d-sm-inline-block d-none">Anterior</span>
                                                    </a>
                                                    <button type="submit" class="btn btn-success btn-submit">Editar</button>
                                                </div>

                                            </div>

                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- /Default Wizard -->

                        <div class="col-12">
                            <!-- Media -->
                            <div class="card mb-1 mt-4">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h5 class="mb-0 card-title">Imagen</h5>
                                    <a href="javascript:void(0);" class="fw-medium">Añadir contenido desde un URL</a>
                                </div>
                                <div class="card-body">
                                    <form action="https://demos.themeselection.com/upload" class="dropzone" id="dropzone-basic">
                                        <div class="dz-message needsclick my-3">
                                            <p class="fs-3 note needsclick my-0">Arrastra una imagen</p>
                                            <p class="text-muted fs-4 note needsclick my-0">o</p>
                                            <p class="text-muted fs-4 note needsclick my-0">Examinar en el Dispositivo</p>

                                        </div>
                                        <div class="fallback">
                                            <input name="file" type="image" accept="image/*" alt=""/>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>


            <!-- Footer -->
            <footer class="footer">
                <div class="container-fluid d-flex flex-md-row flex-column justify-content-between align-items-md-center gap-1 container-p-x py-3">
                    <div>
                        <a href="javascript:void(0)" class="footer-link me-4 text-muted">©2024 Alianza Animal S.A. Todos los derechos reservados.</a>

                    </div>
                    <div>
                        <a href="javascript:void(0)" class="footer-link me-4 text-muted">Ayuda</a>
                        <a href="javascript:void(0)" class="footer-link me-4 text-muted">Contactos</a>
                        <a href="javascript:void(0)" class="footer-link text-muted">Terminos &amp; Condiciones</a>
                    </div>
                </div>
            </footer>
            <!-- / Footer -->

        </div>

    </div>
    <!-- / Layout wrapper -->
    <!-- / Layout page -->
</div>

<!-- /Layout wrapper -->

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
<script src="${pageContext.request.contextPath}/assets/vendor/libs/bootstrap-datepicker/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/bootstrap-daterangepicker/bootstrap-daterangepicker.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/bs-stepper/bs-stepper.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/bootstrap-select/bootstrap-select.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/popular.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/bootstrap5.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/auto-focus.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/quill/katex.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/quill/quill.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/bloodhound/bloodhound.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/dropzone/dropzone.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/jquery-repeater/jquery-repeater.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/jquery-timepicker/jquery-timepicker.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/flatpickr/flatpickr.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/tagify/tagify.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/pickr/pickr.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/form-wizard-numbered.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/form-wizard-validation-event.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app-ecommerce-product-add.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/forms-selects.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/forms-tagify.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/forms-typeahead.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/forms-pickers.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        flatpickr("#fechaEvento", {
            enableTime: false,
            dateFormat: "Y-m-d",
        });
    });
</script>


<!-- Main JS -->
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>



<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:07 GMT -->
</html>

<!-- beautify ignore:end -->