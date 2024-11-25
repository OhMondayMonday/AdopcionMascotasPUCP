INSERT INTO usuarios (
    username,
    contrasenia,
    nombre,
    apellido,
    email,
    DNI,
    descripcion,
    direccion,
    distrito_id,
    estado_cuenta,
    rol_id,
    fecha_registro,
    fecha_nacimiento
) VALUES (
             'usuariofinal1',
             'contrasenia',
             'Juan',
             'Pérez',
             'juan.perez@gmail.com',
             '12345678',
             'Usuario regular del sistema. Esta es una prueba de descripción de usuario',
             'Av. Universitaria 123',
             1, -- ID del distrito en la tabla distritos
             'activa',
             1, -- ID del rol para usuario final
             CURRENT_TIMESTAMP,
             '1990-05-20'
         );

INSERT INTO usuarios (
    username,
    contrasenia,
    nombre,
    apellido,
    email,
    DNI,
    descripcion,
    direccion,
    distrito_id,
    estado_cuenta,
    rol_id,
    fecha_registro,
    fecha_nacimiento
) VALUES
-- Usuario 2
('usuario2',
 'contrasenia123',
 'Laura',
 'González',
 'laura.gonzalez@example.com',
 '87654322',
 'Usuaria final interesada en ser hogar temporal.',
 'Av. Los Pinos 456',
 4, -- ID de distrito en la tabla distritos
 'activa',
 1, -- ID del rol para usuario final
 CURRENT_TIMESTAMP,
 '1992-03-15'),

-- Usuario 3
('usuario3',
 'contrasenia123',
 'Carlos',
 'Martínez',
 'carlos.martinez@example.com',
 '87654323',
 'Usuario final con interés en el programa de hogar temporal.',
 'Calle Las Palmas 789',
 5,
 'activa',
 1,
 CURRENT_TIMESTAMP,
 '1988-06-22');

INSERT INTO zonas (nombre_zona) VALUES
                                    ('Norte'),
                                    ('Sur'),
                                    ('Este'),
                                    ('Oeste');


-- Zona Norte (zona_id = 1)
INSERT INTO distritos (nombre_distrito, zona_distrito_id) VALUES
                                                              ('Ancon', 1),
                                                              ('Santa Rosa', 1),
                                                              ('Carabayllo', 1),
                                                              ('Puente Piedra', 1),
                                                              ('Comas', 1),
                                                              ('Los Olivos', 1),
                                                              ('San Martín de Porres', 1),
                                                              ('Independencia', 1);

-- Zona Sur (zona_id = 2)
INSERT INTO distritos (nombre_distrito, zona_distrito_id) VALUES
                                                              ('San Juan de Miraflores', 2),
                                                              ('Villa María del Triunfo', 2),
                                                              ('Villa el Salvador', 2),
                                                              ('Pachacamac', 2),
                                                              ('Lurin', 2),
                                                              ('Punta Hermosa', 2),
                                                              ('Punta Negra', 2),
                                                              ('San Bartolo', 2),
                                                              ('Santa María del Mar', 2),
                                                              ('Pucusana', 2);

-- Zona Este (zona_id = 3)
INSERT INTO distritos (nombre_distrito, zona_distrito_id) VALUES
                                                              ('San Juan de Lurigancho', 3),
                                                              ('Lurigancho/Chosica', 3),
                                                              ('Ate', 3),
                                                              ('El Agustino', 3),
                                                              ('Santa Anita', 3),
                                                              ('La Molina', 3),
                                                              ('Cieneguilla', 3);

-- Zona Oeste (zona_id = 4)
INSERT INTO distritos (nombre_distrito, zona_distrito_id) VALUES
                                                              ('Rimac', 4),
                                                              ('Cercado de Lima', 4),
                                                              ('Breña', 4),
                                                              ('Pueblo Libre', 4),
                                                              ('Magdalena', 4),
                                                              ('Jesus María', 4),
                                                              ('La Victoria', 4),
                                                              ('Lince', 4),
                                                              ('San Isidro', 4),
                                                              ('San Miguel', 4);

