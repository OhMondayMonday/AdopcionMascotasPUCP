<!-- Incluye Bootstrap CSS y JavaScript en tu JSP -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>


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
            <a href="albergue-ver-inicio.html" class="menu-link">
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
            <a href="albergue-ver-hogarestemporales.html" class="menu-link">
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