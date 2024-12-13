<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html lang="es" class="light-style layout-wide  customizer-hide" dir="ltr" data-theme="theme-semi-dark" data-assets-path="../../assets/" data-template="vertical-menu-template-semi-dark">


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/auth-login-cover.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:15:07 GMT -->
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Iniciar Sesión</title>


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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/%40form-validation/form-validation.css" />

    <!-- Page CSS -->
    <!-- Page -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/css/pages/page-auth.css">

    <!-- Helpers -->
    <script src="<%=request.getContextPath()%>/assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
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
        <!-- /Left Text -->
        <div class="d-none d-lg-flex col-lg-7 col-xl-7 align-items-center p-5 h-100">
            <div class="w-100 d-flex justify-content-center">
                <img src="<%=request.getContextPath()%>/assets/img/illustrations/boy-with-rocket-light.png" class="img-fluid" alt="Login image">
            </div>
        </div>
        <!-- /Left Text -->

        <!-- Login -->
        <div class="d-flex col-12 col-lg-5 col-xl-5 align-items-center authentication-bg p-sm-5 p-4">
            <div class="w-px-400 mx-auto">
                <!-- Logo y formulario con borde -->
                <div class="border border-dark p-4 rounded bg-white">
                    <!-- Logo -->
                    <div class="app-brand mb-2 text-center">
                        <a href="<%=request.getContextPath()%>/login" class="app-brand-link gap-2">
                            <div class="app-brand-logo demo">
                                <img src="<%=request.getContextPath()%>/assets/img/logo_Alianza_Animal_-removebg-preview.png" alt="Logo de Alianza Animal" width="50">
                            </div>
                            <span class="text-body fw-bold" style="font-size:large">Alianza Animal</span>
                            <p class="mt-3 ms-5 fw-bold fs-big">Iniciar sesión</p>
                        </a>
                    </div>
                    <div class="d-flex justify-content-center align-items-center mb-2">
                        <img src="<%=request.getContextPath()%>/assets/img/padlock-2873246_960_720.webp" width="150" alt="Candado">
                    </div>
                    <!-- /Logo -->
                    <h4 class="mb-1 text-center">¿Tienes problemas para ingresar?</h4>
                    <p class="mb-4 text-center">Ingresa tu correo y en breve te enviaremos un enlace para que puedas restablecer tu contraseña</p>

                    <form id="forgotPasswordForm">
                        <label for="email" class="form-label">Correo electrónico:</label>
                        <input type="email" class="form-control" id="email" placeholder="Ingresa tu correo electrónico" name="email" required>
                        <span id="emailFeedback" style="color: red; display: none;">Por favor, ingresa un correo válido.</span>
                        <button class="btn btn-primary d-grid w-100 mt-3" type="submit">Recuperar contraseña</button>
                    </form>
                </div>

                <!-- Línea negra entre las cajas -->
                <div class="d-flex align-items-center my-4">
                    <hr class="flex-grow-1 border-dark">
                    <span class="px-2 text-dark bg-white rounded-circle">o</span>
                    <hr class="flex-grow-1 border-dark">
                </div>

                <!-- Sección de "Crear nueva cuenta" con borde -->
                <div class="border border-dark p-3 rounded bg-white">
                    <p class="text-center mb-0">
                        <span>¿Deseas crear una cuenta?</span>
                        <a href="<%=request.getContextPath()%>/register">
                            <span>Crea una cuenta</span>
                        </a>
                    </p>
                </div>
            </div>
        </div>
        <!-- /Login -->
    </div>
</div>

<!-- / Content -->
<script>
    document.addEventListener("DOMContentLoaded", () => {
        const forgotPasswordForm = document.getElementById("forgotPasswordForm");
        const emailInput = document.getElementById("email");
        const emailFeedback = document.getElementById("emailFeedback");

        // Validación al escribir en el campo de correo
        emailInput.addEventListener("input", () => {
            const email = emailInput.value.trim();
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if (!emailRegex.test(email)) {
                emailFeedback.style.display = "inline"; // Mostrar mensaje de error
            } else {
                emailFeedback.style.display = "none"; // Ocultar mensaje de error
            }
        });

        // Manejo del envío del formulario
        forgotPasswordForm.addEventListener("submit", (event) => {
            event.preventDefault();

            const email = emailInput.value.trim();
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            // Validación del correo antes de enviar
            if (!emailRegex.test(email)) {
                emailFeedback.style.display = "inline";
                return;
            }

            // Envía la solicitud al servidor en segundo plano
            fetch("recuperar", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: new URLSearchParams({ email: email }),
            }).catch(error => {
                console.error("Error en la solicitud:", error);
            });

            // Mostrar mensaje de confirmación con SweetAlert
            Swal.fire({
                title: "Correo en proceso",
                text: "Si el correo está registrado, recibirás un enlace para restablecer tu contraseña.",
                icon: "info",
                confirmButtonText: "Aceptar",
            }).then(() => {
                // Redirige al usuario a la página principal
                window.location.href = window.location.origin + "/AlianzaAnimal/";
            });
        });
    });
e
</script>

<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="<%=request.getContextPath()%>/assets/vendor/libs/%40form-validation/popular.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/%40form-validation/bootstrap5.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/%40form-validation/auto-focus.js"></script>

<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>

<script src="<%=request.getContextPath()%>/assets/vendor/libs/jquery/jquery.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/popper/popper.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/hammer/hammer.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/i18n/i18n.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/typeahead-js/typeahead.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/js/menu.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</body>

</html>
