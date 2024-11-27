-- Crear un usuario con user_id = 1
INSERT INTO usuarios (user_id, username, contraseña, nombre, apellido, email, DNI, direccion, distrito_id, estado_cuenta, rol_id, fecha_registro)
VALUES (1, 'jmunoz', 'password123', 'Jorge', 'Muñoz', 'jmunoz@example.com', '12345678', 'Calle Falsa 123', 1, 'activa', 2, CURRENT_TIMESTAMP);

INSERT INTO fotos (foto_id, url_foto, fecha_subida)
VALUES 
(1, 'https://example.com/fotos/perro_perdido.jpg', CURRENT_TIMESTAMP),
(2, 'https://example.com/fotos/gato_adopcion.jpg', CURRENT_TIMESTAMP),
(3, 'https://example.com/fotos/donacion_alimentos.jpg', CURRENT_TIMESTAMP),
(4, 'https://example.com/fotos/evento_benefico.jpg', CURRENT_TIMESTAMP);

-- Crear 4 publicaciones para el usuario con user_id = 1
INSERT INTO publicaciones (publicacion_id, user_id, titulo, descripcion, foto_id, comentario, fecha_creacion, tipo_publicacion_id, estado_publicacion)
VALUES 
(1, 1, 'Perro perdido en el parque', 'Se busca un perro perdido en el parque central.', 1, 'Por favor, ayuden a encontrarlo.', CURRENT_TIMESTAMP, 1, 'activa'),
(2, 1, 'Adopción de gato', 'Gato en adopción, necesita un hogar cariñoso.', 2, 'Interesados, contactar por este medio.', CURRENT_TIMESTAMP, 2, 'activa'),
(3, 1, 'Donación de alimentos', 'Se solicitan donaciones de alimentos para el refugio.', 3, 'Gracias por su apoyo.', CURRENT_TIMESTAMP, 3, 'activa'),
(4, 1, 'Evento benéfico', 'Evento de recaudación de fondos para mascotas.', 4, 'Participa y ayuda a una buena causa.', CURRENT_TIMESTAMP, 2, 'activa');