<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>


<jsp:useBean id="usuario" class="Beans.Usuarios" scope="request" />
<jsp:useBean id="rol" class="Beans.Roles" scope="request" />

<jsp:setProperty name="usuario" property="*" />
<jsp:setProperty name="rol" property="*" />


<!DOCTYPE html>
<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="../../assets/" data-template="vertical-menu-template-semi-dark">


    <!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:06 GMT -->
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

        <title>Eventos</title>


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
        <link rel="icon" type="image/x-icon" href="../../assets/img/logo_Alianza_Animal_-removebg-preview.png" />
        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com/">
        <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&amp;display=swap" rel="stylesheet">

        <!-- Icons -->
        <link rel="stylesheet" href="../../assets/vendor/fonts/boxicons.css" />
        <link rel="stylesheet" href="../../assets/vendor/fonts/fontawesome.css" />
        <link rel="stylesheet" href="../../assets/vendor/fonts/flag-icons.css" />

        <!-- Core CSS -->
        <link rel="stylesheet" href="../../assets/vendor/css/rtl/core.css" class="template-customizer-core-css" />
        <link rel="stylesheet" href="../../assets/vendor/css/rtl/theme-semi-dark.css" class="template-customizer-theme-css" />
        <link rel="stylesheet" href="../../assets/css/demo.css" />

        <!-- Vendors CSS -->
        <link rel="stylesheet" href="../../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
        <link rel="stylesheet" href="../../assets/vendor/libs/typeahead-js/typeahead.css" />
        <link rel="stylesheet" href="../../assets/vendor/libs/quill/typography.css">
        <link rel="stylesheet" href="../../assets/vendor/libs/quill/katex.css">
        <link rel="stylesheet" href="../../assets/vendor/libs/quill/editor.css">
        <link rel="stylesheet" href="../../assets/vendor/libs/select2/select2.css">
        <link rel="stylesheet" href="../../assets/vendor/libs/dropzone/dropzone.css">
        <link rel="stylesheet" href="../../assets/vendor/libs/flatpickr/flatpickr.css">
        <link rel="stylesheet" href="../../assets/vendor/libs/tagify/tagify.css" />
        <link rel="stylesheet" href="../../assets/vendor/libs/animate-css/animate.css" />
        <link rel="stylesheet" href="../../assets/vendor/libs/sweetalert2/sweetalert2.css" />

        <!-- Page CSS -->

        <link rel="stylesheet" href="../../assets/vendor/css/pages/page-faq.css" />

        <!-- Helpers -->
        <script src="../../assets/vendor/js/helpers.js"></script>
        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
        <script src="../../assets/js/config.js"></script>

        <link rel="stylesheet" href="../../assets/vendor/libs/flatpickr/flatpickr.css">
    </head>
    <body>


        <!-- ?PROD Only: Google Tag Manager (noscript) (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
        <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
        <!-- End Google Tag Manager (noscript) -->

        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">

                <div class="layout-page">

                    <div class="content-wrapper">

                        <!-- Content -->

                        <div class="container-xxl flex-grow-1 container-p-y">


                            <div class="card mb-0"></div>
                            <div class="card-header d-flex flex-wrap justify-content-between gap-3">

                                <!-- Filtros -->
                                <div class="col-12 d-flex justify-content-between align-items-center">

                                    <div class="col-12 card">
                                        <div class="card-body d-flex align-items-center justify-content-center p-3">
                                            <div class="row w-100">
                                                <!-- Tipo de Publicacion -->
                                                <div class="col-md-3 d-flex flex-column align-items-center mb-0 mt-0">
                                                    <label for="select2Basic" class="form-label mb-1" style="font-size: 0.75rem; margin-bottom: 2px;">Tipo de publicación</label>
                                                    <select id="select2Basic" class="select2 form-select form-select-sm" data-allow-clear="true" style="font-size: 0.75rem;">
                                                        <option value="All">Todas</option>
                                                        <option value="Adopcion">Adopción</option>
                                                        <option value="Donaciones activas">Donaciones activas</option>
                                                        <option value="Donaciones de dinero">Donaciones de dinero</option>
                                                    </select>
                                                </div>
                                                <!-- Palabra clave -->
                                                <div class="col-md-3 d-flex flex-column align-items-center mb-0 mt-0">
                                                    <label for="inputPalabraClave" class="form-label mb-1" style="font-size: 0.75rem; margin-bottom: 2px;">Palabra clave</label>
                                                    <input type="text" id="inputPalabraClave" class="form-control form-control-sm" placeholder="Escribe palabra clave" style="font-size: 0.75rem;">
                                                </div>
                                                <!-- Fecha -->
                                                <div class="col-md-3 d-flex flex-column align-items-center mb-0 mt-0">
                                                    <label for="dateRange" class="form-label mb-1" style="font-size: 0.75rem; margin-bottom: 2px;">Rango de fechas</label>
                                                    <input type="text" id="dateRange" class="form-control form-control-sm" placeholder="Seleccionar rango de fechas" />
                                                </div>

                                                <div class="col-md-3 d-flex flex-column align-items-center btn-group p-2">
                                                    <a class="btn btn-primary" type="button" id="dropdownMenuButton" href="albergue-crear-evento.html">Nuevo evento</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <!-- Card Container -->
                                <div class="card mb-2" style="padding: 0; margin: 0;">
                                    <div class="card-body p-0">
                                        <div class="container-fluid mt-3">
                                            <div class="row gx-1 gy-2 justify-content-center m-0">
                                                <!-- Card 1 -->
                                                <div class="col-12 col-sm-6 col-md-4 col-lg-2 px-1 mb-2 d-flex justify-content-center">
                                                    <div class="card d-flex flex-column" style="border: 1px solid #ddd; box-shadow: none; width: 100%; max-width: 250px; border-radius: 3px;">
                                                        <div class="rounded-2 text-center flex-grow-1">
                                                            <a data-bs-toggle="modal" href="#evento1">
                                                                <img class="img-fluid" src="../../assets/img/i2.jpg" alt="Imagen de publicación 1" style="height: 200px; object-fit: cover; border-radius: 3px;"/>
                                                            </a>
                                                        </div>
                                                        <div class="card-body p-2 d-flex flex-column">
                                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                                <span class="badge bg-label-info" style="font-size: 0.75rem;">Ferias</span>
                                                            </div>
                                                            <a class="h6" data-bs-toggle="modal" href="#evento1" style="font-size: 0.875rem; font-weight: 800px;">Feria de adopcion de bienestar</a>
                                                            <p class="mt-1 mb-0" style="font-size: 0.75rem;">Participa en nuestra feria y adopta a tu nuevo mejor amigo.</p>
                                                            <div class="d-flex flex-column gap-1 text-nowrap mt-auto">
                                                                <a class="btn btn-label-info d-flex align-items-center" style="font-size: 0.75rem;" href="albergue-ver-eventos-detalles.html">
                                                                    <span>Detalles</span><i class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                                </a>

                                                                <button type="button" class="btn btn-label-primary d-flex align-items-center btn-inscripcion" data-event-id="1" user-type="albergue" post-type="event" style="font-size: 0.75rem;">
                                                                    <span>Inscripción</span><i class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                                </button>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Card 2 -->
                                                <div class="col-12 col-sm-6 col-md-4 col-lg-2 px-1 mb-2 d-flex justify-content-center">
                                                    <div class="card d-flex flex-column" style="border: 1px solid #ddd; box-shadow: none; width: 100%; max-width: 250px; border-radius: 3px;">
                                                        <div class="rounded-2 text-center flex-grow-1">
                                                            <a data-bs-toggle="modal" href="#evento2">
                                                                <img class="img-fluid" src="../../assets/img/img2.jpg" alt="Imagen de publicación 2" style="height: 200px; object-fit: cover; border-radius: 3px;"/>
                                                            </a>
                                                        </div>
                                                        <div class="card-body p-2 d-flex flex-column">
                                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                                <span class="badge bg-label-info" style="font-size: 0.75rem;">CAMPAÑAS</span>
                                                            </div>
                                                            <a class="h6" data-bs-toggle="modal" href="#evento2" style="font-size: 0.875rem; font-weight: 800px;">Protégelo contra la rabia</a>
                                                            <p class="mt-1 mb-0" style="font-size: 0.75rem;">Ayúdanos a vacunar a más mascotas contra la rabia. ¡Tu colaboración es clave!</p>
                                                            <div class="d-flex flex-column gap-1 text-nowrap mt-auto">
                                                                <a class="btn btn-label-info d-flex align-items-center" style="font-size: 0.75rem;" href="albergue-ver-eventos-detalles.html">
                                                                    <span>Detalles</span><i class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                                </a>

                                                                <button type="button" class="btn btn-label-primary d-flex align-items-center btn-inscripcion" data-event-id="2" user-type="albergue" post-type="event" style="font-size: 0.75rem;">
                                                                    <span>Inscripción</span><i class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Card 3 -->
                                                <div class="col-12 col-sm-6 col-md-4 col-lg-2 px-1 mb-2 d-flex justify-content-center">
                                                    <div class="card d-flex flex-column" style="border: 1px solid #ddd; box-shadow: none; width: 100%; max-width: 250px; border-radius: 3px;">
                                                        <div class="rounded-2 text-center flex-grow-1">
                                                            <a data-bs-toggle="modal" href="#evento3">
                                                                <img class="img-fluid" src="../../assets/img/i3.jpg" alt="Imagen de publicación 3" style="height: 200px; object-fit: cover; border-radius: 3px;"/>
                                                            </a>
                                                        </div>
                                                        <div class="card-body p-2 d-flex flex-column">
                                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                                <span class="badge bg-label-info" style="font-size: 0.75rem;">Campañas</span>
                                                            </div>
                                                            <a class="h6" data-bs-toggle="modal" href="#evento3" style="font-size: 0.875rem; font-weight: 800px;">Adopción para mascotas II</a>
                                                            <p class="mt-1 mb-0" style="font-size: 0.75rem;">Adopta y cambia una vida. Esta es tu oportunidad de darle un hogar a una mascota.</p>
                                                            <div class="d-flex flex-column gap-1 text-nowrap mt-auto">
                                                                <a class="btn btn-label-info d-flex align-items-center" style="font-size: 0.75rem;" href="albergue-ver-eventos-detalles.html">
                                                                    <span>Detalles</span><i class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                                </a>
                                                                <button type="button" class="btn btn-label-primary d-flex align-items-center btn-inscripcion" data-event-id="3" user-type="albergue" post-type="event" style="font-size: 0.75rem;">
                                                                    <span>Inscripción</span><i class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Card 4 -->
                                                <div class="col-12 col-sm-6 col-md-4 col-lg-2 px-1 mb-2 d-flex justify-content-center">
                                                    <div class="card d-flex flex-column" style="border: 1px solid #ddd; box-shadow: none; width: 100%; max-width: 250px; border-radius: 3px;">
                                                        <div class="rounded-2 text-center flex-grow-1">
                                                            <a data-bs-toggle="modal" href="#evento4">
                                                                <img class="img-fluid" src="../../assets/img/i5.jpg" alt="Imagen de publicación 4" style="height: 200px; object-fit: cover; border-radius: 3px;"/>
                                                            </a>
                                                        </div>
                                                        <div class="card-body p-2 d-flex flex-column">
                                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                                <span class="badge bg-label-info" style="font-size: 0.75rem;">Concursos</span>
                                                            </div>
                                                            <a class="h6" data-bs-toggle="modal" href="#evento4" style="font-size: 0.875rem; font-weight: 800px;">Desfile de patitas</a>
                                                            <p class="mt-1 mb-0" style="font-size: 0.75rem;">Únete al evento más tierno del año y disfruta de un divertido desfile de mascotas.</p>
                                                            <div class="d-flex flex-column gap-1 text-nowrap mt-auto">
                                                                <a class="btn btn-label-info d-flex align-items-center" style="font-size: 0.75rem;" href="albergue-ver-eventos-detalles.html">
                                                                    <span>Detalles</span><i class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                                </a>
                                                                <button type="button" class="btn btn-label-primary d-flex align-items-center btn-inscripcion" data-event-id="4" user-type="albergue" post-type="event" style="font-size: 0.75rem;">
                                                                    <span>Inscripción</span><i class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Card 5 -->
                                                <div class="col-12 col-sm-6 col-md-4 col-lg-2 px-1 mb-2 d-flex justify-content-center">
                                                    <div class="card d-flex flex-column" style="border: 1px solid #ddd; box-shadow: none; width: 100%; max-width: 250px; border-radius: 3px;">
                                                        <div class="rounded-2 text-center flex-grow-1">
                                                            <a data-bs-toggle="modal" href="#evento5">
                                                                <img class="img-fluid" src="../../assets/img/i6.jpg" alt="Imagen de publicación 5" style="height: 200px; object-fit: cover; border-radius: 3px;"/>
                                                            </a>
                                                        </div>
                                                        <div class="card-body p-2 d-flex flex-column">
                                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                                <span class="badge bg-label-info" style="font-size: 0.75rem;">Concursos</span>
                                                            </div>
                                                            <a class="h6" data-bs-toggle="modal" href="#evento5" style="font-size: 0.875rem; font-weight: 800px;">Encuentra a tu mejor amigo</a>
                                                            <p class="mt-1 mb-0" style="font-size: 0.75rem;">Participa en actividades con tu mascota y haz nuevos amigos. ¡Una jornada llena de diversión!</p>
                                                            <div class="d-flex flex-column gap-1 text-nowrap mt-auto">
                                                                <a class="btn btn-label-info d-flex align-items-center" style="font-size: 0.75rem;" href="albergue-ver-eventos-detalles.html">
                                                                    <span>Detalles</span><i class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                                </a>
                                                                <button type="button" class="btn btn-label-primary d-flex align-items-center btn-inscripcion" data-event-id="5" user-type="albergue" post-type="event" style="font-size: 0.75rem;">
                                                                    <span>Inscripción</span><i class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Card 6 -->
                                                <div class="col-12 col-sm-6 col-md-4 col-lg-2 px-1 mb-2 d-flex justify-content-center">
                                                    <div class="card d-flex flex-column" style="border: 1px solid #ddd; box-shadow: none; width: 100%; max-width: 250px; border-radius: 3px;">
                                                        <div class="rounded-2 text-center flex-grow-1">
                                                            <a data-bs-toggle="modal" href="#evento6">
                                                                <img class="img-fluid" src="../../assets/img/i4.jpg" alt="Imagen de publicación 6" style="height: 200px; object-fit: cover; border-radius: 3px;"/>
                                                            </a>
                                                        </div>
                                                        <div class="card-body p-2 d-flex flex-column">
                                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                                <span class="badge bg-label-info" style="font-size: 0.75rem;">Concursos</span>
                                                            </div>
                                                            <a class="h6" data-bs-toggle="modal" href="#evento6" style="font-size: 0.875rem; font-weight: 800px;">Gran concurso de mascotas</a>
                                                            <p class="mt-1 mb-0" style="font-size: 0.75rem;">Muestra la creatividad de tu mascota en este concurso virtual y gana premios.</p>
                                                            <div class="d-flex flex-column gap-1 text-nowrap mt-auto">
                                                                <a class="btn btn-label-info d-flex align-items-center" style="font-size: 0.75rem;" href="albergue-ver-eventos-detalles.html">
                                                                    <span>Detalles</span><i class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                                </a>
                                                                <button type="button" class="btn btn-label-primary d-flex align-items-center btn-inscripcion" data-event-id="6" user-type="albergue" post-type="event" style="font-size: 0.75rem;">
                                                                    <span>Inscripción</span><i class="bx bx-chevron-right lh-1 scaleX-n1-rtl"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Pagination -->
                                    <div class="card-footer d-flex justify-content-center">
                                        <ul class="pagination m-0">
                                            <li class="page-item disabled">
                                                <span class="page-link">Anterior</span>
                                            </li>
                                            <li class="page-item active">
                                                <span class="page-link">1</span>
                                            </li>
                                            <li class="page-item">
                                                <a class="page-link" href="#">2</a>
                                            </li>
                                            <li class="page-item">
                                                <a class="page-link" href="#">3</a>
                                            </li>
                                            <li class="page-item">
                                                <a class="page-link" href="#">Siguiente</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <!-- Evento 1 -->
                                    <div class="modal fade" id="evento1" tabindex="-1" aria-hidden="true">
                                        <div class="modal-dialog modal-lg modal-simple modal-edit-user">
                                            <div class="modal-content p-3 p-md-5">
                                                <div class="modal-body">
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    <div class="text-center mb-4">
                                                        <img class="img-fluid mb-4" src="../../assets/img/i2.jpg" alt="Imagen de publicación 1" style="height: 200px; object-fit: cover; border-radius: 5px;"/>
                                                        <h3 class="text-primary">Feria de adopción de bienestar</h3>
                                                        <span class="badge bg-label-info" style="font-size: 0.75rem;">Ferias</span>
                                                    </div>
                                                    <form id="editUserForm" class="row g-3" onsubmit="return false">
                                                        <div class="col-12" style="text-align: justify;">
                                                            <p>La Feria de Adopción de Bienestar es un evento dedicado a conectar a adorables mascotas con familias amorosas y responsables.
                                                                Durante esta jornada, podrás conocer a una variedad de animales rescatados que están buscando un hogar definitivo.
                                                                Además de la oportunidad de adoptar, el evento contará con actividades orientadas al bienestar animal, como charlas
                                                                educativas sobre el cuidado responsable de mascotas, clínicas veterinarias gratuitas, y espacios donde podrás recibir
                                                                asesoramiento para hacer de la adopción una experiencia positiva. Únete a nosotros y forma parte de esta noble causa
                                                                que no solo cambia la vida de los animales, sino también la de las personas que los adoptan. ¡Ven y descubre a tu nuevo
                                                                mejor amigo</p>
                                                        </div>

                                                        <div class="col-12 col-md-6">
                                                            <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-calendar-event bx-sm me-2'></i>Fecha: 07 de octubre</p>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-time-five bx-sm me-2'></i>Hora: 14:30</p>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-map bx-sm me-2'></i>Lugar: Frente a la PUCP</p>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-group bx-sm me-2'></i>Inscritos: 13 personas</p>
                                                        </div>

                                                        <div class="col-12 text-center">
                                                            <button type="reset" class="btn btn-label-primary" data-bs-dismiss="modal" aria-label="Close">Cerrar</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--/ Evento 1 -->

                                    <!-- Evento 2 -->
                                    <div class="modal fade" id="evento2" tabindex="-1" aria-hidden="true">
                                        <div class="modal-dialog modal-lg modal-simple modal-edit-user">
                                            <div class="modal-content p-3 p-md-5">
                                                <div class="modal-body">
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    <div class="text-center mb-4">
                                                        <img class="img-fluid mb-4" src="../../assets/img/img2.jpg" alt="Imagen de publicación 2" style="height: 200px; object-fit: cover; border-radius: 5px;"/>
                                                        <h3 class="text-primary">Protégelo contra la rabia</h3>
                                                        <span class="badge bg-label-info" style="font-size: 0.75rem;">Campañas</span>
                                                    </div>
                                                    <form id="editUserForm" class="row g-3" onsubmit="return false">
                                                        <div class="col-12" style="text-align: justify;">
                                                            <p>"Protégelo para la rabia" es una campaña de vacunación gratuita dedicada a proteger a nuestras
                                                                mascotas y a la comunidad de la rabia. Este evento tiene como objetivo concientizar sobre la
                                                                importancia de la vacunación, asegurando que perros y gatos reciban la protección necesaria contra esta
                                                                peligrosa enfermedad. A lo largo de la jornada, un equipo de veterinarios estará aplicando vacunas de
                                                                manera gratuita y ofreciendo información clave sobre la prevención de la rabia y el cuidado general de
                                                                los animales. No dejes pasar la oportunidad de proteger a tu compañero de cuatro patas y contribuir a
                                                                un entorno más seguro para todos. ¡Te esperamos en esta campaña por la salud y el bienestar animal!</p>
                                                        </div>

                                                        <div class="col-12 col-md-6">
                                                            <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-calendar-event bx-sm me-2'></i>Fecha: 07 de octubre</p>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-time-five bx-sm me-2'></i>Hora: 09:30</p>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-map bx-sm me-2'></i>Lugar: Albergue Caritas</p>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-group bx-sm me-2'></i>Inscritos: 13 personas</p>
                                                        </div>

                                                        <div class="col-12 text-center">
                                                            <button type="reset" class="btn btn-label-primary" data-bs-dismiss="modal" aria-label="Close">Cerrar</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--/ Evento 2 -->

                                    <!-- Evento 3 -->
                                    <div class="modal fade" id="evento3" tabindex="-1" aria-hidden="true">
                                        <div class="modal-dialog modal-lg modal-simple modal-edit-user">
                                            <div class="modal-content p-3 p-md-5">
                                                <div class="modal-body">
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    <div class="text-center mb-4">
                                                        <img class="img-fluid mb-1" src="../../assets/img/i3.jpg" alt="Imagen de publicación 3" style="height: 200px; object-fit: cover; border-radius: 5px;"/>
                                                        <h3 class="text-primary">Adopción para mascotas II</h3>
                                                        <span class="badge bg-label-info" style="font-size: 0.75rem;">Campañas</span>
                                                    </div>
                                                    <form id="editUserForm" class="row g-3" onsubmit="return false">
                                                        <div class="col-12" style="text-align: justify;">
                                                            <p>"Adopción de Mascotas - 2da Edición" es un evento especial donde tendrás la oportunidad de brindar
                                                                un hogar amoroso a perros y gatos que están buscando una segunda oportunidad. Después del éxito de
                                                                la primera edición, volvemos con más amigos de cuatro patas listos para convertirse en parte de tu
                                                                familia. Ven y conoce a estos adorables animales rescatados, cada uno con una historia única y un
                                                                corazón lleno de esperanza. Además de la adopción, podrás disfrutar de charlas sobre cuidado
                                                                responsable, asesoramiento para la integración de tu nueva mascota y muchas actividades pensadas
                                                                para los amantes de los animales. ¡No te pierdas la oportunidad de cambiar una vida y llevarte a
                                                                casa un nuevo mejor amigo!</p>
                                                        </div>

                                                        <div class="col-12 col-md-6">
                                                            <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-calendar-event bx-sm me-2'></i>Fecha: 07 de octubre</p>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-time-five bx-sm me-2'></i>Hora: 14:30</p>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-map bx-sm me-2'></i>Lugar: Frente a la PUCP</p>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-group bx-sm me-2'></i>Inscritos: 13 personas</p>
                                                        </div>

                                                        <div class="col-12 text-center">
                                                            <button type="reset" class="btn btn-label-primary" data-bs-dismiss="modal" aria-label="Close">Cerrar</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--/ Evento 3 -->

                                    <!-- Evento 4 -->
                                    <div class="modal fade" id="evento4" tabindex="-1" aria-hidden="true">
                                        <div class="modal-dialog modal-lg modal-simple modal-edit-user">
                                            <div class="modal-content p-3 p-md-5">
                                                <div class="modal-body">
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    <div class="text-center mb-4">
                                                        <img class="img-fluid mb-4" src="../../assets/img/i5.jpg" alt="Imagen de publicación 4" style="height: 200px; object-fit: cover; border-radius: 5px;"/>
                                                        <h3 class="text-primary">Desfile de Patitas</h3>
                                                        <span class="badge bg-label-info" style="font-size: 0.75rem;">Concursos</span>
                                                    </div>
                                                    <form id="editUserForm" class="row g-3" onsubmit="return false">
                                                        <div class="col-12" style="text-align: justify;">
                                                            <p>"Desfile de Patitas" es un evento único y lleno de alegría donde nuestras mascotas son las verdaderas
                                                                protagonistas. En este desfile, perros y gatos de todas las razas y tamaños caminarán con orgullo junto
                                                                a sus dueños, mostrando su encanto y personalidad. Además de ser una divertida celebración, el desfile
                                                                busca promover la adopción responsable y concientizar sobre el bienestar animal. Habrá concursos,
                                                                premios para las mejores presentaciones, y actividades interactivas para toda la familia. ¡Ven con tu
                                                                mascota, disfruta del desfile y únete a nosotros en esta celebración de amor y respeto hacia nuestros
                                                                amigos de cuatro patas!</p>
                                                        </div>

                                                        <div class="col-12 col-md-6">
                                                            <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-calendar-event bx-sm me-2'></i>Fecha: 07 de octubre</p>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-time-five bx-sm me-2'></i>Hora: 14:30</p>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-map bx-sm me-2'></i>Lugar: Frente a la PUCP</p>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-group bx-sm me-2'></i>Inscritos: 13 personas</p>
                                                        </div>

                                                        <div class="col-12 text-center">
                                                            <button type="reset" class="btn btn-label-primary" data-bs-dismiss="modal" aria-label="Close">Cerrar</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--/ Evento 4 -->

                                    <!-- Evento 5 -->
                                    <div class="modal fade" id="evento5" tabindex="-1" aria-hidden="true">
                                        <div class="modal-dialog modal-lg modal-simple modal-edit-user">
                                            <div class="modal-content p-3 p-md-5">
                                                <div class="modal-body">
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    <div class="text-center mb-4">
                                                        <img class="img-fluid mb-4" src="../../assets/img/i6.jpg" alt="Imagen de publicación 5" style="height: 200px; object-fit: cover; border-radius: 5px;"/>
                                                        <h3 class="text-primary">Encuentra a tu Mejor Amigo</h3>
                                                        <span class="badge bg-label-info" style="font-size: 0.75rem;">Concursos</span>
                                                    </div>
                                                    <form id="editUserForm" class="row g-3" onsubmit="return false">
                                                        <div class="col-12" style="text-align: justify;">
                                                            <p>"Encuentra a tu mejor amigo" es un emocionante evento de concurso donde las mascotas y sus dueños
                                                                se unen para disfrutar de carreras, juegos y divertidas competencias. Diseñado para fomentar la
                                                                conexión entre los dueños y sus compañeros de cuatro patas, este evento contará con pruebas de
                                                                agilidad, carreras de obstáculos y desafíos interactivos que pondrán a prueba las habilidades y
                                                                el vínculo entre mascota y dueño. Habrá premios para los ganadores en distintas categorías, desde
                                                                el más rápido hasta el más habilidoso. No te pierdas esta oportunidad única de pasar un día lleno
                                                                de diversión, actividad física y, por supuesto, amor incondicional. ¡Ven y participa con tu mascota
                                                                en esta aventura llena de juegos y diversión!</p>
                                                        </div>

                                                        <div class="col-12 col-md-6">
                                                            <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-calendar-event bx-sm me-2'></i>Fecha: 07 de octubre</p>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-time-five bx-sm me-2'></i>Hora: 14:30</p>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-map bx-sm me-2'></i>Lugar: Frente a la PUCP</p>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-group bx-sm me-2'></i>Inscritos: 13 personas</p>
                                                        </div>

                                                        <div class="col-12 text-center">
                                                            <button type="reset" class="btn btn-label-primary" data-bs-dismiss="modal" aria-label="Close">Cerrar</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--/ Evento 5 -->

                                    <!-- Evento 6 -->
                                    <div class="modal fade" id="evento6" tabindex="-1" aria-hidden="true">
                                        <div class="modal-dialog modal-lg modal-simple modal-edit-user">
                                            <div class="modal-content p-3 p-md-5">
                                                <div class="modal-body">
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    <div class="text-center mb-4">
                                                        <img class="img-fluid mb-4" src="../../assets/img/i4.jpg" alt="Imagen de publicación 6" style="height: 200px; object-fit: cover; border-radius: 5px;"/>
                                                        <h3 class="text-primary">Gran Concurso de Mascotas</h3>
                                                        <span class="badge bg-label-info" style="font-size: 0.75rem;">Concursos</span>
                                                    </div>
                                                    <form id="editUserForm" class="row g-3" onsubmit="return false">
                                                        <div class="col-12" style="text-align: justify;">
                                                            <p>"Gran Concurso de Mascotas" es un evento virtual donde las estrellas son nuestras adorables
                                                                mascotas, y el disfraz más creativo se llevará el gran premio. Desde la comodidad de tu hogar,
                                                                podrás participar enviando fotos o videos de tu mascota luciendo su mejor disfraz. El concurso
                                                                está abierto a todo tipo de mascotas, y un panel de jueces seleccionará a los ganadores en base a
                                                                la originalidad y creatividad de los atuendos. ¡Así que es hora de dejar volar la imaginación y
                                                                vestir a tu mejor amigo de manera única! Únete a este divertido evento y compite por premios
                                                                increíbles mientras disfrutas de la creatividad de los demás participantes. ¡No te lo pierdas!</p>
                                                        </div>

                                                        <div class="col-12 col-md-6">
                                                            <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-calendar-event bx-sm me-2'></i>Fecha: 07 de octubre</p>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-time-five bx-sm me-2'></i>Hora: 10:00</p>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-map bx-sm me-2'></i>Medio: ¡Mediante la página web!</p>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <p class="text-nowrap" style="margin-left: 20px;"><i class='bx bx-group bx-sm me-2'></i>Inscritos: 24 personas</p>
                                                        </div>

                                                        <div class="col-12 text-center">
                                                            <button type="reset" class="btn btn-label-primary" data-bs-dismiss="modal" aria-label="Close">Cerrar</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--/ Evento 6 -->

                                    <div class="content-backdrop fade"></div>
                                </div>
                                <!-- Content wrapper -->
                            </div>
                            <!-- / Layout page -->
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



                        <!-- Overlay -->
                        <div class="layout-overlay layout-menu-toggle"></div>


                        <!-- Drag Target Area To SlideIn Menu On Small Screens -->


                    </div>
                    <!-- / Layout wrapper -->


                    <!-- Core JS -->
                    <!-- build:js assets/vendor/js/core.js -->

                    <script src="../../assets/vendor/libs/jquery/jquery.js"></script>
                    <script src="../../assets/vendor/libs/popper/popper.js"></script>
                    <script src="../../assets/vendor/js/bootstrap.js"></script>
                    <script src="../../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
                    <script src="../../assets/vendor/libs/hammer/hammer.js"></script>
                    <script src="../../assets/vendor/libs/i18n/i18n.js"></script>
                    <script src="../../assets/vendor/libs/typeahead-js/typeahead.js"></script>
                    <script src="../../assets/vendor/js/menu.js"></script>

                    <!-- endbuild -->

                    <!-- Vendors JS -->

                    <script src="../../assets/vendor/libs/sweetalert2/sweetalert2.js"></script>


                    <!-- Main JS -->
                    <script src="../../assets/js/main.js"></script>


                    <!-- Page JS -->

                    <script src="../../assets/vendor/libs/flatpickr/flatpickr.js"></script>
                    <script>
                        // Inicializa flatpickr para el rango de fechas
                        flatpickr("#dateRange", {
                            mode: "range",
                            dateFormat: "d-m-Y", // Ajusta el formato de la fecha según tus necesidades
                            locale: {
                                firstDayOfWeek: 1 // Inicia la semana en lunes
                            }
                        });
                    </script>

                    <script src="../../assets/js/extended-ui-sweetalert2.js"></script>

    </body>



    <!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:07 GMT -->
</html>

<!-- beautify ignore:end -->