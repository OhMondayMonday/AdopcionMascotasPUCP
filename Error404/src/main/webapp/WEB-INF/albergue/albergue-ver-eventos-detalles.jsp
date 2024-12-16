<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<!DOCTYPE html>

<html lang="es" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="../../assets/" data-template="vertical-menu-template-semi-dark">


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:06 GMT -->
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Detalles del Evento</title>


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
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>

</head>

<body style="background-color: #fff1ef">


<!-- ?PROD Only: Google Tag Manager (noscript) (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">

        <jsp:include page="../includes/sidebarAlbergue.jsp" />

        <div class="layout-page">

            <jsp:include page="../includes/navbarAlbergue.jsp" />

            <!-- Content wrapper -->
            <div class="content-wrapper">

                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">

                    <!-- Card con todos los detalles -->
                    <div class="card">
                        <div class="card-body row g-5">
                            <div class="col-lg-7">
                                <div class="d-flex justify-content-between align-items-center flex-wrap mb-2 gap-1">
                                    <h3 class="me-1 mb-2" style="color: #222f94">${evento.nombreEvento}</h3>
                                    <div class="d-flex align-items-center">
                                        <span class="badge bg-label-info">${evento.tipoEvento.nombreTipo}</span>
                                        <i class='bx bx-share-alt bx-sm mx-4 cursor-pointer'></i>
                                        <i class='bx bx-bookmarks bx-sm cursor-pointer'></i>
                                    </div>
                                </div>
                                <div class="card academy-content border cursor-pointer p-2">
                                    <c:if test="${evento.foto.urlFoto != null}">
                                        <img src="${evento.foto.urlFoto}" alt="${evento.nombreEvento}">
                                    </c:if>
                                </div>
                            </div>

                            <div class="col-lg-5">
                                <h4 class="text-primary mt-2">Descripción</h4>
                                <p class="mb-4 text-dark">
                                    ${evento.descripcionEvento}
                                </p>

                                <h4 class="text-primary">Más detalles</h4>
                                <div class="d-flex flex-wrap">

                                    <c:choose>
                                        <c:when test="${evento.fechaEvento != null && evento.fechaFin != null}">
                                            <div class="me-5">
                                                <p class="text-nowrap"><i class='bx bx-calendar bx-sm me-2'></i>Fecha: Del ${evento.fechaEvento} al ${evento.fechaFin}</p>
                                            </div>
                                        </c:when>
                                        <c:when test="${evento.fechaFin == null}">
                                            <div class="me-5">
                                                <p class="text-nowrap"><i class='bx bx-calendar bx-sm me-2'></i>Fecha Inicio: ${evento.fechaEvento}</p>
                                            </div>
                                        </c:when>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${evento.horaEvento != null && evento.horaFin != null}">
                                            <div class="me-5">
                                                <p class="text-nowrap"><i class='bx bx-time-five bx-sm me-2'></i>Hora Inicio: ${evento.horaEvento}</p>
                                            </div>
                                            <div class="me-5">
                                                <p class="text-nowrap"><i class='bx bx-time-five bx-sm me-2'></i>Hora Fin: ${evento.horaFin}</p>
                                            </div>
                                        </c:when>
                                        <c:when test="${evento.horaFin == null}">
                                            <div class="me-5">
                                                <p class="text-nowrap"><i class='bx bx-time-five bx-sm me-2'></i>Hora: ${evento.horaEvento}</p>
                                            </div>
                                        </c:when>
                                    </c:choose>

                                    <c:if test="${evento.lugarEvento.direccionLugar != null}">
                                        <div class="me-5">
                                            <p class="text-nowrap"><i class='bx bx-map bx-sm me-2'></i>Dirección: ${evento.lugarEvento.direccionLugar}</p>
                                        </div>
                                    </c:if>

                                    <c:if test="${evento.lugarEvento.aforoMaximo != null}">
                                        <div class="me-5">
                                            <p class="text-nowrap"><i class='bx bx-group bx-sm me-2'></i>Aforo máximo: ${evento.lugarEvento.aforoMaximo} personas</p>
                                        </div>
                                    </c:if>

                                    <c:if test="${evento.entrada != null}">
                                        <div class="me-5">
                                            <p class="text-nowrap"><i class='bx bx-dollar bx-sm me-2'></i>Entrada: ${evento.entrada}</p>
                                        </div>
                                    </c:if>

                                    <c:if test="${evento.artistasProveedores != null}">
                                        <div class="me-5">
                                            <p class="text-nowrap"><i class='bx bx-star bx-sm me-2'></i>Artista Invitado: ${evento.artistasProveedores}</p>
                                        </div>
                                    </c:if>

                                    <c:if test="${evento.estadoEvento != null}">
                                        <div class="me-5">
                                            <p class="text-nowrap"><i class='bx bx-check bx-sm me-2'></i>Estado del Evento: ${evento.estadoEvento}</p>
                                        </div>
                                    </c:if>

                                </div>

                                <div class="row text-center">
                                    <div class="col">
                                        <div class="mt-2">
                                            <button type="button" class="btn btn-warning d-flex align-items-center btn-inscripcion" data-event-id="2" style="font-size: 1rem; border-radius: 12px;">
                                                <span>Inscribirme</span>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="mt-2">
                                            <a href="EventosServlet?action=verTodosEventos" class="btn btn-primary" style="font-size: 1rem; border-radius: 15px;">Volver a Eventos</a>
                                        </div>
                                    </div>
                                </div>

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


        <!-- / Layout page -->

<!-- Overlay -->
<!-- <div class="layout-overlay layout-menu-toggle"></div> -->


<!-- Drag Target Area To SlideIn Menu On Small Screens -->

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
<script src="${pageContext.request.contextPath}/assets/js/extended-ui-sweetalert2.js"></script>

    </div>
</div>
</div>
</body>


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:07 GMT -->
</html>

<!-- beautify ignore:end -->