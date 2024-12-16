

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html lang="es" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:06 GMT -->
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Solicitud: Publicaciones</title>


    <meta name="description" content="Most Powerful &amp; Comprehensive Bootstrap 5 Admin Dashboard built for developers!" />
    <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">

    <!-- Canonical SEO -->
    <link rel="canonical" href="https://themeselection.com/item/sneat-dashboard-pro-bootstrap/">

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/pages/page-faq.css" />

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>
    <!-- Template customizer & Theme config files -->
    <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>


</head>

<body>


<!-- ?PROD Only: Google Tag Manager (noscript) (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<!-- Navbar -->

<div class="layout-wrapper layout-content-navbar" style="background-color: #fef8e5;">
    <div class="layout-container">
        <jsp:include page="../includes/sidebarCoordinador.jsp" />

        <div class="layout-page">
            <jsp:include page="../includes/navbarCoordinador.jsp"/>


            <!-- Content wrapper -->
            <div class="content-wrapper" style="background-color: #fef8e5;">

                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">

                    <!-- Filtros -->
                    <div class="card mb-0">
                        <div class="card-header d-flex flex-wrap justify-content-between align-items-center gap-3">
                            <form method="get" action="${pageContext.request.contextPath}/AprobarPublicaciones" class="w-100">
                                <div class="row gx-2 gy-2 align-items-center">
                                    <!-- Tipo de publicación -->
                                    <div class="col-md-3">
                                        <label for="tipoPublicacion" class="form-label mb-1" style="font-size: 0.75rem;">Tipo de Publicación</label>
                                        <select id="tipoPublicacion" name="tipoPublicacion" class="form-select form-select-sm" style="font-size: 0.75rem;">
                                            <option value="">Todas</option>
                                            <option value="Normal">Normal</option>
                                            <option value="Adopcion">Adopción</option>
                                            <option value="Donaciones">Donaciones</option>
                                            <option value="Mascota Perdida">Mascota Perdida</option>
                                            <option value="Denuncia Maltrato">Denuncia Maltrato</option>
                                        </select>
                                    </div>

                                    <!-- Palabra clave -->
                                    <div class="col-md-3">
                                        <label for="inputPalabraClave" class="form-label mb-1" style="font-size: 0.75rem;">Palabra Clave</label>
                                        <input type="text" id="inputPalabraClave" name="palabraClave" class="form-control form-control-sm" placeholder="Escribe palabra clave" style="font-size: 0.75rem;">
                                    </div>

                                    <!-- Fecha -->
                                    <div class="col-md-3">
                                        <label for="fechaFiltro" class="form-label mb-1" style="font-size: 0.75rem;">Fecha</label>
                                        <select id="fechaFiltro" name="fechaFiltro" class="form-select form-select-sm" style="font-size: 0.75rem;">
                                            <option value="">Todas</option>
                                            <option value="Ultimas 24 horas">Últimas 24 horas</option>
                                            <option value="Ultima semana">Última semana</option>
                                            <option value="Ultimo mes">Último mes</option>
                                            <option value="Ultimo año">Último año</option>
                                        </select>
                                    </div>

                                    <!-- Botón de aplicar filtros -->
                                    <div class="col-md-3 text-end">
                                        <button type="submit" class="btn btn-primary btn-sm mt-3">Aplicar Filtros</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>


                    <!-- Cards -->
                    <div class="card mt-2">
                        <div class="card-body p-0">
                            <div class="container-fluid">
                                <div class="row gx-1 gy-2 justify-content-center m-0">

                                    <!-- Mostrar mensaje si no hay publicaciones -->
                                    <c:if test="${empty publicaciones}">
                                        <div class="text-center mt-4">
                                            <p>No hay publicaciones disponibles en este momento.</p>
                                        </div>
                                    </c:if>

                                    <!-- Iterar sobre publicaciones -->
                                    <c:if test="${not empty publicaciones}">
                                        <c:forEach var="publicacion" items="${publicaciones}">
                                            <div class="col-12 col-sm-6 col-md-4 col-lg-2 px-1 mb-2 d-flex justify-content-center">
                                                <div class="card d-flex flex-column" style="border: 1px solid #ddd; box-shadow: none; width: 100%; max-width: 250px;">
                                                    <!-- Imagen -->
                                                    <div class="rounded-2 text-center flex-grow-1">
                                                        <img class="img-fluid" src="${pageContext.request.contextPath}${publicacion.foto.urlFoto}"
                                                             alt="Imagen de la publicación" style="height: 200px; object-fit: cover; border-radius: 3px;">
                                                    </div>

                                                    <!-- Información -->
                                                    <div class="card-body p-2 d-flex flex-column">
                                                        <!-- Tipo de publicación -->
                                                        <span class="badge bg-label-info" style="font-size: 0.75rem;">
                                                                ${publicacion.tipoPublicacion.tipoPublicacion}
                                                        </span>

                                                        <!-- Título -->
                                                        <h6 class="mt-1" style="font-size: 0.875rem;">
                                                                ${publicacion.titulo}
                                                        </h6>

                                                        <!-- Descripción -->
                                                        <p class="mt-1 mb-0" style="font-size: 0.75rem;">
                                                                ${publicacion.descripcion}
                                                        </p>

                                                        <!-- Información adicional según tipo de publicación -->
                                                        <c:choose>
                                                            <c:when test="${publicacion.tipoPublicacion.tipoPublicacion eq 'Adopcion' or publicacion.tipoPublicacion.tipoPublicacion eq 'Donaciones'}">
                                                                <p class="mt-1 mb-0" style="font-size: 0.75rem;">
                                                                    Albergue: ${empty publicacion.usuario.nombreAlbergue ? 'No disponible' : publicacion.usuario.nombreAlbergue}
                                                                </p>
                                                            </c:when>
                                                            <c:when test="${publicacion.tipoPublicacion.tipoPublicacion eq 'Mascota Perdida' or publicacion.tipoPublicacion.tipoPublicacion eq 'Denuncia Maltrato'}">
                                                                <p class="mt-1 mb-0" style="font-size: 0.75rem;">
                                                                    Usuario: ${empty publicacion.usuario.nombre ? 'N/A' : publicacion.usuario.nombre}
                                                                        ${empty publicacion.usuario.apellido ? '' : publicacion.usuario.apellido}
                                                                </p>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <p class="mt-1 mb-0" style="font-size: 0.75rem;">Información no disponible</p>
                                                            </c:otherwise>
                                                        </c:choose>

                                                        <!-- Botones -->
                                                        <div class="d-flex flex-column gap-1 mt-auto">
                                                            <a class="btn btn-label-info d-flex align-items-center"
                                                               href="#modal-${publicacion.publicacionId}" data-bs-toggle="modal" style="font-size: 0.75rem;">
                                                                <span>Detalles</span><i class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                            </a>
                                                            <a href="#" class="btn btn-success btn-accept"
                                                               data-publicacion-id="${publicacion.publicacionId}" style="font-size: 0.75rem;">
                                                                <span>Aceptar</span><i class="bx bx-check-circle"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>






                                </div>
                            </div>
                        </div>


                        <div class="card-footer d-flex justify-content-center">
                            <ul class="pagination m-0">
                            <!-- Botón Anterior -->
                                <c:if test="${currentPage > 1}">
                                   <li class="page-item">
                                      <a class="page-link" href="?page=${currentPage - 1}&palabraClave=${palabraClave}&tipoPublicacion=${tipoPublicacion}&fechaFiltro=${fechaFiltro}">
                                         Anterior
                                        </a>
                                  </li>
                              </c:if>

                                <!-- Mostrar rango dinámico de páginas -->
                                <c:choose>
                                    <c:when test="${totalPages <= 5}">
                                        <!-- Mostrar todas las páginas si son 5 o menos -->
                                        <c:forEach var="i" begin="1" end="${totalPages}">
                                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                                <a class="page-link" href="?page=${i}&palabraClave=${palabraClave}&tipoPublicacion=${tipoPublicacion}&fechaFiltro=${fechaFiltro}">
                                                        ${i}
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- Mostrar un rango dinámico -->
                                        <c:set var="startPage" value="${currentPage - 2}" />
                                        <c:set var="endPage" value="${currentPage + 2}" />

                                        <!-- Ajustar el rango si está fuera de los límites -->
                                        <c:if test="${startPage < 1}">
                                            <c:set var="endPage" value="${endPage + (1 - startPage)}" />
                                            <c:set var="startPage" value="1" />
                                        </c:if>
                                        <c:if test="${endPage > totalPages}">
                                            <c:set var="startPage" value="${startPage - (endPage - totalPages)}" />
                                            <c:set var="endPage" value="${totalPages}" />
                                        </c:if>

                                        <!-- Mostrar las páginas en el rango ajustado -->
                                        <c:forEach var="i" begin="${startPage}" end="${endPage}">
                                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                                <a class="page-link" href="?page=${i}&palabraClave=${palabraClave}&tipoPublicacion=${tipoPublicacion}&fechaFiltro=${fechaFiltro}">
                                                        ${i}
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>

                                <!-- Botón Siguiente -->
                                <c:if test="${currentPage < totalPages}">
                                    <li class="page-item">
                                        <a class="page-link" href="?page=${currentPage + 1}&palabraClave=${palabraClave}&tipoPublicacion=${tipoPublicacion}&fechaFiltro=${fechaFiltro}">
                                            Siguiente
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>



                        <!-- Modales dinámicos -->
                        <c:forEach var="publicacion" items="${publicaciones}">
                            <div class="modal fade" id="modal-${publicacion.publicacionId}" tabindex="-1" aria-hidden="true">
                                <div class="modal-dialog modal-lg modal-simple modal-edit-user">
                                    <div class="modal-content p-3 p-md-5">
                                        <div class="modal-body">
                                            <!-- Botón de cierre -->
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                                            <!-- Encabezado: Imagen y título -->
                                            <div class="text-center mb-4">
                                                <img class="img-fluid mb-3 rounded-3"
                                                     src="${pageContext.request.contextPath}${publicacion.foto.urlFoto}"
                                                     alt="Imagen de la publicación"
                                                     style="height: 250px; object-fit: cover;" />

                                                <h3 class="text-primary">${publicacion.titulo}</h3>
                                                <span class="badge bg-label-info fs-6">${publicacion.tipoPublicacion.tipoPublicacion}</span>
                                            </div>

                                            <!-- Descripción General -->
                                            <div class="mb-4">
                                                <p class="text-muted">
                                                        ${not empty publicacion.descripcion ? publicacion.descripcion : "Sin descripción adicional."}
                                                </p>
                                            </div>

                                            <!-- Información Detallada -->
                                            <div class="row mb-4">
                                                <!-- Columna 1: Información de la Publicación -->
                                                <div class="col-md-6 mb-3">
                                                    <h5 class="text-secondary">Detalles de la Publicación</h5>
                                                    <ul class="list-unstyled">
                                                        <li><strong>Fecha de creación:</strong> ${publicacion.fechaCreacion}</li>
                                                        <li><strong>Estado:</strong> ${publicacion.estadoPublicacion}</li>
                                                        <c:choose>
                                                            <c:when test="${publicacion.tipoPublicacion.tipoPublicacion eq 'Adopcion' or publicacion.tipoPublicacion.tipoPublicacion eq 'Donaciones'}">
                                                                <li><strong>Albergue:</strong> ${empty publicacion.usuario.nombreAlbergue ? "No disponible" : publicacion.usuario.nombreAlbergue}</li>
                                                            </c:when>
                                                            <c:when test="${publicacion.tipoPublicacion.tipoPublicacion eq 'Mascota Perdida' or publicacion.tipoPublicacion.tipoPublicacion eq 'Denuncia Maltrato'}">
                                                                <li><strong>Usuario:</strong> ${empty publicacion.usuario.nombre ? 'N/A' : publicacion.usuario.nombre}
                                                                        ${empty publicacion.usuario.apellido ? '' : publicacion.usuario.apellido}</li>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <li><strong>Información adicional:</strong> No disponible</li>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </ul>
                                                </div>

                                                <!-- Columna 2: Información Adicional -->
                                                <div class="col-md-6 mb-3">
                                                    <h5 class="text-secondary">Información de Contacto</h5>
                                                    <ul class="list-unstyled">
                                                        <c:if test="${publicacion.tipoPublicacion.tipoPublicacion eq 'Mascota Perdida' or publicacion.tipoPublicacion.tipoPublicacion eq 'Denuncia Maltrato'}">
                                                            <li><strong>Nombre del usuario:</strong> ${empty publicacion.usuario.nombre ? 'N/A' : publicacion.usuario.nombre}
                                                                    ${empty publicacion.usuario.apellido ? '' : publicacion.usuario.apellido}</li>
                                                        </c:if>
                                                        <li><strong>Email:</strong> ${empty publicacion.usuario.email ? 'No disponible' : publicacion.usuario.email}</li>
                                                    </ul>
                                                </div>
                                            </div>

                                            <!-- Botón para cerrar -->
                                            <div class="text-center">
                                                <button type="button" class="btn btn-label-primary" data-bs-dismiss="modal">Cerrar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>


                    </div>

                <!-- SweetAlert -->
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                <script>
                    document.querySelectorAll('.btn-accept').forEach(button => {
                        button.addEventListener('click', event => {
                            event.preventDefault();
                            const publicacionId = button.dataset.publicacionId; // Obtener el ID de la publicación

                            // Confirmación con SweetAlert
                            Swal.fire({
                                title: "¿Estás seguro?",
                                text: "Aceptarás la publicación seleccionada.",
                                icon: "warning",
                                showCancelButton: true,
                                confirmButtonText: "Sí, aceptar",
                                cancelButtonText: "Cancelar",
                                customClass: { confirmButton: "btn btn-success me-2", cancelButton: "btn btn-secondary" },
                                buttonsStyling: false
                            }).then(result => {
                                if (result.isConfirmed) {
                                    // Realizar petición AJAX al servidor
                                    fetch('AprobarPublicaciones?action=aprobarPublicacion&publicacionId=' + publicacionId, {
                                        method: 'GET'
                                    })
                                        .then(response => response.json()) // Convertir la respuesta a JSON
                                        .then(data => {
                                            if (data.success) {
                                                Swal.fire({
                                                    icon: "success",
                                                    title: "¡Hecho!",
                                                    text: data.message,
                                                    customClass: { confirmButton: "btn btn-success" }
                                                }).then(() => {
                                                    location.reload(); // Recargar la página para actualizar la lista
                                                });
                                            } else {
                                                Swal.fire({
                                                    icon: "error",
                                                    title: "Error",
                                                    text: data.message,
                                                    customClass: { confirmButton: "btn btn-danger" }
                                                });
                                            }
                                        })
                                        .catch(error => {
                                            console.error('Error:', error);
                                            Swal.fire({
                                                icon: "error",
                                                title: "Error",
                                                text: "Ocurrió un error inesperado.",
                                                customClass: { confirmButton: "btn btn-danger" }
                                            });
                                        });
                                }
                            });
                        });
                    });
                </script>



                <div class="layout-overlay layout-menu-toggle"></div>



                    <!-- Overlay -->
                    <div class="layout-overlay layout-menu-toggle"></div>


                    <!-- Drag Target Area To SlideIn Menu On Small Screens -->


                </div>
                <!-- / Layout wrapper -->
                <footer class="footer bg-footer-theme" >
                    <div class="container-fluid d-flex flex-md-row flex-column justify-content-between align-items-md-center gap-1 container-p-x py-3"  style="background-color: #fef8e5;">
                        <div>
                            <a href="javascript:void(0)" class="footer-link me-4">©2024 Alianza Animal S.A. Todos los derechos reservados.</a>

                        </div>
                        <div>
                            <a href="javascript:void(0)" class="footer-link me-4">Ayuda</a>
                            <a href="javascript:void(0)" class="footer-link me-4">Contactos</a>
                            <a href="javascript:void(0)" class="footer-link">Terminos &amp; Condiciones</a>
                        </div>
                    </div>
                </footer>


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



                <!-- Main JS -->
                <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>


                <!-- Page JS -->


</body>



<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:07 GMT -->
</html>