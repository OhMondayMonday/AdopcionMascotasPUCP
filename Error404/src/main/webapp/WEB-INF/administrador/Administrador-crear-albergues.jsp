<%@ page import="Beans.Usuarios" %>
<%@ page import="Beans.Roles" %>
<%@ page import="Beans.Distritos" %>
<%@ page import="java.util.List" %>
<%@ page import="Beans.Solicitudes" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact " dir="ltr" data-theme="theme-semi-dark" data-assets-path="<%=request.getContextPath()%>/assets/" data-template="vertical-menu-template-semi-dark">


<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:06 GMT -->
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Alianza Animal || Lugares Registrados</title>


    <meta name="description" content="Most Powerful &amp; Comprehensive Bootstrap 5 Admin Dashboard built for developers!" />
    <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
    <!-- Canonical SEO -->
    <link rel="canonical" href="https://themeselection.com/item/sneat-dashboard-pro-bootstrap/">


    <!-- ? PROD Only: Google Tag Manager (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
            new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
        j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
        '<%=request.getContextPath()%>/www.googletagmanager.com/gtm5445.html?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-5DDHKGP');</script>
    <!-- End Google Tag Manager -->


    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>\assets\img\logo_Alianza_Animal_-removebg-preview.png" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icons -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/fonts/boxicons.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/fonts/fontawesome.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/fonts/flag-icons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/css/rtl/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/css/rtl/theme-semi-dark.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/demo.css" />

    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.2.2/css/buttons.bootstrap5.min.css">

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/typeahead-js/typeahead.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/quill/typography.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/quill/katex.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/quill/editor.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/select2/select2.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/dropzone/dropzone.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/flatpickr/flatpickr.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/libs/tagify/tagify.css" />

    <!-- Page CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/css/pages/page-faq.css" />


    <!-- Helpers -->
    <script src="<%=request.getContextPath()%>/assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->

    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="<%=request.getContextPath()%>/assets/js/config.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/vendor/js/helpers.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/config.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


    <style>
        /* Asegúrate de que el body ocupe toda la altura de la pantalla */
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        /* El contenedor principal ocupará el espacio restante */
        .main-content {
            flex: 1;  /* Esto asegura que ocupe el espacio restante */
            padding: 20px;
            overflow: auto; /* Si el contenido es largo, permitirá hacer scroll */
        }

        /* Footer fijo al fondo de la página */
        footer {
            padding: 10px 0;
            text-align: center;
            background-color: #d4edda; /* Fondo verde suave para el footer */
        }


    </style>

    <style>




        td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #dee2e6;
            color: #444;
        }

        tr:nth-child(even) {
            background-color: #eef2f3;
        }

        tr:nth-child(odd) {
            background-color: #fdfdfd;
        }



        table tbody tr td:last-child {
            font-weight: bold;
            color: #28a745;
        }
        .footer-link {
            color: #767070; /* Color que prefieras para el texto del footer */
            text-decoration: none; /* Elimina el subrayado */
        }
    </style>




    <style>

        body, footer {
            background-color: #d4edda; /* Verde suave */
            margin: 0;
            padding: 0;
        }

        /* Footer específico */
        .bg-footer-theme {
            background-color: #d4edda !important; /* Verde suave con !important para sobrescribir */
        }

        /* Estilo del footer */
        footer {
            padding: 10px 0;
            text-align: center;
            background-color: #d4edda; /* Fondo verde suave para el footer */
        }
    </style>

    <style>
        /* Ajustar el margen entre la tabla y la paginación */
        .dataTables_wrapper .dataTables_info,
        .dataTables_wrapper .dataTables_paginate {
            margin-top: 0;
            padding-top: 0;
        }

        /* Alinea el texto de 'Mostrando entradas' y la paginación en la misma línea */
        .dataTables_wrapper .dataTables_info {
            display: inline-block;
            margin-right: 10px;
        }

        .dataTables_wrapper .dataTables_paginate {
            display: inline-block;
            float: right;
        }



    </style>



</head>

<body>


