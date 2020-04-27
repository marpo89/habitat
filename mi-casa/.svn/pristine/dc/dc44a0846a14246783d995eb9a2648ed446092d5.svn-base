--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cat_maestro; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cat_maestro (
    id_cat_maestro bigint NOT NULL,
    tipo_catalogo character varying(100) NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion text,
    activo character(1) DEFAULT 'S'::bpchar NOT NULL,
    usuario_reg character varying(100),
    fecha_reg timestamp without time zone,
    usuario_mod character varying(100),
    fecha_mod timestamp without time zone
);


--
-- Name: cat_maestro_id_cat_maestro_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cat_maestro_id_cat_maestro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cat_maestro_id_cat_maestro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cat_maestro_id_cat_maestro_seq OWNED BY cat_maestro.id_cat_maestro;


--
-- Name: cms_archivo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cms_archivo (
    id_archivo bigint NOT NULL,
    id_cms_tipo_archivo bigint NOT NULL,
    id_proyecto bigint,
    id_nodo bigint,
    titulo character varying(255),
    orden integer DEFAULT 0,
    youtube character varying(255),
    ruta character varying(1000),
    comentario text,
    activo character(1) DEFAULT 'S'::bpchar NOT NULL,
    usuario_reg character varying(100),
    fecha_reg timestamp without time zone,
    usuario_mod character varying(100),
    fecha_mod timestamp without time zone
);


--
-- Name: cms_archivo_id_archivo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cms_archivo_id_archivo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cms_archivo_id_archivo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cms_archivo_id_archivo_seq OWNED BY cms_archivo.id_archivo;


--
-- Name: cms_contenido; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cms_contenido (
    id_contenido bigint NOT NULL,
    titulo character varying(255) NOT NULL,
    contenido text,
    duenio character varying(40) NOT NULL,
    archivo character varying(1000),
    youtube character varying(255),
    usuario_reg character varying(100),
    fecha_reg timestamp without time zone,
    usuario_mod character varying(100),
    fecha_mod timestamp without time zone
);


--
-- Name: cms_contenido_id_contenido_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cms_contenido_id_contenido_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cms_contenido_id_contenido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cms_contenido_id_contenido_seq OWNED BY cms_contenido.id_contenido;


--
-- Name: cms_nodo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cms_nodo (
    id_nodo bigint NOT NULL,
    id_cms_tipo_nodo bigint NOT NULL,
    titulo character varying(255) NOT NULL,
    contenido text,
    activo character(1) DEFAULT 'S'::bpchar NOT NULL,
    enlace character varying(1000),
    sistema character(1) DEFAULT 'N'::bpchar,
    usuario_reg character varying(100),
    fecha_reg timestamp without time zone,
    usuario_mod character varying(100),
    fecha_mod timestamp without time zone
);


--
-- Name: cms_nodo_id_nodo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cms_nodo_id_nodo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cms_nodo_id_nodo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cms_nodo_id_nodo_seq OWNED BY cms_nodo.id_nodo;


--
-- Name: oft_oferta; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE oft_oferta (
    id_oferta bigint NOT NULL,
    duenio character varying(40) NOT NULL,
    titulo character varying(255),
    contenido text,
    inicio date,
    fin date,
    limite_cantidad integer,
    archivo1 character varying(1000),
    archivo2 character varying(1000),
    archivo3 character varying(1000),
    activo character(1) DEFAULT 'S'::bpchar NOT NULL,
    usuario_reg character varying(100),
    fecha_reg timestamp without time zone,
    usuario_mod character varying(100),
    fecha_mod timestamp without time zone
);


--
-- Name: oft_oferta_id_oferta_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE oft_oferta_id_oferta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oft_oferta_id_oferta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE oft_oferta_id_oferta_seq OWNED BY oft_oferta.id_oferta;


--
-- Name: oft_usar_oferta; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE oft_usar_oferta (
    id_usar_oferta bigint NOT NULL,
    id_oferta bigint NOT NULL,
    id_usuario character varying(40) NOT NULL,
    codigo character varying(255) NOT NULL,
    usuario_reg character varying(100),
    fecha_reg timestamp without time zone,
    usuario_mod character varying(100),
    fecha_mod timestamp without time zone
);


--
-- Name: oft_usar_oferta_id_usar_oferta_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE oft_usar_oferta_id_usar_oferta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oft_usar_oferta_id_usar_oferta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE oft_usar_oferta_id_usar_oferta_seq OWNED BY oft_usar_oferta.id_usar_oferta;


--
-- Name: per_calificacion; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE per_calificacion (
    id_calificacion bigint NOT NULL,
    puntaje integer DEFAULT 0 NOT NULL,
    comentario text,
    id_proveedor character varying(40) NOT NULL,
    id_autor character varying(40) NOT NULL,
    usuario_reg character varying(40) NOT NULL,
    fecha_reg timestamp without time zone,
    usuario_mod character varying(100),
    fecha_mod timestamp without time zone
);


--
-- Name: per_calificacion_id_calificacion_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE per_calificacion_id_calificacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: per_calificacion_id_calificacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE per_calificacion_id_calificacion_seq OWNED BY per_calificacion.id_calificacion;


--
-- Name: per_direccion; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE per_direccion (
    id_direccion bigint NOT NULL,
    id_usuario character varying(40) NOT NULL,
    nombre character varying(255),
    direccion text,
    id_localidad bigint,
    latitud double precision,
    longitud double precision,
    usuario_reg character varying(100),
    fecha_reg timestamp without time zone,
    usuario_mod character varying(100),
    fecha_mod timestamp without time zone
);


--
-- Name: per_direccion_id_direccion_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE per_direccion_id_direccion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: per_direccion_id_direccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE per_direccion_id_direccion_seq OWNED BY per_direccion.id_direccion;


--
-- Name: per_usuario; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE per_usuario (
    id_usuario character varying(40) NOT NULL,
    correo character varying(100) NOT NULL,
    clave character varying(100),
    activo character(1) DEFAULT 'N'::bpchar NOT NULL,
    codigo_activacion character varying(255),
    nombres character varying(255),
    fecha_nac date,
    sexo character(1),
    contacto character varying(255),
    telefonos character varying(255),
    direccion_fisica text,
    facebook character varying(300),
    twitter character varying(300),
    whatsapp character varying(255),
    sitio_web character varying(255),
    ir_perfil character(1) DEFAULT 'N'::bpchar,
    avatar character varying(255),
    usuario_reg character varying(100),
    fecha_reg timestamp without time zone,
    usuario_mod character varying(100),
    fecha_mod timestamp without time zone
);


--
-- Name: pry_comentario; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pry_comentario (
    id_comentario bigint NOT NULL,
    id_proyecto bigint NOT NULL,
    contenido text,
    activo character(1) DEFAULT 'S'::bpchar NOT NULL,
    id_comentarista character varying(40) NOT NULL,
    usuario_reg character varying(100) NOT NULL,
    fecha_reg timestamp without time zone,
    usuario_mod character varying(100),
    fecha_mod timestamp without time zone,
    visto character(1) DEFAULT 'N'::bpchar NOT NULL
);


--
-- Name: pry_comentario_id_comentario_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pry_comentario_id_comentario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pry_comentario_id_comentario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pry_comentario_id_comentario_seq OWNED BY pry_comentario.id_comentario;


--
-- Name: pry_proyecto; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pry_proyecto (
    id_proyecto bigint NOT NULL,
    descripcion text,
    id_pry_forma_pago bigint,
    id_banco bigint,
    fecha_pago date,
    comprobante character varying(255),
    espacios_mejora text,
    materiales_mejora text,
    presupuesto character(1),
    monto_presupuesto numeric(30,2),
    id_moneda bigint,
    tiene_albanil character(1),
    presente_visita character(1),
    nombre_per_atencion_visita character varying(255),
    fecha_hora_disponible text,
    id_estado bigint NOT NULL,
    id_pry_tipo_servicio bigint,
    usuario_duenio character varying(40),
    usuario_tecnico character varying(40),
    usuario_reg character varying(100),
    fecha_reg timestamp without time zone,
    usuario_mod character varying(100),
    fecha_mod timestamp without time zone
);


--
-- Name: pry_proyecto_id_proyecto_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pry_proyecto_id_proyecto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pry_proyecto_id_proyecto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pry_proyecto_id_proyecto_seq OWNED BY pry_proyecto.id_proyecto;


--
-- Name: pub_publicidad; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pub_publicidad (
    id_anuncio bigint NOT NULL,
    id_ubicacion_anuncio bigint NOT NULL,
    inicio date,
    fin date,
    impresiones bigint DEFAULT 0,
    max_impresiones bigint DEFAULT 0,
    clicks bigint DEFAULT 0,
    max_clicks bigint DEFAULT 0,
    activo character(1) DEFAULT 'N'::bpchar,
    enlace character varying(1000),
    archivo1 character varying(1000),
    archivo2 character varying(1000),
    archivo3 character varying(1000),
    usuario_reg character varying(100),
    fecha_reg timestamp without time zone,
    usuario_mod character varying(100),
    fecha_mod timestamp without time zone
);


--
-- Name: pub_publicidad_id_anuncio_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pub_publicidad_id_anuncio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pub_publicidad_id_anuncio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pub_publicidad_id_anuncio_seq OWNED BY pub_publicidad.id_anuncio;


--
-- Name: seg_login; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE seg_login (
    id_login bigint NOT NULL,
    fecha timestamp without time zone NOT NULL,
    correo character varying(100),
    ip character varying(100),
    exitoso character(1) DEFAULT 'N'::bpchar
);


--
-- Name: seg_login_id_login_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seg_login_id_login_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: seg_login_id_login_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE seg_login_id_login_seq OWNED BY seg_login.id_login;


--
-- Name: seg_rol; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE seg_rol (
    rol character varying(100) NOT NULL,
    usuario_reg character varying(100),
    fecha_reg timestamp without time zone,
    usuario_mod character varying(100),
    fecha_mod timestamp without time zone
);


--
-- Name: seg_rol_usuario; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE seg_rol_usuario (
    id_usuario character varying(40) NOT NULL,
    rol character varying(100) NOT NULL
);


--
-- Name: vw_oferta; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_oferta AS
    SELECT o.id_oferta, o.duenio, o.titulo, o.contenido, o.inicio, o.fin, o.limite_cantidad, o.archivo1, o.archivo2, o.archivo3, o.activo, o.usuario_reg, o.fecha_reg, o.usuario_mod, o.fecha_mod, COALESCE(uo.tomadas, (0)::bigint) AS tomadas FROM (oft_oferta o LEFT JOIN (SELECT count(oft_usar_oferta.id_oferta) AS tomadas, oft_usar_oferta.id_oferta FROM oft_usar_oferta GROUP BY oft_usar_oferta.id_oferta) uo ON ((o.id_oferta = uo.id_oferta))) WHERE (((((uo.tomadas IS NULL) OR (o.limite_cantidad > uo.tomadas)) OR (o.limite_cantidad = 0)) AND (o.activo = 'S'::bpchar)) AND ((o.inicio <= ('now'::text)::date) AND (o.fin >= ('now'::text)::date)));


--
-- Name: vw_proveedor; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_proveedor AS
    SELECT pg_catalog.concat(u.id_usuario, '-', s.rol) AS id, u.id_usuario, u.correo, u.clave, u.activo, u.codigo_activacion, u.nombres, u.fecha_nac, u.sexo, u.contacto, u.telefonos, u.direccion_fisica, u.facebook, u.twitter, u.whatsapp, u.sitio_web, u.ir_perfil, u.avatar, u.usuario_reg, u.fecha_reg, u.usuario_mod, u.fecha_mod, round(COALESCE(c.puntaje, (0)::numeric)) AS puntaje, s.rol, COALESCE(oft.cant_ofertas, (0)::bigint) AS cant_ofertas FROM (((per_usuario u JOIN seg_rol_usuario s ON ((((s.id_usuario)::text = (u.id_usuario)::text) AND ((s.rol)::text = ANY (ARRAY[('FINANCIAMIENTO'::character varying)::text, ('MATERIAL'::character varying)::text]))))) LEFT JOIN (SELECT avg(per_calificacion.puntaje) AS puntaje, per_calificacion.id_proveedor FROM per_calificacion WHERE (per_calificacion.puntaje >= 0) GROUP BY per_calificacion.id_proveedor) c ON (((c.id_proveedor)::text = (u.id_usuario)::text))) LEFT JOIN (SELECT count(*) AS cant_ofertas, o.duenio FROM vw_oferta o GROUP BY o.duenio) oft ON (((oft.duenio)::text = (u.id_usuario)::text))) WHERE (u.activo = 'S'::bpchar);


--
-- Name: id_cat_maestro; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cat_maestro ALTER COLUMN id_cat_maestro SET DEFAULT nextval('cat_maestro_id_cat_maestro_seq'::regclass);


--
-- Name: id_archivo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_archivo ALTER COLUMN id_archivo SET DEFAULT nextval('cms_archivo_id_archivo_seq'::regclass);


--
-- Name: id_contenido; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_contenido ALTER COLUMN id_contenido SET DEFAULT nextval('cms_contenido_id_contenido_seq'::regclass);


--
-- Name: id_nodo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_nodo ALTER COLUMN id_nodo SET DEFAULT nextval('cms_nodo_id_nodo_seq'::regclass);


--
-- Name: id_oferta; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY oft_oferta ALTER COLUMN id_oferta SET DEFAULT nextval('oft_oferta_id_oferta_seq'::regclass);


--
-- Name: id_usar_oferta; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY oft_usar_oferta ALTER COLUMN id_usar_oferta SET DEFAULT nextval('oft_usar_oferta_id_usar_oferta_seq'::regclass);


--
-- Name: id_calificacion; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY per_calificacion ALTER COLUMN id_calificacion SET DEFAULT nextval('per_calificacion_id_calificacion_seq'::regclass);


--
-- Name: id_direccion; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY per_direccion ALTER COLUMN id_direccion SET DEFAULT nextval('per_direccion_id_direccion_seq'::regclass);


--
-- Name: id_comentario; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pry_comentario ALTER COLUMN id_comentario SET DEFAULT nextval('pry_comentario_id_comentario_seq'::regclass);


--
-- Name: id_proyecto; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pry_proyecto ALTER COLUMN id_proyecto SET DEFAULT nextval('pry_proyecto_id_proyecto_seq'::regclass);


--
-- Name: id_anuncio; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pub_publicidad ALTER COLUMN id_anuncio SET DEFAULT nextval('pub_publicidad_id_anuncio_seq'::regclass);


--
-- Name: id_login; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY seg_login ALTER COLUMN id_login SET DEFAULT nextval('seg_login_id_login_seq'::regclass);


