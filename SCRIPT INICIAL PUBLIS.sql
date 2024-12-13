INSERT INTO usuarios(username, contrasenia, nombre, apellido, email, DNI, estado_cuenta, rol_id) VALUES ("sebas", "1234", "Sebastian", "Ramirez", "sebas@pucp.com", 72519702, "activa", 1);

INSERT INTO fotos(url_foto, fecha_subida) values ("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJ7xc7Q5j6x-Vy9l7fNSlp6VaSrKKEfglO8A&s", current_timestamp());
INSERT INTO fotos(url_foto) values ("https://static.vecteezy.com/system/resources/previews/023/928/152/non_2x/cat-sad-lonely-abandoned-under-the-rain-illustration-generative-ai-photo.jpg");

INSERT INTO publicaciones (publicacion_id, user_id, titulo, descripcion, foto_id, comentario, tipo_publicacion_id, estado_publicacion) VALUES (1, 1, "Adopta a Pablo", "Por favor", 1, "JEJE", 1, "activa");
INSERT INTO publicaciones (publicacion_id, user_id, titulo, descripcion, foto_id, comentario, tipo_publicacion_id, estado_publicacion) VALUES (2, 1, "Ayuda para Max", "Max necesita ayuda médica", 1, "Gracias", 2, "activa");
INSERT INTO publicaciones (publicacion_id, user_id, titulo, descripcion, foto_id, comentario, tipo_publicacion_id, estado_publicacion) VALUES (3, 1, "Dona para Lolo", "Lolo requiere alimentos", 1, "Agradecido", 3, "activa");
INSERT INTO publicaciones (publicacion_id, user_id, titulo, descripcion, foto_id, comentario, tipo_publicacion_id, estado_publicacion) VALUES (4, 1, "Nuevo hogar para Luna", "Buscamos hogar temporal", 1, "Esperanzado", 4, "activa");
INSERT INTO publicaciones (publicacion_id, user_id, titulo, descripcion, foto_id, comentario, tipo_publicacion_id, estado_publicacion) VALUES (5, 1, "Adopta a Rocky", "Busca hogar", 1, "Suerte", 1, "activa");
INSERT INTO publicaciones (publicacion_id, user_id, titulo, descripcion, foto_id, comentario, tipo_publicacion_id, estado_publicacion) VALUES (6, 1, "Ayuda para Nala", "Nala necesita tratamiento", 1, "Aporte", 2, "activa");
INSERT INTO publicaciones (publicacion_id, user_id, titulo, descripcion, foto_id, comentario, tipo_publicacion_id, estado_publicacion) VALUES (7, 1, "Alimento para Tobi", "Campaña de donación de alimento", 1, "Gracias", 3, "activa");
INSERT INTO publicaciones (publicacion_id, user_id, titulo, descripcion, foto_id, comentario, tipo_publicacion_id, estado_publicacion) VALUES (8, 1, "Casa para Kira", "Kira necesita una familia", 1, "Amoroso", 4, "activa");
INSERT INTO publicaciones (publicacion_id, user_id, titulo, descripcion, foto_id, comentario, tipo_publicacion_id, estado_publicacion) VALUES (9, 1, "Rescata a Bruno", "Bruno fue abandonado", 1, "Ayuda urgente", 1, "activa");
INSERT INTO publicaciones (publicacion_id, user_id, titulo, descripcion, foto_id, comentario, tipo_publicacion_id, estado_publicacion) VALUES (10, 1, "Salud para Coco", "Coco está enfermo", 1, "Colabora", 2, "activa");
INSERT INTO publicaciones (publicacion_id, user_id, titulo, descripcion, foto_id, comentario, tipo_publicacion_id, estado_publicacion) VALUES (11, 1, "Donación para Leo", "Campaña de alimentos", 1, "Gracias", 3, "activa");
INSERT INTO publicaciones (publicacion_id, user_id, titulo, descripcion, foto_id, comentario, tipo_publicacion_id, estado_publicacion) VALUES (12, 1, "Adopta a Chispa", "Busca hogar", 1, "En espera", 4, "activa");
INSERT INTO publicaciones (publicacion_id, user_id, titulo, descripcion, foto_id, comentario, tipo_publicacion_id, estado_publicacion) VALUES (13, 1, "Refugio para Pelusa", "Hogar temporal", 1, "Con fe", 1, "activa");
INSERT INTO publicaciones (publicacion_id, user_id, titulo, descripcion, foto_id, comentario, tipo_publicacion_id, estado_publicacion) VALUES (14, 1, "Ayuda para Canela", "Canela necesita cirugía", 1, "Gracias", 2, "activa");
INSERT INTO publicaciones (publicacion_id, user_id, titulo, descripcion, foto_id, comentario, tipo_publicacion_id, estado_publicacion) VALUES (15, 1, "Alimento para Roco", "Campaña de alimento", 1, "Colabora", 3, "activa");
INSERT INTO publicaciones (publicacion_id, user_id, titulo, descripcion, foto_id, comentario, tipo_publicacion_id, estado_publicacion) VALUES (16, 1, "Hogar para Pacho", "Adopta a Pacho", 1, "Cariñoso", 4, "activa");
INSERT INTO publicaciones (publicacion_id, user_id, titulo, descripcion, foto_id, comentario, tipo_publicacion_id, estado_publicacion) VALUES (17, 1, "Adopta a Mia", "Necesita una familia", 1, "Esperanza", 1, "activa");
INSERT INTO publicaciones (publicacion_id, user_id, titulo, descripcion, foto_id, comentario, tipo_publicacion_id, estado_publicacion) VALUES (18, 1, "Salud para Fido", "Tratamiento especial", 1, "Agradecido", 2, "activa");
INSERT INTO publicaciones (publicacion_id, user_id, titulo, descripcion, foto_id, comentario, tipo_publicacion_id, estado_publicacion) VALUES (19, 1, "Donación para Nube", "Necesita comida", 1, "Mil gracias", 3, "activa");
INSERT INTO publicaciones (publicacion_id, user_id, titulo, descripcion, foto_id, comentario, tipo_publicacion_id, estado_publicacion) VALUES (20, 1, "Familia para Toby", "Toby busca amor", 1, "Confiamos", 4, "activa");
INSERT INTO publicaciones (publicacion_id, user_id, titulo, descripcion, foto_id, comentario, tipo_publicacion_id, estado_publicacion) VALUES (23, 1, "Ayuda para Kero", "Han golpeado al pobre Kero", 2, "Confiamos", 5, "activa");

