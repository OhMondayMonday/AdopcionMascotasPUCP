<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.GsonBuilder" %>
<%
    Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX").create();

    String eventosInscritosJson = gson.toJson(request.getAttribute("eventosInscritos"));
    String eventosNoInscritosJson = gson.toJson(request.getAttribute("eventosNoInscritos"));
%>

<!DOCTYPE html>

<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="../../assets/" data-template="vertical-menu-template-semi-dark">


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/app-calendar.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:14:00 GMT -->
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Mi Calendario</title>


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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/fullcalendar/fullcalendar.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/flatpickr/flatpickr.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/quill/editor.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/form-validation.css" />

    <!-- Page CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/pages/app-calendar.css" />

    <style>
        .calendar-contenedor::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }

        .calendar-contenedor::-webkit-scrollbar-track {
            background: #f0f0f0;
            border-radius: 10px;
        }

        .calendar-contenedor::-webkit-scrollbar-thumb {
            background: rgba(67, 60, 81, 0.79);
            border-radius: 10px;
            border: 2px solid #f0f0f0;
        }

        .calendar-contenedor::-webkit-scrollbar-thumb:hover {
            background: #555;
        }
    </style>

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/flatpickr@4.6.9/dist/l10n/es.js"></script>

</head>

<body style="background-color: #d4e1ffa9;">


<!-- ?PROD Only: Google Tag Manager (noscript) (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar  ">
    <div class="layout-container">

        <!-- Sidebar -->
        <jsp:include page="../includes/sidebarUF.jsp" />
        <!-- / Sidebar -->

        <!-- Layout container -->
        <div class="layout-page">

            <!-- Navbar -->
            <jsp:include page="../includes/navbarUF.jsp" />
            <!-- / Navbar -->

            <!-- Content wrapper -->
            <div class="content-wrapper">

                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">
                    <!-- Calendario -->
                    <div class="card app-calendar-wrapper">
                        <div class="row g-0">
                            <!-- Calendar Sidebar -->
                            <div class="col app-calendar-sidebar" id="app-calendar-sidebar">
                                <div class="border-bottom p-4 my-sm-0 mb-3">
                                    <div class="d-grid">
                                        <span class="align-middle fw-semibold"><i class="bx bx-calendar-heart fs-4"></i> Mi calendario personal</span>
                                    </div>
                                </div>
                                <div class="p-4">
                                    <!-- inline calendar (flatpicker) -->
                                    <div class="ms-n2">
                                        <div class="inline-calendar"></div>
                                    </div>

                                    <hr class="container-m-nx my-4">

                                    <!-- Filter -->
                                    <div class="mb-4">
                                        <small class="text-small text-muted text-uppercase align-middle">Filtros</small>
                                    </div>

                                    <div class="form-check form-check-info mb-2 mx-4">
                                        <input class="form-check-input select-all" type="checkbox" id="selectAll" data-value="all" checked>
                                        <label class="form-check-label" for="selectAll">Seleccionar todo</label>
                                    </div>

                                    <div class="app-calendar-events-filter mx-4">
                                        <div class="form-check mb-2">
                                            <input class="form-check-input input-filter" type="checkbox" id="select-business" data-value="business" checked>
                                            <label class="form-check-label" for="select-business">No inscrito</label>
                                        </div>
                                        <div class="form-check form-check-success mb-2">
                                            <input class="form-check-input input-filter" type="checkbox" id="select-holiday" data-value="holiday" checked>
                                            <label class="form-check-label" for="select-holiday">Inscrito</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Calendar Sidebar -->

                            <!-- Calendar & Modal -->
                            <div class="col app-calendar-content">
                                <div class="card shadow-none border-0">
                                    <div class="card-body pb-0 calendar-contenedor" style="overflow-y: auto">
                                        <!-- FullCalendar -->
                                        <div id="calendar"></div>
                                    </div>
                                </div>
                                <div class="app-overlay"></div>
                                <!-- FullCalendar Offcanvas -->
                                <div class="offcanvas offcanvas-end event-sidebar" tabindex="-1" id="addEventSidebar" aria-labelledby="addEventSidebarLabel">
                                </div>
                            </div>
                            <!-- /Calendar & Modal -->
                        </div>
                    </div>
                    <!-- /Calendario -->
                </div>
                <!-- / Content -->

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



                <div class="content-backdrop fade"></div>
            </div>
            <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
    </div>



    <!-- Overlay -->
    <div class="layout-overlay layout-menu-toggle"></div>


    <!-- Drag Target Area To SlideIn Menu On Small Screens -->
    <div class="drag-target"></div>

</div>
<!-- / Layout wrapper -->

<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->

<script type="text/javascript">
    window.eventosNoInscritos = <%= eventosNoInscritosJson %>;
    window.eventosInscritos = <%= eventosInscritosJson %>;
</script>

<script src="https://cdn.jsdelivr.net/npm/flatpickr@4.6.9/dist/l10n/es.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/5.10.1/locales/es.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/jquery/jquery.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/popper/popper.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/hammer/hammer.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/i18n/i18n.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/js/menu.js"></script>

<!-- Vendors JS -->
<script src="${pageContext.request.contextPath}/assets/vendor/libs/fullcalendar/fullcalendar.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/@form-validation/popular.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/@form-validation/bootstrap5.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/@form-validation/auto-focus.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/moment/moment.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/flatpickr/flatpickr.js"></script>

<!-- Main JS -->
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

<!-- Page JS -->
<script src="${pageContext.request.contextPath}/assets/js/app-calendar-events.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app-calendar.js"></script>

</body>


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/app-calendar.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:14:04 GMT -->
</html>

