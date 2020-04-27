CREATE OR REPLACE view vw_oferta as 
SELECT o.*, COALESCE(uo.tomadas, 0) tomadas
FROM oft_oferta o
LEFT JOIN (Select count(id_oferta) tomadas, id_oferta from oft_usar_oferta group by id_oferta) uo
	ON o.id_oferta = uo.id_oferta
WHERE (uo.tomadas IS NULL OR o.limite_cantidad > uo.tomadas OR o.limite_cantidad = 0) AND
 o.activo = 'S' AND
(o.inicio <= current_date AND o.fin >= current_date)
;


CREATE OR REPLACE view vw_proveedor as 
SELECT concat(u.id_usuario, '-', s.rol) id, u.*, ROUND(COALESCE(c.puntaje , 0)) puntaje, s.rol, COALESCE(OFT.CANT_OFERTAS, 0) AS CANT_OFERTAS
FROM public.per_usuario u
JOIN public.seg_rol_usuario s ON s.id_usuario = u.id_usuario and s.rol in ('FINANCIAMIENTO', 'MATERIAL')
LEFT JOIN (select avg(puntaje) puntaje, id_proveedor from public.per_calificacion where puntaje >= 0 group by id_proveedor) c
	ON c.id_proveedor = u.id_usuario
LEFT JOIN (
	SELECT COUNT(*) AS CANT_OFERTAS, O.DUENIO
	FROM vw_oferta o
	GROUP BY O.DUENIO
) OFT ON OFT.DUENIO = u.id_usuario
WHERE u.activo = 'S';


CREATE OR REPLACE view vw_actividad_usr_n2 as 
select u.id_usuario, u.nombres, u.correo, u.activo, MAX(DATE(COALESCE(c.fecha_mod, c.fecha_reg))) fecha_muro, 
	MAX(DATE(l.fecha)) fecha_login, MAX(DATE(COALESCE(c.fecha_mod, c.fecha_reg))) fecha_oferta
from PER_USUARIO u
JOIN seg_rol_usuario r ON r.id_usuario = u.id_usuario and r.rol in ('FINANCIAMIENTO', 'MATERIAL')
left join CMS_CONTENIDO c on c.duenio = u.id_usuario
left join SEG_LOGIN l on l.exitoso = 'S' and l.correo = u.correo
left join OFT_OFERTA o on o.duenio = u.id_usuario
group by u.id_usuario, u.nombres, u.correo, u.activo
;


