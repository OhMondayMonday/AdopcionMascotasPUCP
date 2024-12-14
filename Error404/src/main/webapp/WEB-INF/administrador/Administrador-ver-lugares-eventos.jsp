<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
%>

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
                <jsp:include page="../includes/navbarAdmin.jsp"/>
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
                                                <option value="Todas">Todas</option>
                                                <option value="Personal">Personal</option>
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
                                            <label for="select2Fecha" class="form-label mb-1" style="font-size: 0.85rem;">Fecha</label>
                                            <select id="select2Fecha" class="select2 form-select form-select-sm" data-allow-clear="true">
                                                <option value="Todas">Todas</option>
                                                <option value="Ultimas24Horas">Últimas 24 horas</option>
                                                <option value="UltimaSemana">Esta semana</option>
                                                <option value="UltimoMes">Este mes</option>
                                                <option value="UltimoAnio">Este año</option>
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
                                    <table class="table table-striped table-bordered text-center" id="solicitudesTable">
                                        <thead class="table-success">
                                        <tr>
                                            <th>#</th>
                                            <th>Nombre del Lugar</th>
                                            <th>Dirección</th>
                                            <th>Distrito</th>
                                            <th>Aforo Máximo</th>
                                            <th>Estado</th>
                                            <th>Disponibilidad</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="lugar" items="${lugaresEventos}">
                                            <tr>
                                                <td>${lugar.lugarId}</td>
                                                <td>${lugar.nombreLugar}</td>
                                                <td>${lugar.direccionLugar}</td>
                                                <td>${lugar.distrito.nombreDistrito}</td>
                                                <td>${lugar.aforoMaximo}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${lugar.activo}">
                                                            <span class="badge bg-success">Activo</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge bg-danger">Inactivo</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${lugar.disponible}">
                                                            <span class="badge bg-success">Disponible</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge bg-danger">No Disponible</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:forEach>
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
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
</script>

<script>
    function showModal(action, elementId) {
        const modalMessage = document.getElementById('modalMessage');
        const confirmActionBtn = document.getElementById('confirmActionBtn');

        // Configurar el mensaje del modal y la acción del botón de confirmar
        if (action === 'Aceptar') {
            modalMessage.textContent = '¿Estás seguro de aceptar la creación de esta cuenta?';
            // Asegúrate de eliminar el evento anterior antes de agregar uno nuevo
            confirmActionBtn.onclick = function() {
                cambiarEstado(elementId, 'Aceptado');
                closeModal();
            };
        } else if (action === 'Rechazar') {
            modalMessage.textContent = '¿Estás seguro de rechazar la creación de esta cuenta?';
            // Eliminar el evento anterior antes de agregar uno nuevo
            confirmActionBtn.onclick = function() {
                cambiarEstado(elementId, 'Rechazado');
                closeModal();
            };
        }

        // Mostrar el modal (asegúrate de que Bootstrap JS esté funcionando correctamente)
        const modal = new bootstrap.Modal(document.getElementById('confirmationModal'));
        modal.show();
    }

    // Función para cambiar el estado dinámicamente
    function cambiarEstado(elementId, nuevoEstado) {
        const estadoElement = document.getElementById(elementId);
        estadoElement.textContent = nuevoEstado;

        // Cambia el color de la etiqueta según el estado
        if (nuevoEstado === 'Aceptado') {
            estadoElement.className = 'badge bg-label-success me-1'; // Cambia el color a verde
        } else if (nuevoEstado === 'Rechazado') {
            estadoElement.className = 'badge bg-label-danger me-1'; // Cambia el color a rojo
        } else {
            estadoElement.className = 'badge bg-label-primary me-1'; // Mantén el color original
        }
    }

    // Función para cerrar el modal
    function closeModal() {
        const modal = bootstrap.Modal.getInstance(document.getElementById('confirmationModal'));
        if (modal) {
            modal.hide(); // Cerrar el modal
        }
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
        $('#select2Fecha').on('change', function () {
            var valor = $(this).val();
            var fechaActual = new Date();
            var fechaInicio;

            // Calculamos el rango de fechas basado en la selección
            switch (valor) {
                case "Ultimas24Horas":
                    fechaInicio = new Date(fechaActual);
                    fechaInicio.setDate(fechaActual.getDate() - 1);
                    break;
                case "UltimaSemana":
                    fechaInicio = new Date(fechaActual);
                    fechaInicio.setDate(fechaActual.getDate() - 7);
                    break;
                case "UltimoMes":
                    fechaInicio = new Date(fechaActual);
                    fechaInicio.setMonth(fechaActual.getMonth() - 1);
                    break;
                case "UltimoAnio":
                    fechaInicio = new Date(fechaActual);
                    fechaInicio.setFullYear(fechaActual.getFullYear() - 1);
                    break;
                default:
                    fechaInicio = null; // No aplicar filtro si es "Todas"
            }

            // Personalizamos el filtro para fechas en la columna 5
            $.fn.dataTable.ext.search.push(function (settings, data, dataIndex) {
                if (!fechaInicio) return true; // No filtrar si fechaInicio es nulo

                var fechaTabla = new Date(data[5]); // Extraer la fecha de la columna 5
                return fechaTabla >= fechaInicio && fechaTabla <= fechaActual;
            });

            table.draw(); // Aplicar el filtro
            $.fn.dataTable.ext.search.pop(); // Limpiar el filtro personalizado
        });
    }
</script>


</body>



<!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:07 GMT -->
</html>
