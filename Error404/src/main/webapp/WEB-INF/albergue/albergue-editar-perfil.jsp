<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- <jsp:useBean id="usuario" class="Beans.Usuarios" scope="request" /> --%>
<%-- <jsp:useBean id="rol" class="Beans.Roles" scope="request" /> --%>
<%-- <jsp:setProperty name="usuario" property="*" /> --%>
<%-- <jsp:setProperty name="rol" property="*" /> --%>


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
                            <!-- Título
                            <h4 class="py-3 mb-4">
                              <span class="text-muted fw-light">Publicaciones /</span><span> Crear Nueva Publicación</span><span> | Donaciones Activas</span>
                            </h4>
                            -->
                            <div class="app-ecommerce">

                                <!-- Add Product -->
                                <div class="d-flex flex-wrap justify-content-between align-items-center mb-3">

                                </div>

                                <div class="row">
                                    <!-- First column-->
                                    <div class="col-xl-4 col-lg-5 col-md-5 order-0 order-md-0">
                                        <!-- User Card -->

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
                                                            <span class="fw-medium me-2">Nombre Completo:</span>
                                                            <span>${usuario.nombre} ${usuario.apellido}</span>
                                                        </li>
                                                        <li class="mb-3">
                                                            <span class="fw-medium me-2">Nombre de Usuario:</span>
                                                            <span>${usuario.username}</span>
                                                        </li>
                                                        <li class="mb-3">
                                                            <span class="fw-medium me-2 bold">Descripción:</span>
                                                            <span>Albergue Caritas es un refugio dedicado al rescate y cuidado de animales en situación de abandono o maltrato. Nos esforzamos por brindarles un espacio seguro y acogedor donde puedan recuperarse y encontrar el amor que merecen.
                            <br>
                            Si deseas ofrecer un hogar temporal, permanente, o unirte como voluntario, contáctame y juntos haremos la diferencia.
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
                                                            <span>${usuario.anioCreacion}</span>
                                                        </li>

                                                    </ul>


                                                </div>
                                            </div>
                                        </div>
                                        <!-- /User Card -->
                                        <!-- Plan Card -->

                                        <!-- /Plan Card -->
                                    </div>
                                    <!-- Third-->
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
                                            <div class="tab-content">
                                                <div class="tab-pane fade active show" id="form-tabs-personal" role="tabpanel">
                                                    <form id="miFormularioPersonal" action="${pageContext.request.contextPath}/albergue?action=actualizar" method="post">
                                                        <input type="hidden" name="id" value="${usuario.userId}">
                                                        <div class="row g-3">
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="formtabs-first-name">Nombre Albergue</label>
                                                                <input type="text" id="formtabs-first-name" name="nombreAlbergue" class="form-control" value="${usuario.nombreAlbergue}" placeholder="Nombre de albergue" required />
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="formtabs-alias">Alias</label>
                                                                <input type="text" id="formtabs-alias" name="username" class="form-control"
                                                                       value="${usuario.username}" placeholder="Alias" required/>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="formtabs-username">Nombre de usuario</label>
                                                                <input type="text" id="formtabs-username" name="nombre" class="form-control" value="${usuario.nombre}" placeholder="Nombre de usuario" required/>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="formtabs-email">Correo Electrónico</label>
                                                                <input type="email" id="formtabs-email" name="email" class="form-control"
                                                                       value="${usuario.email}" placeholder="usuario@ejemplo.com" required />
                                                            </div>

                                                            <div class="col-md-6">
                                                                <label class="form-label" for="formtabs-district">Distrito</label>
                                                                <select id="formtabs-district" name="distritoId" class="select2 form-select form-select-lg">
                                                                    <option value="AK" ${usuario.distrito.nombreDistrito == 'Ancón' ? 'selected' : ''}>Ancón</option>
                                                                    <option value="HI" ${usuario.distrito.nombreDistrito == 'Ate' ? 'selected' : ''}>Ate</option>
                                                                    <option value="CA" ${usuario.distrito.nombreDistrito == 'Barranco' ? 'selected' : ''}>Barranco</option>
                                                                    <option value="NV" ${usuario.distrito.nombreDistrito == 'Breña' ? 'selected' : ''}>Breña</option>
                                                                    <option value="OR" ${usuario.distrito.nombreDistrito == 'Carabayllo' ? 'selected' : ''}>Carabayllo</option>
                                                                    <option value="WA" ${usuario.distrito.nombreDistrito == 'Chaclacayo' ? 'selected' : ''}>Chaclacayo</option>
                                                                    <option value="AZ" ${usuario.distrito.nombreDistrito == 'Chorrillos' ? 'selected' : ''}>Chorrillos</option>
                                                                    <option value="CO" ${usuario.distrito.nombreDistrito == 'Cineguilla' ? 'selected' : ''}>Cineguilla</option>
                                                                    <option value="ID" ${usuario.distrito.nombreDistrito == 'Comas' ? 'selected' : ''}>Comas</option>
                                                                    <option value="MT" ${usuario.distrito.nombreDistrito == 'El Agustino' ? 'selected' : ''}>El Agustino</option>
                                                                    <option value="NE" ${usuario.distrito.nombreDistrito == 'Independencia' ? 'selected' : ''}>Independencia</option>
                                                                    <option value="NM" ${usuario.distrito.nombreDistrito == 'Jesús María' ? 'selected' : ''}>Jesús María</option>
                                                                    <option value="ND" ${usuario.distrito.nombreDistrito == 'La Molina' ? 'selected' : ''}>La Molina</option>
                                                                    <option value="UT" ${usuario.distrito.nombreDistrito == 'La Victoria' ? 'selected' : ''}>La Victoria</option>
                                                                    <option value="WY" ${usuario.distrito.nombreDistrito == 'Lima' ? 'selected' : ''}>Lima</option>
                                                                    <option value="AL" ${usuario.distrito.nombreDistrito == 'Lince' ? 'selected' : ''}>Lince</option>
                                                                    <option value="AR" ${usuario.distrito.nombreDistrito == 'Los Olivos' ? 'selected' : ''}>Los Olivos</option>
                                                                    <option value="IL" ${usuario.distrito.nombreDistrito == 'Lurigancho' ? 'selected' : ''}>Lurigancho</option>
                                                                    <option value="IA" ${usuario.distrito.nombreDistrito == 'Lurín' ? 'selected' : ''}>Lurín</option>
                                                                    <option value="KS" ${usuario.distrito.nombreDistrito == 'Magdalena del Mar' ? 'selected' : ''}>Magdalena del Mar</option>
                                                                    <option value="KY" ${usuario.distrito.nombreDistrito == 'Miraflores' ? 'selected' : ''}>Miraflores</option>
                                                                    <option value="LA" ${usuario.distrito.nombreDistrito == 'Pachacámac' ? 'selected' : ''}>Pachacámac</option>
                                                                    <option value="MN" ${usuario.distrito.nombreDistrito == 'Pucusana' ? 'selected' : ''}>Pucusana</option>
                                                                    <option value="MS" ${usuario.distrito.nombreDistrito == 'Pueblo Libre' ? 'selected' : ''}>Pueblo Libre</option>
                                                                    <option value="MO" ${usuario.distrito.nombreDistrito == 'Puente Piedra' ? 'selected' : ''}>Puente Piedra</option>
                                                                    <option value="OK" ${usuario.distrito.nombreDistrito == 'Punta Hermosa' ? 'selected' : ''}>Punta Hermosa</option>
                                                                    <option value="SD" ${usuario.distrito.nombreDistrito == 'Punta Negra' ? 'selected' : ''}>Punta Negra</option>
                                                                    <option value="TX" ${usuario.distrito.nombreDistrito == 'Rímac' ? 'selected' : ''}>Rímac</option>
                                                                    <option value="TN" ${usuario.distrito.nombreDistrito == 'San Bartolo' ? 'selected' : ''}>San Bartolo</option>
                                                                    <option value="WI" ${usuario.distrito.nombreDistrito == 'San Borja' ? 'selected' : ''}>San Borja</option>
                                                                    <option value="CT" ${usuario.distrito.nombreDistrito == 'San Isidro' ? 'selected' : ''}>San Isidro</option>
                                                                    <option value="DE" ${usuario.distrito.nombreDistrito == 'San Juan de Lurigancho' ? 'selected' : ''}>San Juan de Lurigancho</option>
                                                                    <option value="FL" ${usuario.distrito.nombreDistrito == 'San Juan de Miraflores' ? 'selected' : ''}>San Juan de Miraflores</option>
                                                                    <option value="GA" ${usuario.distrito.nombreDistrito == 'San Luis' ? 'selected' : ''}>San Luis</option>
                                                                    <option value="IN" ${usuario.distrito.nombreDistrito == 'San Martín de Porres' ? 'selected' : ''}>San Martín de Porres</option>
                                                                    <option value="ME" ${usuario.distrito.nombreDistrito == 'San Miguel' ? 'selected' : ''}>San Miguel</option>
                                                                    <option value="MD" ${usuario.distrito.nombreDistrito == 'Santa Anita' ? 'selected' : ''}>Santa Anita</option>
                                                                    <option value="MA" ${usuario.distrito.nombreDistrito == 'Santa María del Mar' ? 'selected' : ''}>Santa María del Mar</option>
                                                                    <option value="MI" ${usuario.distrito.nombreDistrito == 'Santa Rosa' ? 'selected' : ''}>Santa Rosa</option>
                                                                    <option value="NH" ${usuario.distrito.nombreDistrito == 'Santiago de Surco' ? 'selected' : ''}>Santiago de Surco</option>
                                                                    <option value="NJ" ${usuario.distrito.nombreDistrito == 'Surquillo' ? 'selected' : ''}>Surquillo</option>
                                                                    <option value="NY" ${usuario.distrito.nombreDistrito == 'Villa El Salvador' ? 'selected' : ''}>Villa El Salvador</option>
                                                                    <option value="NC" ${usuario.distrito.nombreDistrito == 'Villa María del Triunfo' ? 'selected' : ''}>Villa María del Triunfo</option>
                                                                </select>
                                                            </div>

                                                            <div class="col-md-6 select2-primary">
                                                                <label class="form-label" for="formtabs-language">Idiomas</label>
                                                                <select id="formtabs-language" class="select2 form-select" multiple>
                                                                    <option value="es" selected>Español</option>
                                                                    <option value="en" selected>Inglés</option>
                                                                    <option value="pr">Portugués</option>
                                                                    <option value="fr">Francés</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="formtabs-creation-year">Año de Creación</label>
                                                                <input class="form-control" type="date" id="formtabs-creation-year" name="anioCreacion"
                                                                       value="${usuario.anioCreacion}" min="1900-01-01" max="2099-12-31" required />


                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="formtabs-contact-phone">Teléfono Contacto</label>
                                                                <div class="input-group input-group-merge">
                                                                    <span id="formtabs-contact-phone-icon" class="input-group-text"><i class="bx bx-phone"></i></span>
                                                                    <input type="text" id="formtabs-contact-phone" name="numeroContactoDonaciones" class="form-control"
                                                                           placeholder="999999999" pattern="\d{9}" title="Debe contener exactamente 9 números" maxlength="9" required />



                                                                </div>
                                                            </div>


                                                            <div class="col-md">
                                                                <label class="form-label" for="collapsible-address">Dirección completa</label>
                                                                <textarea id="collapsible-address" name="direccion" class="form-control" rows="2"
                                                                          placeholder="Ingresa tu dirección">${usuario.direccion}</textarea>
                                                            </div>

                                                        </div>

                                                        <div class="mb-1">
                                                            <div class="card-body">
                                                                <form action="https://demos.themeselection.com/upload" class="dropzone needsclick" id="dropzone-photo-upload">
                                                                </form>
                                                            </div>
                                                        </div>

                                                        <label class="form-label mt-2" for="new-photo-upload">Nueva Foto</label>
                                                        <input class="form-control" type="file" id="new-photo-upload" name="nuevaFoto" accept="image/*">


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

                                                <div class="tab-pane fade" id="form-tabs-social" role="tabpanel">
                                                    <form>
                                                        <div class="row g-3">
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="twitter-link">Twitter</label>
                                                                <div class="input-group input-group-merge">
                                                                    <span id="twitter-icon" class="input-group-text"><i class="bx bxl-twitter"></i></span>
                                                                    <input type="text" id="twitter-link" name="urlTwitter" class="form-control" placeholder="https://twitter.com/abc" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="facebook-link">Facebook</label>
                                                                <div class="input-group input-group-merge">
                                                                    <span id="facebook-icon" class="input-group-text"><i class="bx bxl-facebook-circle"></i></span>
                                                                    <input type="url" id="facebook-link" name="urlFacebook" class="form-control" placeholder="https://facebook.com/abc" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="yape-contact">YAPE</label>
                                                                <input type="text" id="yape-contact" name="numeroYapePlin" class="form-control" placeholder="999 999 999" required/>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="instagram-link">Instagram</label>
                                                                <input type="url" id="instagram-link" name="urlInstagram" class="form-control" placeholder="https://instagram.com/abc" />
                                                            </div>

                                                        </div>

                                                        <div class="row align-items-center mt-4">
                                                            <label class="form-label" for="qr-yape">QR Yape</label>
                                                            <img style="width: 40%; height: auto;" src="https://i.ibb.co/FwZZ3Xy/qr33.png" alt="qr">
                                                            <div class="col-md-6">
                                                                <label for="qr-yape" class="form-label">Subir Foto</label>
                                                                <input class="form-control" type="file" id="qr-yape" name="qrYapeFoto" accept="image/*" />
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
                        <!-- / Layout wrapper -->
                    </div>
                    <!-- / Layout page -->
                </div>
            </div>
        </div>
        </div>
        <!-- /Layout wrapper -->

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

<!-- beautify ignore:end -->