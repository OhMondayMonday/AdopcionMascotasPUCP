<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
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
                <!-- Logo -->
                <div class="app-brand mb-5">
                    <a href="<%=request.getContextPath()%>/index.html" class="app-brand-link gap-2">
                        <div class="app-brand-logo demo">
                            <img src="<%=request.getContextPath()%>/assets/img/logo_Alianza_Animal_-removebg-preview.png" alt="Logo de Alianza Animal" width="50">
                        </div>
                        <span class="text-body fw-bold" style="font-size:xx-large">Alianza Animal</span>
                    </a>
                </div>
                <!-- /Logo -->
                <h4 class="mb-2">Recupera tu cuenta</h4>
                <p class="mb-4">Ingresa tu correo y recupera tu contraseña</p>

                <form id="resetPasswordForm" class="needs-validation" novalidate>
                    <!-- Campo oculto para el token -->
                    <input type="hidden" id="token" name="token" value="${param.token}">

                    <!-- Nueva contraseña -->
                    <div class="mb-3">
                        <label for="password" class="form-label">Nueva contraseña:</label>
                        <input type="password" class="form-control" id="password" name="password" required minlength="8">
                        <div class="invalid-feedback">
                            La contraseña debe tener al menos 8 caracteres.
                        </div>
                    </div>

                    <!-- Confirmar contraseña -->
                    <div class="mb-3">
                        <label for="confirmPassword" class="form-label">Confirma tu contraseña:</label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                        <div class="invalid-feedback">
                            Las contraseñas no coinciden.
                        </div>
                    </div>

                    <!-- Botón de enviar -->
                    <button type="submit" class="btn btn-primary w-100">Cambiar Contraseña</button>
                </form>
            </div>
        </div>
        <!-- /Login -->
    </div>
</div>

<!-- JavaScript -->
<script>
    document.addEventListener("DOMContentLoaded", () => {
        const resetPasswordForm = document.getElementById("resetPasswordForm");
        const passwordInput = document.getElementById("password");
        const confirmPasswordInput = document.getElementById("confirmPassword");
        const token = document.getElementById("token").value;

        // Manejo del envío del formulario
        resetPasswordForm.addEventListener("submit", (event) => {
            event.preventDefault();

            const password = passwordInput.value.trim();
            const confirmPassword = confirmPasswordInput.value.trim();

            // Validaciones en el cliente
            if (password.length < 8) {
                passwordInput.classList.add("is-invalid");
                return;
            } else {
                passwordInput.classList.remove("is-invalid");
            }

            if (password !== confirmPassword) {
                confirmPasswordInput.classList.add("is-invalid");
                return;
            } else {
                confirmPasswordInput.classList.remove("is-invalid");
            }

            // Envío de la solicitud al servidor
            fetch("reset-password", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: new URLSearchParams({ token: token, password: password }),
            })
                .then(response => response.json())
                .then(data => {
                    if (data.status === "success") {
                        // SweetAlert de éxito
                        Swal.fire({
                            title: "Contraseña actualizada",
                            text: data.message,
                            icon: "success",
                            confirmButtonText: "Aceptar",
                        }).then(() => {
                            // Redirige al usuario al login
                            window.location.href = window.location.origin + "/AlianzaAnimal/login";
                        });
                    } else {
                        // SweetAlert de error
                        Swal.fire({
                            title: "Error",
                            text: data.message,
                            icon: "error",
                            confirmButtonText: "Aceptar",
                        });
                    }
                })
                .catch(error => {
                    console.error("Error en la solicitud:", error);
                    Swal.fire({
                        title: "Error",
                        text: "Hubo un problema al actualizar la contraseña. Inténtalo de nuevo.",
                        icon: "error",
                        confirmButtonText: "Aceptar",
                    });
                });
        });
    });
</script>
</body>
</html>