<!-- ?PROD Only: Google Tag Manager (noscript) (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">

        <aside>
            <!-- Sidebar aquí si es necesario -->
            <jsp:include page="../includes/sidebarAdmin.jsp"/>
        </aside>

        <div class="layout-page">
            <nav>
                <jsp:include page="../includes/navbarAdmin.jsp">
                    <jsp:param name="vista" value="Gestion de usuarios"/>
                </jsp:include>
            </nav>
            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->
                <div class="container-xxl flex-grow-1 container-p-y">

                    <div class="card-header d-flex flex-wrap justify-content-between gap-3">
                        <div class="col-12">
                            <div class="card mb-0" style="height: auto; padding: 5px;">
                                <div class="card-body d-flex align-items-center justify-content-center p-1">
                                    <div class="row w-100">
                                        <!-- Tipo de Usuario -->
                                        <div class="col-md-4 d-flex flex-column justify-content-center align-items-center mb-3 mt-0">
                                            <label for="select2Basic" class="form-label mb-1" style="font-size: 0.85rem;">Tipo de Usuario</label>
                                            <select id="select2Basic" class="select2 form-select form-select-sm" data-allow-clear="true">
                                                <option value="Todas">Todos</option>
                                                <option value="Usuario Final">Usuario Final</option>
                                                <option value="Albergue">Albergue</option>
                                            </select>
                                        </div>

                                        <!-- Palabra clave -->
                                        <div class="col-md-4 d-flex flex-column justify-content-center align-items-center mb-3 mt-0">
                                            <label for="inputPalabraClave" class="form-label mb-1" style="font-size: 0.85rem;">Palabra clave</label>
                                            <input type="text" id="inputPalabraClave" class="form-control form-control-sm" placeholder="Escribe palabra clave">
                                        </div>

                                        <!-- Fecha -->
                                        <div class="col-md-4 d-flex flex-column justify-content-center align-items-center mb-3 mt-0">
                                            <label for="select2Estado" class="form-label mb-1" style="font-size: 0.85rem;">Estado de cuenta</label>
                                            <select id="select2Estado" class="select2 form-select form-select-sm" data-allow-clear="true">
                                                <option value="Todas">Todas</option>
                                                <option value="Activa">Activa</option>
                                                <option value="Baneada">Baneada</option>
                                                <option value="Eliminada">Eliminada</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Tabla -->
                        <div class="card mb-2 col-12" style="padding: 10px; margin: 0;">
                            <div class="card-body">
                                <div class="card-datatable table-responsive">
                                    <table class="table table-striped table-bordered" id="solicitudesTable" >

                                        <thead>

                                        <th style="width: 180px;">Solicitante</th>
                                        <th style="width: 170px;">Nombre de Albergue</th>
                                        <th style="width: 170px;">Nombre de encargado</th>
                                        <th style="width: 240px;">Correo electrónico</th>
                                        <th style="width: 130px;">Fecha</th>
                                        <th style="width: 100px;">Acciones</th>

                                        </thead>
                                        <tbody>
                                        <%
                                            // Obtener la lista de usuarios del request
                                            List<Solicitudes> solicitudes = (List<Solicitudes>) request.getAttribute("listaSolicitudes");
                                            if (solicitudes != null) {
                                                for (Solicitudes solicitud : solicitudes) {
                                        %>
                                        <tr>
                                            <!-- Columna con foto y nombre -->
                                            <td>
                                                <%= solicitud.getSolicitante().getNombre().split(" ")[0] + " " + solicitud.getSolicitante().getApellido().split(" ")[0] %>
                                            </td>
                                            <!-- Correo electrónico -->
                                            <td>
                                                <%= solicitud.getNombreAlbergue() %>
                                            </td>
                                            <!-- Distrito -->
                                            <td>
                                                <%= solicitud.getNombreEncargado().split(" ")[0] + " " + solicitud.getApellidoEncargado().split(" ")[0]%>
                                            </td>
                                            <td>
                                                <%= solicitud.getEmail_albergue()%>
                                            </td>
                                            <!-- Email -->
                                            <td><%= solicitud.getFechaSolicitud().toString().substring(0,10)%></td>
                                            <!-- Botones de acción -->
                                            <td>
                                                <div class="card-body p-0">
                                                    <div class="d-inline-flex">
                                                        <!-- Botón de Aceptar con onClick, pasando el solicitudId -->
                                                        <button type="button" class="btn btn-sm btn-success me-1" data-bs-toggle="tooltip" title="Ver Aceptar" onclick="confirmarAceptacion(<%= solicitud.getSolicitudId() %>)">
                                                            <i class="bx bx-check-circle"></i>
                                                        </button>

                                                        <!-- Botón de Rechazar con onClick, pasando el solicitudId -->
                                                        <button type="button" class="btn btn-sm btn-danger" data-bs-toggle="tooltip" title="Rechazar" onclick="confirmarRechazo(<%= solicitud.getSolicitudId() %>)">
                                                            <i class="bx bxs-x-circle"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <%
                                                } // Cierra el for
                                            } // Cierra el if
                                        %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Footer -->
                    <footer class="footer bg-footer-theme">
                        <div class="container-fluid d-flex flex-md-row flex-column justify-content-between align-items-md-center gap-1 container-p-x py-3">
                            <div>
                                <a href="javascript:void(0)" class="footer-link me-4">©2024 Alianza Animal S.A. Todos los derechos reservados.</a>
                            </div>
                            <div>
                                <a href="javascript:void(0)" class="footer-link me-4">Ayuda</a>
                                <a href="javascript:void(0)" class="footer-link me-4">Contactos</a>
                                <a href="javascript:void(0)" class="footer-link">Términos &amp; Condiciones</a>
                            </div>
                        </div>
                    </footer>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- /Layout wrapper -->

<!-- Core JS -->

<!-- build:js assets/vendor/js/core.js -->


<!-- endbuild -->



<script src="<%=request.getContextPath()%>/assets/vendor/libs/jquery/jquery.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/popper/popper.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/hammer/hammer.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/i18n/i18n.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/libs/typeahead-js/typeahead.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/js/menu.js"></script>

<!-- endbuild -->

<!-- Vendors JS -->

<script src="<%=request.getContextPath()%>/assets/vendor/libs/apex-charts/apexcharts.js"></script>

<!-- Main JS -->
<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>

<script src="<%=request.getContextPath()%>/assets/js/dashboards-analytics.js"></script>
<!-- Page JS -->
<script src="<%=request.getContextPath()%>/assets/js/extended-ui-sweetalert2.js"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.2.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.bootstrap5.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>

<!-- Activa los tooltips -->

<script>
    function confirmarAceptacion(solicitudId) {
        // Muestra la alerta de confirmación con SweetAlert
        Swal.fire({
            title: '¿Estás seguro?',
            text: "Esta acción aceptará la solicitud.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Sí, aceptar',
            cancelButtonText: 'Cancelar',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                aceptarSolicitud(solicitudId); // Enviar la solicitud para aceptar
            }
        });
    }

    function aceptarSolicitud(solicitudId) {
        // Mostrar SweetAlert de carga mientras se procesa la solicitud
        Swal.fire({
            title: 'Procesando solicitud...',
            text: 'Por favor espera un momento.',
            icon: 'info',
            allowOutsideClick: false, // Evita que el usuario cierre el alert haciendo clic fuera
            showConfirmButton: false, // Oculta el botón de confirmación
            didOpen: () => {
                Swal.showLoading(); // Muestra el spinner de carga
            }
        });

        // Realiza una solicitud AJAX para aceptar la solicitud
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "crearAlbergues", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                // Cierra el alert de carga
                Swal.close();

                // Analiza la respuesta del servidor como JSON
                var response = JSON.parse(xhr.responseText);

                if (response.status === "success") {
                    Swal.fire(
                        'Solicitud aceptada',
                        response.message, // Mensaje de éxito desde el servidor
                        'success'
                    ).then(() => {
                        location.reload(); // Recarga toda la página
                    });
                } else {
                    Swal.fire(
                        'Error',
                        response.message, // Mensaje de error desde el servidor
                        'error'
                    );
                }
            }
        };

        // Enviar tanto el ID de la solicitud como la acción (aceptar)
        xhr.send("solicitudId=" + solicitudId + "&action=aceptar");
    }

