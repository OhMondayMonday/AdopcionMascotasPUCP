<%--
  Created by IntelliJ IDEA.
  User: Luis Joaquin Pozo
  Date: 19/11/2024
  Time: 00:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Hogares Temporales | Editar Postulación a Temporal</title>


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


<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <!-- Navbar -->
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
                    <a href="${pageContext.request.contextPath}/UsuarioServlet?action=hogarTemporal" class="menu-link">
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
                    <a href="${pageContext.request.contextPath}/UsuarioServlet?action=miHogarTemporal" class="menu-link">
                        <i class="menu-icon tf-icons bx bxs-building-house"></i>
                        <div class="text-truncate" data-i18n="Mis hogares temporales">Mis hogares temporales</div>
                    </a>
                </li>

                <!-- Misc -->
                <li class="menu-header small text-uppercase"><span class="menu-header-text" data-i18n="Otros">Otros</span></li>
                <li class="menu-item">
                    <a href="https://demos.themeselection.com/sneat-bootstrap-html-admin-template/documentation/" target="_blank" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-help-circle"></i>
                        <div class="text-truncate" data-i18n="Preguntas frecuentes">Preguntas Frecuentes</div>
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
          <p class="mb-0 fst-normal fw-semibold ff-"><span class="text-muted">Usuario / Hogares Temporales /</span> Postular</p>
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
                                        <i class="bx bx-lock me-2"></i>
                                        <span class="align-middle">Seguridad</span>
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
                                    <a class="dropdown-item" href="pages-faq.html">
                                        <i class="bx bx-help-circle me-2"></i>
                                        <span class="align-middle">FAQ</span>
                                    </a>
                                </li>
                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="../index.html" target="_blank">
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


                    <div class="app-ecommerce">

                        <!-- Add Product -->


                        <!-- First column-->
                        <form action="${pageContext.request.contextPath}/UsuarioServlet?action=guardarHogarTemporal" method="POST" enctype="multipart/form-data">
                            <div class="d-flex flex-wrap justify-content-between align-items-center mb-3">

                                <div class="d-flex flex-column justify-content-center">
                                    <h4 class="mb-1 mt-1" style="font-size: 24px; color: #353537dd;">Postularse Como Temporal</h4>
                                    <p class="text-muted">Rellena los campos abajo</p>
                                </div>
                                <div class="d-flex align-content-center flex-wrap gap-3">
                                    <button class="btn btn-secondary">Descartar Cambios</button>
                                    <button type="submit" class="btn btn-primary">Enviar Postulación</button>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-12 col-lg-6">
                                    <!-- Product Information -->
                                    <div class="card mb-4">
                                        <div class="card-header">
                                            <h5 class="card-tile mb-0" style="color: #3318ca;">Datos del Postulante</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="row mb-3">
                                                <div class="col">
                                                    <label class="form-label" for="postulantName">Nombre</label>
                                                    <input type="text" class="form-control" id="postulantName"
                                                           placeholder="Indique su Nombre" name="nombre"
                                                           value="<%= request.getAttribute("nombreUsuario") != null ? request.getAttribute("nombreUsuario") : "" %>"
                                                           required>
                                                </div>
                                                <div class="col">
                                                    <label class="form-label" for="postulantLastname">Apellido</label>
                                                    <input type="text" class="form-control" id="postulantLastname"
                                                           placeholder="Indique su Apellido" name="apellido"
                                                           value="<%= request.getAttribute("apellidoUsuario") != null ? request.getAttribute("apellidoUsuario") : "" %>"
                                                           required>
                                                </div>
                                            </div>




                                            <div class="row mb-3">
                                                <div class="col">
                                                    <label class="form-label" for="postulantAge">Edad</label>
                                                    <input type="number" class="form-control" id="postulantAge" placeholder="Indique su Edad" name="edad" aria-label="Product barcode">
                                                </div>
                                                <div class="col"><label class="form-label" for="postulantGender">Género</label>
                                                    <select class="form-control" id="postulantGender" name="genero" required>
                                                        <option value="" disabled selected>Elija</option>
                                                        <option value="masculino">Masculino</option>
                                                        <option value="femenino">Femenino</option>
                                                        <option value="otro">Otro</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col">
                                                    <label class="form-label" for="postulantNumber">Celular</label>
                                                    <input type="text" class="form-control" id="postulantNumber" name="celular" placeholder="Indique su Número de Celular" aria-label="Product barcode" required>
                                                </div>
                                                <div class="col">
                                                    <label class="form-label" for="postulantAddress">Dirección</label>
                                                    <input type="text" class="form-control" id="postulantAddress" name="direccion" placeholder="Indique su Dirección"  aria-label="Product barcode" required>
                                                </div>
                                            </div>
                                            <div class="row mb-3">

                                                <div class="col">
                                                    <label class="form-label" for="houseRoomNumber">Cantidad de Cuartos</label>
                                                    <input type="number" class="form-control" id="houseRoomNumber" name = "cantidad_cuartos" placeholder="Indique la Cantidad de Cuartos" aria-label="Product barcode" required>
                                                </div>
                                                <div class="col">
                                                    <label class="form-label" for="District">Distrito</label>
                                                        <select class="form-control" id="District" name="distrito" required>
                                                            <option value="" disabled selected>Elija</option>
                                                        <option value="1">Ancón</option>
                                                        <option value="2">Ate</option>
                                                        <option value="3">Barranco</option>
                                                        <option value="4">Breña</option>
                                                        <option value="5">Carabayllo</option>
                                                        <option value="6">Chaclacayo</option>
                                                        <option value="7">Chorrillos</option>
                                                        <option value="8">Cineguilla</option>
                                                        <option value="9">Comas</option>
                                                        <option value="10">El Agustino</option>
                                                        <option value="11">Independencia</option>
                                                        <option value="12">Jesús María</option>
                                                        <option value="13">La Molina</option>
                                                        <option value="14">La Victoria</option>
                                                        <option value="15">Lima</option>
                                                        <option value="16">Lince</option>
                                                        <option value="17">Los Olivos</option>
                                                        <option value="18">Lurigancho</option>
                                                        <option value="19">Lurín</option>
                                                        <option value="20">Magdalena del Mar</option>
                                                        <option value="21">Miraflores</option>
                                                        <option value="22">Pachacámac</option>
                                                        <option value="23">Pucusana</option>
                                                        <option value="24">Pueblo Libre</option>
                                                        <option value="25">Puente Piedra</option>
                                                        <option value="26">Punta Hermosa</option>
                                                        <option value="27">Punta Negra</option>
                                                        <option value="28">Rímac</option>
                                                        <option value="29">San Bartolo</option>
                                                        <option value="30">San Borja</option>
                                                        <option value="31">San Isidro</option>
                                                        <option value="32">San Juan de Lurigancho</option>
                                                        <option value="33">San Juan de Miraflores</option>
                                                        <option value="34">San Luis</option>
                                                        <option value="35">San Martín de Porres</option>
                                                        <option value="36">San Miguel</option>
                                                        <option value="37">Santa Anita</option>
                                                        <option value="38">Santa María del Mar</option>
                                                        <option value="39">Santa Rosa</option>
                                                        <option value="40">Santiago de Surco</option>
                                                        <option value="41">Surquillo</option>
                                                        <option value="42">Villa El Salvador</option>
                                                        <option value="43">Villa María del Triunfo</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" for="descripcionPublicacion">Descripción</label>
                                                <textarea class="form-control" id="descripcionPublicacion" name="descripcionPublicacion" placeholder="Ingrese una corta descripción de tu hogar temporal" aria-label="Descripción" rows="5" required></textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- /Second column -->
                                    <div class="col-12 col-lg-12">
                                        <div class="card mb-1">
                                            <div class="card-header d-flex justify-content-between align-items-center">
                                                <h5 class="mb-0 card-title" style="color: #3318ca;">Nueva Imagen</h5>
                                            </div>
                                            <div class="card-body">
                                                <div class="dz-message needsclick my-3">
                                                    <input name="imagen" type="file" accept="image/*" class="form-control" required />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Third-->
                                <div class="col-12 col-lg-6">
                                    <!-- Product Information -->
                                    <div class="card mb-4">
                                        <div class="card-header">
                                            <h5 class="card-tile mb-0" style="color: #3318ca;">Otros Datos</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="mb-3">
                                                <label class="form-label" for="tituloPublicacion">Título de la publicación</label>
                                                <input type="text" class="form-control" id="tituloPublicacion" name="tituloPublicacion" placeholder="Escribe el título de la publicación" aria-label="Product title" required>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col">
                                                    <label class="form-label" for="houseSize">Metraje de Vivienda</label>
                                                    <input type="text" class="form-control" id="houseSize" placeholder="Indique el Metraje" name="metraje_vivienda" aria-label="Product barcode" required>
                                                </div>
                                                <div class="col"><label class="form-label" for="hasPets">¿Tiene Mascotas?</label>
                                                    <select class="form-control" id="hasPets" name="tiene_mascotas" required>
                                                        <option value="" disabled selected>Indique</option>
                                                        <option value="si">Sí</option>
                                                        <option value="no">No</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col">
                                                    <label class="form-label" for="petsType">Tipo de Mascotas</label>
                                                    <input type="text" class="form-control" id="petsType" name="tipo_mascotas" placeholder="Indique qué Tipo de Mascotas tiene" aria-label="Product barcode" required>
                                                </div>
                                                <div class="col"><label class="form-label" for="hasChildren">¿Tiene Hijos?</label>
                                                    <select class="form-control" id="hasChildren" name="tiene_hijos" required>
                                                        <option value="" disabled selected>Indique</option>
                                                        <option value="si">Sí</option>
                                                        <option value="no">No</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col"><label class="form-label" for="livesAlone">¿Vive Solo o con Dependientes?</label>
                                                    <select class="form-control" id="livesAlone" name="vive_solo" required>
                                                        <option value="" disabled selected>Indique</option>
                                                        <option value="solo">Solo</option>
                                                        <option value="dependientes">Con Dependientes</option>
                                                    </select>
                                                </div>
                                                <div class="col"><label class="form-label" for="jobType">¿Trabaja Remoto o Presencial?</label>
                                                    <select class="form-control" id="jobType" name="trabaja" required>
                                                        <option value="" disabled selected>Indique</option>
                                                        <option value="remoto">Remoto</option>
                                                        <option value="presencial">Presencial</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col">
                                                    <label class="form-label" for="alternatePerson">Persona de Referencia</label>
                                                    <input type="text" class="form-control" id="alternatePerson" placeholder="Indique la Persona de Referencia" name="persona_referencia" aria-label="Product barcode" required>
                                                </div>
                                                <div class="col">
                                                    <label class="form-label" for="alternateNumner">Número de Contacto Referencia</label>
                                                    <input type="text" class="form-control" id="alternateNumner" placeholder="Indique el Número de Referencia" name="contacto_referencia" aria-label="Product barcode" required>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col">
                                                    <label class="form-label" for="timeRangeStart">Fecha Inicial de Temporal</label>
                                                    <input type="date" class="form-control" id="timeRangeStart" placeholder="Indique la Fecha de Inicio del Temporal" name="rango_fecha_inicio" aria-label="Product barcode" required>
                                                </div>
                                                <div class="col">
                                                    <label class="form-label" for="timeRangeEnd">Fecha Final de Temporal</label>
                                                    <input type="date" class="form-control" id="timeRangeEnd" placeholder="Indique la Fecha de Cúlmen del Temporal" name="rango_fecha_fin" aria-label="Product barcode" required>
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" for="temporalTime">Tiempo de Temporal</label>
                                                <input type="text" class="form-control" id="temporalTime" placeholder="Indique el Tiempo de Temporal" name="tiempo_temporal" aria-label="Product title" required>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" for="descripcionHogar">Descripción</label>
                                                <textarea class="form-control" id="descripcionHogar" placeholder="Ingrese una descripción detallada de tu hogar temporal" name="descripcionHogar" aria-label="Descripción" rows="5" required></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
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

            </div>
        </div>
    </div>
</div>

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

<!-- endbuild -->

<!-- Vendors JS -->
<script src="${pageContext.request.contextPath}/assets/vendor/libs/quill/katex.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/quill/quill.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/dropzone/dropzone.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/jquery-repeater/jquery-repeater.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/flatpickr/flatpickr.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/tagify/tagify.js"></script>

<!-- Main JS -->
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script>
    function cambiarPagina() {
        var select = document.getElementById("opciones");
        var opcionSeleccionada = select.value;

        if (opcionSeleccionada) {
            // Cambia la página según la opción seleccionada
            window.location.href = opcionSeleccionada;
        }
    }
</script>
<!-- Page JS -->
<script src="${pageContext.request.contextPath}/assets/js/app-ecommerce-product-add.js"></script>
<script>
    Dropzone.options.dropzoneBasic = {
        paramName: "imagen", // Nombre del campo que contiene la imagen
        maxFilesize: 5, // Tamaño máximo en MB
        acceptedFiles: "image/*", // Solo imágenes
        init: function () {
            this.on("success", function (file, response) {
            console.log("Imagen subida correctamente:", response);
            });
            this.on("error", function (file, response) {
            console.error("Error al subir la imagen:", response);
            });
        }
    };
</script>

</body>
</html>
