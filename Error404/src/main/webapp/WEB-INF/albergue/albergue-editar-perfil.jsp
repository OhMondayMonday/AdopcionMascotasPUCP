<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="usuario" class="Beans.Usuarios" scope="request" /> --%>
<jsp:useBean id="rol" class="Beans.Roles" scope="request" />
<jsp:setProperty name="usuario" property="*" />
<jsp:setProperty name="rol" property="*" />


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
                                                            <span class="fw-medium me-2">Nombre:</span>
                                                            <span>${usuario.nombre} ${usuario.apellido}</span>
                                                        </li>
                                                        <li class="mb-3">
                                                            <span class="fw-medium me-2">Nombre de Usuario:</span>
                                                            <span>${usuario.username}</span>
                                                        </li>
                                                        <li class="mb-3">
                                                            <span class="fw-medium me-2 bold">Descripción:</span>
                                                            <span> ${usuario.descripcion}
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
                                                        <!-- Campo oculto para el ID del usuario -->
                                                        <input type="hidden" name="id" value="1">

                                                        <div class="row g-3">
                                                            <!-- Campo Nombre del Albergue -->
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="formtabs-first-name">Nombre Albergue</label>
                                                                <input type="text" id="formtabs-first-name" name="nombreAlbergue" class="form-control"
                                                                       value="${usuario.nombreAlbergue}" placeholder="Nombre de albergue" required />
                                                            </div>

                                                            <!-- Alias (Username) -->
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="formtabs-alias">Alias</label>
                                                                <input type="text" id="formtabs-alias" name="username" class="form-control"
                                                                       value="${usuario.username}" placeholder="Alias" required />
                                                            </div>

                                                            <!-- Nombre de Usuario -->
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="formtabs-username">Nombre de usuario</label>
                                                                <input type="text" id="formtabs-username" name="nombre" class="form-control"
                                                                       value="${usuario.nombre}" placeholder="Nombre de usuario" required />
                                                            </div>
                                                        <div class="col-md-6">
                                                            <label class="form-label" for="formtabs-email">Correo Electrónico</label>
                                                            <input type="email" id="formtabs-email" name="email" class="form-control"
                                                                   value="${usuario.email}" placeholder="usuario@ejemplo.com" required />
                                                        </div>

                                                            <div class="col-md-6">
                                                                <label class="form-label" for="formtabs-district">Distrito</label>
                                                                <select id="formtabs-district" name="distritoId" class="select2 form-select form-select-lg">
                                                                    <option value="1" ${usuario.distrito != null && usuario.distrito.distritoId == 1 ? 'selected' : ''}>Ancón</option>
                                                                    <option value="2" ${usuario.distrito != null && usuario.distrito.distritoId == 2 ? 'selected' : ''}>Ate</option>
                                                                    <option value="3" ${usuario.distrito != null && usuario.distrito.distritoId == 3 ? 'selected' : ''}>Barranco</option>
                                                                    <option value="4" ${usuario.distrito != null && usuario.distrito.distritoId == 4 ? 'selected' : ''}>Breña</option>
                                                                    <option value="5" ${usuario.distrito != null && usuario.distrito.distritoId == 5 ? 'selected' : ''}>Carabayllo</option>
                                                                    <option value="6" ${usuario.distrito != null && usuario.distrito.distritoId == 6 ? 'selected' : ''}>Chaclacayo</option>
                                                                    <option value="7" ${usuario.distrito != null && usuario.distrito.distritoId == 7 ? 'selected' : ''}>Chorrillos</option>
                                                                    <option value="8" ${usuario.distrito != null && usuario.distrito.distritoId == 8 ? 'selected' : ''}>Cineguilla</option>
                                                                    <option value="9" ${usuario.distrito != null && usuario.distrito.distritoId == 9 ? 'selected' : ''}>Comas</option>
                                                                    <option value="10" ${usuario.distrito != null && usuario.distrito.distritoId == 10 ? 'selected' : ''}>El Agustino</option>
                                                                    <option value="11" ${usuario.distrito != null && usuario.distrito.distritoId == 11 ? 'selected' : ''}>Independencia</option>
                                                                    <option value="12" ${usuario.distrito != null && usuario.distrito.distritoId == 12 ? 'selected' : ''}>Jesús María</option>
                                                                    <option value="13" ${usuario.distrito != null && usuario.distrito.distritoId == 13 ? 'selected' : ''}>La Molina</option>
                                                                    <option value="14" ${usuario.distrito != null && usuario.distrito.distritoId == 14 ? 'selected' : ''}>La Victoria</option>
                                                                    <option value="15" ${usuario.distrito != null && usuario.distrito.distritoId == 15 ? 'selected' : ''}>Lima</option>
                                                                    <option value="16" ${usuario.distrito != null && usuario.distrito.distritoId == 16 ? 'selected' : ''}>Lince</option>
                                                                    <option value="17" ${usuario.distrito != null && usuario.distrito.distritoId == 17 ? 'selected' : ''}>Los Olivos</option>
                                                                    <option value="18" ${usuario.distrito != null && usuario.distrito.distritoId == 18 ? 'selected' : ''}>Lurigancho</option>
                                                                    <option value="19" ${usuario.distrito != null && usuario.distrito.distritoId == 19 ? 'selected' : ''}>Lurín</option>
                                                                    <option value="20" ${usuario.distrito != null && usuario.distrito.distritoId == 20 ? 'selected' : ''}>Magdalena del Mar</option>
                                                                    <option value="21" ${usuario.distrito != null && usuario.distrito.distritoId == 21 ? 'selected' : ''}>Miraflores</option>
                                                                    <option value="22" ${usuario.distrito != null && usuario.distrito.distritoId == 22 ? 'selected' : ''}>Pachacámac</option>
                                                                    <option value="23" ${usuario.distrito != null && usuario.distrito.distritoId == 23 ? 'selected' : ''}>Pucusana</option>
                                                                    <option value="24" ${usuario.distrito != null && usuario.distrito.distritoId == 24 ? 'selected' : ''}>Pueblo Libre</option>
                                                                    <option value="25" ${usuario.distrito != null && usuario.distrito.distritoId == 25 ? 'selected' : ''}>Puente Piedra</option>
                                                                    <option value="26" ${usuario.distrito != null && usuario.distrito.distritoId == 26 ? 'selected' : ''}>Punta Hermosa</option>
                                                                    <option value="27" ${usuario.distrito != null && usuario.distrito.distritoId == 27 ? 'selected' : ''}>Punta Negra</option>
                                                                    <option value="28" ${usuario.distrito != null && usuario.distrito.distritoId == 28 ? 'selected' : ''}>Rímac</option>
                                                                    <option value="29" ${usuario.distrito != null && usuario.distrito.distritoId == 29 ? 'selected' : ''}>San Bartolo</option>
                                                                    <option value="30" ${usuario.distrito != null && usuario.distrito.distritoId == 30 ? 'selected' : ''}>San Borja</option>
                                                                    <option value="31" ${usuario.distrito != null && usuario.distrito.distritoId == 31 ? 'selected' : ''}>San Isidro</option>
                                                                    <option value="32" ${usuario.distrito != null && usuario.distrito.distritoId == 32 ? 'selected' : ''}>San Juan de Lurigancho</option>
                                                                    <option value="33" ${usuario.distrito != null && usuario.distrito.distritoId == 33 ? 'selected' : ''}>San Juan de Miraflores</option>
                                                                    <option value="34" ${usuario.distrito != null && usuario.distrito.distritoId == 34 ? 'selected' : ''}>San Luis</option>
                                                                    <option value="35" ${usuario.distrito != null && usuario.distrito.distritoId == 35 ? 'selected' : ''}>San Martín de Porres</option>
                                                                    <option value="36" ${usuario.distrito != null && usuario.distrito.distritoId == 36 ? 'selected' : ''}>San Miguel</option>
                                                                    <option value="37" ${usuario.distrito != null && usuario.distrito.distritoId == 37 ? 'selected' : ''}>Santa Anita</option>
                                                                    <option value="38" ${usuario.distrito != null && usuario.distrito.distritoId == 38 ? 'selected' : ''}>Santa María del Mar</option>
                                                                    <option value="39" ${usuario.distrito != null && usuario.distrito.distritoId == 39 ? 'selected' : ''}>Santa Rosa</option>
                                                                    <option value="40" ${usuario.distrito != null && usuario.distrito.distritoId == 40 ? 'selected' : ''}>Santiago de Surco</option>
                                                                    <option value="41" ${usuario.distrito != null && usuario.distrito.distritoId == 41 ? 'selected' : ''}>Surquillo</option>
                                                                    <option value="42" ${usuario.distrito != null && usuario.distrito.distritoId == 42 ? 'selected' : ''}>Villa El Salvador</option>
                                                                    <option value="43" ${usuario.distrito != null && usuario.distrito.distritoId == 43 ? 'selected' : ''}>Villa María del Triunfo</option>
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
                                                                   value="${usuario.anioCreacion}" min="1900-01-01" max="2099-12-31" />
                                                        </div>

                                                            <div class="col-md-6">
                                                                <label class="form-label" for="formtabs-contact-phone">Teléfono Contacto</label>
                                                                <div class="input-group input-group-merge">
                                                                    <span id="formtabs-contact-phone-icon" class="input-group-text"><i class="bx bx-phone"></i></span>
                                                                    <input type="text" id="formtabs-contact-phone" name="numeroContactoDonaciones" class="form-control"
                                                                           placeholder="999999999" pattern="\d{9}" title="Debe contener exactamente 9 números" maxlength="9"
                                                                    />



                                                                </div>
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

                                                    </div>
                                                    </form>

                                                </div>

                                                <div class="tab-pane fade" id="form-tabs-social" role="tabpanel">
                                                    <div>
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
                                                                <input type="text" id="yape-contact" name="numeroYapePlin" class="form-control" placeholder="999 999 999" />
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