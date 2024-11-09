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

        <title>Alianza Animal || Admin Solicitudes</title>


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
        <link rel="stylesheet" href="../../assets/vendor/libs/datatables-bs5/datatables.bootstrap5.css">
        <link rel="stylesheet" href="../../assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css">
        <link rel="stylesheet" href="../../assets/vendor/libs/datatables-checkboxes-jquery/datatables.checkboxes.css">
        <link rel="stylesheet" href="../../assets/vendor/libs/datatables-buttons-bs5/buttons.bootstrap5.css">
        <link rel="stylesheet" href="../../assets/vendor/libs/flatpickr/flatpickr.css" />
        <!-- Row Group CSS -->
        <link rel="stylesheet" href="../../assets/vendor/libs/datatables-rowgroup-bs5/rowgroup.bootstrap5.css">
        <!-- Form Validation -->
        <link rel="stylesheet" href="../../assets/vendor/libs/@form-validation/form-validation.css" />

        <!-- Page CSS -->


        <!-- Helpers -->
        <script src="../../assets/vendor/js/helpers.js"></script>
        <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
        <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->

        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
        <script src="../../assets/js/config.js"></script>


        <style>
            .btn {
                margin-right: 5px;
            }

            .btn-success {
                background-color: #28a745;
                color: white;
            }

            .btn-danger {
                background-color: #dc3545;
                color: white;
            }

            .table {
                width: 100%;
                text-align: center;
            }

            th, td {
                padding: 10px;
            }

            td img {
                display: block;
                margin: 0 auto 5px;
            }

            td div {
                text-align: center;
            }

            .pagination {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 20px;
                padding-bottom: 20px; /* Añade un espacio inferior para evitar el solapamiento con el footer */
            }

            .page-link {
                display: inline-block;
                padding: 10px 15px;
                margin: 0 5px;
                border: 1px solid #ddd;
                background-color: #fff;
                color: #191a1c;
                text-align: center;
                border-radius: 4px;
                text-decoration: none;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .page-link:hover {
                background-color: #a4afb5;
                color: white;
            }

            .page-link.active {
                background-color: #2e3031;
                color: white;
                cursor: default;
            }

            .page-link:disabled {
                opacity: 0.6;
                cursor: not-allowed;
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

                <div class="layout-page">

                    <!-- Content wrapper -->
                    <div class="container-xxl flex-grow-1 container-p-y">

                        <div class="card">
                            <h5 class="card-header pb-0 text-md-start text-center"></h5>
                            <div class="card-datatable table-responsive">
                                <table class="dt-albergue table border-top">
                                    <thead>
                                        <tr>
                                            <th>Denunciado</th>
                                            <th>Insignia</th>
                                            <th>Albergue</th>
                                            <th>Email Albergue</th>
                                            <th>Hora</th>
                                            <th>Fecha</th>
                                            <th>Acción</th>
                                        </tr>
                                    </thead>
                                    <tbody id="perritoRows">
                                        <tr class="perritoRow" id="row1">
                                            <td>
                                                <div>
                                                    <img src="C:\IWEB clon\Repo404\HTML_Iweb\assets\img\Avatar1.avif" alt="Perrito" width="80px" height="80px">
                                                    <p><strong>Nombre:</strong> Miguel Cayetano</p>
                                                    <p><strong>DNI:</strong> 72210370</p>
                                                </div>
                                            </td>
                                            <td>001</td>
                                            <td>Albergue ABC</td>
                                            <td>abc@albergue.com</td>
                                            <td>08:30</td>
                                            <td>2024-10-01</td>
                                            <td>
                                                <button class="btn btn-success" onclick="aceptarSolicitud('row1')">✔️ Aceptar</button>
                                                <button class="btn btn-danger" onclick="rechazarSolicitud('row1')">❌ Rechazar</button>
                                            </td>
                                        </tr>
                                        <tr class="perritoRow" id="row2">
                                            <td>
                                                <div>
                                                    <img src="C:\IWEB clon\Repo404\HTML_Iweb\assets\img\Beagle.webp" alt="Perrito" width="80px" height="80px">
                                                    <p><strong>Nombre:</strong> Luna</p>
                                                    <p><strong>Raza:</strong> Beagle</p>
                                                </div>
                                            </td>
                                            <td>002</td>
                                            <td>Albergue XYZ</td>
                                            <td>xyz@albergue.com</td>
                                            <td>09:15</td>
                                            <td>2024-10-02</td>
                                            <td>
                                                <button class="btn btn-success" onclick="aceptarSolicitud('row2')">✔️ Aceptar</button>
                                                <button class="btn btn-danger" onclick="rechazarSolicitud('row2')">❌ Rechazar</button>
                                            </td>
                                        </tr>
                                        <tr class="perritoRow" id="row3">
                                            <td>
                                                <div>
                                                    <img src="C:\IWEB clon\Repo404\HTML_Iweb\assets\img\Golden.webp" alt="Perrito" width="80px" height="80px">
                                                    <p><strong>Nombre:</strong> Buddy</p>
                                                    <p><strong>Raza:</strong> Golden Retriever</p>
                                                </div>
                                            </td>
                                            <td>003</td>
                                            <td>Albergue DEF</td>
                                            <td>def@albergue.com</td>
                                            <td>10:00</td>
                                            <td>2024-10-03</td>
                                            <td>
                                                <button class="btn btn-success" onclick="aceptarSolicitud('row3')">✔️ Aceptar</button>
                                                <button class="btn btn-danger" onclick="rechazarSolicitud('row3')">❌ Rechazar</button>
                                            </td>
                                        </tr>
                                        <tr class="perritoRow" id="row4">
                                            <td>
                                                <div>
                                                    <img src="C:\IWEB clon\Repo404\HTML_Iweb\assets\img\Chihuahua.webp" alt="Perrito" width="80px" height="80px">
                                                    <p><strong>Nombre:</strong> Bella</p>
                                                    <p><strong>Raza:</strong> Chihuahua</p>
                                                </div>
                                            </td>
                                            <td>004</td>
                                            <td>Albergue GHI</td>
                                            <td>ghi@albergue.com</td>
                                            <td>11:45</td>
                                            <td>2024-10-04</td>
                                            <td>
                                                <button class="btn btn-success" onclick="aceptarSolicitud('row4')">✔️ Aceptar</button>
                                                <button class="btn btn-danger" onclick="rechazarSolicitud('row4')">❌ Rechazar</button>
                                            </td>
                                        </tr>
                                        <tr class="perritoRow" id="row5">
                                            <td>
                                                <div>
                                                    <img src="C:\IWEB clon\Repo404\HTML_Iweb\assets\img\PastorAleman.webp" alt="Perrito" width="80px" height="80px">
                                                    <p><strong>Nombre:</strong> Rex</p>
                                                    <p><strong>Raza:</strong> Pastor Alemán</p>
                                                </div>
                                            </td>
                                            <td>005</td>
                                            <td>Albergue JKL</td>
                                            <td>jkl@albergue.com</td>
                                            <td>13:30</td>
                                            <td>2024-10-05</td>
                                            <td>
                                                <button class="btn btn-success" onclick="aceptarSolicitud('row5')">✔️ Aceptar</button>
                                                <button class="btn btn-danger" onclick="rechazarSolicitud('row5')">❌ Rechazar</button>
                                            </td>
                                        </tr>
                                        <tr class="perritoRow" id="row6">
                                            <td>
                                                <div>
                                                    <img src="C:\IWEB clon\Repo404\HTML_Iweb\assets\img\.webp" alt="Perrito" width="80px" height="80px">
                                                    <p><strong>Nombre:</strong> Timón</p>
                                                    <p><strong>Raza:</strong> Shar-Pei</p>
                                                </div>
                                            </td>
                                            <td>005</td>
                                            <td>Albergue JKL</td>
                                            <td>jkl@albergue.com</td>
                                            <td>13:30</td>
                                            <td>2024-10-05</td>
                                            <td>
                                                <button class="btn btn-success" onclick="aceptarSolicitud('row6')">✔️ Aceptar</button>
                                                <button class="btn btn-danger" onclick="rechazarSolicitud('row6')">❌ Rechazar</button>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                            <div class="pagination">
                                <button id="prevBtn" class="page-link" onclick="prevPage()">«</button>
                                <div id="pageNumbers"></div>
                                <button id="nextBtn" class="page-link" onclick="nextPage()">»</button>
                            </div>
                        </div>

                        <!-- /Layout wrapper -->

                        <!-- Core JS -->
                        <footer class="footer bg-footer-theme">
                            <div class="container-fluid d-flex flex-md-row flex-column justify-content-between align-items-md-center gap-1 container-p-x py-3">
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
                        <script src="../../assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
                        <!-- Flat Picker -->
                        <script src="../../assets/vendor/libs/moment/moment.js"></script>
                        <script src="../../assets/vendor/libs/flatpickr/flatpickr.js"></script>
                        <!-- Form Validation -->
                        <script src="../../assets/vendor/libs/@form-validation/popular.js"></script>
                        <script src="../../assets/vendor/libs/@form-validation/bootstrap5.js"></script>
                        <script src="../../assets/vendor/libs/@form-validation/auto-focus.js"></script>

                        <!-- Main JS -->
                        <script src="../../assets/js/main.js"></script>


                        <!-- Page JS -->
                        <script src="../../assets/js/tables-datatables-basic.js"></script>


                        <script>
                            const rows = document.querySelectorAll('.perritoRow');
                            const itemsPerPage = 3;
                            let currentPage = 0;
                            const totalPages = Math.ceil(rows.length / itemsPerPage);

                            function renderPage() {
                                rows.forEach((row, index) => {
                                    if (index >= currentPage * itemsPerPage && index < (currentPage + 1) * itemsPerPage) {
                                        row.style.display = '';
                                    } else {
                                        row.style.display = 'none';
                                    }
                                });
                                renderPageNumbers();
                            }

                            function renderPageNumbers() {
                                const pageNumbersDiv = document.getElementById('pageNumbers');
                                pageNumbersDiv.innerHTML = '';

                                // Add first pages and ellipsis if needed
                                for (let i = 0; i < totalPages; i++) {
                                    if (i < 2 || i === totalPages - 1 || (i >= currentPage - 1 && i <= currentPage + 1)) {
                                        const pageButton = document.createElement('button');
                                        pageButton.classList.add('page-link');
                                        pageButton.textContent = i + 1;
                                        pageButton.onclick = () => goToPage(i);
                                        if (i === currentPage) {
                                            pageButton.classList.add('active');
                                        }
                                        pageNumbersDiv.appendChild(pageButton);
                                    } else if (i === currentPage - 2 || i === currentPage + 2) {
                                        const ellipsis = document.createElement('span');
                                        ellipsis.textContent = '...';
                                        pageNumbersDiv.appendChild(ellipsis);
                                    }
                                }

                                document.getElementById('prevBtn').disabled = currentPage === 0;
                                document.getElementById('nextBtn').disabled = currentPage === totalPages - 1;
                            }

                            function goToPage(page) {
                                currentPage = page;
                                renderPage();
                            }

                            function nextPage() {
                                if (currentPage < totalPages - 1) {
                                    currentPage++;
                                    renderPage();
                                }
                            }

                            function prevPage() {
                                if (currentPage > 0) {
                                    currentPage--;
                                    renderPage();
                                }
                            }

                            // Inicializar la primera página
                            renderPage();
                        </script>

                        <script>
                            function aceptarSolicitud(rowId) {
                                let row = document.getElementById(rowId);
                                row.style.backgroundColor = "#d4edda"; // Color verde claro
                            }

                            function rechazarSolicitud(rowId) {
                                let row = document.getElementById(rowId);
                                row.style.backgroundColor = "#f8d7da"; // Color rojo claro
                            }
                        </script>
                    </div>
                </div>
            </div>
        </div>

    </body>



    <!-- Mirrored from demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template-semi-dark/tables-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 26 Apr 2024 23:16:07 GMT -->
</html>

<!-- beautify ignore:end -->