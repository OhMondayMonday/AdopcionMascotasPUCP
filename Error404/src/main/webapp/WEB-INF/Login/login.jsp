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

                <div class="border border-dark p-3 rounded bg-white">
                    <!-- Logo -->
                    <div class="app-brand mb-3">
                        <a href="<%=request.getContextPath()%>" class="app-brand-link gap-2">
                            <div class="app-brand-logo demo">
                                <img src="<%=request.getContextPath()%>/assets/img/logo_Alianza_Animal_-removebg-preview.png" alt="Logo de Alianza Animal" width="50">
                            </div>
                            <span class="text-body fw-bold" style="font-size:large">Alianza Animal</span>
                            <p class="mt-3 ms-5 fw-bold fs-normal">Volver al inicio</p>
                        </a>
                    </div>
                    <!-- /Logo -->
                    <h4 class="mb-2">¡Bienvenido! 👋</h4>
                    <p class="mb-4">Inicia sesión con tu cuenta y apoya a los albergues</p>

                    <form id="formAuthentication">
                        <div class="mb-3">
                            <label for="email" class="form-label">Correo electrónico</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Ingresa tu correo electrónico" required autofocus>
                        </div>
                        <div class="mb-3 form-password-toggle">
                            <div class="d-flex justify-content-between">
                                <label class="form-label" for="contrasenia">Contraseña</label>
                                <a href="<%=request.getContextPath()%>/recuperar">
                                    <small>¿Olvidaste tu contraseña?</small>
                                </a>
                            </div>
                            <div class="input-group input-group-merge">
                                <input type="password" id="contrasenia" class="form-control" name="contrasenia" placeholder="••••••••••" required aria-describedby="password">
                                <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                            </div>
                        </div>
                        <p id="errorMessage" class = "mt-1 mb-1" style="color:red; display:none;">Correo o contraseña incorrectos.</p>
                        <button class="btn btn-primary d-grid w-100" type="submit">Iniciar sesión</button>
                    </form>
                </div>


                <!-- Línea negra entre las cajas -->
                <div class="d-flex align-items-center my-4">
                    <hr class="flex-grow-1 border-dark">
                    <span class="px-2 text-dark bg-white rounded-circle">o</span>
                    <hr class="flex-grow-1 border-dark">
                </div>

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
    </div>
</div>

<!-- / Content -->


<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->


<!-- Login Scripts-->
<script>
    document.getElementById('formAuthentication').addEventListener('submit', function (event) {
        event.preventDefault();

        const email = document.getElementById('email').value;
        const contrasenia = document.getElementById('contrasenia').value;

        const urlParams = new URLSearchParams(window.location.search);
        const redirect = urlParams.get('redirect') || '';

        fetch('login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: "email=" + encodeURIComponent(email) + "&contrasenia=" + encodeURIComponent(contrasenia) + "&redirect=" + encodeURIComponent(redirect)
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Error en la respuesta del servidor');
                }
                return response.json();
            })
            .then(data => {
                if (data.loginExitoso) {
                    window.location.href = data.redirect;
                } else {
                    const errorMessage = document.getElementById('errorMessage');
                    errorMessage.textContent = data.error || 'Correo o contraseña incorrectos.';
                    errorMessage.style.display = 'block';
                }
            })
            .catch(error => {
                console.error('Error al procesar la solicitud:', error);
                const errorMessage = document.getElementById('errorMessage');
                errorMessage.textContent = 'Ocurrió un error inesperado.';
                errorMessage.style.display = 'block';
            });
    });

    async function generateSHA256Hash(input) {
        const encoder = new TextEncoder();
        const data = encoder.encode(input);
        const hashBuffer = await crypto.subtle.digest('SHA-256', data);
        const hashArray = Array.from(new Uint8Array(hashBuffer));
        return hashArray.map(byte => byte.toString(16).padStart(2, '0')).join('');
    }

</script>
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


</body>

</html>