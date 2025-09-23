-- Tabla Usuarios Ver
SELECT 
    f.url_foto AS Foto,
    CONCAT(u.nombre, ' ', u.apellido) AS Nombre,
    r.nombre_rol AS 'Tipo Usuario',
    u.email AS 'Correo Electrónico',
    u.numero_contacto_donaciones AS 'Contacto',
    DATE(u.fecha_registro) AS 'Fecha Creación'
FROM
    usuarios u,
    roles r,
    fotos f
WHERE
    u.rol_id = r.rol_id
        AND u.user_id = f.usuario_id
        AND u.estado_cuenta = 'activa'
ORDER BY u.fecha_registro DESC;

-- Tabla Donaciones Ver
SELECT 
    CONCAT(u.nombre, ' ', u.apellido) AS 'Usuario',
    a.nombre_albergue AS 'Destino',
    s.estado_solicitud AS 'Estado',
    DATE(s.fecha_solicitud) AS 'Fecha',
    HOUR(s.fecha_solicitud) AS 'Hora',
    s.dinero_donado AS 'Monto Donado'
FROM
    solicitudes s
        JOIN
    usuarios AS u ON s.solicitado_id = u.user_id
        JOIN
    usuarios AS a ON s.solicitante_id = u.user_id
WHERE
    s.tipo_solicitud_id = 4
ORDER BY s.fecha_solicitud DESC;

 -- Solicitudes de Usuarios Ver
SELECT 
    f.url_foto AS Foto,
    CONCAT(u.nombre, ' ', u.apellido) AS Nombre,
    r.nombre_rol AS 'Tipo Usuario',
    u.email AS 'Correo Electrónico',
    s.estado_solicitud AS 'Estado',
    DATE(s.fecha_solicitud) AS 'Fecha Solicitud',
    TIME(s.fecha_solicitud) AS 'Hora'
FROM
    usuarios u,
    solicitudes s,
    roles r,
    fotos f
WHERE
    u.user_id = s.solicitante_id
        AND u.user_id = f.usuario_id
        AND u.rol_id = r.rol_id
        AND s.tipo_solicitud_id = 2
ORDER BY s.fecha_solicitud DESC;

-- Coordinadores de zona Ver
SELECT 
    f.url_foto AS Foto,
    CONCAT(u.nombre, ' ', u.apellido) AS Nombre,
    u.DNI AS 'DNI',
    u.email AS 'Correo',
    u.numero_contacto_donaciones AS 'Teléfono',
    u.fecha_nacimiento AS 'Fecha Nacimiento',
    z.nombre_zona AS 'Zona'
FROM
    usuarios u,
    zonas z,
    fotos f
WHERE
    u.zona_id = z.zona_id
        AND u.user_id = f.usuario_id
        AND u.rol_id = 3;

-- Tabla Lugares Registrados Ver
SELECT 
    l.nombre_lugar AS 'Nombre Lugar',
    l.direccion_lugar AS 'Dirección',
    d.nombre_distrito AS 'Distrito',
    l.aforo_maximo AS 'Cap. Máxima',
    l.activo AS 'Estado'
FROM
    lugares_eventos l,
    distritos d
WHERE
    l.distrito_id = d.distrito_id;

-- Dashboard (Solo lo solicitado en el documento)
-- Cantidad de donaciones recibidas por albergue
SELECT 
    u.nombre_albergue AS "Albergue",
    COUNT(s.solicitud_id) AS "Cantidad de donaciones"
FROM 
    solicitudes s
JOIN 
    usuarios u ON s.solicitante_id = u.user_id
WHERE 
    s.tipo_solicitud_id = 3 OR s.tipo_solicitud_id = 4
GROUP BY 
    s.solicitante_id;
    
-- Cantidad de donaciones recibidas enviadas por usuario TOP 10
SELECT 
    concat(u.nombre,' ',u.apellido) AS "Nombre Usuario",
    COUNT(s.solicitud_id) AS "Cantidad de donaciones"
FROM 
    solicitudes s
JOIN 
    usuarios u ON s.solicitado_id = u.user_id
WHERE 
    s.tipo_solicitud_id = 3 OR s.tipo_solicitud_id = 4
GROUP BY 
    s.solicitado_id
ORDER BY
	'Cantidad de donaciones'
LIMIT
	10;
    
-- Cantidad de mascotas reportadas como perdidas por mes (ultimos 3)
SELECT 
    MONTH(p.fecha_creacion) AS 'Mes',
    COUNT(p.publicacion_id) AS 'Cantidad de mascotas perdidas'
FROM
    publicaciones_mascota_perdida pmp,
    publicaciones p
WHERE
    pmp.publicacion_id = p.publicacion_id
GROUP BY MONTH(p.fecha_creacion)
ORDER BY MONTH(p.fecha_creacion) DESC
LIMIT 3;

-- Cantidad de mascotas reportadas como perdidas por año
SELECT 
    YEAR(p.fecha_creacion) AS 'Año',
    COUNT(p.publicacion_id) AS 'Cantidad de mascotas perdidas'
FROM
    publicaciones_mascota_perdida pmp,
    publicaciones p
WHERE
    pmp.publicacion_id = p.publicacion_id
GROUP BY YEAR(p.fecha_creacion)
ORDER BY YEAR(p.fecha_creacion) DESC;

-- Cantidad de usuarios baneados
SELECT 
    COUNT(*) AS 'Cantidad de usuarios baneados'
FROM
    usuarios u
WHERE
    u.estado_cuenta = 'baneada';

-- Cantidad de usuarios activos
SELECT 
    COUNT(*) AS 'Cantidad de usuarios activos'
FROM
    usuarios u
WHERE
    u.estado_cuenta = 'activa';

-- Cantidad de albergues registrados
SELECT 
    COUNT(*) AS 'Cantidad de albergues registrados'
FROM
    usuarios u
WHERE
    u.rol_id = 2;

-- Cantidad de mascotas encontradas por mes (ultimos 3)
SELECT 
    MONTH(p.fecha_creacion) AS 'Mes',
    COUNT(p.publicacion_id) AS 'Cantidad de mascotas encontradas'
FROM
    publicaciones_mascota_perdida pmp,
    publicaciones p
WHERE
    pmp.publicacion_id = p.publicacion_id
        AND pmp.mascota_encontrada = 1
GROUP BY MONTH(p.fecha_creacion)
ORDER BY MONTH(p.fecha_creacion) DESC
LIMIT 3;