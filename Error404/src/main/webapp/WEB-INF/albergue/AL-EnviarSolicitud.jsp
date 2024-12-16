<%--
  Created by IntelliJ IDEA.
  User: Luis Joaquin Pozo
  Date: 15/12/2024
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enviar Solicitud de Mascota</title>
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

    <!-- Page CSS -->
    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>

</head>
<body style="background-color: #fdece6;">
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>

<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <!-- Navbar -->
        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">


            <div class="app-brand demo px-3">
                <a href="javascript:void(0);" class="app-brand-link">
          <span class="app-brand-logo demo">
            <img class = "h-px-50 tf-icon" src="${pageContext.request.contextPath}/assets/img/logo_Alianza_Animal_-removebg-preview.png" alt="logo">
          </span>
                </a>

                <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto">
                    <i class="bx bx-chevron-left bx-sm align-middle"></i>
                </a>
            </div>

            <div class="menu-inner-shadow"></div>



            <ul class="menu-inner py-1">

                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/albergue?action=inicio" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-home"></i>
                        <div class="text-truncate" data-i18n="Inicio">Inicio</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="albergue-ver-publicaciones.html" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-building-house"></i>
                        <div class="text-truncate" data-i18n="Publicaciones">Publicaciones</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="albergue-ver-eventos.html" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-calendar-event"></i>
                        <div class="text-truncate" data-i18n="Eventos">Eventos</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/albergue?action=hogaresTemporales" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-building-house"></i>
                        <div class="text-truncate" data-i18n="Hogares temporales">Hogares temporales</div>
                    </a>
                </li>
                <!-- Gestion -->
                <li class="menu-header small text-uppercase">
                    <span class="menu-header-text" data-i18n="Gestion">Gestion</span>
                </li>
                <li class="menu-item">
                    <a href="albergue-ver-mispublicaciones.html" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-building-house"></i>
                        <div class="text-truncate" data-i18n="Mis publicaciones">Mis publicaciones</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="albergue-ver-miseventos.html" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-calendar-event"></i>
                        <div class="text-truncate" data-i18n="Mis eventos">Mis eventos</div>
                    </a>
                </li>

                <!-- Misc -->
                <li class="menu-header small text-uppercase"><span class="menu-header-text" data-i18n="Otros">Otros</span></li>
                <li class="menu-item">
                    <a href="albergue-preguntas-frecuentes.html" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-help-circle"></i>
                        <div class="text-truncate" data-i18n="Preguntas frecuentes">Preguntas frecuentes</div>
                    </a>
                </li>
            </ul>



        </aside>

        <div class="layout-page">
            <nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme" id="layout-navbar">


                <div class="layout-menu-toggle navbar-nav align-items-xl-center me-1 me-xl-0   d-xl-none ">
                    <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                        <i class="bx bx-menu bx-sm"></i>
                    </a>
                </div>


                <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">

                    <div class="w-75 align-items-center me-auto">
                        <div class="nav-item navbar-search-wrapper mb-0">
          <span class="d-inline-block justify-content-center">
          <p class="mb-0 fst-normal fw-semibold ff-"><span class="text-muted">Albergue / Hogares Temporales /</span> Enviar Solicitud</p>
        </span>
                        </div>
                    </div>

                    <ul class="navbar-nav flex-row align-items-center ms-0">

                        <!-- Notification -->
                        <span class="text-body" style="margin-left: 10px; margin-right: 2px; font-weight: bold;">¡Hola, Adolfo!</span>

                        <!--/ Notification -->
                        <!-- User -->
                        <li class="nav-item navbar-dropdown dropdown-user dropdown">
                            <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                                <div class="avatar avatar-online">
                                    <img src="https://img.freepik.com/vector-gratis/diseno-plantilla-imagen-perfil_742173-22027.jpg?t=st=1726637844~exp=1726641444~hmac=f81927ff296e19d666bcbbd27413900024f764855e07caa5d1a64d3e3d1c4f9d&w=826" alt class="w-px-40 h-auto rounded-circle">
                                </div>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li>
                                    <a class="dropdown-item" href="ver-miperfil-usuario-detalles.html">
                                        <div class="d-flex">
                                            <div class="flex-shrink-0 me-3">
                                                <div class="avatar avatar-online">
                                                    <img src="https://img.freepik.com/vector-gratis/diseno-plantilla-imagen-perfil_742173-22027.jpg?t=st=1726637844~exp=1726641444~hmac=f81927ff296e19d666bcbbd27413900024f764855e07caa5d1a64d3e3d1c4f9d&w=826" alt class="w-px-40 h-auto rounded-circle">
                                                </div>
                                            </div>
                                            <div class="flex-grow-1">
                                                <span class="fw-medium d-block"> Adolfo Contreras</span>
                                                <small class="text-muted">Usuario</small>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="ver-miperfil-usuario-seguridad.html">
                                        <i class="bx bx-lock me-2"></i>
                                        <span class="align-middle">Seguridad</span>
                                    </a>
                                </li>


                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="ver-mispublicaciones-usuario.html">
                                        <i class="bx bx-building-house"></i>
                                        <span class="align-middle">Mis publicaciones</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="ver-miseventos-usuario.html">
                                        <i class="bx bx-bone"></i>
                                        <span class="align-middle">Mis eventos</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="ver-calendario-usuario.html">
                                        <i class="bx bx-calendar"></i>
                                        <span class="align-middle">Mi Calendario</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="pages-faq.html">
                                        <i class="bx bx-help-circle me-2"></i>
                                        <span class="align-middle">FAQ</span>
                                    </a>
                                </li>
                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="../index.html" target="_blank">
                                        <i class="bx bx-power-off me-2"></i>
                                        <span class="align-middle">Salir</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!--/ User -->


                    </ul>
                </div>


                <!-- Search Small Screens -->
                <div class="navbar-search-wrapper search-input-wrapper  d-none">
                    <input type="text" class="form-control search-input container-xxl border-0" placeholder="Search..." aria-label="Search...">
                    <i class="bx bx-x bx-sm search-toggler cursor-pointer"></i>
                </div>


            </nav>




            <!-- Content wrapper -->
            <div class="content-wrapper">

                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">


                    <div class="app-ecommerce">

                        <!-- Add Product -->


                        <!-- First column-->
                        <form action="${pageContext.request.contextPath}/albergue?action=enviarSolicitud" method="POST" enctype="multipart/form-data">
                            <!-- Encabezado -->

                            <div class="d-flex flex-wrap justify-content-between align-items-center mb-3">
                                <div class="d-flex flex-column justify-content-center">
                                    <h4 class="mb-1 mt-1" style="font-size: 24px; color: #353537dd;">Enviar Solicitud de Mascota</h4>
                                    <p class="text-muted">Rellena los campos abajo</p>
                                </div>
                                <div class="d-flex align-content-center flex-wrap gap-3">
                                    <button type="reset" class="btn btn-secondary">Descartar Cambios</button>
                                    <button type="submit" class="btn btn-primary">Enviar Solicitud</button>
                                </div>
                            </div>

                            <!-- Tarjetas -->
                            <div class="row">
                                <!-- Primera Tarjeta: Detalles de la Mascota -->
                                <div class="col-12 col-lg-6">
                                    <div class="card mb-4">
                                        <div class="card-header">
                                            <h5 class="mb-0" style="color: #3318ca;">Detalles de la Mascota</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="mb-3">
                                                <label class="form-label" for="nombreMascota">Nombre</label>
                                                <input type="text" class="form-control" id="nombreMascota" name="nombreMascota" placeholder="Nombre de la mascota" required>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" for="edadAproximada">Edad Aproximada</label>
                                                <input type="number" class="form-control" id="edadAproximada" name="edadAproximada"
                                                       placeholder="Edad en años" min="0" required>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" for="genero">Género</label>
                                                <select class="form-control" id="genero" name="genero" required>
                                                    <option value="" disabled selected>Seleccione</option>
                                                    <option value="macho">Macho</option>
                                                    <option value="hembra">Hembra</option>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" for="tamanio">Tamaño</label>
                                                <select class="form-control" id="tamanio" name="tamanio" required>
                                                    <option value="" disabled selected>Seleccione</option>
                                                    <option value="pequeño">Pequeño</option>
                                                    <option value="mediano">Mediano</option>
                                                    <option value="grande">Grande</option>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" for="razaId">Raza</label>
                                                <select class="form-control" id="razaId" name="razaId" required>
                                                    <option value="" disabled selected>Seleccione la raza</option>
                                                    <option value="1">Labrador Retriever</option>
                                                    <option value="2">Golden Retriever</option>
                                                    <option value="3">Bulldog Francés</option>
                                                    <option value="4">Beagle</option>
                                                    <option value="5">Poodle</option>
                                                    <option value="6">Gato Persa</option>
                                                    <option value="7">Gato Maine Coon</option>
                                                    <option value="8">Gato Siamés</option>
                                                    <option value="9">Rottweiler</option>
                                                    <option value="10">Dachshund</option>
                                                    <option value="11">Gato Bengalí</option>
                                                    <option value="12">Cocker Spaniel</option>
                                                    <option value="13">Schnauzer</option>
                                                    <option value="14">Chihuahua</option>
                                                    <option value="15">Akita</option>
                                                    <option value="16">Gato Sphynx</option>
                                                    <option value="17">Hámster Sirio</option>
                                                    <option value="18">Loro Amazona</option>
                                                    <option value="19">Conejo Holland Lop</option>
                                                    <option value="20">Cobayo</option>
                                                    <option value="21">Shih Tzu</option>
                                                    <option value="22">Border Collie</option>
                                                    <option value="23">Pug</option>
                                                    <option value="24">Bichón Frisé</option>
                                                    <option value="25">Terrier Escocés</option>
                                                    <option value="26">Basenji</option>
                                                    <option value="27">Salchicha</option>
                                                    <option value="28">Yorkshire Terrier</option>
                                                    <option value="29">Bull Terrier</option>
                                                    <option value="30">Cavalier King Charles Spaniel</option>
                                                    <option value="31">Chow Chow</option>
                                                    <option value="32">Rottweiler</option>
                                                    <option value="33">Gran Danés</option>
                                                    <option value="34">Cocker Americano</option>
                                                    <option value="35">Samoyedo</option>
                                                    <option value="36">Cavalier King Charles</option>
                                                    <option value="37">Gato Abisinio</option>
                                                    <option value="38">Gato Burmese</option>
                                                    <option value="39">Gato Ragdoll</option>
                                                    <option value="40">Gato Scottish Fold</option>
                                                    <option value="41">Schnauzer Gigante</option>
                                                    <option value="42">Terrier de Boston</option>
                                                    <option value="43">Mastín Inglés</option>
                                                    <option value="44">Gato Devon Rex</option>
                                                    <option value="45">Gato Noruego de Bosque</option>
                                                    <option value="46">Gato Himalayo</option>
                                                    <option value="47">Loro Gris Africano</option>
                                                    <option value="48">Canario</option>
                                                    <option value="49">Periquito</option>
                                                    <option value="50">Gato de Bengala</option>
                                                    <option value="51">Terrier de Airedale</option>
                                                    <option value="52">Perro de Agua Español</option>
                                                    <option value="53">Perro de Montaña de los Pirineos</option>
                                                    <option value="54">Cocker Spaniel Inglés</option>
                                                    <option value="55">Papillon</option>
                                                    <option value="56">Gato Manx</option>
                                                    <option value="57">Gato British Shorthair</option>
                                                    <option value="58">Schnauzer Mediano</option>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" for="descripcion">Descripción</label>
                                                <textarea class="form-control" id="descripcion" name="descripcion" rows="3" placeholder="Breve descripción de la mascota" required></textarea>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" for="foto">Foto de la Mascota</label>
                                                <input type="file" class="form-control" id="foto" name="foto" accept="image/*" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" name="solicitadoId" value="5">
                                <!-- Segunda Tarjeta: Datos del Albergue -->
                                <div class="col-12 col-lg-6">
                                    <div class="card mb-4">
                                        <div class="card-header">
                                            <h5 class="mb-0" style="color: #3318ca;">Datos del Albergue</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="mb-3">
                                                <label class="form-label" for="nombreAlbergue">Nombre del Albergue</label>
                                                <input type="text" class="form-control" id="nombreAlbergue" name="nombreAlbergue"
                                                       value="<%= request.getAttribute("nombreAlbergue") != null ? request.getAttribute("nombreAlbergue") : "" %>"
                                                       placeholder="Nombre del albergue" >
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" for="contactoAlbergue">Número de Contacto</label>
                                                <input type="text" class="form-control" id="contactoAlbergue" name="contactoAlbergue"
                                                       value="<%= request.getAttribute("numeroContacto") != null ? request.getAttribute("numeroContacto") : "" %>"
                                                       placeholder="Número de contacto" >
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" for="direccionAlbergue">Dirección</label>
                                                <input type="text" class="form-control" id="direccionAlbergue" name="direccionAlbergue"
                                                       value="<%= request.getAttribute("direccionAlbergue") != null ? request.getAttribute("direccionAlbergue") : "" %>"
                                                       placeholder="Dirección del albergue" >
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>

                <!-- Content -->

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

<!-- Main JS -->
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/js/bootstrap.js"></script>

<script>
    Dropzone.options.dropzoneBasic = {
        paramName: "imagen", // Nombre del campo que contiene la imagen
        maxFilesize: 5, // Tamaño máximo en MB
        acceptedFiles: "image/*", // Solo imágenes
        init: function () {
            this.on("success", function (file, response) {
                console.log("Imagen subida correctamente:", response);
            });
            this.on("error", function (file, response) {
                console.error("Error al subir la imagen:", response);
            });
        }
    };
</script>

<script>
    document.getElementById("edadAproximada").addEventListener("input", function () {
        if (this.value < 0) {
            this.value = 0; // Forzar el valor a 0 si es negativo
        }
    });
</script>

</body>
</html>

