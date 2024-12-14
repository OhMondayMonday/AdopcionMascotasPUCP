<%@ page import="Beans.Razas" %>
<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaRazas" type="java.util.ArrayList<Beans.Razas>" scope="request"/>
<jsp:useBean id="usuario" type="Beans.Usuarios" scope="request"/>
<html lang="es" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="../../assets/" data-template="vertical-menu-template-semi-dark">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

  <title>Crear Nueva Publicación | Mascota Perdida</title>


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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/sweetalert2/sweetalert2.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/form-validation.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/animate-css/animate.css" />

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
          <p class="mb-0 fst-normal fw-semibold ff-"><span class="text-muted">Publicaciones / Crear Publicación /</span> Mascota Perdida</p>
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
      <!-- / Navbar -->

      <!-- Content wrapper -->
      <div class="content-wrapper">

        <!-- Content -->

        <div class="container-xxl flex-grow-1 container-p-y">

          <div class="app-ecommerce">
            <form id="form_publis" method="POST" action="PublicacionesServlet?action=guardarMascotaPerdida" enctype="multipart/form-data">

            <!-- Add Product -->
            <div class="d-flex flex-wrap justify-content-between align-items-center mb-3">

              <div class="d-flex flex-column justify-content-center">
                <h4 class="mb-1 mt-1" style="font-size: 24px; color: #353537dd;">Nueva Publicación</h4>
                <p class="text-muted">Rellena los campos abajo</p>
              </div>
              <div class="d-flex align-content-center flex-wrap gap-3">
                <button id="confirm-text" class="btn btn-success" style="font-weight: bold;">Publicar</button>
                <button class="btn btn-danger cancel-subscription">Descartar</button>
              </div>

            </div>

            <div class="row">
              <!-- First column-->
              <div class="col-12 col-lg-6">
                <!-- Product Information -->
                <div class="card mb-4">
                  <div class="card-header">
                    <h5 class="card-tile mb-0" style="color: #3318ca;">Mascota Perdida</h5>
                  </div>
                  <div class="card-body">
                    <div class="mb-3">
                      <label class="form-label" for="titulo">Titulo</label>
                      <input type="text" class="form-control" id="titulo" placeholder="Título de la publicación" name="titulo" aria-label="Product title">
                      <input type="hidden" name="tipo_publicacion" value="4">
                      <input type="hidden" name="user_id" value="<%=usuario.getUserId()%>">
                    </div>
                    <div class="row mb-3">
                      <div class="col"><label class="form-label" for="opciones">Tipo</label>
                        <select class="form-control" id="opciones" onchange="cambiarPagina()" required>
                          <option value="" disabled selected>Elija el tipo de publicación</option>
                          <option value="<%=request.getContextPath()%>/PublicacionesServlet?action=agregar&user_id=1">Normal</option>
                          <option value="" selected>Mascota Perdida</option>
                          <option value="<%=request.getContextPath()%>/PublicacionesServlet?action=agregarDenuncia&user_id=1">Denuncia por Maltrato Animal</option>
                        </select>
                      </div>
                    </div>
                    <!-- Description -->
                    <div>
                      <label class="form-label">Descripción <span class="text-muted"></span></label>
                      <textarea required class="form-control" name="descripcion" rows="7" maxlength="500" id="descripcion"></textarea>
                    </div>
                  </div>
                </div>
                <!-- /Second column -->
                <!-- Media -->
                <div class="card mb-1">
                  <div class="card-header d-flex justify-content-between align-items-center">
                    <h5 class="mb-0 card-title" style="color: #3318ca;">Imagen</h5>
                    <a href="javascript:void(0);" class="fw-medium">Añadir contenido desde un URL</a>
                  </div>
                  <div class="card-body">
                    <input class="form-control" type="file" id="fotoPubli" name="foto" accept="image/*" />
                  </div>
                </div>
              </div>
              <!-- Third-->
              <div class="col-12 col-lg-6">
                <!-- Product Information -->
                <div class="card mb-4">
                  <div class="card-header">
                    <h5 class="card-tile mb-0" style="color: #3318ca;">Datos de la Mascota</h5>
                  </div>
                  <div class="card-body">
                    <div class="row mb-3">
                      <div class="col">
                        <label class="form-label" for="mascota_nombre">Nombre</label>
                        <input type="text" required class="form-control" id="mascota_nombre" placeholder="Nombre del mascota" name="mascota_nombre" aria-label="Product title">
                      </div>
                      <div class="col">
                        <label class="form-label" for="mascota_edad">Edad</label>
                        <input type="text" required class="form-control" id="mascota_edad" placeholder="Indique la edad de la mascota" name="mascota_edad" aria-label="Product title">                  </div>
                    </div>
                    <div class="row mb-3">
                      <div class="col"><label class="form-label" for="mascota_tamanio">Tamaño</label>
                        <select class="form-control" id="mascota_tamanio" name="mascota_tamanio" required>
                          <option value="" disabled selected>Elija el tamaño</option>
                          <option value="pequeño">Pequeño</option>
                          <option value="mediano">Mediano</option>
                          <option value="grande">Grande</option>
                          <option value="gigante">Gigante</option>
                        </select>
                      </div>
                      <div class="col">
                        <label class="form-label" for="mascota_raza">Raza</label>
                        <div class="col">
                          <select id="mascota_raza" name="mascota_raza_id" class="select2 form-select form-select-lg" data-allow-clear="true">
                            <option value="" disabled selected>Elija la raza</option>
                            <%for(Razas raza : listaRazas){%>
                            <option value="<%=raza.getRazaId()%>"><%=raza.getNombreRaza()%></option>
                            <%}%>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="row mb-3">
                      <div class="col">
                        <label class="form-label" for="mascota_distintivo">Distintivo</label>
                        <input type="text" required class="form-control" id="mascota_distintivo" placeholder="Indique algún distintivo de la mascota" name="mascota_distintivo" aria-label="Product title">
                      </div>
                    </div>
                    <div class="row mb-3">
                      <div class="col">
                        <label class="form-label" for="informacion_adicional">Información Adicional</label>
                        <input type="text" class="form-control" id="informacion_adicional" placeholder="Indique alguna información adicional" name="informacion_adicional" aria-label="Product title">
                      </div>
                    </div>

                  </div>
                </div>
                <!-- Fourth-->
                <!-- Product Information -->
                <div class="card mb-4">
                  <div class="card-header">
                    <h5 class="card-tile mb-0" style="color: #3318ca;">Información de Contacto</h5>
                  </div>
                  <div class="card-body">
                    <div class="row mb-3">
                      <div class="col">
                        <label class="form-label" for="contacto_nombre">Nombre</label>
                        <input type="text" required class="form-control" id="contacto_nombre" placeholder="Nombre de Contacto" name="contacto_nombre" aria-label="Product title">
                      </div>
                      <div class="col">
                        <label class="form-label" for="contacto_numero">Número de Contacto</label>
                        <input type="text" required class="form-control" id="contacto_numero" placeholder="Indique un número de Contacto" name="contacto-numero" aria-label="Product title">
                      </div>
                    </div>
                    <div class="row mb-3">
                      <div class="col">
                        <label class="form-label" >Fecha de Pérdida</label>
                        <input type="date" required class="form-control" id="fecha_perdida" name="fecha_perdida" aria-label="Product title">
                      </div>
                      <div class="col">
                        <label class="form-label" >Lugar de Pérdida</label>
                        <input type="text" class="form-control" placeholder="Indique el Lugar de Pérdida" id="lugar_perdida" name="lugar_perdida" aria-label="Product barcode">
                      </div>
                    </div>
                    <div class="mb-3">
                      <label class="form-label" >Recompensa</label>
                      <input type="text" class="form-control" placeholder="Alguna Recompensa" id="recompensa" name="recompensa" aria-label="Product title">
                    </div>
                  </div>

                </div>
              </div>

            </div>
            </form>
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

