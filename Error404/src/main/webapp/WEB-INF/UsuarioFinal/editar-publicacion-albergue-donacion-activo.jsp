<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuario" type="Beans.Usuarios" scope="request"/>
<jsp:useBean id="publicacion" type="Beans.Publicaciones" scope="request"/>
<jsp:useBean id="donacion" type="Beans.PublicacionesDonaciones" scope="request"/>
<html lang="es" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="../../assets/" data-template="vertical-menu-template-semi-dark">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Editar Publicación | Donación</title>


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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/quill/typography.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/quill/katex.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/quill/editor.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/select2/select2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/dropzone/dropzone.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/flatpickr/flatpickr.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/tagify/tagify.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/sweetalert2/sweetalert2.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/%40form-validation/form-validation.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/animate-css/animate.css" />

    <!-- Page CSS -->


    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>

</head>

<body style="background-color: #d4e1ffa9;">


<!-- ?PROD Only: Google Tag Manager (noscript) (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">

        <!-- Navbar -->
        <jsp:include page="${pageContext.request.contextPath}/WEB-INF/includes/sidebarUF.jsp">
            <jsp:param name="usuariosession" value=""/>
        </jsp:include>

        <div class="layout-page">
            <jsp:include page="${pageContext.request.contextPath}/WEB-INF/includes/navbarUF.jsp">
                <jsp:param name="usuariosession" value=""/>
            </jsp:include>
            <!-- / Navbar -->

            <!-- Content wrapper -->
            <div class="content-wrapper">

                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">

                    <div class="app-ecommerce">
                        <form id="form_publis" method="POST" action="PublicacionesServlet?action=actualizarDonacion" enctype="multipart/form-data">

                            <!-- Add Product -->
                            <div class="d-flex flex-wrap justify-content-between align-items-center mb-3">

                                <div class="d-flex flex-column justify-content-center">
                                    <h4 class="mb-1 mt-1" style="font-size: 24px; color: #353537dd;">Editar Publicación</h4>
                                    <p class="text-muted">Rellena los campos abajo</p>
                                </div>
                                <div class="d-flex align-content-center flex-wrap gap-3">
                                    <button id="confirm-text" class="btn btn-success" style="font-weight: bold;">Confirmar Cambios</button>
                                    <button class="btn btn-danger cancel-subscription">Descartar</button>
                                </div>

                            </div>

                            <div class="row">
                                <!-- First column-->
                                <div class="col-12 col-lg-6">
                                    <!-- Product Information -->
                                    <div class="card mb-4">
                                        <div class="card-header">
                                            <h5 class="card-tile mb-0" style="color: #3318ca;">Donación</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="mb-3">
                                                <label class="form-label" for="titulo">Titulo</label>
                                                <input type="text" required class="form-control" value="<%=publicacion.getTitulo()%>" id="titulo" placeholder="Título de la publicación" name="titulo" aria-label="Product title">
                                                <input type="hidden" name="tipo_publicacion" value="3">
                                                <input type="hidden" name="user_id" value="<%=usuario.getUserId()%>">
                                                <input type="hidden" name="publicacion_id" value="<%=publicacion.getPublicacionId()%>">
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col"><label class="form-label" for="opciones">Tipo</label>
                                                    <select class="form-control" id="opciones" name="tipo_donacion" required>
                                                        <%if(donacion.getTipoDonacion().getTipoDonacionId() == 1){%>
                                                        <option value="" disabled>Elija el tipo de Donación</option>
                                                        <option value="1" selected>Activo</option>
                                                        <option value="2" >Dinero</option>
                                                        <%}else {%>
                                                        <option value="" disabled>Elija el tipo de Donación</option>
                                                        <option value="1" >Activo</option>
                                                        <option value="2" selected>Dinero</option>
                                                        <%}%>
                                                    </select>
                                                </div>
                                            </div>
                                            <!-- Description -->
                                            <div>
                                                <label class="form-label">Descripción <span class="text-muted"></span></label>
                                                <textarea required class="form-control" name="descripcion" rows="7" maxlength="500" id="descripcion" style="resize: none;"><%=publicacion.getDescripcion()%></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Second column -->
                                    <!-- Media -->
                                    <div class="card mb-1">
                                        <div class="card-header d-flex justify-content-between align-items-center">
                                            <h5 class="mb-0 card-title" style="color: #3318ca;">Imagen</h5>
                                        </div>
                                        <div class="card-body">
                                            <input disabled class="form-control" type="file" id="fotoPubli" name="foto" accept="image/*" />
                                        </div>
                                    </div>
                                </div>
                                <!-- Third-->
                                <div class="col-12 col-lg-6">
                                    <!-- Product Information -->
                                    <div class="card mb-4">
                                        <div class="card-header">
                                            <h5 class="card-tile mb-0" style="color: #3318ca;">Detalles</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="row mb-3">
                                                <div class="col">
                                                    <label class="form-label" for="punto_de_acopio">Punto de Acopio</label>
                                                    <input type="text" required class="form-control" value="<%=donacion.getPuntoAcopio()%>" id="punto_de_acopio" placeholder="Indique el Punto de Acopio" name="punto_de_acopio" aria-label="Product title">
                                                </div>
                                                <div class="col">
                                                    <label class="form-label" for="motivo_donacion">Motivo Donación</label>
                                                    <input type="text" class="form-control" value="<%=donacion.getMotivoDonacion()%>" id="motivo_donacion" placeholder="Indique el motivo de la Donación" name="motivo_donacion" aria-label="Product title">
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col">
                                                    <label class="form-label" for="cantidad">Cantidad Monetaria</label>
                                                    <input type="text" class="form-control" value="<%=donacion.getCantidad()%>" id="cantidad" placeholder="Indique el Monto Objetivo" name="cantidad" aria-label="Product title">
                                                </div>
                                                <div class="col">
                                                    <label class="form-label" for="marca">Marca</label>
                                                    <input type="text" class="form-control" value="<%=donacion.getMarca()%>" id="marca" placeholder="Indique la Marca de la Donacion" name="marca" aria-label="Product title">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Fourth-->
                                    <!-- Product Information -->
                                    <div class="card mb-4">
                                        <div class="card-header">
                                            <h5 class="card-tile mb-0" style="color: #3318ca;">Información de Contacto</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="row mb-3">
                                                <div class="col">
                                                    <label class="form-label" for="contacto_nombre">Nombre</label>
                                                    <input type="text" required class="form-control" value="<%=donacion.getNombreContacto()%>" id="contacto_nombre" placeholder="Nombre de Contacto" name="contacto_nombre" aria-label="Product title">
                                                </div>
                                                <div class="col">
                                                    <label class="form-label" for="contacto_numero">Número de Contacto</label>
                                                    <input type="text" required class="form-control" value="<%=donacion.getTelefonoContacto()%>" id="contacto_numero" placeholder="Indique un número de Contacto" name="contacto_numero" aria-label="Product title">
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col">
                                                    <label class="form-label" >Fecha de Recepción Inicio</label>
                                                    <input type="date" required class="form-control" value="<%=donacion.getFechaRecepcionInicio()%>" id="fecha_recepcion_inicio" name="fecha_recepcion_inicio" aria-label="Product title">
                                                </div>
                                                <div class="col">
                                                    <label class="form-label" >Fecha de Recepción Final</label>
                                                    <input type="date" required class="form-control" value="<%=donacion.getFechaRecepcionFin()%>" id="fecha_recepcion_final" name="fecha_recepcion_final" aria-label="Product title">
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" >Hora de Recepción</label>
                                                <input type="time" class="form-control" id="hora_recepcion" value="<%=donacion.getHoraRecepcion()%>" name="hora_recepcion" aria-label="Product title">
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>

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

            </div>

        </div>
    </div>
</div>
<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->

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

<script>
    // Asegúrate de que el DOM esté cargado antes de ejecutar tu script
    document.getElementById('confirm-text').addEventListener('click', function() {
        Swal.fire({
            title: "¿Estás seguro?",
            text: "Deseas Publicar la nueva Publicación",
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
                document.getElementById('formPublis').submit();
            }
        });



        // Botón "Cancelar"
        document.querySelector('.cancel-subscription').addEventListener('click', function() {
            window.location.href = "/PublicacionesServlet"; // Cambia esta ruta según tu necesidad
        });
    });