INSERT INTO mascotas (mascota_id, nombre, raza_id, descripcion, foto_id, edad_aproximada, genero, tamanio) values (1, "Max", 4, "Maxcito", 1, 8, "macho", "pequeño");
INSERT INTO mascotas (mascota_id, nombre, raza_id, descripcion, foto_id, edad_aproximada, genero, tamanio) values (2, "Luna", 13, "Luna lunita", 1, 2, "hembra", "mediano");
INSERT INTO mascotas (mascota_id, nombre, raza_id, descripcion, foto_id, edad_aproximada, genero, tamanio) values (3, "Kira", 14, "Kira Queen", 1, 99, "macho", "grande");
INSERT INTO mascotas (mascota_id, nombre, raza_id, descripcion, foto_id, edad_aproximada, genero, tamanio) values (4, "Kero", 56, "Kerito Lindo", 2, 4, "macho", "mediano");

INSERT INTO publicaciones_adopcion (publicacion_id, mascota_id, lugar_encontrado, condiciones_adopcion) values (2, 1, "Parque PUCP", "Nada");

INSERT INTO publicaciones_donaciones (publicacion_id, punto_acopio, tipo_donacion_id, cantidad, marca, fecha_recepcion_inicio, fecha_recepcion_fin, hora_recepcion, telefono_contacto, nombre_contacto, motivo_donacion) values (3, "En la cato", 2, 200, null, "2024-01-12", "2024-01-20", "12:30:00", 111222333, "Sebas", "Pq quiero");
INSERT INTO publicaciones_donaciones (publicacion_id, punto_acopio, tipo_donacion_id, cantidad, marca, fecha_recepcion_inicio, fecha_recepcion_fin, hora_recepcion, telefono_contacto, nombre_contacto, motivo_donacion) values (7, "En el parque", 1, 0, "Ricocan", "2024-02-12", "2024-02-20", "13:00:00", 999888777, "YONI", null);

INSERT INTO publicaciones_mascota_perdida (publicacion_id, mascota_id, lugar_perdida, fecha_perdida, descripcion_adicional, telefono_contacto, nombre_contacto, recompensa, mascota_encontrada) values (4, 2, "Por mi casa", "2024-01-24","Nop", 999111222 ,"Sebitas", null, true);
INSERT INTO publicaciones_mascota_perdida (publicacion_id, mascota_id, lugar_perdida, fecha_perdida, descripcion_adicional, telefono_contacto, nombre_contacto, recompensa, mascota_encontrada) values (8, 3, "Por HAY", "2024-02-20", "Nd", 111222333, "DUKE", "120 soles", false);

INSERT INTO denuncias_maltrato_animal (publicacion_id, user_id, tipo_maltrato, nombre_maltratador, direccion_maltrato, mascota_id, denuncia_policial) values (23, 1, "Pegalon", "Pepe Bomba", "Av. Brasil 111", 4, false);