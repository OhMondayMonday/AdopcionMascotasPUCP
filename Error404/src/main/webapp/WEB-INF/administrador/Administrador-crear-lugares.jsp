<%@ page import="java.util.List" %>
<%@ page import="Beans.Solicitudes" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="<%=request.getContextPath()%>/assets/" data-template="vertical-menu-template-semi-dark">


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:06 GMT -->
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Alianza Animal || Lugares Registrados</title>


    <meta name="description" content="Most Powerful &amp; Comprehensive Bootstrap 5 Admin Dashboard built for developers!" />
    <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
    <!-- Canonical SEO -->
    <link rel="canonical" href="https://themeselection.com/item/sneat-dashboard-pro-bootstrap/">


    <!-- ? PROD Only: Google Tag Manager (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
            new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
        j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
        '<%=request.getContextPath()%>/www.googletagmanager.com/gtm5445.html?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-5DDHKGP');</script>
    <!-- End Google Tag Manager -->


    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>\assets\img\logo_Alianza_Animal_-removebg-preview.png" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icons -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/fonts/boxicons.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/fonts/fontawesome.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/fonts/flag-icons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/css/rtl/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/css/rtl/theme-semi-dark.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/demo.css" />

    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.2.2/css/buttons.bootstrap5.min.css">

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/typeahead-js/typeahead.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/quill/typography.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/quill/katex.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/quill/editor.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/select2/select2.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/dropzone/dropzone.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/flatpickr/flatpickr.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/tagify/tagify.css" />

    <!-- Page CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/css/pages/page-faq.css" />


    <!-- Helpers -->
    <script src="<%=request.getContextPath()%>/assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->

    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="<%=request.getContextPath()%>/assets/js/config.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/vendor/js/helpers.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/config.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


    <style>
        /* Asegúrate de que el body ocupe toda la altura de la pantalla */
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        /* El contenedor principal ocupará el espacio restante */
        .main-content {
            flex: 1;  /* Esto asegura que ocupe el espacio restante */
            padding: 20px;
            overflow: auto; /* Si el contenido es largo, permitirá hacer scroll */
        }

        /* Footer fijo al fondo de la página */
        footer {
            padding: 10px 0;
            text-align: center;
            background-color: #d4edda; /* Fondo verde suave para el footer */
        }


    </style>

    <style>




        td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #dee2e6;
            color: #444;
        }

        tr:nth-child(even) {
            background-color: #eef2f3;
        }

        tr:nth-child(odd) {
            background-color: #fdfdfd;
        }



        table tbody tr td:last-child {
            font-weight: bold;
            color: #28a745;
        }
        .footer-link {
            color: #767070; /* Color que prefieras para el texto del footer */
            text-decoration: none; /* Elimina el subrayado */
        }
    </style>




    <style>

        body, footer {
            background-color: #d4edda; /* Verde suave */
            margin: 0;
            padding: 0;
        }

        /* Footer específico */
        .bg-footer-theme {
            background-color: #d4edda !important; /* Verde suave con !important para sobrescribir */
        }

        /* Estilo del footer */
        footer {
            padding: 10px 0;
            text-align: center;
            background-color: #d4edda; /* Fondo verde suave para el footer */
        }
    </style>

    <style>
        /* Ajustar el margen entre la tabla y la paginación */
        .dataTables_wrapper .dataTables_info,
        .dataTables_wrapper .dataTables_paginate {
            margin-top: 0;
            padding-top: 0;
        }

        /* Alinea el texto de 'Mostrando entradas' y la paginación en la misma línea */
        .dataTables_wrapper .dataTables_info {
            display: inline-block;
            margin-right: 10px;
        }

        .dataTables_wrapper .dataTables_paginate {
            display: inline-block;
            float: right;
        }



    </style>



</head>

<body>


