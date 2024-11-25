

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html lang="es" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-semi-dark">


    <!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:06 GMT -->
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

        <title>Solicitud: HogaresTemporales</title>


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


                            <div class="card mb-0"></div>
                            <div class="card-header d-flex flex-wrap justify-content-between gap-3">

                                <!-- Select2 -->
                                <div class="col-12">
                                    <div class="card mb-0" style="height: auto; padding: 5px;">
                                        <div class="card-body d-flex align-items-center justify-content-center p-1">
                                            <div class="row w-100">
                                                <!-- Tipo de Publicacion -->
                                                <div class="col-md-4 d-flex flex-column justify-content-center align-items-center mb-0 mt-0">
                                                    <label for="select2Basic" class="form-label mb-1" style="font-size: 0.75rem; margin-bottom: 2px;">Tipo de solicitud</label>
                                                    <select id="select2Basic" class="select2 form-select form-select-sm" data-allow-clear="true" style="font-size: 0.75rem;">
                                                        <option value="AK">Todas</option>
                                                        <option value="Adopcion">Mascotas Perdidas</option>
                                                        <option value="Donaciones de dinero"> Hogares Temporales</option>
                                                    </select>
                                                </div>
                                                <!-- Palabra clave -->
                                                <div class="col-md-4 d-flex flex-column justify-content-center align-items-center mb-0 mt-0">
                                                    <label for="inputPalabraClave" class="form-label mb-1" style="font-size: 0.75rem; margin-bottom: 2px;">Palabra clave</label>
                                                    <input type="text" id="inputPalabraClave" class="form-control form-control-sm" placeholder="Escribe palabra clave" style="font-size: 0.75rem;">
                                                </div>
                                                <!-- ubicacion -->
                                                <div class="col-md-4 d-flex flex-column justify-content-center align-items-center mb-0 mt-0">
                                                    <label for="select2Ubi" class="form-label mb-1" style="font-size: 0.75rem; margin-bottom: 2px;">Ubicacion</label>
                                                    <select id="select2Ubi" class="select2 form-select form-select-sm" data-allow-clear="true" style="font-size: 0.75rem;">
                                                        <option value="AK">Todas</option>
                                                        <option value="Barranco">Barranco</option>
                                                        <option value="Lima">Lima</option>
                                                        <option value="Chorrillos">Chorrillos</option>
                                                        <option value="Lamolina">La Molina</option>
                                                        <option value="Jesusmaria">Jesus Maria</option>
                                                        <option value="Sanmiguel">San Miguel</option>
                                                        <option value="Losolivos">Los Olivos</option>
                                                        <option value="Miraflores">Miraflores</option>
                                                        <option value="Sanisidro">San isidro</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Verificar si la lista de solicitudes está vacía -->
                                <c:if test="${empty solicitudes}">
                                    <div class="text-center mt-4">
                                        <p>No hay solicitudes disponibles en este momento.</p>
                                    </div>
                                </c:if>

                                <!-- Si hay solicitudes, iterar sobre ellas -->
                                <c:if test="${!empty solicitudes}">
                                    <!-- Card Container -->
                                    <div class="card mb-2" style="padding: 0; margin: 0;">
                                        <div class="card-body p-0">
                                            <div class="container-fluid">
                                                <div class="row gx-1 gy-2 justify-content-center m-0">
                                                    <!-- Iterar sobre las solicitudes usando c:forEach -->
                                                    <c:forEach var="solicitud" items="${solicitudes}">
                                                        <div class="col-12 col-sm-6 col-md-4 col-lg-2 px-1 mb-2 d-flex justify-content-center">
                                                            <div class="card d-flex flex-column" style="border: 1px solid #ddd; box-shadow: none; width: 100%; max-width: 250px;">
                                                                <div class="rounded-2 text-center flex-grow-1">
                                                                    <a data-bs-toggle="modal" href="#evento${solicitud.id}">
                                                                        <img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/2.jpg" alt="avatar" style="height: 200px; object-fit: cover; border-radius: 3px;"/>
                                                                    </a>
                                                                </div>
                                                                <div class="card-body p-2 d-flex flex-column">
                                                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                                                        <span class="badge bg-label-info" style="font-size: 0.75rem;">${solicitud.tipo}</span>
                                                                    </div>
                                                                    <a class="h6" data-bs-toggle="modal" href="#evento${solicitud.id}" style="font-size: 0.875rem;">${solicitud.nombre}</a>
                                                                    <p class="mt-1 mb-0" style="font-size: 0.75rem;">${solicitud.descripcion}</p>
                                                                    <div class="d-flex flex-column gap-1 text-nowrap mt-auto mb-auto">
                                                                        <a class="btn btn-label-info d-flex align-items-center" style="font-size: 0.75rem;" href="coordinador-refugio${solicitud.id}.html">
                                                                            <span>Detalles</span><i class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                                        </a>
                                                                        <a href="#" class="btn btn-success btn-accept" style="font-size: 0.75rem;" data-solicitud-id="${solicitud.id}">
                                                                            <span>Aceptar </span><i class="bx bx-check-circle"></i>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Modales dinámicos -->
                                    <c:forEach var="solicitud" items="${solicitudes}">
                                        <div class="modal fade" id="evento${solicitud.id}" tabindex="-1" aria-hidden="true">
                                            <div class="modal-dialog modal-lg modal-simple modal-edit-user">
                                                <div class="modal-content p-3 p-md-5">
                                                    <div class="modal-body">
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        <div class="text-center mb-4">
                                                            <img class="img-fluid mb-4" src="${pageContext.request.contextPath}/assets/img/${solicitud.imagen}" alt="Imagen de ${solicitud.nombre}" style="height: 200px; object-fit: cover;"/>
                                                            <h3 class="text-primary">${solicitud.nombre}</h3>
                                                            <span class="badge bg-label-info" style="font-size: 0.75rem;">${solicitud.tipo}</span>
                                                        </div>
                                                        <form class="row g-3">
                                                            <div class="col-12" style="text-align: justify;">
                                                                <p>${solicitud.descripcionCompleta}</p>
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
                                </c:if>

                            </div>
                        </div>

                                                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

                                                <script>
                                                    // Selecciona todos los botones con la clase 'btn-accept'
                                                    document.querySelectorAll('.btn-accept').forEach(function(button) {
                                                        button.addEventListener('click', function(event) {
                                                            event.preventDefault();
                                                            const idSolicitud = button.dataset.solicitudId; // Usar un atributo data-solicitud-id en el botón

                                                            Swal.fire({
                                                                title: "¿Estás seguro?",
                                                                text: "Aceptarás la solicitud",
                                                                icon: "warning",
                                                                showCancelButton: true,
                                                                confirmButtonText: "Sí, aceptar",
                                                                customClass: {
                                                                    confirmButton: "btn btn-primary me-3",
                                                                    cancelButton: "btn btn-label-secondary",
                                                                },
                                                                buttonsStyling: false,
                                                            }).then(function(result) {
                                                                if (result.isConfirmed) {
                                                                    fetch('url_para_procesar_solicitud', {
                                                                        method: 'POST',
                                                                        headers: {
                                                                            'Content-Type': 'application/json'
                                                                        },
                                                                        body: JSON.stringify({ solicitudId: idSolicitud })
                                                                    })
                                                                        .then(response => response.json())
                                                                        .then(data => {
                                                                            if (data.success) {
                                                                                Swal.fire({
                                                                                    icon: "success",
                                                                                    title: "¡Hecho!",
                                                                                    text: "La solicitud ha sido aceptada.",
                                                                                    customClass: { confirmButton: "btn btn-success" },
                                                                                });
                                                                            } else {
                                                                                Swal.fire({
                                                                                    icon: "error",
                                                                                    title: "Error",
                                                                                    text: "No se pudo procesar la solicitud.",
                                                                                    customClass: { confirmButton: "btn btn-danger" },
                                                                                });
                                                                            }
                                                                        })
                                                                        .catch(error => console.error('Error:', error));
                                                                }
                                                            });
                                                        });
                                                    });


                                                </script>




                                            </div>
                                        </div>
                                    </div>
            <!-- Paginación -->
            <div class="card-footer d-flex justify-content-center">
                <ul class="pagination m-0">
                    <!-- Enlace a la página anterior, solo si la página actual es mayor a 1 -->
                    <c:if test="${currentPage > 1}">
                        <li class="page-item">
                            <a class="page-link" href="?page=${currentPage - 1}&pageSize=${pageSize}">Anterior</a>
                        </li>
                    </c:if>

                    <!-- Iterar para crear enlaces de páginas -->
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                            <a class="page-link" href="?page=${i}&pageSize=${pageSize}">${i}</a>
                        </li>
                    </c:forEach>

                    <!-- Enlace a la página siguiente, solo si la página actual es menor al total de páginas -->
                    <c:if test="${currentPage < totalPages}">
                        <li class="page-item">
                            <a class="page-link" href="?page=${currentPage + 1}&pageSize=${pageSize}">Siguiente</a>
                        </li>
                    </c:if>
                </ul>
            </div>





            <div class="content-backdrop fade"></div>
                                </div>
                                <!-- Content wrapper -->
                            </div>
                            <!-- / Layout page -->
                        </div>

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



                    <!-- Main JS -->
                    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>


                    <!-- Page JS -->


    </body>



    <!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:07 GMT -->
</html>