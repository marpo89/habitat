--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: cat_maestro; Type: TABLE DATA; Schema: public; Owner: micasa
--

INSERT INTO cat_maestro VALUES (1, 'ID_CMS_TIPO_NODO', 'PAGINA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (2, 'ID_CMS_TIPO_NODO', 'FOLDER_BIBLIOTECA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (52, 'ID_CMS_TIPO_NODO', 'ENLACES', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (6, 'ID_ESPACIO_VIVIENDA', 'Porche', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (7, 'ID_ESPACIO_VIVIENDA', 'Sala', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (8, 'ID_ESPACIO_VIVIENDA', 'Cocina', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (9, 'ID_ESPACIO_VIVIENDA', 'Comedor', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (10, 'ID_ESPACIO_VIVIENDA', 'Unidad sanitaria', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (11, 'ID_ESPACIO_VIVIENDA', 'Dormitorio', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (12, 'ID_ESPACIO_VIVIENDA', 'Terraza', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (13, 'ID_ESPACIO_VIVIENDA', 'Garaje', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (14, 'ID_ESPACIO_VIVIENDA', 'Bodega', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (15, 'ID_ESPACIO_VIVIENDA', 'Área de trabajo', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (16, 'ID_ESPACIO_VIVIENDA', 'Área de uso múltiple', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (17, 'ID_TIPO_MATERIAL', 'Bloques de concreto', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (18, 'ID_TIPO_MATERIAL', 'Ladrillo de barro', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (19, 'ID_TIPO_MATERIAL', 'Piedra cantera', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (20, 'ID_TIPO_MATERIAL', 'Bloques de adobe', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (21, 'ID_TIPO_MATERIAL', 'Loseta prefabricada', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (22, 'ID_TIPO_MATERIAL', 'Madera', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (23, 'ID_TIPO_MATERIAL', 'Plycem', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (24, 'ID_TIPO_MATERIAL', 'Gypsum', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (25, 'ID_TIPO_MATERIAL', 'Plywood', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (26, 'ID_TIPO_MATERIAL', 'Fibrán', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (27, 'ID_TIPO_MATERIAL', 'PVC', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (28, 'ID_TIPO_MATERIAL', 'Zinc', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (29, 'ID_TIPO_MATERIAL', 'Teja metálica', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (30, 'ID_TIPO_MATERIAL', 'Perlines 2x4', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (31, 'ID_TIPO_MATERIAL', 'Sistema MD2', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (32, 'ID_TIPO_MATERIAL', 'Sistema blocón', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (33, 'ID_TIPO_MATERIAL', 'Covintec', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (34, 'ID_TIPO_MATERIAL', 'Ladrillo cerámica', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (35, 'ID_TIPO_MATERIAL', 'Porcelanato', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (36, 'ID_TIPO_MATERIAL', 'Ladrillo de cemento', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (37, 'ID_TIPO_MATERIAL', 'Azulejos', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (38, 'ID_TIPO_MATERIAL', 'Aluminio y vidrio', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (39, 'ID_TIPO_MATERIAL', 'PVC y vidrio', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (40, 'ID_TIPO_MATERIAL', 'Madera y vidrio', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (41, 'ID_MONEDA', 'CORDOBA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (42, 'ID_MONEDA', 'DOLAR', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (43, 'PARAMETRO_APP', 'CORREO_NOTIFICACION_FROM', 'no.contesar@micasa.org', 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (44, 'PARAMETRO_APP', 'CORREO_NUEVA_CUENTA', 'Hola

Gracias por suscribirse a Mi Casa.

Para activar su cuenta por favor ingrese al siguiente enlace:

http://micasa.erpuno.com/publico/activarCuenta/{{CODIGO}}

Para cualquier consulta por favor escribir a info@micasa.org

Un saludo,

El equipo de Habitat Nicaragua', 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (45, 'PARAMETRO_APP', 'CORREO_NUEVA_CUENTA_ASUNTO', 'Activación de usuario en Mi-Casa', 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (46, 'PARAMETRO_APP', 'CORREO_NUEVA_CONTRASENIA', 'Hola

Esta es su nueva contraseña de Mi Casa:

{{CLAVE}}

Usted puede cambiarla desde el menú Mi Perfil.
  
Para cualquier consulta por favor escribir a info@micasa.org

Un saludo,

El equipo de Habitat Nicaragua', 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (47, 'PARAMETRO_APP', 'CORREO_NUEVA_CONTRASENIA_ASUNTO', 'Recuperación de contraseña en Mi Casa', 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (53, 'PARAMETRO_APP', 'GOOGLE_ANALYTICS_CODE', 'UA-128708124-1', 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (54, 'PARAMETRO_APP', 'RUTA_LOCAL_ARCHIVOS', '/mi-casa', 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (55, 'PARAMETRO_APP', 'RUTA_WEB_ARCHIVOS', 'http://localhost/mi-casa', 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (196, 'PARAMETRO_APP', 'MENSAJE_PROYECTO_CREADO', '¡Gracias! Un técnico le contactará en las próximas 24 horas hábiles.', 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (49, 'ID_CMS_TIPO_ARCHIVO', 'YOUTUBE', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (50, 'ID_CMS_TIPO_ARCHIVO', 'ENLACE', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (51, 'ID_CMS_TIPO_ARCHIVO', 'ARCHIVO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (194, 'ID_CMS_TIPO_ARCHIVO', 'VIDEO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (56, 'ID_LOCALIDAD', 'BOACO : BOACO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (57, 'ID_LOCALIDAD', 'BOACO : CAMOAPA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (58, 'ID_LOCALIDAD', 'BOACO : SAN JOSE DE LOS REMATES', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (59, 'ID_LOCALIDAD', 'BOACO : SAN LORENZO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (60, 'ID_LOCALIDAD', 'BOACO : SANTA LUCIA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (61, 'ID_LOCALIDAD', 'BOACO : TEUSTEPE', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (62, 'ID_LOCALIDAD', 'CARAZO : DIRIAMBA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (63, 'ID_LOCALIDAD', 'CARAZO : EL ROSARIO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (64, 'ID_LOCALIDAD', 'CARAZO : JINOTEPE', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (65, 'ID_LOCALIDAD', 'CARAZO : LA CONQUISTA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (66, 'ID_LOCALIDAD', 'CARAZO : LA PAZ DE CARAZO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (67, 'ID_LOCALIDAD', 'CARAZO : SAN MARCOS', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (68, 'ID_LOCALIDAD', 'CARAZO : SANTA TERESA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (69, 'ID_LOCALIDAD', 'CHINANDEGA : CHINANDEGA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (70, 'ID_LOCALIDAD', 'CHINANDEGA : CINCO PINOS', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (71, 'ID_LOCALIDAD', 'CHINANDEGA : EL REALEJO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (72, 'ID_LOCALIDAD', 'CHINANDEGA : EL VIEJO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (73, 'ID_LOCALIDAD', 'CHINANDEGA : POSOLTEGA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (74, 'ID_LOCALIDAD', 'CHINANDEGA : SAN FRANCISCO DEL NORTE', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (75, 'ID_LOCALIDAD', 'CHINANDEGA : SAN PEDRO DEL NORTE', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (76, 'ID_LOCALIDAD', 'CHINANDEGA : SANTO TOMAS DEL NORTE', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (77, 'ID_LOCALIDAD', 'CHINANDEGA : SOMOTILLO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (78, 'ID_LOCALIDAD', 'CHINANDEGA : TONALA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (79, 'ID_LOCALIDAD', 'CHINANDEGA : VILLANUEVA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (80, 'ID_LOCALIDAD', 'CHONTALES : ACOYAPA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (81, 'ID_LOCALIDAD', 'CHONTALES : COMALAPA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (82, 'ID_LOCALIDAD', 'CHONTALES : JUIGALPA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (83, 'ID_LOCALIDAD', 'CHONTALES : LA LIBERTAD', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (84, 'ID_LOCALIDAD', 'CHONTALES : SAN PEDRO DE LOVAGO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (85, 'ID_LOCALIDAD', 'CHONTALES : SANTO DOMINGO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (86, 'ID_LOCALIDAD', 'CHONTALES : SANTO TOMAS', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (87, 'ID_LOCALIDAD', 'CHONTALES : VILLA SANDINO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (88, 'ID_LOCALIDAD', 'ESTELI : CONDEGA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (89, 'ID_LOCALIDAD', 'ESTELI : ESTELI', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (90, 'ID_LOCALIDAD', 'ESTELI : LA TRINIDAD', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (91, 'ID_LOCALIDAD', 'ESTELI : PUEBLO NUEVO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (92, 'ID_LOCALIDAD', 'ESTELI : SAN JUAN DE LIMAY', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (93, 'ID_LOCALIDAD', 'ESTELI : SAN NICOLAS', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (94, 'ID_LOCALIDAD', 'GRANADA : DIRIOMO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (95, 'ID_LOCALIDAD', 'GRANADA : GRANADA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (96, 'ID_LOCALIDAD', 'GRANADA : NANDAIME', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (97, 'ID_LOCALIDAD', 'JINOTEGA : CUA BOCAY', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (98, 'ID_LOCALIDAD', 'JINOTEGA : JINOTEGA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (99, 'ID_LOCALIDAD', 'JINOTEGA : LA CONCORDIA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (100, 'ID_LOCALIDAD', 'JINOTEGA : LAS PADRERAS', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (101, 'ID_LOCALIDAD', 'JINOTEGA : SAN RAFAEL DEL NORTE', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (102, 'ID_LOCALIDAD', 'JINOTEGA : SAN SEBASTIAN DE YALI', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (103, 'ID_LOCALIDAD', 'JINOTEGA : WIWILLI', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (104, 'ID_LOCALIDAD', 'LEON : ACHUAPA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (105, 'ID_LOCALIDAD', 'LEON : EL JICARAL', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (106, 'ID_LOCALIDAD', 'LEON : EL SAUCE', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (107, 'ID_LOCALIDAD', 'LEON : LA PAZ CENTRO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (108, 'ID_LOCALIDAD', 'LEON : LEON', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (109, 'ID_LOCALIDAD', 'LEON : MALPAISILLO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (110, 'ID_LOCALIDAD', 'LEON : NAGAROTE', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (111, 'ID_LOCALIDAD', 'LEON : QUEZALGUAQUE', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (112, 'ID_LOCALIDAD', 'LEON : SAN JOSE DE ACHUAPA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (113, 'ID_LOCALIDAD', 'LEON : SANTA ROSA DEL PENON', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (114, 'ID_LOCALIDAD', 'LEON : TELICA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (115, 'ID_LOCALIDAD', 'MADRIZ : LAS SABANAS', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (116, 'ID_LOCALIDAD', 'MADRIZ : PALACAGUINA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (117, 'ID_LOCALIDAD', 'MADRIZ : SAN JOSE DE CUSMAPA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (118, 'ID_LOCALIDAD', 'MADRIZ : SAN JUAN DE RIO COCO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (119, 'ID_LOCALIDAD', 'MADRIZ : SAN LUCAS', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (120, 'ID_LOCALIDAD', 'MADRIZ : SOMOTO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (121, 'ID_LOCALIDAD', 'MADRIZ : TOTOGALPA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (122, 'ID_LOCALIDAD', 'MADRIZ : YALAGUINA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (123, 'ID_LOCALIDAD', 'MANAGUA : CIUDAD SANDINO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (124, 'ID_LOCALIDAD', 'MANAGUA : MANAGUA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (125, 'ID_LOCALIDAD', 'MANAGUA : SAN FRANCISCO LIBRE', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (126, 'ID_LOCALIDAD', 'MANAGUA : SAN RAFAEL DEL SUR', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (127, 'ID_LOCALIDAD', 'MANAGUA : TICUANTEPE', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (128, 'ID_LOCALIDAD', 'MANAGUA : VILLA CARLOS FONSECA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (129, 'ID_LOCALIDAD', 'MASAYA : CATARINA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (130, 'ID_LOCALIDAD', 'MASAYA : LA CONCEPCION', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (131, 'ID_LOCALIDAD', 'MASAYA : MASATEPE', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (132, 'ID_LOCALIDAD', 'MASAYA : MASAYA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (133, 'ID_LOCALIDAD', 'MASAYA : NIQUINOHOMO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (134, 'ID_LOCALIDAD', 'MASAYA : TISMA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (135, 'ID_LOCALIDAD', 'MATAGALPA : CIUDAD DARIO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (136, 'ID_LOCALIDAD', 'MATAGALPA : ESQUIPULAS', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (137, 'ID_LOCALIDAD', 'MATAGALPA : MATAGALPA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (138, 'ID_LOCALIDAD', 'MATAGALPA : MATIGUASS', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (139, 'ID_LOCALIDAD', 'MATAGALPA : MUY-MUY', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (140, 'ID_LOCALIDAD', 'MATAGALPA : RANCHO GRANDES', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (141, 'ID_LOCALIDAD', 'MATAGALPA : RIO BLANCOS', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (142, 'ID_LOCALIDAD', 'MATAGALPA : SAN DIONISIO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (143, 'ID_LOCALIDAD', 'MATAGALPA : SAN ISIDRO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (144, 'ID_LOCALIDAD', 'MATAGALPA : SAN RAMON', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (145, 'ID_LOCALIDAD', 'MATAGALPA : SEBACO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (146, 'ID_LOCALIDAD', 'MATAGALPA : TERRABONA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (147, 'ID_LOCALIDAD', 'MATAGALPA : TUMA LA DALIA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (148, 'ID_LOCALIDAD', 'NUEVA SEGOVIA : CIUDAD ANTIGUA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (149, 'ID_LOCALIDAD', 'NUEVA SEGOVIA : DIPILTO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (150, 'ID_LOCALIDAD', 'NUEVA SEGOVIA : JALAPA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (151, 'ID_LOCALIDAD', 'NUEVA SEGOVIA : MURRA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (152, 'ID_LOCALIDAD', 'NUEVA SEGOVIA : OCOTAL', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (153, 'ID_LOCALIDAD', 'NUEVA SEGOVIA : QUILALI', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (154, 'ID_LOCALIDAD', 'NUEVA SEGOVIA : SAN FERNANDO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (155, 'ID_LOCALIDAD', 'NUEVA SEGOVIA : SANTA MARIA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (156, 'ID_LOCALIDAD', 'RAAN : BONANZA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (157, 'ID_LOCALIDAD', 'RAAN : PUERTO CABEZAS', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (158, 'ID_LOCALIDAD', 'RAAN : ROSITA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (159, 'ID_LOCALIDAD', 'RAAN : SIUNA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (160, 'ID_LOCALIDAD', 'RAAN : WASLALA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (161, 'ID_LOCALIDAD', 'RAAN : WASPAN', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (162, 'ID_LOCALIDAD', 'RAAS : BLUEFIELDSS', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (163, 'ID_LOCALIDAD', 'RAAS : CORN ISLANDS', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (164, 'ID_LOCALIDAD', 'RAAS : EL RAMA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (165, 'ID_LOCALIDAD', 'RAAS : KUKRA HILL', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (166, 'ID_LOCALIDAD', 'RAAS : LA CRUZ DE RIO GRANDE', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (167, 'ID_LOCALIDAD', 'RAAS : LAGUNA DE PERLAS', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (168, 'ID_LOCALIDAD', 'RAAS : MUELLE DE LOS BUEYES', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (169, 'ID_LOCALIDAD', 'RAAS : NUEVA GUINEA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (170, 'ID_LOCALIDAD', 'RAAS : PAIWAS', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (171, 'ID_LOCALIDAD', 'RIO SAN JUAN : BOCA DE SABALOS', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (172, 'ID_LOCALIDAD', 'RIO SAN JUAN : EL ALMENDRO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (173, 'ID_LOCALIDAD', 'RIO SAN JUAN : MORRITO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (174, 'ID_LOCALIDAD', 'RIO SAN JUAN : SAN CARLOS', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (175, 'ID_LOCALIDAD', 'RIO SAN JUAN : SAN JUAN DEL NORTE', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (176, 'ID_LOCALIDAD', 'RIO SAN JUAN : SAN MIGUELITO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (177, 'ID_LOCALIDAD', 'RIVAS : ALTAGRACIA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (178, 'ID_LOCALIDAD', 'RIVAS : BELEN', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (179, 'ID_LOCALIDAD', 'RIVAS : BUENOS AIRES', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (180, 'ID_LOCALIDAD', 'RIVAS : CARDENAS', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (181, 'ID_LOCALIDAD', 'RIVAS : MOYOGALPA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (182, 'ID_LOCALIDAD', 'RIVAS : POTOSI', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (183, 'ID_LOCALIDAD', 'RIVAS : RIVAS', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (184, 'ID_LOCALIDAD', 'RIVAS : SAN JORGE', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (185, 'ID_LOCALIDAD', 'RIVAS : TOLA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (186, 'ID_BANCO', 'BANCO DE AMERICA CENTRAL (BAC)', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (187, 'ID_BANCO', 'BANCO CENTROAMERICANO (BANCENTRO)', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (188, 'PROYECTO_ESTADO', 'CREADO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (189, 'PROYECTO_ESTADO', 'EN GESTION', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (190, 'PROYECTO_ESTADO', 'VISITADO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (191, 'PROYECTO_ESTADO', 'TERMINADO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (192, 'PROYECTO_ESTADO', 'DESCARTADO', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (193, 'PROYECTO_ESTADO', 'CANCELADO POR CLIENTE', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (197, 'ID_UBICACION_PUBLICIDAD', 'PORTADA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (198, 'ID_UBICACION_PUBLICIDAD', 'INTERNA', NULL, 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (199, 'PARAMETRO_APP', 'CONDICIONES_TOMAR_OFERTA', 'Al generar un cupón para esta oferta, usted acepta los términos y condiciones de la misma. Y se da por enterado que pueden aplicar algunas restricciones no detalladas explícitamente.', 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (200, 'PARAMETRO_APP', 'CORREO_NOTIFICAR_NUEVO_PROYECTO', 'Hola

Por este medio se le informa que un nuevo proyecto (#{{CODIGO}}) se ha registrado en la App MiCasa, por favor su atención.

Saludos', 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (203, 'PARAMETRO_APP', 'CORREO_NOTIFICAR_NUEVO_PROYECTO_ASUNTO', 'Nueva Cita de Proyecto', 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (201, 'PARAMETRO_APP', 'CORREO_NOTIFICAR_NUEVA_ASIGNACION', 'Hola

Por este medio se le informa que el proyecto #{{CODIGO}} se ha asignado a usted, por favor su atención.

Saludos.', 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (204, 'PARAMETRO_APP', 'CORREO_NOTIFICAR_NUEVA_ASIGNACION_ASUNTO', 'Proyecto Asignado', 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (202, 'PARAMETRO_APP', 'CORREO_NOTIFICAR_NUEVO_COMENTARIO', 'Hola

Hay un nuevo comentario en el proyecto #{{CODIGO}}:

{{AUTOR}} dijo:

"{{COMENTARIO}}"

Puede ver el comentario completo en la App MiCasa.

Saludos.', 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (205, 'PARAMETRO_APP', 'CORREO_NOTIFICAR_NUEVO_COMENTARIO_ASUNTO', 'Nuevo Comentario', 'S', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO cat_maestro VALUES (48, 'PARAMETRO_APP', 'PIE_DE_PAGINA', 'Mi Casa es un servicio soportado por <a target="_blank" href="http://www.habitatnicaragua.org">Hábitat para la Humanidad Nicaragua</a> | 
		<a target="_blank" href="https://www.facebook.com/micasa.com.ni/"><i class="fa fa-facebook-official fa-2"></i></a> | 
		<a target="_blank" href="https://www.instagram.com/micasa.com.ni/"><i class="fa fa-instagram fa-2"></i></a>', 'S', 'hadmin', '2019-06-11 05:06:27.520173', '123e4567-e89b-12d3-a456-426655440000', '2019-06-11 19:25:55.496');


--
-- Name: cat_maestro_id_cat_maestro_seq; Type: SEQUENCE SET; Schema: public; Owner: micasa
--

SELECT pg_catalog.setval('cat_maestro_id_cat_maestro_seq', 205, true);


--
-- Data for Name: cms_nodo; Type: TABLE DATA; Schema: public; Owner: micasa
--

INSERT INTO cms_nodo VALUES (1, 1, 'CONSTRUYA CON NOSOTROS', NULL, 'S', '/index.xhtml', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_nodo VALUES (2, 52, 'Mi Proyecto', NULL, 'S', '/proyecto/index.xhtml', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_nodo VALUES (3, 52, 'Financiamiento', '', 'S', '/financiamiento/index.xhtml', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_nodo VALUES (4, 52, 'Materiales y Mano de Obra', '', 'S', '/materiales/index.xhtml', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_nodo VALUES (6, 1, 'Pasos para solicitar servicios ATC', '<p>En esta secci&oacute;n se describen&nbsp;los servicios brindados por la unidad de ATC (Asistencia T&eacute;cnica en Construcci&oacute;n) de H&aacute;bitat.</p>

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
INSERT INTO cms_nodo VALUES (7, 2, 'Videos Habitat', '', 'S', '', 'N', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_nodo VALUES (8, 52, 'Asistencia técnica para la construcción', '', 'S', '/proyecto/asistencia.xhtml', 'S', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 20:37:04.345', NULL, NULL);


--
-- Data for Name: per_usuario; Type: TABLE DATA; Schema: public; Owner: micasa
--

INSERT INTO per_usuario VALUES ('123e4567-e89b-12d3-a456-426655440000', 'hadmin@erpuno.com', '$2a$10$PPbgr/ONViv5xM.jXp6AGu/RjpVkw.uy5QIfJ.eOIAZSLIqOXV.2K', 'S', NULL, 'Habitat Nicaragua Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO per_usuario VALUES ('0646f014-ec6e-4426-8147-8ccd08017328', 'cemex@erpuno.com', '$2a$10$qZHQIpwc9wLD2H/OhNYhoOs/g5FQsuD5G/qY721RI87UYxnYNGyX6', 'S', NULL, 'CEMEX Nicaragua', NULL, ' ', NULL, '', 'Managua 14031', 'https://www.facebook.com/CEMEXNicaraguaSA', 'https://twitter.com/CEMEX_NICARAGUA', '', NULL, 'N', '0646f014-ec6e-4426-8147-8ccd08017328.jpg', 'hadmin', '2019-04-15 20:57:20.837079', NULL, NULL);
INSERT INTO per_usuario VALUES ('0126f013-ea6e-4426-8147-8ccd08017311', 'id.waltermartinez@gmail.com', '$2a$10$zh1EIns66vT1tOgx0qyA9eYZ7F4o5hxkK9hvEwDCRRMmmmuH7aFfW', 'S', NULL, 'Walter Martinez', '1990-10-01', 'M', NULL, '81803115', 'Managua', 'waltermartinez7', '@walter', '81803115', NULL, 'N', NULL, 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO per_usuario VALUES ('9175e50a-53bb-4339-ba5b-c47f4abd977c', 'denisjtorresg@gmail.com', '$2a$10$tS.0AOh9CDshtZ83D6cFx.YHEGtRMWOH6CAlBsZ.j0VFVSzD5dNae', 'S', NULL, 'Denis Torres', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO per_usuario VALUES ('9075e75b-53bb-4339-ba0b-c0004abd900c', 'admintecnico@erpuno.com', '$2a$10$tS.0AOh9CDshtZ83D6cFx.YHEGtRMWOH6CAlBsZ.j0VFVSzD5dNae', 'S', NULL, 'Jefe de Técnicos Habitat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO per_usuario VALUES ('2e1e1951-6a8f-4987-8a62-f48641009171', 'fudemi@erpuno.com', '$2a$10$I6p1NpvQc3SS.m6zP6Vexu5m03mTqnBiq2CZEmBqK9QkCF3U2Cq4C', 'S', NULL, 'FUDEMI', NULL, ' ', '', '22400017', 'Reparto Los Robles, 11 ave. Sur este N° 34', 'https://www.facebook.com/admon.sitio', 'https://twitter.com/FUDEMICM', '7516-4354', 'http://www.fudemi.org.ni', 'N', '2e1e1951-6a8f-4987-8a62-f48641009171.png', 'hadmin', '2019-04-15 20:57:20.837079', '123e4567-e89b-12d3-a456-426655440000', '2019-04-28 17:32:36.556');
INSERT INTO per_usuario VALUES ('9994952c-ae59-47a3-a872-0ac946299acd', 'fundenuse@erpuno.com', '$2a$10$xK1zc5yQGRgTbpv/H/fV3eaBSN.CC95JMFWn8KJ14yvOINAr.8IOi', 'S', NULL, 'FUNDENUSE', NULL, ' ', '', '27322060', 'Centro de Salud José Dolores Fletes, 1C al Norte, Ocotal, Nueva Segovia', 'https://www.facebook.com/fundenuse', 'https://twitter.com/hashtag/FUNDENUSE', '', 'http://www.fundenuse.com.ni', 'N', '9994952c-ae59-47a3-a872-0ac946299acd.png', 'hadmin', '2019-04-15 20:57:20.837079', '123e4567-e89b-12d3-a456-426655440000', '2019-04-28 17:35:11.23');
INSERT INTO per_usuario VALUES ('34f2a6a8-733f-4ce6-ae51-492752c57bb5', 'habitat@habitatnicaragua.org', '$2a$10$4K4f26x6iU4QeqxY8wxawO.l5NUVmJlxVKwreclGdJgBFPJF8Gyi2', 'S', NULL, 'Hábitat para la Humanidad Nicaragua', NULL, ' ', '', '+505 2270-1080', 'Managua, Los Robles. Alke Carretera a Masaya, 100 mts al oeste, 25 mts al sur. Casa #12', 'https://www.facebook.com/habitatnic', 'https://twitter.com/Habitatnic', '', 'https://www.habitatnicaragua.org/', 'N', '34f2a6a8-733f-4ce6-ae51-492752c57bb5.png', 'hadmin', '2019-04-15 20:57:20.837079', NULL, NULL);
INSERT INTO per_usuario VALUES ('08d6246f-6831-4c46-b805-287dfd19c1d0', 'tecnico@erpuno.com', '$2a$10$eZbLBwR/6aiUGfmQTXSA7uEaxcLhfcp7xN211.yea6XYHrkzjomBW', 'S', NULL, 'Técnico', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, 'hadmin', '2019-06-11 05:06:27.520173', '08d6246f-6831-4c46-b805-287dfd19c1d0', '2019-06-11 17:36:09.096');
INSERT INTO per_usuario VALUES ('2595db63-4958-4049-8968-909553407df0', 'jrosales@habitatnicaragua.org', '$2a$10$6.GEcagQc.oDmS.8T.BerupS11MM4ZkHqDKBNOivRyCpUjW6/Fgee', 'S', NULL, 'Jose Luis Rosales', NULL, 'M', NULL, '', '', NULL, NULL, NULL, NULL, 'N', NULL, '', '2019-06-14 15:54:59.572', '2595db63-4958-4049-8968-909553407df0', '2019-06-14 16:05:05.151');


--
-- Data for Name: pry_proyecto; Type: TABLE DATA; Schema: public; Owner: micasa
--

INSERT INTO pry_proyecto VALUES (1, 'Componer el techo', NULL, 187, '2018-12-22', '99999', 'Techo', 'Zinc', 'S', 10000.00, 41, 'N', 'S', '', NULL, 188, NULL, '9175e50a-53bb-4339-ba5b-c47f4abd977c', '08d6246f-6831-4c46-b805-287dfd19c1d0', '9175e50a-53bb-4339-ba5b-c47f4abd977c', '2019-04-15 20:57:20.837079', '9075e75b-53bb-4339-ba0b-c0004abd900c', '2019-04-28 21:44:56.135');


--
-- Data for Name: cms_archivo; Type: TABLE DATA; Schema: public; Owner: micasa
--

INSERT INTO cms_archivo VALUES (1, 49, NULL, 1, 'Video portada', 0, 'zENBgVJmd-w', NULL, 'Video Portada', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_archivo VALUES (19, 49, NULL, 7, 'Servicios de asistencia técnica en construcción', 6, 'LfjgIPqjDIY', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_archivo VALUES (11, 49, NULL, 3, 'Crédito como estrategia financiera', 2, 'bi9YbPlgpE4', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_archivo VALUES (12, 49, NULL, 3, 'Ahorro como estrategia financiera', 1, 'QjmzSuPRy5E', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_archivo VALUES (14, 49, NULL, 4, 'Tips para selección y compra de materiales', 0, 'lA_6MbZau6k', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_archivo VALUES (15, 49, NULL, 4, 'Tips para la contratación de mano de obra', 1, 'mVsTZDEaXb4', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_archivo VALUES (16, 50, NULL, 3, 'Instituciones financieras registradas', 3, '', '/usuario/listaProveedores.xhtml?rol=financiamiento', '', 'S', 'hadmin@erpuno.com', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_archivo VALUES (17, 50, NULL, 4, 'Proveedores de materiales de construcción y mano de obra', 2, '', '/usuario/listaProveedores.xhtml?rol=material', '', 'S', 'hadmin@erpuno.com', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_archivo VALUES (18, 194, NULL, 7, 'Historia de Habitat', 0, '', '/nodos/7/4ae75c53-c3a5-4d38-a948-0d763373247c.mp4', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_archivo VALUES (21, 50, NULL, 8, 'Paso 1: Cree su perfil', 1, '', '/usuario/miPerfil.xhtml', '', 'S', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 22:02:16.405', NULL, NULL);
INSERT INTO cms_archivo VALUES (22, 50, NULL, 8, 'Paso 2: Realice el pago del servicio', 2, '', '/publico/pagina.xhtml?p=6', '', 'S', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 22:03:08.01', NULL, NULL);
INSERT INTO cms_archivo VALUES (23, 50, NULL, 8, 'Paso 3: Programe su visita', 3, '', '/proyecto/miProyectoForm.xhtml', '', 'S', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 22:04:31.374', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 22:04:41.84');
INSERT INTO cms_archivo VALUES (24, 50, NULL, 8, 'Paso 4: Obtenga información de su proyecto', 4, '', '/proyecto/misProyectos.xhtml', '', 'S', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 22:05:49.947', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 22:07:42.558');
INSERT INTO cms_archivo VALUES (2, 49, NULL, 2, 'Pasos para un proyecto exitoso', 0, 'le1ANsJa9Po', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', '123e4567-e89b-12d3-a456-426655440000', '2019-06-11 18:40:18.428');
INSERT INTO cms_archivo VALUES (3, 49, NULL, 2, 'Paso 1: Planifique la mejora de su vivienda', 1, 'KT3zbBk6aFY', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', '123e4567-e89b-12d3-a456-426655440000', '2019-06-11 18:43:38.874');
INSERT INTO cms_archivo VALUES (4, 49, NULL, 2, 'Paso 2: Presupuesto', 2, 'hEmkjrxI4Lg', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', '123e4567-e89b-12d3-a456-426655440000', '2019-06-11 18:44:15.297');
INSERT INTO cms_archivo VALUES (5, 49, NULL, 2, 'Paso 3: Mano de obra', 3, 'eqva1Tkv-YI', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', '123e4567-e89b-12d3-a456-426655440000', '2019-06-11 18:44:41.112');
INSERT INTO cms_archivo VALUES (6, 49, NULL, 2, 'Paso 4: Materiales de construcción', 4, 'T3CyNQHHCgk', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', '123e4567-e89b-12d3-a456-426655440000', '2019-06-11 18:44:59.563');
INSERT INTO cms_archivo VALUES (13, 49, NULL, 3, 'Presupuesto y disponibilidad financiera', 0, 'G0cf0znZcmY', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', '123e4567-e89b-12d3-a456-426655440000', '2019-06-11 19:06:23.546');
INSERT INTO cms_archivo VALUES (26, 49, NULL, 7, 'Curso Construcción Segura', 0, 'T6ZCPbaMOYU', '', '', 'S', '123e4567-e89b-12d3-a456-426655440000', '2019-06-11 19:31:01.867', NULL, NULL);
INSERT INTO cms_archivo VALUES (7, 50, NULL, 2, 'Paso 5: Asistencia técnica para la construcción', 5, '', '/proyecto/asistencia.xhtml', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', '123e4567-e89b-12d3-a456-426655440000', '2019-06-14 23:45:37.688');
INSERT INTO cms_archivo VALUES (20, 49, NULL, 8, 'Contratar servicio de asistencia técnica', 0, '6hJsVMmhxvI', '', '', 'S', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 22:00:30.198', '123e4567-e89b-12d3-a456-426655440000', '2019-06-14 23:46:59.992');


--
-- Name: cms_archivo_id_archivo_seq; Type: SEQUENCE SET; Schema: public; Owner: micasa
--

SELECT pg_catalog.setval('cms_archivo_id_archivo_seq', 26, true);


--
-- Data for Name: cms_contenido; Type: TABLE DATA; Schema: public; Owner: micasa
--

INSERT INTO cms_contenido VALUES (1, 'Ecofiltro', '<p>Obtén 10% de descuento sobre el precio del Ecofiltro al realizar tu compra con el financiamiento de FUNDENUSE. Promoción válida para clientes de sucursal Estelí y Ocotal.</p>', '9994952c-ae59-47a3-a872-0ac946299acd', '/contenido2/1/b5acbf15-4daa-4155-ae37-9af926c11dc1.jpg', '', '9994952c-ae59-47a3-a872-0ac946299acd', '2019-06-12 16:40:42.99', '9994952c-ae59-47a3-a872-0ac946299acd', '2019-06-12 16:40:42.99');


--
-- Name: cms_contenido_id_contenido_seq; Type: SEQUENCE SET; Schema: public; Owner: micasa
--

SELECT pg_catalog.setval('cms_contenido_id_contenido_seq', 1, true);


--
-- Name: cms_nodo_id_nodo_seq; Type: SEQUENCE SET; Schema: public; Owner: micasa
--

SELECT pg_catalog.setval('cms_nodo_id_nodo_seq', 8, true);


--
-- Data for Name: oft_oferta; Type: TABLE DATA; Schema: public; Owner: micasa
--

INSERT INTO oft_oferta VALUES (2, '0646f014-ec6e-4426-8147-8ccd08017328', 'CEMEX Pega Cerámica Standard a mitad de precio!', '<p><strong>CEMEX Pega Cer&aacute;mica Standard a mitad de precio!</strong></p>

<p>CEMEX Pega Cer&aacute;mica Standard, es una Mezcla predosificada de cemento P&oacute;rtland y agregados con granulometr&iacute;a controlada y aditivos que conforman un producto de alta calidad. El cemento empleado cumple con el Reglamento T&eacute;cnico Nacional RTCR-383:2004. Los agregados incorporados, se producen de acuerdo a las especificaciones de calidad y m&eacute;todos de prueba seg&uacute;n las normas ASTM. CEMEX Pega Cer&aacute;mica Standard cumple con las especificaciones de la norma internacional ANSI A-118.1.</p>
', '2019-01-01', '2020-05-31', 0, '/ofertas/2/e3764509-b97c-44d1-8609-3c970dda8328.png', '/ofertas/2/022f8580-5a53-4b58-8dc0-7d3487a95036.png', '/ofertas/2/841e476d-c7a0-4a6f-82d7-c2f2e57b54ab.png', 'S', '0646f014-ec6e-4426-8147-8ccd08017328', '2019-04-28 17:43:51.22', '0646f014-ec6e-4426-8147-8ccd08017328', '2019-04-28 17:50:25.164');
INSERT INTO oft_oferta VALUES (3, '123e4567-e89b-12d3-a456-426655440000', 'El único FIBROCEMENTO Certificado', '<p>Compre en nuestros distribuidores autorizados y presente su cup&oacute;n de descuento. Por compras mayores a C$5,000.00&nbsp;obtenga 5% de descuento. Promoci&oacute;n v&aacute;lida hasta el 19 de Junio de 2019.</p>
', '2019-06-12', '2019-06-19', 0, '/ofertas/3/2dadc978-1380-47c7-99c2-cd77666bd48d.jpg', NULL, NULL, 'S', '123e4567-e89b-12d3-a456-426655440000', '2019-06-12 16:31:20.373', '123e4567-e89b-12d3-a456-426655440000', '2019-06-12 16:31:20.373');
INSERT INTO oft_oferta VALUES (4, '9994952c-ae59-47a3-a872-0ac946299acd', 'Ecofiltro ', '<p>Elaborado con pl&aacute;stico virgen y v&aacute;lvulas de acero. Obtenga 10% de descuento al realizar su compra con el financiamiento que s&oacute;lo FUNDENUSE te ofrece. Promoci&oacute;n valida para clientes de la sucursal Estel&iacute; y Ocotal. V&aacute;lida hasta el 12 de julio. S&oacute;lo aplica para una compra por hogar.</p>
', '2019-06-12', '2019-07-12', 0, '/ofertas/4/3593c7ce-3fa5-4bec-bf50-61513b624110.png', NULL, NULL, 'S', '9994952c-ae59-47a3-a872-0ac946299acd', '2019-06-12 17:12:06.184', '9994952c-ae59-47a3-a872-0ac946299acd', '2019-06-12 17:12:06.184');


--
-- Name: oft_oferta_id_oferta_seq; Type: SEQUENCE SET; Schema: public; Owner: micasa
--

SELECT pg_catalog.setval('oft_oferta_id_oferta_seq', 4, true);


--
-- Data for Name: oft_usar_oferta; Type: TABLE DATA; Schema: public; Owner: micasa
--

INSERT INTO oft_usar_oferta VALUES (1, 2, '2595db63-4958-4049-8968-909553407df0', '190614-2-2-8dX5', '2595db63-4958-4049-8968-909553407df0', '2019-06-14 16:06:11.698', NULL, NULL);
INSERT INTO oft_usar_oferta VALUES (2, 2, '123e4567-e89b-12d3-a456-426655440000', '190614-2-1-Hzjf', '123e4567-e89b-12d3-a456-426655440000', '2019-06-14 18:49:36.208', NULL, NULL);


--
-- Name: oft_usar_oferta_id_usar_oferta_seq; Type: SEQUENCE SET; Schema: public; Owner: micasa
--

SELECT pg_catalog.setval('oft_usar_oferta_id_usar_oferta_seq', 2, true);


--
-- Data for Name: per_calificacion; Type: TABLE DATA; Schema: public; Owner: micasa
--



--
-- Name: per_calificacion_id_calificacion_seq; Type: SEQUENCE SET; Schema: public; Owner: micasa
--

SELECT pg_catalog.setval('per_calificacion_id_calificacion_seq', 1, false);


--
-- Data for Name: per_direccion; Type: TABLE DATA; Schema: public; Owner: micasa
--

INSERT INTO per_direccion VALUES (1, '123e4567-e89b-12d3-a456-426655440000', 'Oficina central', 'Los Robles. Alke Carretera a Masaya, 100 mts al oeste, 25 mts al sur. Casa #12.', 124, 12.1221259999999997, -86.2642610000000047, 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO per_direccion VALUES (2, '0646f014-ec6e-4426-8147-8ccd08017328', 'Corporativo CEMEX-NICARAGUA', 'Managua 14031', 124, 12.1141380000000005, -86.2554549999999978, 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO per_direccion VALUES (3, '0646f014-ec6e-4426-8147-8ccd08017328', 'Oficinas de empresa', 'Barrio Nora Astorga, Managua', 124, 12.1359499999999993, -86.2983210000000014, 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO per_direccion VALUES (4, '0646f014-ec6e-4426-8147-8ccd08017328', 'Empresa constructora', 'Ciudad Sandino', 123, 12.1563789999999994, -86.3345079999999996, 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO per_direccion VALUES (5, '34f2a6a8-733f-4ce6-ae51-492752c57bb5', 'Oficina central Nicaragua', 'Managua, Los Robles. Alke Carretera a Masaya, 100 mts al oeste, 25 mts al sur. Casa #12', 124, 12.1222737684785002, -86.264458000659971, 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO per_direccion VALUES (6, '2e1e1951-6a8f-4987-8a62-f48641009171', 'Centrum', 'Edificio Centrum Villa Fontana', 124, 12.1254047690687123, -86.2701510316293252, '123e4567-e89b-12d3-a456-426655440000', '2019-04-28 17:21:18.08', NULL, NULL);
INSERT INTO per_direccion VALUES (7, '9994952c-ae59-47a3-a872-0ac946299acd', 'Sucursal Ciudad Jardín', 'Sucursal Ciudad Jardín', 124, 12.1440877860613021, -86.2594369053840779, '123e4567-e89b-12d3-a456-426655440000', '2019-04-28 17:22:46.547', NULL, NULL);


--
-- Name: per_direccion_id_direccion_seq; Type: SEQUENCE SET; Schema: public; Owner: micasa
--

SELECT pg_catalog.setval('per_direccion_id_direccion_seq', 7, true);


--
-- Data for Name: pry_comentario; Type: TABLE DATA; Schema: public; Owner: micasa
--

INSERT INTO pry_comentario VALUES (1, 1, 'Su proyecto ya está en proceso de gestión', 'S', '9075e75b-53bb-4339-ba0b-c0004abd900c', '9075e75b-53bb-4339-ba0b-c0004abd900c', '2019-04-28 21:45:16.807', NULL, NULL);
INSERT INTO pry_comentario VALUES (2, 1, 'Gracias', 'S', '9175e50a-53bb-4339-ba5b-c47f4abd977c', '9175e50a-53bb-4339-ba5b-c47f4abd977c', '2019-04-28 21:45:45.883', NULL, NULL);


--
-- Name: pry_comentario_id_comentario_seq; Type: SEQUENCE SET; Schema: public; Owner: micasa
--

SELECT pg_catalog.setval('pry_comentario_id_comentario_seq', 2, true);


--
-- Name: pry_proyecto_id_proyecto_seq; Type: SEQUENCE SET; Schema: public; Owner: micasa
--

SELECT pg_catalog.setval('pry_proyecto_id_proyecto_seq', 1, true);


--
-- Data for Name: pub_publicidad; Type: TABLE DATA; Schema: public; Owner: micasa
--

INSERT INTO pub_publicidad VALUES (4, 197, '2019-06-11', '2019-07-11', 63, 0, 7, 0, 'S', 'https://www.habitatnicaragua.org/', '/d4d1c1l8up/4/1f1d5cd4-84b2-4ee9-8eb1-944dfff7644f.png', '/d4d1c1l8up/4/60734e3c-1173-4870-ae80-05dcd6630259.png', '/d4d1c1l8up/4/89a4cb06-1cf5-41a8-8bfa-468de8dea24c.png', '123e4567-e89b-12d3-a456-426655440000', '2019-06-11 22:40:37.25', '123e4567-e89b-12d3-a456-426655440000', '2019-06-11 22:41:15.617');
INSERT INTO pub_publicidad VALUES (3, 197, '2019-02-01', '2021-04-28', 80, 0, 0, 0, 'S', 'https://concepto.de/publicidad/', NULL, '/d4d1c1l8up/3/68b3bca2-29b6-4ccd-8245-8f1b2e5c216f.png', '/d4d1c1l8up/3/42c027a5-7570-4c95-b0da-b388ecb9ef74.png', '123e4567-e89b-12d3-a456-426655440000', '2019-04-28 17:30:51.283', '123e4567-e89b-12d3-a456-426655440000', '2019-06-11 21:20:15.882');
INSERT INTO pub_publicidad VALUES (5, 198, '2019-06-14', '2019-07-14', 9, 0, 0, 0, 'S', 'https://www.habitat.org/lac-es', '/d4d1c1l8up/5/afb16108-d488-4f9d-8350-eb93f4125981.png', '/d4d1c1l8up/5/f6142c60-b73e-4ff9-a224-46fa5ad93fe4.png', NULL, '123e4567-e89b-12d3-a456-426655440000', '2019-06-14 18:06:29.311', '123e4567-e89b-12d3-a456-426655440000', '2019-06-14 18:06:29.311');
INSERT INTO pub_publicidad VALUES (2, 198, '2019-02-01', '2021-01-31', 234, 0, 1, 0, 'S', 'https://es.wikipedia.org/wiki/Publicidad', '/d4d1c1l8up/2/87b380d1-15d1-4b60-b760-7a3b53f33bab.png', '/d4d1c1l8up/2/02f2a19d-c2df-4ef5-88d2-73ca48e4738f.png', NULL, '123e4567-e89b-12d3-a456-426655440000', '2019-04-20 22:04:06.167', '123e4567-e89b-12d3-a456-426655440000', '2019-04-28 17:29:26.286');


--
-- Name: pub_publicidad_id_anuncio_seq; Type: SEQUENCE SET; Schema: public; Owner: micasa
--

SELECT pg_catalog.setval('pub_publicidad_id_anuncio_seq', 5, true);


--
-- Data for Name: seg_login; Type: TABLE DATA; Schema: public; Owner: micasa
--

INSERT INTO seg_login VALUES (1, '2019-06-11 05:08:21.611', 'hadmin@erpuno.com', '190.212.241.202', 'S');
INSERT INTO seg_login VALUES (2, '2019-06-11 17:35:10.297', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (3, '2019-06-11 17:36:09.068', 'tecnico@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (4, '2019-06-11 18:10:30.679', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (5, '2019-06-11 18:38:37.312', 'hadmin@erpuno.com', '186.77.136.134', 'S');
INSERT INTO seg_login VALUES (6, '2019-06-11 21:02:55.463', 'hadmin@erpuno.com', '186.77.139.38', 'S');
INSERT INTO seg_login VALUES (7, '2019-06-11 22:36:41.305', 'hadmin@erpuno.com', '186.77.139.38', 'S');
INSERT INTO seg_login VALUES (8, '2019-06-11 22:48:03.145', 'hadmin@erpuno.com', '186.77.139.38', 'S');
INSERT INTO seg_login VALUES (9, '2019-06-12 03:46:56.78', 'hadmin@erpuno.com', '190.212.247.64', 'S');
INSERT INTO seg_login VALUES (10, '2019-06-12 04:33:37.67', 'hadmin@erpuno.com', '190.212.247.64', 'S');
INSERT INTO seg_login VALUES (11, '2019-06-12 04:44:33.844', 'hadmin@erpuno.com', '190.212.247.64', 'S');
INSERT INTO seg_login VALUES (12, '2019-06-12 16:25:39.938', 'hadmin@erpuno.com', '186.77.138.20', 'S');
INSERT INTO seg_login VALUES (13, '2019-06-12 16:26:40.577', 'hadmin@erpuno.com', '186.77.138.20', 'S');
INSERT INTO seg_login VALUES (14, '2019-06-12 16:37:26.145', 'fundenuse@erpuno.com', '186.77.138.20', 'S');
INSERT INTO seg_login VALUES (15, '2019-06-13 13:36:07.592', 'cemex@erpuno.com', '190.212.243.41', 'S');
INSERT INTO seg_login VALUES (16, '2019-06-13 16:44:08.471', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (17, '2019-06-14 06:02:54.15', 'denisjtorresg@gmail.com', '186.77.224.125', 'S');
INSERT INTO seg_login VALUES (18, '2019-06-14 14:31:39.488', 'denisjtorresg@gmail.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (19, '2019-06-14 14:32:47.916', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (20, '2019-06-14 14:34:22.745', 'admintecnico@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (21, '2019-06-14 15:48:16.789', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (22, '2019-06-14 15:49:20.742', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'N');
INSERT INTO seg_login VALUES (23, '2019-06-14 15:49:34.293', 'cemex@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (24, '2019-06-14 15:49:54.237', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'N');
INSERT INTO seg_login VALUES (25, '2019-06-14 15:50:56.638', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (26, '2019-06-14 15:51:32.346', 'tecnico@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (27, '2019-06-14 15:52:14.241', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (28, '2019-06-14 15:52:51.687', 'admintecnico@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (29, '2019-06-14 16:03:52.432', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'N');
INSERT INTO seg_login VALUES (30, '2019-06-14 16:04:01.627', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (31, '2019-06-14 17:29:11.821', 'admintecnico@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (32, '2019-06-14 17:29:52.752', 'zespinoza@habitatnicaragua.org', '191.98.250.142', 'N');
INSERT INTO seg_login VALUES (33, '2019-06-14 17:52:16.082', 'hadmin@erpuno.com', '186.77.136.84', 'S');
INSERT INTO seg_login VALUES (34, '2019-06-14 18:16:08.725', 'hadmin@erpuno.com', '186.77.136.84', 'S');
INSERT INTO seg_login VALUES (35, '2019-06-14 18:31:34.582', 'hadmin@erpuno.com', '186.77.136.84', 'S');
INSERT INTO seg_login VALUES (36, '2019-06-14 19:27:13.914', 'denisjtorresg@gmail.com', '190.212.240.99', 'S');
INSERT INTO seg_login VALUES (37, '2019-06-14 23:43:40.243', 'hadmin@erpuno.com', '190.212.241.70', 'S');


--
-- Name: seg_login_id_login_seq; Type: SEQUENCE SET; Schema: public; Owner: micasa
--

SELECT pg_catalog.setval('seg_login_id_login_seq', 37, true);


--
-- Data for Name: seg_rol; Type: TABLE DATA; Schema: public; Owner: micasa
--

INSERT INTO seg_rol VALUES ('ADMIN', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO seg_rol VALUES ('MATERIAL', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO seg_rol VALUES ('FINANCIAMIENTO', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO seg_rol VALUES ('ADMIN_TECNICO', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO seg_rol VALUES ('TECNICO', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO seg_rol VALUES ('USUARIO', 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);


--
-- Data for Name: seg_rol_usuario; Type: TABLE DATA; Schema: public; Owner: micasa
--

INSERT INTO seg_rol_usuario VALUES ('123e4567-e89b-12d3-a456-426655440000', 'ADMIN');
INSERT INTO seg_rol_usuario VALUES ('0646f014-ec6e-4426-8147-8ccd08017328', 'MATERIAL');
INSERT INTO seg_rol_usuario VALUES ('0646f014-ec6e-4426-8147-8ccd08017328', 'USUARIO');
INSERT INTO seg_rol_usuario VALUES ('0126f013-ea6e-4426-8147-8ccd08017311', 'USUARIO');
INSERT INTO seg_rol_usuario VALUES ('9175e50a-53bb-4339-ba5b-c47f4abd977c', 'USUARIO');
INSERT INTO seg_rol_usuario VALUES ('9075e75b-53bb-4339-ba0b-c0004abd900c', 'USUARIO');
INSERT INTO seg_rol_usuario VALUES ('9075e75b-53bb-4339-ba0b-c0004abd900c', 'ADMIN_TECNICO');
INSERT INTO seg_rol_usuario VALUES ('9075e75b-53bb-4339-ba0b-c0004abd900c', 'TECNICO');
INSERT INTO seg_rol_usuario VALUES ('08d6246f-6831-4c46-b805-287dfd19c1d0', 'USUARIO');
INSERT INTO seg_rol_usuario VALUES ('08d6246f-6831-4c46-b805-287dfd19c1d0', 'TECNICO');
INSERT INTO seg_rol_usuario VALUES ('2e1e1951-6a8f-4987-8a62-f48641009171', 'FINANCIAMIENTO');
INSERT INTO seg_rol_usuario VALUES ('2e1e1951-6a8f-4987-8a62-f48641009171', 'USUARIO');
INSERT INTO seg_rol_usuario VALUES ('9994952c-ae59-47a3-a872-0ac946299acd', 'FINANCIAMIENTO');
INSERT INTO seg_rol_usuario VALUES ('9994952c-ae59-47a3-a872-0ac946299acd', 'USUARIO');
INSERT INTO seg_rol_usuario VALUES ('34f2a6a8-733f-4ce6-ae51-492752c57bb5', 'USUARIO');
INSERT INTO seg_rol_usuario VALUES ('34f2a6a8-733f-4ce6-ae51-492752c57bb5', 'MATERIAL');
INSERT INTO seg_rol_usuario VALUES ('2595db63-4958-4049-8968-909553407df0', 'USUARIO');


--
-- PostgreSQL database dump complete
--

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- PostgreSQL database dump complete
--

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