INSERT INTO roles (nombre_rol) VALUES
                                   ('usuario_final'),
                                   ('albergue'),
                                   ('coordinador'),
                                   ('admin');

INSERT INTO fotos (url_foto) VALUES
                                 ('https://example.com/fotos/foto1.jpg'),
                                 ('https://example.com/fotos/foto2.jpg'),
                                 ('https://example.com/fotos/foto3.jpg'),
                                 ('https://example.com/fotos/foto4.jpg'),
                                 ('https://example.com/fotos/foto5.jpg'),
                                 ('https://example.com/fotos/foto6.jpg'),
                                 ('https://example.com/fotos/foto7.jpg'),
                                 ('https://example.com/fotos/foto8.jpg');

INSERT INTO tipos_eventos (nombre_tipo) VALUES
                                            ('Ferias'),
                                            ('Campañas'),
                                            ('Concursos'),
                                            ('Adopcion');


INSERT INTO eventos (
    user_id,
    tipo_evento_id,
    nombre_evento,
    fecha_evento,
    hora_evento,
    fecha_fin,
    hora_fin,
    foto_id,
    lugar_evento_id,
    entrada,
    descripcion_evento,
    artistas_proveedores,
    razon_evento,
    estado_evento
) VALUES
-- Evento 1
(1,
 1,
 'Feria de Adopción 2024',
 '2024-11-21',
 '10:00:00',
 '2024-11-21',
 '17:00:00',
 1, -- ID de la foto de portada del evento
 1,
 'Entrada gratuita',
 'Un evento para promover la adopción de mascotas rescatadas, con charlas sobre tenencia responsable.',
 'Grupos de rescate y veterinarios locales',
 'Promover la adopción de mascotas en la comunidad',
 'activa'),

-- Evento 2
(1,
 2,
 'Taller de Cuidados Básicos para Mascotas',
 '2024-11-22',
 '09:00:00',
 '2024-11-22',
 '12:00:00',
 2, -- ID de la foto de portada del evento
 2, -- Asumiendo que este lugar de evento tiene lugar_evento_id = 1
 'Entrada con donación de alimento para mascotas',
 'Un taller educativo sobre el cuidado y necesidades básicas de mascotas.',
 'Veterinarios locales y cuidadores',
 'Fomentar el cuidado adecuado y el bienestar animal en la comunidad',
 'activa'),

-- Evento 3
(1,
 3,
 'Recolección de Donaciones para Albergues',
 '2024-11-23',
 '08:00:00',
 '2024-11-23',
 '18:00:00',
 3, -- ID de la foto de portada del evento
 3, -- Asumiendo que este lugar de evento tiene lugar_evento_id = 2
 'Donación de alimentos y suministros para la entrada',
 'Evento de recolección de alimentos y materiales para apoyar a los albergues de animales.',
 'Grupos de rescate, patrocinadores locales',
 'Recolectar suministros para los albergues que cuidan animales en situación de abandono',
 'activa');

INSERT INTO eventos (
    user_id,
    tipo_evento_id,
    nombre_evento,
    fecha_evento,
    hora_evento,
    fecha_fin,
    hora_fin,
    foto_id,
    lugar_evento_id,
    entrada,
    descripcion_evento,
    artistas_proveedores,
    razon_evento,
    estado_evento
) VALUES
-- Evento 4:
(1,
 4,
 'Jornada de Adopción en el Albergue',
 '2024-11-24',
 '10:00:00',
 '2024-11-24',
 '16:00:00',
 1, -- ID de la foto del evento
 1, -- ID del lugar de evento en la tabla lugares_eventos
 'Entrada gratuita',
 'Evento de adopción para encontrar hogares para nuestras mascotas.',
 'Voluntarios y veterinarios locales',
 'Promover la adopción de mascotas en el albergue',
 'activa'),

