update cat_maestro set nombre = 'MENSAJE_PROYECTO_POR_VISITAR' where tipo_catalogo='PARAMETRO_APP' and nombre = 'MENSAJE_PROYECTO_CREADO';

INSERT INTO public.cat_maestro 
(id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod, orden) 
VALUES 
(213, 'PARAMETRO_APP', 'MENSAJE_PROYECTO_POR_COTIZAR', 'En breve le estaremos enviando la cotización del servicio de ATC que solicitó. Revise la ficha de Mensajes en Mis proyectos.', 'S', '123e4567-e89b-12d3-a456-426655440000', '2019-08-16 23:27:12.773', NULL, NULL, 0);

SELECT pg_catalog.setval('public.cat_maestro_id_cat_maestro_seq', 213, true);
