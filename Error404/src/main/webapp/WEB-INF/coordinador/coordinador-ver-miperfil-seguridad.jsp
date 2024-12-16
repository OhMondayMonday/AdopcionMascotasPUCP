<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="usuario" class="Beans.Usuarios" scope="request" />
<jsp:useBean id="rol" class="Beans.Roles" scope="request" />

<jsp:setProperty name="usuario" property="*" />
<jsp:setProperty name="rol" property="*" />

<html lang="en" class="light-style layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="../../assets/" data-template="vertical-menu-template-semi-dark">


    <!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/app-user-view-account.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:14:40 GMT -->
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

        <title>Usuario: Seguridad</title>


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
        <link rel="icon" type="image/x-icon" href="../../assets/img/logo_Alianza_Animal_-removebg-preview.png" />
        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com/">
        <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&amp;display=swap" rel="stylesheet">

        <!-- Icons -->
        <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
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

        <!-- Template Config -->
        <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>

    </head>

    <body>


        <!-- ?PROD Only: Google Tag Manager (noscript) (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
        <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
        <!-- End Google Tag Manager (noscript) -->

        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-content-navbar" style="background-color: #fef8e5;">
            < <div class="layout-container">
            <jsp:include page="../includes/sidebarCoordinador.jsp" />
            <div class="layout-page">
                <jsp:include page="../includes/navbarCoordinador.jsp"/>

                    <div class="content-wrapper" style="background-color: #fef8e5;">

                        <div class="container-xxl flex-grow-1 container-p-y">

                            <div class="row">
                                <!-- User Sidebar -->
                                <div class="col-xl-4 col-lg-5 col-md-5 order-0 order-md-0">
                                    <!-- User Card -->
                                    <div class="card mb-4">
                                        <div class="card-body">
                                            <div class="user-avatar-section">
                                                <div class=" d-flex align-items-center flex-column">
                                                    <img class="img-fluid rounded my-4" src="https://img.freepik.com/vector-gratis/diseno-plantilla-imagen-perfil_742173-22027.jpg?t=st=1726637844~exp=1726641444~hmac=f81927ff296e19d666bcbbd27413900024f764855e07caa5d1a64d3e3d1c4f9d&w=826" height="110" width="110" alt="User avatar" />
                                                    <div class="user-info text-center">
                                                        <h4 class="mb-2">Andy Contreras</h4>
                                                        <span class="badge bg-label-warning">Coordinador</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="d-flex justify-content-around flex-wrap my-4 py-3">

                                            </div>
                                            <h5 class="pb-2 border-bottom mb-4">Detalles de la cuenta</h5>
                                            <div class="info-container">
                                                <ul class="list-unstyled">
                                                    <li class="mb-3">
                                                        <span class="fw-medium me-2">Nombre de Usuario:</span>
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
                                                        <span class="fw-medium me-2">Contacto:</span>
                                                        <span>${usuario.numeroYapePlin}</span>
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
                                        <li class="nav-item">
                                            <a href="<c:url value='/coordinador?action=verMiPerfilDetalles' />" class="nav-link">
                                                <i class="bx bx-user me-1"></i>Cuenta
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link active" href="javascript:void(0);">
                                                <i class="bx bx-lock-alt me-1"></i>Seguridad</a>
                                        </li>
                                    </ul>

                                    <div class="card mb-4">
                                        <div class="card-body">
                                            <form id="formChangePassword" method="GET" onsubmit="return false">
                                                <div class="alert alert-warning" role="alert">
                                                    <h6 class="alert-heading mb-1">Llene los siguientes campos</h6>
                                                    <span>8 caracteres como minimo, incluya mayusculas, simbolos y numeros</span>
                                                </div>
                                                <div class="row">
                                                    <div class="mb-3 col-12 col-sm-6 form-password-toggle">
                                                        <label class="form-label" for="newPassword">Nueva Contraseña</label>
                                                        <div class="input-group input-group-merge">
                                                            <input class="form-control" type="password" id="newPassword" name="newPassword" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;" />
                                                            <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                                                        </div>
                                                    </div>

                                                    <div class="mb-3 col-12 col-sm-6 form-password-toggle">
                                                        <label class="form-label" for="confirmPassword">Confirmar contraseña</label>
                                                        <div class="input-group input-group-merge">
                                                            <input class="form-control" type="password" name="confirmPassword" id="confirmPassword" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;" />
                                                            <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <button type="submit" class="btn btn-primary me-2">Cambiar contraseña</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>


                                    <!-- /Project table -->

                                    <!-- Recent Devices -->
                                    <div class="card mb-4">
                                        <h5 class="card-header">Actividad Reciente</h5>
                                        <div class="table-responsive">
                                            <table class="table border-top">
                                                <thead>
                                                    <tr>
                                                        <th class="text-truncate">Navegador</th>
                                                        <th class="text-truncate">Dispositivo</th>
                                                        <th class="text-truncate">Lugar</th>
                                                        <th class="text-truncate">Actividad reciente</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="text-truncate"><i class='bx bxl-windows text-info me-3'></i> <span class="fw-medium">Chrome on Windows</span></td>
                                                        <td class="text-truncate">HP Spectre 360</td>
                                                        <td class="text-truncate">Suiza</td>
                                                        <td class="text-truncate">10 de Julio 2021 20:07</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-truncate"><i class='bx bx-mobile-alt text-danger me-3'></i> <span class="fw-medium">Chrome on iPhone</span></td>
                                                        <td class="text-truncate">iPhone 12x</td>
                                                        <td class="text-truncate">Peru</td>
                                                        <td class="text-truncate">13 de Julio 2021 10:10</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-truncate"><i class='bx bxl-android text-success me-3'></i> <span class="fw-medium">Chrome on Android</span></td>
                                                        <td class="text-truncate">Oneplus 9 Pro</td>
                                                        <td class="text-truncate">Peru</td>
                                                        <td class="text-truncate">14 de Julio 2021 15:15</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-truncate"><i class='bx bxl-apple me-3'></i> <span class="fw-medium">Chrome on MacOS</span></td>
                                                        <td class="text-truncate">Apple iMac</td>
                                                        <td class="text-truncate">Peru</td>
                                                        <td class="text-truncate">16 de Julio 2021 16:17</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-truncate"><i class='bx bxl-windows text-info me-3'></i> <span class="fw-medium">Chrome on Windows</span></td>
                                                        <td class="text-truncate">HP Spectre 360</td>
                                                        <td class="text-truncate">Peru</td>
                                                        <td class="text-truncate">20 de Julio 2021 21:01</td>
                                                    </tr>
                                                    <tr class="border-transparent">
                                                        <td class="text-truncate"><i class='bx bxl-android text-success me-3'></i> <span class="fw-medium">Chrome on Android</span></td>
                                                        <td class="text-truncate">Oneplus 9 Pro</td>
                                                        <td class="text-truncate">Peru</td>
                                                        <td class="text-truncate">21 de Julio 2021 12:22</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <!--/ Recent Devices -->


                                </div>
                                <!--/ User Content -->
                            </div>

                            <!-- Modal -->

                            <!-- Add New Credit Card Modal -->
                            <div class="modal fade" id="upgradePlanModal" tabindex="-1" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered modal-simple modal-upgrade-plan">
                                    <div class="modal-content p-3 p-md-5">
                                        <div class="modal-body">
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            <div class="text-center mb-4">
                                                <h3>Upgrade Plan</h3>
                                                <p>Choose the best plan for user.</p>
                                            </div>
                                            <form id="upgradePlanForm" class="row g-3" onsubmit="return false">
                                                <div class="col-sm-9">
                                                    <label class="form-label" for="choosePlan">Choose Plan</label>
                                                    <select id="choosePlan" name="choosePlan" class="form-select" aria-label="Choose Plan">
                                                        <option selected>Choose Plan</option>
                                                        <option value="standard">Standard - $99/month</option>
                                                        <option value="exclusive">Exclusive - $249/month</option>
                                                        <option value="Enterprise">Enterprise - $499/month</option>
                                                    </select>
                                                </div>
                                                <div class="col-sm-3 d-flex align-items-end">
                                                    <button type="submit" class="btn btn-primary">Upgrade</button>
                                                </div>
                                            </form>
                                        </div>
                                        <hr class="mx-md-n5 mx-n3">
                                        <div class="modal-body">
                                            <h6 class="mb-0">User current plan is standard plan</h6>
                                            <div class="d-flex justify-content-between align-items-center flex-wrap">

                                                <button class="btn btn-label-danger cancel-subscription mt-3">Cancel Subscription</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="content-backdrop fade"></div>
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
                    <!-- Content wrapper -->
                </div>
                <!-- / Layout page -->
            </div>



            <!-- Overlay -->
            <div class="layout-overlay layout-menu-toggle"></div>


            <!-- Drag Target Area To SlideIn Menu On Small Screens -->

        </div>
        <!-- / Layout wrapper -->





        <!-- Core JS -->
        <!-- build:js assets/vendor/js/core.js -->

        <script src="../../assets/vendor/libs/jquery/jquery.js"></script>
        <script src="../../assets/vendor/libs/popper/popper.js"></script>
        <script src="../../assets/vendor/js/bootstrap.js"></script>
        <script src="../../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
        <script src="../../assets/vendor/libs/hammer/hammer.js"></script>
        <script src="../../assets/vendor/libs/i18n/i18n.js"></script>
        <script src="../../assets/vendor/libs/typeahead-js/typeahead.js"></script>
        <script src="../../assets/vendor/js/menu.js"></script>

        <!-- endbuild -->

        <!-- Vendors JS -->
        <script src="../../assets/vendor/libs/moment/moment.js"></script>
        <script src="../../assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
        <script src="../../assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
        <script src="../../assets/vendor/libs/cleavejs/cleave.js"></script>
        <script src="../../assets/vendor/libs/cleavejs/cleave-phone.js"></script>
        <script src="../../assets/vendor/libs/select2/select2.js"></script>
        <script src="../../assets/vendor/libs/%40form-validation/popular.js"></script>
        <script src="../../assets/vendor/libs/%40form-validation/bootstrap5.js"></script>
        <script src="../../assets/vendor/libs/%40form-validation/auto-focus.js"></script>

        <!-- Main JS -->
        <script src="../../assets/js/main.js"></script>


        <!-- Page JS -->
        <script src="../../assets/js/modal-edit-user.js"></script>
        <script src="../../assets/js/app-user-view.js"></script>
        <script src="../../assets/js/app-user-view-account.js"></script>
        <script src="../../assets/js/modal-enable-otp.js"></script>
        <script src="../../assets/js/app-user-view-security.js"></script>

    </body>


    <!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/app-user-view-account.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:14:41 GMT -->
</html>