-- Evento 5: Recolección de Alimentos
(1,
 5,
 'Recolección de Alimentos para el Albergue',
 '2024-11-25',
 '09:00:00',
 '2024-11-25',
 '17:00:00',
 2, -- ID de la foto del evento
 2, -- ID del lugar de evento en la tabla lugares_eventos
 'Donación de alimento para la entrada',
 'Recolección de alimentos y suministros para el albergue.',
 'Patrocinadores locales y colaboradores',
 'Abastecer el albergue con alimentos para las mascotas rescatadas',
 'activa'),

-- Evento 6: Taller de Cuidado Responsable de Mascotas
(1,
 2,
 'Taller de Cuidado Responsable de Mascotas',
 '2024-11-26',
 '14:00:00',
 '2024-11-26',
 '17:00:00',
 3, -- ID de la foto del evento
 3, -- ID del lugar de evento en la tabla lugares_eventos
 'Entrada gratuita',
 'Un taller sobre el cuidado responsable y necesidades básicas de las mascotas.',
 'Veterinarios y cuidadores del albergue',
 'Educar a la comunidad sobre el cuidado adecuado de las mascotas',
 'activa');


INSERT INTO lugares_eventos (
    distrito_id,
    nombre_lugar,
    foto_id,
    aforo_maximo,
    direccion_lugar,
    activo
) VALUES
-- Lugar 1
(1, -- Distrito correspondiente
 'Parque Central Zona Norte',
 1, -- ID de la foto que representa el lugar
 500,
 'Av. Principal 123, Zona Norte',
 TRUE),

-- Lugar 2
(2,
 'Centro Comunitario Zona Este',
 2,
 300,
 'Calle Amistad 45, Zona Este',
 TRUE),

-- Lugar 3
(3,
 'Plaza Principal Zona Sur',
 3,
 700,
 'Jr. Libertad 78, Zona Sur',
 TRUE),

-- Lugar 4
(4,
 'Auditorio Municipal Zona Oeste',
 1,
 400,
 'Av. Independencia 456, Zona Oeste',
 TRUE);

-- DATOS PARA RAZAS
INSERT INTO razas (nombre_raza, tipo_animal) VALUES
                                                 ('Labrador Retriever', 'Perro'),
                                                 ('Bulldog', 'Perro'),
                                                 ('Pastor Alemán', 'Perro'),
                                                 ('Siames', 'Gato'),
                                                 ('Persa', 'Gato'),
                                                 ('Maine Coon', 'Gato');

-- DATOS PARA MASCOTAS
INSERT INTO mascotas (
    nombre,
    raza_id,
    descripcion,
    foto_id,
    edad_aproximada,
    genero,
    tamanio,
    distintivo,
    en_hogar_temporal
) VALUES
-- Mascota 1
('Max',
 1, -- Labrador Retriever
 'Perro activo y amigable que disfruta de la compañía de personas y otros animales.',
 1, -- ID de la foto en la tabla fotos
 3,
 'macho',
 'grande',
 'Tiene una mancha negra en la pata izquierda',
 FALSE),

-- Mascota 2
('Bella',
 4, -- Siames
 'Gata de temperamento tranquilo y juguetón, ideal para familias.',
 2, -- ID de la foto en la tabla fotos
 2,
 'hembra',
 'mediano',
 'Pequeña mancha blanca en la oreja derecha',
 TRUE),

-- Mascota 3
('Rocky',
 2, -- Bulldog
 'Perro de carácter tranquilo, ideal para apartamentos o espacios pequeños.',
 3, -- ID de la foto en la tabla fotos
 4,
 'macho',
 'mediano',
 'Collar azul con placa identificadora',
 FALSE),

-- Mascota 4
('Luna',
 6, -- Maine Coon
 'Gata de gran tamaño, pelaje abundante y personalidad cariñosa.',
 1, -- ID de la foto en la tabla fotos
 1,
 'hembra',
 'grande',
 'Tiene una cicatriz pequeña en la pata trasera',
 TRUE);
