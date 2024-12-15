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

                                    <form id="formValidationEx" class="row g-3">
                                        <div class="col-md-6">
                                            <label class="form-label" for="formValidationName">Nombre</label>
                                            <input type="text" id="formValidationName" class="form-control" placeholder="Nombres Completos" name="formValidationName" required minlength="2" maxlength="30" />
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label" for="formValidationApellido">Apellido</label>
                                            <input type="text" id="formValidationApellido" class="form-control" placeholder="Apellidos Completos" name="formValidationApellido" required minlength="2" maxlength="30" />
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label" for="formValidationdni">DNI</label>
                                            <input type="text" id="formValidationdni" class="form-control" placeholder="Documento de identidad" name="formValidationdni" required pattern="\d{8}" title="Debe contener exactamente 8 dígitos" />
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label" for="phoneNumber">Teléfono</label>
                                            <div class="input-group">
                                                <input type="text" id="countryCode" class="form-control" placeholder="+51" name="countryCode" required maxlength="3" />
                                                <input type="text" id="phoneNumber" class="form-control" placeholder="Número de teléfono" name="phoneNumber" required pattern="\d{9}" title="Debe contener exactamente 9 dígitos" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label" for="formValidationEmail">Correo Electrónico</label>
                                            <input class="form-control" type="email" id="formValidationEmail" name="formValidationEmail" placeholder="usuario@gmail.com" required />
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label" for="formValidationPass">Contraseña</label>
                                            <input class="form-control" type="password" id="formValidationPass" name="formValidationPass" required minlength="8" placeholder="Contraseña" />
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label" for="formValidationConfirmPass">Confirmar Contraseña</label>
                                            <input class="form-control" type="password" id="formValidationConfirmPass" name="formValidationConfirmPass" required oninput="this.setCustomValidity(this.value !== document.getElementById('formValidationPass').value ? 'Las contraseñas no coinciden' : '')" placeholder="Confirmar Contraseña" />
                                        </div>
                                        <div class="col-md-6">
                                            <label for="avatar" class="form-label">Avatar</label>
                                            <input class="form-control" type="file" id="avatar" name="avatar" accept=".jpg,.png,.jpeg" />
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label" for="formValidationDob">Fecha de Nacimiento</label>
                                            <input type="text" class="form-control" name="formValidationDob" id="formValidationDob" placeholder="dd/mm/aaaa" required pattern="\d{2}/\d{2}/\d{4}" />
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label" for="formValidationSelect2">Zona Asignada</label>
                                            <select id="formValidationSelect2" name="formValidationSelect2" class="form-select select2" required>
                                                <option value="">Seleccione</option>
                                                <option value="Norte">Norte</option>
                                                <option value="Sur">Sur</option>
                                                <option value="Este">Este</option>
                                                <option value="Oeste">Oeste</option>
                                            </select>
                                        </div>
                                        <div class="col-md-12">
                                            <fieldset>
                                                <legend class="form-label">Género:</legend>
                                                <div class="form-check">
                                                    <input type="radio" id="genderMale" name="gender" value="Masculino" class="form-check-input" required />
                                                    <label for="genderMale" class="form-check-label">Masculino</label>
                                                </div>
                                                <div class="form-check">
                                                    <input type="radio" id="genderFemale" name="gender" value="Femenino" class="form-check-input" />
                                                    <label for="genderFemale" class="form-check-label">Femenino</label>
                                                </div>
                                                <div class="form-check">
                                                    <input type="radio" id="genderUndefined" name="gender" value="No definido" class="form-check-input" />
                                                    <label for="genderUndefined" class="form-check-label">No definido</label>
                                                </div>
                                            </fieldset>
                                        </div>
                                        <div class="col-md-12">
                                            <button type="submit" class="btn btn-primary">Crear Coordinador</button>
                                        </div>
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

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const form = document.getElementById("formValidationEx");

        // Inicializar validaciones para todos los campos
        const fv = FormValidation.formValidation(form, {
            fields: {
                formValidationName: {
                    validators: {
                        notEmpty: { message: "Por favor ingresa tu nombre" },
                        stringLength: { min: 2, max: 30, message: "Debe tener entre 2 y 30 caracteres" },
                        regexp: { regexp: /^[a-zA-Z\s]+$/, message: "Solo puede contener letras" },
                    },
                },
                formValidationApellido: {
                    validators: {
                        notEmpty: { message: "Por favor ingresa tu apellido" },
                        regexp: { regexp: /^[a-zA-Z\s]+$/, message: "Solo puede contener letras" },
                    },
                },
                formValidationdni: {
                    validators: {
                        notEmpty: { message: "Por favor ingresa tu DNI" },
                        regexp: { regexp: /^\d{8}$/, message: "Debe contener 8 dígitos" },
                    },
                },
                phoneNumber: {
                    validators: {
                        notEmpty: { message: "Por favor ingresa tu teléfono" },
                        regexp: { regexp: /^\d{9}$/, message: "Debe contener 9 dígitos" },
                    },
                },
                countryCode: {
                    validators: {
                        notEmpty: { message: "Por favor ingresa el código de país" },
                        stringLength: { max: 3, message: "El código de país no puede exceder 3 caracteres" },
                    },
                },
                formValidationEmail: {
                    validators: {
                        notEmpty: { message: "Por favor ingresa tu correo" },
                        emailAddress: { message: "El correo no es válido" },
                    },
                },
                formValidationPass: {
                    validators: {
                        notEmpty: { message: "Por favor ingresa tu contraseña" },
                        stringLength: { min: 8, message: "La contraseña debe tener al menos 8 caracteres" },
                    },
                },
                formValidationConfirmPass: {
                    validators: {
                        notEmpty: { message: "Por favor confirma tu contraseña" },
                        identical: {
                            compare: function () {
                                return form.querySelector('[name="formValidationPass"]').value;
                            },
                            message: "Las contraseñas no coinciden",
                        },
                    },
                },
                avatar: {
                    validators: {
                        notEmpty: { message: "Por favor, ingresa una foto" },
                        file: {
                            extension: "jpg,jpeg,png",
                            type: "image/jpeg,image/png",
                            message: "El archivo debe ser una imagen válida (JPG, JPEG o PNG)",
                        },
                    },
                },
                formValidationDob: {
                    validators: {
                        notEmpty: { message: "Por favor ingresa tu fecha de nacimiento" },
                        regexp: { regexp: /^\d{2}\/\d{2}\/\d{4}$/, message: "Formato de fecha no válido (dd/mm/aaaa)" },
                    },
                },
                formValidationSelect2: {
                    validators: {
                        notEmpty: { message: "Por favor selecciona una zona asignada" },
                    },
                },
                gender: {
                    validators: {
                        notEmpty: { message: "Por favor selecciona tu género" },
                    },
                },
            },
            plugins: {
                trigger: new FormValidation.plugins.Trigger(),
                bootstrap5: new FormValidation.plugins.Bootstrap5({
                    rowSelector: ".col-md-6, .col-md-12",
                }),
                submitButton: new FormValidation.plugins.SubmitButton(),
                defaultSubmit: new FormValidation.plugins.DefaultSubmit(),
            },
        });

        // Agregar funcionalidad para enviar los datos
        form.addEventListener("submit", function (e) {
            e.preventDefault();

            fv.validate().then(function (status) {
                if (status === "Valid") {
                    const formData = new FormData(form);

                    fetch("/crearCoordinador", {
                        method: "POST",
                        body: formData,
                    })
                        .then((response) => {
                            if (response.ok) {
                                Swal.fire("Éxito", "El coordinador ha sido creado con éxito.", "success");
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