</script>
<script>
    function confirmarRechazo(solicitudId) {
        // Muestra la alerta de confirmación con SweetAlert
        Swal.fire({
            title: '¿Estás seguro?',
            text: "Esta acción rechazará la solicitud.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Sí, rechazar',
            cancelButtonText: 'Cancelar',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                rechazarSolicitud(solicitudId); // Enviar la solicitud para rechazar
            }
        });
    }

    function rechazarSolicitud(solicitudId) {
        // Mostrar SweetAlert de carga mientras se procesa la solicitud
        Swal.fire({
            title: 'Procesando solicitud...',
            text: 'Por favor espera un momento.',
            icon: 'info',
            allowOutsideClick: false, // Evita que el usuario cierre el alert haciendo clic fuera
            showConfirmButton: false, // Oculta el botón de confirmación
            didOpen: () => {
                Swal.showLoading(); // Muestra el spinner de carga
            }
        });

        // Realiza una solicitud AJAX para rechazar la solicitud
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "crearAlbergues", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                // Cierra el alert de carga
                Swal.close();

                // Analiza la respuesta del servidor como JSON
                var response = JSON.parse(xhr.responseText);

                if (response.status === "success") {
                    Swal.fire(
                        'Solicitud rechazada',
                        response.message, // Mensaje de éxito desde el servidor
                        'success'
                    ).then(() => {
                        location.reload(); // Recarga toda la página
                    });
                } else {
                    Swal.fire(
                        'Error',
                        response.message,
                        'error'
                    );
                }
            }
        };

        // Enviar tanto el ID de la solicitud como la acción (rechazar)
        xhr.send("solicitudId=" + solicitudId + "&action=rechazar");
    }

