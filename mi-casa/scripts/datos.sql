SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

-- seg_rol

INSERT INTO public.seg_rol VALUES ('ADMIN', 'hadmin', NOW(), NULL, NULL);
INSERT INTO public.seg_rol VALUES ('MATERIAL', 'hadmin', NOW(), NULL, NULL);
INSERT INTO public.seg_rol VALUES ('FINANCIAMIENTO', 'hadmin', NOW(), NULL, NULL);
INSERT INTO public.seg_rol VALUES ('ADMIN_TECNICO', 'hadmin', NOW(), NULL, NULL);
INSERT INTO public.seg_rol VALUES ('TECNICO', 'hadmin', NOW(), NULL, NULL);
INSERT INTO public.seg_rol VALUES ('USUARIO', 'hadmin', NOW(), NULL, NULL);


-- per_usuario
-- seg_rol_usuario

-- hadmin@erpuno.com
INSERT INTO public.per_usuario (correo, clave, activo, nombres, id_usuario, avatar, fecha_nac, sexo, telefonos, direccion_fisica, facebook, twitter, whatsapp, usuario_reg, fecha_reg, usuario_mod, fecha_mod, codigo_activacion) 
VALUES ('hadmin@erpuno.com', '$2a$10$PPbgr/ONViv5xM.jXp6AGu/RjpVkw.uy5QIfJ.eOIAZSLIqOXV.2K', 'S', 'Habitat Nicaragua Admin', '123e4567-e89b-12d3-a456-426655440000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'hadmin', now(), NULL, NULL, NULL);

INSERT INTO public.seg_rol_usuario (id_usuario, rol) 
VALUES ('123e4567-e89b-12d3-a456-426655440000', 'ADMIN');

-- cemex@erpuno.com
INSERT INTO public.per_usuario (id_usuario, correo, clave, activo, codigo_activacion, nombres, fecha_nac, sexo, contacto, telefonos, direccion_fisica, facebook, twitter, whatsapp, sitio_web, ir_perfil, avatar, usuario_reg, fecha_reg, usuario_mod, fecha_mod) 
VALUES ('0646f014-ec6e-4426-8147-8ccd08017328', 'cemex@erpuno.com', '$2a$10$qZHQIpwc9wLD2H/OhNYhoOs/g5FQsuD5G/qY721RI87UYxnYNGyX6', 'S', NULL, 'CEMEX Nicaragua', NULL, ' ', NULL, '', 'Managua 14031', 'https://www.facebook.com/CEMEXNicaraguaSA', 'https://twitter.com/CEMEX_NICARAGUA', '', NULL, 'N', '0646f014-ec6e-4426-8147-8ccd08017328.jpg', 'hadmin', '2019-04-15 20:57:20.837079', NULL, NULL);

INSERT INTO public.seg_rol_usuario (id_usuario, rol)
VALUES ('0646f014-ec6e-4426-8147-8ccd08017328', 'MATERIAL');
INSERT INTO public.seg_rol_usuario (id_usuario, rol)
VALUES ('0646f014-ec6e-4426-8147-8ccd08017328', 'USUARIO');


-- id.waltermartinez@gmail.com
INSERT INTO public.per_usuario (correo, id_usuario, clave, activo, codigo_activacion, nombres, fecha_nac, sexo, telefonos, direccion_fisica, facebook, twitter, whatsapp, ir_perfil, avatar, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES ('id.waltermartinez@gmail.com', '0126f013-ea6e-4426-8147-8ccd08017311', '$2a$10$zh1EIns66vT1tOgx0qyA9eYZ7F4o5hxkK9hvEwDCRRMmmmuH7aFfW', 'S', NULL, 'Walter Martinez', '1990-10-01', 'M', '81803115', 'Managua', 'waltermartinez7', '@walter', '81803115', 'N', NULL, 'hadmin', now(), null, null);

INSERT INTO public.seg_rol_usuario (id_usuario, rol)
VALUES ('0126f013-ea6e-4426-8147-8ccd08017311', 'USUARIO');

-- denisjtorresg@gmail.com
INSERT INTO public.per_usuario (correo, id_usuario, clave, activo, codigo_activacion, nombres, fecha_nac, sexo, contacto, telefonos, direccion_fisica, facebook, twitter, whatsapp, sitio_web, ir_perfil, avatar, usuario_reg, fecha_reg, usuario_mod, fecha_mod) 
VALUES ('denisjtorresg@gmail.com', '9175e50a-53bb-4339-ba5b-c47f4abd977c', '$2a$10$tS.0AOh9CDshtZ83D6cFx.YHEGtRMWOH6CAlBsZ.j0VFVSzD5dNae', 'S', NULL, 'Denis Torres', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, 'hadmin', now(), null, null);

INSERT INTO public.seg_rol_usuario (id_usuario, rol)
VALUES ('9175e50a-53bb-4339-ba5b-c47f4abd977c', 'USUARIO');

-- admintecnico@erpuno.com
INSERT INTO public.per_usuario (correo, id_usuario, clave, activo, codigo_activacion, nombres, fecha_nac, sexo, contacto, telefonos, direccion_fisica, facebook, twitter, whatsapp, sitio_web, ir_perfil, avatar, usuario_reg, fecha_reg, usuario_mod, fecha_mod) 
VALUES ('admintecnico@erpuno.com', '9075e75b-53bb-4339-ba0b-c0004abd900c', '$2a$10$tS.0AOh9CDshtZ83D6cFx.YHEGtRMWOH6CAlBsZ.j0VFVSzD5dNae', 'S', NULL, 'Jefe de Técnicos Habitat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, 'hadmin', now(), null, null);

INSERT INTO public.seg_rol_usuario (id_usuario, rol)
VALUES ('9075e75b-53bb-4339-ba0b-c0004abd900c', 'USUARIO');
INSERT INTO public.seg_rol_usuario (id_usuario, rol)
VALUES ('9075e75b-53bb-4339-ba0b-c0004abd900c', 'ADMIN_TECNICO');
INSERT INTO public.seg_rol_usuario (id_usuario, rol)
VALUES ('9075e75b-53bb-4339-ba0b-c0004abd900c', 'TECNICO');

-- tecnico@erpuno.com
INSERT INTO public.per_usuario (correo, id_usuario, clave, activo, codigo_activacion, nombres, fecha_nac, sexo, contacto, telefonos, direccion_fisica, facebook, twitter, whatsapp, sitio_web, ir_perfil, avatar, usuario_reg, fecha_reg, usuario_mod, fecha_mod) 
VALUES ('tecnico@erpuno.com', '08d6246f-6831-4c46-b805-287dfd19c1d0', '$2a$10$eZbLBwR/6aiUGfmQTXSA7uEaxcLhfcp7xN211.yea6XYHrkzjomBW', 'S', NULL, 'Técnico', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'S', NULL, 'hadmin', now(), null, null);

INSERT INTO public.seg_rol_usuario (id_usuario, rol)
VALUES ('08d6246f-6831-4c46-b805-287dfd19c1d0', 'USUARIO');
INSERT INTO public.seg_rol_usuario (id_usuario, rol)
VALUES ('08d6246f-6831-4c46-b805-287dfd19c1d0', 'TECNICO');

-- fudemi@erpuno.com
INSERT INTO public.per_usuario (id_usuario, correo, clave, activo, codigo_activacion, nombres, fecha_nac, sexo, contacto, telefonos, direccion_fisica, facebook, twitter, whatsapp, sitio_web, ir_perfil, avatar, usuario_reg, fecha_reg, usuario_mod, fecha_mod) 
VALUES ('2e1e1951-6a8f-4987-8a62-f48641009171', 'fudemi@erpuno.com', '$2a$10$I6p1NpvQc3SS.m6zP6Vexu5m03mTqnBiq2CZEmBqK9QkCF3U2Cq4C', 'S', NULL, 'FUDEMI', NULL, ' ', '', '22400017', 'Reparto Los Robles, 11 ave. Sur este N° 34', 'https://www.facebook.com/admon.sitio', 'https://twitter.com/FUDEMICM', '7516-4354', 'http://www.fudemi.org.ni', 'N', '2e1e1951-6a8f-4987-8a62-f48641009171.png', 'hadmin', '2019-04-15 20:57:20.837079', '123e4567-e89b-12d3-a456-426655440000', '2019-04-28 17:32:36.556');

INSERT INTO public.seg_rol_usuario (id_usuario, rol) 
VALUES ('2e1e1951-6a8f-4987-8a62-f48641009171', 'FINANCIAMIENTO');
INSERT INTO public.seg_rol_usuario (id_usuario, rol) 
VALUES ('2e1e1951-6a8f-4987-8a62-f48641009171', 'USUARIO');

-- fundenuse@erpuno.com
INSERT INTO public.per_usuario (id_usuario, correo, clave, activo, codigo_activacion, nombres, fecha_nac, sexo, contacto, telefonos, direccion_fisica, facebook, twitter, whatsapp, sitio_web, ir_perfil, avatar, usuario_reg, fecha_reg, usuario_mod, fecha_mod) 
VALUES ('9994952c-ae59-47a3-a872-0ac946299acd', 'fundenuse@erpuno.com', '$2a$10$xK1zc5yQGRgTbpv/H/fV3eaBSN.CC95JMFWn8KJ14yvOINAr.8IOi', 'S', NULL, 'FUNDENUSE', NULL, ' ', '', '27322060', 'Centro de Salud José Dolores Fletes, 1C al Norte, Ocotal, Nueva Segovia', 'https://www.facebook.com/fundenuse', 'https://twitter.com/hashtag/FUNDENUSE', '', 'http://www.fundenuse.com.ni', 'N', '9994952c-ae59-47a3-a872-0ac946299acd.png', 'hadmin', '2019-04-15 20:57:20.837079', '123e4567-e89b-12d3-a456-426655440000', '2019-04-28 17:35:11.23');

INSERT INTO public.seg_rol_usuario (id_usuario, rol) 
VALUES ('9994952c-ae59-47a3-a872-0ac946299acd', 'FINANCIAMIENTO');
INSERT INTO public.seg_rol_usuario (id_usuario, rol) 
VALUES ('9994952c-ae59-47a3-a872-0ac946299acd', 'USUARIO');

-- habitat@habitatnicaragua.org
INSERT INTO public.per_usuario (id_usuario, correo, clave, activo, codigo_activacion, nombres, fecha_nac, sexo, contacto, telefonos, direccion_fisica, facebook, twitter, whatsapp, sitio_web, ir_perfil, avatar, usuario_reg, fecha_reg, usuario_mod, fecha_mod) 
VALUES ('34f2a6a8-733f-4ce6-ae51-492752c57bb5', 'habitat@habitatnicaragua.org', '$2a$10$4K4f26x6iU4QeqxY8wxawO.l5NUVmJlxVKwreclGdJgBFPJF8Gyi2', 'S', NULL, 'Hábitat para la Humanidad Nicaragua', NULL, ' ', '', '+505 2270-1080', 'Managua, Los Robles. Alke Carretera a Masaya, 100 mts al oeste, 25 mts al sur. Casa #12', 'https://www.facebook.com/habitatnic', 'https://twitter.com/Habitatnic', '', 'https://www.habitatnicaragua.org/', 'N', '34f2a6a8-733f-4ce6-ae51-492752c57bb5.png', 'hadmin', '2019-04-15 20:57:20.837079', NULL, NULL);

INSERT INTO public.seg_rol_usuario (id_usuario, rol) 
VALUES ('34f2a6a8-733f-4ce6-ae51-492752c57bb5', 'USUARIO');
INSERT INTO public.seg_rol_usuario (id_usuario, rol) 
VALUES ('34f2a6a8-733f-4ce6-ae51-492752c57bb5', 'MATERIAL');



-- cat_maestro

INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (1, 'ID_CMS_TIPO_NODO', 'PAGINA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (2, 'ID_CMS_TIPO_NODO', 'FOLDER_BIBLIOTECA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (52, 'ID_CMS_TIPO_NODO', 'ENLACES', NULL, 'S', 'hadmin', now(), NULL, NULL);

INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (6, 'ID_ESPACIO_VIVIENDA', 'Porche', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (7, 'ID_ESPACIO_VIVIENDA', 'Sala', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (8, 'ID_ESPACIO_VIVIENDA', 'Cocina', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (9, 'ID_ESPACIO_VIVIENDA', 'Comedor', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (10, 'ID_ESPACIO_VIVIENDA', 'Unidad sanitaria', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (11, 'ID_ESPACIO_VIVIENDA', 'Dormitorio', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (12, 'ID_ESPACIO_VIVIENDA', 'Terraza', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (13, 'ID_ESPACIO_VIVIENDA', 'Garaje', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (14, 'ID_ESPACIO_VIVIENDA', 'Bodega', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (15, 'ID_ESPACIO_VIVIENDA', 'Área de trabajo', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (16, 'ID_ESPACIO_VIVIENDA', 'Área de uso múltiple', NULL, 'S', 'hadmin', now(), NULL, NULL);

INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (17, 'ID_TIPO_MATERIAL', 'Bloques de concreto', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (18, 'ID_TIPO_MATERIAL', 'Ladrillo de barro', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (19, 'ID_TIPO_MATERIAL', 'Piedra cantera', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (20, 'ID_TIPO_MATERIAL', 'Bloques de adobe', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (21, 'ID_TIPO_MATERIAL', 'Loseta prefabricada', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (22, 'ID_TIPO_MATERIAL', 'Madera', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (23, 'ID_TIPO_MATERIAL', 'Plycem', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (24, 'ID_TIPO_MATERIAL', 'Gypsum', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (25, 'ID_TIPO_MATERIAL', 'Plywood', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (26, 'ID_TIPO_MATERIAL', 'Fibrán', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (27, 'ID_TIPO_MATERIAL', 'PVC', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (28, 'ID_TIPO_MATERIAL', 'Zinc', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (29, 'ID_TIPO_MATERIAL', 'Teja metálica', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (30, 'ID_TIPO_MATERIAL', 'Perlines 2x4', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (31, 'ID_TIPO_MATERIAL', 'Sistema MD2', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (32, 'ID_TIPO_MATERIAL', 'Sistema blocón', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (33, 'ID_TIPO_MATERIAL', 'Covintec', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (34, 'ID_TIPO_MATERIAL', 'Ladrillo cerámica', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (35, 'ID_TIPO_MATERIAL', 'Porcelanato', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (36, 'ID_TIPO_MATERIAL', 'Ladrillo de cemento', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (37, 'ID_TIPO_MATERIAL', 'Azulejos', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (38, 'ID_TIPO_MATERIAL', 'Aluminio y vidrio', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (39, 'ID_TIPO_MATERIAL', 'PVC y vidrio', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (40, 'ID_TIPO_MATERIAL', 'Madera y vidrio', NULL, 'S', 'hadmin', now(), NULL, NULL);


INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (41, 'ID_MONEDA', 'CORDOBA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (42, 'ID_MONEDA', 'DOLAR', NULL, 'S', 'hadmin', now(), NULL, NULL);


INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (43, 'PARAMETRO_APP', 'CORREO_NOTIFICACION_FROM', 'no.contesar@micasa.org', 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) 
VALUES (44, 'PARAMETRO_APP', 'CORREO_NUEVA_CUENTA', 'Hola

Gracias por suscribirse a Mi Casa.

Para activar su cuenta por favor ingrese al siguiente enlace:

http://micasa.erpuno.com/publico/activarCuenta/{{CODIGO}}

Para cualquier consulta por favor escribir a info@micasa.org

Un saludo,

El equipo de Habitat Nicaragua', 'S', 'hadmin', now(), NULL, NULL);

INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) 
VALUES (45, 'PARAMETRO_APP', 'CORREO_NUEVA_CUENTA_ASUNTO', 'Activación de usuario en Mi-Casa', 'S', 'hadmin', now(), NULL, NULL);


INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) 
VALUES (46, 'PARAMETRO_APP', 'CORREO_NUEVA_CONTRASENIA', 'Hola

Esta es su nueva contraseña de Mi Casa:

{{CLAVE}}

Usted puede cambiarla desde el menú Mi Perfil.
  
Para cualquier consulta por favor escribir a info@micasa.org

Un saludo,

El equipo de Habitat Nicaragua', 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) 
VALUES (47, 'PARAMETRO_APP', 'CORREO_NUEVA_CONTRASENIA_ASUNTO', 'Recuperación de contraseña en Mi Casa', 'S', 'hadmin', now(), NULL, NULL);

insert into public.cat_maestro (id_cat_maestro, tipo_catalogo,nombre,descripcion,activo,usuario_reg,fecha_reg)
values (48, 'PARAMETRO_APP','PIE_DE_PAGINA',
		'Mi Casa es un servicio soportado por <a target="_blank" href="http://www.habitatnicaragua.org">Habitat para la Humanidad Nicaragua</a> | 
		<a target="_blank" href="https://www.facebook.com/micasa.com.ni/"><i class="fa fa-facebook-official fa-2"></i></a> | 
		<a target="_blank" href="https://www.instagram.com/micasa.com.ni/"><i class="fa fa-instagram fa-2"></i></a>',
		'S','hadmin', now());

Insert into public.cat_maestro (id_cat_maestro,tipo_catalogo,nombre,descripcion,activo,usuario_reg,fecha_reg,usuario_mod,fecha_mod) 
values (53,'PARAMETRO_APP','GOOGLE_ANALYTICS_CODE','UA-128708124-1','S','hadmin', now(), null, null);

INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (54, 'PARAMETRO_APP', 'RUTA_LOCAL_ARCHIVOS', '/mi-casa', 'S', 'hadmin', now(), NULL, NULL);

INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (55, 'PARAMETRO_APP', 'RUTA_WEB_ARCHIVOS', 'http://localhost/mi-casa', 'S', 'hadmin', now(), NULL, NULL);

INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (196, 'PARAMETRO_APP', 'MENSAJE_PROYECTO_CREADO', '¡Gracias! Un técnico le contactará en las próximas 24 horas hábiles.', 'S', 'hadmin', now(), NULL, NULL);


INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (49, 'ID_CMS_TIPO_ARCHIVO', 'YOUTUBE', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (50, 'ID_CMS_TIPO_ARCHIVO', 'ENLACE', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (51, 'ID_CMS_TIPO_ARCHIVO', 'ARCHIVO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (194, 'ID_CMS_TIPO_ARCHIVO', 'VIDEO', NULL, 'S', 'hadmin', now(), NULL, NULL);
		
		
		
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (56, 'ID_LOCALIDAD', 'BOACO : BOACO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (57, 'ID_LOCALIDAD', 'BOACO : CAMOAPA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (58, 'ID_LOCALIDAD', 'BOACO : SAN JOSE DE LOS REMATES', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (59, 'ID_LOCALIDAD', 'BOACO : SAN LORENZO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (60, 'ID_LOCALIDAD', 'BOACO : SANTA LUCIA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (61, 'ID_LOCALIDAD', 'BOACO : TEUSTEPE', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (62, 'ID_LOCALIDAD', 'CARAZO : DIRIAMBA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (63, 'ID_LOCALIDAD', 'CARAZO : EL ROSARIO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (64, 'ID_LOCALIDAD', 'CARAZO : JINOTEPE', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (65, 'ID_LOCALIDAD', 'CARAZO : LA CONQUISTA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (66, 'ID_LOCALIDAD', 'CARAZO : LA PAZ DE CARAZO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (67, 'ID_LOCALIDAD', 'CARAZO : SAN MARCOS', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (68, 'ID_LOCALIDAD', 'CARAZO : SANTA TERESA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (69, 'ID_LOCALIDAD', 'CHINANDEGA : CHINANDEGA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (70, 'ID_LOCALIDAD', 'CHINANDEGA : CINCO PINOS', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (71, 'ID_LOCALIDAD', 'CHINANDEGA : EL REALEJO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (72, 'ID_LOCALIDAD', 'CHINANDEGA : EL VIEJO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (73, 'ID_LOCALIDAD', 'CHINANDEGA : POSOLTEGA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (74, 'ID_LOCALIDAD', 'CHINANDEGA : SAN FRANCISCO DEL NORTE', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (75, 'ID_LOCALIDAD', 'CHINANDEGA : SAN PEDRO DEL NORTE', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (76, 'ID_LOCALIDAD', 'CHINANDEGA : SANTO TOMAS DEL NORTE', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (77, 'ID_LOCALIDAD', 'CHINANDEGA : SOMOTILLO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (78, 'ID_LOCALIDAD', 'CHINANDEGA : TONALA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (79, 'ID_LOCALIDAD', 'CHINANDEGA : VILLANUEVA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (80, 'ID_LOCALIDAD', 'CHONTALES : ACOYAPA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (81, 'ID_LOCALIDAD', 'CHONTALES : COMALAPA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (82, 'ID_LOCALIDAD', 'CHONTALES : JUIGALPA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (83, 'ID_LOCALIDAD', 'CHONTALES : LA LIBERTAD', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (84, 'ID_LOCALIDAD', 'CHONTALES : SAN PEDRO DE LOVAGO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (85, 'ID_LOCALIDAD', 'CHONTALES : SANTO DOMINGO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (86, 'ID_LOCALIDAD', 'CHONTALES : SANTO TOMAS', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (87, 'ID_LOCALIDAD', 'CHONTALES : VILLA SANDINO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (88, 'ID_LOCALIDAD', 'ESTELI : CONDEGA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (89, 'ID_LOCALIDAD', 'ESTELI : ESTELI', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (90, 'ID_LOCALIDAD', 'ESTELI : LA TRINIDAD', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (91, 'ID_LOCALIDAD', 'ESTELI : PUEBLO NUEVO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (92, 'ID_LOCALIDAD', 'ESTELI : SAN JUAN DE LIMAY', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (93, 'ID_LOCALIDAD', 'ESTELI : SAN NICOLAS', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (94, 'ID_LOCALIDAD', 'GRANADA : DIRIOMO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (95, 'ID_LOCALIDAD', 'GRANADA : GRANADA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (96, 'ID_LOCALIDAD', 'GRANADA : NANDAIME', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (97, 'ID_LOCALIDAD', 'JINOTEGA : CUA BOCAY', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (98, 'ID_LOCALIDAD', 'JINOTEGA : JINOTEGA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (99, 'ID_LOCALIDAD', 'JINOTEGA : LA CONCORDIA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (100, 'ID_LOCALIDAD', 'JINOTEGA : LAS PADRERAS', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (101, 'ID_LOCALIDAD', 'JINOTEGA : SAN RAFAEL DEL NORTE', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (102, 'ID_LOCALIDAD', 'JINOTEGA : SAN SEBASTIAN DE YALI', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (103, 'ID_LOCALIDAD', 'JINOTEGA : WIWILLI', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (104, 'ID_LOCALIDAD', 'LEON : ACHUAPA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (105, 'ID_LOCALIDAD', 'LEON : EL JICARAL', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (106, 'ID_LOCALIDAD', 'LEON : EL SAUCE', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (107, 'ID_LOCALIDAD', 'LEON : LA PAZ CENTRO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (108, 'ID_LOCALIDAD', 'LEON : LEON', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (109, 'ID_LOCALIDAD', 'LEON : MALPAISILLO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (110, 'ID_LOCALIDAD', 'LEON : NAGAROTE', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (111, 'ID_LOCALIDAD', 'LEON : QUEZALGUAQUE', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (112, 'ID_LOCALIDAD', 'LEON : SAN JOSE DE ACHUAPA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (113, 'ID_LOCALIDAD', 'LEON : SANTA ROSA DEL PENON', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (114, 'ID_LOCALIDAD', 'LEON : TELICA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (115, 'ID_LOCALIDAD', 'MADRIZ : LAS SABANAS', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (116, 'ID_LOCALIDAD', 'MADRIZ : PALACAGUINA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (117, 'ID_LOCALIDAD', 'MADRIZ : SAN JOSE DE CUSMAPA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (118, 'ID_LOCALIDAD', 'MADRIZ : SAN JUAN DE RIO COCO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (119, 'ID_LOCALIDAD', 'MADRIZ : SAN LUCAS', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (120, 'ID_LOCALIDAD', 'MADRIZ : SOMOTO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (121, 'ID_LOCALIDAD', 'MADRIZ : TOTOGALPA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (122, 'ID_LOCALIDAD', 'MADRIZ : YALAGUINA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (123, 'ID_LOCALIDAD', 'MANAGUA : CIUDAD SANDINO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (124, 'ID_LOCALIDAD', 'MANAGUA : MANAGUA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (125, 'ID_LOCALIDAD', 'MANAGUA : SAN FRANCISCO LIBRE', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (126, 'ID_LOCALIDAD', 'MANAGUA : SAN RAFAEL DEL SUR', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (127, 'ID_LOCALIDAD', 'MANAGUA : TICUANTEPE', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (128, 'ID_LOCALIDAD', 'MANAGUA : VILLA CARLOS FONSECA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (129, 'ID_LOCALIDAD', 'MASAYA : CATARINA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (130, 'ID_LOCALIDAD', 'MASAYA : LA CONCEPCION', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (131, 'ID_LOCALIDAD', 'MASAYA : MASATEPE', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (132, 'ID_LOCALIDAD', 'MASAYA : MASAYA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (133, 'ID_LOCALIDAD', 'MASAYA : NIQUINOHOMO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (134, 'ID_LOCALIDAD', 'MASAYA : TISMA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (135, 'ID_LOCALIDAD', 'MATAGALPA : CIUDAD DARIO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (136, 'ID_LOCALIDAD', 'MATAGALPA : ESQUIPULAS', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (137, 'ID_LOCALIDAD', 'MATAGALPA : MATAGALPA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (138, 'ID_LOCALIDAD', 'MATAGALPA : MATIGUASS', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (139, 'ID_LOCALIDAD', 'MATAGALPA : MUY-MUY', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (140, 'ID_LOCALIDAD', 'MATAGALPA : RANCHO GRANDES', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (141, 'ID_LOCALIDAD', 'MATAGALPA : RIO BLANCOS', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (142, 'ID_LOCALIDAD', 'MATAGALPA : SAN DIONISIO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (143, 'ID_LOCALIDAD', 'MATAGALPA : SAN ISIDRO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (144, 'ID_LOCALIDAD', 'MATAGALPA : SAN RAMON', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (145, 'ID_LOCALIDAD', 'MATAGALPA : SEBACO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (146, 'ID_LOCALIDAD', 'MATAGALPA : TERRABONA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (147, 'ID_LOCALIDAD', 'MATAGALPA : TUMA LA DALIA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (148, 'ID_LOCALIDAD', 'NUEVA SEGOVIA : CIUDAD ANTIGUA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (149, 'ID_LOCALIDAD', 'NUEVA SEGOVIA : DIPILTO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (150, 'ID_LOCALIDAD', 'NUEVA SEGOVIA : JALAPA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (151, 'ID_LOCALIDAD', 'NUEVA SEGOVIA : MURRA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (152, 'ID_LOCALIDAD', 'NUEVA SEGOVIA : OCOTAL', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (153, 'ID_LOCALIDAD', 'NUEVA SEGOVIA : QUILALI', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (154, 'ID_LOCALIDAD', 'NUEVA SEGOVIA : SAN FERNANDO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (155, 'ID_LOCALIDAD', 'NUEVA SEGOVIA : SANTA MARIA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (156, 'ID_LOCALIDAD', 'RAAN : BONANZA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (157, 'ID_LOCALIDAD', 'RAAN : PUERTO CABEZAS', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (158, 'ID_LOCALIDAD', 'RAAN : ROSITA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (159, 'ID_LOCALIDAD', 'RAAN : SIUNA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (160, 'ID_LOCALIDAD', 'RAAN : WASLALA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (161, 'ID_LOCALIDAD', 'RAAN : WASPAN', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (162, 'ID_LOCALIDAD', 'RAAS : BLUEFIELDSS', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (163, 'ID_LOCALIDAD', 'RAAS : CORN ISLANDS', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (164, 'ID_LOCALIDAD', 'RAAS : EL RAMA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (165, 'ID_LOCALIDAD', 'RAAS : KUKRA HILL', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (166, 'ID_LOCALIDAD', 'RAAS : LA CRUZ DE RIO GRANDE', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (167, 'ID_LOCALIDAD', 'RAAS : LAGUNA DE PERLAS', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (168, 'ID_LOCALIDAD', 'RAAS : MUELLE DE LOS BUEYES', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (169, 'ID_LOCALIDAD', 'RAAS : NUEVA GUINEA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (170, 'ID_LOCALIDAD', 'RAAS : PAIWAS', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (171, 'ID_LOCALIDAD', 'RIO SAN JUAN : BOCA DE SABALOS', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (172, 'ID_LOCALIDAD', 'RIO SAN JUAN : EL ALMENDRO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (173, 'ID_LOCALIDAD', 'RIO SAN JUAN : MORRITO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (174, 'ID_LOCALIDAD', 'RIO SAN JUAN : SAN CARLOS', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (175, 'ID_LOCALIDAD', 'RIO SAN JUAN : SAN JUAN DEL NORTE', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (176, 'ID_LOCALIDAD', 'RIO SAN JUAN : SAN MIGUELITO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (177, 'ID_LOCALIDAD', 'RIVAS : ALTAGRACIA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (178, 'ID_LOCALIDAD', 'RIVAS : BELEN', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (179, 'ID_LOCALIDAD', 'RIVAS : BUENOS AIRES', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (180, 'ID_LOCALIDAD', 'RIVAS : CARDENAS', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (181, 'ID_LOCALIDAD', 'RIVAS : MOYOGALPA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (182, 'ID_LOCALIDAD', 'RIVAS : POTOSI', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (183, 'ID_LOCALIDAD', 'RIVAS : RIVAS', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (184, 'ID_LOCALIDAD', 'RIVAS : SAN JORGE', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (185, 'ID_LOCALIDAD', 'RIVAS : TOLA', NULL, 'S', 'hadmin', now(), NULL, NULL);

INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (186, 'ID_BANCO', 'BANCO DE AMERICA CENTRAL (BAC)', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (187, 'ID_BANCO', 'BANCO CENTROAMERICANO (BANCENTRO)', NULL, 'S', 'hadmin', now(), NULL, NULL);

INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (188, 'PROYECTO_ESTADO', 'CREADO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (189, 'PROYECTO_ESTADO', 'EN GESTION', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (190, 'PROYECTO_ESTADO', 'VISITADO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (191, 'PROYECTO_ESTADO', 'TERMINADO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (192, 'PROYECTO_ESTADO', 'DESCARTADO', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (193, 'PROYECTO_ESTADO', 'CANCELADO POR CLIENTE', NULL, 'S', 'hadmin', now(), NULL, NULL);

INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (197, 'ID_UBICACION_PUBLICIDAD', 'PORTADA', NULL, 'S', 'hadmin', now(), NULL, NULL);
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (198, 'ID_UBICACION_PUBLICIDAD', 'INTERNA', NULL, 'S', 'hadmin', now(), NULL, NULL);

		
INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (199, 'PARAMETRO_APP', 'CONDICIONES_TOMAR_OFERTA', 'Al generar un cupón para esta oferta, usted acepta los términos y condiciones de la misma. Y se da por enterado que pueden aplicar algunas restricciones no detalladas explícitamente.', 'S', 'hadmin', now(), NULL, NULL);



INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (200, 'PARAMETRO_APP', 'CORREO_NOTIFICAR_NUEVO_PROYECTO', 'Hola

Por este medio se le informa que un nuevo proyecto (#{{CODIGO}}) se ha registrado en la App MiCasa, por favor su atención.

Saludos', 'S', 'hadmin', now(), NULL, NULL);

INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (203, 'PARAMETRO_APP', 'CORREO_NOTIFICAR_NUEVO_PROYECTO_ASUNTO', 'Nueva Cita de Proyecto', 'S', 'hadmin', now(), NULL, NULL);

INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (201, 'PARAMETRO_APP', 'CORREO_NOTIFICAR_NUEVA_ASIGNACION', 'Hola

Por este medio se le informa que el proyecto #{{CODIGO}} se ha asignado a usted, por favor su atención.

Saludos.', 'S', 'hadmin', now(), NULL, NULL);

INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (204, 'PARAMETRO_APP', 'CORREO_NOTIFICAR_NUEVA_ASIGNACION_ASUNTO', 'Proyecto Asignado', 'S', 'hadmin', now(), NULL, NULL);

INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (202, 'PARAMETRO_APP', 'CORREO_NOTIFICAR_NUEVO_COMENTARIO', 'Hola

Hay un nuevo comentario en el proyecto #{{CODIGO}}:

{{AUTOR}} dijo:

"{{COMENTARIO}}"

Puede ver el comentario completo en la App MiCasa.

Saludos.', 'S', 'hadmin', now(), NULL, NULL);

INSERT INTO public.cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod)
VALUES (205, 'PARAMETRO_APP', 'CORREO_NOTIFICAR_NUEVO_COMENTARIO_ASUNTO', 'Nuevo Comentario', 'S', 'hadmin', now(), NULL, NULL);


SELECT pg_catalog.setval('public.cat_maestro_id_cat_maestro_seq', 205, true);



-- per_direccion

-- hadmin@erpuno.com
INSERT INTO public.per_direccion (id_direccion, id_usuario, nombre, direccion, id_localidad, latitud, longitud, usuario_reg, fecha_reg, usuario_mod, fecha_mod) 
VALUES (1, '123e4567-e89b-12d3-a456-426655440000', 'Oficina central', 'Los Robles. Alke Carretera a Masaya, 100 mts al oeste, 25 mts al sur. Casa #12.', 124, 12.1221259999999997, -86.2642610000000047, 'hadmin', now(), NULL, NULL);

-- cemex@erpuno.com
INSERT INTO public.per_direccion (id_direccion, id_usuario, nombre, direccion, id_localidad, latitud, longitud, usuario_reg, fecha_reg, usuario_mod, fecha_mod) 
VALUES (2, '0646f014-ec6e-4426-8147-8ccd08017328', 'Corporativo CEMEX-NICARAGUA', 'Managua 14031', 124, 12.1141380000000005, -86.2554549999999978, 'hadmin', now(), NULL, NULL);

INSERT INTO public.per_direccion (id_direccion, id_usuario, nombre, direccion, id_localidad, latitud, longitud, usuario_reg, fecha_reg, usuario_mod, fecha_mod) 
VALUES (3, '0646f014-ec6e-4426-8147-8ccd08017328', 'Oficinas de empresa', 'Barrio Nora Astorga, Managua', 124, 12.1359499999999993, -86.2983210000000014, 'hadmin', now(), NULL, NULL);

INSERT INTO public.per_direccion (id_direccion, id_usuario, nombre, direccion, id_localidad, latitud, longitud, usuario_reg, fecha_reg, usuario_mod, fecha_mod) 
VALUES (4, '0646f014-ec6e-4426-8147-8ccd08017328', 'Empresa constructora', 'Ciudad Sandino', 123, 12.1563789999999994, -86.3345079999999996, 'hadmin', now(), NULL, NULL);

-- habitat@habitatnicaragua.org
INSERT INTO public.per_direccion (id_direccion, id_usuario, nombre, direccion, id_localidad, latitud, longitud, usuario_reg, fecha_reg, usuario_mod, fecha_mod) 
VALUES (5, '34f2a6a8-733f-4ce6-ae51-492752c57bb5', 'Oficina central Nicaragua', 'Managua, Los Robles. Alke Carretera a Masaya, 100 mts al oeste, 25 mts al sur. Casa #12', 124, 12.1222737684785002, -86.264458000659971, 'hadmin', now(), NULL, NULL);

INSERT INTO public.per_direccion (id_direccion, id_usuario, nombre, direccion, id_localidad, latitud, longitud, usuario_reg, fecha_reg, usuario_mod, fecha_mod) 
VALUES (6, '2e1e1951-6a8f-4987-8a62-f48641009171', 'Centrum', 'Edificio Centrum Villa Fontana', 124, 12.1254047690687123, -86.2701510316293252, '123e4567-e89b-12d3-a456-426655440000', '2019-04-28 17:21:18.08', NULL, NULL);

INSERT INTO public.per_direccion (id_direccion, id_usuario, nombre, direccion, id_localidad, latitud, longitud, usuario_reg, fecha_reg, usuario_mod, fecha_mod) 
VALUES (7, '9994952c-ae59-47a3-a872-0ac946299acd', 'Sucursal Ciudad Jardín', 'Sucursal Ciudad Jardín', 124, 12.1440877860613021, -86.2594369053840779, '123e4567-e89b-12d3-a456-426655440000', '2019-04-28 17:22:46.547', NULL, NULL);


SELECT pg_catalog.setval('public.per_direccion_id_direccion_seq', 7, true);

		
-- cms_nodo

INSERT INTO public.cms_nodo (id_nodo, id_cms_tipo_nodo, titulo, contenido, activo, enlace, sistema, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (1, 1, 'CONSTRUYA CON NOSOTROS', NULL, 'S', '/index.xhtml', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO public.cms_nodo (id_nodo, id_cms_tipo_nodo, titulo, contenido, activo, enlace, sistema, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (2, 52, 'Mi Proyecto', NULL, 'S', '/proyecto/index.xhtml', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO public.cms_nodo (id_nodo, id_cms_tipo_nodo, titulo, contenido, activo, enlace, sistema, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (3, 52, 'Financiamiento', '', 'S', '/financiamiento/index.xhtml', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO public.cms_nodo (id_nodo, id_cms_tipo_nodo, titulo, contenido, activo, enlace, sistema, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (4, 52, 'Materiales y Mano de Obra', '', 'S', '/materiales/index.xhtml', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO public.cms_nodo (id_nodo, id_cms_tipo_nodo, titulo, contenido, activo, enlace, sistema, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (6, 1, 'Pasos para solicitar servicios ATC', '<p>En esta secci&oacute;n se describen&nbsp;los servicios brindados por la unidad de ATC (Asistencia T&eacute;cnica en Construcci&oacute;n) de H&aacute;bitat.</p>

<p>Los incluyen&nbsp;desde la elaboraci&oacute;n de planos y presupuesto, hasta la asesor&iacute;a y supervisi&oacute;n de obras de construcci&oacute;n.</p>

<p>Los costos var&iacute;an seg&uacute;n el servicio solicitado, para mayor informaci&oacute;n comunciarse a este tel&eacute;fono: 2270-1080.</p>

<p>Podemos atender servicios ATC en los siguientes departamentos del pa&iacute;s: Managua, Estel&iacute; y Matagalpa.&nbsp;</p>

<p>Por favor haga usso de nuestro Programador de Visitas T&eacute;cnica, par aque un t&eacute;cnico de H&aacute;bitat lo visite, por favor antes de programar su vista realice el pago correspondiente en cualquiera de las siguientes cuentas bancarias:</p>

<ul>
	<li>BANCO DE AMERICA CENTRAL (BAC)
	<ul>
		<li>C&oacute;rdobas:&nbsp;351032024</li>
		<li>D&oacute;lares:&nbsp;351220090</li>
	</ul>
	</li>
	<li>BANCO CENTROAMERICANO (BANCENTRO)
	<ul>
		<li>C&oacute;rdobas:&nbsp;100200124</li>
		<li>D&oacute;lares:&nbsp;101200134</li>
	</ul>
	</li>
</ul>

<p>&nbsp;</p>
', 'S', '', 'N', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO public.cms_nodo (id_nodo, id_cms_tipo_nodo, titulo, contenido, activo, enlace, sistema, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (7, 2, 'Videos Habitat', '', 'S', '', 'N', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO public.cms_nodo (id_nodo, id_cms_tipo_nodo, titulo, contenido, activo, enlace, sistema, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (8, 52, 'Asistencia técnica para la construcción', '', 'S', '/proyecto/asistencia.xhtml', 'S', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 20:37:04.345', NULL, NULL);


SELECT pg_catalog.setval('public.cms_nodo_id_nodo_seq', 8, true);


-- cms_archivo

INSERT INTO public.cms_archivo (id_archivo, id_cms_tipo_archivo, id_proyecto, id_nodo, titulo, orden, youtube, ruta, comentario, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (1, 49, NULL, 1, 'Video portada', 0, 'zENBgVJmd-w', NULL, 'Video Portada', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO public.cms_archivo (id_archivo, id_cms_tipo_archivo, id_proyecto, id_nodo, titulo, orden, youtube, ruta, comentario, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (2, 49, NULL, 2, 'Pasos para un proyecto exitoso', 0, 's-VSnxMKNAM', NULL, '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO public.cms_archivo (id_archivo, id_cms_tipo_archivo, id_proyecto, id_nodo, titulo, orden, youtube, ruta, comentario, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (3, 49, NULL, 2, 'Paso 1: Planifique la mejora de su vivienda', 1, 'DSxToEYDRpk', NULL, '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO public.cms_archivo (id_archivo, id_cms_tipo_archivo, id_proyecto, id_nodo, titulo, orden, youtube, ruta, comentario, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (4, 49, NULL, 2, 'Paso 2: Presupuesto', 2, NULL, 'zGjkNEIm5us', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO public.cms_archivo (id_archivo, id_cms_tipo_archivo, id_proyecto, id_nodo, titulo, orden, youtube, ruta, comentario, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (5, 49, NULL, 2, 'Paso 3: Mano de obra', 3, NULL, 'pQP7ttni1rU', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO public.cms_archivo (id_archivo, id_cms_tipo_archivo, id_proyecto, id_nodo, titulo, orden, youtube, ruta, comentario, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (6, 49, NULL, 2, 'Paso 4: Materiales de construcción', 4, '', 'sp7tjMbZ414', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO public.cms_archivo (id_archivo, id_cms_tipo_archivo, id_proyecto, id_nodo, titulo, orden, youtube, ruta, comentario, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (19, 49, NULL, 7, 'Servicios de asistencia técnica en construcción', 6, 'LfjgIPqjDIY', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO public.cms_archivo (id_archivo, id_cms_tipo_archivo, id_proyecto, id_nodo, titulo, orden, youtube, ruta, comentario, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (11, 49, NULL, 3, 'Crédito como estrategia financiera', 2, 'bi9YbPlgpE4', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO public.cms_archivo (id_archivo, id_cms_tipo_archivo, id_proyecto, id_nodo, titulo, orden, youtube, ruta, comentario, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (12, 49, NULL, 3, 'Ahorro como estrategia financiera', 1, 'QjmzSuPRy5E', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO public.cms_archivo (id_archivo, id_cms_tipo_archivo, id_proyecto, id_nodo, titulo, orden, youtube, ruta, comentario, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (13, 49, NULL, 3, 'Presupuesto y disponibilidad financiera', 0, 'UPB_XVidADs', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO public.cms_archivo (id_archivo, id_cms_tipo_archivo, id_proyecto, id_nodo, titulo, orden, youtube, ruta, comentario, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (14, 49, NULL, 4, 'Tips para selección y compra de materiales', 0, 'lA_6MbZau6k', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO public.cms_archivo (id_archivo, id_cms_tipo_archivo, id_proyecto, id_nodo, titulo, orden, youtube, ruta, comentario, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (15, 49, NULL, 4, 'Tips para la contratación de mano de obra', 1, 'mVsTZDEaXb4', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO public.cms_archivo (id_archivo, id_cms_tipo_archivo, id_proyecto, id_nodo, titulo, orden, youtube, ruta, comentario, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (16, 50, NULL, 3, 'Instituciones financieras registradas', 3, '', '/usuario/listaProveedores.xhtml?rol=financiamiento', '', 'S', 'hadmin@erpuno.com', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO public.cms_archivo (id_archivo, id_cms_tipo_archivo, id_proyecto, id_nodo, titulo, orden, youtube, ruta, comentario, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (17, 50, NULL, 4, 'Proveedores de materiales de construcción y mano de obra', 2, '', '/usuario/listaProveedores.xhtml?rol=material', '', 'S', 'hadmin@erpuno.com', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO public.cms_archivo (id_archivo, id_cms_tipo_archivo, id_proyecto, id_nodo, titulo, orden, youtube, ruta, comentario, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (18, 194, NULL, 7, 'Historia de Habitat', 0, '', '/nodos/7/4ae75c53-c3a5-4d38-a948-0d763373247c.mp4', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO public.cms_archivo (id_archivo, id_cms_tipo_archivo, id_proyecto, id_nodo, titulo, orden, youtube, ruta, comentario, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (21, 50, NULL, 8, 'Paso 1: Cree su perfil', 1, '', '/usuario/miPerfil.xhtml', '', 'S', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 22:02:16.405', NULL, NULL);
INSERT INTO public.cms_archivo (id_archivo, id_cms_tipo_archivo, id_proyecto, id_nodo, titulo, orden, youtube, ruta, comentario, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (22, 50, NULL, 8, 'Paso 2: Realice el pago del servicio', 2, '', '/publico/pagina.xhtml?p=6', '', 'S', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 22:03:08.01', NULL, NULL);
INSERT INTO public.cms_archivo (id_archivo, id_cms_tipo_archivo, id_proyecto, id_nodo, titulo, orden, youtube, ruta, comentario, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (23, 50, NULL, 8, 'Paso 3: Programe su visita', 3, '', '/proyecto/miProyectoForm.xhtml', '', 'S', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 22:04:31.374', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 22:04:41.84');
INSERT INTO public.cms_archivo (id_archivo, id_cms_tipo_archivo, id_proyecto, id_nodo, titulo, orden, youtube, ruta, comentario, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (7, 50, NULL, 2, 'Paso 5: Asistencia técnica para la construcción', 5, '', '/proyecto/asistencia.xhtml', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 22:06:50.016');
INSERT INTO public.cms_archivo (id_archivo, id_cms_tipo_archivo, id_proyecto, id_nodo, titulo, orden, youtube, ruta, comentario, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (24, 50, NULL, 8, 'Paso 4: Obtenga información de su proyecto', 4, '', '/proyecto/misProyectos.xhtml', '', 'S', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 22:05:49.947', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 22:07:42.558');
INSERT INTO public.cms_archivo (id_archivo, id_cms_tipo_archivo, id_proyecto, id_nodo, titulo, orden, youtube, ruta, comentario, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) VALUES (20, 49, NULL, 8, 'Contratar servicio de asistencia técnica', 0, '20tewK2MZeY', '', '', 'S', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 22:00:30.198', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 22:41:48.671');

SELECT pg_catalog.setval('public.cms_archivo_id_archivo_seq', 24, true);

-- pry_proyecto

INSERT INTO public.pry_proyecto (id_proyecto, descripcion, id_pry_forma_pago, id_banco, fecha_pago, comprobante, espacios_mejora, materiales_mejora, presupuesto, monto_presupuesto, id_moneda, tiene_albanil, presente_visita, nombre_per_atencion_visita, fecha_hora_disponible, id_estado, id_pry_tipo_servicio, usuario_duenio, usuario_tecnico, usuario_reg, fecha_reg, usuario_mod, fecha_mod) 
VALUES (1, 'Componer el techo', NULL, 187, '2018-12-22', '99999', 'Techo', 'Zinc', 'S', 10000.00, 41, 'N', 'S', '', NULL, 188, NULL, '9175e50a-53bb-4339-ba5b-c47f4abd977c', '08d6246f-6831-4c46-b805-287dfd19c1d0', '9175e50a-53bb-4339-ba5b-c47f4abd977c', '2019-04-15 20:57:20.837079', '9075e75b-53bb-4339-ba0b-c0004abd900c', '2019-04-28 21:44:56.135');


SELECT pg_catalog.setval('public.pry_proyecto_id_proyecto_seq', 1, true);

		
-- pry_comentario
INSERT INTO public.pry_comentario (id_comentario, id_proyecto, contenido, activo, id_comentarista, usuario_reg, fecha_reg, usuario_mod, fecha_mod) 
VALUES (1, 1, 'Su proyecto ya está en proceso de gestión', 'S', '9075e75b-53bb-4339-ba0b-c0004abd900c', '9075e75b-53bb-4339-ba0b-c0004abd900c', '2019-04-28 21:45:16.807', NULL, NULL);
INSERT INTO public.pry_comentario (id_comentario, id_proyecto, contenido, activo, id_comentarista, usuario_reg, fecha_reg, usuario_mod, fecha_mod) 
VALUES (2, 1, 'Gracias', 'S', '9175e50a-53bb-4339-ba5b-c47f4abd977c', '9175e50a-53bb-4339-ba5b-c47f4abd977c', '2019-04-28 21:45:45.883', NULL, NULL);

SELECT pg_catalog.setval('public.pry_comentario_id_comentario_seq', 2, true);

		
-- oft_oferta
		
INSERT INTO public.oft_oferta (id_oferta, duenio, titulo, contenido, inicio, fin, limite_cantidad, archivo1, archivo2, archivo3, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) 
VALUES (2, '0646f014-ec6e-4426-8147-8ccd08017328', 'CEMEX Pega Cerámica Standard a mitad de precio!', '<p><strong>CEMEX Pega Cer&aacute;mica Standard a mitad de precio!</strong></p>

<p>CEMEX Pega Cer&aacute;mica Standard, es una Mezcla predosificada de cemento P&oacute;rtland y agregados con granulometr&iacute;a controlada y aditivos que conforman un producto de alta calidad. El cemento empleado cumple con el Reglamento T&eacute;cnico Nacional RTCR-383:2004. Los agregados incorporados, se producen de acuerdo a las especificaciones de calidad y m&eacute;todos de prueba seg&uacute;n las normas ASTM. CEMEX Pega Cer&aacute;mica Standard cumple con las especificaciones de la norma internacional ANSI A-118.1.</p>
', '2019-01-01', '2020-05-31', 0, '/ofertas/2/e3764509-b97c-44d1-8609-3c970dda8328.png', '/ofertas/2/022f8580-5a53-4b58-8dc0-7d3487a95036.png', '/ofertas/2/841e476d-c7a0-4a6f-82d7-c2f2e57b54ab.png', 'S', '0646f014-ec6e-4426-8147-8ccd08017328', '2019-04-28 17:43:51.22', '0646f014-ec6e-4426-8147-8ccd08017328', '2019-04-28 17:50:25.164');

SELECT pg_catalog.setval('public.oft_oferta_id_oferta_seq', 2, true);
		

-- pub_publicidad
		
INSERT INTO public.pub_publicidad (id_anuncio, id_ubicacion_anuncio, inicio, fin, impresiones, max_impresiones, clicks, max_clicks, activo, enlace, archivo1, archivo2, archivo3, usuario_reg, fecha_reg, usuario_mod, fecha_mod) 
VALUES (2, 198, '2019-02-01', '2021-01-31', 19, 0, 1, 0, 'S', 'https://es.wikipedia.org/wiki/Publicidad', '/d4d1c1l8up/2/87b380d1-15d1-4b60-b760-7a3b53f33bab.png', '/d4d1c1l8up/2/02f2a19d-c2df-4ef5-88d2-73ca48e4738f.png', NULL, '123e4567-e89b-12d3-a456-426655440000', '2019-04-20 22:04:06.167', '123e4567-e89b-12d3-a456-426655440000', '2019-04-28 17:29:26.286');

INSERT INTO public.pub_publicidad (id_anuncio, id_ubicacion_anuncio, inicio, fin, impresiones, max_impresiones, clicks, max_clicks, activo, enlace, archivo1, archivo2, archivo3, usuario_reg, fecha_reg, usuario_mod, fecha_mod) 
VALUES (3, 197, '2019-02-01', '2021-04-28', 5, 0, 0, 0, 'S', 'https://concepto.de/publicidad/', '/d4d1c1l8up/3/08c51a92-b629-470f-b153-5e4cb0937993.png', '/d4d1c1l8up/3/68b3bca2-29b6-4ccd-8245-8f1b2e5c216f.png', '/d4d1c1l8up/3/42c027a5-7570-4c95-b0da-b388ecb9ef74.png', '123e4567-e89b-12d3-a456-426655440000', '2019-04-28 17:30:51.283', '123e4567-e89b-12d3-a456-426655440000', '2019-04-28 17:30:51.283');


SELECT pg_catalog.setval('public.pub_publicidad_id_anuncio_seq', 3, true);
