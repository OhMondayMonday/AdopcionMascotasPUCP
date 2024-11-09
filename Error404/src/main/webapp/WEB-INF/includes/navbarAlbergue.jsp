<!-- Incluye Bootstrap CSS y JavaScript en tu JSP -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<img src="<%= request.getContextPath() %>/assets/img/huella.jpg" alt="Logo" class="w-px-40 h-auto rounded-circle">

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
                <p class="mb-0 fst-normal fw-semibold ff-">Editar Evento </p>
              </span>
            </div>
        </div>

        <ul class="navbar-nav flex-row align-items-center ms-0">
            <span class="text-body" style="margin-left: 10px; margin-right: 2px; font-weight: bold;">Albergue Huellas</span>
            <!-- User -->
            <li class="nav-item navbar-dropdown dropdown-user dropdown">
                <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                        <img src="${pageContext.request.contextPath}/assets/img/huella.jpg" alt class="w-px-40 h-auto rounded-circle">
                    </div>
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                        <a class="dropdown-item" href="albergue-ver-inicio.html">
                            <div class="d-flex">
                                <div class="flex-shrink-0 me-3">
                                    <div class="avatar avatar-online">
                                        <img src="${pageContext.request.contextPath}/assets/img/huella.jpg" alt class="w-px-40 h-auto rounded-circle">
                                    </div>
                                </div>
                                <div class="flex-grow-1">
                                    <span class="fw-medium d-block"> Huellas </span>
                                    <small class="text-muted">Albergue</small>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <div class="dropdown-divider"></div>
                    </li>
                    <li>
                        <a class="dropdown-item" href="albergue-ver-miperfil-detalles.html">
                            <i class="bx bx-user me-2"></i>
                            <span class="align-middle">Mi perfil</span>
                        </a>
                    </li>


                    <li>
                        <div class="dropdown-divider"></div>
                    </li>
                    <li>
                        <a class="dropdown-item" href="albergue-ver-mispublicaciones.html">
                            <i class="bx bx-building-house"></i>
                            <span class="align-middle">Mis publicaciones</span>
                        </a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="albergue-ver-miseventos.html">
                            <i class="bx bx-bone"></i>
                            <span class="align-middle">Mis eventos</span>
                        </a>
                    </li>
                    <li>
                        <div class="dropdown-divider"></div>
                    </li>
                    <li>
                        <a class="dropdown-item" href="../index.html">
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