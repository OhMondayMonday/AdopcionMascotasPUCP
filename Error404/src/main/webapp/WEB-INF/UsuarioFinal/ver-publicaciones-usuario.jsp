<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="es" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:06 GMT -->
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

  <title>Publicaciones</title>


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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/animate-css/animate.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/sweetalert2/sweetalert2.css" />

  <!-- Page CSS -->

  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/pages/page-faq.css" />

  <!-- Helpers -->
  <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>
  <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
  <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
  <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
  <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/flatpickr/flatpickr.css">
</head>

<body style="background-color: #d4e1ffa9;">


<!-- ?PROD Only: Google Tag Manager (noscript) (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar" >
  <div class="layout-container">

    <jsp:include page="../includes/sidebarUF.jsp" />

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
                <p class="mb-0 fst-normal fw-semibold ff-">Publicaciones</p>
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

        <div class="container-xxl container-p-y">

          <div class="card-header d-flex flex-wrap justify-content-between gap-3">
            <!-- Filtros -->
            <div class="col-12 d-flex justify-content-between align-items-center">

              <div class="col-12 card m-0" style="height: auto; padding: 5px">

                <div class="card-body d-flex justify-content-center p-1">

                  <form action="PublicacionesServlet" method="GET" id="filtrosForm" class="row w-100">
                    <input type="hidden" name="action" value="verTodasPublicaciones">
                    <div class="col-md-3 d-flex flex-column justify-content-center align-items-center mb-0 mt-0">
                      <label for="tipoPublicacionId" class="form-label mb-1" style="font-size: 0.75rem; margin-bottom: 2px;">Tipo de Publicacion</label>
                      <select name="tipoPublicacionId" id="tipoPublicacionId" class="select2 form-select-sm" data-allow-clear="true" style="font-size: 0.75rem;">
                        <option value="">Todos</option>
                        <c:forEach var="tipo" items="${tiposPublicaciones}">
                          <option value="${tipo.tipoPublicacionId}" ${tipo.tipoPublicacionId == filtros.tipoPublicacionId ? "selected" : ""}>
                            ${tipo.tipoPublicacion}
                          </option>
                        </c:forEach>
                        <c:if test="${empty tiposPublicaciones}">
                          <p>No se encontraron tipos de publicaciones</p>
                        </c:if>
                        <c:if test="${empty filtros}">
                          <p>No hay filtros configurados</p>
                        </c:if>
                      </select>
                    </div>
                    <!-- Fecha -->
                    <div class="col-md-4 d-flex flex-column justify-content-center align-items-center mb-0 mt-0">
                      <label for="dateRange" class="form-label mb-1" style="font-size: 0.75rem; margin-bottom: 2px;">Rango de fechas</label>
                      <input type="text" id="dateRange" class="form-control form-control-sm" placeholder="Seleccionar rango de fechas"/>
                      <input type="hidden" name="fechaInicio" id="fechaInicio" value="${filtros.fechaInicio}">
                      <input type="hidden" name="fechaFin" id="fechaFin" value="${filtros.fechaFin}">
                    </div>

                    <!-- Botón Filtrar -->
                    <div class="<c:choose><c:when test='${not empty filtros.tipoPublicacionId or not empty filtros.fechaInicio or not empty filtros.fechaFin}'>
                                                            col-md-1
                                                        </c:when>
                                                        <c:otherwise>
                                                            col-md-2
                                                        </c:otherwise>
                                                    </c:choose> d-flex flex-column align-items-center btn-group p-2">
                      <button type="submit" class="btn btn-facebook">Filtrar</button>
                    </div>

                    <c:choose>
                      <c:when test="${not empty filtros.tipoPublicacionId or not empty filtros.fechaInicio or not empty filtros.fechaFin}">

                      </c:when>
                    </c:choose>

                    <!-- Botón Limpiar (solo visible cuando hay filtros aplicados) -->
                    <c:if test="${not empty filtros.tipoPublicacionId or not empty filtros.fechaInicio or not empty filtros.fechaFin}">
                      <div class="col-md-1 d-flex flex-column align-items-center btn-group p-2">
                        <button type="button" class="btn btn-secondary" onclick="limpiarFiltros()">Limpiar</button>
                      </div>
                    </c:if>

                  </form>

                    <!-- Aplicar Filtro y Nueva Publicación -->
                    <div class="col-lg-3 col-md-3 col-sm-12 d-flex justify-content-between mb-1 mt-md-0 mt-1"> <!-- Flex para mantener los botones juntos -->
                      <!-- Botón Nueva Publicación -->
                      <div class="btn-group" style="width: 48%;">
                        <button class="btn btn-primary btn-sm dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                          Nueva publicación
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                          <li><a class="dropdown-item" href="<%=request.getContextPath()%>/PublicacionesServlet?action=agregar&user_id=1">Normal</a></li>
                          <li><a class="dropdown-item" href="crear-publicacion-usuariofinal-mascotaperdida.html">Mascota Perdida</a></li>
                          <li><a class="dropdown-item" href="<%=request.getContextPath()%>/PublicacionesServlet?action=agregarDenuncia&user_id=1">Denuncia Maltrato</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>






            <!-- Card Container -->
            <div class="card mb-2" style="padding: 0; margin: 0;">

              <div class="card-body p-0">
                <div class="container-fluid">
                  <div class="row gx-1 gy-4 justify-content-center m-0">

                    <!-- Card 1 -->
                    <c:choose>
                      <c:when test="${empty publicaciones}">
                        <div class="col-12 text-center col-sm-6 col-md-4 col-lg-5 px-1 mb-2 d-flex justify-content-center">
                          <p class="mb-0 text-body">No hay publicaciones disponibles para mostrar.</p>
                        </div>
                      </c:when>
                      <c:otherwise>
                        <c:forEach var="publicacion" items="${publicaciones}">
                          <div class="col-12 col-sm-6 col-md-4 col-lg-2 px-1 mb-2 d-flex justify-content-center">
                            <div class="card d-flex flex-column"  style="border: 1px solid #ddd; box-shadow: none; width: 100%; max-width: 250px;">
                              <div class="rounded-2 text-center flex-grow-1">
                                <a data-bs-toggle="modal" href="#evento${publicacion.publicacionId}">
                                  <img class="img-fluid" src="${publicacion.foto.urlFoto}" alt="${publicacion.titulo}" style="height: 200px; object-fit: cover; border-radius: 5px;"/>
                                </a>
                              </div>
                              <div class="card-body p-2 d-flex flex-column">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                  <span class="badge bg-label-info" style="font-size: 0.75rem;">${publicacion.tipoPublicacion.tipoPublicacion}</span>
                                </div>
                                <a class="h6" data-bs-toggle="modal" href="#evento${publicacion.publicacionId}" style="font-size: 0.875rem;">${publicacion.titulo}</a>
                                <p class="mt-1 mb-0" style="font-size: 0.75rem;">${publicacion.descripcion}</p>
                                <div class="d-flex flex-column gap-1 text-nowrap mt-auto mb-auto">
                                  <a class="btn btn-label-info d-flex align-items-center" style="font-size: 0.75rem;" href="<%=request.getContextPath()%>/PublicacionesServlet?action=mostrar&id=${publicacion.publicacionId}">
                                    <span>Detalles</span><i class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                  </a>
                                  <button type="button" class="btn btn-label-primary d-flex align-items-center btn-inscripcion" data-event-id="${publicacion.publicacionId}" user-type="usuario" post-type="publi" style="font-size: 0.75rem;">
                                    <span>Inscripción</span><i class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                  </button>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="modal fade" id="evento${publicacion.publicacionId}" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog modal-lg modal-simple modal-edit-user">
                              <div class="modal-content p-3 p-md-5">
                                <div class="modal-body">
                                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                  <div class="text-center mb-4">
                                    <img class="img-fluid mb-4" src="${publicacion.foto.urlFoto}" alt="Imagen de publicación ${publicacion.publicacionId}" style="height: 200px; object-fit: cover;"/>
                                    <h3 class="text-primary">${publicacion.titulo}</h3>
                                    <span class="badge bg-label-info" style="font-size: 0.75rem;">${publicacion.tipoPublicacion.tipoPublicacion}</span>
                                  </div>
                                  <form id="editUserForm" class="row g-3" onsubmit="return false">
                                    <div class="col-12" style="text-align: justify;">
                                      <p>${publicacion.descripcion}
                                      </p>
                                    </div>
                                      <div class="col-12 col-md-6">
                                        <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bxl-baidu bx-sm me-2'></i>Nombre: Claudio</p>
                                      </div>
                                      <div class="col-12 col-md-6">
                                        <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bxs-dog bx-sm me-2'></i>Raza: Labrador Retriever</p>
                                      </div>
                                      <div class="col-12 col-md-6">
                                        <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-calendar-heart bx-sm me-2'></i>Edad: 2 años</p>
                                      </div>
                                      <div class="col-12 col-md-6">
                                        <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-male-sign bx-sm me-2'></i>Género: Macho</p>
                                      </div>



                                    <div class="col-12 text-center">
                                      <button type="reset" class="btn btn-label-primary" data-bs-dismiss="modal" aria-label="Close">Cerrar</button>
                                    </div>
                                  </form>
                                </div>
                              </div>
                            </div>
                          </div>
                        </c:forEach>
                      </c:otherwise>
                    </c:choose>
                </div>
              </div>
              <!-- Pagination -->

              <div class="content-backdrop fade"></div>
            </div>
            <!-- / Card Container -->

            <!-- Content wrapper -->
          </div>
          <!-- / Layout page -->
        </div>

        <!-- Botones de Paginacion -->
        <div class="d-flex justify-content-center mt-3">
          <c:choose>
            <c:when test="${not empty publicaciones}">
              <nav>
                <ul class="pagination justify-content-center">
                  <li class="page-item" ${page == 1 ? 'disabled' : ''}>
                    <a class="page-link" href="?action=verTodasPublicaciones&page=${page - 1}&tipoPublicacionId=${filtros.tipoPublicacionId}&fechaInicio=${filtros.fechaInicio}&fechaFin=${filtros.fechaFin}">Anterior</a>
                  <c:forEach var="i" begin="1" end="${totalPages}">
                    <li class="page-item" ${i == page ? 'active' : ''}>
                      <a class="page-link" href="?action=verTodasPublicaciones&page=${i}&tipoPublicacionId=${filtros.tipoPublicacionId}&fechaInicio=${filtros.fechaInicio}&fechaFin=${filtros.fechaFin}">${i}</a>
                  </c:forEach>
                    <li class="page-item" ${page == totalpages ? 'disabled' : ''}>
                  <a class="page-link" href="?action=verTodasPublicaciones&page=${page + 1}&tipoPublicacionId=${filtros.tipoPublicacionId}&fechaInicio=${filtros.fechaInicio}&fechaFin=${filtros.fechaFin}">Siguiente</a>
                </ul>
              </nav>
            </c:when>
          </c:choose>
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

        <!-- Overlay -->
        <div class="layout-overlay layout-menu-toggle"></div>


        <!-- Drag Target Area To SlideIn Menu On Small Screens -->


      </div>
      <!-- / Layout wrapper -->


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

      <script src="${pageContext.request.contextPath}/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>


      <!-- Main JS -->
      <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>


      <!-- Page JS -->
      <script src="${pageContext.request.contextPath}/assets/vendor/libs/flatpickr/flatpickr.js"></script>
      <script>
        // Inicializa flatpickr para el rango de fechas
        flatpickr("#dateRange", {
          mode: "range", // Rango de fechas
          dateFormat: "Y-m-d", // Formato compatible con el backend
          locale: {
            firstDayOfWeek: 1, // Semana inicia en lunes
            rangeSeparator: " a ", // Separador para rango
          },
          onChange: function (selectedDates, dateStr, instance) {
            // Extraer fechas de inicio y fin
            const fechaInicio = selectedDates[0] ? selectedDates[0].toISOString().split("T")[0] : "";
            const fechaFin = selectedDates[1] ? selectedDates[1].toISOString().split("T")[0] : "";

            // Asignar valores a los campos ocultos
            document.getElementById("fechaInicio").value = fechaInicio;
            document.getElementById("fechaFin").value = fechaFin;

            console.log("Fecha Inicio:", fechaInicio, "Fecha Fin:", fechaFin); // Depuración
          },
        });
      </script>

      <script>
        function limpiarFiltros() {
          const baseUrl = "PublicacionesServlet";
          const queryParams = "?action=verTodasPublicaciones";
          window.location.href = baseUrl + queryParams;
        }
      </script>

      <script src="${pageContext.request.contextPath}/assets/js/extended-ui-sweetalert2.js"></script>


</body>



<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:07 GMT -->
</html>

<!-- beautify ignore:end -->