</script>

<script>
    document.getElementById("cantidad").addEventListener("input", function() {
        // Solo permite números y elimina cualquier carácter que no sea un número
        this.value = this.value.replace(/[^0-9]/g, '');
    });

</script>

<script>
    document.getElementById("contacto_numero").addEventListener("input", function() {
        // Solo permite números y elimina cualquier carácter que no sea un número
        this.value = this.value.replace(/[^0-9]/g, '');
    });
</script>

<script>
    // Función para reemplazar valores "null" en todos los inputs
    function replaceNullInInputs() {
        // Seleccionar todos los elementos <input> en la página
        const inputs = document.querySelectorAll("input");

        // Iterar sobre cada input y verificar su valor
        inputs.forEach(input => {
            if (input.value === "null") {
                input.value = ""; // Reemplazar el valor por una cadena vacía
            }
        });
    }
    // Ejecutar la función cuando la página se haya cargado
    document.addEventListener("DOMContentLoaded", replaceNullInInputs);
</script>

<!-- Page JS -->
<script src="${pageContext.request.contextPath}/assets/js/app-ecommerce-product-add.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/extended-ui-sweetalert2.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/forms-selects.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/forms-tagify.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/forms-typeahead.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/modal-edit-user.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/modal-enable-otp.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app-user-view.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app-user-view-security.js"></script>


</body>


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/app-ecommerce-product-add.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:14:10 GMT -->
</html>

<!-- beautify ignore:end -->
