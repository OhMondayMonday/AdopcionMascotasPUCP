|<%--
  Created by IntelliJ IDEA.
  User: Luis Joaquin Pozo
  Date: 5/11/2024
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Publicaciones - Usuario Final</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="container">
    <header>
        <h1>Publicaciones</h1>
        <!-- Filtros de publicaciones -->
        <div class="filters">
            <label for="tipo-publicacion">Tipo de Publicación</label>
            <select id="tipo-publicacion" name="tipo-publicacion">
                <option value="todas">Todas</option>
                <option value="adopcion">Adopción</option>
                <option value="donaciones-activos">Donaciones Activas</option>
                <option value="donaciones-dinero">Donaciones de Dinero</option>
            </select>

            <label for="palabra-clave">Palabra Clave</label>
            <input type="text" id="palabra-clave" name="palabra-clave" placeholder="Escribe palabra clave">

            <label for="rango-fechas">Rango de Fechas</label>
            <input type="date" id="rango-fechas" name="rango-fechas">

            <button onclick="aplicarFiltro()">Aplicar filtro</button>
            <button onclick="nuevaPublicacion()">Nueva publicación</button>
        </div>
    </header>

    <!-- Contenedor de publicaciones -->
    <div class="publicaciones">
        <c:forEach var="publicacion" items="${publicaciones}">
            <div class="publicacion-card">
                <h2>${publicacion.titulo}</h2>
                <p>${publicacion.descripcion}</p>
                <a href="detalles?id=${publicacion.publicacionId}">Detalles</a>
                <a href="inscripcion?id=${publicacion.publicacionId}">Inscripción</a>
            </div>
        </c:forEach>
    </div>

    <!-- Paginación -->
    <div class="paginacion">
        <button onclick="paginaAnterior()">Anterior</button>
        <span>1</span> <!-- Ejemplo de página actual -->
        <button onclick="paginaSiguiente()">Siguiente</button>
    </div>
</div>

<script src="scripts.js"></script>
</body>
</html>