<!-- ?PROD Only: Google Tag Manager (noscript) (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">

        <aside>
            <!-- Sidebar aquí si es necesario -->
            <jsp:include page="../includes/sidebarAdmin.jsp"/>
        </aside>

        <div class="layout-page">

            <nav>
                <jsp:include page="../includes/navbarAdmin.jsp">
                    <jsp:param name="vista" value="Registro de Donaciones"/>
                </jsp:include>
            </nav>

            <div class="content-wrapper">
                <div class="container-xxl flex-grow-1 container-p-y">
                    <div class="row">

                        <div class="col-12">
                            <div class="card">

                                <div class="card-body">

                                    <form id="formCrearLugar" class="needs-validation" novalidate>
                                        <!-- Nombre del Lugar -->
                                        <div class="mb-3">
                                            <label for="nombreLugar" class="form-label">Nombre del Lugar</label>
                                            <input type="text" class="form-control" id="nombreLugar" name="nombreLugar" required>
                                        </div>

                                        <!-- Dirección -->
                                        <div class="mb-3">
                                            <label for="direccion" class="form-label">Dirección</label>
                                            <input type="text" class="form-control" id="direccion" name="direccion" required>
                                        </div>

                                        <!-- Distrito -->
                                        <div class="mb-3">
                                            <label for="distrito" class="form-label">Distrito</label>
                                            <select class="form-select" id="distrito" name="distrito" required>
                                                <option value="">Selecciona un distrito</option>
                                                <option value="distrito1">Distrito 1</option>
                                                <option value="distrito2">Distrito 2</option>
                                                <option value="distrito3">Distrito 3</option>
                                            </select>
                                        </div>

                                        <!-- Capacidad Máxima -->
                                        <div class="mb-3">
                                            <label for="capacidadMaxima" class="form-label">Capacidad Máxima</label>
                                            <input type="number" class="form-control" id="capacidadMaxima" name="capacidadMaxima" required>
                                        </div>

                                        <!-- Descripción -->
                                        <div class="mb-3">
                                            <label for="descripcion" class="form-label">Descripción</label>
                                            <textarea class="form-control" id="descripcion" name="descripcion" rows="4" required></textarea>
                                        </div>

                                        <!-- Imagen -->
                                        <div class="mb-3">
                                            <label for="imagen" class="form-label">Imagen de Referencia</label>
                                            <input type="file" class="form-control" id="imagen" name="imagen" accept="image/*" required>
                                        </div>

                                        <button type="submit" class="btn btn-primary w-100">Crear Lugar</button>
                                    </form>

                                </div>
                            </div>
                        </div>
                        <!-- /FormValidation -->
                    </div>
                </div>
            </div>
            <footer class="footer bg-footer-theme">
                <div class="container-fluid d-flex flex-md-row flex-column justify-content-between align-items-md-center gap-1 container-p-x py-3">
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
        </div>
    </div>
</div>




<!-- Core JS -->

<!-- build:js assets/vendor/js/core.js -->
<script src="<%=request.getContextPath()%>/assets/vendor/libs/%40form-validation/popular.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/%40form-validation/bootstrap5.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/%40form-validation/auto-focus.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/select2/select2.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/jquery/jquery.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/popper/popper.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/hammer/hammer.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/i18n/i18n.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/typeahead-js/typeahead.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/js/menu.js"></script>

<!-- endbuild -->



<script src="<%=request.getContextPath()%>/assets/vendor/libs/apex-charts/apexcharts.js"></script>


<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>

<script src="<%=request.getContextPath()%>/assets/js/dashboards-analytics.js"></script>

<script src="<%=request.getContextPath()%>/assets/js/extended-ui-sweetalert2.js"></script>

<script src="<%=request.getContextPath()%>/assets/vendor/libs/%40form-validation/popular.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/%40form-validation/bootstrap5.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/%40form-validation/auto-focus.js"></script>


<script>
    document.addEventListener("DOMContentLoaded", function () {
        const form = document.getElementById("formCrearLugar");

        // Inicializar validación de formulario
        const fv = FormValidation.formValidation(form, {
            fields: {
                nombreLugar: {
                    validators: {
                        notEmpty: { message: "Por favor ingresa el nombre del lugar" },
                        stringLength: { min: 2, max: 50, message: "Debe tener entre 2 y 50 caracteres" }
                    },
                },
                direccion: {
                    validators: {
                        notEmpty: { message: "Por favor ingresa la dirección" },
                        stringLength: { min: 5, message: "La dirección debe tener al menos 5 caracteres" }
                    },
                },
                distrito: {
                    validators: {
                        notEmpty: { message: "Por favor selecciona un distrito" },
                    },
                },
                capacidadMaxima: {
                    validators: {
                        notEmpty: { message: "Por favor ingresa la capacidad máxima" },
                        numeric: { message: "La capacidad máxima debe ser un número" }
                    },
                },
                descripcion: {
                    validators: {
                        notEmpty: { message: "Por favor ingresa una descripción" },
                    },
                },
                imagen: {
                    validators: {
                        notEmpty: { message: "Por favor, ingresa una imagen" },
                        file: {
                            extension: "jpg,jpeg,png",
                            type: "image/jpeg,image/png",
                            message: "El archivo debe ser una imagen válida (JPG, JPEG o PNG)"
                        },
                    },
                },
            },
            plugins: {
                bootstrap5: new FormValidation.plugins.Bootstrap5({
                    rowSelector: ".mb-3",
                }),
            },
        });

        // Enviar el formulario
        form.addEventListener("submit", function (e) {
            e.preventDefault();

            fv.validate().then(function (status) {
                if (status === "Valid") {
                    const formData = new FormData(form);
                    fetch("/crearLugar", {
                        method: "POST",
                        body: formData,
                    })
                        .then((response) => {
                            if (response.ok) {
                                Swal.fire("Éxito", "El lugar ha sido creado con éxito.", "success");
                                form.reset();
                            } else {
                                Swal.fire("Error", "Hubo un problema al enviar el formulario.", "error");
                            }
                        })
                        .catch(() => {
                            Swal.fire("Error", "No se pudo conectar con el servidor.", "error");
                        });
                } else {
                    Swal.fire("Error", "Por favor, corrige los errores antes de enviar.", "error");
                }
            });
        });
    });
</script>



</body>



<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:07 GMT -->
</html>
