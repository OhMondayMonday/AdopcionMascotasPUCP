<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="usuario" class="Beans.Usuarios" scope="request" />
<jsp:useBean id="rol" class="Beans.Roles" scope="request" />
<jsp:setProperty name="usuario" property="*" />
<jsp:setProperty name="rol" property="*" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html lang="es" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="../../assets/" data-template="vertical-menu-template-semi-dark">


    <!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:06 GMT -->
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

        <title>Editar Perfil | Coordinador</title>

        <meta name="description" content="Most Powerful &amp; Comprehensive Bootstrap 5 Admin Dashboard built for developers!" />
        <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
        <!-- Canonical SEO -->
        <link rel="canonical" href="https://themeselection.com/item/sneat-dashboard-pro-bootstrap/">

        <!-- Google Tag Manager -->
        <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
                new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
            j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
            '${pageContext.request.contextPath}/www.googletagmanager.com/gtm5445.html?id='+i+dl;f.parentNode.insertBefore(j,f);
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/quill/typography.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/quill/katex.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/quill/editor.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/dropzone/dropzone.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/flatpickr/flatpickr.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/tagify/tagify.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/sweetalert2/sweetalert2.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/form-validation.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/animate-css/animate.css" />
        <!-- Page CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/pages/page-faq.css" />

        <!-- Helpers -->
        <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>

        <!-- Template Customizer & Config Files -->
        <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>
    </head>


    <body>


        <!-- ?PROD Only: Google Tag Manager (noscript) (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
        <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
        <!-- End Google Tag Manager (noscript) -->

        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-content-navbar" style="background-color: #fef8e5;">
            <div class="layout-container">
                <jsp:include page="../includes/sidebarCoordinador.jsp" />
                <div class="layout-page">
                    <jsp:include page="../includes/navbarCoordinador.jsp"/>
                    <div class="content-wrapper">
                        <div class="container-xxl flex-grow-1 container-p-y">
                            <div class="app-ecommerce">
                                <div class="d-flex flex-wrap justify-content-between align-items-center mb-3">
                                </div>
                                <div class="row">
                                    <div class="col-xl-4 col-lg-5 col-md-5 order-0 order-md-0">
                                        <div class="card mb-4">
                                            <div class="card-body">
                                                <div class="user-avatar-section">
                                                    <div class="mt-4 d-flex align-items-center flex-column">
                                                        <img class="img-fluid rounded my-3" src="${pageContext.request.contextPath}/assets/img/avatars/1.png" height="120" width="120" alt="User avatar" />
                                                        <div class="user-info text-center">
                                                            <h4 class="mt-3" style="color: rgb(74, 58, 16);">Coordinador ${usuario.nombre}</h4>
                                                            <span class="badge bg-label-warning">Coordinador</span>
                                                        </div>

                                                    </div>
                                                </div>
                                                <!--
                                                <h5 class="pb-2 border-bottom mb-4">Detalles de la cuenta</h5>
                                                -->
                                                <div class="info-container justify-content-center">
                                                    <h5 class="pb-2 border-bottom mt-4 mb-4">Algunos Detalles</h5>

                                                    <div class="info-container justify-content-center">
                                                        <ul class="list-unstyled">
                                                            <li class="mb-3">
                                                                <span class="fw-medium me-2">Nombre Completo:</span>
                                                                <span>${usuario.nombre} ${usuario.apellido}</span>
                                                            </li>
                                                            <li class="mb-3">
                                                                <span class="fw-medium me-2">Nombre de Usuario:</span>
                                                                <span>${usuario.username}</span>
                                                            </li>

                                                            <li class="mb-3">
                                                                <span class="fw-medium me-2">Correo:</span>
                                                                <span>${usuario.email}</span>
                                                            </li>
                                                            <li class="mb-3">
                                                                <span class="fw-medium me-2">Teléfono:</span>
                                                                <span>${usuario.numeroYapePlin}</span>
                                                            </li>
                                                            <li class="mb-3">
                                                                <span class="fw-medium me-2">Fecha de Registro: </span>
                                                                <span>${usuario.fechaRegistro}</span>
                                                            </li>

                                                        </ul>


                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="nav-align-top mb-3">
                                            <ul class="nav nav-tabs" role="tablist">
                                                <li class="nav-item">
                                                    <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#form-tabs-personal" role="tab" aria-selected="true">Información Básica</button>
                                                </li>
                                            </ul>
                                            <div class="tab-content">
                                                <div class="tab-pane fade active show" id="form-tabs-personal" role="tabpanel">
                                                    <form id="miFormularioPersonal" action="coordinador?action=actualizar" method="post">
                                                        <input type="hidden" name="id" value="4" />
                                                        <div class="row g-3">
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="formtabs-first-name">Nombres</label>
                                                                <input type="text" id="formtabs-first-name" name="nombre" class="form-control" placeholder="Nombre" value="${usuario.nombre}" />
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="formtabs-last-name">Apellidos</label>
                                                                <input type="text" id="formtabs-last-name" name="apellido" class="form-control" placeholder="Apellidos" value="${usuario.apellido}" />
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="formtabs-username">Nombre de Usuario</label>
                                                                <input type="text" id="formtabs-username" name="username" class="form-control" placeholder="ejemplo_usuario" value="${usuario.username}" />
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="formtabs-email">Correo electrónico</label>
                                                                <div class="input-group input-group-merge">
                                                                    <input type="email" id="formtabs-email" name="email" class="form-control" placeholder="alianzaanimal" value="${usuario.email}" />
                                                                    <span class="input-group-text" id="formtabs-email2">@ejemplo.com</span>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="select2Basic">Zona Encargada</label>
                                                                <select id="select2Basic" name="zona" class="select2 form-select form-select-lg" data-allow-clear="true">
                                                                    <option value="1" ${usuario.zona.getZonaId() == 1 ? 'selected' : ''}>Lima Norte</option>
                                                                    <option value="2" ${usuario.zona.getZonaId() == 2 ? 'selected' : ''}>Lima Sur</option>
                                                                    <option value="3" ${usuario.zona.getZonaId() == 3 ? 'selected' : ''}>Lima Centro</option>
                                                                    <option value="4" ${usuario.zona.getZonaId() == 4 ? 'selected' : ''}>Lima Este</option>
                                                                </select>
                                                            </div>

                                                            <div class="form-group">
                                                                <label for="numeroYapePlin">Número de contacto:</label>
                                                                <input type="text" id="numeroYapePlin" name="numeroYapePlin" class="form-control" value="${usuario.numeroYapePlin}">
                                                            </div>


                                                            <div class="form-group">
                                                                <label for="direccion">Dirección:</label>
                                                                <input type="text" id="direccion" name="direccion" class="form-control" value="${usuario.direccion}">
                                                            </div>

                                                        </div>

                                                        <div class="mb-1">
                                                            <div class="card-body">
                                                                <form action="https://demos.themeselection.com/upload" class="dropzone needsclick" id="dropzone-basic-1">
                                                                </form>
                                                            </div>
                                                        </div>

                                                        <div class="card mb-1">
                                                            <div class="card-header d-flex justify-content-between align-items-center">
                                                                <h5 class="mb-0 card-title">Imagen</h5>
                                                                <a href="javascript:void(0);" class="fw-medium">Añadir contenido desde un URL</a>
                                                            </div>
                                                            <div class="card-body">
                                                                <form action="https://demos.themeselection.com/upload" class="dropzone needsclick" id="dropzone-basic">
                                                                    <div class="dz-message needsclick my-2">
                                                                        <p class="fs-3 note needsclick my-0">Arrastra una imagen</p>
                                                                        <p class="text-muted fs-4 note needsclick my-0">o</p>
                                                                        <p class="text-muted fs-4 note needsclick my-0">Examinar en el Dispositivo</p>

                                                                    </div>
                                                                    <div class="fallback">
                                                                        <input name="file" type="image" accept="image/*"/>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                        <div class="pt-4">

                                                            <button type="button" class="btn btn-success me-sm-3 me-1" id="confirm-text"><span style="font-weight: bold;">Confirmar</span></button>
                                                            <button class="btn btn-danger cancel-subscription me-sm-3 me-1">Cancelar</button>
                                                        </div>
                                                    </form>

                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- / Layout wrapper -->
                    </div>
                    <!-- / Layout page -->
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
                </div>

            </div>
        </div>


        <script src="${pageContext.request.contextPath}/assets/vendor/libs/jquery/jquery.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/popper/popper.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/js/bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/hammer/hammer.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/i18n/i18n.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/js/menu.js"></script>

        <!-- endbuild -->

        <!-- Vendors JS -->
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/quill/katex.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/quill/quill.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/bootstrap-select/bootstrap-select.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/typeahead-js/typeahead.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/bloodhound/bloodhound.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/dropzone/dropzone.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/jquery-repeater/jquery-repeater.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/flatpickr/flatpickr.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/tagify/tagify.js"></script>

        <script src="${pageContext.request.contextPath}/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/cleavejs/cleave.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/cleavejs/cleave-phone.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/popular.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/bootstrap5.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/auto-focus.js"></script>

        <!-- Main JS -->
        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

        <!-- Page JS -->
        <script src="${pageContext.request.contextPath}/assets/js/extended-ui-sweetalert2.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app-ecommerce-product-add.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/forms-selects.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/forms-tagify.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/forms-typeahead.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/modal-edit-user.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/modal-enable-otp.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app-user-view.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app-user-view-security.js"></script>


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

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                flatpickr("#html5-date-input", {
                    dateFormat: "d-m-Y", // Cambia al formato deseado
                    locale: "es" // Ajuste de idioma a español
                });
            });
        </script>

        <script>
            // Asegúrate de que el DOM esté cargado antes de ejecutar tu script
            document.getElementById('confirm-text').addEventListener('click', function() {
                Swal.fire({
                    title: "¿Estás seguro?",
                    text: "Confirmarás los cambios hechos",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonText: "Sí, confirmar",
                    cancelButtonText: "Cancelar",
                    customClass: {
                        confirmButton: "btn btn-primary",
                        cancelButton: "btn btn-label-secondary"
                    },
                    buttonsStyling: false
                }).then(function(result) {
                    if (result.isConfirmed) {
                        console.log("Formulario enviado"); // Depuración
                        document.getElementById('miFormularioPersonal').submit();
                    }
                });



                // Botón "Cancelar"
                document.querySelector('.cancel-subscription').addEventListener('click', function() {
                    window.location.href = "/albergue-editar-perfil.jsp"; // Cambia esta ruta según tu necesidad
                });
            });

        </script>

        <script>
            document.getElementById("formtabs-contact-phone").addEventListener("input", function() {
                // Solo permite números y elimina cualquier carácter que no sea un número
                this.value = this.value.replace(/[^0-9]/g, '');
            });

        </script>

        <script>
            document.getElementById("yape-contact").addEventListener("input", function() {
                // Solo permite números y elimina cualquier otro carácter
                this.value = this.value.replace(/[^0-9]/g, '');
            });
        </script>

    </body>



    <!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:07 GMT -->
</html>

