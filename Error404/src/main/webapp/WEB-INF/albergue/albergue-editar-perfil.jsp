<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="usuario" class="Beans.Usuarios" scope="request" />
<jsp:useBean id="rol" class="Beans.Roles" scope="request" />
<jsp:setProperty name="usuario" property="*" />
<jsp:setProperty name="rol" property="*" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html lang="es" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="../../assets/" data-template="vertical-menu-template-semi-dark">


    <!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:06 GMT -->
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

        <title>Editar Perfil</title>

        <meta name="description" content="Most Powerful &amp; Comprehensive Bootstrap 5 Admin Dashboard built for developers!" />
        <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">

        <!-- Canonical SEO -->
        <link rel="canonical" href="https://themeselection.com/item/sneat-dashboard-pro-bootstrap/">

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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/pages/page-faq.css" />

        <!-- Helpers -->
        <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>
        <!-- Template customizer & Theme config files -->
        <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>


    </head>

    <body>


        <!-- ?PROD Only: Google Tag Manager (noscript) (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
        <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
        <!-- End Google Tag Manager (noscript) -->

        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-content-navbar" style="background-color: #fff1ef;">
            <div class="layout-container">
                <jsp:include page="../includes/sidebarAlbergue.jsp" />
                <div class="layout-page">
                    <jsp:include page="../includes/navbarAlbergue.jsp"/>
                    <div class="content-wrapper">

                        <!-- Content -->

                        <div class="container-xxl flex-grow-1 container-p-y">
                            <div class="app-ecommerce">
                                <div class="d-flex flex-wrap justify-content-between align-items-center mb-3">
                                </div>
                                <div class="row">
                                    <div class="col-xl-4 col-lg-5 col-md-5 order-0 order-md-0">
                                        <div class="card mb-4">
                                            <div class="card-body">
                                                <div class="user-avatar-section">
                                                    <div class="mt-3 d-flex align-items-center flex-column">

                                                        <img class="img-fluid rounded my-3" src="https://img.freepik.com/vector-gratis/fondo-bonito-cara-sonriente-animales-felices-decorativos_23-2147590101.jpg?t=st=1726640655~exp=1726644255~hmac=810a73c0148e1c4d1ecb3b4af4a0d1b18f8dfe3d48ec5d695b0282ec0570e8d0&w=826" height="120" width="120" alt="User avatar" />

                                                        <div class="user-info text-center">
                                                            <h4 class="mt-3" style="color: #8a2a92cd;">${usuario.nombreAlbergue}</h4>
                                                            <span class="badge bg-label-danger">Albergue</span>
                                                        </div>

                                                    </div>
                                                </div>
                                                <h5 class="pb-2 border-bottom mt-4 mb-4">Algunos Detalles</h5>
                                                <div class="info-container justify-content-center">
                                                    <ul class="list-unstyled">
                                                        <li class="mb-3">
                                                            <span class="fw-medium me-2">Nombre completo:</span>
                                                            <span>${usuario.nombre} ${usuario.apellido}</span>
                                                        </li>
                                                        <li class="mb-3">
                                                            <span class="fw-medium me-2">Nombre de Usuario:</span>
                                                            <span>${usuario.username}</span>
                                                        </li>
                                                        <li class="mb-3">
                                                            <span class="fw-medium me-2 bold">Descripción:</span>
                                                            <span> ${usuario.descripcion}
                                                            </span>
                                                        </li>

                                                        <li class="mb-3">
                                                            <span class="fw-medium me-2">Correo:</span>
                                                            <span>${usuario.email}</span>
                                                        </li>
                                                        <li class="mb-3">
                                                            <span class="fw-medium me-2">Teléfono:</span>
                                                            <span>${usuario.numeroContactoDonaciones}</span>
                                                        </li>
                                                        <li class="mb-3">
                                                            <span class="fw-medium me-2">Fecha de Creación: </span>
                                                            <span>${usuario.fechaRegistro}</span>
                                                        </li>

                                                    </ul>


                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- Third-->
                                    <div class="col">
                                        <div class="nav-align-top mb-3">
                                            <ul class="nav nav-tabs" role="tablist">
                                                <li class="nav-item">
                                                    <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#form-tabs-personal" role="tab" aria-selected="true">Información Básica</button>
                                                </li>
                                                <li class="nav-item">
                                                    <button class="nav-link" data-bs-toggle="tab" data-bs-target="#form-tabs-donations" role="tab" aria-selected="false">Donaciones</button>
                                                </li>

                                                <li class="nav-item">
                                                    <button class="nav-link" data-bs-toggle="tab" data-bs-target="#form-tabs-social" role="tab" aria-selected="false">Redes Sociales</button>
                                                </li>
                                            </ul>
                                            <form id="miFormularioPersonal" action="${pageContext.request.contextPath}/albergue?action=actualizar" method="post">
                                                <!-- Campo oculto para el ID del usuario -->
                                                <input type="hidden" name="id" value=27>
                                                <div class="tab-content">
                                                    <div class="tab-pane fade active show" id="form-tabs-personal" role="tabpanel">

                                                        <div class="row g-3">
                                                            <!-- Campo Nombre del Albergue -->
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="formtabs-first-name">Nombre Albergue</label>
                                                                <input type="text" id="formtabs-first-name" name="nombreAlbergue" class="form-control"
                                                                       value="${usuario.nombreAlbergue}" placeholder="Nombre de albergue" required />
                                                            </div>

                                                            <!-- (Username) -->
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="formtabs-alias">User:</label>
                                                                <input type="text" id="formtabs-alias" name="username" class="form-control"
                                                                       value="${usuario.username}" placeholder="Alias" required />
                                                            </div>

                                                            <!-- Nombre de Usuario -->
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="formtabs-username">Nombre:</label>
                                                                <input type="text" id="formtabs-username" name="nombre" class="form-control"
                                                                       value="${usuario.nombre}" placeholder="Nombre de usuario" required />
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="formtabs-apellido">Apellido:</label>
                                                                <input type="text" id="formtabs-apellido" name="apellido" class="form-control"
                                                                       value="${usuario.apellido}" placeholder="Apellido" required />
                                                            </div>

                                                            <div class="col-md-6">
                                                                <label class="form-label" for="distrito">Distrito:</label>
                                                                <select id="distrito" name="distritoId" class="form-select" required>
                                                                    <option value="" disabled selected>Seleccione un distrito</option>
                                                                    <option value="1">Ancón</option>
                                                                    <option value="2">Ate</option>
                                                                    <option value="3">Barranco</option>
                                                                    <option value="4">Breña</option>
                                                                    <option value="5">Carabayllo</option>
                                                                    <option value="6">Chaclacayo</option>
                                                                    <option value="7">Chorrillos</option>
                                                                    <option value="8">Cieneguilla</option>
                                                                    <option value="9">Comas</option>
                                                                    <option value="10">El Agustino</option>
                                                                    <option value="11">Independencia</option>
                                                                    <option value="12">Jesús María</option>
                                                                    <option value="13">La Molina</option>
                                                                    <option value="14">La Victoria</option>
                                                                    <option value="15">Lima</option>
                                                                    <option value="16">Lince</option>
                                                                    <option value="17">Los Olivos</option>
                                                                    <option value="18">Lurigancho</option>
                                                                    <option value="19">Lurín</option>
                                                                    <option value="20">Magdalena del Mar</option>
                                                                    <option value="21">Miraflores</option>
                                                                    <option value="22">Pachacámac</option>
                                                                    <option value="23">Pucusana</option>
                                                                    <option value="24">Pueblo Libre</option>
                                                                    <option value="25">Puente Piedra</option>
                                                                    <option value="26">Punta Hermosa</option>
                                                                    <option value="27">Punta Negra</option>
                                                                    <option value="28">Rímac</option>
                                                                    <option value="29">San Bartolo</option>
                                                                    <option value="30">San Borja</option>
                                                                    <option value="31">San Isidro</option>
                                                                    <option value="32">San Juan de Lurigancho</option>
                                                                    <option value="33">San Juan de Miraflores</option>
                                                                    <option value="34">San Luis</option>
                                                                    <option value="35">San Martín de Porres</option>
                                                                    <option value="36">San Miguel</option>
                                                                    <option value="37">Santa Anita</option>
                                                                    <option value="38">Santa María del Mar</option>
                                                                    <option value="39">Santa Rosa</option>
                                                                    <option value="40">Santiago de Surco</option>
                                                                    <option value="41">Surquillo</option>
                                                                    <option value="42">Villa El Salvador</option>
                                                                    <option value="43">Villa María del Triunfo</option>
                                                                </select>
                                                                <small class="form-text text-muted">Seleccione su distrito de la lista.</small>
                                                            </div>


                                                            <!-- Nombre de Usuario -->
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="formtabs-direccion">Ubicacion:</label>
                                                                <input type="text" id="formtabs-direccion" name="direccion" class="form-control"
                                                                       value="${usuario.direccion}" placeholder="Dirección" required />
                                                            </div>
                                                        <div class="col-md-6">
                                                            <label class="form-label" for="formtabs-email">Correo Electrónico</label>
                                                            <input type="email" id="formtabs-email" name="email" class="form-control"
                                                                   value="${usuario.email}" placeholder="usuario@ejemplo.com" required />
                                                        </div>

                                                            <div class="col-md-6">
                                                                <label class="form-label" for="capacidad">Capacidad:</label>
                                                                <input type="number" id="capacidad" name="capacidad" class="form-control"
                                                                       min="0" step="1" placeholder="Ingrese la capacidad"
                                                                       oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/^0+/, '');" required />
                                                            </div>

                                                            <div class="col-md">
                                                                <label class="form-label" for="collapsible-description">Descripción</label>
                                                                <textarea id="collapsible-description" name="descripcion" class="form-control" rows="2"
                                                                          placeholder="Ingresa una descripción">${usuario.descripcion}</textarea>
                                                            </div>


                                                            <div class="mb-1">
                                                            <div class="card-body">
                                                                <form action="https://demos.themeselection.com/upload" class="dropzone needsclick" id="dropzone-photo-upload">
                                                                </form>
                                                            </div>
                                                            </div>

                                                    <!-- Donaciones -->
                                                    <div class="tab-pane fade" id="form-tabs-donations" role="tabpanel">
                                                        <div class="row g-3">
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="donation-contact-name">Nombre donaciones:</label>
                                                                <input type="text" id="donation-contact-name" name="nombreContactoDonaciones" class="form-control"
                                                                       value="${usuario.nombreContactoDonaciones != null ? usuario.nombreContactoDonaciones : ''}"
                                                                       placeholder="Nombre del contacto" />
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="numero-donaciones">Número de Donaciones:</label>
                                                                <input type="text" id="numero-donaciones" name="numeroContactoDonaciones" class="form-control"
                                                                       value="${usuario.numeroContactoDonaciones != null ? usuario.numeroContactoDonaciones : ''}"
                                                                       placeholder="Ingrese número de donaciones" />
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="direccion-acopio">Dirección acopio:</label>
                                                                <input type="text" id="direccion-acopio" name="direccionDonaciones" class="form-control"
                                                                       value="${usuario.direccionDonaciones != null ? usuario.direccionDonaciones : ''}"
                                                                       placeholder="Dirección del acopio" />
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="donation-acopio">Centro acopio:</label>
                                                                <input type="text" id="donation-acopio" name="puntoAcopio" class="form-control"
                                                                       value="${usuario.puntoAcopio != null ? usuario.puntoAcopio : ''}"
                                                                       placeholder="Nombre del centro de acopio" />

                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="yape-contact">YAPE/PLIN:</label>
                                                                <input type="text" id="yape-contact" name="numeroYapePlin" class="form-control"
                                                                       value="${usuario.numeroYapePlin}" placeholder="999 999 999" />
                                                            </div>
                                                            <div class="row align-items-center mt-4">
                                                                <label class="form-label" for="qr-yape">QR Yape</label>
                                                                <img style="width: 40%; height: auto;" src="https://i.ibb.co/FwZZ3Xy/qr33.png" alt="qr">
                                                                <div class="col-md-6">
                                                                    <label for="qr-yape" class="form-label">Subir Foto</label>
                                                                    <input class="form-control" type="file" id="qr-yape" name="qrYapeFoto" accept="image/*" />
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>


                                                    <div class="tab-pane fade" id="form-tabs-social" role="tabpanel">
                                                        <div class="row g-3">

                                                            <div class="col-md-6">
                                                                <label class="form-label" for="facebook-link">Facebook</label>
                                                                <div class="input-group input-group-merge">
                                                                    <span id="facebook-icon" class="input-group-text"><i class="bx bxl-facebook-circle"></i></span>
                                                                    <input type="url" id="facebook-link" name="urlFacebook" class="form-control"
                                                                           value="${usuario.urlFacebook}" placeholder="https://facebook.com/abc" />
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <label class="form-label" for="instagram-link">Instagram</label>
                                                                <input type="url" id="instagram-link" name="urlInstagram" class="form-control"
                                                                       value="${usuario.urlInstagram}" placeholder="https://instagram.com/abc" />
                                                            </div>

                                                        </div>


                                                    </div>


                                                    <div class="pt-4">
                                                        <button type="button" class="btn btn-success me-sm-3 me-1" id="confirm-text"><span style="font-weight: bold;">Confirmar</span></button>
                                                        <button class="btn btn-danger cancel-subscription me-sm-3 me-1">Cancelar</button>
                                                    </div>
                                                </div>

                                            </form>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
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
                    window.location.href = "/usuario-editar-perfil.jsp"; // Cambia esta ruta según tu necesidad
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

<!-- beautify ignore:end -->