--
-- Data for Name: cat_maestro; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cat_maestro (id_cat_maestro, tipo_catalogo, nombre, descripcion, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) FROM stdin;
1	ID_CMS_TIPO_NODO	PAGINA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
2	ID_CMS_TIPO_NODO	FOLDER_BIBLIOTECA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
52	ID_CMS_TIPO_NODO	ENLACES	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
6	ID_ESPACIO_VIVIENDA	Porche	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
7	ID_ESPACIO_VIVIENDA	Sala	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
8	ID_ESPACIO_VIVIENDA	Cocina	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
9	ID_ESPACIO_VIVIENDA	Comedor	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
10	ID_ESPACIO_VIVIENDA	Unidad sanitaria	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
11	ID_ESPACIO_VIVIENDA	Dormitorio	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
12	ID_ESPACIO_VIVIENDA	Terraza	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
13	ID_ESPACIO_VIVIENDA	Garaje	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
14	ID_ESPACIO_VIVIENDA	Bodega	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
15	ID_ESPACIO_VIVIENDA	Área de trabajo	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
16	ID_ESPACIO_VIVIENDA	Área de uso múltiple	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
17	ID_TIPO_MATERIAL	Bloques de concreto	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
18	ID_TIPO_MATERIAL	Ladrillo de barro	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
19	ID_TIPO_MATERIAL	Piedra cantera	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
20	ID_TIPO_MATERIAL	Bloques de adobe	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
21	ID_TIPO_MATERIAL	Loseta prefabricada	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
22	ID_TIPO_MATERIAL	Madera	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
23	ID_TIPO_MATERIAL	Plycem	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
24	ID_TIPO_MATERIAL	Gypsum	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
25	ID_TIPO_MATERIAL	Plywood	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
26	ID_TIPO_MATERIAL	Fibrán	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
27	ID_TIPO_MATERIAL	PVC	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
28	ID_TIPO_MATERIAL	Zinc	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
29	ID_TIPO_MATERIAL	Teja metálica	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
30	ID_TIPO_MATERIAL	Perlines 2x4	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
31	ID_TIPO_MATERIAL	Sistema MD2	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
32	ID_TIPO_MATERIAL	Sistema blocón	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
33	ID_TIPO_MATERIAL	Covintec	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
34	ID_TIPO_MATERIAL	Ladrillo cerámica	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
35	ID_TIPO_MATERIAL	Porcelanato	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
36	ID_TIPO_MATERIAL	Ladrillo de cemento	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
37	ID_TIPO_MATERIAL	Azulejos	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
38	ID_TIPO_MATERIAL	Aluminio y vidrio	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
39	ID_TIPO_MATERIAL	PVC y vidrio	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
40	ID_TIPO_MATERIAL	Madera y vidrio	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
41	ID_MONEDA	CORDOBA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
42	ID_MONEDA	DOLAR	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
45	PARAMETRO_APP	CORREO_NUEVA_CUENTA_ASUNTO	Activación de usuario en Mi-Casa	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
47	PARAMETRO_APP	CORREO_NUEVA_CONTRASENIA_ASUNTO	Recuperación de contraseña en Mi Casa	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
53	PARAMETRO_APP	GOOGLE_ANALYTICS_CODE	UA-128708124-1	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
55	PARAMETRO_APP	RUTA_WEB_ARCHIVOS	http://localhost/mi-casa	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
196	PARAMETRO_APP	MENSAJE_PROYECTO_CREADO	¡Gracias! Un técnico le contactará en las próximas 24 horas hábiles.	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
49	ID_CMS_TIPO_ARCHIVO	YOUTUBE	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
50	ID_CMS_TIPO_ARCHIVO	ENLACE	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
51	ID_CMS_TIPO_ARCHIVO	ARCHIVO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
194	ID_CMS_TIPO_ARCHIVO	VIDEO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
56	ID_LOCALIDAD	BOACO : BOACO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
57	ID_LOCALIDAD	BOACO : CAMOAPA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
58	ID_LOCALIDAD	BOACO : SAN JOSE DE LOS REMATES	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
59	ID_LOCALIDAD	BOACO : SAN LORENZO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
60	ID_LOCALIDAD	BOACO : SANTA LUCIA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
61	ID_LOCALIDAD	BOACO : TEUSTEPE	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
62	ID_LOCALIDAD	CARAZO : DIRIAMBA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
63	ID_LOCALIDAD	CARAZO : EL ROSARIO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
64	ID_LOCALIDAD	CARAZO : JINOTEPE	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
65	ID_LOCALIDAD	CARAZO : LA CONQUISTA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
66	ID_LOCALIDAD	CARAZO : LA PAZ DE CARAZO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
67	ID_LOCALIDAD	CARAZO : SAN MARCOS	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
68	ID_LOCALIDAD	CARAZO : SANTA TERESA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
69	ID_LOCALIDAD	CHINANDEGA : CHINANDEGA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
70	ID_LOCALIDAD	CHINANDEGA : CINCO PINOS	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
71	ID_LOCALIDAD	CHINANDEGA : EL REALEJO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
72	ID_LOCALIDAD	CHINANDEGA : EL VIEJO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
73	ID_LOCALIDAD	CHINANDEGA : POSOLTEGA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
74	ID_LOCALIDAD	CHINANDEGA : SAN FRANCISCO DEL NORTE	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
75	ID_LOCALIDAD	CHINANDEGA : SAN PEDRO DEL NORTE	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
76	ID_LOCALIDAD	CHINANDEGA : SANTO TOMAS DEL NORTE	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
77	ID_LOCALIDAD	CHINANDEGA : SOMOTILLO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
78	ID_LOCALIDAD	CHINANDEGA : TONALA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
43	PARAMETRO_APP	CORREO_NOTIFICACION_FROM	no.contesar@micasa.com.ni	S	hadmin	2019-06-11 05:06:27.520173	123e4567-e89b-12d3-a456-426655440000	2019-06-29 22:40:20.283
46	PARAMETRO_APP	CORREO_NUEVA_CONTRASENIA	Hola\n\nEsta es su nueva contraseña de Mi Casa:\n\n{{CLAVE}}\n\nUsted puede cambiarla desde el menú Mi Perfil.\n  \nPara cualquier consulta por favor escribir a info@micasa.com.ni\n\nUn saludo,\n\nEl equipo de Habitat Nicaragua	S	hadmin	2019-06-11 05:06:27.520173	123e4567-e89b-12d3-a456-426655440000	2019-06-29 22:41:32.494
79	ID_LOCALIDAD	CHINANDEGA : VILLANUEVA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
80	ID_LOCALIDAD	CHONTALES : ACOYAPA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
81	ID_LOCALIDAD	CHONTALES : COMALAPA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
82	ID_LOCALIDAD	CHONTALES : JUIGALPA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
83	ID_LOCALIDAD	CHONTALES : LA LIBERTAD	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
84	ID_LOCALIDAD	CHONTALES : SAN PEDRO DE LOVAGO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
85	ID_LOCALIDAD	CHONTALES : SANTO DOMINGO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
86	ID_LOCALIDAD	CHONTALES : SANTO TOMAS	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
87	ID_LOCALIDAD	CHONTALES : VILLA SANDINO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
88	ID_LOCALIDAD	ESTELI : CONDEGA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
89	ID_LOCALIDAD	ESTELI : ESTELI	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
90	ID_LOCALIDAD	ESTELI : LA TRINIDAD	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
91	ID_LOCALIDAD	ESTELI : PUEBLO NUEVO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
92	ID_LOCALIDAD	ESTELI : SAN JUAN DE LIMAY	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
93	ID_LOCALIDAD	ESTELI : SAN NICOLAS	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
94	ID_LOCALIDAD	GRANADA : DIRIOMO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
95	ID_LOCALIDAD	GRANADA : GRANADA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
96	ID_LOCALIDAD	GRANADA : NANDAIME	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
97	ID_LOCALIDAD	JINOTEGA : CUA BOCAY	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
98	ID_LOCALIDAD	JINOTEGA : JINOTEGA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
99	ID_LOCALIDAD	JINOTEGA : LA CONCORDIA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
100	ID_LOCALIDAD	JINOTEGA : LAS PADRERAS	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
101	ID_LOCALIDAD	JINOTEGA : SAN RAFAEL DEL NORTE	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
102	ID_LOCALIDAD	JINOTEGA : SAN SEBASTIAN DE YALI	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
103	ID_LOCALIDAD	JINOTEGA : WIWILLI	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
104	ID_LOCALIDAD	LEON : ACHUAPA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
105	ID_LOCALIDAD	LEON : EL JICARAL	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
106	ID_LOCALIDAD	LEON : EL SAUCE	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
107	ID_LOCALIDAD	LEON : LA PAZ CENTRO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
108	ID_LOCALIDAD	LEON : LEON	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
109	ID_LOCALIDAD	LEON : MALPAISILLO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
110	ID_LOCALIDAD	LEON : NAGAROTE	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
111	ID_LOCALIDAD	LEON : QUEZALGUAQUE	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
112	ID_LOCALIDAD	LEON : SAN JOSE DE ACHUAPA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
113	ID_LOCALIDAD	LEON : SANTA ROSA DEL PENON	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
114	ID_LOCALIDAD	LEON : TELICA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
115	ID_LOCALIDAD	MADRIZ : LAS SABANAS	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
116	ID_LOCALIDAD	MADRIZ : PALACAGUINA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
117	ID_LOCALIDAD	MADRIZ : SAN JOSE DE CUSMAPA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
118	ID_LOCALIDAD	MADRIZ : SAN JUAN DE RIO COCO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
119	ID_LOCALIDAD	MADRIZ : SAN LUCAS	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
120	ID_LOCALIDAD	MADRIZ : SOMOTO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
121	ID_LOCALIDAD	MADRIZ : TOTOGALPA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
122	ID_LOCALIDAD	MADRIZ : YALAGUINA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
123	ID_LOCALIDAD	MANAGUA : CIUDAD SANDINO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
124	ID_LOCALIDAD	MANAGUA : MANAGUA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
125	ID_LOCALIDAD	MANAGUA : SAN FRANCISCO LIBRE	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
126	ID_LOCALIDAD	MANAGUA : SAN RAFAEL DEL SUR	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
127	ID_LOCALIDAD	MANAGUA : TICUANTEPE	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
128	ID_LOCALIDAD	MANAGUA : VILLA CARLOS FONSECA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
129	ID_LOCALIDAD	MASAYA : CATARINA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
130	ID_LOCALIDAD	MASAYA : LA CONCEPCION	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
131	ID_LOCALIDAD	MASAYA : MASATEPE	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
132	ID_LOCALIDAD	MASAYA : MASAYA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
133	ID_LOCALIDAD	MASAYA : NIQUINOHOMO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
134	ID_LOCALIDAD	MASAYA : TISMA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
135	ID_LOCALIDAD	MATAGALPA : CIUDAD DARIO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
136	ID_LOCALIDAD	MATAGALPA : ESQUIPULAS	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
137	ID_LOCALIDAD	MATAGALPA : MATAGALPA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
138	ID_LOCALIDAD	MATAGALPA : MATIGUASS	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
139	ID_LOCALIDAD	MATAGALPA : MUY-MUY	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
140	ID_LOCALIDAD	MATAGALPA : RANCHO GRANDES	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
141	ID_LOCALIDAD	MATAGALPA : RIO BLANCOS	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
142	ID_LOCALIDAD	MATAGALPA : SAN DIONISIO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
143	ID_LOCALIDAD	MATAGALPA : SAN ISIDRO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
144	ID_LOCALIDAD	MATAGALPA : SAN RAMON	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
145	ID_LOCALIDAD	MATAGALPA : SEBACO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
146	ID_LOCALIDAD	MATAGALPA : TERRABONA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
147	ID_LOCALIDAD	MATAGALPA : TUMA LA DALIA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
148	ID_LOCALIDAD	NUEVA SEGOVIA : CIUDAD ANTIGUA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
149	ID_LOCALIDAD	NUEVA SEGOVIA : DIPILTO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
150	ID_LOCALIDAD	NUEVA SEGOVIA : JALAPA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
151	ID_LOCALIDAD	NUEVA SEGOVIA : MURRA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
152	ID_LOCALIDAD	NUEVA SEGOVIA : OCOTAL	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
153	ID_LOCALIDAD	NUEVA SEGOVIA : QUILALI	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
154	ID_LOCALIDAD	NUEVA SEGOVIA : SAN FERNANDO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
155	ID_LOCALIDAD	NUEVA SEGOVIA : SANTA MARIA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
156	ID_LOCALIDAD	RAAN : BONANZA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
157	ID_LOCALIDAD	RAAN : PUERTO CABEZAS	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
158	ID_LOCALIDAD	RAAN : ROSITA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
159	ID_LOCALIDAD	RAAN : SIUNA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
160	ID_LOCALIDAD	RAAN : WASLALA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
161	ID_LOCALIDAD	RAAN : WASPAN	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
162	ID_LOCALIDAD	RAAS : BLUEFIELDSS	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
163	ID_LOCALIDAD	RAAS : CORN ISLANDS	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
164	ID_LOCALIDAD	RAAS : EL RAMA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
165	ID_LOCALIDAD	RAAS : KUKRA HILL	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
166	ID_LOCALIDAD	RAAS : LA CRUZ DE RIO GRANDE	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
167	ID_LOCALIDAD	RAAS : LAGUNA DE PERLAS	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
168	ID_LOCALIDAD	RAAS : MUELLE DE LOS BUEYES	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
169	ID_LOCALIDAD	RAAS : NUEVA GUINEA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
170	ID_LOCALIDAD	RAAS : PAIWAS	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
171	ID_LOCALIDAD	RIO SAN JUAN : BOCA DE SABALOS	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
172	ID_LOCALIDAD	RIO SAN JUAN : EL ALMENDRO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
173	ID_LOCALIDAD	RIO SAN JUAN : MORRITO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
174	ID_LOCALIDAD	RIO SAN JUAN : SAN CARLOS	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
175	ID_LOCALIDAD	RIO SAN JUAN : SAN JUAN DEL NORTE	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
176	ID_LOCALIDAD	RIO SAN JUAN : SAN MIGUELITO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
177	ID_LOCALIDAD	RIVAS : ALTAGRACIA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
178	ID_LOCALIDAD	RIVAS : BELEN	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
179	ID_LOCALIDAD	RIVAS : BUENOS AIRES	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
180	ID_LOCALIDAD	RIVAS : CARDENAS	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
181	ID_LOCALIDAD	RIVAS : MOYOGALPA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
182	ID_LOCALIDAD	RIVAS : POTOSI	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
183	ID_LOCALIDAD	RIVAS : RIVAS	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
184	ID_LOCALIDAD	RIVAS : SAN JORGE	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
185	ID_LOCALIDAD	RIVAS : TOLA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
186	ID_BANCO	BANCO DE AMERICA CENTRAL (BAC)	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
187	ID_BANCO	BANCO CENTROAMERICANO (BANCENTRO)	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
188	PROYECTO_ESTADO	CREADO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
189	PROYECTO_ESTADO	EN GESTION	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
190	PROYECTO_ESTADO	VISITADO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
191	PROYECTO_ESTADO	TERMINADO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
192	PROYECTO_ESTADO	DESCARTADO	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
193	PROYECTO_ESTADO	CANCELADO POR CLIENTE	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
197	ID_UBICACION_PUBLICIDAD	PORTADA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
198	ID_UBICACION_PUBLICIDAD	INTERNA	\N	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
199	PARAMETRO_APP	CONDICIONES_TOMAR_OFERTA	Al generar un cupón para esta oferta, usted acepta los términos y condiciones de la misma. Y se da por enterado que pueden aplicar algunas restricciones no detalladas explícitamente.	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
200	PARAMETRO_APP	CORREO_NOTIFICAR_NUEVO_PROYECTO	Hola\r\n\r\nPor este medio se le informa que un nuevo proyecto (#{{CODIGO}}) se ha registrado en la App MiCasa, por favor su atención.\r\n\r\nSaludos	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
203	PARAMETRO_APP	CORREO_NOTIFICAR_NUEVO_PROYECTO_ASUNTO	Nueva Cita de Proyecto	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
201	PARAMETRO_APP	CORREO_NOTIFICAR_NUEVA_ASIGNACION	Hola\r\n\r\nPor este medio se le informa que el proyecto #{{CODIGO}} se ha asignado a usted, por favor su atención.\r\n\r\nSaludos.	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
204	PARAMETRO_APP	CORREO_NOTIFICAR_NUEVA_ASIGNACION_ASUNTO	Proyecto Asignado	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
202	PARAMETRO_APP	CORREO_NOTIFICAR_NUEVO_COMENTARIO	Hola\r\n\r\nHay un nuevo comentario en el proyecto #{{CODIGO}}:\r\n\r\n{{AUTOR}} dijo:\r\n\r\n"{{COMENTARIO}}"\r\n\r\nPuede ver el comentario completo en la App MiCasa.\r\n\r\nSaludos.	S	hadmin	2019-06-11 05:06:27.520173	\N	\N
48	PARAMETRO_APP	PIE_DE_PAGINA	Mi Casa es un servicio soportado por <a target="_blank" href="http://www.habitatnicaragua.org">Hábitat para la Humanidad Nicaragua</a> | \n\t\t<a target="_blank" href="https://www.facebook.com/micasa.com.ni/"><i class="fa fa-facebook-official fa-2"></i></a> | \n\t\t<a target="_blank" href="https://www.instagram.com/micasa.com.ni/"><i class="fa fa-instagram fa-2"></i></a>	S	hadmin	2019-06-11 05:06:27.520173	123e4567-e89b-12d3-a456-426655440000	2019-06-11 19:25:55.496
205	PARAMETRO_APP	CORREO_NOTIFICAR_NUEVO_COMENTARIO_ASUNTO	Nuevo Comentario	S	hadmin	2019-06-11 05:06:27.520173	123e4567-e89b-12d3-a456-426655440000	2019-06-19 02:45:15.426
54	PARAMETRO_APP	RUTA_LOCAL_ARCHIVOS	/home/archivos_micasa_com_ni	S	hadmin	2019-06-11 05:06:27.520173	123e4567-e89b-12d3-a456-426655440000	2019-06-29 17:08:43.131
44	PARAMETRO_APP	CORREO_NUEVA_CUENTA	Hola\n\nGracias por suscribirse a Mi Casa.\n\nPara activar su cuenta por favor ingrese al siguiente enlace:\n\nhttp://www.micasa.com.ni/publico/activarCuenta/{{CODIGO}}\n\nPara cualquier consulta por favor escribir a info@micasa.com.ni\n\nUn saludo,\n\nEl equipo de Habitat Nicaragua	S	hadmin	2019-06-11 05:06:27.520173	123e4567-e89b-12d3-a456-426655440000	2019-06-29 22:38:51.203
206	PARAMETRO_APP	EXTRA_META_NAME_1	_globalsign-domain-verification	S	123e4567-e89b-12d3-a456-426655440000	2019-07-11 22:00:18.797	\N	\N
207	PARAMETRO_APP	EXTRA_META_CONTENT_1	GxpuRs-maXKyqvlyrJHrarKrES8SwpGf-u3yn2E2P6	S	123e4567-e89b-12d3-a456-426655440000	2019-07-11 22:00:52.627	123e4567-e89b-12d3-a456-426655440000	2019-07-12 08:41:31.09
\.


--
-- Name: cat_maestro_id_cat_maestro_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cat_maestro_id_cat_maestro_seq', 207, true);


--
-- Data for Name: cms_archivo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cms_archivo (id_archivo, id_cms_tipo_archivo, id_proyecto, id_nodo, titulo, orden, youtube, ruta, comentario, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) FROM stdin;
19	49	\N	7	Servicios de asistencia técnica en construcción	6	LfjgIPqjDIY			S	hadmin	2019-06-10 06:43:54.852107	\N	\N
15	49	\N	4	Tips para la contratación de mano de obra	1	mVsTZDEaXb4			S	hadmin	2019-06-10 06:43:54.852107	\N	\N
17	50	\N	4	Proveedores de materiales de construcción y mano de obra	2		/usuario/listaProveedores.xhtml?rol=material		S	hadmin@erpuno.com	2019-06-10 06:43:54.852107	\N	\N
18	194	\N	7	Historia de Habitat	0		/nodos/7/4ae75c53-c3a5-4d38-a948-0d763373247c.mp4		S	hadmin	2019-06-10 06:43:54.852107	\N	\N
21	50	\N	8	Paso 1: Cree su perfil	1		/usuario/miPerfil.xhtml		S	123e4567-e89b-12d3-a456-426655440000	2019-06-10 22:02:16.405	\N	\N
22	50	\N	8	Paso 2: Realice el pago del servicio	2		/publico/pagina.xhtml?p=6		S	123e4567-e89b-12d3-a456-426655440000	2019-06-10 22:03:08.01	\N	\N
23	50	\N	8	Paso 3: Programe su visita	3		/proyecto/miProyectoForm.xhtml		S	123e4567-e89b-12d3-a456-426655440000	2019-06-10 22:04:31.374	123e4567-e89b-12d3-a456-426655440000	2019-06-10 22:04:41.84
35	51	3	\N	Plano_de_Proyecto.jpg	0	\N	/proyectos/3/7f21eaa7-b98d-4b72-bf16-247d0afc1778.jpg	\N	S	08d6246f-6831-4c46-b805-287dfd19c1d0	2019-06-21 02:46:31.513	\N	\N
3	49	\N	2	Paso 1: Planifique la mejora de su vivienda	1	KT3zbBk6aFY			S	hadmin	2019-06-10 06:43:54.852107	123e4567-e89b-12d3-a456-426655440000	2019-06-11 18:43:38.874
4	49	\N	2	Paso 2: Presupuesto	2	hEmkjrxI4Lg			S	hadmin	2019-06-10 06:43:54.852107	123e4567-e89b-12d3-a456-426655440000	2019-06-11 18:44:15.297
5	49	\N	2	Paso 3: Mano de obra	3	eqva1Tkv-YI			S	hadmin	2019-06-10 06:43:54.852107	123e4567-e89b-12d3-a456-426655440000	2019-06-11 18:44:41.112
6	49	\N	2	Paso 4: Materiales de construcción	4	T3CyNQHHCgk			S	hadmin	2019-06-10 06:43:54.852107	123e4567-e89b-12d3-a456-426655440000	2019-06-11 18:44:59.563
24	50	\N	8	Paso 4: Revise su proyecto	4		/proyecto/misProyectos.xhtml		S	123e4567-e89b-12d3-a456-426655440000	2019-06-10 22:05:49.947	123e4567-e89b-12d3-a456-426655440000	2019-06-28 04:19:52.259
26	49	\N	7	Curso Construcción Segura	0	T6ZCPbaMOYU			S	123e4567-e89b-12d3-a456-426655440000	2019-06-11 19:31:01.867	\N	\N
7	50	\N	2	Paso 5: Asistencia técnica para la construcción	5		/proyecto/asistencia.xhtml		S	hadmin	2019-06-10 06:43:54.852107	123e4567-e89b-12d3-a456-426655440000	2019-06-14 23:45:37.688
11	49	\N	3	Crédito como Estrategia Financiera	2	bi9YbPlgpE4			S	hadmin	2019-06-10 06:43:54.852107	123e4567-e89b-12d3-a456-426655440000	2019-06-18 22:38:15.52
20	49	\N	8	Contratar Servicio de Asistencia Técnica	0	6hJsVMmhxvI			S	123e4567-e89b-12d3-a456-426655440000	2019-06-10 22:00:30.198	123e4567-e89b-12d3-a456-426655440000	2019-06-18 20:36:05.009
27	51	2	\N	Imagen1.jpg	0	\N	/proyectos/2/83a2539d-082c-413e-b496-26219b575ec8.jpg	\N	S	9075e75b-53bb-4339-ba0b-c0004abd900c	2019-06-18 21:06:56.872	\N	\N
28	51	2	\N	Libro1.pdf	0	\N	/proyectos/2/7e40bffe-d9d5-45b7-92c5-f349fe4bf51c.pdf	\N	N	9075e75b-53bb-4339-ba0b-c0004abd900c	2019-06-18 21:38:57.289	9075e75b-53bb-4339-ba0b-c0004abd900c	2019-06-18 21:39:01.54
29	51	2	\N	Especificaciones_tecnica.pdf	0	\N	/proyectos/2/d31adb72-77a5-43ba-8b95-856240352a77.pdf	\N	S	9075e75b-53bb-4339-ba0b-c0004abd900c	2019-06-18 21:39:29.247	\N	\N
30	50	\N	6	Precios de Nuestros Servicios	1		/nodos/6/17dd95b8-2f15-47b5-b021-01a89fb150d7.png		S	123e4567-e89b-12d3-a456-426655440000	2019-06-18 22:24:04.966	123e4567-e89b-12d3-a456-426655440000	2019-06-18 22:34:06.974
2	49	\N	2	Pasos para un Proyecto Exitoso	0	le1ANsJa9Po			S	hadmin	2019-06-10 06:43:54.852107	123e4567-e89b-12d3-a456-426655440000	2019-06-19 16:35:33.297
31	51	4	\N	recoleccion_de_agua_de_lluvia.pdf	0	\N	/proyectos/4/09e4345c-2dd4-4339-9cf4-ca363fcf753a.pdf	\N	S	08d6246f-6831-4c46-b805-287dfd19c1d0	2019-06-19 18:24:35.646	\N	\N
32	51	4	\N	100_3727.JPG	0	\N	/proyectos/4/94496db3-7f63-4e9d-985a-2b372f04c5bb.JPG	\N	S	08d6246f-6831-4c46-b805-287dfd19c1d0	2019-06-19 18:28:30.455	\N	\N
33	51	4	\N	homero.png	0	\N	/proyectos/4/a7111631-1980-4b41-a0fc-bd276292dd87.png	\N	S	08d6246f-6831-4c46-b805-287dfd19c1d0	2019-06-19 18:29:09.267	\N	\N
13	49	\N	3	Presupuesto y Disponibilidad Financiera	1	G0cf0znZcmY			S	hadmin	2019-06-10 06:43:54.852107	123e4567-e89b-12d3-a456-426655440000	2019-06-19 20:16:49.512
12	49	\N	3	Ahorro como Estrategia Financiera	3	QjmzSuPRy5E			S	hadmin	2019-06-10 06:43:54.852107	123e4567-e89b-12d3-a456-426655440000	2019-06-19 20:17:27.811
16	50	\N	3	Financiamiento Disponible	4		/usuario/listaProveedores.xhtml?rol=financiamiento		S	hadmin@erpuno.com	2019-06-10 06:43:54.852107	123e4567-e89b-12d3-a456-426655440000	2019-06-19 20:17:40.013
34	49	\N	3	Como Financiar Mi Proyecto	0	G0cf0znZcmY			S	123e4567-e89b-12d3-a456-426655440000	2019-06-19 20:16:17.221	123e4567-e89b-12d3-a456-426655440000	2019-06-19 20:18:01.662
1	49	\N	1	Video portada	0	zENBgVJmd-w		Video Portada	S	hadmin	2019-06-10 06:43:54.852107	123e4567-e89b-12d3-a456-426655440000	2019-07-03 17:24:24.351
14	49	\N	4	Tips para selección y compra de materiales	0	lA_6MbZau6k			S	hadmin	2019-06-10 06:43:54.852107	123e4567-e89b-12d3-a456-426655440000	2019-07-03 20:11:56.471
36	49	\N	9	Video del Curso de Construcción Segura (en producción)	1	BRcIKCbfRac		Video del Curso de Construcción Segura (en producción)	S	123e4567-e89b-12d3-a456-426655440000	2019-07-11 08:35:24.757	123e4567-e89b-12d3-a456-426655440000	2019-07-11 08:42:51.558
37	51	\N	9	Guía para la Autoconstrucción de Vivienda en Madera (PDF español)	2	i--tg5EF	/nodos/9/ddb89abe-0f18-4891-a17f-01185302396c.pdf		S	123e4567-e89b-12d3-a456-426655440000	2019-07-11 08:37:20.119	123e4567-e89b-12d3-a456-426655440000	2019-07-11 08:46:09.234
38	51	\N	9	Guía para la Autoconstrucción de Vivienda en Madera (PDF Miskito)	3	i--tg5EF	/nodos/9/c86a861c-26d8-4398-aaed-5bdb17bb881c.pdf		S	123e4567-e89b-12d3-a456-426655440000	2019-07-11 08:37:39.999	123e4567-e89b-12d3-a456-426655440000	2019-07-11 08:46:39.909
39	51	\N	9	Enlaces a sitios donde se puede encontrar otros recursos (tutoriales, sistemas constructivos, etc.)	4	i--tg5EF	/nodos/9/0b12dc17-635e-438c-9966-49fbdd0d2f38.pdf		S	123e4567-e89b-12d3-a456-426655440000	2019-07-11 08:38:30.569	123e4567-e89b-12d3-a456-426655440000	2019-07-11 08:50:07.162
40	51	\N	10	Presupuesto familiar y gastos	1		/nodos/10/9954078a-1dd5-46bf-9ae8-056a326956b8.xls		S	123e4567-e89b-12d3-a456-426655440000	2019-07-11 08:53:43.16	123e4567-e89b-12d3-a456-426655440000	2019-07-11 08:58:19.571
41	49	\N	11	Tenencia de la tierra	1	EDzC-PXKqwU			S	123e4567-e89b-12d3-a456-426655440000	2019-07-11 09:03:07.615	\N	\N
42	49	\N	11	FIRMA MUNICIPIO CAPITAL CONVENIO PARA DAR SEGURIDAD LEGAL EN TENENCIA DE LA TIERRA	2	EYyGq7ggxks			S	123e4567-e89b-12d3-a456-426655440000	2019-07-11 09:03:57.262	\N	\N
43	49	\N	11	No existe seguridad en la tenencia de la tierra	0	CPwWXPVDvJI			S	123e4567-e89b-12d3-a456-426655440000	2019-07-11 09:06:48.052	\N	\N
44	50	\N	11	Tenencia de la tierra- formas predominantes	3		http://www.fao.org/gender-landrights-database/country-profiles/listcountries/landtenureandrelatedinstitutions/es/?country_iso3=NIC		S	123e4567-e89b-12d3-a456-426655440000	2019-07-11 09:08:58.575	\N	\N
\.


--
-- Name: cms_archivo_id_archivo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cms_archivo_id_archivo_seq', 44, true);


--
-- Data for Name: cms_contenido; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cms_contenido (id_contenido, titulo, contenido, duenio, archivo, youtube, usuario_reg, fecha_reg, usuario_mod, fecha_mod) FROM stdin;
1	Ecofiltro	<p>Obtén 10% de descuento sobre el precio del Ecofiltro al realizar tu compra con el financiamiento de FUNDENUSE. Promoción válida para clientes de sucursal Estelí y Ocotal.</p>	9994952c-ae59-47a3-a872-0ac946299acd	/contenido2/1/b5acbf15-4daa-4155-ae37-9af926c11dc1.jpg		9994952c-ae59-47a3-a872-0ac946299acd	2019-06-12 16:40:42.99	9994952c-ae59-47a3-a872-0ac946299acd	2019-06-12 16:40:42.99
2	Ya llegó CEMEX		0646f014-ec6e-4426-8147-8ccd08017328	\N	TuidkzEfU3I	0646f014-ec6e-4426-8147-8ccd08017328	2019-06-15 04:30:44.052	\N	\N
4	Prueba	<p><a href="https://www.youtube.com/watch?v=pOefbmyGdmM">https://www.youtube.com/watch?v=pOefbmyGdmM</a></p>	0646f014-ec6e-4426-8147-8ccd08017328	\N	pOefbmyGdmM	0646f014-ec6e-4426-8147-8ccd08017328	2019-06-18 21:54:34.316	0646f014-ec6e-4426-8147-8ccd08017328	2019-06-18 22:09:05.29
6	Contenido de Validación	<h1>Hábitat Nicaragua</h1> \n<p>Hábitat for Humanity</p>	34f2a6a8-733f-4ce6-ae51-492752c57bb5	\N	LSNUq_1apIM	34f2a6a8-733f-4ce6-ae51-492752c57bb5	2019-06-18 22:01:48.482	34f2a6a8-733f-4ce6-ae51-492752c57bb5	2019-06-19 00:19:19.817
7	Servicio de Asistencia Técnica en Construcción	<p>Regístrese en línea, pague el servicio contratado, reciba la visita de nuestro técnico y descargue los planos, diseños y presupuesto de su proyecto, desde su celular, tablet o computadora. </p>	34f2a6a8-733f-4ce6-ae51-492752c57bb5	/contenido2/7/934791c6-99e2-4570-8cab-2b7af660cd30.png		34f2a6a8-733f-4ce6-ae51-492752c57bb5	2019-06-19 00:28:31.355	34f2a6a8-733f-4ce6-ae51-492752c57bb5	2019-06-19 00:39:08.237
\.


--
-- Name: cms_contenido_id_contenido_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cms_contenido_id_contenido_seq', 7, true);


--
-- Data for Name: cms_nodo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cms_nodo (id_nodo, id_cms_tipo_nodo, titulo, contenido, activo, enlace, sistema, usuario_reg, fecha_reg, usuario_mod, fecha_mod) FROM stdin;
2	52	Mi Proyecto	\N	S	/proyecto/index.xhtml	S	hadmin	2019-06-10 06:43:54.852107	\N	\N
3	52	Financiamiento		S	/financiamiento/index.xhtml	S	hadmin	2019-06-10 06:43:54.852107	\N	\N
4	52	Materiales y Mano de Obra		S	/materiales/index.xhtml	S	hadmin	2019-06-10 06:43:54.852107	\N	\N
7	2	Videos Habitat		S		N	hadmin	2019-06-10 06:43:54.852107	\N	\N
8	52	Contratar Servicio de Asistencia Técnica		S	/proyecto/asistencia.xhtml	S	123e4567-e89b-12d3-a456-426655440000	2019-06-10 20:37:04.345	123e4567-e89b-12d3-a456-426655440000	2019-06-18 20:34:24.852
6	1	Pasos para pagar los servicios ATC	<p><img alt="" src="/nodos/6/17dd95b8-2f15-47b5-b021-01a89fb150d7.png" />Los servicios brindados por la unidad de ATC (Asistencia T&eacute;cnica en Construcci&oacute;n) de H&aacute;bitat&nbsp;incluyen, desde la elaboraci&oacute;n de planos y presupuesto, hasta la asesor&iacute;a y supervisi&oacute;n de obras de construcci&oacute;n.</p>\n\n<p>Los costos var&iacute;an seg&uacute;n el servicio solicitado.&nbsp;Para saber con precisi&oacute;n el costo del servicio que usted desea, favor cont&aacute;ctenos al tel&eacute;fono: 2270-1080 o al correo electr&oacute;nico: asistenciaenconstrucci&oacute;n@habitatnicaragua.org</p>\n\n<p>Por favor realice su pago haciendo transferencia o depositando en cualquiera de nuestras cuentas, el costo indicado:</p>\n\n<ul>\n\t<li>BANCO DE AMERICA CENTRAL (BAC)\n\t<ul>\n\t\t<li>C&oacute;rdobas:&nbsp;351032024</li>\n\t\t<li>D&oacute;lares:&nbsp; &nbsp; 351220090</li>\n\t</ul>\n\t</li>\n\t<li>BANCO CENTROAMERICANO (BANCENTRO)\n\t<ul>\n\t\t<li>C&oacute;rdobas:&nbsp;100200124</li>\n\t\t<li>D&oacute;lares:&nbsp; &nbsp; 101200134</li>\n\t</ul>\n\t</li>\n</ul>\n\n<p>Una vez que realice el pago, haga uso de nuestro Programador de Visitas T&eacute;cnica, para que un T&eacute;cnico de H&aacute;bitat lo visite.&nbsp;</p>\n\n<p>Recuerde que en este momento nuestros servicios de ATC est&aacute; disponible en&nbsp;los siguientes departamentos del pa&iacute;s: Managua, Estel&iacute; y Matagalpa.&nbsp;</p>\n	S		N	hadmin	2019-06-10 06:43:54.852107	123e4567-e89b-12d3-a456-426655440000	2019-06-18 22:34:50.558
1	1	CONSTRUYA CON NOSOTROS	<p>Hola</p>\n	S	/index.xhtml	S	hadmin	2019-06-10 06:43:54.852107	123e4567-e89b-12d3-a456-426655440000	2019-07-03 17:24:37.938
9	2	Construcción:		S		N	123e4567-e89b-12d3-a456-426655440000	2019-07-11 08:31:41.014	\N	\N
10	2	Educación Financiera:		S		N	123e4567-e89b-12d3-a456-426655440000	2019-07-11 08:50:31.127	\N	\N
11	2	Mi Propiedad:		S		N	123e4567-e89b-12d3-a456-426655440000	2019-07-11 08:54:44.054	\N	\N
\.


--
-- Name: cms_nodo_id_nodo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cms_nodo_id_nodo_seq', 11, true);


--
-- Data for Name: oft_oferta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oft_oferta (id_oferta, duenio, titulo, contenido, inicio, fin, limite_cantidad, archivo1, archivo2, archivo3, activo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) FROM stdin;
2	0646f014-ec6e-4426-8147-8ccd08017328	CEMEX Pega Cerámica Standard a mitad de precio!	<p><strong>CEMEX Pega Cer&aacute;mica Standard a mitad de precio!</strong></p>\r\n\r\n<p>CEMEX Pega Cer&aacute;mica Standard, es una Mezcla predosificada de cemento P&oacute;rtland y agregados con granulometr&iacute;a controlada y aditivos que conforman un producto de alta calidad. El cemento empleado cumple con el Reglamento T&eacute;cnico Nacional RTCR-383:2004. Los agregados incorporados, se producen de acuerdo a las especificaciones de calidad y m&eacute;todos de prueba seg&uacute;n las normas ASTM. CEMEX Pega Cer&aacute;mica Standard cumple con las especificaciones de la norma internacional ANSI A-118.1.</p>\r\n	2019-01-01	2020-05-31	0	/ofertas/2/e3764509-b97c-44d1-8609-3c970dda8328.png	/ofertas/2/022f8580-5a53-4b58-8dc0-7d3487a95036.png	/ofertas/2/841e476d-c7a0-4a6f-82d7-c2f2e57b54ab.png	S	0646f014-ec6e-4426-8147-8ccd08017328	2019-04-28 17:43:51.22	0646f014-ec6e-4426-8147-8ccd08017328	2019-04-28 17:50:25.164
3	123e4567-e89b-12d3-a456-426655440000	El único FIBROCEMENTO Certificado	<p>Compre en nuestros distribuidores autorizados y presente su cup&oacute;n de descuento. Por compras mayores a C$5,000.00&nbsp;obtenga 5% de descuento. Promoci&oacute;n v&aacute;lida hasta el 19 de Junio de 2019.</p>\r\n	2019-06-12	2019-06-19	0	/ofertas/3/2dadc978-1380-47c7-99c2-cd77666bd48d.jpg	\N	\N	S	123e4567-e89b-12d3-a456-426655440000	2019-06-12 16:31:20.373	123e4567-e89b-12d3-a456-426655440000	2019-06-12 16:31:20.373
4	9994952c-ae59-47a3-a872-0ac946299acd	Ecofiltro 	<p>Elaborado con pl&aacute;stico virgen y v&aacute;lvulas de acero. Obtenga 10% de descuento al realizar su compra con el financiamiento que s&oacute;lo FUNDENUSE te ofrece. Promoci&oacute;n valida para clientes de la sucursal Estel&iacute; y Ocotal. V&aacute;lida hasta el 12 de julio. S&oacute;lo aplica para una compra por hogar.</p>\r\n	2019-06-12	2019-07-12	0	/ofertas/4/3593c7ce-3fa5-4bec-bf50-61513b624110.png	\N	\N	S	9994952c-ae59-47a3-a872-0ac946299acd	2019-06-12 17:12:06.184	9994952c-ae59-47a3-a872-0ac946299acd	2019-06-12 17:12:06.184
\.


--
-- Name: oft_oferta_id_oferta_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('oft_oferta_id_oferta_seq', 4, true);


--
-- Data for Name: oft_usar_oferta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oft_usar_oferta (id_usar_oferta, id_oferta, id_usuario, codigo, usuario_reg, fecha_reg, usuario_mod, fecha_mod) FROM stdin;
2	2	123e4567-e89b-12d3-a456-426655440000	190614-2-1-Hzjf	123e4567-e89b-12d3-a456-426655440000	2019-06-14 18:49:36.208	\N	\N
5	4	123e4567-e89b-12d3-a456-426655440000	190618-4-1-MQM8	123e4567-e89b-12d3-a456-426655440000	2019-06-18 22:46:56.371	\N	\N
6	3	123e4567-e89b-12d3-a456-426655440000	190618-3-1-9k2e	123e4567-e89b-12d3-a456-426655440000	2019-06-18 22:47:10.773	\N	\N
8	3	2595db63-4958-4049-8968-909553407df0	190618-3-2-a7Lz	2595db63-4958-4049-8968-909553407df0	2019-06-18 22:51:10.525	\N	\N
14	2	2595db63-4958-4049-8968-909553407df0	190619-2-2-rd6H	2595db63-4958-4049-8968-909553407df0	2019-06-19 19:38:57.636	\N	\N
17	2	0646f014-ec6e-4426-8147-8ccd08017328	190619-2-0-Yzjs	0646f014-ec6e-4426-8147-8ccd08017328	2019-06-19 19:59:38.766	\N	\N
20	2	74710c90-4734-45b0-80f0-4f2e635de516	190624-2-7-mSCo	74710c90-4734-45b0-80f0-4f2e635de516	2019-06-24 20:21:11.062	\N	\N
21	4	1f8632fd-450a-476a-8336-3773e0a45663	190628-4-1-98iX	1f8632fd-450a-476a-8336-3773e0a45663	2019-06-28 17:41:07.124	\N	\N
\.


--
-- Name: oft_usar_oferta_id_usar_oferta_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('oft_usar_oferta_id_usar_oferta_seq', 21, true);


--
-- Data for Name: per_calificacion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY per_calificacion (id_calificacion, puntaje, comentario, id_proveedor, id_autor, usuario_reg, fecha_reg, usuario_mod, fecha_mod) FROM stdin;
1	5	ffff	34f2a6a8-733f-4ce6-ae51-492752c57bb5	123e4567-e89b-12d3-a456-426655440000	123e4567-e89b-12d3-a456-426655440000	2019-06-18 21:09:08.908	\N	\N
2	3	Prueba	34f2a6a8-733f-4ce6-ae51-492752c57bb5	123e4567-e89b-12d3-a456-426655440000	123e4567-e89b-12d3-a456-426655440000	2019-06-18 21:42:44.78	\N	\N
3	4	Cuatro estrellas	34f2a6a8-733f-4ce6-ae51-492752c57bb5	123e4567-e89b-12d3-a456-426655440000	123e4567-e89b-12d3-a456-426655440000	2019-06-18 21:43:11.663	\N	\N
4	0	prueba	34f2a6a8-733f-4ce6-ae51-492752c57bb5	123e4567-e89b-12d3-a456-426655440000	123e4567-e89b-12d3-a456-426655440000	2019-06-18 21:43:37.395	\N	\N
5	5	Buenos materiales	0646f014-ec6e-4426-8147-8ccd08017328	0646f014-ec6e-4426-8147-8ccd08017328	0646f014-ec6e-4426-8147-8ccd08017328	2019-06-18 21:45:48.306	\N	\N
6	1	Altos precios	0646f014-ec6e-4426-8147-8ccd08017328	0646f014-ec6e-4426-8147-8ccd08017328	0646f014-ec6e-4426-8147-8ccd08017328	2019-06-18 21:46:45.001	\N	\N
7	3	Excelente atención.	9994952c-ae59-47a3-a872-0ac946299acd	0126f013-ea6e-4426-8147-8ccd08017311	0126f013-ea6e-4426-8147-8ccd08017311	2019-06-21 03:56:47.341	\N	\N
8	5	3b	9994952c-ae59-47a3-a872-0ac946299acd	74710c90-4734-45b0-80f0-4f2e635de516	74710c90-4734-45b0-80f0-4f2e635de516	2019-06-24 20:15:16.821	\N	\N
\.


--
-- Name: per_calificacion_id_calificacion_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('per_calificacion_id_calificacion_seq', 8, true);


--
-- Data for Name: per_direccion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY per_direccion (id_direccion, id_usuario, nombre, direccion, id_localidad, latitud, longitud, usuario_reg, fecha_reg, usuario_mod, fecha_mod) FROM stdin;
1	123e4567-e89b-12d3-a456-426655440000	Oficina central	Los Robles. Alke Carretera a Masaya, 100 mts al oeste, 25 mts al sur. Casa #12.	124	12.1221259999999997	-86.2642610000000047	hadmin	2019-06-11 05:06:27.520173	\N	\N
2	0646f014-ec6e-4426-8147-8ccd08017328	Corporativo CEMEX-NICARAGUA	Managua 14031	124	12.1141380000000005	-86.2554549999999978	hadmin	2019-06-11 05:06:27.520173	\N	\N
3	0646f014-ec6e-4426-8147-8ccd08017328	Oficinas de empresa	Barrio Nora Astorga, Managua	124	12.1359499999999993	-86.2983210000000014	hadmin	2019-06-11 05:06:27.520173	\N	\N
4	0646f014-ec6e-4426-8147-8ccd08017328	Empresa constructora	Ciudad Sandino	123	12.1563789999999994	-86.3345079999999996	hadmin	2019-06-11 05:06:27.520173	\N	\N
5	34f2a6a8-733f-4ce6-ae51-492752c57bb5	Oficina central Nicaragua	Managua, Los Robles. Alke Carretera a Masaya, 100 mts al oeste, 25 mts al sur. Casa #12	124	12.1222737684785002	-86.264458000659971	hadmin	2019-06-11 05:06:27.520173	\N	\N
7	9994952c-ae59-47a3-a872-0ac946299acd	Sucursal Ciudad Jardín	Sucursal Ciudad Jardín	124	12.1440877860613021	-86.2594369053840779	123e4567-e89b-12d3-a456-426655440000	2019-04-28 17:22:46.547	\N	\N
6	2e1e1951-6a8f-4987-8a62-f48641009171	Centrum	Edificio Centrum Villa Fontana Managua	124	12.1254047690687123	-86.2701510316293252	123e4567-e89b-12d3-a456-426655440000	2019-04-28 17:21:18.08	123e4567-e89b-12d3-a456-426655440000	2019-06-18 22:42:15.508
\.


--
-- Name: per_direccion_id_direccion_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('per_direccion_id_direccion_seq', 7, true);


--
-- Data for Name: per_usuario; Type: TABLE DATA; Schema: public; Owner: -
--

COPY per_usuario (id_usuario, correo, clave, activo, codigo_activacion, nombres, fecha_nac, sexo, contacto, telefonos, direccion_fisica, facebook, twitter, whatsapp, sitio_web, ir_perfil, avatar, usuario_reg, fecha_reg, usuario_mod, fecha_mod) FROM stdin;
123e4567-e89b-12d3-a456-426655440000	hadmin@erpuno.com	$2a$10$PPbgr/ONViv5xM.jXp6AGu/RjpVkw.uy5QIfJ.eOIAZSLIqOXV.2K	S	\N	Habitat Nicaragua Admin	\N	\N	\N	\N	\N	\N	\N	\N	\N	N	\N	hadmin	2019-06-11 05:06:27.520173	\N	\N
0646f014-ec6e-4426-8147-8ccd08017328	cemex@erpuno.com	$2a$10$qZHQIpwc9wLD2H/OhNYhoOs/g5FQsuD5G/qY721RI87UYxnYNGyX6	S	\N	CEMEX Nicaragua	\N	 	\N		Managua 14031	https://www.facebook.com/CEMEXNicaraguaSA	https://twitter.com/CEMEX_NICARAGUA		\N	N	0646f014-ec6e-4426-8147-8ccd08017328.jpg	hadmin	2019-04-15 20:57:20.837079	\N	\N
2e1e1951-6a8f-4987-8a62-f48641009171	fudemi@erpuno.com	$2a$10$I6p1NpvQc3SS.m6zP6Vexu5m03mTqnBiq2CZEmBqK9QkCF3U2Cq4C	S	\N	FUDEMI	\N	 		22400017	Reparto Los Robles, 11 ave. Sur este N° 34	https://www.facebook.com/admon.sitio	https://twitter.com/FUDEMICM	7516-4354	http://www.fudemi.org.ni	N	2e1e1951-6a8f-4987-8a62-f48641009171.png	hadmin	2019-04-15 20:57:20.837079	123e4567-e89b-12d3-a456-426655440000	2019-04-28 17:32:36.556
9994952c-ae59-47a3-a872-0ac946299acd	fundenuse@erpuno.com	$2a$10$xK1zc5yQGRgTbpv/H/fV3eaBSN.CC95JMFWn8KJ14yvOINAr.8IOi	S	\N	FUNDENUSE	\N	 		27322060	Centro de Salud José Dolores Fletes, 1C al Norte, Ocotal, Nueva Segovia	https://www.facebook.com/fundenuse	https://twitter.com/hashtag/FUNDENUSE		http://www.fundenuse.com.ni	N	9994952c-ae59-47a3-a872-0ac946299acd.png	hadmin	2019-04-15 20:57:20.837079	123e4567-e89b-12d3-a456-426655440000	2019-04-28 17:35:11.23
34f2a6a8-733f-4ce6-ae51-492752c57bb5	habitat@habitatnicaragua.org	$2a$10$4K4f26x6iU4QeqxY8wxawO.l5NUVmJlxVKwreclGdJgBFPJF8Gyi2	S	\N	Hábitat para la Humanidad Nicaragua	\N	 		+505 2270-1080	Managua, Los Robles. Alke Carretera a Masaya, 100 mts al oeste, 25 mts al sur. Casa #12	https://www.facebook.com/habitatnic	https://twitter.com/Habitatnic		https://www.habitatnicaragua.org/	N	34f2a6a8-733f-4ce6-ae51-492752c57bb5.png	hadmin	2019-04-15 20:57:20.837079	\N	\N
08d6246f-6831-4c46-b805-287dfd19c1d0	tecnico@erpuno.com	$2a$10$eZbLBwR/6aiUGfmQTXSA7uEaxcLhfcp7xN211.yea6XYHrkzjomBW	S	\N	Técnico	\N	\N	\N	\N	\N	\N	\N	\N	\N	N	\N	hadmin	2019-06-11 05:06:27.520173	08d6246f-6831-4c46-b805-287dfd19c1d0	2019-06-11 17:36:09.096
62f9042b-3899-4bf3-80a2-103bde4e3997	prueba@denisjtorresg.info	$2a$10$RpvbTlg1VSg2FIz4sg1Be.GY6fKO32VJkoX3.kJWbvYw5y73iMELu	N	d5cf044a-5c9b-4361-83d4-6e4dc73b62f2	Denis prueba	\N	\N	\N	\N	\N	\N	\N	\N	\N	S	\N		2019-06-27 05:04:58.108		2019-06-27 05:04:58.108
0126f013-ea6e-4426-8147-8ccd08017311	id.waltermartinez@gmail.com	$2a$10$8t2.catb39GeFG0OR.04ueUsfBt06f.FNe5gEfJYXSU94l66dpdOO	S	\N	Walter Martinez	1990-10-01	M	\N	81803115	Managua	waltermartinez7	@walter	81803115	\N	N	0126f013-ea6e-4426-8147-8ccd08017311.jpg	hadmin	2019-06-11 05:06:27.520173	0126f013-ea6e-4426-8147-8ccd08017311	2019-06-19 01:02:50.506
abbf868c-9eb0-43dc-ade0-e7c5b289905e	me@denisjtorresg.info	$2a$10$Jw2bJjXdQmql7zt92LNFEuxal5zAItC2A0fEVr.qJ.0fcS3xe8nvq	S	\N	Denis Admin Técnico Pruebas	\N	M								N	abbf868c-9eb0-43dc-ade0-e7c5b289905e.jpg	123e4567-e89b-12d3-a456-426655440000	2019-06-16 05:25:15.11	abbf868c-9eb0-43dc-ade0-e7c5b289905e	2019-06-16 05:33:58.645
2595db63-4958-4049-8968-909553407df0	jrosales@habitatnicaragua.org	$2a$10$NcFtCaqIk3rkTQnmTz6UFu7wcNFOe8.7o9uGw40jalnUjxCrYBU6e	S	\N	Jose Luis Rosales	1985-06-19	M	\N	85538023	Zumen Raspados loly 1c.O, 1c.N, 1c.E,1/2N.\nhouse #4 MD	\N	\N	\N	\N	N	2595db63-4958-4049-8968-909553407df0.jpg		2019-06-14 15:54:59.572	2595db63-4958-4049-8968-909553407df0	2019-06-28 14:30:30.117
9075e75b-53bb-4339-ba0b-c0004abd900c	admintecnico@erpuno.com	$2a$10$tS.0AOh9CDshtZ83D6cFx.YHEGtRMWOH6CAlBsZ.j0VFVSzD5dNae	S	\N	Jefe de Técnicos Habitat	\N	\N	\N			\N	\N	\N	\N	N	\N	hadmin	2019-06-11 05:06:27.520173	9075e75b-53bb-4339-ba0b-c0004abd900c	2019-06-18 21:11:11.858
e51b834f-8934-44e1-9beb-1dac4763e253	abarreda@habitatnicaragua.org	$2a$10$AyKf21Dtme/65ygvL3TBOe1lvsQ56ZlA.mU71gevtIA7133lpEM4W	S	\N	Alvaro barreda	\N	M							www.micasa.com.ni	N	\N	123e4567-e89b-12d3-a456-426655440000	2019-06-28 16:49:42.547	\N	\N
16e38b72-4088-4022-a16d-75d3dab099ca	wwwmartinez@gmail.com	$2a$10$5YGAR63lTmcVy/Cb8qTzT.0Chsf2vL6MFzJRJ1fVmB8lCUaaxvXfC	N	dfb6d414-ec2a-40be-a5f6-65ebf04dac27	Juan Perez	\N	\N	\N	\N	\N	\N	\N	\N	\N	S	\N		2019-06-21 17:48:49.057		2019-06-21 17:48:49.057
f51b6c57-48c7-4b76-b2b3-0c5838ee52db	jlrm212@hotmail.com	$2a$10$JYRJl9ScKfhH2Yz6J58MVui9lFtfDqanNotI3BTYfF1jl0TiG1MJa	S	\N	Prueba de Cuenta	\N	\N	\N	\N	\N	\N	\N	\N	\N	S	\N		2019-06-19 16:26:25.325		2019-06-19 16:26:25.325
653a488a-837f-4895-bfbd-38b34b88ab90	lrivera@habitatnicaragua.org	$2a$10$5xDJe9ZRj2raG4C49DfRBOtcniOuCvVAULdnjW1ipF1ww8GMbb2UO	S	\N	Liza Rivera	\N	F								N	\N	123e4567-e89b-12d3-a456-426655440000	2019-06-28 16:15:45.971	\N	\N
d4eb9b93-5802-4187-8bb0-91fdc832a17f	wlopez@habitatnicaragua.org	$2a$10$IjhMa.X5fbPD03gKhsB7FujDnqWveNFhM1T0auS2dcAWa55HDHSEy	S	\N	Walter Lopez	\N	M								N	\N	123e4567-e89b-12d3-a456-426655440000	2019-06-19 18:19:52.236	123e4567-e89b-12d3-a456-426655440000	2019-06-28 16:53:38.355
87ac18ea-fd70-4cdc-b8d2-fb814460801e	edgonzalez@habitatnicaragua.org	\N	S	\N	Edgard Gonzalez valdivia	\N	M							www.micasa.com.ni	N	\N	123e4567-e89b-12d3-a456-426655440000	2019-06-28 16:56:04.043	\N	\N
943cd012-46c2-4bef-8967-433704af66ef	smantilla@habitatnicaragua.org	\N	S	\N	Saul Mantilla	\N	M								N	\N	123e4567-e89b-12d3-a456-426655440000	2019-06-28 16:56:59.1	\N	\N
965146f9-a6f0-489b-a0a7-762a73dfe99c	lmarenco@habitatnicaragua.org	$2a$10$5ecvhI4DYckXleR6HQFOI.rRhT0UmVFulR9GVS4R/CRXRovVE7MKa	S	\N	Luis Marenco	\N	\N	\N	\N	\N	\N	\N	\N	\N	N	\N		2019-06-28 14:41:32.937	965146f9-a6f0-489b-a0a7-762a73dfe99c	2019-06-28 17:04:31
74710c90-4734-45b0-80f0-4f2e635de516	zulma@habitatnicaragua.org	$2a$10$xmzC7EEIAy1a0c1iumyYfuUeYuhBFRf7MJjg8iv6KpwqFw6d37WqO	S	\N	Zu Es	\N	F		22701080	Managua					N	\N		2019-06-17 21:20:44.534	123e4567-e89b-12d3-a456-426655440000	2019-06-28 18:21:44.735
1f8632fd-450a-476a-8336-3773e0a45663	jlrm2385@gmail.com	$2a$10$ztXwxis6nxKQPyNkVw304eF1/CkmtLg.2Cg0frapjOFEybU0hN9ie	S	\N	jose duarte	\N	 	\N	85538023	Zumen Raspados loly 1c.O, 1c.N, 1c.E,1/2N.\nhouse #4 MD	\N	\N	\N	\N	N	\N		2019-06-28 16:37:09.331	1f8632fd-450a-476a-8336-3773e0a45663	2019-07-04 07:58:42.053
8fe48435-a790-44c1-a316-eb906d6945a2	ferreteria@erpuno.com	$2a$10$a3s8Yl8FzMJzVhw/Zl.dVu8/lkx3ZId.Li6Dji.dzqgNa9Jt3YhjC	S	074c2c4f-cbd9-4026-8152-c103f08f56ee	Ferretería la Grapa	\N	 								S	\N		2019-07-06 17:55:47.753	123e4567-e89b-12d3-a456-426655440000	2019-07-06 18:02:19.217
42d7d9ee-2ca9-4c1c-b014-c274f938c856	test1@denisjtorresg.info	$2a$10$F0/0DJKfS8kp/H0JoPXwteJFZjbGfm37nE5d1hieArQ7geKzFKQwW	S	\N	Denis3	\N	\N	\N	\N	\N	\N	\N	\N	\N	S	\N		2019-06-29 23:16:00.218		2019-06-29 23:16:00.218
9175e50a-53bb-4339-ba5b-c47f4abd977c	denisjtorresg@gmail.com	$2a$10$Py9f3KeGgFj9QFW7Pku7A.Rd/Shnw8otzvtzFBTMtRf6jkdIGncW6	S	\N	Denis Torres	\N	 	\N			\N	\N	\N	\N	N	\N	hadmin	2019-06-11 05:06:27.520173	9175e50a-53bb-4339-ba5b-c47f4abd977c	2019-07-08 22:03:09.493
\.


--
-- Data for Name: pry_comentario; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pry_comentario (id_comentario, id_proyecto, contenido, activo, id_comentarista, usuario_reg, fecha_reg, usuario_mod, fecha_mod, visto) FROM stdin;
3	2	ya esta programada mi visita?	S	74710c90-4734-45b0-80f0-4f2e635de516	74710c90-4734-45b0-80f0-4f2e635de516	2019-06-18 20:54:23.559	\N	\N	N
4	2	en que fecha esta programada	S	9075e75b-53bb-4339-ba0b-c0004abd900c	9075e75b-53bb-4339-ba0b-c0004abd900c	2019-06-18 21:06:36.762	\N	\N	N
5	3	La habitación debe tener una dimensión de 3x3 m2. En el caso del garaje para un vehículo y será de 3.5x7 m2.	S	0126f013-ea6e-4426-8147-8ccd08017311	0126f013-ea6e-4426-8147-8ccd08017311	2019-06-19 01:09:35.925	\N	\N	N
6	3	Muchas gracias WM. En breve le estaremos asignando un Técnico quién entrará en contacto con usted para coordinar la visita.	S	9075e75b-53bb-4339-ba0b-c0004abd900c	9075e75b-53bb-4339-ba0b-c0004abd900c	2019-06-19 01:17:12.66	\N	\N	N
7	4	Se cotactara Walter martinez con usted 85538024 en 24 horas	S	9075e75b-53bb-4339-ba0b-c0004abd900c	9075e75b-53bb-4339-ba0b-c0004abd900c	2019-06-19 17:45:55.716	\N	\N	N
8	7	Lo visitaré mañana por la tarde a las 2 pm. esta de acuerdo	S	08d6246f-6831-4c46-b805-287dfd19c1d0	08d6246f-6831-4c46-b805-287dfd19c1d0	2019-06-28 16:48:21.435	\N	\N	N
9	4	sdsdsdsdfsdfs	S	08d6246f-6831-4c46-b805-287dfd19c1d0	08d6246f-6831-4c46-b805-287dfd19c1d0	2019-07-04 07:59:29.364	\N	\N	N
2	1	Gracias	S	9175e50a-53bb-4339-ba5b-c47f4abd977c	9175e50a-53bb-4339-ba5b-c47f4abd977c	2019-04-28 21:45:45.883	9175e50a-53bb-4339-ba5b-c47f4abd977c	2019-07-08 22:02:53.696	S
1	1	Su proyecto ya está en proceso de gestión	S	9075e75b-53bb-4339-ba0b-c0004abd900c	9075e75b-53bb-4339-ba0b-c0004abd900c	2019-04-28 21:45:16.807	9175e50a-53bb-4339-ba5b-c47f4abd977c	2019-07-08 22:02:53.696	S
\.


--
-- Name: pry_comentario_id_comentario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pry_comentario_id_comentario_seq', 9, true);


--
-- Data for Name: pry_proyecto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pry_proyecto (id_proyecto, descripcion, id_pry_forma_pago, id_banco, fecha_pago, comprobante, espacios_mejora, materiales_mejora, presupuesto, monto_presupuesto, id_moneda, tiene_albanil, presente_visita, nombre_per_atencion_visita, fecha_hora_disponible, id_estado, id_pry_tipo_servicio, usuario_duenio, usuario_tecnico, usuario_reg, fecha_reg, usuario_mod, fecha_mod) FROM stdin;
1	Componer el techo	\N	187	2018-12-22	99999	Techo	Zinc	S	10000.00	41	N	S		\N	188	\N	9175e50a-53bb-4339-ba5b-c47f4abd977c	08d6246f-6831-4c46-b805-287dfd19c1d0	9175e50a-53bb-4339-ba5b-c47f4abd977c	2019-04-15 20:57:20.837079	9075e75b-53bb-4339-ba0b-c0004abd900c	2019-04-28 21:44:56.135
5	Cambiar laminas de Techo	\N	187	2019-06-19	3456783	Techo	metal	N	\N	\N	N	N	nose 	\N	188	\N	2595db63-4958-4049-8968-909553407df0	\N	2595db63-4958-4049-8968-909553407df0	2019-06-19 17:36:15.475	\N	\N
6	construir un baño	\N	187	2019-06-15	22222222222222222	Unidad sanitaria	gypsum ,bloques ,azulejos	N	\N	\N	N	N	juojljniooml	\N	193	\N	74710c90-4734-45b0-80f0-4f2e635de516	\N	74710c90-4734-45b0-80f0-4f2e635de516	2019-06-19 17:37:03.949	74710c90-4734-45b0-80f0-4f2e635de516	2019-06-19 17:58:05.967
4	Levantar muro perimetral de 25P35	\N	186	2019-06-19	1232434567	Muro, no se	Piedra cantera,nose,No se	N	\N	\N	N	S	No se	\N	190	\N	2595db63-4958-4049-8968-909553407df0	08d6246f-6831-4c46-b805-287dfd19c1d0	2595db63-4958-4049-8968-909553407df0	2019-06-19 17:17:29.445	08d6246f-6831-4c46-b805-287dfd19c1d0	2019-06-19 18:18:33.096
3	Construir una nueva habitación y techar el área de garaje.	\N	186	2019-06-18	BAC123456	Habitaciones,Garaje	Bloques de concreto	S	2000.00	42	N	S		\N	190	\N	0126f013-ea6e-4426-8147-8ccd08017311	08d6246f-6831-4c46-b805-287dfd19c1d0	0126f013-ea6e-4426-8147-8ccd08017311	2019-06-19 01:07:28.363	08d6246f-6831-4c46-b805-287dfd19c1d0	2019-06-21 02:37:55.249
2	construir un cuarto	\N	186	2019-06-20	00000000000000	el dormitorio	arena,Bloques de concreto,hierro	S	1.00	42	S	S	Zu	\N	190	\N	74710c90-4734-45b0-80f0-4f2e635de516	08d6246f-6831-4c46-b805-287dfd19c1d0	74710c90-4734-45b0-80f0-4f2e635de516	2019-06-17 21:26:39.898	9075e75b-53bb-4339-ba0b-c0004abd900c	2019-06-26 19:49:59.046
7	ampliación 	\N	187	2019-06-29	22222222222222222	sala	bloque 	N	\N	\N	N	S		\N	189	\N	74710c90-4734-45b0-80f0-4f2e635de516	08d6246f-6831-4c46-b805-287dfd19c1d0	74710c90-4734-45b0-80f0-4f2e635de516	2019-06-28 16:45:26.46	9075e75b-53bb-4339-ba0b-c0004abd900c	2019-06-28 16:47:03.871
8	dsdsdsdsds	\N	187	2019-06-19	1232434567	muro perimetral	Bloques de concreto	N	\N	\N	N	S	nose 	\N	188	\N	1f8632fd-450a-476a-8336-3773e0a45663	\N	1f8632fd-450a-476a-8336-3773e0a45663	2019-07-04 07:57:49.31	\N	\N
\.


--
-- Name: pry_proyecto_id_proyecto_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pry_proyecto_id_proyecto_seq', 8, true);


--
-- Data for Name: pub_publicidad; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pub_publicidad (id_anuncio, id_ubicacion_anuncio, inicio, fin, impresiones, max_impresiones, clicks, max_clicks, activo, enlace, archivo1, archivo2, archivo3, usuario_reg, fecha_reg, usuario_mod, fecha_mod) FROM stdin;
3	197	2019-02-01	2021-04-28	572	0	2	0	S	https://concepto.de/publicidad/	\N	/d4d1c1l8up/3/68b3bca2-29b6-4ccd-8245-8f1b2e5c216f.png	/d4d1c1l8up/3/42c027a5-7570-4c95-b0da-b388ecb9ef74.png	123e4567-e89b-12d3-a456-426655440000	2019-04-28 17:30:51.283	123e4567-e89b-12d3-a456-426655440000	2019-06-11 21:20:15.882
2	198	2019-02-01	2021-01-31	542	0	1	0	S	https://es.wikipedia.org/wiki/Publicidad	/d4d1c1l8up/2/87b380d1-15d1-4b60-b760-7a3b53f33bab.png	/d4d1c1l8up/2/02f2a19d-c2df-4ef5-88d2-73ca48e4738f.png	\N	123e4567-e89b-12d3-a456-426655440000	2019-04-20 22:04:06.167	123e4567-e89b-12d3-a456-426655440000	2019-04-28 17:29:26.286
4	197	2019-06-11	2019-07-11	545	0	15	0	S	https://www.habitatnicaragua.org/	/d4d1c1l8up/4/1f1d5cd4-84b2-4ee9-8eb1-944dfff7644f.png	/d4d1c1l8up/4/60734e3c-1173-4870-ae80-05dcd6630259.png	/d4d1c1l8up/4/89a4cb06-1cf5-41a8-8bfa-468de8dea24c.png	123e4567-e89b-12d3-a456-426655440000	2019-06-11 22:40:37.25	123e4567-e89b-12d3-a456-426655440000	2019-06-11 22:41:15.617
7	198	2019-07-04	2019-07-05	12	0	0	0	S		/d4d1c1l8up/7/4a01a954-bc43-43e3-af0d-d589d080af59.png	\N	\N	123e4567-e89b-12d3-a456-426655440000	2019-07-02 22:06:37.667	123e4567-e89b-12d3-a456-426655440000	2019-07-02 22:06:37.667
5	198	2019-06-14	2019-07-14	326	0	2	0	S	https://www.habitat.org/lac-es	/d4d1c1l8up/5/afb16108-d488-4f9d-8350-eb93f4125981.png	/d4d1c1l8up/5/f6142c60-b73e-4ff9-a224-46fa5ad93fe4.png	\N	123e4567-e89b-12d3-a456-426655440000	2019-06-14 18:06:29.311	123e4567-e89b-12d3-a456-426655440000	2019-06-14 18:06:29.311
\.


--
-- Name: pub_publicidad_id_anuncio_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pub_publicidad_id_anuncio_seq', 7, true);


--
-- Data for Name: seg_login; Type: TABLE DATA; Schema: public; Owner: -
--

COPY seg_login (id_login, fecha, correo, ip, exitoso) FROM stdin;
1	2019-06-11 05:08:21.611	hadmin@erpuno.com	190.212.241.202	S
2	2019-06-11 17:35:10.297	hadmin@erpuno.com	191.98.250.142	S
3	2019-06-11 17:36:09.068	tecnico@erpuno.com	191.98.250.142	S
4	2019-06-11 18:10:30.679	hadmin@erpuno.com	191.98.250.142	S
5	2019-06-11 18:38:37.312	hadmin@erpuno.com	186.77.136.134	S
6	2019-06-11 21:02:55.463	hadmin@erpuno.com	186.77.139.38	S
7	2019-06-11 22:36:41.305	hadmin@erpuno.com	186.77.139.38	S
8	2019-06-11 22:48:03.145	hadmin@erpuno.com	186.77.139.38	S
9	2019-06-12 03:46:56.78	hadmin@erpuno.com	190.212.247.64	S
10	2019-06-12 04:33:37.67	hadmin@erpuno.com	190.212.247.64	S
11	2019-06-12 04:44:33.844	hadmin@erpuno.com	190.212.247.64	S
12	2019-06-12 16:25:39.938	hadmin@erpuno.com	186.77.138.20	S
13	2019-06-12 16:26:40.577	hadmin@erpuno.com	186.77.138.20	S
14	2019-06-12 16:37:26.145	fundenuse@erpuno.com	186.77.138.20	S
15	2019-06-13 13:36:07.592	cemex@erpuno.com	190.212.243.41	S
16	2019-06-13 16:44:08.471	hadmin@erpuno.com	191.98.250.142	S
17	2019-06-14 06:02:54.15	denisjtorresg@gmail.com	186.77.224.125	S
18	2019-06-14 14:31:39.488	denisjtorresg@gmail.com	191.98.250.142	S
19	2019-06-14 14:32:47.916	hadmin@erpuno.com	191.98.250.142	S
20	2019-06-14 14:34:22.745	admintecnico@erpuno.com	191.98.250.142	S
21	2019-06-14 15:48:16.789	hadmin@erpuno.com	191.98.250.142	S
22	2019-06-14 15:49:20.742	jrosales@habitatnicaragua.org	191.98.250.142	N
23	2019-06-14 15:49:34.293	cemex@erpuno.com	191.98.250.142	S
24	2019-06-14 15:49:54.237	jrosales@habitatnicaragua.org	191.98.250.142	N
25	2019-06-14 15:50:56.638	hadmin@erpuno.com	191.98.250.142	S
26	2019-06-14 15:51:32.346	tecnico@erpuno.com	191.98.250.142	S
27	2019-06-14 15:52:14.241	hadmin@erpuno.com	191.98.250.142	S
28	2019-06-14 15:52:51.687	admintecnico@erpuno.com	191.98.250.142	S
29	2019-06-14 16:03:52.432	jrosales@habitatnicaragua.org	191.98.250.142	N
30	2019-06-14 16:04:01.627	jrosales@habitatnicaragua.org	191.98.250.142	S
31	2019-06-14 17:29:11.821	admintecnico@erpuno.com	191.98.250.142	S
32	2019-06-14 17:29:52.752	zespinoza@habitatnicaragua.org	191.98.250.142	N
33	2019-06-14 17:52:16.082	hadmin@erpuno.com	186.77.136.84	S
34	2019-06-14 18:16:08.725	hadmin@erpuno.com	186.77.136.84	S
35	2019-06-14 18:31:34.582	hadmin@erpuno.com	186.77.136.84	S
36	2019-06-14 19:27:13.914	denisjtorresg@gmail.com	190.212.240.99	S
37	2019-06-14 23:43:40.243	hadmin@erpuno.com	190.212.241.70	S
38	2019-06-15 04:29:54.88	cemex@erpuno.com	190.212.241.70	S
39	2019-06-15 04:37:43.78	cemex@erpuno.com	190.212.241.70	S
40	2019-06-16 03:57:00.784	hadmin@erpuno.com	186.77.229.182	S
41	2019-06-16 04:44:09.735	cemex@erpuno.com	186.77.229.182	S
42	2019-06-16 05:24:16.955	hadmin@erpuno.com	186.77.229.182	S
43	2019-06-16 05:25:35.45	me@denisjtorresg.info	186.77.229.182	S
44	2019-06-17 20:34:38.493	hadmin@erpuno.com	186.77.137.109	S
45	2019-06-17 21:12:42.505	zespinoza@habitatnicaragua.org	191.98.250.142	N
46	2019-06-17 21:14:01.048	zespinoza@habitatnicaragua.org	191.98.250.142	N
47	2019-06-17 21:21:58.883	jrosales@habitatnicaragua.org	191.98.250.142	S
48	2019-06-17 21:23:25.224	zespinoza@habitatnicaragua.org	191.98.250.142	S
49	2019-06-18 20:31:37.473	hadmin@erpuno.com	191.98.250.142	S
50	2019-06-18 20:44:54.426	hadmin@erpuno.com	186.77.138.100	S
51	2019-06-18 20:51:53.515	zespinoza@habitatnicaragua.org	191.98.250.142	S
52	2019-06-18 20:53:05.103	jrosales@habitatnicaragua.org	191.98.250.142	S
53	2019-06-18 20:54:40.399	hadmin@erpuno.com	191.98.250.142	S
54	2019-06-18 20:55:42.996	tecnico@erpuno.com	191.98.250.142	S
55	2019-06-18 21:05:58.831	admintecnico@erpuno.com	191.98.250.142	S
56	2019-06-18 21:07:29.314	hadmin@erpuno.com	191.98.250.142	S
57	2019-06-18 21:10:42.601	admintecnico@erpuno.com	191.98.250.142	S
58	2019-06-18 21:11:55.353	hadmin@erpuno.com	191.98.250.142	S
59	2019-06-18 21:34:35.972	hadmin@erpuno.com	191.98.250.142	S
60	2019-06-18 21:36:48.906	zespinoza@habitatnicaragua.org	191.98.250.142	S
61	2019-06-18 21:38:03.847	admintecnico@erpuno.com	191.98.250.142	S
62	2019-06-18 21:40:09.003	hadmin@erpuno.com	191.98.250.142	S
63	2019-06-18 21:45:19.453	cemex@erpuno.com	191.98.250.142	S
64	2019-06-18 21:47:41.763	cemex@erpuno.com	191.98.250.142	S
65	2019-06-18 21:51:04.781	cemex@erpuno.com	191.98.250.142	S
66	2019-06-18 22:01:31.527	habitat@habitatnicaragua.org	191.98.250.142	S
67	2019-06-18 22:07:11.484	cemex@erpuno.com	191.98.250.142	S
68	2019-06-18 22:12:12.23	hadmin@erpuno.com	186.77.138.100	S
69	2019-06-18 22:14:41.495	hadmin@erpuno.com	191.98.250.142	S
70	2019-06-18 22:20:54.842	hadmin@erpuno.com	191.98.250.142	S
71	2019-06-18 22:21:39.791	jrosales@habitatnicaragua.org	191.98.250.142	S
72	2019-06-18 22:22:39.669	jrosales@habitatnicaragua.org	191.98.250.142	S
73	2019-06-18 22:26:06.977	hadmin@erpuno.com	191.98.250.142	S
74	2019-06-18 22:27:31.362	jrosales@habitatnicaragua.org	191.98.250.142	S
75	2019-06-18 22:30:01.323	hadmin@erpuno.com	191.98.250.142	S
76	2019-06-18 22:42:46.181	hadmin@erpuno.com	191.98.250.142	S
77	2019-06-18 22:43:07.876	fundenuse@erpuno.com	191.98.250.142	S
78	2019-06-18 22:47:30.711	jrosales@habitatnicaragua.org	191.98.250.142	S
79	2019-06-19 00:10:52.554	hadmin@erpuno.com	186.77.138.14	S
80	2019-06-19 00:12:17.423	habitat@erpuno.com	186.77.138.14	N
81	2019-06-19 00:18:04.89	habitat@habitatnicaragua.org	186.77.138.14	S
82	2019-06-19 00:22:59.977	fundenuse@erpuno.com	186.77.138.14	S
83	2019-06-19 00:26:55.842	habitat@habitatnicaragua.org	186.77.138.14	S
84	2019-06-19 00:41:59.046	id.waltermartinez@gmail.com	186.77.138.14	N
85	2019-06-19 00:42:28.8	id.waltermartinez@gmail.com	186.77.138.14	N
86	2019-06-19 00:45:53.064	id.waltermartinez@gmail.com	186.77.138.14	S
87	2019-06-19 01:14:36.112	admintecnico@erpuno.com	186.77.138.14	S
88	2019-06-19 02:43:51.574	hadmin@erpuno.com	186.77.234.125	S
89	2019-06-19 03:02:26.506	id.waltermartinez@gmail.com	186.77.137.20	S
90	2019-06-19 15:22:35.133	narosteguinica@gmail.com	191.98.250.142	N
91	2019-06-19 15:25:51.808	denisjtorresg@gmail.com	191.98.250.142	S
92	2019-06-19 16:34:39.071	hadmin@erpuno.com	191.98.250.142	S
93	2019-06-19 16:40:50.608	hadmin@erpuno.com	191.98.250.142	S
94	2019-06-19 16:51:59.19	zespinoza@habitatnicaragua.org	191.98.250.142	S
95	2019-06-19 16:58:31.472	hadmin@erpuno.com	191.98.250.142	S
96	2019-06-19 17:09:04.395	id.waltermartinez@gmail.com	186.77.136.195	S
97	2019-06-19 17:09:08.778	narosteguinica@gmail.com	191.98.250.142	N
98	2019-06-19 17:09:58.575	jrosales@habitatnicaragua.org	191.98.250.142	N
99	2019-06-19 17:10:07.039	jrosales@habitatnicaragua.org	191.98.250.142	N
100	2019-06-19 17:10:31.234	jrosales@habitatnicaragua.org	191.98.250.142	S
101	2019-06-19 17:11:02.582	jrosales@habitatnicaragua.org	191.98.250.142	S
102	2019-06-19 17:19:19.85	hadmin@erpuno.com	191.98.250.142	S
103	2019-06-19 17:29:26.136	jrosales@habitatnicaragua.org	191.98.250.142	N
104	2019-06-19 17:29:32.531	jrosales@habitatnicaragua.org	191.98.250.142	S
105	2019-06-19 17:38:41.498	jrosales@habitatnicaragua.org	191.98.250.142	S
106	2019-06-19 17:39:56.509	tecnico@erpuno.com	191.98.250.142	S
107	2019-06-19 17:40:11.931	admintecnico@erpuno.com	191.98.250.142	S
108	2019-06-19 17:48:09.697	jrosales@habitatnicaragua.org	191.98.250.142	S
109	2019-06-19 18:07:22.179	admintecnico@erpuno.com	191.98.250.142	S
110	2019-06-19 18:13:02.545	hadmin@erpuno.com	191.98.250.142	S
111	2019-06-19 18:14:02.824	hadmin@erpuno.com	191.98.250.142	S
112	2019-06-19 18:17:55.686	tecnico@erpuno.com	191.98.250.142	S
113	2019-06-19 18:21:05.829	hadmin@erpuno.com	186.1.8.82	S
114	2019-06-19 18:25:06.547	jrosales@habitatnicaragua.org	191.98.250.142	N
115	2019-06-19 18:25:14.405	jrosales@habitatnicaragua.org	191.98.250.142	S
116	2019-06-19 18:28:20.766	tecnico@erpuno.com	191.98.250.142	S
117	2019-06-19 18:28:42.302	tecnico@erpuno.com	191.98.250.142	S
118	2019-06-19 18:39:54.252	jrosales@habitatnicaragua.org	191.98.250.142	S
119	2019-06-19 18:40:14.383	jrosales@habitatnicaragua.org	191.98.250.142	S
120	2019-06-19 19:00:22.902	hadmin@erpuno.com	191.98.250.142	S
121	2019-06-19 19:05:20.948	zespinoza@habitatnicaragua.org	191.98.250.142	S
122	2019-06-19 19:14:20.94	cemex@erpuno.com	191.98.250.142	S
123	2019-06-19 19:38:00.634	jrosales@habitatnicaragua.org	191.98.250.142	S
124	2019-06-19 19:43:29.824	hadmin@erpuno.com	191.98.250.142	S
125	2019-06-19 19:45:01.586	cemex@erpuno.com	191.98.250.142	S
126	2019-06-19 19:49:10.928	hadmin@erpuno.com	191.98.250.142	S
127	2019-06-19 19:55:05.016	jrosales@habitatnicaragua.org	191.98.250.142	S
128	2019-06-19 19:55:57.886	cemex@erpuno.com	191.98.250.142	S
129	2019-06-19 20:15:09.387	hadmin@erpuno.com	191.98.250.142	S
130	2019-06-19 22:14:12.614	hadmin@erpuno.com	191.98.250.142	S
131	2019-06-20 04:30:37.255	denisjtorresg@gmail.com	186.77.227.20	S
132	2019-06-20 04:30:46.974	hadmin@erpuno.com	186.77.227.20	S
133	2019-06-20 04:47:01.228	denisjtorresg@gmail.com	186.77.227.20	S
134	2019-06-20 04:48:12.131	denisjtorresg@gmail.com	186.77.227.20	S
135	2019-06-20 04:50:06.805	hadmin@erpuno.com	186.77.227.20	S
136	2019-06-20 05:07:17.591	denisjtorresg@gmail.com	186.77.227.20	S
137	2019-06-20 05:08:47.547	hadmin@erpuno.com	186.77.227.20	S
138	2019-06-20 05:16:59.165	denisjtorresg@gmail.com	186.77.227.20	S
139	2019-06-20 05:17:25.807	hadmin@erpuno.com	186.77.227.20	S
140	2019-06-20 18:13:37.972	hadmin@erpuno.com	186.77.138.233	S
141	2019-06-20 18:17:28.454	hadmin@erpuno.com	186.77.142.226	S
142	2019-06-20 23:13:12.246	id.waltermartinez@gmail.com	186.77.138.95	S
143	2019-06-21 01:07:22.29	id.waltermartinez@gmail.com	186.77.137.209	S
144	2019-06-21 01:17:07.066	id.waltermartinez@gmail.com	186.77.137.209	S
145	2019-06-21 02:33:37.964	admintecnico@erpuno.com	186.77.137.209	S
146	2019-06-21 02:37:02.355	tecnico@erpuno.com	186.77.137.209	S
147	2019-06-21 02:47:24.874	id.waltermartinez@gmail.com	186.77.137.209	S
148	2019-06-21 03:45:55.892	id.waltermartinez@gmail.com	186.77.137.209	S
149	2019-06-21 04:17:18.7	id.waltermartinez@gmail.com	186.77.137.209	S
150	2019-06-21 17:14:04.93	id.waltermartinez@gmail.com	186.77.137.21	S
151	2019-06-21 18:46:07.423	id.waltermartinez@gmail.com	186.77.137.21	S
152	2019-06-24 20:10:18.931	zespinoza@habitatnicaragua.org	191.98.250.142	S
153	2019-06-24 20:32:14.88	hadmin@erpuno.com	191.98.250.142	S
154	2019-06-24 21:29:30.636	hadmin@erpuno.com	191.98.250.142	S
155	2019-06-24 21:32:53.384	admintecnico@erpuno.com	191.98.250.142	S
156	2019-06-24 22:15:52.534	hadmin@erpuno.com	191.98.250.142	S
157	2019-06-26 13:16:35.831	denisjtorresg@gmail.com	186.77.142.226	S
158	2019-06-26 13:19:25.403	hadmin@erpuno.com	186.77.142.226	S
159	2019-06-26 13:21:53.585	denisjtorresg@gmail.com	186.77.142.226	S
160	2019-06-26 16:59:56.302	hadmin@erpuno.com	186.77.142.226	S
161	2019-06-26 17:39:46.988	hadmin@erpuno.com	186.77.142.226	S
162	2019-06-26 19:47:51.658	tecnico@erpuno.com	191.98.250.142	S
163	2019-06-26 19:48:46.027	admintecnico@erpuno.com	191.98.250.142	S
164	2019-06-27 20:00:41.543	hadmin@erpuno.com	191.98.250.142	S
165	2019-06-28 04:18:30.989	hadmin@erpuno.com	186.77.230.125	S
166	2019-06-28 14:26:41.939	hadmin@erpuno.com	191.98.250.142	S
167	2019-06-28 14:27:06.765	jrosales@habitatnicaragua.org	191.98.250.142	N
168	2019-06-28 14:30:30.096	jrosales@habitatnicaragua.org	191.98.250.142	S
169	2019-06-28 14:32:43.785	jrosales@habitatnicaragua.org	191.98.250.142	S
170	2019-06-28 14:35:54.511	hadmin@erpuno.com	191.98.250.142	S
171	2019-06-28 14:42:36.377	Luis Marenco	191.98.250.142	N
172	2019-06-28 14:42:50.39	Luis Marenco	191.98.250.142	N
173	2019-06-28 14:51:27.792	Luis Marenco	191.98.250.142	N
174	2019-06-28 14:51:56.609	Luis Marenco	191.98.250.142	N
175	2019-06-28 14:52:07.239	Luis Marenco	191.98.250.142	N
176	2019-06-28 15:44:08.151	hadmin@erpuno.com	191.98.250.142	S
177	2019-06-28 15:50:25.243	hadmin@erpuno.com	191.98.250.142	S
178	2019-06-28 16:14:22.301	hadmin@erpuno.com	191.98.250.142	S
179	2019-06-28 16:42:28.967	jlrm2385@gmail.com	191.98.250.142	S
180	2019-06-28 16:43:15.393	zespinoza@habitatnicaragua.org	191.98.250.142	S
181	2019-06-28 16:43:37.085	hadmin@erpuno.com	191.98.250.142	S
182	2019-06-28 16:45:00.129	lrivera@habitatnicaragua.org	191.98.250.142	S
183	2019-06-28 16:46:22.303	admintecnico@erpuno.com	191.98.250.142	S
184	2019-06-28 16:47:33.782	tecnico@erpuno.com	191.98.250.142	S
185	2019-06-28 16:48:06.353	hadmin@erpuno.com	191.98.250.142	S
186	2019-06-28 16:52:57.62	hadmin@erpuno.com	191.98.250.142	S
187	2019-06-28 17:01:45.09	Luis Marenco	191.98.250.142	N
188	2019-06-28 17:02:36.381	lmarenco@habitatnicaragua.org	191.98.250.142	N
189	2019-06-28 17:03:16.434	lmarenco@habitatnicaragua.org	191.98.250.142	N
190	2019-06-28 17:04:30.983	lmarenco@habitatnicaragua.org	191.98.250.142	S
191	2019-06-28 17:09:08.401	lrivera@habitatnicaragua.org	191.98.250.142	S
197	2019-06-28 18:16:49.304	hadmin@erpuno.com	191.98.250.142	S
198	2019-06-28 18:18:25.73	zespinosa@habitatnicaragua.org	191.98.250.142	S
199	2019-06-28 18:19:34.501	zespinoza@habitatnicaragua.org	191.98.250.142	N
200	2019-06-28 18:19:47.654	zespinoza@habitatnicaragua.org	191.98.250.142	N
201	2019-06-28 18:20:21.284	zespinoza@habitatnicaragua.org	191.98.250.142	S
203	2019-06-29 21:08:17.931	hadmin@erpuno.com	191.98.250.142	S
192	2019-06-28 17:38:11.059	cemex@erpuno.com	191.98.250.142	S
193	2019-06-28 17:40:40.724	jrosales@habitatnicaragua.org	191.98.250.142	N
194	2019-06-28 17:40:52.834	jlrm2385@gmail.com	191.98.250.142	S
195	2019-06-28 17:41:54.684	cemex@erpuno.com	191.98.250.142	S
196	2019-06-28 18:04:07.061	zespinoza@habitatnicaragua.org	191.98.250.142	S
202	2019-06-28 18:22:20.922	zulma@habitatnicaragua.org	191.98.250.142	S
204	2019-06-29 17:06:23.556	hadmin@erpuno.com	190.106.1.172	S
205	2019-06-29 17:06:52.707	denisjtorresg@gmail.com	190.106.1.172	N
206	2019-06-29 17:06:58.099	denisjtorresg@gmail.com	190.106.1.172	N
207	2019-06-29 17:07:36.669	jlrm2385@gmail.com	190.106.1.172	S
208	2019-06-29 17:07:55	hadmin@erpuno.com	190.106.1.172	S
209	2019-06-29 17:10:06.399	hadmin@erpuno.com	190.106.1.172	S
210	2019-06-29 19:06:14.62	jlrm2385@gmail.com	152.231.36.180	S
211	2019-06-29 22:34:33.116	hadmin@erpuno.com	190.212.242.227	S
212	2019-06-29 23:48:26.204	hadmin@erpuno.com	190.212.242.227	S
213	2019-06-29 23:50:01.75	hadmin@erpuno.com	190.212.242.227	S
214	2019-07-01 15:49:39.02	hadmin@erpuno.com	190.106.1.172	N
215	2019-07-01 15:49:43.886	hadmin@erpuno.com	190.106.1.172	S
216	2019-07-01 16:29:42.994	hadmin@erpuno.com	186.77.134.110	S
217	2019-07-02 21:44:19.12	hadmin@erpuno.com	186.77.228.189	S
218	2019-07-02 22:05:37.675	hadmin@erpuno.com	186.77.228.189	S
219	2019-07-02 22:42:47.729	hadmin@erpuno.com	186.77.228.189	S
220	2019-07-03 17:13:45.241	hadmin@erpuno.com	192.168.1.1	S
221	2019-07-03 17:16:29.475	hadmin@erpuno.com	192.168.1.1	S
222	2019-07-03 17:23:55.235	hadmin@erpuno.com	192.168.1.1	S
223	2019-07-03 17:25:04.633	hadmin@erpuno.com	192.168.1.1	S
224	2019-07-03 20:04:49.701	hadmin@erpuno.com	192.168.1.1	S
225	2019-07-03 20:09:33.143	hadmin@erpuno.com	192.168.1.1	S
226	2019-07-03 21:01:30.242	denisjtorresg@gmail.com	192.168.1.1	N
227	2019-07-04 07:56:37.659	jlrm2385@gmail.com	192.168.1.1	S
228	2019-07-04 07:59:02.743	tecnico@erpuno.com	192.168.1.1	S
229	2019-07-04 09:34:38.796	hadmin@erpuno.com	192.168.1.1	S
230	2019-07-04 09:39:45.105	hadmin@erpuno.com	192.168.1.1	S
231	2019-07-08 22:00:36.519	denisjtorresg@gmail.com	192.168.1.1	N
232	2019-07-08 22:02:52.557	denisjtorresg@gmail.com	192.168.1.1	S
233	2019-07-10 17:42:42.062	hadmin@erpuno.com	192.168.1.1	S
234	2019-07-11 08:23:02.181	hadmin@erpuno.com	192.168.1.1	S
235	2019-07-11 21:46:50.247	hadmin@erpuno.com	192.168.1.1	S
236	2019-07-11 21:56:34.175	hadmin@erpuno.com	192.168.1.1	S
237	2019-07-12 08:38:02.434	hadmin@erpuno.com	192.168.1.1	S
\.


--
-- Name: seg_login_id_login_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('seg_login_id_login_seq', 237, true);


--
-- Data for Name: seg_rol; Type: TABLE DATA; Schema: public; Owner: -
--

COPY seg_rol (rol, usuario_reg, fecha_reg, usuario_mod, fecha_mod) FROM stdin;
ADMIN	hadmin	2019-06-11 05:06:27.520173	\N	\N
MATERIAL	hadmin	2019-06-11 05:06:27.520173	\N	\N
FINANCIAMIENTO	hadmin	2019-06-11 05:06:27.520173	\N	\N
ADMIN_TECNICO	hadmin	2019-06-11 05:06:27.520173	\N	\N
TECNICO	hadmin	2019-06-11 05:06:27.520173	\N	\N
USUARIO	hadmin	2019-06-11 05:06:27.520173	\N	\N
DISTRIBUIDOR	hadmin	2019-07-11 22:46:34.713898	\N	\N
\.


--
-- Data for Name: seg_rol_usuario; Type: TABLE DATA; Schema: public; Owner: -
--

COPY seg_rol_usuario (id_usuario, rol) FROM stdin;
123e4567-e89b-12d3-a456-426655440000	ADMIN
0646f014-ec6e-4426-8147-8ccd08017328	MATERIAL
0646f014-ec6e-4426-8147-8ccd08017328	USUARIO
0126f013-ea6e-4426-8147-8ccd08017311	USUARIO
9175e50a-53bb-4339-ba5b-c47f4abd977c	USUARIO
9075e75b-53bb-4339-ba0b-c0004abd900c	USUARIO
9075e75b-53bb-4339-ba0b-c0004abd900c	ADMIN_TECNICO
9075e75b-53bb-4339-ba0b-c0004abd900c	TECNICO
08d6246f-6831-4c46-b805-287dfd19c1d0	USUARIO
08d6246f-6831-4c46-b805-287dfd19c1d0	TECNICO
2e1e1951-6a8f-4987-8a62-f48641009171	FINANCIAMIENTO
2e1e1951-6a8f-4987-8a62-f48641009171	USUARIO
9994952c-ae59-47a3-a872-0ac946299acd	FINANCIAMIENTO
9994952c-ae59-47a3-a872-0ac946299acd	USUARIO
34f2a6a8-733f-4ce6-ae51-492752c57bb5	USUARIO
34f2a6a8-733f-4ce6-ae51-492752c57bb5	MATERIAL
2595db63-4958-4049-8968-909553407df0	USUARIO
abbf868c-9eb0-43dc-ade0-e7c5b289905e	ADMIN_TECNICO
abbf868c-9eb0-43dc-ade0-e7c5b289905e	USUARIO
74710c90-4734-45b0-80f0-4f2e635de516	USUARIO
f51b6c57-48c7-4b76-b2b3-0c5838ee52db	USUARIO
d4eb9b93-5802-4187-8bb0-91fdc832a17f	USUARIO
d4eb9b93-5802-4187-8bb0-91fdc832a17f	TECNICO
16e38b72-4088-4022-a16d-75d3dab099ca	USUARIO
62f9042b-3899-4bf3-80a2-103bde4e3997	USUARIO
965146f9-a6f0-489b-a0a7-762a73dfe99c	USUARIO
653a488a-837f-4895-bfbd-38b34b88ab90	USUARIO
653a488a-837f-4895-bfbd-38b34b88ab90	MATERIAL
1f8632fd-450a-476a-8336-3773e0a45663	USUARIO
e51b834f-8934-44e1-9beb-1dac4763e253	ADMIN_TECNICO
87ac18ea-fd70-4cdc-b8d2-fb814460801e	USUARIO
87ac18ea-fd70-4cdc-b8d2-fb814460801e	TECNICO
943cd012-46c2-4bef-8967-433704af66ef	USUARIO
943cd012-46c2-4bef-8967-433704af66ef	TECNICO
42d7d9ee-2ca9-4c1c-b014-c274f938c856	USUARIO
8fe48435-a790-44c1-a316-eb906d6945a2	DISTRIBUIDOR
\.


--
-- Name: cat_maestro_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cat_maestro
    ADD CONSTRAINT cat_maestro_pkey PRIMARY KEY (id_cat_maestro);


--
-- Name: cms_archivo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cms_archivo
    ADD CONSTRAINT cms_archivo_pkey PRIMARY KEY (id_archivo);


--
-- Name: cms_contenido_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cms_contenido
    ADD CONSTRAINT cms_contenido_pkey PRIMARY KEY (id_contenido);


--
-- Name: cms_nodo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cms_nodo
    ADD CONSTRAINT cms_nodo_pkey PRIMARY KEY (id_nodo);


--
-- Name: oft_oferta_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY oft_oferta
    ADD CONSTRAINT oft_oferta_pkey PRIMARY KEY (id_oferta);


--
-- Name: oft_usar_oferta_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY oft_usar_oferta
    ADD CONSTRAINT oft_usar_oferta_pkey PRIMARY KEY (id_usar_oferta);


--
-- Name: per_calificacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY per_calificacion
    ADD CONSTRAINT per_calificacion_pkey PRIMARY KEY (id_calificacion);


--
-- Name: per_direccion_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY per_direccion
    ADD CONSTRAINT per_direccion_pkey PRIMARY KEY (id_direccion);


--
-- Name: per_usuario_correo_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY per_usuario
    ADD CONSTRAINT per_usuario_correo_key UNIQUE (correo);


--
-- Name: per_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY per_usuario
    ADD CONSTRAINT per_usuario_pkey PRIMARY KEY (id_usuario);


--
-- Name: pry_comentario_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pry_comentario
    ADD CONSTRAINT pry_comentario_pkey PRIMARY KEY (id_comentario);


--
-- Name: pry_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pry_proyecto
    ADD CONSTRAINT pry_proyecto_pkey PRIMARY KEY (id_proyecto);


--
-- Name: pub_publicidad_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pub_publicidad
    ADD CONSTRAINT pub_publicidad_pkey PRIMARY KEY (id_anuncio);


--
-- Name: seg_login_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY seg_login
    ADD CONSTRAINT seg_login_pkey PRIMARY KEY (id_login);


--
-- Name: seg_rol_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY seg_rol
    ADD CONSTRAINT seg_rol_pkey PRIMARY KEY (rol);


--
-- Name: seg_rol_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY seg_rol_usuario
    ADD CONSTRAINT seg_rol_usuario_pkey PRIMARY KEY (id_usuario, rol);


--
-- Name: idx_anuncio_fin; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_anuncio_fin ON pub_publicidad USING btree (activo, fin, id_ubicacion_anuncio);


--
-- Name: idx_anuncio_inicio; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_anuncio_inicio ON pub_publicidad USING btree (activo, inicio, id_ubicacion_anuncio);


--
-- Name: idx_cat_maestro_nombre; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cat_maestro_nombre ON cat_maestro USING btree (nombre);


--
-- Name: idx_cat_maestro_unq; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX idx_cat_maestro_unq ON cat_maestro USING btree (tipo_catalogo, nombre);


--
-- Name: idx_cms_archivo_nodo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cms_archivo_nodo ON cms_archivo USING btree (id_nodo, activo, orden);


--
-- Name: idx_cms_archivo_pry; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cms_archivo_pry ON cms_archivo USING btree (id_proyecto, activo, orden);


--
-- Name: idx_cms_archivo_titulo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cms_archivo_titulo ON cms_archivo USING btree (titulo);


--
-- Name: idx_cms_archivo_usr; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cms_archivo_usr ON cms_archivo USING btree (usuario_reg);


--
-- Name: idx_cms_nodo_titulo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cms_nodo_titulo ON cms_nodo USING btree (activo, titulo);


--
-- Name: idx_cms_tipo_nodo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cms_tipo_nodo ON cms_nodo USING btree (id_cms_tipo_nodo);


--
-- Name: idx_codigo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX idx_codigo ON oft_usar_oferta USING btree (codigo);


--
-- Name: idx_contenido_duenio; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_contenido_duenio ON cms_contenido USING btree (duenio);


--
-- Name: idx_oferta_fin; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_oferta_fin ON oft_oferta USING btree (activo, fin);


--
-- Name: idx_oferta_inicio; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_oferta_inicio ON oft_oferta USING btree (activo, inicio);


--
-- Name: idx_per_cal_usuario; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_per_cal_usuario ON per_calificacion USING btree (id_proveedor);


--
-- Name: idx_per_direccion_usuario; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_per_direccion_usuario ON per_direccion USING btree (id_usuario);


--
-- Name: idx_per_usr_activo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_per_usr_activo ON per_usuario USING btree (activo, id_usuario);


--
-- Name: idx_per_usr_cod_a; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_per_usr_cod_a ON per_usuario USING btree (codigo_activacion);


--
-- Name: idx_pry_coment_pry; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_pry_coment_pry ON pry_comentario USING btree (id_proyecto, activo);


--
-- Name: idx_pry_tecnico; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_pry_tecnico ON pry_proyecto USING btree (usuario_tecnico);


--
-- Name: idx_pry_usuario; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_pry_usuario ON pry_proyecto USING btree (usuario_duenio);


--
-- Name: idx_seg_login_fecha; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_seg_login_fecha ON seg_login USING btree (fecha, correo);


--
-- Name: idx_uniq; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX idx_uniq ON oft_usar_oferta USING btree (id_oferta, id_usuario);


--
-- Name: cms_archivo_id_cms_tipo_archivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_archivo
    ADD CONSTRAINT cms_archivo_id_cms_tipo_archivo_fkey FOREIGN KEY (id_cms_tipo_archivo) REFERENCES cat_maestro(id_cat_maestro) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: cms_archivo_id_nodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_archivo
    ADD CONSTRAINT cms_archivo_id_nodo_fkey FOREIGN KEY (id_nodo) REFERENCES cms_nodo(id_nodo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: cms_archivo_id_proyecto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_archivo
    ADD CONSTRAINT cms_archivo_id_proyecto_fkey FOREIGN KEY (id_proyecto) REFERENCES pry_proyecto(id_proyecto) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: cms_contenido_duenio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_contenido
    ADD CONSTRAINT cms_contenido_duenio_fkey FOREIGN KEY (duenio) REFERENCES per_usuario(id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: cms_nodo_id_cms_tipo_nodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_nodo
    ADD CONSTRAINT cms_nodo_id_cms_tipo_nodo_fkey FOREIGN KEY (id_cms_tipo_nodo) REFERENCES cat_maestro(id_cat_maestro) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: oft_oferta_duenio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oft_oferta
    ADD CONSTRAINT oft_oferta_duenio_fkey FOREIGN KEY (duenio) REFERENCES per_usuario(id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: oft_usar_oferta_id_oferta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oft_usar_oferta
    ADD CONSTRAINT oft_usar_oferta_id_oferta_fkey FOREIGN KEY (id_oferta) REFERENCES oft_oferta(id_oferta) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: oft_usar_oferta_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oft_usar_oferta
    ADD CONSTRAINT oft_usar_oferta_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES per_usuario(id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: per_calificacion_id_autor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY per_calificacion
    ADD CONSTRAINT per_calificacion_id_autor_fkey FOREIGN KEY (id_autor) REFERENCES per_usuario(id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: per_calificacion_id_proveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY per_calificacion
    ADD CONSTRAINT per_calificacion_id_proveedor_fkey FOREIGN KEY (id_proveedor) REFERENCES per_usuario(id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: per_calificacion_usuario_reg_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY per_calificacion
    ADD CONSTRAINT per_calificacion_usuario_reg_fkey FOREIGN KEY (usuario_reg) REFERENCES per_usuario(id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: per_direccion_id_localidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY per_direccion
    ADD CONSTRAINT per_direccion_id_localidad_fkey FOREIGN KEY (id_localidad) REFERENCES cat_maestro(id_cat_maestro) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: per_direccion_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY per_direccion
    ADD CONSTRAINT per_direccion_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES per_usuario(id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: pry_comentario_id_comentarista_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pry_comentario
    ADD CONSTRAINT pry_comentario_id_comentarista_fkey FOREIGN KEY (id_comentarista) REFERENCES per_usuario(id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: pry_comentario_id_proyecto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pry_comentario
    ADD CONSTRAINT pry_comentario_id_proyecto_fkey FOREIGN KEY (id_proyecto) REFERENCES pry_proyecto(id_proyecto) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: pry_proyecto_id_banco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pry_proyecto
    ADD CONSTRAINT pry_proyecto_id_banco_fkey FOREIGN KEY (id_banco) REFERENCES cat_maestro(id_cat_maestro) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: pry_proyecto_id_estado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pry_proyecto
    ADD CONSTRAINT pry_proyecto_id_estado_fkey FOREIGN KEY (id_estado) REFERENCES cat_maestro(id_cat_maestro) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: pry_proyecto_id_moneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pry_proyecto
    ADD CONSTRAINT pry_proyecto_id_moneda_fkey FOREIGN KEY (id_moneda) REFERENCES cat_maestro(id_cat_maestro) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: pry_proyecto_id_pry_forma_pago_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pry_proyecto
    ADD CONSTRAINT pry_proyecto_id_pry_forma_pago_fkey FOREIGN KEY (id_pry_forma_pago) REFERENCES cat_maestro(id_cat_maestro) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: pry_proyecto_id_pry_tipo_servicio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pry_proyecto
    ADD CONSTRAINT pry_proyecto_id_pry_tipo_servicio_fkey FOREIGN KEY (id_pry_tipo_servicio) REFERENCES cat_maestro(id_cat_maestro) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: pry_proyecto_usuario_duenio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pry_proyecto
    ADD CONSTRAINT pry_proyecto_usuario_duenio_fkey FOREIGN KEY (usuario_duenio) REFERENCES per_usuario(id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: pry_proyecto_usuario_tecnico_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pry_proyecto
    ADD CONSTRAINT pry_proyecto_usuario_tecnico_fkey FOREIGN KEY (usuario_tecnico) REFERENCES per_usuario(id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: pub_publicidad_id_ubicacion_anuncio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pub_publicidad
    ADD CONSTRAINT pub_publicidad_id_ubicacion_anuncio_fkey FOREIGN KEY (id_ubicacion_anuncio) REFERENCES cat_maestro(id_cat_maestro) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: seg_rol_usuario_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY seg_rol_usuario
    ADD CONSTRAINT seg_rol_usuario_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES per_usuario(id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: seg_rol_usuario_rol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY seg_rol_usuario
    ADD CONSTRAINT seg_rol_usuario_rol_fkey FOREIGN KEY (rol) REFERENCES seg_rol(rol) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

