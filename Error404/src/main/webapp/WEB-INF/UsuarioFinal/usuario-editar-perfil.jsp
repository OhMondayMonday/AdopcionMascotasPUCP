<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="usuario" class="Beans.Usuarios" scope="request" />
<jsp:useBean id="rol" class="Beans.Roles" scope="request" />
<jsp:setProperty name="usuario" property="*" />
<jsp:setProperty name="rol" property="*" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html lang="es" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="../../assets/" data-template="vertical-menu-template-semi-dark">


    <!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:06 GMT -->
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

        <title>Editar Perfil | Usuario</title>

        <meta name="description" content="Most Powerful &amp; Comprehensive Bootstrap 5 Admin Dashboard built for developers!" />
        <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
        <!-- Canonical SEO -->
        <link rel="canonical" href="https://themeselection.com/item/sneat-dashboard-pro-bootstrap/">

        <!-- ? PROD Only: Google Tag Manager (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
        <script>
            (function(w, d, s, l, i) {
                w[l] = w[l] || [];
                w[l].push({
                    'gtm.start': new Date().getTime(),
                    event: 'gtm.js'
                });
                var f = d.getElementsByTagName(s)[0],
                    j = d.createElement(s),
                    dl = l != 'dataLayer' ? '&l=' + l : '';
                j.async = true;
                j.src = 'https://www.googletagmanager.com/gtm5445.html?id=' + i + dl;
                f.parentNode.insertBefore(j, f);
            })(window, document, 'script', 'dataLayer', 'GTM-5DDHKGP');
        </script>
        <!-- End Google Tag Manager -->

        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="https://demos.themeselection.com/sneat-bootstrap-html-admin-template/assets/img/favicon/favicon.ico" />

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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/@form-validation/form-validation.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/animate-css/animate.css" />

        <!-- Page CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/pages/page-faq.css" />

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

        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">
                <div class="layout-page">
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

                                                    <div class="mt-3 d-flex align-items-center flex-column">

                                                        <img class="img-fluid rounded my-3" src="https://img.freepik.com/vector-gratis/diseno-plantilla-imagen-perfil_742173-22027.jpg?t=st=1726637844~exp=1726641444~hmac=f81927ff296e19d666bcbbd27413900024f764855e07caa5d1a64d3e3d1c4f9d&w=826" height="120" width="120" alt="User avatar" />

                                                        <div class="user-info text-center">
                                                            <h4 class="mt-3" style="color: #1f4397;">${usuario.nombre} ${usuario.apellido}</h4>
                                                            <span class="badge bg-label-success">Activo</span>
                                                        </div>

                                                    </div>
                                                </div>

                                                <h5 class="pb-2 border-bottom mt-4 mb-4">Algunos Detalles</h5>

                                                <div class="info-container justify-content-center">
                                                    <ul class="list-unstyled">
                                                        <li class="mb-6">
                                                            <span class="fw-medium me-2">Nombre Completo:</span>
                                                            <span>${usuario.nombre} ${usuario.apellido}</span>
                                                        </li>
                                                        <li class="mb-6">
                                                            <span class="fw-medium me-2">Nombre de Usuario:</span>
                                                            <span>${usuario.username}</span>
                                                        </li>
                                                        <li class="mb-3">
                                                            <span class="fw-medium me-2 bold">Descripción:</span>
                                                            <span>${usuario.descripcion}</span>
                                                        </li>
                                                        <li class="mb-6">
                                                            <span class="fw-medium me-2">Correo:</span>
                                                            <span>${usuario.email}</span>
                                                        </li>
                                                        <li class="mb-6">
                                                            <span class="fw-medium me-2">Teléfono:</span>
                                                            <span>${usuario.numeroYapePlin}</span>
                                                        </li>
                                                        <li class="mb-6">
                                                            <span class="fw-medium me-2">Fecha de Nacimiento: </span>
                                                            <span>${usuario.fechaNacimiento}</span>
                                                        </li>

                                                    </ul>


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

                                                <li class="nav-item">
                                                    <button class="nav-link" data-bs-toggle="tab" data-bs-target="#form-tabs-social" role="tab" aria-selected="false">Redes Sociales</button>
                                                </li>
                                            </ul>

                                                <form id="miFormularioPersonal" action="UsuarioServlet?action=actualizar" method="post">
                                                    <input type="hidden" name="id" value="1">

                                                    <!-- Información Básica Tab -->
                                                    <div class="tab-content">
                                                    <div class="tab-pane fade active show" id="form-tabs-personal" role="tabpanel">
                                                        <div class="row g-3">
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="nombre">Nombre</label>
                                                                <input type="text" id="nombre" name="nombre" class="form-control" value="${usuario.nombre}" required />
                                                            </div>

                                                            <div class="col-md-6">
                                                                <label class="form-label" for="apellido">Apellido</label>
                                                                <input type="text" id="apellido" name="apellido" class="form-control" value="${usuario.apellido}" required />
                                                            </div>

                                                            <div class="col-md-6">
                                                                <label class="form-label" for="username">Nombre de Usuario</label>
                                                                <input type="text" id="username" name="username" class="form-control" value="${usuario.username}" required />
                                                            </div>

                                                            <div class="col-md-6">
                                                                <label class="form-label" for="email">Correo Electrónico</label>
                                                                <input type="email" id="email" name="email" class="form-control" value="${usuario.email}" required />
                                                            </div>


                                                            <div class="col-md-6">
                                                                <label class="form-label" for="distrito">Distrito</label>
                                                                <select id="distrito" name="distrito" class="select2 form-select form-select-lg" data-allow-clear="true">
                                                                    <option value="AK">Ancón</option>
                                                                    <option value="HI">Ate</option>
                                                                    <option value="CA">Barranco</option>
                                                                    <option value="NV">Breña</option>
                                                                    <option value="OR">Carabayllo</option>
                                                                    <option value="WA">Chaclacayo</option>
                                                                    <option value="AZ">Chorrillos</option>
                                                                    <option value="CO">Cineguilla</option>
                                                                    <option value="ID">Comas</option>
                                                                    <option value="MT">El Agustino</option>
                                                                    <option value="NE">Independencia</option>
                                                                    <option value="NM">Jesús María</option>
                                                                    <option value="ND">La Molina</option>
                                                                    <option value="UT">La Victoria</option>
                                                                    <option value="WY">Lima</option>
                                                                    <option value="AL">Lince</option>
                                                                    <option value="AR">Los Olivos</option>
                                                                    <option value="IL">Lurigancho</option>
                                                                    <option value="IA">Lurín</option>
                                                                    <option value="KS">Magdalena del Mar</option>
                                                                    <option value="KY">Miraflores</option>
                                                                    <option value="LA">Pachacámac</option>
                                                                    <option value="MN">Pucusana</option>
                                                                    <option value="MS">Pueblo Libre</option>
                                                                    <option value="MO">Puente Piedra</option>
                                                                    <option value="OK">Punta Hermosa</option>
                                                                    <option value="SD">Punta Negra</option>
                                                                    <option value="TX">Rímac</option>
                                                                    <option value="TN">San Bartolo</option>
                                                                    <option value="WI">San Borja</option>
                                                                    <option value="CT">San Isidro</option>
                                                                    <option value="DE">San Juan de Lurigancho</option>
                                                                    <option value="FL">San Juan de Miraflores</option>
                                                                    <option value="GA">San Luis</option>
                                                                    <option value="IN">San Martín de Porres</option>
                                                                    <option value="ME">San Miguel</option>
                                                                    <option value="MD">Santa Anita</option>
                                                                    <option value="MA">Santa María del Mar</option>
                                                                    <option value="MI">Santa Rosa</option>
                                                                    <option value="NH">Santiago de Surco</option>
                                                                    <option value="NJ">Surquillo</option>
                                                                    <option value="NY">Villa El Salvador</option>
                                                                    <option value="NC">Villa María del Triunfo</option>
                                                                </select>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <label class="form-label" for="fecha_nacimiento">Fecha de Nacimiento</label>
                                                                <input class="form-control" name="fecha_nacimiento" type="date" id="fecha_nacimiento" value="${usuario.fechaNacimiento}" />
                                                            </div>

                                                            <div class="col-md-6">
                                                                <label class="form-label" for="telefono_contacto">Teléfono Contacto</label>
                                                                <div class="input-group input-group-merge">
                                                                    <span id="telefono_contacto" class="input-group-text"><i class="bx bx-phone"></i></span>
                                                                    <input type="text" name="numero_yape_plin" id="telefono_contacto1" class="form-control phone-mask" placeholder="999 999 999" value="${usuario.numeroYapePlin}" />
                                                                </div>
                                                            </div>

                                                            <div class="col-md-12">
                                                                <label class="form-label" for="descripcion">Sobre mí</label>
                                                                <textarea id="descripcion" name="descripcion" class="form-control" rows="2" placeholder="Ingresa una descripción sobre ti">${usuario.descripcion}</textarea>
                                                            </div>

                                                            <div class="col-md-12">
                                                                <label class="form-label" for="nuevaFoto">Nueva Foto</label>
                                                                <input type="file" id="nuevaFoto" name="nuevaFoto" class="form-control" accept="image/*" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                                <!-- Tab de Redes Sociales -->
                                                    <div class="tab-pane fade" id="form-tabs-social" role="tabpanel">
                                                        <div class="row g-3">
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="twitter-link">Twitter</label>
                                                                <div class="input-group input-group-merge">
                                                                    <span id="twitter-icon" class="input-group-text"><i class="bx bxl-twitter"></i></span>
                                                                    <input type="text" id="twitter-link" name="urlTwitter" class="form-control" value="${usuario.urlTwitter}" placeholder="https://twitter.com/abc" />
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <label class="form-label" for="facebook-link">Facebook</label>
                                                                <div class="input-group input-group-merge">
                                                                    <span id="facebook-icon" class="input-group-text"><i class="bx bxl-facebook-circle"></i></span>
                                                                    <input type="url" id="facebook-link" name="urlFacebook" class="form-control" value="${usuario.urlFacebook}" placeholder="https://facebook.com/abc" />
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <label class="form-label" for="instagram-link">Instagram</label>
                                                                <input type="url" id="instagram-link" name="urlInstagram" class="form-control" value="${usuario.urlInstagram}" placeholder="https://instagram.com/abc" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- Botones de Acción -->
                                                    <div class="pt-4">
                                                        <button type="submit" class="btn btn-success me-sm-3 me-1"><span style="font-weight: bold;">Confirmar</span></button>
                                                        <button type="button" class="btn btn-danger cancel-subscription me-sm-3 me-1">Cancelar</button>
                                                    </div>
                                                    </div>

                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
                    </div>
                </div>
            </div>
        </div>

        <!-- Scripts con Context Path -->
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
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/@form-validation/form-validation.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/@form-validation/bootstrap5.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/libs/@form-validation/auto-focus.js"></script>

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