</script>

<script>
    $(document).ready(function () {
        if (!$.fn.DataTable.isDataTable('#solicitudesTable')) {
            var table = $('#solicitudesTable').DataTable({
                paging: true,
                pagingType: "full_numbers",
                pageLength: 5,
                lengthChange: true,
                buttons: ['copy', 'excel', 'pdf'],
                dom: 'Bfrtip', // Con buscador y mostrando información
                language: {
                    lengthMenu: "Mostrar _MENU_ entradas",
                    info: "Mostrando _START_ a _END_ de _TOTAL_ entradas",
                    infoEmpty: "Mostrando 0 a 0 de 0 entradas",
                    infoFiltered: "(filtrado de _MAX_ entradas totales)",
                    paginate: {
                        first: '<i class="bx bx-chevrons-left"></i>',
                        last: '<i class="bx bx-chevrons-right"></i>',
                        next: '<i class="bx bx-chevron-right"></i>',
                        previous: '<i class="bx bx-chevron-left"></i>'
                    }
                }
            });

            // Ocultar manualmente el buscador
            $('#solicitudesTable_filter').hide();

            // Función para filtrar en tiempo real
            configurarFiltros(table);
        }
    });
</script>

<script>
    function configurarFiltros(table) {
        // Filtro de Tipo de Usuario
        $('#select2Basic').on('change', function () {
            var valor = $(this).val(); // Capturamos el valor del select
            if (valor === "Todas") valor = ''; // Si es "Todas", no filtramos nada
            table.column(1).search(valor).draw(); // Filtramos por la columna 1 (Tipo de Usuario)
        });

        // Filtro de Palabra Clave (en cualquier columna)
        $('#inputPalabraClave').on('keyup', function () {
            table.search(this.value).draw(); // Realizamos la búsqueda global
        });

        // Filtro de Fecha
        $('#select2Estado').on('change', function () {
            var valor = $(this).val();
            if (valor === "Todas") valor = '';
            table.column(5).search(valor).draw();
        });
    }
</script>


</body>



<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:07 GMT -->
</html>


