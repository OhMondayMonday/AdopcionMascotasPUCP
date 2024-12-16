<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="usuario" class="Beans.Usuarios" scope="request" />
<jsp:useBean id="rol" class="Beans.Roles" scope="request" />

<jsp:setProperty name="usuario" property="*" />
<jsp:setProperty name="rol" property="*" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html lang="es" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="../../assets/" data-template="vertical-menu-template-semi-dark">

    <!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:06 GMT -->
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

        <title>Editar Perfil</title>

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

        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-content-navbar" style="background-color: #fff1ef;">
            <div class="layout-container">
                <jsp:include page="../includes/sidebarAlbergue.jsp" />
                <div class="layout-page">
                    <jsp:include page="../includes/navbarAlbergue.jsp"/>
                    <div class="content-wrapper">
                        <!-- Content -->
                        <div class="container-xxl flex-grow-1 container-p-y">
                            <c:choose>
                                <c:when test="${not empty usuario}">
                                    <!-- CONTENIDO NORMAL CUANDO EL USUARIO EXISTE -->
                                    <div class="row">
                                        <!-- User Sidebar -->
                                        <div class="col-xl-4 col-lg-5 col-md-5 order-0 order-md-0">
                                            <!-- User Card -->
                                            <div class="card mb-4">
                                                <div class="card-body">
                                                    <div class="user-avatar-section">
                                                        <div class="d-flex align-items-center flex-column">
                                                            <img class="img-fluid rounded my-4" src="https://img.freepik.com/vector-gratis/fondo-bonito-cara-sonriente-animales-felices-decorativos_23-2147590101.jpg?t=st=1726640655~exp=1726644255~hmac=810a73c0148e1c4d1ecb3b4af4a0d1b18f8dfe3d48ec5d695b0282ec0570e8d0&w=826" height="110" width="110" alt="User avatar" />
                                                            <div class="user-info text-center">
                                                                <h4 class="mb-2">${usuario.nombreAlbergue}</h4>
                                                                <span class="badge bg-label-danger">Albergue</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex justify-content-around flex-wrap my-4 py-3">
                                                        <div class="d-flex align-items-start me-4 mt-3 gap-3">
                                                            <span class="badge bg-label-primary p-2 rounded"><i class='bx bx-check bx-sm'></i></span>
                                                            <div>
                                                                <h5 class="mb-0">${usuario.animalesAlbergados}</h5>
                                                                <span>Animales albergados</span>
                                                            </div>
                                                        </div>
                                                        <div class="d-flex align-items-start mt-3 gap-3">
                                                            <span class="badge bg-label-primary p-2 rounded"><i class='bx bx-customize bx-sm'></i></span>
                                                            <div>
                                                                <h5 class="mb-0">${usuario.capacidadNuevosAnimales}</h5>
                                                                <span>Capacidad</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <h5 class="pb-2 border-bottom mb-4">Detalles de la cuenta</h5>
                                                    <div class="info-container">
                                                        <ul class="list-unstyled">
                                                            <li class="mb-3">
                                                                <span class="fw-medium me-2">Nombre completo:</span>
                                                                <span>${usuario.nombre} ${usuario.apellido}</span>
                                                            </li>
                                                            <li class="mb-3">
                                                                <span class="fw-medium me-2">Nombre de usuario:</span>
                                                                <span>${usuario.username}</span>
                                                            </li>
                                                            <li class="mb-3">
                                                                <span class="fw-medium me-2">Correo:</span>
                                                                <span>${usuario.email}</span>
                                                            </li>
                                                            <li class="mb-3">
                                                                <span class="fw-medium me-2">Estado:</span>
                                                                <span class="badge bg-label-success">${usuario.estadoCuenta}</span>
                                                            </li>
                                                            <li class="mb-3">
                                                                <span class="fw-medium me-2">Cuenta activa desde: </span>
                                                                <span>${usuario.fechaRegistro}</span>
                                                            </li>

                                                        </ul>
                                                        <div class="d-flex justify-content-center pt-3">
                                                            <a href="<c:url value='/albergue?action=editarPerfil&id=${usuario.userId}'/>" class="btn btn-warning">
                                                                <i class='bx bx-edit'></i>Editar
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /User Card -->
                                        </div>
                                        <!--/ User Sidebar -->

                                        <!-- User Content -->
                                        <div class="col-xl-8 col-lg-7 col-md-7 order-1 order-md-1">
                                            <!-- User Pills -->
                                            <ul class="nav nav-pills flex-column flex-md-row mb-3">
                                                <li class="nav-item"><a class="nav-link active" href="javascript:void(0);"><i class="bx bx-user me-1"></i>Cuenta</a></li>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="<c:url value='/albergue?action=verMiPerfilSeguridad'/>">
                                                        <i class="bx bx-lock-alt me-1"></i>Seguridad
                                                    </a>
                                                </li>
                                            </ul>
                                            <!-- Project table -->
                                            <div class="card mb-4">
                                                <h5 class="card-header pb-2 pt-3 ps-3">Acerca de nosotros</h5>
                                                <div class="p-3 pt-0 descripcion-hogar">
                                                    <!-- Sección "¿Quiénes somos?" -->
                                                    <strong>¿Quiénes somos?</strong><br>
                                                    <span>${fn:escapeXml(usuario.descripcion != null ? usuario.descripcion : 'Descripción no disponible')}</span>
                                                    <br>

                                                    <!-- Sección "Encuéntranos en..." -->
                                                    <strong>Encuéntranos en...</strong>
                                                    <ul class="list-unstyled">
                                                        <li class="mb-3">
                                                            <span class="fw-medium me-2">Distrito:</span>
                                                            <span>${usuario.distrito != null && usuario.distrito.nombreDistrito != null ? usuario.distrito.nombreDistrito : 'Distrito no especificado'}</span>

                                                        </li>
                                                        <li class="mb-3">
                                                            <span class="fw-medium me-2">Dirección completa:</span>
                                                            <span>${usuario.direccion}</span>
                                                        </li>
                                                    </ul>

                                                    <!-- Sección "Nuestras redes sociales" -->
                                                    <strong>¡Nuestras redes sociales!</strong>
                                                    <ul class="list-unstyled">
                                                        <li class="mb-3">
                                                            <span class="fw-medium me-2">Facebook:</span>
                                                            <span>${usuario.urlFacebook}</span>
                                                        </li>
                                                        <li class="mb-3">
                                                            <span class="fw-medium me-2">Instagram:</span>
                                                            <span>${usuario.urlInstagram}</span>
                                                        </li>

                                                    </ul>

                                                    <!-- Sección "Aceptamos donaciones" -->
                                                    <strong>Aceptamos donaciones:</strong>
                                                    <ul class="list-unstyled">
                                                        <li class="mb-3">
                                                            <span class="fw-medium me-2">Nombre del contacto de donaciones:</span>
                                                            <span>${usuario.nombreContactoDonaciones}</span>
                                                        </li>
                                                        <li class="mb-3">
                                                            <span class="fw-medium me-2">Número donaciones:</span>
                                                            <span>${usuario.numeroContactoDonaciones}</span>
                                                        </li>
                                                        <li class="mb-3">
                                                            <span class="fw-medium me-2">Dirección del Centro de acopio:</span>
                                                            <span>${usuario.direccionDonaciones} - </span>
                                                            <span>${usuario.puntoAcopio}</span>
                                                        </li>
                                                        <li class="mb-3">
                                                            <span class="fw-medium me-2">Yape/Plin:</span>
                                                            <span>${usuario.numeroYapePlin}</span>
                                                        </li>
                                                        <li class="mb-3">
                                                            <span class="fw-medium me-2">Qr YAPE/PLIN:</span>
                                                            <span>${usuario.codigoQr}</span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>

                                            <!--/ User Content -->
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <!-- MENSAJE DE ERROR -->
                                    <div class="alert alert-danger" role="alert">
                                        Error: No se encontró información del usuario. Por favor, intente nuevamente.
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>


                        <footer class="footer bg-footer-theme" >
                            <div class="container-fluid d-flex flex-md-row flex-column justify-content-between align-items-md-center gap-1 container-p-x py-3" style="background-color: #fff1ef">
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
                        <div class="content-backdrop fade"></div>

                    </div>
                    <!-- / Layout wrapper -->
                </div>
                <!-- / Layout page -->
            </div>
        </div>
        </div>
        <!-- /Layout wrapper -->
        <!-- Core JS -->
        <!-- build:js assets/vendor/js/core.js -->

        <!-- jQuery, Popper.js y Bootstrap (librerías esenciales) -->
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
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/bootstrap-select/bootstrap-select.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/bloodhound/bloodhound.js"></script>
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

       <!-- Page JS -->

        <script src="${pageContext.request.contextPath}/assets/js/extended-ui-sweetalert2.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app-ecommerce-product-add.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/forms-selects.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/forms-tagify.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/forms-typeahead.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/modal-edit-user.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/modal-enable-otp.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app-user-view.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app-user-view-security.js"></script>

    </body>

    <!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:07 GMT -->
</html>

<!-- beautify ignore:end -->