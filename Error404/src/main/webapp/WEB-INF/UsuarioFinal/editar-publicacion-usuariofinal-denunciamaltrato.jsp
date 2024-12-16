<%@ page import="Beans.Razas" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaRazas" type="java.util.ArrayList<Beans.Razas>" scope="request"/>
<jsp:useBean id="usuario" type="Beans.Usuarios" scope="request"/>
<jsp:useBean id="publicacion" type="Beans.Publicaciones" scope="request"/>
<jsp:useBean id="denuncia" type="Beans.DenunciasMaltratoAnimal" scope="request"/>
<html lang="es" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="../../assets/" data-template="vertical-menu-template-semi-dark">


<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

  <title>Editar Publicación | Denuncia por Maltrato Animal</title>


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
  <style>
    .fondo{
      background-color: #d4e1ffa9;
    }
  </style>
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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/sweetalert2/sweetalert2.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/@form-validation/form-validation.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/animate-css/animate.css" />

  <!-- Page CSS -->


  <!-- Helpers -->
  <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>
  <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
  <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
  <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
  <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>

</head>

<body class="fondo">


<!-- ?PROD Only: Google Tag Manager (noscript) (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->


<div class="layout-wrapper layout-content-navbar">
  <div class="layout-container">
    <!-- Navbar -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/includes/sidebarUF.jsp">
      <jsp:param name="usuariosession" value=""/>
    </jsp:include>


    <div class="layout-page">
      <jsp:include page="${pageContext.request.contextPath}/WEB-INF/includes/navbarUF.jsp">
        <jsp:param name="usuariosession" value=""/>
      </jsp:include>

      <!-- Content wrapper -->
      <div class="content-wrapper">

        <!-- Content -->

        <div class="container-xxl flex-grow-1 container-p-y">

          <div class="app-ecommerce">
            <form id="formPublis" method="POST" action="PublicacionesServlet?action=actualizarDenuncia" enctype="multipart/form-data">

            <!-- Add Product -->
            <div class="d-flex flex-wrap justify-content-between align-items-center mb-3">

              <div class="d-flex flex-column justify-content-center">
                <h4 class="mb-1 mt-1" style="font-size: 24px; color: #353537dd;">Editar Publicación</h4>
                <p class="text-muted">Rellena los campos abajo</p>
              </div>
              <div class="d-flex align-content-center flex-wrap gap-3">
                <button id="confirm-text" class="btn btn-success" style="font-weight: bold;">Confirmar Cambios</button>
                <button class="btn btn-danger cancel-subscription">Descartar</button>
              </div>

            </div>

            <!-- First column-->
            <div class="row">
              <div class="col-12 col-lg-6">
                <!-- Product Information -->
                <div class="card mb-4">
                  <div class="card-header">
                    <h5 class="card-tile mb-0" style="color: #3318ca;">Denuncia por Maltrato</h5>
                  </div>
                  <div class="card-body">
                    <div class="mb-3">
                      <label class="form-label" for="titulo">Titulo</label>
                      <input required type="text" class="form-control" value="<%=publicacion.getTitulo()%>" id="titulo" name="titulo" placeholder="Título de la publicación">
                      <input type="hidden" name="tipo_publicacion" value="5">
                      <input type="hidden" name="user_id" value="<%=usuario.getUserId()%>">
                      <input type="hidden" name="publicacion_id" value="<%=publicacion.getPublicacionId()%>">
                      <input type="hidden" name="mascota_id" value="<%=denuncia.getMascota().getMascotaId()%>">
                    </div>
                    <div class="row mb-3">
                      <div class="col"><label class="form-label" for="opciones">Tipo</label>
                        <select class="form-control" id="opciones" onchange="cambiarPagina()" required>
                          <option value="" disabled selected>Elija el tipo de publicación</option>
                          <option value="" disabled>Normal</option>
                          <option value="" disabled>Adopción</option>
                          <option value="" disabled>Mascota Perdida</option>
                          <option value="" selected>Denuncia por Maltrato Animal</option>
                        </select>
                      </div>
                    </div>
                    <!-- Description -->
                    <div>
                      <label class="form-label" for="descripcion">Descripción<span class="text-muted"></span></label>
                      <textarea required class="form-control" name="descripcion" id="descripcion" rows="10" style="resize: none;"><%=publicacion.getDescripcion()%></textarea>
                    </div>
                </div>
                <!-- /Second column -->
                <div class="col-12 col-lg-12">
                  <!-- Media -->

                </div>
              </div>
              <!-- Third-->
              </div>
              <div class="col-12 col-lg-6">
                <!-- Product Information -->
                <div class="card mb-4">
                  <div class="card-header">
                    <h5 class="card-tile mb-0" style="color: #3318ca;">Datos de la Mascota</h5>
                  </div>
                  <div class="card-body">
                    <div class="mb-3">
                      <label class="form-label" for="mascota_nombre">Nombre</label>
                      <input type="text" required class="form-control" value="<%=denuncia.getMascota().getNombre()%>" id="mascota_nombre" name="mascota_nombre" placeholder="Nombre del mascota">
                    </div>
                    <div class="row mb-3">
                      <div class="col"><label class="form-label" for="mascota_tamanio">Tamaño</label>
                        <select class="form-control" name="mascota_tamanio" id="mascota_tamanio" required>
                          <%if(Objects.equals(denuncia.getMascota().getTamanio(), "pequeño")){%>
                          <option value="" disabled>Elija el tamaño</option>
                          <option value="pequeño" selected>Pequeño</option>
                          <option value="mediano">Mediano</option>
                          <option value="grande">Grande</option>
                          <option value="gigante">Gigante</option>
                          <%} else if (Objects.equals(denuncia.getMascota().getTamanio(), "mediano")) {%>
                          <option value="" disabled>Elija el tamaño</option>
                          <option value="pequeño">Pequeño</option>
                          <option value="mediano" selected>Mediano</option>
                          <option value="grande">Grande</option>
                          <option value="gigante">Gigante</option>
                          <%} else if (Objects.equals(denuncia.getMascota().getTamanio(), "grande")) {%>
                          <option value="" disabled>Elija el tamaño</option>
                          <option value="pequeño">Pequeño</option>
                          <option value="mediano">Mediano</option>
                          <option value="grande" selected>Grande</option>
                          <option value="gigante">Gigante</option>
                          <%} else if (Objects.equals(denuncia.getMascota().getTamanio(), "gigante")) {%>
                          <option value="" disabled>Elija el tamaño</option>
                          <option value="pequeño">Pequeño</option>
                          <option value="mediano">Mediano</option>
                          <option value="grande">Grande</option>
                          <option value="gigante" selected>Gigante</option>
                          <%}%>
                        </select>
                      </div>
                      <div class="col"><label class="form-label" for="mascota_raza">Raza</label>
                        <div class="col">
                          <select required id="mascota_raza" name="mascota_raza_id" class="select2 form-select form-select-lg" data-allow-clear="true">
                            <option value="" disabled selected>Elija la raza</option>
                            <%for(Razas raza : listaRazas){%>
                            <option value="<%=raza.getRazaId()%>" <%if(denuncia.getMascota().getRaza().getRazaId() == raza.getRazaId()){%>selected<%}%>><%=raza.getNombreRaza()%></option>
                            <%}%>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- Fourth-->
                <!-- Product Information -->
                <div class="card mb-4">
                  <div class="card-header">
                    <h5 class="card-tile mb-0" style="color: #3318ca;">Datos del maltratador</h5>
                  </div>
                  <div class="card-body">
                    <div class="row mb-3">
                      <div class="col">
                        <label class="form-label" for="maltratador_nombre">Nombre</label>
                        <input type="text" required class="form-control" name="maltratador_nombre" value="<%=denuncia.getNombreMaltratador()%>" id="maltratador_nombre" placeholder="Nombre del maltratador">
                      </div>
                      <div class="col">
                        <label class="form-label" for="maltrato_tipo">Tipo de maltrato</label>
                        <input type="text" required class="form-control" name="maltrato_tipo" value="<%=denuncia.getTipoMaltrato()%>" id="maltrato_tipo" placeholder="Indique el tipo de maltratato">
                      </div>
                    </div>
                    <div class="row mb-3">
                      <div class="col"><label class="form-label" for="denuncia_policial">¿Ha realizado la denuncia policial?</label>
                        <select class="form-control" name="denuncia_policial" id="denuncia_policial" required>
                          <%if(denuncia.isDenunciaPolicial()){%>
                          <option value="" disabled selected>Indique</option>
                          <option value="SI" selected>Sí</option>
                          <option value="NO">No</option>
                          <%} else{%>
                          <option value="" disabled selected>Indique</option>
                          <option value="SI">Sí</option>
                          <option value="NO" selected>No</option>
                          <%}%>
                        </select>
                      </div>
                      <div class="col"><label class="form-label" for="direccion_maltrato">Dirección</label>
                        <input required type="text" class="form-control" name="direccion_maltrato" value="<%=denuncia.getDireccionMaltrato()%>" id="direccion_maltrato" placeholder="Indique la Dirección de la mascota maltratada">
                      </div>
                    </div>
                  </div>
                </div>

              </div>
              <div class="row">
                <div class="col-12">
                  <!-- Media -->
                  <div class="card mb-1">
                    <div class="card-header d-flex justify-content-between align-items-center">
                      <h5 class="mb-0 card-title" style="color: #3318ca;">Imagen</h5>
                    </div>
                    <div class="card-body">
                      <input disabled class="form-control" type="file" id="fotoPubli" name="foto" accept="image/*" />
                    </div>
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
<script src="${pageContext.request.contextPath}/assets/vendor/libs/tagify/tagify.js"></script>

<script src="${pageContext.request.contextPath}/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/cleavejs/cleave.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/cleavejs/cleave-phone.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/@form-validation/popular.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/@form-validation/bootstrap5.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/@form-validation/auto-focus.js"></script>

<!-- Main JS -->
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

<!-- Page JS -->
<script src="${pageContext.request.contextPath}/assets/js/app-ecommerce-product-add.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/extended-ui-sweetalert2.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/forms-selects.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/forms-tagify.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/forms-typeahead.js"></script>

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
  document.addEventListener('DOMContentLoaded', function () {
    flatpickr("#html5-date-input", {
      dateFormat: "d-m-Y", // Cambia al formato deseado
      locale: "es" // Ajuste de idioma a español
    });
  });
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

<script>
  // Función para reemplazar valores "null" en todos los inputs
  function replaceNullInInputs() {
    // Seleccionar todos los elementos <input> en la página
    const inputs = document.querySelectorAll("input");

    // Iterar sobre cada input y verificar su valor
    inputs.forEach(input => {
      if (input.value === "null") {
        input.value = ""; // Reemplazar el valor por una cadena vacía
      }
    });
  }
  // Ejecutar la función cuando la página se haya cargado
  document.addEventListener("DOMContentLoaded", replaceNullInInputs);
</script>

</body>


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/app-ecommerce-product-add.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:14:10 GMT -->
</html>

<!-- beautify ignore:end -->

