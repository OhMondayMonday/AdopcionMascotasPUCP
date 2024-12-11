<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>


<html lang="es" class="light-style layout-wide  customizer-hide" dir="ltr" data-theme="theme-semi-dark" data-assets-path="../../assets/" data-template="vertical-menu-template-semi-dark">


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/auth-register-multisteps.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:15:08 GMT -->
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Registro</title>


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
    <link rel="icon" type="image/x-icon" href="https://demos.themeselection.com/sneat-bootstrap-html-admin-template/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&amp;display=swap" rel="stylesheet">

    <!-- Icons -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/fonts/boxicons.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/fonts/fontawesome.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/fonts/flag-icons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/css/rtl/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/css/rtl/theme-semi-dark.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/typeahead-js/typeahead.css" />
    <!-- Vendor -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/bs-stepper/bs-stepper.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/bootstrap-select/bootstrap-select.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/select2/select2.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/%40form-validation/form-validation.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/sweetalert2/sweetalert2.css" />


    <!-- Page CSS -->

    <!-- Page -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/css/pages/page-auth.css">

    <!-- Helpers -->
    <script src="<%=request.getContextPath()%>/assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="<%=request.getContextPath()%>/assets/js/config.js"></script>

</head>


<body>


<!-- ?PROD Only: Google Tag Manager (noscript) (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<!-- Content -->

<div class="authentication-wrapper authentication-cover">
    <div class="authentication-inner row m-0">

        <!-- Left Text -->
        <div class="d-none d-lg-flex col-lg-4 align-items-center justify-content-end p-5 pe-0">
            <div class="w-px-400">
                <img src="<%=request.getContextPath()%>/assets/img/illustrations/sitting-girl-with-laptop-light.png" class="img-fluid" alt="multi-steps" width="600">
            </div>
        </div>
        <!-- /Left Text -->

        <!--  Multi Steps Registration -->
        <div class="d-flex col-lg-8 align-items-center justify-content-center authentication-bg p-sm-5 p-3">
            <div class="w-px-700">

                <!-- Logo y Título de Alianza Animal -->
                <div class="app-brand mb-5 text-center">
                    <a href="<%=request.getContextPath()%>" class="app-brand-link gap-2">
                        <div class="app-brand-logo demo">
                            <img src="<%=request.getContextPath()%>/assets/img/logo_Alianza_Animal_-removebg-preview.png" alt="Logo de Alianza Animal" width="50">
                        </div>
                        <span class="text-body fw-bold" style="font-size:xx-large">Alianza Animal</span>
                    </a>
                </div>
                <!-- Fin del Logo y Título -->

                <div id="multiStepsValidation" class="bs-stepper shadow-none">
                    <div class="bs-stepper-header border-bottom-0">
                        <div class="step" data-target="#accountDetailsValidation">
                            <button type="button" class="step-trigger">
                                <span class="bs-stepper-circle"><i class="bx bx-home-alt"></i></span>
                                <span class="bs-stepper-label mt-1">
                                    <span class="bs-stepper-title">Cuenta</span>
                                    <span class="bs-stepper-subtitle">Detalles de la cuenta</span>
                                 </span>
                            </button>
                        </div>
                        <div class="line">
                            <i class="bx bx-chevron-right"></i>
                        </div>
                        <div class="step" data-target="#personalInfoValidation">
                            <button type="button" class="step-trigger">
                                <span class="bs-stepper-circle"><i class="bx bx-user"></i></span>
                                <span class="bs-stepper-label mt-1">
                  <span class="bs-stepper-title">Personal</span>
                  <span class="bs-stepper-subtitle">Información personal</span>
                </span>
                            </button>
                        </div>


                    </div>
                    <div class="bs-stepper-content">
                        <form id="multiStepsForm" method = "POST" onSubmit="return false">
                            <!-- Account Details -->
                            <div id="accountDetailsValidation" class="content">
                                <div class="content-header mb-3">
                                    <h3 class="mb-1">Detalles de la cuenta</h3>
                                    <span>Ingresa los detalles de tu cuenta</span>
                                </div>
                                <div class="row g-3">
                                    <div class="col-sm-6">
                                        <label class="form-label" for="multiStepsUsername">Nombre de Usuario</label>
                                        <input type="text" name="multiStepsUsername" id="multiStepsUsername" class="form-control" placeholder="Usuario" />
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="multiStepsEmail">Correo electrónico</label>
                                        <input type="email" name="multiStepsEmail" id="multiStepsEmail" class="form-control" placeholder="ejemplo@gmail.com" aria-label="john.doe" />
                                    </div>


                                    <div class="col-12 d-flex justify-content-between">
                                        <button class="btn btn-label-secondary btn-prev" disabled> <i class="bx bx-chevron-left bx-sm ms-sm-n2"></i>
                                            <span class="align-middle d-sm-inline-block d-none">Anterior</span>
                                        </button>
                                        <button class="btn btn-primary btn-next"> <span class="align-middle d-sm-inline-block d-none me-sm-1 me-0">Siguiente</span> <i class="bx bx-chevron-right bx-sm me-sm-n2"></i></button>
                                    </div>
                                </div>
                            </div>
                            <!-- Personal Info -->
                            <div id="personalInfoValidation" class="content">
                                <div class="content-header mb-3">
                                    <h3 class="mb-1">Información Personal</h3>
                                    <span>Ingresa los siguientes datos sobre ti</span>
                                </div>
                                <div class="row g-3">
                                    <div class="col-sm-6">
                                        <label class="form-label" for="multiStepsFirstName">Nombre</label>
                                        <input type="text" id="multiStepsFirstName" name="multiStepsFirstName" class="form-control" placeholder="Ingresa tu nombre(s)" />
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="multiStepsLastName">Apellidos</label>
                                        <input type="text" id="multiStepsLastName" name="multiStepsLastName" class="form-control" placeholder="Ingresa tus apellidos" />
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="multiStepsDocument">Documento de Identificación</label>
                                        <input type="text" class="form-control" id="multiStepsDocument" name="multiStepsDocument" placeholder="Número de documento">
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="multiStepsState">Distrito</label>
                                        <select id="multiStepsState" class="select2 form-select form-select-lg" data-allow-clear="true">
                                            <option value="1">Ancon</option>
                                            <option value="2">Santa Rosa</option>
                                            <option value="3">Carabayllo</option>
                                            <option value="4">Puente Piedra</option>
                                            <option value="5">Comas</option>
                                            <option value="6">Los Olivos</option>
                                            <option value="7">San Martín de Porres</option>
                                            <option value="8">Independencia</option>
                                            <option value="9">San Juan de Miraflores</option>
                                            <option value="10">Villa María del Triunfo</option>
                                            <option value="11">Villa el Salvador</option>
                                            <option value="12">Pachacamac</option>
                                            <option value="13">Lurin</option>
                                            <option value="14">Punta Hermosa</option>
                                            <option value="15">Punta Negra</option>
                                            <option value="16">San Bartolo</option>
                                            <option value="17">Santa María del Mar</option>
                                            <option value="18">Pucusana</option>
                                            <option value="19">San Juan de Lurigancho</option>
                                            <option value="20">Lurigancho/Chosica</option>
                                            <option value="21">Ate</option>
                                            <option value="22">El Agustino</option>
                                            <option value="23">Santa Anita</option>
                                            <option value="24">La Molina</option>
                                            <option value="25">Cieneguilla</option>
                                            <option value="26">Rimac</option>
                                            <option value="27">Cercado de Lima</option>
                                            <option value="28">Breña</option>
                                            <option value="29">Pueblo Libre</option>
                                            <option value="30">Magdalena</option>
                                            <option value="31">Jesús María</option>
                                            <option value="32">La Victoria</option>
                                            <option value="33">Lince</option>
                                            <option value="34">San Isidro</option>
                                            <option value="35">San Miguel</option>
                                            <option value="36">Surquillo</option>
                                            <option value="37">San Borja</option>
                                            <option value="38">Santiago de Surco</option>
                                            <option value="39">Barranco</option>
                                            <option value="40">Chorrillos</option>
                                            <option value="41">San Luis</option>
                                            <option value="42">Miraflores</option>
                                        </select>
                                    </div>

                                    <!-- Contraseña -->
                                    <div class="col-sm-6">
                                        <label class="form-label" for="multiStepsPass">Contraseña</label>
                                        <input type="password" id="multiStepsPass" name="multiStepsPass" class="form-control" placeholder="Contraseña"/>
                                    </div>

                                    <!-- Confirmar contraseña -->
                                    <div class="col-sm-6">
                                        <label class="form-label" for="multiStepsConfirmPass">Confirmar Contraseña</label>
                                        <input type="password" id="multiStepsConfirmPass" name="multiStepsConfirmPass" class="form-control" placeholder="Confirmar contraseña"/>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="form-label" for="multiStepsAddress">Dirección</label>
                                        <input type="text" id="multiStepsAddress" name="multiStepsAddress" class="form-control" placeholder="Ingresa tu dirección" />
                                    </div>
                                    <div class="col-12 d-flex justify-content-between">
                                        <button class="btn btn-primary btn-prev"> <i class="bx bx-chevron-left bx-sm ms-sm-n2"></i>
                                            <span class="align-middle d-sm-inline-block d-none">Anterior</span>
                                        </button>
                                        <button type="submit" class="btn btn-success btn-next btn-submit">Enviar Solicitud</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- / Multi Steps Registration -->
    </div>
</div>
<!-- / Content -->

<script>
    // Check selected custom option
    window.Helpers.initCustomOptionCheck();

</script>
<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->

<script src="<%=request.getContextPath()%>/assets/vendor/libs/jquery/jquery.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/popper/popper.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/hammer/hammer.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/i18n/i18n.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/typeahead-js/typeahead.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/js/menu.js"></script>

<!-- endbuild -->

<!-- Vendors JS -->
<script src="<%=request.getContextPath()%>/assets/vendor/libs/cleavejs/cleave.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/cleavejs/cleave-phone.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/bs-stepper/bs-stepper.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/select2/select2.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/%40form-validation/popular.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/%40form-validation/bootstrap5.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/%40form-validation/auto-focus.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>


<!-- Main JS -->
<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>


<!-- Page JS -->
<script src="<%=request.getContextPath()%>/assets/js/pages-auth-multisteps-register.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/extended-ui-sweetalert2.js"></script>


</body>


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/auth-register-multisteps.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:15:10 GMT -->
</html>