<script src="${pageContext.request.contextPath}/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/cleavejs/cleave.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/cleavejs/cleave-phone.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/popular.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/bootstrap5.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/auto-focus.js"></script>

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

<script>
  // Asegúrate de que el DOM esté cargado antes de ejecutar tu script
  document.getElementById('confirm-text').addEventListener('click', function() {
    Swal.fire({
      title: "¿Estás seguro?",
      text: "Deseas Publicar la nueva Publicación",
      icon: "warning",
      showCancelButton: true,
      confirmButtonText: "Sí, confirmar",
      cancelButtonText: "Cancelar",
      customClass: {
        confirmButton: "btn btn-primary",
        cancelButton: "btn btn-label-secondary"
      },
      buttonsStyling: false
    }).then(function(result) {
      if (result.isConfirmed) {
        console.log("Formulario enviado"); // Depuración
        document.getElementById('formPublis').submit();
      }
    });



    // Botón "Cancelar"
    document.querySelector('.cancel-subscription').addEventListener('click', function() {
      window.location.href = "/PublicacionesServlet"; // Cambia esta ruta según tu necesidad
    });
  });

</script>

<!-- Page JS -->
<script src="${pageContext.request.contextPath}/assets/js/app-ecommerce-product-add.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/extended-ui-sweetalert2.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/forms-selects.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/forms-tagify.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/forms-typeahead.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/modal-edit-user.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/modal-enable-otp.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app-user-view.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app-user-view-security.js"></script>


</body>


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/app-ecommerce-product-add.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:14:10 GMT -->
</html>

<!-- beautify ignore:end -->
