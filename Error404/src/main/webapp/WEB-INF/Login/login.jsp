<%--
  Created by IntelliJ IDEA.
  User: stars
  Date: 17/11/2024
  Time: 01:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/EstilosIndex.css">
    <title>Alianza Animal || Login</title>
    <meta name="description" content="Most Powerful &amp; Comprehensive Bootstrap 5 Admin Dashboard built for developers!" />
    <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
    <!-- Canonical SEO -->
    <link rel="canonical" href="https://themeselection.com/item/sneat-dashboard-pro-bootstrap/">


    <!-- ? PROD Only: Google Tag Manager (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
            new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
        j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
        '<%=request.getContextPath()%>>/www.googletagmanager.com/gtm5445.html?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-5DDHKGP');</script>
    <!-- End Google Tag Manager -->
    <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/assets/img/logo_Alianza_Animal_-removebg-preview.png" />
    <style>
        /* Estilos para el botón "Volver al Inicio" */
        .back-link {
            position: relative;  /* Mantiene el botón fijo al desplazarse */
            top: -30px;
            left: -160px;
            padding: 10px 20px;
            background-color: #6C63FF;
            color: white;
            border-radius: 10px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s ease;
            z-index: 1000; /* Asegura que el botón siempre esté encima */
        }

        .back-link:hover {
            background-color: #594BF2;
        }
    </style>

</head>
<body>
<div class="container">
    <div class="image-section">
        <img src="<%=request.getContextPath()%>/assets/img/FotoPerroDuena.avif" alt="Imagen de mascota">
    </div>
    <div class="form-section">
        <div class="form-container">
            <a href="" class="back-link">Volver al inicio</a>
        </div>
        <img src="<%=request.getContextPath()%>/assets/img/logo Alianza Animal .png" alt="Logo" class="logo">
        <h2>Bienvenido!</h2>
        <p>Crea tu cuenta y apoya al cuidado de las mascotas</p>
        <form id="loginForm" action="login" method="post">
            <label for="email">Correo o usuario:</label>
            <input type="email" id="email" name="email" placeholder="Ingrese su correo o usuario" required>

            <label for="contrasenia">Contraseña:</label>
            <input type="password" id="contrasenia" name="contrasenia" placeholder="Contraseña" required>

            <a href="recuperar.html">¿Olvidaste tu contraseña?</a>

            <button type="submit">Ingresar</button>
        </form>
        <p>Nuevo en la plataforma? <a href="registro.html">Crea una cuenta</a></p>
    </div>
</div>
</body>
</html>
