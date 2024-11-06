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

        <title>Editar Publicación | Adopción</title>


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
        <link rel="stylesheet" href="../../assets/vendor/libs/bs-stepper/bs-stepper.css" />
        <link rel="stylesheet" href="../../assets/vendor/libs/bootstrap-select/bootstrap-select.css" />
        <link rel="stylesheet" href="../../assets/vendor/libs/select2/select2.css" />
        <link rel="stylesheet" href="../../assets/vendor/libs/%40form-validation/form-validation.css" />
        <link rel="stylesheet" href="../../assets/vendor/libs/quill/typography.css">
        <link rel="stylesheet" href="../../assets/vendor/libs/quill/katex.css">
        <link rel="stylesheet" href="../../assets/vendor/libs/quill/editor.css">
        <link rel="stylesheet" href="../../assets/vendor/libs/dropzone/dropzone.css">
        <link rel="stylesheet" href="../../assets/vendor/libs/flatpickr/flatpickr.css">
        <link rel="stylesheet" href="../../assets/vendor/libs/tagify/tagify.css" />

        <!-- Page CSS -->


        <!-- Helpers -->
        <script src="../../assets/vendor/js/helpers.js"></script>

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

                            <!-- Add Product -->
                            <div class="d-flex flex-wrap justify-content-between align-items-center mb-0">

                                <div class="d-flex flex-column justify-content-center">
                                    <h4 class="mb-1 mt-3">Editar Publicación</h4>
                                    <p class="text-muted">Rellena los campos abajo</p>
                                </div>
                                <div class="d-flex align-content-center flex-wrap gap-3">
                                    <button class="btn btn-info">¡Mascota Adoptada!</button>
                                    <button class="btn btn-danger">Eliminar Publicación</button>
                                    <button class="btn btn-secondary">Descartar Cambios</button>
                                    <button type="submit" class="btn btn-primary">Confirmar Cambios</button>
                                </div>

                            </div>
                            <div class="row">
                                <!-- Default Wizard -->
                                <div class="col-12 mb-2">
                                    <div id = "wizard-validation" class="bs-stepper mt-2">
                                        <div class="bs-stepper-header">
                                            <div class="step" data-target="#datos-publicacion">
                                                <button type="button" class="step-trigger">
                                                    <span class="bs-stepper-circle">1</span>
                                                    <span class="bs-stepper-label mt-1">
                                              <span class="bs-stepper-title">Publicacion</span>
                                              <span class="bs-stepper-subtitle">Datos de la publicacion</span>
                                            </span>
                                                </button>
                                            </div>
                                            <div class="line">
                                                <i class="bx bx-chevron-right"></i>
                                            </div>
                                            <div class="step" data-target="#datos-mascota">
                                                <button type="button" class="step-trigger">
                                                    <span class="bs-stepper-circle">2</span>
                                                    <span class="bs-stepper-label mt-1">
                                              <span class="bs-stepper-title">Datos de la mascota</span>
                                              <span class="bs-stepper-subtitle">Añada información sobre la mascota</span>
                                            </span>
                                                </button>
                                            </div>
                                            <div class="line">
                                                <i class="bx bx-chevron-right"></i>
                                            </div>
                                            <div class="step" data-target="#datos-recepcion">
                                                <button type="button" class="step-trigger">
                                                    <span class="bs-stepper-circle">3</span>
                                                    <span class="bs-stepper-label mt-1">
                                              <span class="bs-stepper-title">Datos de recepcion</span>
                                              <span class="bs-stepper-subtitle">Especifique datos de recepción</span>
                                            </span>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="bs-stepper-content pt-3">
                                            <form id="wizard-validation-form" onSubmit="return false">
                                                <!-- Account Details -->
                                                <div id="datos-publicacion" class="content">
                                                    <div class="content-header mb-2">
                                                        <h6 class="mb-0">Publicacion</h6>
                                                        <small>Ingrese datos de la publicacion</small>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12 col-lg-6">
                                                            <div class="mb-3">
                                                                <label class="form-label" for="formValidationTitulo">Titulo</label>
                                                                <input type="text" class="form-control" id="formValidationTitulo" required name="formValidationTitulo" placeholder="Título de la publicación" aria-label="Titulo publicacion">
                                                            </div>
                                                            <div class="row mb-3">
                                                                <div class="col">
                                                                    <label class="form-label" for="opciones">Tipo</label>
                                                                    <select class="form-control" name="opciones" id="opciones" onchange="cambiarPagina()" required>
                                                                        <option value="" disabled selected>Elija el tipo de publicación</option>
                                                                        <option value="albergue-editar-publicacion-adopcion.html" selected>Adopción</option>
                                                                        <option value="albergue-editar-publicacion-donacion.html" >Donaciones</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12 col-lg-6 mb-3">
                                                            <div class="mb-3">
                                                                <label class="form-label" for="formValidationDescripcion">Descripcion</label>
                                                                <textarea class="form-control" id="formValidationDescripcion" name="formValidationDescripcion" rows="5" required></textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row g-3 mt-1">
                                                        <div class="col-12 d-flex justify-content-between">
                                                            <button class="btn btn-label-secondary btn-prev" disabled>
                                                                <i class="bx bx-chevron-left bx-sm ms-sm-n2"></i>
                                                                <span class="align-middle d-sm-inline-block d-none">Anterior</span>
                                                            </button>
                                                            <button class="btn btn-primary btn-next">
                                                                <span class="align-middle d-sm-inline-block d-none me-sm-1">Siguiente</span>
                                                                <i class="bx bx-chevron-right bx-sm me-sm-n2"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Personal Info -->
                                                <div id="datos-mascota" class="content">
                                                    <div class="content-header mb-2">
                                                        <h6 class="mb-0">Datos de la mascota</h6>
                                                        <small>Ingrese datos sobre la mascota</small>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col">
                                                            <label class="form-label" for="formValidationNombre">Nombre</label>
                                                            <input type="text" required class="form-control" id="formValidationNombre" placeholder="Nombre de la Mascota" name="formValidationNombre" aria-label="Product title">
                                                        </div>
                                                        <div class="col">
                                                            <label class="form-label" for="formValidationEdad">Edad aproximada</label>
                                                            <input type="text" required class="form-control" id="formValidationEdad" placeholder="Indique la Edad de la Mascota" name="formValidationEdad" aria-label="Product title">                  </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col">
                                                            <label class="form-label" for="formValidationRaza">Raza</label>
                                                            <input type="text" class="form-control" id="formValidationRaza" placeholder="Indique la Raza de la Mascota" name="formValidationRaza" aria-label="Product barcode">
                                                        </div>
                                                        <div class="col">
                                                            <label class="form-label" for="formValidationGenero">Genero</label>
                                                            <select class="form-control" name="formValidationGenero" id="formValidationGenero" required>
                                                                <option value="" selected>Indicar genero</option>
                                                                <option value="macho">Macho</option>
                                                                <option value="hembra">Hembra</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col">
                                                            <label class="form-label" for="formValidationDistintivo">Distintivo</label>
                                                            <input type="text" required class="form-control" id="formValidationDistintivo" placeholder="Algún Distintivo" name="formValidationDistintivo" aria-label="Product title">
                                                        </div>
                                                        <div class="col">
                                                            <label class="form-label" for="formValidationLugar">Lugar de Hallazgo</label>
                                                            <input type="text" required class="form-control" id="formValidationLugar" placeholder="Indique el Lugar de Hallazgo" name="formValidationLugar" aria-label="Product title">                  </div>
                                                    </div>
                                                    <div class="row g-3">
                                                        <div class="col-12 d-flex justify-content-between">
                                                            <button class="btn btn-primary btn-prev">
                                                                <i class="bx bx-chevron-left bx-sm ms-sm-n2"></i>
                                                                <span class="align-middle d-sm-inline-block d-none">Anterior</span>
                                                            </button>
                                                            <button class="btn btn-primary btn-next">
                                                                <span class="align-middle d-sm-inline-block d-none me-sm-1">Siguiente</span>
                                                                <i class="bx bx-chevron-right bx-sm me-sm-n2"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Datos para la rececpion -->
                                                <div id="datos-recepcion" class="content">
                                                    <div class="content-header mb-3">
                                                        <h6 class="mb-0">Datos de recepcion</h6>
                                                        <small>Especifique datos para la recepcion</small>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col">
                                                            <label class="form-label" for="formValidationTemporal">¿Se encuentra en algún temporal?</label>
                                                            <select class="form-control" name="formValidationTemporal" id="formValidationTemporal" required>
                                                                <option value="" selected>Indicar opción</option>
                                                                <option value="">Sí</option>
                                                                <option value="">No</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class = "row-mb-3">
                                                        <div class="col">
                                                            <label class="form-label" for="TagifyBasic">Etiquetas</label>
                                                            <input id="TagifyBasic" class="form-control" name="TagifyBasic" value="Etiqueta"/>
                                                        </div>
                                                    </div>
                                                    <div class="row g-3 mt-1">
                                                        <div class="col-12 d-flex justify-content-between">
                                                            <button class="btn btn-primary btn-prev">
                                                                <i class="bx bx-chevron-left bx-sm ms-sm-n2"></i>
                                                                <span class="align-middle d-sm-inline-block d-none">Anterior</span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Default Wizard -->
                                <div class="row"></div>
                                <div class="col-12">
                                    <!-- Media -->
                                    <div class="card mb-1">
                                        <div class="card-header d-flex justify-content-between align-items-center">
                                            <h5 class="mb-0 card-title">Imagen</h5>
                                            <a href="javascript:void(0);" class="fw-medium">Añadir contenido desde un URL</a>
                                        </div>
                                        <div class="card-body">
                                            <form action="https://demos.themeselection.com/upload" class="dropzone" id="dropzone-basic">
                                                <div class="dz-message needsclick my-3">
                                                    <p class="fs-3 note needsclick my-0">Arrastra una imagen</p>
                                                    <p class="text-muted fs-4 note needsclick my-0">o</p>
                                                    <p class="text-muted fs-4 note needsclick my-0">Examinar en el Dispositivo</p>

                                                </div>
                                                <div class="fallback">
                                                    <input name="file" type="image" accept="image/*" alt=""/>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                </div>
            </div>
            <!-- / Layout wrapper -->
            <!-- / Layout page -->
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


        <!-- Vendors JS -->
        <script src="../../assets/vendor/libs/bs-stepper/bs-stepper.js"></script>
        <script src="../../assets/vendor/libs/bootstrap-select/bootstrap-select.js"></script>
        <script src="../../assets/vendor/libs/select2/select2.js"></script>
        <script src="../../assets/vendor/libs/%40form-validation/popular.js"></script>
        <script src="../../assets/vendor/libs/%40form-validation/bootstrap5.js"></script>
        <script src="../../assets/vendor/libs/%40form-validation/auto-focus.js"></script>
        <script src="../../assets/vendor/libs/quill/katex.js"></script>
        <script src="../../assets/vendor/libs/quill/quill.js"></script>
        <script src="../../assets/vendor/libs/select2/select2.js"></script>
        <script src="../../assets/vendor/libs/bloodhound/bloodhound.js"></script>
        <script src="../../assets/vendor/libs/dropzone/dropzone.js"></script>
        <script src="../../assets/vendor/libs/jquery-repeater/jquery-repeater.js"></script>
        <script src="../../assets/vendor/libs/flatpickr/flatpickr.js"></script>
        <script src="../../assets/vendor/libs/tagify/tagify.js"></script>

        <script src="../../assets/js/form-wizard-numbered.js"></script>
        <script src="../../assets/js/form-wizard-validation-adopcion.js"></script>
        <script src="../../assets/js/app-ecommerce-product-add.js"></script>
        <script src="../../assets/js/forms-selects.js"></script>
        <script src="../../assets/js/forms-tagify.js"></script>
        <script src="../../assets/js/forms-typeahead.js"></script>

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



    </body>



    <!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:07 GMT -->
</html>

<!-- beautify ignore:end -->