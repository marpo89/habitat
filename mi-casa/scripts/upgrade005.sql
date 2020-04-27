ALTER TABLE public.cat_maestro
  ADD COLUMN orden integer DEFAULT 0;

INSERT INTO public.cat_maestro 
(id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod, orden) 
VALUES 
(212, 'PROYECTO_ESTADO', 'EN DESARROLLO', NULL, 'S', 'hadmin', now(), NULL, NULL, 30);


SELECT pg_catalog.setval('public.cat_maestro_id_cat_maestro_seq', 212, true);

update public.cat_maestro  set orden = 10 where tipo_catalogo = 'PROYECTO_ESTADO' and nombre = 'COTIZANDO';
update public.cat_maestro  set orden = 20 where tipo_catalogo = 'PROYECTO_ESTADO' and nombre = 'PENDIENTE PAGO';
update public.cat_maestro  set orden = 40 where tipo_catalogo = 'PROYECTO_ESTADO' and nombre = 'VISITADO';
update public.cat_maestro  set orden = 50 where tipo_catalogo = 'PROYECTO_ESTADO' and nombre = 'TERMINADO';
update public.cat_maestro  set orden = 60 where tipo_catalogo = 'PROYECTO_ESTADO' and nombre = 'DESCARTADO';
update public.cat_maestro  set orden = 70 where tipo_catalogo = 'PROYECTO_ESTADO' and nombre = 'CANCELADO POR CLIENTE';
