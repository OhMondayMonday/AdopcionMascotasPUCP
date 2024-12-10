CREATE DATABASE IF NOT EXISTS IWEB_DB ;
USE IWEB_DB;

DROP TABLE IF EXISTS sesiones_usuarios;
DROP TABLE IF EXISTS logs;
DROP TABLE IF EXISTS denuncias_maltrato_animal;
DROP TABLE IF EXISTS hogares_temporales;
DROP TABLE IF EXISTS inscripciones_eventos;
DROP TABLE IF EXISTS eventos;
DROP TABLE IF EXISTS tipos_eventos;
DROP TABLE IF EXISTS lugares_eventos;
DROP TABLE IF EXISTS solicitudes;
DROP TABLE IF EXISTS tipos_solicitudes;
DROP TABLE IF EXISTS publicaciones_adopcion;
DROP TABLE IF EXISTS publicaciones_mascota_perdida;
DROP TABLE IF EXISTS publicaciones_donaciones;
DROP TABLE IF EXISTS publicaciones;
DROP TABLE IF EXISTS tipos_publicaciones;
DROP TABLE IF EXISTS mascotas;
DROP TABLE IF EXISTS razas;
DROP TABLE IF EXISTS tipos_donaciones;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS fotos;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS distritos;
DROP TABLE IF EXISTS comentarios;
DROP TABLE IF EXISTS zonas;

-- zonas
CREATE TABLE zonas (
                       zona_id INT AUTO_INCREMENT PRIMARY KEY,
                       nombre_zona VARCHAR(12) NOT NULL
);
-- Tabla de distritos
CREATE TABLE distritos (
                           distrito_id INT AUTO_INCREMENT PRIMARY KEY,
                           nombre_distrito VARCHAR(100) NOT NULL UNIQUE,
                           zona_distrito_id INT NOT NULL,
                           FOREIGN KEY (zona_distrito_id) REFERENCES zonas(zona_id) ON DELETE CASCADE
);

-- Tabla de roles
CREATE TABLE roles(
                      rol_id INT AUTO_INCREMENT PRIMARY KEY,
                      nombre_rol VARCHAR(50) UNIQUE NOT NULL
);


