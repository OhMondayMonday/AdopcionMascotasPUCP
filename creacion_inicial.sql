use iweb;
INSERT INTO zonas (nombre_zona) VALUES 
('norte'),
('sur'),
('este'),
('oeste');

-- Insertar distritos para la zona norte
INSERT INTO distritos (nombre_distrito, zona_distrito_id) VALUES
('Ancon', 1),
('Santa Rosa', 1),
('Carabayllo', 1),
('Puente Piedra', 1),
('Comas', 1),
('Los Olivos', 1),
('San Martín de Porres', 1),
('Independencia', 1);

-- Insertar distritos para la zona sur
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

-- Insertar distritos para la zona este
INSERT INTO distritos (nombre_distrito, zona_distrito_id) VALUES
('San Juan de Lurigancho', 3),
('Lurigancho/Chosica', 3),
('Ate', 3),
('El Agustino', 3),
('Santa Anita', 3),
('La Molina', 3),
('Cieneguilla', 3);

-- Insertar distritos para la zona oeste
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
('San Miguel', 4),
('Surquillo', 4),
('San Borja', 4),
('Santiago de Surco', 4),
('Barranco', 4),
('Chorrillos', 4),
('San Luis', 4),
('Miraflores', 4);

INSERT INTO roles (nombre_rol) VALUES
('Usuario Final'),
('Albergue'),
('Coordinador Zonal'),
('Administrador');


INSERT INTO tipos_publicaciones (tipo_publicacion) VALUES
('adopcion'),
('donaciones'),
('mascota_perdida');

INSERT INTO tipos_donaciones (tipo_donacion) VALUES
('activo'),
('dinero');

INSERT INTO tipos_solicitudes (tipo_solicitud) VALUES
('temporal'),
('creacion'),
('donacion_activo'),
('donacion_dinero');

INSERT INTO razas (nombre_raza, tipo_animal) VALUES 
('Labrador Retriever', 'perro'),
('Golden Retriever', 'perro'),
('Bulldog Francés', 'perro'),
('Beagle', 'perro'),
('Poodle', 'perro'),
('Gato Persa', 'gato'),
('Gato Maine Coon', 'gato'),
('Gato Siamés', 'gato'),
('Rottweiler', 'perro'),
('Dachshund', 'perro'),
('Gato Bengalí', 'gato'),
('Cocker Spaniel', 'perro'),
('Schnauzer', 'perro'),
('Chihuahua', 'perro'),
('Akita', 'perro'),
('Gato Sphynx', 'gato'),
('Hámster Sirio', 'hámster'),
('Loro Amazona', 'loro'),
('Conejo Holland Lop', 'conejo'),
('Cobayo', 'cobayo'),
('Shih Tzu', 'perro'),
('Border Collie', 'perro'),
('Pug', 'perro'),
('Bichón Frisé', 'perro'),
('Terrier Escocés', 'perro'),
('Basenji', 'perro'),
('Salchicha', 'perro'),
('Yorkshire Terrier', 'perro'),
('Bull Terrier', 'perro'),
('Cavalier King Charles Spaniel', 'perro'),
('Chow Chow', 'perro'),
('Rottweiler', 'perro'),
('Gran Danés', 'perro'),
('Cocker Americano', 'perro'),
('Samoyedo', 'perro'),
('Cavalier King Charles', 'perro'),
('Gato Abisinio', 'gato'),
('Gato Burmese', 'gato'),
('Gato Ragdoll', 'gato'),
('Gato Scottish Fold', 'gato'),
('Schnauzer Gigante', 'perro'),
('Terrier de Boston', 'perro'),
('Mastín Inglés', 'perro'),
('Gato Devon Rex', 'gato'),
('Gato Noruego de Bosque', 'gato'),
('Gato Himalayo', 'gato'),
('Loro Gris Africano', 'loro'),
('Canario', 'ave'),
('Periquito', 'ave'),
('Gato de Bengala', 'gato'),
('Terrier de Airedale', 'perro'),
('Perro de Agua Español', 'perro'),
('Perro de Montaña de los Pirineos', 'perro'),
('Cocker Spaniel Inglés', 'perro'),
('Papillon', 'perro'),
('Gato Manx', 'gato'),
('Gato British Shorthair', 'gato'),
('Schnauzer Mediano', 'perro');




