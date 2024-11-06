<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%@ page import="Beans.Usuarios"%>
<%@ page import="Beans.Publicaciones"%>
<%@ page import="Beans.Roles"%>

<jsp:useBean id="usuario" class="Beans.Usuarios" scope="request" />
<jsp:useBean id="rol" class="Beans.Roles" scope="request" />

<jsp:setProperty name="usuario" property="*" />
<jsp:setProperty name="rol" property="*" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="../../assets/" data-template="vertical-menu-template-semi-dark">


    <!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:06 GMT -->
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

        <title>Lista de Eventos</title>


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
        <link rel="stylesheet" href="../../assets/vendor/fonts/boxicons.css" />
        <link rel="stylesheet" href="../../assets/vendor/fonts/fontawesome.css" />
        <link rel="stylesheet" href="../../assets/vendor/fonts/flag-icons.css" />

        <!-- Core CSS -->
        <link rel="stylesheet" href="../../assets/vendor/css/rtl/core.css" class="template-customizer-core-css" />
        <link rel="stylesheet" href="../../assets/vendor/css/rtl/theme-semi-dark.css" class="template-customizer-theme-css" />
        <link rel="stylesheet" href="../../assets/css/demo.css" />

        <!-- Vendors CSS -->
        <link rel="stylesheet" href="../../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
        <link rel="stylesheet" href="../../assets/vendor/libs/typeahead-js/typeahead.css" />
        <link rel="stylesheet" href="../../assets/vendor/libs/quill/typography.css">
        <link rel="stylesheet" href="../../assets/vendor/libs/quill/katex.css">
        <link rel="stylesheet" href="../../assets/vendor/libs/quill/editor.css">
        <link rel="stylesheet" href="../../assets/vendor/libs/select2/select2.css">
        <link rel="stylesheet" href="../../assets/vendor/libs/dropzone/dropzone.css">
        <link rel="stylesheet" href="../../assets/vendor/libs/flatpickr/flatpickr.css">
        <link rel="stylesheet" href="../../assets/vendor/libs/tagify/tagify.css" />
        <link rel="stylesheet" href="../../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
        <link rel="stylesheet" href="../../assets/vendor/libs/typeahead-js/typeahead.css" />
        <link rel="stylesheet" href="../../assets/vendor/libs/quill/typography.css" />
        <link rel="stylesheet" href="../../assets/vendor/libs/quill/katex.css" />
        <link rel="stylesheet" href="../../assets/vendor/libs/quill/editor.css" />

        <!-- Page CSS -->

        <link rel="stylesheet" href="../../assets/vendor/css/pages/page-faq.css" />

        <!-- Helpers -->
        <script src="../../assets/vendor/js/helpers.js"></script>
        <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
        <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->

        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
        <script src="../../assets/js/config.js"></script>

    </head>
    <body>


        <!-- ?PROD Only: Google Tag Manager (noscript) (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
        <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
        <!-- End Google Tag Manager (noscript) -->

        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">

                <div class="layout-page">

                    <div class="content-wrapper">

                        <!-- Content -->

                        <div class="container-xxl flex-grow-1 container-p-y">


                            <h4 class="py-3 mb-4">
                                <span class="text-muted fw-light"></span> Mis Eventos
                            </h4>

                            <!-- Basic Bootstrap Table -->
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6 d-flex align-items-center">
                                            <h5 class="card-title mb-0">Registro de Eventos</h5>
                                        </div>

                                        <!-- Columna para el campo de búsqueda alineado a la derecha -->
                                        <div class="col-md-6 d-flex justify-content-end align-items-center">
                                            <div class="search-container">
                                                <label for="search" class="me-2">Buscar:</label>
                                                <input type="search" id="search" class="form-control" placeholder="Buscar...">
                                            </div>
                                        </div>

                                        <div class="table-responsive text-nowrap">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>Tipo</th>
                                                        <th>Albergue</th>
                                                        <th>Usuario</th>
                                                        <th>Titulo</th>
                                                        <th>Fecha</th>
                                                        <th>Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="table-border-bottom-0">
                                                    <tr>
                                                        <td><i class='bx bxs-donate-heart'></i> <span class="fw-medium">Vacunacion</span></td>
                                                        <td>Animalitos</td>
                                                        <td>
                                                            <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">

                                                                <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="Albergue">
                                                                    <img src="../../assets/img/avatars/6.png" alt="Avatar" class="rounded-circle">
                                                                </li>

                                                            </ul>
                                                        </td>
                                                        <td class="titulo-rosado"> Vancan: Campaña Antirrabica 2024</td>
                                                        <td> 10-09-2024 </td>
                                                        <td>

                                                            <div class="card-body p-0">
                                                                <div class="d-inline-flex">
                                                                    <button type="button" class="btn btn-danger btn-sm rounded-circle" style="margin-right: 15px;">
                                                                        <i class="bx bx-x"></i>
                                                                    </button>
                                                                    <button type="button" class="btn btn-sm btn-warning">Editar</button>
                                                                </div>
                                                            </div>


                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><i class="bx bxs-donate-heart"></i> <span class="fw-medium">Dinero</span></td>
                                                        <td>Perritos Unidos</td>
                                                        <td>
                                                            <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">

                                                                <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="Albergue">
                                                                    <img src="../../assets/img/avatars/6.png" alt="Avatar" class="rounded-circle">
                                                                </li>

                                                            </ul>
                                                        </td>
                                                        <td class="titulo-rosado"> Adopcion de mascotas II</td>
                                                        <td> 10-08-2024 </td>
                                                        <td>
                                                            <div class="card-body p-0">
                                                                <div class="d-inline-flex">
                                                                    <button type="button" class="btn btn-sm btn-danger me-1">Eliminar</button>
                                                                    <button type="button" class="btn btn-sm btn-warning">Editar</button>
                                                                </div>
                                                            </div>

                                        </div>
                                        </td>
                                        </tr>

                                        <tr>

                                        </tr>
                                        <td><i class="bx bxs-donate-heart"></i> <span class="fw-medium">Comida</span></td>
                                        <td>Gatitos Unidos</td>
                                        <td>
                                            <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">

                                                <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="Albergue">
                                                    <img src="../../assets/img/avatars/6.png" alt="Avatar" class="rounded-circle">
                                                </li>

                                            </ul>
                                        </td>
                                        <td class="titulo-rosado"> Campaña de Donaciones de Comida</td>
                                        <td>
                                            15-09-2024
                                        <td>
                                            <div class="card-body p-0">
                                                <div class="d-inline-flex">
                                                    <button type="button" class="btn btn-sm btn-danger me-1">Eliminar</button>
                                                    <button type="button" class="btn btn-sm btn-warning">Editar</button>
                                                </div>
                                            </div>

                                        </td>
                                        </td>
                                        </tr>
                                        <tr>
                                            <td><i class="bx bxs-donate-heart"></i> <span class="fw-medium">Insumos</span></td>
                                            <td>Conejitos Unidos</td>
                                            <td>
                                                <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">

                                                    <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="Albergue">
                                                        <img src="../../assets/img/avatars/6.png" alt="Avatar" class="rounded-circle">
                                                    </li>

                                                </ul>
                                            </td>
                                            <td class="titulo-rosado"> Gran concurso de mascotas</td>
                                            <td>
                                                15-09-2024
                                            <td>
                                                <div class="card-body p-0">
                                                    <div class="d-inline-flex">
                                                        <button type="button" class="btn btn-sm btn-danger me-1">Eliminar</button>
                                                        <button type="button" class="btn btn-sm btn-warning">Editar</button>
                                                    </div>
                                                </div>

                                            </td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><i class="bx bxs-donate-heart"></i> <span class="fw-medium">Campaña Esterilizacion</span></td>
                                            <td>Godzila Nicola</td>
                                            <td>
                                                <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">

                                                    <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="Albergue">
                                                        <img src="../../assets/img/avatars/6.png" alt="Avatar" class="rounded-circle">
                                                    </li>

                                                </ul>
                                            </td>
                                            <td class="titulo-rosado">Tercera Campaña Nacional de Esterilizacion</td>

                                            <td>
                                                20-09-2024
                                            <td>
                                                <div class="card-body p-0">
                                                    <div class="d-inline-flex">
                                                        <button type="button" class="btn btn-sm btn-danger me-1">Eliminar</button>
                                                        <button type="button" class="btn btn-sm btn-warning">Editar</button>
                                                    </div>
                                                </div>

                                            </td>
                                            </td>
                                            </tbody>
                                            </table>




                                    </div>
                                    <div class="row">
                                        <div class="col-12 d-flex justify-content-center mt-3">
                                            <ul class="pagination">
                                                <li class="paginate_button page-item previous disabled">
                                                    <a href="#" class="page-link">&laquo;</a>
                                                </li>
                                                <li class="paginate_button page-item">
                                                    <a href="#" class="page-link">1</a>
                                                </li>
                                                <li class="paginate_button page-item">
                                                    <a href="#" class="page-link">2</a>
                                                </li>
                                                <li class="paginate_button page-item">
                                                    <a href="#" class="page-link">3</a>
                                                </li>
                                                <li class="paginate_button page-item">
                                                    <a href="#" class="page-link">4</a>
                                                </li>
                                                <li class="paginate_button page-item">
                                                    <a href="#" class="page-link">5</a>
                                                </li>
                                                <li class="paginate_button page-item disabled">
                                                    <a href="#" class="page-link">...</a>
                                                </li>
                                                <li class="paginate_button page-item">
                                                    <a href="#" class="page-link">15</a>
                                                </li>
                                                <li class="paginate_button page-item next">
                                                    <a href="#" class="page-link">&raquo;</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <!--/ Basic Bootstrap Table -->

                            </div>
                            <!-- / Content -->




                            <!-- Footer -->

                            <!-- / Footer -->

                            <div class="content-backdrop fade"></div>
                        </div>
                    </div>
                    <!-- / Layout wrapper -->
                </div>
                <!-- / Layout page -->
            </div>

        </div>
        <!-- /Layout wrapper -->

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

        <script src="../../assets/vendor/libs/quill/katex.js"></script>
        <script src="../../assets/vendor/libs/quill/quill.js"></script>
        <script src="../../assets/vendor/libs/select2/select2.js"></script>
        <script src="../../assets/vendor/libs/bootstrap-select/bootstrap-select.js"></script>
        <script src="../../assets/vendor/libs/typeahead-js/typeahead.js"></script>
        <script src="../../assets/vendor/libs/bloodhound/bloodhound.js"></script>
        <script src="../../assets/vendor/libs/dropzone/dropzone.js"></script>
        <script src="../../assets/vendor/libs/jquery-repeater/jquery-repeater.js"></script>
        <script src="../../assets/vendor/libs/flatpickr/flatpickr.js"></script>
        <script src="../../assets/vendor/libs/tagify/tagify.js"></script>

        <!-- Main JS -->
        <script src="../../assets/js/main.js"></script>
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

        <script src="../../assets/js/app-ecommerce-product-add.js"></script>
        <script src="../../assets/js/forms-selects.js"></script>
        <script src="../../assets/js/forms-tagify.js"></script>
        <script src="../../assets/js/forms-typeahead.js"></script>


    </body>



    <!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:07 GMT -->
</html>

<!-- beautify ignore:end -->