-- Tabla de fotos
CREATE TABLE fotos (
                       foto_id INT AUTO_INCREMENT PRIMARY KEY,
                       url_foto VARCHAR(255) NOT NULL,
                       fecha_subida TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de usuarios (incluye usuarios finales, albergues, coordinadores y administrador)
CREATE TABLE usuarios (
                          user_id INT AUTO_INCREMENT PRIMARY KEY,
                          username VARCHAR(50) UNIQUE NOT NULL,
                          contrasenia VARCHAR(255) NOT NULL,
                          nombre VARCHAR(100),
                          apellido VARCHAR(100),
                          email VARCHAR(100) UNIQUE,
                          DNI VARCHAR(8) UNIQUE,
                          descripcion TEXT,
                          direccion VARCHAR(255),
                          foto_id INT,
                          distrito_id INT,
                          estado_cuenta ENUM('pendiente', 'rechazada', 'activa', 'baneada', 'eliminada') DEFAULT 'pendiente',
                          rol_id INT NOT NULL,
                          fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- datos albergue
                          nombre_albergue VARCHAR(150),
                          capacidad_nuevos_animales INT,
                          animales_albergados INT,
                          anio_creacion YEAR,
                          url_facebook VARCHAR(255),
                          url_instagram VARCHAR(255),
                          punto_acopio VARCHAR(255),
                          direccion_donaciones VARCHAR(255),
                          nombre_contacto_donaciones VARCHAR (50),
                          numero_contacto_donaciones VARCHAR (12),
                          numero_yape_plin VARCHAR (12),
                          codigo_qr BLOB,
    -- datos especiales para coordinador
                          zona_id INT,
                          fecha_nacimiento DATE,
                          fecha_contratacion DATE,
                          FOREIGN KEY (foto_id) REFERENCES fotos(foto_id) ON DELETE CASCADE,
                          FOREIGN KEY (zona_id) REFERENCES zonas(zona_id) ON DELETE CASCADE,
                          FOREIGN KEY (rol_id) REFERENCES roles(rol_id) ON DELETE CASCADE,
                          FOREIGN KEY (distrito_id) REFERENCES distritos(distrito_id) ON DELETE CASCADE
);

CREATE TABLE razas (
                       raza_id INT AUTO_INCREMENT PRIMARY KEY,
                       nombre_raza VARCHAR(100) NOT NULL,
                       tipo_animal VARCHAR(50) NOT NULL
);

-- Tabla de mascotas
CREATE TABLE mascotas (
                          mascota_id INT AUTO_INCREMENT PRIMARY KEY,
                          nombre VARCHAR(100) NOT NULL,
                          raza_id INT NOT NULL,
                          descripcion TEXT NOT NULL,
                          foto_id INT NOT NULL,
                          edad_aproximada INT,
                          genero ENUM('macho', 'hembra') NOT NULL,
                          tamanio ENUM('pequeño', 'mediano', 'grande', 'gigante') NOT NULL,
                          distintivo VARCHAR(255),
                          en_hogar_temporal BOOLEAN DEFAULT FALSE,
                          FOREIGN KEY (foto_id) REFERENCES fotos(foto_id) ON DELETE CASCADE,
                          FOREIGN KEY (raza_id) REFERENCES razas(raza_id) ON DELETE CASCADE
);

CREATE TABLE comentarios (
    comentario_id INT AUTO_INCREMENT PRIMARY KEY,
    publicacion_id INT NOT NULL, -- ID de la publicación a la que pertenece el comentario
    usuario_id INT NOT NULL, -- ID del usuario (coordinador o usuario final) que hizo el comentario
    comentario TEXT NOT NULL, -- Contenido del comentario
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha y hora del comentario
    FOREIGN KEY (publicacion_id) REFERENCES publicaciones(publicacion_id) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(user_id) ON DELETE CASCADE
);

-- Tabla de tipos de publicaciones
CREATE TABLE tipos_publicaciones (
                                     tipo_publicacion_id INT AUTO_INCREMENT PRIMARY KEY,
                                     tipo_publicacion VARCHAR(50) NOT NULL
);

-- Tabla principal de publicaciones
CREATE TABLE publicaciones (
                               publicacion_id INT AUTO_INCREMENT PRIMARY KEY,
                               user_id INT NOT NULL,
                               titulo VARCHAR(150) NOT NULL,
                               descripcion TEXT NOT NULL,
                               foto_id INT NOT NULL,
                               comentario TEXT,
                               fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                               tipo_publicacion_id INT NOT NULL,
                               estado_publicacion ENUM('pendiente', 'activa', 'rechazada', 'baneada', 'eliminada') DEFAULT 'pendiente',
                               FOREIGN KEY (foto_id) REFERENCES fotos(foto_id) ON DELETE CASCADE,
                               FOREIGN KEY (user_id) REFERENCES usuarios(user_id) ON DELETE CASCADE,
                               FOREIGN KEY (tipo_publicacion_id) REFERENCES tipos_publicaciones(tipo_publicacion_id) ON DELETE CASCADE
);

-- Tabla de publicaciones de adopción
CREATE TABLE publicaciones_adopcion (
                                        publicacion_id INT PRIMARY KEY,
                                        mascota_id INT NOT NULL,
                                        lugar_encontrado VARCHAR(255) NOT NULL,
                                        condiciones_adopcion TEXT,
                                        FOREIGN KEY (publicacion_id) REFERENCES publicaciones(publicacion_id) ON DELETE CASCADE,
                                        FOREIGN KEY (mascota_id) REFERENCES mascotas(mascota_id) ON DELETE CASCADE
);

-- Tabla de publicaciones de mascota perdida
CREATE TABLE publicaciones_mascota_perdida (
                                               publicacion_id INT PRIMARY KEY,
                                               mascota_id INT NOT NULL,
                                               lugar_perdida VARCHAR(255) NOT NULL,
                                               fecha_perdida DATE NOT NULL,
                                               descripcion_adicional TEXT,
                                               mascota_encontrada BOOLEAN DEFAULT FALSE,
                                               FOREIGN KEY (publicacion_id) REFERENCES publicaciones(publicacion_id) ON DELETE CASCADE,
                                               FOREIGN KEY (mascota_id) REFERENCES mascotas(mascota_id) ON DELETE CASCADE
);

-- Tabla de tipos de donaciones
CREATE TABLE tipos_donaciones (
                                  tipo_donacion_id INT AUTO_INCREMENT PRIMARY KEY,
                                  tipo_donacion VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE publicaciones_donaciones (
                                          publicacion_id INT PRIMARY KEY,
                                          punto_acopio VARCHAR(255) NOT NULL,
                                          tipo_donacion_id INT NOT NULL,
                                          cantidad DECIMAL(10, 2) NOT NULL,
                                          marca VARCHAR(100),
                                          fecha_recepcion_inicio DATE NOT NULL,
                                          fecha_recepcion_fin DATE NOT NULL,
                                          hora_recepcion TIME NOT NULL,
                                          telefono_contacto VARCHAR(20) NOT NULL,
                                          nombre_contacto VARCHAR(100) NOT NULL,
                                          motivo_donacion TEXT,
                                          FOREIGN KEY (publicacion_id) REFERENCES publicaciones(publicacion_id) ON DELETE CASCADE,
                                          FOREIGN KEY (tipo_donacion_id) REFERENCES tipos_donaciones(tipo_donacion_id) ON DELETE CASCADE
);

-- Tabla de tipos de solicitudes
CREATE TABLE tipos_solicitudes (
                                   tipo_solicitud_id INT AUTO_INCREMENT PRIMARY KEY,
                                   tipo_solicitud VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla de solicitudes
CREATE TABLE solicitudes (
                             solicitud_id INT AUTO_INCREMENT PRIMARY KEY,
                             tipo_solicitud_id INT NOT NULL,
                             solicitante_id INT NOT NULL,
                             solicitado_id INT, -- puede ser una solicitud directa o, si es creación de cuenta, puede ir en NULL
    -- datos para solicitud de cuenta
                             nombre_albergue VARCHAR (255),
                             nombre_encargado VARCHAR (50),
                             apellido_encargado VARCHAR (50),
                             email VARCHAR (100),
    -- solicitud de temporal o donacion
                             fecha_solicitud TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                             estado_solicitud ENUM('pendiente', 'aprobada', 'rechazada', 'eliminada') DEFAULT 'pendiente',
                             comentario_solicitud TEXT,
                             mascota_id INT, -- en caso sea una solicitud de temporal
                             cantidad DECIMAL(10, 2),
                             fecha_entrega DATE,
                             punto_entrega_seleccionado VARCHAR(255),
                             dinero_donado DECIMAL (10,2),
                             FOREIGN KEY (solicitante_id) REFERENCES usuarios(user_id) ON DELETE CASCADE,
                             FOREIGN KEY (solicitado_id) REFERENCES usuarios(user_id) ON DELETE CASCADE,
                             FOREIGN KEY (mascota_id) REFERENCES mascotas(mascota_id) ON DELETE CASCADE,
                             FOREIGN KEY (tipo_solicitud_id) REFERENCES tipos_solicitudes(tipo_solicitud_id) ON DELETE CASCADE
);

-- Tabla de tipos de eventos
CREATE TABLE tipos_eventos (
                               tipo_id INT AUTO_INCREMENT PRIMARY KEY,
                               nombre_tipo VARCHAR(50) NOT NULL UNIQUE
);

-- Tabla de lugares de eventos
CREATE TABLE lugares_eventos (
                                 lugar_id INT AUTO_INCREMENT PRIMARY KEY,
                                 distrito_id INT NOT NULL,
                                 nombre_lugar VARCHAR(150) NOT NULL,
                                 foto_id INT NOT NULL,
                                 aforo_maximo INT NOT NULL,
                                 direccion_lugar VARCHAR(200) NOT NULL,
                                 activo BOOLEAN NOT NULL,
                                 FOREIGN KEY (foto_id) REFERENCES fotos(foto_id) ON DELETE CASCADE,
                                 FOREIGN KEY (distrito_id) REFERENCES distritos(distrito_id) ON DELETE CASCADE
);

-- Tabla de eventos
CREATE TABLE eventos (
                         event_id INT AUTO_INCREMENT PRIMARY KEY,
                         user_id INT NOT NULL,
                         tipo_evento_id INT NOT NULL, -- Tipo evento
                         nombre_evento VARCHAR(150),
                         fecha_evento DATE NOT NULL,
                         hora_evento TIME NOT NULL,
                         fecha_fin DATE NOT NULL,
                         hora_fin TIME NOT NULL,
                         foto_id INT NOT NULL,
                         lugar_evento_id INT,
                         entrada VARCHAR(255),
                         descripcion_evento TEXT,
                         artistas_proveedores VARCHAR(255),
                         razon_evento TEXT,
                         fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         estado_evento ENUM('activa', 'baneada', 'eliminada') DEFAULT 'activa',
                         FOREIGN KEY (foto_id) REFERENCES fotos(foto_id) ON DELETE CASCADE,
                         FOREIGN KEY (user_id) REFERENCES usuarios(user_id) ON DELETE CASCADE,
                         FOREIGN KEY (lugar_evento_id) REFERENCES lugares_eventos(lugar_id) ON DELETE CASCADE,
                         FOREIGN KEY (tipo_evento_id) REFERENCES tipos_eventos(tipo_id) ON DELETE CASCADE
);

-- Tabla de inscripciones a eventos
CREATE TABLE inscripciones_eventos (
                                       inscripcion_id INT AUTO_INCREMENT PRIMARY KEY,
                                       event_id INT NOT NULL,
                                       user_id INT NOT NULL,
                                       fecha_inscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                       activa BOOLEAN NOT NULL DEFAULT TRUE,
                                       FOREIGN KEY (event_id) REFERENCES eventos(event_id) ON DELETE CASCADE,
                                       FOREIGN KEY (user_id) REFERENCES usuarios(user_id) ON DELETE CASCADE
);


-- Tabla de hogares temporales
CREATE TABLE hogares_temporales (
                                    temporal_id INT AUTO_INCREMENT PRIMARY KEY,
                                    user_id INT,
                                    foto_id INT NOT NULL,
                                    edad INT NOT NULL,
                                    genero ENUM('masculino', 'femenino', 'otro') NOT NULL,
                                    celular VARCHAR(20) NOT NULL,
                                    direccion VARCHAR(255) NOT NULL,
                                    distrito VARCHAR(100) NOT NULL,
                                    cantidad_cuartos INT NOT NULL,
                                    metraje_vivienda DECIMAL(5,2) NOT NULL,
                                    tiene_mascotas BOOLEAN NOT NULL,
                                    cantidad_mascotas INT,
                                    tipo_mascotas VARCHAR(100),
                                    tiene_hijos BOOLEAN NOT NULL,
                                    vive_solo BOOLEAN NOT NULL,
                                    trabaja ENUM('remoto', 'presencial', 'no trabaja') NOT NULL,
                                    persona_referencia VARCHAR(100),
                                    contacto_referencia VARCHAR(20),
                                    tiempo_temporal INT NOT NULL,
                                    rango_fecha_inicio DATE NOT NULL,
                                    rango_fecha_fin DATE NOT NULL,
                                    estado_temporal ENUM('pendiente', 'activa', 'rechazada', 'baneada', 'eliminada') DEFAULT 'pendiente',
                                    fecha_aprobacion TIMESTAMP,
                                    FOREIGN KEY (foto_id) REFERENCES fotos(foto_id) ON DELETE CASCADE,
                                    FOREIGN KEY (user_id) REFERENCES usuarios(user_id) ON DELETE CASCADE
);

-- Tabla de denuncias de maltrato animal
CREATE TABLE denuncias_maltrato_animal (
                                           report_id INT AUTO_INCREMENT PRIMARY KEY,
                                           user_id INT,
                                           descripcion TEXT,
                                           foto_id INT,
                                           tipo_maltrato VARCHAR(100) NOT NULL,
                                           nombre_maltratador VARCHAR(100),
                                           direccion_maltrato VARCHAR(255) NOT NULL,
                                           tamanio ENUM('pequeño', 'mediano', 'grande', 'gigante'),
                                           animal VARCHAR(50) NOT NULL,
                                           tipo_raza VARCHAR(100),
                                           denuncia_policial BOOLEAN DEFAULT FALSE,
                                           fecha_denuncia TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                           FOREIGN KEY (foto_id) REFERENCES fotos(foto_id) ON DELETE CASCADE,
                                           FOREIGN KEY (user_id) REFERENCES usuarios(user_id) ON DELETE CASCADE
);
-- Tabla de sesiones de usuario para registrar el tiempo empleado
CREATE TABLE sesiones_usuarios (
                                   sesion_id INT AUTO_INCREMENT PRIMARY KEY,
                                   user_id INT NOT NULL,
                                   inicio_sesion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                   fin_sesion DATETIME,
                                   duracion_sesion INT, -- Duración de la sesión en segundos o minutos
                                   FOREIGN KEY (user_id) REFERENCES usuarios(user_id) ON DELETE CASCADE
);



-- Tabla de logs
CREATE TABLE logs (
                      log_id INT AUTO_INCREMENT PRIMARY KEY,
                      descripcion TEXT NOT NULL,
                      fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                      user_id INT,
                      FOREIGN KEY (user_id) REFERENCES usuarios(user_id) ON DELETE SET NULL
);

DELIMITER $$

-- Trigger para inserciones en la tabla de eventos
CREATE TRIGGER log_insert_eventos
    AFTER INSERT ON eventos
    FOR EACH ROW
BEGIN
    INSERT INTO logs (descripcion, fecha, user_id)
    VALUES (
               CONCAT('Evento creado: ', NEW.nombre_evento),
               NOW(),
               NEW.user_id
           );
END$$

-- Trigger para actualizaciones en la tabla de eventos
CREATE TRIGGER log_update_eventos
    AFTER UPDATE ON eventos
    FOR EACH ROW
BEGIN
    INSERT INTO logs (descripcion, fecha, user_id)
    VALUES (
               CONCAT('Evento actualizado: ', NEW.nombre_evento),
               NOW(),
               NEW.user_id
           );
END$$

-- Trigger para inserciones en la tabla de publicaciones
CREATE TRIGGER log_insert_publicaciones
    AFTER INSERT ON publicaciones
    FOR EACH ROW
BEGIN
    INSERT INTO logs (descripcion, fecha, user_id)
    VALUES (
               CONCAT('Publicación creada: ', NEW.titulo),
               NOW(),
               NEW.user_id
           );
END$$

-- Trigger para actualizaciones en la tabla de publicaciones
CREATE TRIGGER log_update_publicaciones
    AFTER UPDATE ON publicaciones
    FOR EACH ROW
BEGIN
    INSERT INTO logs (descripcion, fecha, user_id)
    VALUES (
               CONCAT('Publicación actualizada: ', NEW.titulo),
               NOW(),
               NEW.user_id
           );
END$$

-- Trigger para inserciones en la tabla de denuncias de maltrato animal
CREATE TRIGGER log_insert_denuncias
    AFTER INSERT ON denuncias_maltrato_animal
    FOR EACH ROW
BEGIN
    INSERT INTO logs (descripcion, fecha, user_id)
    VALUES (
               CONCAT('Denuncia creada: ', NEW.descripcion),
               NOW(),
               NEW.user_id
           );
END$$

-- Trigger para actualizaciones en la tabla de denuncias de maltrato animal
CREATE TRIGGER log_update_denuncias
    AFTER UPDATE ON denuncias_maltrato_animal
    FOR EACH ROW
BEGIN
    INSERT INTO logs (descripcion, fecha, user_id)
    VALUES (
               CONCAT('Denuncia actualizada: ', NEW.descripcion),
               NOW(),
               NEW.user_id
           );
END$$

-- Trigger para inserciones en la tabla de hogares temporales
CREATE TRIGGER log_insert_hogares_temporales
    AFTER INSERT ON hogares_temporales
    FOR EACH ROW
BEGIN
    INSERT INTO logs (descripcion, fecha, user_id)
    VALUES (
               'Hogar temporal creado',
               NOW(),
               NEW.user_id
           );
END$$

-- Trigger para actualizaciones en la tabla de hogares temporales
CREATE TRIGGER log_update_hogares_temporales
    AFTER UPDATE ON hogares_temporales
    FOR EACH ROW
BEGIN
    INSERT INTO logs (descripcion, fecha, user_id)
    VALUES (
               'Hogar temporal actualizado',
               NOW(),
               NEW.user_id
           );
END$$

DELIMITER ;