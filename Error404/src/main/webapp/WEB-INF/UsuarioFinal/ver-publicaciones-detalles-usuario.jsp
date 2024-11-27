<%--
  Created by IntelliJ IDEA.
  User: Sebastian
  Date: 10/11/2024
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="publicacion" type="Beans.Publicaciones" scope="request"/>
<jsp:useBean id="adopcion" type="Beans.PublicacionesAdopcion" scope="request"/>
<jsp:useBean id="mascotaPerdida" type="Beans.PublicacionesMascotaPerdida" scope="request"/>
<jsp:useBean id="donacion" type="Beans.PublicacionesDonaciones" scope="request"/>

<html lang="es" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:06 GMT -->
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title><%=publicacion.getTitulo()%></title>


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
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>

</head>

<body style="background-color: #d4e1ffa9;">


<!-- ?PROD Only: Google Tag Manager (noscript) (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
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
                    <a href="ver-inicio-usuario.html"  class="menu-link">
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
              <p class="mb-0 fst-normal fw-semibold ff-"><span class="text-muted">Usuario / Publicaciones /</span> Detalles</p>
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
                                    <a class="dropdown-item" href="ver-miperfil-usuario-detalles.html">
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
                                    <a class="dropdown-item" href="ver-miperfil-usuario-seguridad.html">
                                        <i class="bx bx-lock me-2" style="color: #1f4397;"></i>
                                        <span class="align-middle" style="color: #1f4397;">Seguridad</span>
                                    </a>
                                </li>


                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="ver-mispublicaciones-usuario.html">
                                        <i class="bx bx-building-house"></i>
                                        <span class="align-middle">Mis publicaciones</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="ver-miseventos-usuario.html">
                                        <i class="bx bx-bone"></i>
                                        <span class="align-middle">Mis eventos</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="ver-calendario-usuario.html">
                                        <i class="bx bx-calendar"></i>
                                        <span class="align-middle">Mi Calendario</span>
                                    </a>
                                </li>
                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="Preguntas-frecuentes.html">
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


            <!-- Content wrapper -->
            <div class="content-wrapper">

                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">

                    <!-- /Select2 -->

                    <div class="card g-3 mt-2">
                        <div class="card-body row g-3">
                            <div class="col-lg-7">
                                <div class="d-flex justify-content-between align-items-center flex-wrap mb-2 gap-1">
                                    <div class="me-1">
                                        <h2 class="mb-2 text-black"><%=publicacion.getTitulo()%></h2>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <span class="badge bg-label-info"><%=publicacion.getTipoPublicacion().getTipoPublicacion()%></span>
                                        <i class='bx bx-share-alt bx-sm mx-4 cursor-pointer'></i>
                                        <i class='bx bx-bookmarks bx-sm cursor-pointer'></i>
                                    </div>
                                </div>
                                <div class="card academy-content shadow-none border">
                                    <div class="p-2">
                                        <div class="cursor-pointer">
                                            <img src="<%=publicacion.getFoto().getUrlFoto()%>" class="w-100" alt="foto">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-5">
                                <h4 class="text-primary mt-2">Descripción</h4>
                                <p class="mb-4 text-dark">
                                    <%= publicacion.getDescripcion() %>
                                </p>

                                <!-- Para más párrafos -->


                                <% if (publicacion.getTipoPublicacion().getTipoPublicacionId() == 1){%>
                                <div class="row">
                                    <div class="justify-content-around mt-4 d-flex">
                                        <a href="<%=request.getContextPath()%>/PublicacionesServlet" class="btn btn-primary">Ir a publicaciones</a>
                                    </div>
                                </div>
                                <% } else if (publicacion.getTipoPublicacion().getTipoPublicacionId()==2 && adopcion != null) {%>
                                <h4 class="text-primary">Más detalles</h4>
                                <div class="d-flex flex-wrap">
                                    <div class="me-5">
                                        <p class="text-nowrap"><i class='bx bxl-baidu bx-sm me-2'></i>Nombre:  <span style="font-weight: bold;"><%=adopcion.getMascota().getNombre()%></span></p>
                                        <p class="text-nowrap"><i class='bx bxs-dog bx-sm me-2'></i>Raza: <span style="font-weight: bold;"><%=adopcion.getMascota().getRaza().getNombreRaza()%> </span></p>
                                    </div>
                                    <div class="me-5">
                                        <p class="text-nowrap"><i class='bx bx-calendar-heart bx-sm me-2'></i>Edad: <span style="font-weight: bold;"><%=adopcion.getMascota().getEdadAproximada()%> años</span></p>
                                        <p class="text-nowrap"><i class='bx bx-male-sign bx-sm me-2'></i>Género: <span style="font-weight: bold;"><%=adopcion.getMascota().getGenero()%> </span></p>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="justify-content-around mt-4 d-flex">
                                        <a href="javascript:void(0)" class="btn btn-warning">Quiero adoptar</a>
                                        <a href="<%=request.getContextPath()%>/PublicacionesServlet" class="btn btn-primary">Ir a publicaciones</a>
                                    </div>
                                </div>
                                <%} else if (publicacion.getTipoPublicacion().getTipoPublicacionId() ==3 && donacion != null) {%>
                                <h4 class="text-primary">Más detalles</h4>
                                <div class="d-flex flex-wrap">
                                    <div class="me-5">
                                        <p class="text-nowrap">Punto de Acopio:  <span style="font-weight: bold;"><%=donacion.getPuntoAcopio()%></span></p>
                                        <%if (donacion.getCantidad()!=0){%>
                                        <p class="text-nowrap">Cantidad: <span style="font-weight: bold;"><%=donacion.getCantidad()%> </span></p>
                                        <%}%>
                                    </div>
                                    <div class="me-5">
                                        <p class="text-nowrap">Tipo de Donación: <span style="font-weight: bold;"><%=donacion.getTipoDonacion().getTipoDonacion()%> años</span></p>
                                        <%if(donacion.getMarca()!= null){%>
                                        <p class="text-nowrap">Marca: <span style="font-weight: bold;"><%=donacion.getMarca()%> </span></p>
                                        <%}%>
                                    </div>
                                    <div class="me-5">
                                        <p class="text-nowrap">Fecha de Recepción Inicio:  <span style="font-weight: bold;"><%=donacion.getFechaRecepcionInicio()%></span></p>
                                        <p class="text-nowrap">Hora de Recepción: <span style="font-weight: bold;"><%=donacion.getHoraRecepcion()%> </span></p>
                                    </div>
                                    <div class="me-5">
                                        <p class="text-nowrap">Fecha de Recepción Fin:  <span style="font-weight: bold;"><%=donacion.getFechaRecepcionFin()%></span></p>
                                        <p class="text-nowrap">Nombre de Contacto: <span style="font-weight: bold;"><%=donacion.getNombreContacto()%> </span></p>
                                    </div>
                                    <div class="me-5">
                                        <p class="text-nowrap">Teléfono de Contacto:  <span style="font-weight: bold;"><%=donacion.getTelefonoContacto()%></span></p>
                                        <%if(donacion.getMotivoDonacion()!=null){%>
                                        <p class="text-nowrap">Motivo de Donación: <span style="font-weight: bold;"><%=donacion.getMotivoDonacion()%> </span></p>
                                        <%}%>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="justify-content-around mt-4 d-flex">
                                        <a href="javascript:void(0)" class="btn btn-warning">Quiero Donar</a>
                                        <a href="<%=request.getContextPath()%>/PublicacionesServlet" class="btn btn-primary">Ir a publicaciones</a>
                                    </div>
                                </div>
                                <%} else if (publicacion.getTipoPublicacion().getTipoPublicacionId() ==4 && mascotaPerdida != null) {%>
                                <h4 class="text-primary">Más detalles</h4>
                                <div class="d-flex flex-wrap">
                                    <div class="me-5">
                                        <p class="text-nowrap"><i class='bx bxl-baidu bx-sm me-2'></i>Nombre:  <span style="font-weight: bold;"><%=mascotaPerdida.getMascota().getNombre()%></span></p>
                                        <p class="text-nowrap"><i class='bx bxs-dog bx-sm me-2'></i>Raza: <span style="font-weight: bold;"><%=mascotaPerdida.getMascota().getRaza().getNombreRaza()%> </span></p>
                                    </div>
                                    <div class="me-5">
                                        <p class="text-nowrap"><i class='bx bx-calendar-heart bx-sm me-2'></i>Edad: <span style="font-weight: bold;"><%=mascotaPerdida.getMascota().getEdadAproximada()%> años</span></p>
                                        <p class="text-nowrap"><i class='bx bx-male-sign bx-sm me-2'></i>Género: <span style="font-weight: bold;"><%=mascotaPerdida.getMascota().getGenero()%> </span></p>
                                    </div>
                                    <div class="me-5">
                                        <p class="text-nowrap">Lugar de Pérdida: <span style="font-weight: bold;"><%=mascotaPerdida.getLugarPerdida()%></span></p>
                                        <p class="text-nowrap">Nombre de Contacto: <span style="font-weight: bold;"><%=mascotaPerdida.getNombreContacto()%></span></p>
                                    </div>
                                    <div class="me-5">
                                        <p class="text-nowrap">Fecha de Pérdida: <span style="font-weight: bold;"><%=mascotaPerdida.getFechaPerdida()%> </span></p>
                                        <p class="text-nowrap">Teléfono de Contacto: <span style="font-weight: bold;"><%=mascotaPerdida.getTelefonoContacto()%> </span></p>
                                    </div>
                                    <div class="me-5">
                                        <%if(mascotaPerdida.getRecompensa()!= null){%>
                                        <p class="text-nowrap">Recompensa: <span style="font-weight: bold;"><%=mascotaPerdida.getRecompensa()%> </span></p>
                                        <%}%>
                                        <p class="text-nowrap">Descripción Adicional: <span style="font-weight: bold;"><%=mascotaPerdida.getDescripcionAdicional()%> </span></p>
                                    </div>
                                </div>
                                <%if(mascotaPerdida.isMascotaEncontrada()){%>
                                <h4 class="text-primary">¡Mascota Encontrada!</h4>
                                <div class="row">
                                    <div class="justify-content-around mt-4 d-flex">
                                        <a href="<%=request.getContextPath()%>/PublicacionesServlet" class="btn btn-primary">Ir a publicaciones</a>
                                    </div>
                                </div>
                                <%}else {%>
                                <div class="row">
                                    <div class="justify-content-around mt-4 d-flex">
                                        <a href="javascript:void(0)" class="btn btn-warning">Reportar Avistamiento</a>
                                        <a href="<%=request.getContextPath()%>/PublicacionesServlet" class="btn btn-primary">Ir a publicaciones</a>
                                    </div>
                                </div>
                                <%}%>
                                <%}else {%>
                                <div class="row">
                                    <div class="justify-content-around mt-4 d-flex">
                                        <a href="<%=request.getContextPath()%>/PublicacionesServlet" class="btn btn-primary">Ir a publicaciones</a>
                                    </div>
                                </div>
                                <%}%>
                                <p class="mb-4 text-secondary position-absolute bottom-0" >
                                    Fecha de Publicación: <%= publicacion.getFechaCreacion() %>
                                </p>

                            </div>
                        </div>
                    </div>



                    <div class="content-backdrop fade"></div>
                </div>
                <!-- Content -->

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
                <!-- Content wrapper -->
            </div>

            <!-- / Layout wrapper -->

            <!-- Core JS -->
            <script src="${pageContext.request.contextPath}/assets/vendor/libs/jquery/jquery.js"></script>
            <script src="${pageContext.request.contextPath}/assets/vendor/libs/popper/popper.js"></script>
            <script src="${pageContext.request.contextPath}/assets/vendor/js/bootstrap.js"></script>
            <script src="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
            <script src="${pageContext.request.contextPath}/assets/vendor/libs/hammer/hammer.js"></script>
            <script src="${pageContext.request.contextPath}/assets/vendor/libs/i18n/i18n.js"></script>
            <script src="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.js"></script>
            <script src="${pageContext.request.contextPath}/assets/vendor/js/menu.js"></script>

            <!-- Main JS -->
            <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>
</html>
