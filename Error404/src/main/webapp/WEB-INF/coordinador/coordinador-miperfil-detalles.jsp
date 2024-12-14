<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="usuario" class="Beans.Usuarios" scope="request" />
<jsp:useBean id="rol" class="Beans.Roles" scope="request" />
<jsp:setProperty name="usuario" property="*" />
<jsp:setProperty name="rol" property="*" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html lang="es" class="light-style layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="../../assets/" data-template="vertical-menu-template-semi-dark">


    <!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/app-user-view-account.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:14:40 GMT -->
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

        <title>Mi perfil</title>

        <meta name="description" content="Most Powerful &amp; Comprehensive Bootstrap 5 Admin Dashboard built for developers!" />
        <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
        <!-- Canonical SEO -->
        <link rel="canonical" href="https://themeselection.com/item/sneat-dashboard-pro-bootstrap/">

        <!-- PROD Only: Google Tag Manager -->
        <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
                new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
            j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
            '${pageContext.request.contextPath}/www.googletagmanager.com/gtm5445.html?id='+i+dl;f.parentNode.insertBefore(j,f);
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-bs5/datatables.bootstrap5.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/datatables-buttons-bs5/buttons.bootstrap5.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/animate-css/animate.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/sweetalert2/sweetalert2.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/form-validation.css" />

        <!-- Helpers -->
        <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>

        <!-- Template customizer & Theme config -->
        <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>
    </head>

    <body>

        <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
        <div class="layout-wrapper layout-content-navbar" style="background-color: #fef8e5;">
            <div class="layout-container">
                <jsp:include page="../includes/sidebarCoordinador.jsp" />
                <div class="layout-page">
                    <jsp:include page="../includes/navbarCoordinador.jsp"/>
                    <div class="content-wrapper">
                        <div class="container-xxl flex-grow-1 container-p-y">
                            <div class="row">
                                <div class="col-xl-4 col-lg-5 col-md-5 order-0 order-md-0">
                                    <!-- User Card -->
                                    <div class="card mb-4">
                                        <div class="card-body">
                                            <div class="user-avatar-section">
                                                <div class="d-flex align-items-center flex-column">
                                                    <img class="img-fluid rounded my-4" src="https://img.freepik.com/vector-gratis/diseno-plantilla-imagen-perfil_742173-22027.jpg?t=st=1726637844~exp=1726641444~hmac=f81927ff296e19d666bcbbd27413900024f764855e07caa5d1a64d3e3d1c4f9d&w=826" height="110" width="110" alt="User avatar" />
                                                    <div class="user-info text-center">
                                                        <h4 class="mb-2">${usuario.nombre} ${usuario.apellido}</h4>
                                                        <span class="badge bg-label-warning">Coordinador</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <h5 class="pb-2 border-bottom mb-4">Detalles usuario</h5>
                                            <div class="info-container">
                                                <ul class="list-unstyled">
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
                                                    <li class="mb-3">
                                                        <strong>Coordinador designado: ${usuario.zona != null ? usuario.zona : "No asignada"}</strong><br>
                                                    </li>
                                                    <li class="mb-3">
                                                        <strong>Nombre completo:</strong> ${usuario.nombre} ${usuario.apellido}<br>
                                                        <strong>Dirección:</strong> ${usuario.direccion}<br>
                                                        <strong>Teléfono de contacto:</strong> ${usuario.numeroYapePlin}<br>
                                                    </li>
                                                </ul>
                                                <div class="d-flex justify-content-center pt-3">
                                                    <a href="${pageContext.request.contextPath}/coordinador?action=editarPerfil&id=${usuario.userId}" class="btn btn-warning"><i class='bx bx-edit'></i> Editar</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xl-8 col-lg-7 col-md-7 order-1 order-md-1">
                                    <ul class="nav nav-pills flex-column flex-md-row mb-3">
                                        <li class="nav-item"><a class="nav-link active" href="javascript:void(0);"><i class="bx bx-user me-1"></i>Cuenta</a></li>
                                        <li class="nav-item"><a class="nav-link" href="coordinador-ver-miperfil-seguridad.html"><i class="bx bx-lock-alt me-1"></i>Seguridad</a></li>
                                    </ul>
                                    <!--/ User Pills -->

                                    <div class="card mb-4">
                                        <h5 class="card-header">Distritos manejados</h5>
                                        <div class="card-body">
                                            <table class="table table-bordered table-sm">
                                                <thead>
                                                    <tr>
                                                        <th colspan="2">Manejo de los distritos</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <!-- Dividir distritos en dos columnas -->
                                                    <c:set var="distritosSize" value="${fn:length(distritos)}" />
                                                    <c:set var="half" value="${distritosSize div 2}" />

                                                    <c:forEach var="distrito" items="${distritos}">
                                                        <c:if test="${distritos.indexOf(distrito) < half}">
                                                            <tr>
                                                                <td>${distrito.nombreDistrito}</td> <!-- Columna 1 -->
                                                            </tr>
                                                        </c:if>

                                                        <c:if test="${distritos.indexOf(distrito) >= half}">
                                                            <tr>
                                                                <td>${distrito.nombreDistrito}</td> <!-- Columna 2 -->
                                                            </tr>
                                                        </c:if>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                        <!-- / Footer -->


                        <div class="content-backdrop fade"></div>
                    </div>
                    <!-- Content wrapper -->
                </div>
                <!-- / Layout page -->
            </div>

            <div class="layout-overlay layout-menu-toggle"></div>

        </div>
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
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/moment/moment.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
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
        <script src="${pageContext.request.contextPath}/assets/js/modal-edit-user.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app-user-view.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app-user-view-account.js"></script>

    </body>


    <!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/app-user-view-account.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:14:41 GMT -->
</html>
