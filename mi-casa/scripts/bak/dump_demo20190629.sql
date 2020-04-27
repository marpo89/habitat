--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cat_maestro; Type: TABLE; Schema: public; Owner: micasa; Tablespace: 
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


ALTER TABLE public.cat_maestro OWNER TO micasa;

--
-- Name: cat_maestro_id_cat_maestro_seq; Type: SEQUENCE; Schema: public; Owner: micasa
--

CREATE SEQUENCE cat_maestro_id_cat_maestro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cat_maestro_id_cat_maestro_seq OWNER TO micasa;

--
-- Name: cat_maestro_id_cat_maestro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: micasa
--

ALTER SEQUENCE cat_maestro_id_cat_maestro_seq OWNED BY cat_maestro.id_cat_maestro;


--
-- Name: cms_archivo; Type: TABLE; Schema: public; Owner: micasa; Tablespace: 
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


ALTER TABLE public.cms_archivo OWNER TO micasa;

--
-- Name: cms_archivo_id_archivo_seq; Type: SEQUENCE; Schema: public; Owner: micasa
--

CREATE SEQUENCE cms_archivo_id_archivo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_archivo_id_archivo_seq OWNER TO micasa;

--
-- Name: cms_archivo_id_archivo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: micasa
--

ALTER SEQUENCE cms_archivo_id_archivo_seq OWNED BY cms_archivo.id_archivo;


--
-- Name: cms_contenido; Type: TABLE; Schema: public; Owner: micasa; Tablespace: 
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


ALTER TABLE public.cms_contenido OWNER TO micasa;

--
-- Name: cms_contenido_id_contenido_seq; Type: SEQUENCE; Schema: public; Owner: micasa
--

CREATE SEQUENCE cms_contenido_id_contenido_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_contenido_id_contenido_seq OWNER TO micasa;

--
-- Name: cms_contenido_id_contenido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: micasa
--

ALTER SEQUENCE cms_contenido_id_contenido_seq OWNED BY cms_contenido.id_contenido;


--
-- Name: cms_nodo; Type: TABLE; Schema: public; Owner: micasa; Tablespace: 
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


ALTER TABLE public.cms_nodo OWNER TO micasa;

--
-- Name: cms_nodo_id_nodo_seq; Type: SEQUENCE; Schema: public; Owner: micasa
--

CREATE SEQUENCE cms_nodo_id_nodo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_nodo_id_nodo_seq OWNER TO micasa;

--
-- Name: cms_nodo_id_nodo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: micasa
--

ALTER SEQUENCE cms_nodo_id_nodo_seq OWNED BY cms_nodo.id_nodo;


--
-- Name: oft_oferta; Type: TABLE; Schema: public; Owner: micasa; Tablespace: 
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


ALTER TABLE public.oft_oferta OWNER TO micasa;

--
-- Name: oft_oferta_id_oferta_seq; Type: SEQUENCE; Schema: public; Owner: micasa
--

CREATE SEQUENCE oft_oferta_id_oferta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oft_oferta_id_oferta_seq OWNER TO micasa;

--
-- Name: oft_oferta_id_oferta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: micasa
--

ALTER SEQUENCE oft_oferta_id_oferta_seq OWNED BY oft_oferta.id_oferta;


--
-- Name: oft_usar_oferta; Type: TABLE; Schema: public; Owner: micasa; Tablespace: 
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


ALTER TABLE public.oft_usar_oferta OWNER TO micasa;

--
-- Name: oft_usar_oferta_id_usar_oferta_seq; Type: SEQUENCE; Schema: public; Owner: micasa
--

CREATE SEQUENCE oft_usar_oferta_id_usar_oferta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oft_usar_oferta_id_usar_oferta_seq OWNER TO micasa;

--
-- Name: oft_usar_oferta_id_usar_oferta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: micasa
--

ALTER SEQUENCE oft_usar_oferta_id_usar_oferta_seq OWNED BY oft_usar_oferta.id_usar_oferta;


--
-- Name: per_calificacion; Type: TABLE; Schema: public; Owner: micasa; Tablespace: 
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


ALTER TABLE public.per_calificacion OWNER TO micasa;

--
-- Name: per_calificacion_id_calificacion_seq; Type: SEQUENCE; Schema: public; Owner: micasa
--

CREATE SEQUENCE per_calificacion_id_calificacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.per_calificacion_id_calificacion_seq OWNER TO micasa;

--
-- Name: per_calificacion_id_calificacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: micasa
--

ALTER SEQUENCE per_calificacion_id_calificacion_seq OWNED BY per_calificacion.id_calificacion;


--
-- Name: per_direccion; Type: TABLE; Schema: public; Owner: micasa; Tablespace: 
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


ALTER TABLE public.per_direccion OWNER TO micasa;

--
-- Name: per_direccion_id_direccion_seq; Type: SEQUENCE; Schema: public; Owner: micasa
--

CREATE SEQUENCE per_direccion_id_direccion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.per_direccion_id_direccion_seq OWNER TO micasa;

--
-- Name: per_direccion_id_direccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: micasa
--

ALTER SEQUENCE per_direccion_id_direccion_seq OWNED BY per_direccion.id_direccion;


--
-- Name: per_usuario; Type: TABLE; Schema: public; Owner: micasa; Tablespace: 
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


ALTER TABLE public.per_usuario OWNER TO micasa;

--
-- Name: pry_comentario; Type: TABLE; Schema: public; Owner: micasa; Tablespace: 
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
    fecha_mod timestamp without time zone
);


ALTER TABLE public.pry_comentario OWNER TO micasa;

--
-- Name: pry_comentario_id_comentario_seq; Type: SEQUENCE; Schema: public; Owner: micasa
--

CREATE SEQUENCE pry_comentario_id_comentario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pry_comentario_id_comentario_seq OWNER TO micasa;

--
-- Name: pry_comentario_id_comentario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: micasa
--

ALTER SEQUENCE pry_comentario_id_comentario_seq OWNED BY pry_comentario.id_comentario;


--
-- Name: pry_proyecto; Type: TABLE; Schema: public; Owner: micasa; Tablespace: 
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


ALTER TABLE public.pry_proyecto OWNER TO micasa;

--
-- Name: pry_proyecto_id_proyecto_seq; Type: SEQUENCE; Schema: public; Owner: micasa
--

CREATE SEQUENCE pry_proyecto_id_proyecto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pry_proyecto_id_proyecto_seq OWNER TO micasa;

--
-- Name: pry_proyecto_id_proyecto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: micasa
--

ALTER SEQUENCE pry_proyecto_id_proyecto_seq OWNED BY pry_proyecto.id_proyecto;


--
-- Name: pub_publicidad; Type: TABLE; Schema: public; Owner: micasa; Tablespace: 
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


ALTER TABLE public.pub_publicidad OWNER TO micasa;

--
-- Name: pub_publicidad_id_anuncio_seq; Type: SEQUENCE; Schema: public; Owner: micasa
--

CREATE SEQUENCE pub_publicidad_id_anuncio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pub_publicidad_id_anuncio_seq OWNER TO micasa;

--
-- Name: pub_publicidad_id_anuncio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: micasa
--

ALTER SEQUENCE pub_publicidad_id_anuncio_seq OWNED BY pub_publicidad.id_anuncio;


--
-- Name: seg_login; Type: TABLE; Schema: public; Owner: micasa; Tablespace: 
--

CREATE TABLE seg_login (
    id_login bigint NOT NULL,
    fecha timestamp without time zone NOT NULL,
    correo character varying(100),
    ip character varying(100),
    exitoso character(1) DEFAULT 'N'::bpchar
);


ALTER TABLE public.seg_login OWNER TO micasa;

--
-- Name: seg_login_id_login_seq; Type: SEQUENCE; Schema: public; Owner: micasa
--

CREATE SEQUENCE seg_login_id_login_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seg_login_id_login_seq OWNER TO micasa;

--
-- Name: seg_login_id_login_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: micasa
--

ALTER SEQUENCE seg_login_id_login_seq OWNED BY seg_login.id_login;


--
-- Name: seg_rol; Type: TABLE; Schema: public; Owner: micasa; Tablespace: 
--

CREATE TABLE seg_rol (
    rol character varying(100) NOT NULL,
    usuario_reg character varying(100),
    fecha_reg timestamp without time zone,
    usuario_mod character varying(100),
    fecha_mod timestamp without time zone
);


ALTER TABLE public.seg_rol OWNER TO micasa;

--
-- Name: seg_rol_usuario; Type: TABLE; Schema: public; Owner: micasa; Tablespace: 
--

CREATE TABLE seg_rol_usuario (
    id_usuario character varying(40) NOT NULL,
    rol character varying(100) NOT NULL
);


ALTER TABLE public.seg_rol_usuario OWNER TO micasa;

--
-- Name: vw_oferta; Type: VIEW; Schema: public; Owner: micasa
--

CREATE VIEW vw_oferta AS
    SELECT o.id_oferta, o.duenio, o.titulo, o.contenido, o.inicio, o.fin, o.limite_cantidad, o.archivo1, o.archivo2, o.archivo3, o.activo, o.usuario_reg, o.fecha_reg, o.usuario_mod, o.fecha_mod, COALESCE(uo.tomadas, (0)::bigint) AS tomadas FROM (oft_oferta o LEFT JOIN (SELECT count(oft_usar_oferta.id_oferta) AS tomadas, oft_usar_oferta.id_oferta FROM oft_usar_oferta GROUP BY oft_usar_oferta.id_oferta) uo ON ((o.id_oferta = uo.id_oferta))) WHERE (((((uo.tomadas IS NULL) OR (o.limite_cantidad > uo.tomadas)) OR (o.limite_cantidad = 0)) AND (o.activo = 'S'::bpchar)) AND ((o.inicio <= ('now'::text)::date) AND (o.fin >= ('now'::text)::date)));


ALTER TABLE public.vw_oferta OWNER TO micasa;

--
-- Name: vw_proveedor; Type: VIEW; Schema: public; Owner: micasa
--

CREATE VIEW vw_proveedor AS
    SELECT pg_catalog.concat(u.id_usuario, '-', s.rol) AS id, u.id_usuario, u.correo, u.clave, u.activo, u.codigo_activacion, u.nombres, u.fecha_nac, u.sexo, u.contacto, u.telefonos, u.direccion_fisica, u.facebook, u.twitter, u.whatsapp, u.sitio_web, u.ir_perfil, u.avatar, u.usuario_reg, u.fecha_reg, u.usuario_mod, u.fecha_mod, round(COALESCE(c.puntaje, (0)::numeric)) AS puntaje, s.rol, COALESCE(oft.cant_ofertas, (0)::bigint) AS cant_ofertas FROM (((per_usuario u JOIN seg_rol_usuario s ON ((((s.id_usuario)::text = (u.id_usuario)::text) AND ((s.rol)::text = ANY ((ARRAY['FINANCIAMIENTO'::character varying, 'MATERIAL'::character varying])::text[]))))) LEFT JOIN (SELECT avg(per_calificacion.puntaje) AS puntaje, per_calificacion.id_proveedor FROM per_calificacion WHERE (per_calificacion.puntaje >= 0) GROUP BY per_calificacion.id_proveedor) c ON (((c.id_proveedor)::text = (u.id_usuario)::text))) LEFT JOIN (SELECT count(*) AS cant_ofertas, o.duenio FROM vw_oferta o GROUP BY o.duenio) oft ON (((oft.duenio)::text = (u.id_usuario)::text))) WHERE (u.activo = 'S'::bpchar);


ALTER TABLE public.vw_proveedor OWNER TO micasa;

--
-- Name: id_cat_maestro; Type: DEFAULT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY cat_maestro ALTER COLUMN id_cat_maestro SET DEFAULT nextval('cat_maestro_id_cat_maestro_seq'::regclass);


--
-- Name: id_archivo; Type: DEFAULT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY cms_archivo ALTER COLUMN id_archivo SET DEFAULT nextval('cms_archivo_id_archivo_seq'::regclass);


--
-- Name: id_contenido; Type: DEFAULT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY cms_contenido ALTER COLUMN id_contenido SET DEFAULT nextval('cms_contenido_id_contenido_seq'::regclass);


--
-- Name: id_nodo; Type: DEFAULT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY cms_nodo ALTER COLUMN id_nodo SET DEFAULT nextval('cms_nodo_id_nodo_seq'::regclass);


--
-- Name: id_oferta; Type: DEFAULT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY oft_oferta ALTER COLUMN id_oferta SET DEFAULT nextval('oft_oferta_id_oferta_seq'::regclass);


--
-- Name: id_usar_oferta; Type: DEFAULT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY oft_usar_oferta ALTER COLUMN id_usar_oferta SET DEFAULT nextval('oft_usar_oferta_id_usar_oferta_seq'::regclass);


--
-- Name: id_calificacion; Type: DEFAULT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY per_calificacion ALTER COLUMN id_calificacion SET DEFAULT nextval('per_calificacion_id_calificacion_seq'::regclass);


--
-- Name: id_direccion; Type: DEFAULT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY per_direccion ALTER COLUMN id_direccion SET DEFAULT nextval('per_direccion_id_direccion_seq'::regclass);


--
-- Name: id_comentario; Type: DEFAULT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY pry_comentario ALTER COLUMN id_comentario SET DEFAULT nextval('pry_comentario_id_comentario_seq'::regclass);


--
-- Name: id_proyecto; Type: DEFAULT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY pry_proyecto ALTER COLUMN id_proyecto SET DEFAULT nextval('pry_proyecto_id_proyecto_seq'::regclass);


--
-- Name: id_anuncio; Type: DEFAULT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY pub_publicidad ALTER COLUMN id_anuncio SET DEFAULT nextval('pub_publicidad_id_anuncio_seq'::regclass);


--
-- Name: id_login; Type: DEFAULT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY seg_login ALTER COLUMN id_login SET DEFAULT nextval('seg_login_id_login_seq'::regclass);


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
INSERT INTO cat_maestro VALUES (48, 'PARAMETRO_APP', 'PIE_DE_PAGINA', 'Mi Casa es un servicio soportado por <a target="_blank" href="http://www.habitatnicaragua.org">Hábitat para la Humanidad Nicaragua</a> | 
		<a target="_blank" href="https://www.facebook.com/micasa.com.ni/"><i class="fa fa-facebook-official fa-2"></i></a> | 
		<a target="_blank" href="https://www.instagram.com/micasa.com.ni/"><i class="fa fa-instagram fa-2"></i></a>', 'S', 'hadmin', '2019-06-11 05:06:27.520173', '123e4567-e89b-12d3-a456-426655440000', '2019-06-11 19:25:55.496');
INSERT INTO cat_maestro VALUES (205, 'PARAMETRO_APP', 'CORREO_NOTIFICAR_NUEVO_COMENTARIO_ASUNTO', 'Nuevo Comentario', 'S', 'hadmin', '2019-06-11 05:06:27.520173', '123e4567-e89b-12d3-a456-426655440000', '2019-06-19 02:45:15.426');


--
-- Name: cat_maestro_id_cat_maestro_seq; Type: SEQUENCE SET; Schema: public; Owner: micasa
--

SELECT pg_catalog.setval('cat_maestro_id_cat_maestro_seq', 205, true);


--
-- Data for Name: cms_archivo; Type: TABLE DATA; Schema: public; Owner: micasa
--

INSERT INTO cms_archivo VALUES (1, 49, NULL, 1, 'Video portada', 0, 'zENBgVJmd-w', NULL, 'Video Portada', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_archivo VALUES (19, 49, NULL, 7, 'Servicios de asistencia técnica en construcción', 6, 'LfjgIPqjDIY', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_archivo VALUES (14, 49, NULL, 4, 'Tips para selección y compra de materiales', 0, 'lA_6MbZau6k', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_archivo VALUES (15, 49, NULL, 4, 'Tips para la contratación de mano de obra', 1, 'mVsTZDEaXb4', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_archivo VALUES (17, 50, NULL, 4, 'Proveedores de materiales de construcción y mano de obra', 2, '', '/usuario/listaProveedores.xhtml?rol=material', '', 'S', 'hadmin@erpuno.com', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_archivo VALUES (18, 194, NULL, 7, 'Historia de Habitat', 0, '', '/nodos/7/4ae75c53-c3a5-4d38-a948-0d763373247c.mp4', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_archivo VALUES (21, 50, NULL, 8, 'Paso 1: Cree su perfil', 1, '', '/usuario/miPerfil.xhtml', '', 'S', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 22:02:16.405', NULL, NULL);
INSERT INTO cms_archivo VALUES (22, 50, NULL, 8, 'Paso 2: Realice el pago del servicio', 2, '', '/publico/pagina.xhtml?p=6', '', 'S', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 22:03:08.01', NULL, NULL);
INSERT INTO cms_archivo VALUES (23, 50, NULL, 8, 'Paso 3: Programe su visita', 3, '', '/proyecto/miProyectoForm.xhtml', '', 'S', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 22:04:31.374', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 22:04:41.84');
INSERT INTO cms_archivo VALUES (35, 51, 3, NULL, 'Plano_de_Proyecto.jpg', 0, NULL, '/proyectos/3/7f21eaa7-b98d-4b72-bf16-247d0afc1778.jpg', NULL, 'S', '08d6246f-6831-4c46-b805-287dfd19c1d0', '2019-06-21 02:46:31.513', NULL, NULL);
INSERT INTO cms_archivo VALUES (3, 49, NULL, 2, 'Paso 1: Planifique la mejora de su vivienda', 1, 'KT3zbBk6aFY', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', '123e4567-e89b-12d3-a456-426655440000', '2019-06-11 18:43:38.874');
INSERT INTO cms_archivo VALUES (4, 49, NULL, 2, 'Paso 2: Presupuesto', 2, 'hEmkjrxI4Lg', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', '123e4567-e89b-12d3-a456-426655440000', '2019-06-11 18:44:15.297');
INSERT INTO cms_archivo VALUES (5, 49, NULL, 2, 'Paso 3: Mano de obra', 3, 'eqva1Tkv-YI', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', '123e4567-e89b-12d3-a456-426655440000', '2019-06-11 18:44:41.112');
INSERT INTO cms_archivo VALUES (6, 49, NULL, 2, 'Paso 4: Materiales de construcción', 4, 'T3CyNQHHCgk', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', '123e4567-e89b-12d3-a456-426655440000', '2019-06-11 18:44:59.563');
INSERT INTO cms_archivo VALUES (24, 50, NULL, 8, 'Paso 4: Revise su proyecto', 4, '', '/proyecto/misProyectos.xhtml', '', 'S', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 22:05:49.947', '123e4567-e89b-12d3-a456-426655440000', '2019-06-28 04:19:52.259');
INSERT INTO cms_archivo VALUES (26, 49, NULL, 7, 'Curso Construcción Segura', 0, 'T6ZCPbaMOYU', '', '', 'S', '123e4567-e89b-12d3-a456-426655440000', '2019-06-11 19:31:01.867', NULL, NULL);
INSERT INTO cms_archivo VALUES (7, 50, NULL, 2, 'Paso 5: Asistencia técnica para la construcción', 5, '', '/proyecto/asistencia.xhtml', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', '123e4567-e89b-12d3-a456-426655440000', '2019-06-14 23:45:37.688');
INSERT INTO cms_archivo VALUES (11, 49, NULL, 3, 'Crédito como Estrategia Financiera', 2, 'bi9YbPlgpE4', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', '123e4567-e89b-12d3-a456-426655440000', '2019-06-18 22:38:15.52');
INSERT INTO cms_archivo VALUES (20, 49, NULL, 8, 'Contratar Servicio de Asistencia Técnica', 0, '6hJsVMmhxvI', '', '', 'S', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 22:00:30.198', '123e4567-e89b-12d3-a456-426655440000', '2019-06-18 20:36:05.009');
INSERT INTO cms_archivo VALUES (27, 51, 2, NULL, 'Imagen1.jpg', 0, NULL, '/proyectos/2/83a2539d-082c-413e-b496-26219b575ec8.jpg', NULL, 'S', '9075e75b-53bb-4339-ba0b-c0004abd900c', '2019-06-18 21:06:56.872', NULL, NULL);
INSERT INTO cms_archivo VALUES (28, 51, 2, NULL, 'Libro1.pdf', 0, NULL, '/proyectos/2/7e40bffe-d9d5-45b7-92c5-f349fe4bf51c.pdf', NULL, 'N', '9075e75b-53bb-4339-ba0b-c0004abd900c', '2019-06-18 21:38:57.289', '9075e75b-53bb-4339-ba0b-c0004abd900c', '2019-06-18 21:39:01.54');
INSERT INTO cms_archivo VALUES (29, 51, 2, NULL, 'Especificaciones_tecnica.pdf', 0, NULL, '/proyectos/2/d31adb72-77a5-43ba-8b95-856240352a77.pdf', NULL, 'S', '9075e75b-53bb-4339-ba0b-c0004abd900c', '2019-06-18 21:39:29.247', NULL, NULL);
INSERT INTO cms_archivo VALUES (30, 50, NULL, 6, 'Precios de Nuestros Servicios', 1, '', '/nodos/6/17dd95b8-2f15-47b5-b021-01a89fb150d7.png', '', 'S', '123e4567-e89b-12d3-a456-426655440000', '2019-06-18 22:24:04.966', '123e4567-e89b-12d3-a456-426655440000', '2019-06-18 22:34:06.974');
INSERT INTO cms_archivo VALUES (2, 49, NULL, 2, 'Pasos para un Proyecto Exitoso', 0, 'le1ANsJa9Po', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', '123e4567-e89b-12d3-a456-426655440000', '2019-06-19 16:35:33.297');
INSERT INTO cms_archivo VALUES (31, 51, 4, NULL, 'recoleccion_de_agua_de_lluvia.pdf', 0, NULL, '/proyectos/4/09e4345c-2dd4-4339-9cf4-ca363fcf753a.pdf', NULL, 'S', '08d6246f-6831-4c46-b805-287dfd19c1d0', '2019-06-19 18:24:35.646', NULL, NULL);
INSERT INTO cms_archivo VALUES (32, 51, 4, NULL, '100_3727.JPG', 0, NULL, '/proyectos/4/94496db3-7f63-4e9d-985a-2b372f04c5bb.JPG', NULL, 'S', '08d6246f-6831-4c46-b805-287dfd19c1d0', '2019-06-19 18:28:30.455', NULL, NULL);
INSERT INTO cms_archivo VALUES (33, 51, 4, NULL, 'homero.png', 0, NULL, '/proyectos/4/a7111631-1980-4b41-a0fc-bd276292dd87.png', NULL, 'S', '08d6246f-6831-4c46-b805-287dfd19c1d0', '2019-06-19 18:29:09.267', NULL, NULL);
INSERT INTO cms_archivo VALUES (13, 49, NULL, 3, 'Presupuesto y Disponibilidad Financiera', 1, 'G0cf0znZcmY', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', '123e4567-e89b-12d3-a456-426655440000', '2019-06-19 20:16:49.512');
INSERT INTO cms_archivo VALUES (12, 49, NULL, 3, 'Ahorro como Estrategia Financiera', 3, 'QjmzSuPRy5E', '', '', 'S', 'hadmin', '2019-06-10 06:43:54.852107', '123e4567-e89b-12d3-a456-426655440000', '2019-06-19 20:17:27.811');
INSERT INTO cms_archivo VALUES (16, 50, NULL, 3, 'Financiamiento Disponible', 4, '', '/usuario/listaProveedores.xhtml?rol=financiamiento', '', 'S', 'hadmin@erpuno.com', '2019-06-10 06:43:54.852107', '123e4567-e89b-12d3-a456-426655440000', '2019-06-19 20:17:40.013');
INSERT INTO cms_archivo VALUES (34, 49, NULL, 3, 'Como Financiar Mi Proyecto', 0, 'G0cf0znZcmY', '', '', 'S', '123e4567-e89b-12d3-a456-426655440000', '2019-06-19 20:16:17.221', '123e4567-e89b-12d3-a456-426655440000', '2019-06-19 20:18:01.662');


--
-- Name: cms_archivo_id_archivo_seq; Type: SEQUENCE SET; Schema: public; Owner: micasa
--

SELECT pg_catalog.setval('cms_archivo_id_archivo_seq', 35, true);


--
-- Data for Name: cms_contenido; Type: TABLE DATA; Schema: public; Owner: micasa
--

INSERT INTO cms_contenido VALUES (1, 'Ecofiltro', '<p>Obtén 10% de descuento sobre el precio del Ecofiltro al realizar tu compra con el financiamiento de FUNDENUSE. Promoción válida para clientes de sucursal Estelí y Ocotal.</p>', '9994952c-ae59-47a3-a872-0ac946299acd', '/contenido2/1/b5acbf15-4daa-4155-ae37-9af926c11dc1.jpg', '', '9994952c-ae59-47a3-a872-0ac946299acd', '2019-06-12 16:40:42.99', '9994952c-ae59-47a3-a872-0ac946299acd', '2019-06-12 16:40:42.99');
INSERT INTO cms_contenido VALUES (2, 'Ya llegó CEMEX', '', '0646f014-ec6e-4426-8147-8ccd08017328', NULL, 'TuidkzEfU3I', '0646f014-ec6e-4426-8147-8ccd08017328', '2019-06-15 04:30:44.052', NULL, NULL);
INSERT INTO cms_contenido VALUES (4, 'Prueba', '<p><a href="https://www.youtube.com/watch?v=pOefbmyGdmM">https://www.youtube.com/watch?v=pOefbmyGdmM</a></p>', '0646f014-ec6e-4426-8147-8ccd08017328', NULL, 'pOefbmyGdmM', '0646f014-ec6e-4426-8147-8ccd08017328', '2019-06-18 21:54:34.316', '0646f014-ec6e-4426-8147-8ccd08017328', '2019-06-18 22:09:05.29');
INSERT INTO cms_contenido VALUES (6, 'Contenido de Validación', '<h1>Hábitat Nicaragua</h1> 
<p>Hábitat for Humanity</p>', '34f2a6a8-733f-4ce6-ae51-492752c57bb5', NULL, 'LSNUq_1apIM', '34f2a6a8-733f-4ce6-ae51-492752c57bb5', '2019-06-18 22:01:48.482', '34f2a6a8-733f-4ce6-ae51-492752c57bb5', '2019-06-19 00:19:19.817');
INSERT INTO cms_contenido VALUES (7, 'Servicio de Asistencia Técnica en Construcción', '<p>Regístrese en línea, pague el servicio contratado, reciba la visita de nuestro técnico y descargue los planos, diseños y presupuesto de su proyecto, desde su celular, tablet o computadora. </p>', '34f2a6a8-733f-4ce6-ae51-492752c57bb5', '/contenido2/7/934791c6-99e2-4570-8cab-2b7af660cd30.png', '', '34f2a6a8-733f-4ce6-ae51-492752c57bb5', '2019-06-19 00:28:31.355', '34f2a6a8-733f-4ce6-ae51-492752c57bb5', '2019-06-19 00:39:08.237');


--
-- Name: cms_contenido_id_contenido_seq; Type: SEQUENCE SET; Schema: public; Owner: micasa
--

SELECT pg_catalog.setval('cms_contenido_id_contenido_seq', 7, true);


--
-- Data for Name: cms_nodo; Type: TABLE DATA; Schema: public; Owner: micasa
--

INSERT INTO cms_nodo VALUES (1, 1, 'CONSTRUYA CON NOSOTROS', NULL, 'S', '/index.xhtml', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_nodo VALUES (2, 52, 'Mi Proyecto', NULL, 'S', '/proyecto/index.xhtml', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_nodo VALUES (3, 52, 'Financiamiento', '', 'S', '/financiamiento/index.xhtml', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_nodo VALUES (4, 52, 'Materiales y Mano de Obra', '', 'S', '/materiales/index.xhtml', 'S', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_nodo VALUES (7, 2, 'Videos Habitat', '', 'S', '', 'N', 'hadmin', '2019-06-10 06:43:54.852107', NULL, NULL);
INSERT INTO cms_nodo VALUES (8, 52, 'Contratar Servicio de Asistencia Técnica', '', 'S', '/proyecto/asistencia.xhtml', 'S', '123e4567-e89b-12d3-a456-426655440000', '2019-06-10 20:37:04.345', '123e4567-e89b-12d3-a456-426655440000', '2019-06-18 20:34:24.852');
INSERT INTO cms_nodo VALUES (6, 1, 'Pasos para pagar los servicios ATC', '<p><img alt="" src="/nodos/6/17dd95b8-2f15-47b5-b021-01a89fb150d7.png" />Los servicios brindados por la unidad de ATC (Asistencia T&eacute;cnica en Construcci&oacute;n) de H&aacute;bitat&nbsp;incluyen, desde la elaboraci&oacute;n de planos y presupuesto, hasta la asesor&iacute;a y supervisi&oacute;n de obras de construcci&oacute;n.</p>

<p>Los costos var&iacute;an seg&uacute;n el servicio solicitado.&nbsp;Para saber con precisi&oacute;n el costo del servicio que usted desea, favor cont&aacute;ctenos al tel&eacute;fono: 2270-1080 o al correo electr&oacute;nico: asistenciaenconstrucci&oacute;n@habitatnicaragua.org</p>

<p>Por favor realice su pago haciendo transferencia o depositando en cualquiera de nuestras cuentas, el costo indicado:</p>

<ul>
	<li>BANCO DE AMERICA CENTRAL (BAC)
	<ul>
		<li>C&oacute;rdobas:&nbsp;351032024</li>
		<li>D&oacute;lares:&nbsp; &nbsp; 351220090</li>
	</ul>
	</li>
	<li>BANCO CENTROAMERICANO (BANCENTRO)
	<ul>
		<li>C&oacute;rdobas:&nbsp;100200124</li>
		<li>D&oacute;lares:&nbsp; &nbsp; 101200134</li>
	</ul>
	</li>
</ul>

<p>Una vez que realice el pago, haga uso de nuestro Programador de Visitas T&eacute;cnica, para que un T&eacute;cnico de H&aacute;bitat lo visite.&nbsp;</p>

<p>Recuerde que en este momento nuestros servicios de ATC est&aacute; disponible en&nbsp;los siguientes departamentos del pa&iacute;s: Managua, Estel&iacute; y Matagalpa.&nbsp;</p>
', 'S', '', 'N', 'hadmin', '2019-06-10 06:43:54.852107', '123e4567-e89b-12d3-a456-426655440000', '2019-06-18 22:34:50.558');


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

INSERT INTO oft_usar_oferta VALUES (2, 2, '123e4567-e89b-12d3-a456-426655440000', '190614-2-1-Hzjf', '123e4567-e89b-12d3-a456-426655440000', '2019-06-14 18:49:36.208', NULL, NULL);
INSERT INTO oft_usar_oferta VALUES (5, 4, '123e4567-e89b-12d3-a456-426655440000', '190618-4-1-MQM8', '123e4567-e89b-12d3-a456-426655440000', '2019-06-18 22:46:56.371', NULL, NULL);
INSERT INTO oft_usar_oferta VALUES (6, 3, '123e4567-e89b-12d3-a456-426655440000', '190618-3-1-9k2e', '123e4567-e89b-12d3-a456-426655440000', '2019-06-18 22:47:10.773', NULL, NULL);
INSERT INTO oft_usar_oferta VALUES (8, 3, '2595db63-4958-4049-8968-909553407df0', '190618-3-2-a7Lz', '2595db63-4958-4049-8968-909553407df0', '2019-06-18 22:51:10.525', NULL, NULL);
INSERT INTO oft_usar_oferta VALUES (14, 2, '2595db63-4958-4049-8968-909553407df0', '190619-2-2-rd6H', '2595db63-4958-4049-8968-909553407df0', '2019-06-19 19:38:57.636', NULL, NULL);
INSERT INTO oft_usar_oferta VALUES (17, 2, '0646f014-ec6e-4426-8147-8ccd08017328', '190619-2-0-Yzjs', '0646f014-ec6e-4426-8147-8ccd08017328', '2019-06-19 19:59:38.766', NULL, NULL);
INSERT INTO oft_usar_oferta VALUES (20, 2, '74710c90-4734-45b0-80f0-4f2e635de516', '190624-2-7-mSCo', '74710c90-4734-45b0-80f0-4f2e635de516', '2019-06-24 20:21:11.062', NULL, NULL);
INSERT INTO oft_usar_oferta VALUES (21, 4, '1f8632fd-450a-476a-8336-3773e0a45663', '190628-4-1-98iX', '1f8632fd-450a-476a-8336-3773e0a45663', '2019-06-28 17:41:07.124', NULL, NULL);


--
-- Name: oft_usar_oferta_id_usar_oferta_seq; Type: SEQUENCE SET; Schema: public; Owner: micasa
--

SELECT pg_catalog.setval('oft_usar_oferta_id_usar_oferta_seq', 21, true);


--
-- Data for Name: per_calificacion; Type: TABLE DATA; Schema: public; Owner: micasa
--

INSERT INTO per_calificacion VALUES (1, 5, 'ffff', '34f2a6a8-733f-4ce6-ae51-492752c57bb5', '123e4567-e89b-12d3-a456-426655440000', '123e4567-e89b-12d3-a456-426655440000', '2019-06-18 21:09:08.908', NULL, NULL);
INSERT INTO per_calificacion VALUES (2, 3, 'Prueba', '34f2a6a8-733f-4ce6-ae51-492752c57bb5', '123e4567-e89b-12d3-a456-426655440000', '123e4567-e89b-12d3-a456-426655440000', '2019-06-18 21:42:44.78', NULL, NULL);
INSERT INTO per_calificacion VALUES (3, 4, 'Cuatro estrellas', '34f2a6a8-733f-4ce6-ae51-492752c57bb5', '123e4567-e89b-12d3-a456-426655440000', '123e4567-e89b-12d3-a456-426655440000', '2019-06-18 21:43:11.663', NULL, NULL);
INSERT INTO per_calificacion VALUES (4, 0, 'prueba', '34f2a6a8-733f-4ce6-ae51-492752c57bb5', '123e4567-e89b-12d3-a456-426655440000', '123e4567-e89b-12d3-a456-426655440000', '2019-06-18 21:43:37.395', NULL, NULL);
INSERT INTO per_calificacion VALUES (5, 5, 'Buenos materiales', '0646f014-ec6e-4426-8147-8ccd08017328', '0646f014-ec6e-4426-8147-8ccd08017328', '0646f014-ec6e-4426-8147-8ccd08017328', '2019-06-18 21:45:48.306', NULL, NULL);
INSERT INTO per_calificacion VALUES (6, 1, 'Altos precios', '0646f014-ec6e-4426-8147-8ccd08017328', '0646f014-ec6e-4426-8147-8ccd08017328', '0646f014-ec6e-4426-8147-8ccd08017328', '2019-06-18 21:46:45.001', NULL, NULL);
INSERT INTO per_calificacion VALUES (7, 3, 'Excelente atención.', '9994952c-ae59-47a3-a872-0ac946299acd', '0126f013-ea6e-4426-8147-8ccd08017311', '0126f013-ea6e-4426-8147-8ccd08017311', '2019-06-21 03:56:47.341', NULL, NULL);
INSERT INTO per_calificacion VALUES (8, 5, '3b', '9994952c-ae59-47a3-a872-0ac946299acd', '74710c90-4734-45b0-80f0-4f2e635de516', '74710c90-4734-45b0-80f0-4f2e635de516', '2019-06-24 20:15:16.821', NULL, NULL);


--
-- Name: per_calificacion_id_calificacion_seq; Type: SEQUENCE SET; Schema: public; Owner: micasa
--

SELECT pg_catalog.setval('per_calificacion_id_calificacion_seq', 8, true);


--
-- Data for Name: per_direccion; Type: TABLE DATA; Schema: public; Owner: micasa
--

INSERT INTO per_direccion VALUES (1, '123e4567-e89b-12d3-a456-426655440000', 'Oficina central', 'Los Robles. Alke Carretera a Masaya, 100 mts al oeste, 25 mts al sur. Casa #12.', 124, 12.1221259999999997, -86.2642610000000047, 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO per_direccion VALUES (2, '0646f014-ec6e-4426-8147-8ccd08017328', 'Corporativo CEMEX-NICARAGUA', 'Managua 14031', 124, 12.1141380000000005, -86.2554549999999978, 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO per_direccion VALUES (3, '0646f014-ec6e-4426-8147-8ccd08017328', 'Oficinas de empresa', 'Barrio Nora Astorga, Managua', 124, 12.1359499999999993, -86.2983210000000014, 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO per_direccion VALUES (4, '0646f014-ec6e-4426-8147-8ccd08017328', 'Empresa constructora', 'Ciudad Sandino', 123, 12.1563789999999994, -86.3345079999999996, 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO per_direccion VALUES (5, '34f2a6a8-733f-4ce6-ae51-492752c57bb5', 'Oficina central Nicaragua', 'Managua, Los Robles. Alke Carretera a Masaya, 100 mts al oeste, 25 mts al sur. Casa #12', 124, 12.1222737684785002, -86.264458000659971, 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO per_direccion VALUES (7, '9994952c-ae59-47a3-a872-0ac946299acd', 'Sucursal Ciudad Jardín', 'Sucursal Ciudad Jardín', 124, 12.1440877860613021, -86.2594369053840779, '123e4567-e89b-12d3-a456-426655440000', '2019-04-28 17:22:46.547', NULL, NULL);
INSERT INTO per_direccion VALUES (6, '2e1e1951-6a8f-4987-8a62-f48641009171', 'Centrum', 'Edificio Centrum Villa Fontana Managua', 124, 12.1254047690687123, -86.2701510316293252, '123e4567-e89b-12d3-a456-426655440000', '2019-04-28 17:21:18.08', '123e4567-e89b-12d3-a456-426655440000', '2019-06-18 22:42:15.508');


--
-- Name: per_direccion_id_direccion_seq; Type: SEQUENCE SET; Schema: public; Owner: micasa
--

SELECT pg_catalog.setval('per_direccion_id_direccion_seq', 7, true);


--
-- Data for Name: per_usuario; Type: TABLE DATA; Schema: public; Owner: micasa
--

INSERT INTO per_usuario VALUES ('123e4567-e89b-12d3-a456-426655440000', 'hadmin@erpuno.com', '$2a$10$PPbgr/ONViv5xM.jXp6AGu/RjpVkw.uy5QIfJ.eOIAZSLIqOXV.2K', 'S', NULL, 'Habitat Nicaragua Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, 'hadmin', '2019-06-11 05:06:27.520173', NULL, NULL);
INSERT INTO per_usuario VALUES ('0646f014-ec6e-4426-8147-8ccd08017328', 'cemex@erpuno.com', '$2a$10$qZHQIpwc9wLD2H/OhNYhoOs/g5FQsuD5G/qY721RI87UYxnYNGyX6', 'S', NULL, 'CEMEX Nicaragua', NULL, ' ', NULL, '', 'Managua 14031', 'https://www.facebook.com/CEMEXNicaraguaSA', 'https://twitter.com/CEMEX_NICARAGUA', '', NULL, 'N', '0646f014-ec6e-4426-8147-8ccd08017328.jpg', 'hadmin', '2019-04-15 20:57:20.837079', NULL, NULL);
INSERT INTO per_usuario VALUES ('2e1e1951-6a8f-4987-8a62-f48641009171', 'fudemi@erpuno.com', '$2a$10$I6p1NpvQc3SS.m6zP6Vexu5m03mTqnBiq2CZEmBqK9QkCF3U2Cq4C', 'S', NULL, 'FUDEMI', NULL, ' ', '', '22400017', 'Reparto Los Robles, 11 ave. Sur este N° 34', 'https://www.facebook.com/admon.sitio', 'https://twitter.com/FUDEMICM', '7516-4354', 'http://www.fudemi.org.ni', 'N', '2e1e1951-6a8f-4987-8a62-f48641009171.png', 'hadmin', '2019-04-15 20:57:20.837079', '123e4567-e89b-12d3-a456-426655440000', '2019-04-28 17:32:36.556');
INSERT INTO per_usuario VALUES ('9994952c-ae59-47a3-a872-0ac946299acd', 'fundenuse@erpuno.com', '$2a$10$xK1zc5yQGRgTbpv/H/fV3eaBSN.CC95JMFWn8KJ14yvOINAr.8IOi', 'S', NULL, 'FUNDENUSE', NULL, ' ', '', '27322060', 'Centro de Salud José Dolores Fletes, 1C al Norte, Ocotal, Nueva Segovia', 'https://www.facebook.com/fundenuse', 'https://twitter.com/hashtag/FUNDENUSE', '', 'http://www.fundenuse.com.ni', 'N', '9994952c-ae59-47a3-a872-0ac946299acd.png', 'hadmin', '2019-04-15 20:57:20.837079', '123e4567-e89b-12d3-a456-426655440000', '2019-04-28 17:35:11.23');
INSERT INTO per_usuario VALUES ('34f2a6a8-733f-4ce6-ae51-492752c57bb5', 'habitat@habitatnicaragua.org', '$2a$10$4K4f26x6iU4QeqxY8wxawO.l5NUVmJlxVKwreclGdJgBFPJF8Gyi2', 'S', NULL, 'Hábitat para la Humanidad Nicaragua', NULL, ' ', '', '+505 2270-1080', 'Managua, Los Robles. Alke Carretera a Masaya, 100 mts al oeste, 25 mts al sur. Casa #12', 'https://www.facebook.com/habitatnic', 'https://twitter.com/Habitatnic', '', 'https://www.habitatnicaragua.org/', 'N', '34f2a6a8-733f-4ce6-ae51-492752c57bb5.png', 'hadmin', '2019-04-15 20:57:20.837079', NULL, NULL);
INSERT INTO per_usuario VALUES ('08d6246f-6831-4c46-b805-287dfd19c1d0', 'tecnico@erpuno.com', '$2a$10$eZbLBwR/6aiUGfmQTXSA7uEaxcLhfcp7xN211.yea6XYHrkzjomBW', 'S', NULL, 'Técnico', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, 'hadmin', '2019-06-11 05:06:27.520173', '08d6246f-6831-4c46-b805-287dfd19c1d0', '2019-06-11 17:36:09.096');
INSERT INTO per_usuario VALUES ('62f9042b-3899-4bf3-80a2-103bde4e3997', 'prueba@denisjtorresg.info', '$2a$10$RpvbTlg1VSg2FIz4sg1Be.GY6fKO32VJkoX3.kJWbvYw5y73iMELu', 'N', 'd5cf044a-5c9b-4361-83d4-6e4dc73b62f2', 'Denis prueba', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'S', NULL, '', '2019-06-27 05:04:58.108', '', '2019-06-27 05:04:58.108');
INSERT INTO per_usuario VALUES ('0126f013-ea6e-4426-8147-8ccd08017311', 'id.waltermartinez@gmail.com', '$2a$10$8t2.catb39GeFG0OR.04ueUsfBt06f.FNe5gEfJYXSU94l66dpdOO', 'S', NULL, 'Walter Martinez', '1990-10-01', 'M', NULL, '81803115', 'Managua', 'waltermartinez7', '@walter', '81803115', NULL, 'N', '0126f013-ea6e-4426-8147-8ccd08017311.jpg', 'hadmin', '2019-06-11 05:06:27.520173', '0126f013-ea6e-4426-8147-8ccd08017311', '2019-06-19 01:02:50.506');
INSERT INTO per_usuario VALUES ('abbf868c-9eb0-43dc-ade0-e7c5b289905e', 'me@denisjtorresg.info', '$2a$10$Jw2bJjXdQmql7zt92LNFEuxal5zAItC2A0fEVr.qJ.0fcS3xe8nvq', 'S', NULL, 'Denis Admin Técnico Pruebas', NULL, 'M', '', '', '', '', '', '', '', 'N', 'abbf868c-9eb0-43dc-ade0-e7c5b289905e.jpg', '123e4567-e89b-12d3-a456-426655440000', '2019-06-16 05:25:15.11', 'abbf868c-9eb0-43dc-ade0-e7c5b289905e', '2019-06-16 05:33:58.645');
INSERT INTO per_usuario VALUES ('9175e50a-53bb-4339-ba5b-c47f4abd977c', 'denisjtorresg@gmail.com', '$2a$10$70gr5VvIiT.MnNQcssfZAeg0B.rSNqVwjql1wJYqf7CBrO1AhQm7u', 'S', NULL, 'Denis Torres', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'S', NULL, 'hadmin', '2019-06-11 05:06:27.520173', '', '2019-06-27 05:09:11.749');
INSERT INTO per_usuario VALUES ('1f8632fd-450a-476a-8336-3773e0a45663', 'jlrm2385@gmail.com', '$2a$10$ztXwxis6nxKQPyNkVw304eF1/CkmtLg.2Cg0frapjOFEybU0hN9ie', 'S', NULL, 'jose duarte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, '', '2019-06-28 16:37:09.331', '1f8632fd-450a-476a-8336-3773e0a45663', '2019-06-28 16:42:28.994');
INSERT INTO per_usuario VALUES ('2595db63-4958-4049-8968-909553407df0', 'jrosales@habitatnicaragua.org', '$2a$10$NcFtCaqIk3rkTQnmTz6UFu7wcNFOe8.7o9uGw40jalnUjxCrYBU6e', 'S', NULL, 'Jose Luis Rosales', '1985-06-19', 'M', NULL, '85538023', 'Zumen Raspados loly 1c.O, 1c.N, 1c.E,1/2N.
house #4 MD', NULL, NULL, NULL, NULL, 'N', '2595db63-4958-4049-8968-909553407df0.jpg', '', '2019-06-14 15:54:59.572', '2595db63-4958-4049-8968-909553407df0', '2019-06-28 14:30:30.117');
INSERT INTO per_usuario VALUES ('9075e75b-53bb-4339-ba0b-c0004abd900c', 'admintecnico@erpuno.com', '$2a$10$tS.0AOh9CDshtZ83D6cFx.YHEGtRMWOH6CAlBsZ.j0VFVSzD5dNae', 'S', NULL, 'Jefe de Técnicos Habitat', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, 'N', NULL, 'hadmin', '2019-06-11 05:06:27.520173', '9075e75b-53bb-4339-ba0b-c0004abd900c', '2019-06-18 21:11:11.858');
INSERT INTO per_usuario VALUES ('e51b834f-8934-44e1-9beb-1dac4763e253', 'abarreda@habitatnicaragua.org', '$2a$10$AyKf21Dtme/65ygvL3TBOe1lvsQ56ZlA.mU71gevtIA7133lpEM4W', 'S', NULL, 'Alvaro barreda', NULL, 'M', '', '', '', '', '', '', 'www.micasa.com.ni', 'N', NULL, '123e4567-e89b-12d3-a456-426655440000', '2019-06-28 16:49:42.547', NULL, NULL);
INSERT INTO per_usuario VALUES ('16e38b72-4088-4022-a16d-75d3dab099ca', 'wwwmartinez@gmail.com', '$2a$10$5YGAR63lTmcVy/Cb8qTzT.0Chsf2vL6MFzJRJ1fVmB8lCUaaxvXfC', 'N', 'dfb6d414-ec2a-40be-a5f6-65ebf04dac27', 'Juan Perez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'S', NULL, '', '2019-06-21 17:48:49.057', '', '2019-06-21 17:48:49.057');
INSERT INTO per_usuario VALUES ('f51b6c57-48c7-4b76-b2b3-0c5838ee52db', 'jlrm212@hotmail.com', '$2a$10$JYRJl9ScKfhH2Yz6J58MVui9lFtfDqanNotI3BTYfF1jl0TiG1MJa', 'S', NULL, 'Prueba de Cuenta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'S', NULL, '', '2019-06-19 16:26:25.325', '', '2019-06-19 16:26:25.325');
INSERT INTO per_usuario VALUES ('653a488a-837f-4895-bfbd-38b34b88ab90', 'lrivera@habitatnicaragua.org', '$2a$10$5xDJe9ZRj2raG4C49DfRBOtcniOuCvVAULdnjW1ipF1ww8GMbb2UO', 'S', NULL, 'Liza Rivera', NULL, 'F', '', '', '', '', '', '', '', 'N', NULL, '123e4567-e89b-12d3-a456-426655440000', '2019-06-28 16:15:45.971', NULL, NULL);
INSERT INTO per_usuario VALUES ('d4eb9b93-5802-4187-8bb0-91fdc832a17f', 'wlopez@habitatnicaragua.org', '$2a$10$IjhMa.X5fbPD03gKhsB7FujDnqWveNFhM1T0auS2dcAWa55HDHSEy', 'S', NULL, 'Walter Lopez', NULL, 'M', '', '', '', '', '', '', '', 'N', NULL, '123e4567-e89b-12d3-a456-426655440000', '2019-06-19 18:19:52.236', '123e4567-e89b-12d3-a456-426655440000', '2019-06-28 16:53:38.355');
INSERT INTO per_usuario VALUES ('87ac18ea-fd70-4cdc-b8d2-fb814460801e', 'edgonzalez@habitatnicaragua.org', NULL, 'S', NULL, 'Edgard Gonzalez valdivia', NULL, 'M', '', '', '', '', '', '', 'www.micasa.com.ni', 'N', NULL, '123e4567-e89b-12d3-a456-426655440000', '2019-06-28 16:56:04.043', NULL, NULL);
INSERT INTO per_usuario VALUES ('943cd012-46c2-4bef-8967-433704af66ef', 'smantilla@habitatnicaragua.org', NULL, 'S', NULL, 'Saul Mantilla', NULL, 'M', '', '', '', '', '', '', '', 'N', NULL, '123e4567-e89b-12d3-a456-426655440000', '2019-06-28 16:56:59.1', NULL, NULL);
INSERT INTO per_usuario VALUES ('965146f9-a6f0-489b-a0a7-762a73dfe99c', 'lmarenco@habitatnicaragua.org', '$2a$10$5ecvhI4DYckXleR6HQFOI.rRhT0UmVFulR9GVS4R/CRXRovVE7MKa', 'S', NULL, 'Luis Marenco', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, '', '2019-06-28 14:41:32.937', '965146f9-a6f0-489b-a0a7-762a73dfe99c', '2019-06-28 17:04:31');
INSERT INTO per_usuario VALUES ('74710c90-4734-45b0-80f0-4f2e635de516', 'zulma@habitatnicaragua.org', '$2a$10$xmzC7EEIAy1a0c1iumyYfuUeYuhBFRf7MJjg8iv6KpwqFw6d37WqO', 'S', NULL, 'Zu Es', NULL, 'F', '', '22701080', 'Managua', '', '', '', '', 'N', NULL, '', '2019-06-17 21:20:44.534', '123e4567-e89b-12d3-a456-426655440000', '2019-06-28 18:21:44.735');


--
-- Data for Name: pry_comentario; Type: TABLE DATA; Schema: public; Owner: micasa
--

INSERT INTO pry_comentario VALUES (1, 1, 'Su proyecto ya está en proceso de gestión', 'S', '9075e75b-53bb-4339-ba0b-c0004abd900c', '9075e75b-53bb-4339-ba0b-c0004abd900c', '2019-04-28 21:45:16.807', NULL, NULL);
INSERT INTO pry_comentario VALUES (2, 1, 'Gracias', 'S', '9175e50a-53bb-4339-ba5b-c47f4abd977c', '9175e50a-53bb-4339-ba5b-c47f4abd977c', '2019-04-28 21:45:45.883', NULL, NULL);
INSERT INTO pry_comentario VALUES (3, 2, 'ya esta programada mi visita?', 'S', '74710c90-4734-45b0-80f0-4f2e635de516', '74710c90-4734-45b0-80f0-4f2e635de516', '2019-06-18 20:54:23.559', NULL, NULL);
INSERT INTO pry_comentario VALUES (4, 2, 'en que fecha esta programada', 'S', '9075e75b-53bb-4339-ba0b-c0004abd900c', '9075e75b-53bb-4339-ba0b-c0004abd900c', '2019-06-18 21:06:36.762', NULL, NULL);
INSERT INTO pry_comentario VALUES (5, 3, 'La habitación debe tener una dimensión de 3x3 m2. En el caso del garaje para un vehículo y será de 3.5x7 m2.', 'S', '0126f013-ea6e-4426-8147-8ccd08017311', '0126f013-ea6e-4426-8147-8ccd08017311', '2019-06-19 01:09:35.925', NULL, NULL);
INSERT INTO pry_comentario VALUES (6, 3, 'Muchas gracias WM. En breve le estaremos asignando un Técnico quién entrará en contacto con usted para coordinar la visita.', 'S', '9075e75b-53bb-4339-ba0b-c0004abd900c', '9075e75b-53bb-4339-ba0b-c0004abd900c', '2019-06-19 01:17:12.66', NULL, NULL);
INSERT INTO pry_comentario VALUES (7, 4, 'Se cotactara Walter martinez con usted 85538024 en 24 horas', 'S', '9075e75b-53bb-4339-ba0b-c0004abd900c', '9075e75b-53bb-4339-ba0b-c0004abd900c', '2019-06-19 17:45:55.716', NULL, NULL);
INSERT INTO pry_comentario VALUES (8, 7, 'Lo visitaré mañana por la tarde a las 2 pm. esta de acuerdo', 'S', '08d6246f-6831-4c46-b805-287dfd19c1d0', '08d6246f-6831-4c46-b805-287dfd19c1d0', '2019-06-28 16:48:21.435', NULL, NULL);


--
-- Name: pry_comentario_id_comentario_seq; Type: SEQUENCE SET; Schema: public; Owner: micasa
--

SELECT pg_catalog.setval('pry_comentario_id_comentario_seq', 8, true);


--
-- Data for Name: pry_proyecto; Type: TABLE DATA; Schema: public; Owner: micasa
--

INSERT INTO pry_proyecto VALUES (1, 'Componer el techo', NULL, 187, '2018-12-22', '99999', 'Techo', 'Zinc', 'S', 10000.00, 41, 'N', 'S', '', NULL, 188, NULL, '9175e50a-53bb-4339-ba5b-c47f4abd977c', '08d6246f-6831-4c46-b805-287dfd19c1d0', '9175e50a-53bb-4339-ba5b-c47f4abd977c', '2019-04-15 20:57:20.837079', '9075e75b-53bb-4339-ba0b-c0004abd900c', '2019-04-28 21:44:56.135');
INSERT INTO pry_proyecto VALUES (5, 'Cambiar laminas de Techo', NULL, 187, '2019-06-19', '3456783', 'Techo', 'metal', 'N', NULL, NULL, 'N', 'N', 'nose ', NULL, 188, NULL, '2595db63-4958-4049-8968-909553407df0', NULL, '2595db63-4958-4049-8968-909553407df0', '2019-06-19 17:36:15.475', NULL, NULL);
INSERT INTO pry_proyecto VALUES (6, 'construir un baño', NULL, 187, '2019-06-15', '22222222222222222', 'Unidad sanitaria', 'gypsum ,bloques ,azulejos', 'N', NULL, NULL, 'N', 'N', 'juojljniooml', NULL, 193, NULL, '74710c90-4734-45b0-80f0-4f2e635de516', NULL, '74710c90-4734-45b0-80f0-4f2e635de516', '2019-06-19 17:37:03.949', '74710c90-4734-45b0-80f0-4f2e635de516', '2019-06-19 17:58:05.967');
INSERT INTO pry_proyecto VALUES (4, 'Levantar muro perimetral de 25P35', NULL, 186, '2019-06-19', '1232434567', 'Muro, no se', 'Piedra cantera,nose,No se', 'N', NULL, NULL, 'N', 'S', 'No se', NULL, 190, NULL, '2595db63-4958-4049-8968-909553407df0', '08d6246f-6831-4c46-b805-287dfd19c1d0', '2595db63-4958-4049-8968-909553407df0', '2019-06-19 17:17:29.445', '08d6246f-6831-4c46-b805-287dfd19c1d0', '2019-06-19 18:18:33.096');
INSERT INTO pry_proyecto VALUES (3, 'Construir una nueva habitación y techar el área de garaje.', NULL, 186, '2019-06-18', 'BAC123456', 'Habitaciones,Garaje', 'Bloques de concreto', 'S', 2000.00, 42, 'N', 'S', '', NULL, 190, NULL, '0126f013-ea6e-4426-8147-8ccd08017311', '08d6246f-6831-4c46-b805-287dfd19c1d0', '0126f013-ea6e-4426-8147-8ccd08017311', '2019-06-19 01:07:28.363', '08d6246f-6831-4c46-b805-287dfd19c1d0', '2019-06-21 02:37:55.249');
INSERT INTO pry_proyecto VALUES (2, 'construir un cuarto', NULL, 186, '2019-06-20', '00000000000000', 'el dormitorio', 'arena,Bloques de concreto,hierro', 'S', 1.00, 42, 'S', 'S', 'Zu', NULL, 190, NULL, '74710c90-4734-45b0-80f0-4f2e635de516', '08d6246f-6831-4c46-b805-287dfd19c1d0', '74710c90-4734-45b0-80f0-4f2e635de516', '2019-06-17 21:26:39.898', '9075e75b-53bb-4339-ba0b-c0004abd900c', '2019-06-26 19:49:59.046');
INSERT INTO pry_proyecto VALUES (7, 'ampliación ', NULL, 187, '2019-06-29', '22222222222222222', 'sala', 'bloque ', 'N', NULL, NULL, 'N', 'S', '', NULL, 189, NULL, '74710c90-4734-45b0-80f0-4f2e635de516', '08d6246f-6831-4c46-b805-287dfd19c1d0', '74710c90-4734-45b0-80f0-4f2e635de516', '2019-06-28 16:45:26.46', '9075e75b-53bb-4339-ba0b-c0004abd900c', '2019-06-28 16:47:03.871');


--
-- Name: pry_proyecto_id_proyecto_seq; Type: SEQUENCE SET; Schema: public; Owner: micasa
--

SELECT pg_catalog.setval('pry_proyecto_id_proyecto_seq', 7, true);


--
-- Data for Name: pub_publicidad; Type: TABLE DATA; Schema: public; Owner: micasa
--

INSERT INTO pub_publicidad VALUES (3, 197, '2019-02-01', '2021-04-28', 354, 0, 2, 0, 'S', 'https://concepto.de/publicidad/', NULL, '/d4d1c1l8up/3/68b3bca2-29b6-4ccd-8245-8f1b2e5c216f.png', '/d4d1c1l8up/3/42c027a5-7570-4c95-b0da-b388ecb9ef74.png', '123e4567-e89b-12d3-a456-426655440000', '2019-04-28 17:30:51.283', '123e4567-e89b-12d3-a456-426655440000', '2019-06-11 21:20:15.882');
INSERT INTO pub_publicidad VALUES (4, 197, '2019-06-11', '2019-07-11', 309, 0, 13, 0, 'S', 'https://www.habitatnicaragua.org/', '/d4d1c1l8up/4/1f1d5cd4-84b2-4ee9-8eb1-944dfff7644f.png', '/d4d1c1l8up/4/60734e3c-1173-4870-ae80-05dcd6630259.png', '/d4d1c1l8up/4/89a4cb06-1cf5-41a8-8bfa-468de8dea24c.png', '123e4567-e89b-12d3-a456-426655440000', '2019-06-11 22:40:37.25', '123e4567-e89b-12d3-a456-426655440000', '2019-06-11 22:41:15.617');
INSERT INTO pub_publicidad VALUES (5, 198, '2019-06-14', '2019-07-14', 224, 0, 2, 0, 'S', 'https://www.habitat.org/lac-es', '/d4d1c1l8up/5/afb16108-d488-4f9d-8350-eb93f4125981.png', '/d4d1c1l8up/5/f6142c60-b73e-4ff9-a224-46fa5ad93fe4.png', NULL, '123e4567-e89b-12d3-a456-426655440000', '2019-06-14 18:06:29.311', '123e4567-e89b-12d3-a456-426655440000', '2019-06-14 18:06:29.311');
INSERT INTO pub_publicidad VALUES (2, 198, '2019-02-01', '2021-01-31', 441, 0, 1, 0, 'S', 'https://es.wikipedia.org/wiki/Publicidad', '/d4d1c1l8up/2/87b380d1-15d1-4b60-b760-7a3b53f33bab.png', '/d4d1c1l8up/2/02f2a19d-c2df-4ef5-88d2-73ca48e4738f.png', NULL, '123e4567-e89b-12d3-a456-426655440000', '2019-04-20 22:04:06.167', '123e4567-e89b-12d3-a456-426655440000', '2019-04-28 17:29:26.286');


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
INSERT INTO seg_login VALUES (38, '2019-06-15 04:29:54.88', 'cemex@erpuno.com', '190.212.241.70', 'S');
INSERT INTO seg_login VALUES (39, '2019-06-15 04:37:43.78', 'cemex@erpuno.com', '190.212.241.70', 'S');
INSERT INTO seg_login VALUES (40, '2019-06-16 03:57:00.784', 'hadmin@erpuno.com', '186.77.229.182', 'S');
INSERT INTO seg_login VALUES (41, '2019-06-16 04:44:09.735', 'cemex@erpuno.com', '186.77.229.182', 'S');
INSERT INTO seg_login VALUES (42, '2019-06-16 05:24:16.955', 'hadmin@erpuno.com', '186.77.229.182', 'S');
INSERT INTO seg_login VALUES (43, '2019-06-16 05:25:35.45', 'me@denisjtorresg.info', '186.77.229.182', 'S');
INSERT INTO seg_login VALUES (44, '2019-06-17 20:34:38.493', 'hadmin@erpuno.com', '186.77.137.109', 'S');
INSERT INTO seg_login VALUES (45, '2019-06-17 21:12:42.505', 'zespinoza@habitatnicaragua.org', '191.98.250.142', 'N');
INSERT INTO seg_login VALUES (46, '2019-06-17 21:14:01.048', 'zespinoza@habitatnicaragua.org', '191.98.250.142', 'N');
INSERT INTO seg_login VALUES (47, '2019-06-17 21:21:58.883', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (48, '2019-06-17 21:23:25.224', 'zespinoza@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (49, '2019-06-18 20:31:37.473', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (50, '2019-06-18 20:44:54.426', 'hadmin@erpuno.com', '186.77.138.100', 'S');
INSERT INTO seg_login VALUES (51, '2019-06-18 20:51:53.515', 'zespinoza@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (52, '2019-06-18 20:53:05.103', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (53, '2019-06-18 20:54:40.399', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (54, '2019-06-18 20:55:42.996', 'tecnico@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (55, '2019-06-18 21:05:58.831', 'admintecnico@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (56, '2019-06-18 21:07:29.314', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (57, '2019-06-18 21:10:42.601', 'admintecnico@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (58, '2019-06-18 21:11:55.353', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (59, '2019-06-18 21:34:35.972', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (60, '2019-06-18 21:36:48.906', 'zespinoza@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (61, '2019-06-18 21:38:03.847', 'admintecnico@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (62, '2019-06-18 21:40:09.003', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (63, '2019-06-18 21:45:19.453', 'cemex@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (64, '2019-06-18 21:47:41.763', 'cemex@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (65, '2019-06-18 21:51:04.781', 'cemex@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (66, '2019-06-18 22:01:31.527', 'habitat@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (67, '2019-06-18 22:07:11.484', 'cemex@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (68, '2019-06-18 22:12:12.23', 'hadmin@erpuno.com', '186.77.138.100', 'S');
INSERT INTO seg_login VALUES (69, '2019-06-18 22:14:41.495', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (70, '2019-06-18 22:20:54.842', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (71, '2019-06-18 22:21:39.791', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (72, '2019-06-18 22:22:39.669', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (73, '2019-06-18 22:26:06.977', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (74, '2019-06-18 22:27:31.362', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (75, '2019-06-18 22:30:01.323', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (76, '2019-06-18 22:42:46.181', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (77, '2019-06-18 22:43:07.876', 'fundenuse@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (78, '2019-06-18 22:47:30.711', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (79, '2019-06-19 00:10:52.554', 'hadmin@erpuno.com', '186.77.138.14', 'S');
INSERT INTO seg_login VALUES (80, '2019-06-19 00:12:17.423', 'habitat@erpuno.com', '186.77.138.14', 'N');
INSERT INTO seg_login VALUES (81, '2019-06-19 00:18:04.89', 'habitat@habitatnicaragua.org', '186.77.138.14', 'S');
INSERT INTO seg_login VALUES (82, '2019-06-19 00:22:59.977', 'fundenuse@erpuno.com', '186.77.138.14', 'S');
INSERT INTO seg_login VALUES (83, '2019-06-19 00:26:55.842', 'habitat@habitatnicaragua.org', '186.77.138.14', 'S');
INSERT INTO seg_login VALUES (84, '2019-06-19 00:41:59.046', 'id.waltermartinez@gmail.com', '186.77.138.14', 'N');
INSERT INTO seg_login VALUES (85, '2019-06-19 00:42:28.8', 'id.waltermartinez@gmail.com', '186.77.138.14', 'N');
INSERT INTO seg_login VALUES (86, '2019-06-19 00:45:53.064', 'id.waltermartinez@gmail.com', '186.77.138.14', 'S');
INSERT INTO seg_login VALUES (87, '2019-06-19 01:14:36.112', 'admintecnico@erpuno.com', '186.77.138.14', 'S');
INSERT INTO seg_login VALUES (88, '2019-06-19 02:43:51.574', 'hadmin@erpuno.com', '186.77.234.125', 'S');
INSERT INTO seg_login VALUES (89, '2019-06-19 03:02:26.506', 'id.waltermartinez@gmail.com', '186.77.137.20', 'S');
INSERT INTO seg_login VALUES (90, '2019-06-19 15:22:35.133', 'narosteguinica@gmail.com', '191.98.250.142', 'N');
INSERT INTO seg_login VALUES (91, '2019-06-19 15:25:51.808', 'denisjtorresg@gmail.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (92, '2019-06-19 16:34:39.071', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (93, '2019-06-19 16:40:50.608', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (94, '2019-06-19 16:51:59.19', 'zespinoza@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (95, '2019-06-19 16:58:31.472', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (96, '2019-06-19 17:09:04.395', 'id.waltermartinez@gmail.com', '186.77.136.195', 'S');
INSERT INTO seg_login VALUES (97, '2019-06-19 17:09:08.778', 'narosteguinica@gmail.com', '191.98.250.142', 'N');
INSERT INTO seg_login VALUES (98, '2019-06-19 17:09:58.575', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'N');
INSERT INTO seg_login VALUES (99, '2019-06-19 17:10:07.039', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'N');
INSERT INTO seg_login VALUES (100, '2019-06-19 17:10:31.234', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (101, '2019-06-19 17:11:02.582', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (102, '2019-06-19 17:19:19.85', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (103, '2019-06-19 17:29:26.136', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'N');
INSERT INTO seg_login VALUES (104, '2019-06-19 17:29:32.531', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (105, '2019-06-19 17:38:41.498', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (106, '2019-06-19 17:39:56.509', 'tecnico@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (107, '2019-06-19 17:40:11.931', 'admintecnico@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (108, '2019-06-19 17:48:09.697', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (109, '2019-06-19 18:07:22.179', 'admintecnico@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (110, '2019-06-19 18:13:02.545', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (111, '2019-06-19 18:14:02.824', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (112, '2019-06-19 18:17:55.686', 'tecnico@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (113, '2019-06-19 18:21:05.829', 'hadmin@erpuno.com', '186.1.8.82', 'S');
INSERT INTO seg_login VALUES (114, '2019-06-19 18:25:06.547', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'N');
INSERT INTO seg_login VALUES (115, '2019-06-19 18:25:14.405', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (116, '2019-06-19 18:28:20.766', 'tecnico@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (117, '2019-06-19 18:28:42.302', 'tecnico@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (118, '2019-06-19 18:39:54.252', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (119, '2019-06-19 18:40:14.383', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (120, '2019-06-19 19:00:22.902', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (121, '2019-06-19 19:05:20.948', 'zespinoza@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (122, '2019-06-19 19:14:20.94', 'cemex@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (123, '2019-06-19 19:38:00.634', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (124, '2019-06-19 19:43:29.824', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (125, '2019-06-19 19:45:01.586', 'cemex@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (126, '2019-06-19 19:49:10.928', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (127, '2019-06-19 19:55:05.016', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (128, '2019-06-19 19:55:57.886', 'cemex@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (129, '2019-06-19 20:15:09.387', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (130, '2019-06-19 22:14:12.614', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (131, '2019-06-20 04:30:37.255', 'denisjtorresg@gmail.com', '186.77.227.20', 'S');
INSERT INTO seg_login VALUES (132, '2019-06-20 04:30:46.974', 'hadmin@erpuno.com', '186.77.227.20', 'S');
INSERT INTO seg_login VALUES (133, '2019-06-20 04:47:01.228', 'denisjtorresg@gmail.com', '186.77.227.20', 'S');
INSERT INTO seg_login VALUES (134, '2019-06-20 04:48:12.131', 'denisjtorresg@gmail.com', '186.77.227.20', 'S');
INSERT INTO seg_login VALUES (135, '2019-06-20 04:50:06.805', 'hadmin@erpuno.com', '186.77.227.20', 'S');
INSERT INTO seg_login VALUES (136, '2019-06-20 05:07:17.591', 'denisjtorresg@gmail.com', '186.77.227.20', 'S');
INSERT INTO seg_login VALUES (137, '2019-06-20 05:08:47.547', 'hadmin@erpuno.com', '186.77.227.20', 'S');
INSERT INTO seg_login VALUES (138, '2019-06-20 05:16:59.165', 'denisjtorresg@gmail.com', '186.77.227.20', 'S');
INSERT INTO seg_login VALUES (139, '2019-06-20 05:17:25.807', 'hadmin@erpuno.com', '186.77.227.20', 'S');
INSERT INTO seg_login VALUES (140, '2019-06-20 18:13:37.972', 'hadmin@erpuno.com', '186.77.138.233', 'S');
INSERT INTO seg_login VALUES (141, '2019-06-20 18:17:28.454', 'hadmin@erpuno.com', '186.77.142.226', 'S');
INSERT INTO seg_login VALUES (142, '2019-06-20 23:13:12.246', 'id.waltermartinez@gmail.com', '186.77.138.95', 'S');
INSERT INTO seg_login VALUES (143, '2019-06-21 01:07:22.29', 'id.waltermartinez@gmail.com', '186.77.137.209', 'S');
INSERT INTO seg_login VALUES (144, '2019-06-21 01:17:07.066', 'id.waltermartinez@gmail.com', '186.77.137.209', 'S');
INSERT INTO seg_login VALUES (145, '2019-06-21 02:33:37.964', 'admintecnico@erpuno.com', '186.77.137.209', 'S');
INSERT INTO seg_login VALUES (146, '2019-06-21 02:37:02.355', 'tecnico@erpuno.com', '186.77.137.209', 'S');
INSERT INTO seg_login VALUES (147, '2019-06-21 02:47:24.874', 'id.waltermartinez@gmail.com', '186.77.137.209', 'S');
INSERT INTO seg_login VALUES (148, '2019-06-21 03:45:55.892', 'id.waltermartinez@gmail.com', '186.77.137.209', 'S');
INSERT INTO seg_login VALUES (149, '2019-06-21 04:17:18.7', 'id.waltermartinez@gmail.com', '186.77.137.209', 'S');
INSERT INTO seg_login VALUES (150, '2019-06-21 17:14:04.93', 'id.waltermartinez@gmail.com', '186.77.137.21', 'S');
INSERT INTO seg_login VALUES (151, '2019-06-21 18:46:07.423', 'id.waltermartinez@gmail.com', '186.77.137.21', 'S');
INSERT INTO seg_login VALUES (152, '2019-06-24 20:10:18.931', 'zespinoza@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (153, '2019-06-24 20:32:14.88', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (154, '2019-06-24 21:29:30.636', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (155, '2019-06-24 21:32:53.384', 'admintecnico@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (156, '2019-06-24 22:15:52.534', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (157, '2019-06-26 13:16:35.831', 'denisjtorresg@gmail.com', '186.77.142.226', 'S');
INSERT INTO seg_login VALUES (158, '2019-06-26 13:19:25.403', 'hadmin@erpuno.com', '186.77.142.226', 'S');
INSERT INTO seg_login VALUES (159, '2019-06-26 13:21:53.585', 'denisjtorresg@gmail.com', '186.77.142.226', 'S');
INSERT INTO seg_login VALUES (160, '2019-06-26 16:59:56.302', 'hadmin@erpuno.com', '186.77.142.226', 'S');
INSERT INTO seg_login VALUES (161, '2019-06-26 17:39:46.988', 'hadmin@erpuno.com', '186.77.142.226', 'S');
INSERT INTO seg_login VALUES (162, '2019-06-26 19:47:51.658', 'tecnico@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (163, '2019-06-26 19:48:46.027', 'admintecnico@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (164, '2019-06-27 20:00:41.543', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (165, '2019-06-28 04:18:30.989', 'hadmin@erpuno.com', '186.77.230.125', 'S');
INSERT INTO seg_login VALUES (166, '2019-06-28 14:26:41.939', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (167, '2019-06-28 14:27:06.765', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'N');
INSERT INTO seg_login VALUES (168, '2019-06-28 14:30:30.096', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (169, '2019-06-28 14:32:43.785', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (170, '2019-06-28 14:35:54.511', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (171, '2019-06-28 14:42:36.377', 'Luis Marenco', '191.98.250.142', 'N');
INSERT INTO seg_login VALUES (172, '2019-06-28 14:42:50.39', 'Luis Marenco', '191.98.250.142', 'N');
INSERT INTO seg_login VALUES (173, '2019-06-28 14:51:27.792', 'Luis Marenco', '191.98.250.142', 'N');
INSERT INTO seg_login VALUES (174, '2019-06-28 14:51:56.609', 'Luis Marenco', '191.98.250.142', 'N');
INSERT INTO seg_login VALUES (175, '2019-06-28 14:52:07.239', 'Luis Marenco', '191.98.250.142', 'N');
INSERT INTO seg_login VALUES (176, '2019-06-28 15:44:08.151', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (177, '2019-06-28 15:50:25.243', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (178, '2019-06-28 16:14:22.301', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (179, '2019-06-28 16:42:28.967', 'jlrm2385@gmail.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (180, '2019-06-28 16:43:15.393', 'zespinoza@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (181, '2019-06-28 16:43:37.085', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (182, '2019-06-28 16:45:00.129', 'lrivera@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (183, '2019-06-28 16:46:22.303', 'admintecnico@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (184, '2019-06-28 16:47:33.782', 'tecnico@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (185, '2019-06-28 16:48:06.353', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (186, '2019-06-28 16:52:57.62', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (187, '2019-06-28 17:01:45.09', 'Luis Marenco', '191.98.250.142', 'N');
INSERT INTO seg_login VALUES (188, '2019-06-28 17:02:36.381', 'lmarenco@habitatnicaragua.org', '191.98.250.142', 'N');
INSERT INTO seg_login VALUES (189, '2019-06-28 17:03:16.434', 'lmarenco@habitatnicaragua.org', '191.98.250.142', 'N');
INSERT INTO seg_login VALUES (190, '2019-06-28 17:04:30.983', 'lmarenco@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (191, '2019-06-28 17:09:08.401', 'lrivera@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (197, '2019-06-28 18:16:49.304', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (198, '2019-06-28 18:18:25.73', 'zespinosa@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (199, '2019-06-28 18:19:34.501', 'zespinoza@habitatnicaragua.org', '191.98.250.142', 'N');
INSERT INTO seg_login VALUES (200, '2019-06-28 18:19:47.654', 'zespinoza@habitatnicaragua.org', '191.98.250.142', 'N');
INSERT INTO seg_login VALUES (201, '2019-06-28 18:20:21.284', 'zespinoza@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (203, '2019-06-29 21:08:17.931', 'hadmin@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (192, '2019-06-28 17:38:11.059', 'cemex@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (193, '2019-06-28 17:40:40.724', 'jrosales@habitatnicaragua.org', '191.98.250.142', 'N');
INSERT INTO seg_login VALUES (194, '2019-06-28 17:40:52.834', 'jlrm2385@gmail.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (195, '2019-06-28 17:41:54.684', 'cemex@erpuno.com', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (196, '2019-06-28 18:04:07.061', 'zespinoza@habitatnicaragua.org', '191.98.250.142', 'S');
INSERT INTO seg_login VALUES (202, '2019-06-28 18:22:20.922', 'zulma@habitatnicaragua.org', '191.98.250.142', 'S');


--
-- Name: seg_login_id_login_seq; Type: SEQUENCE SET; Schema: public; Owner: micasa
--

SELECT pg_catalog.setval('seg_login_id_login_seq', 203, true);


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
INSERT INTO seg_rol_usuario VALUES ('abbf868c-9eb0-43dc-ade0-e7c5b289905e', 'ADMIN_TECNICO');
INSERT INTO seg_rol_usuario VALUES ('abbf868c-9eb0-43dc-ade0-e7c5b289905e', 'USUARIO');
INSERT INTO seg_rol_usuario VALUES ('74710c90-4734-45b0-80f0-4f2e635de516', 'USUARIO');
INSERT INTO seg_rol_usuario VALUES ('f51b6c57-48c7-4b76-b2b3-0c5838ee52db', 'USUARIO');
INSERT INTO seg_rol_usuario VALUES ('d4eb9b93-5802-4187-8bb0-91fdc832a17f', 'USUARIO');
INSERT INTO seg_rol_usuario VALUES ('d4eb9b93-5802-4187-8bb0-91fdc832a17f', 'TECNICO');
INSERT INTO seg_rol_usuario VALUES ('16e38b72-4088-4022-a16d-75d3dab099ca', 'USUARIO');
INSERT INTO seg_rol_usuario VALUES ('62f9042b-3899-4bf3-80a2-103bde4e3997', 'USUARIO');
INSERT INTO seg_rol_usuario VALUES ('965146f9-a6f0-489b-a0a7-762a73dfe99c', 'USUARIO');
INSERT INTO seg_rol_usuario VALUES ('653a488a-837f-4895-bfbd-38b34b88ab90', 'USUARIO');
INSERT INTO seg_rol_usuario VALUES ('653a488a-837f-4895-bfbd-38b34b88ab90', 'MATERIAL');
INSERT INTO seg_rol_usuario VALUES ('1f8632fd-450a-476a-8336-3773e0a45663', 'USUARIO');
INSERT INTO seg_rol_usuario VALUES ('e51b834f-8934-44e1-9beb-1dac4763e253', 'ADMIN_TECNICO');
INSERT INTO seg_rol_usuario VALUES ('87ac18ea-fd70-4cdc-b8d2-fb814460801e', 'USUARIO');
INSERT INTO seg_rol_usuario VALUES ('87ac18ea-fd70-4cdc-b8d2-fb814460801e', 'TECNICO');
INSERT INTO seg_rol_usuario VALUES ('943cd012-46c2-4bef-8967-433704af66ef', 'USUARIO');
INSERT INTO seg_rol_usuario VALUES ('943cd012-46c2-4bef-8967-433704af66ef', 'TECNICO');


--
-- Name: cat_maestro_pkey; Type: CONSTRAINT; Schema: public; Owner: micasa; Tablespace: 
--

ALTER TABLE ONLY cat_maestro
    ADD CONSTRAINT cat_maestro_pkey PRIMARY KEY (id_cat_maestro);


--
-- Name: cms_archivo_pkey; Type: CONSTRAINT; Schema: public; Owner: micasa; Tablespace: 
--

ALTER TABLE ONLY cms_archivo
    ADD CONSTRAINT cms_archivo_pkey PRIMARY KEY (id_archivo);


--
-- Name: cms_contenido_pkey; Type: CONSTRAINT; Schema: public; Owner: micasa; Tablespace: 
--

ALTER TABLE ONLY cms_contenido
    ADD CONSTRAINT cms_contenido_pkey PRIMARY KEY (id_contenido);


--
-- Name: cms_nodo_pkey; Type: CONSTRAINT; Schema: public; Owner: micasa; Tablespace: 
--

ALTER TABLE ONLY cms_nodo
    ADD CONSTRAINT cms_nodo_pkey PRIMARY KEY (id_nodo);


--
-- Name: oft_oferta_pkey; Type: CONSTRAINT; Schema: public; Owner: micasa; Tablespace: 
--

ALTER TABLE ONLY oft_oferta
    ADD CONSTRAINT oft_oferta_pkey PRIMARY KEY (id_oferta);


--
-- Name: oft_usar_oferta_pkey; Type: CONSTRAINT; Schema: public; Owner: micasa; Tablespace: 
--

ALTER TABLE ONLY oft_usar_oferta
    ADD CONSTRAINT oft_usar_oferta_pkey PRIMARY KEY (id_usar_oferta);


--
-- Name: per_calificacion_pkey; Type: CONSTRAINT; Schema: public; Owner: micasa; Tablespace: 
--

ALTER TABLE ONLY per_calificacion
    ADD CONSTRAINT per_calificacion_pkey PRIMARY KEY (id_calificacion);


--
-- Name: per_direccion_pkey; Type: CONSTRAINT; Schema: public; Owner: micasa; Tablespace: 
--

ALTER TABLE ONLY per_direccion
    ADD CONSTRAINT per_direccion_pkey PRIMARY KEY (id_direccion);


--
-- Name: per_usuario_correo_key; Type: CONSTRAINT; Schema: public; Owner: micasa; Tablespace: 
--

ALTER TABLE ONLY per_usuario
    ADD CONSTRAINT per_usuario_correo_key UNIQUE (correo);


--
-- Name: per_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: micasa; Tablespace: 
--

ALTER TABLE ONLY per_usuario
    ADD CONSTRAINT per_usuario_pkey PRIMARY KEY (id_usuario);


--
-- Name: pry_comentario_pkey; Type: CONSTRAINT; Schema: public; Owner: micasa; Tablespace: 
--

ALTER TABLE ONLY pry_comentario
    ADD CONSTRAINT pry_comentario_pkey PRIMARY KEY (id_comentario);


--
-- Name: pry_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: micasa; Tablespace: 
--

ALTER TABLE ONLY pry_proyecto
    ADD CONSTRAINT pry_proyecto_pkey PRIMARY KEY (id_proyecto);


--
-- Name: pub_publicidad_pkey; Type: CONSTRAINT; Schema: public; Owner: micasa; Tablespace: 
--

ALTER TABLE ONLY pub_publicidad
    ADD CONSTRAINT pub_publicidad_pkey PRIMARY KEY (id_anuncio);


--
-- Name: seg_login_pkey; Type: CONSTRAINT; Schema: public; Owner: micasa; Tablespace: 
--

ALTER TABLE ONLY seg_login
    ADD CONSTRAINT seg_login_pkey PRIMARY KEY (id_login);


--
-- Name: seg_rol_pkey; Type: CONSTRAINT; Schema: public; Owner: micasa; Tablespace: 
--

ALTER TABLE ONLY seg_rol
    ADD CONSTRAINT seg_rol_pkey PRIMARY KEY (rol);


--
-- Name: seg_rol_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: micasa; Tablespace: 
--

ALTER TABLE ONLY seg_rol_usuario
    ADD CONSTRAINT seg_rol_usuario_pkey PRIMARY KEY (id_usuario, rol);


--
-- Name: idx_anuncio_fin; Type: INDEX; Schema: public; Owner: micasa; Tablespace: 
--

CREATE INDEX idx_anuncio_fin ON pub_publicidad USING btree (activo, fin, id_ubicacion_anuncio);


--
-- Name: idx_anuncio_inicio; Type: INDEX; Schema: public; Owner: micasa; Tablespace: 
--

CREATE INDEX idx_anuncio_inicio ON pub_publicidad USING btree (activo, inicio, id_ubicacion_anuncio);


--
-- Name: idx_cat_maestro_nombre; Type: INDEX; Schema: public; Owner: micasa; Tablespace: 
--

CREATE INDEX idx_cat_maestro_nombre ON cat_maestro USING btree (nombre);


--
-- Name: idx_cat_maestro_unq; Type: INDEX; Schema: public; Owner: micasa; Tablespace: 
--

CREATE UNIQUE INDEX idx_cat_maestro_unq ON cat_maestro USING btree (tipo_catalogo, nombre);


--
-- Name: idx_cms_archivo_nodo; Type: INDEX; Schema: public; Owner: micasa; Tablespace: 
--

CREATE INDEX idx_cms_archivo_nodo ON cms_archivo USING btree (id_nodo, activo, orden);


--
-- Name: idx_cms_archivo_pry; Type: INDEX; Schema: public; Owner: micasa; Tablespace: 
--

CREATE INDEX idx_cms_archivo_pry ON cms_archivo USING btree (id_proyecto, activo, orden);


--
-- Name: idx_cms_archivo_titulo; Type: INDEX; Schema: public; Owner: micasa; Tablespace: 
--

CREATE INDEX idx_cms_archivo_titulo ON cms_archivo USING btree (titulo);


--
-- Name: idx_cms_archivo_usr; Type: INDEX; Schema: public; Owner: micasa; Tablespace: 
--

CREATE INDEX idx_cms_archivo_usr ON cms_archivo USING btree (usuario_reg);


--
-- Name: idx_cms_nodo_titulo; Type: INDEX; Schema: public; Owner: micasa; Tablespace: 
--

CREATE INDEX idx_cms_nodo_titulo ON cms_nodo USING btree (activo, titulo);


--
-- Name: idx_cms_tipo_nodo; Type: INDEX; Schema: public; Owner: micasa; Tablespace: 
--

CREATE INDEX idx_cms_tipo_nodo ON cms_nodo USING btree (id_cms_tipo_nodo);


--
-- Name: idx_codigo; Type: INDEX; Schema: public; Owner: micasa; Tablespace: 
--

CREATE UNIQUE INDEX idx_codigo ON oft_usar_oferta USING btree (codigo);


--
-- Name: idx_contenido_duenio; Type: INDEX; Schema: public; Owner: micasa; Tablespace: 
--

CREATE INDEX idx_contenido_duenio ON cms_contenido USING btree (duenio);


--
-- Name: idx_oferta_fin; Type: INDEX; Schema: public; Owner: micasa; Tablespace: 
--

CREATE INDEX idx_oferta_fin ON oft_oferta USING btree (activo, fin);


--
-- Name: idx_oferta_inicio; Type: INDEX; Schema: public; Owner: micasa; Tablespace: 
--

CREATE INDEX idx_oferta_inicio ON oft_oferta USING btree (activo, inicio);


--
-- Name: idx_per_cal_usuario; Type: INDEX; Schema: public; Owner: micasa; Tablespace: 
--

CREATE INDEX idx_per_cal_usuario ON per_calificacion USING btree (id_proveedor);


--
-- Name: idx_per_direccion_usuario; Type: INDEX; Schema: public; Owner: micasa; Tablespace: 
--

CREATE INDEX idx_per_direccion_usuario ON per_direccion USING btree (id_usuario);


--
-- Name: idx_per_usr_activo; Type: INDEX; Schema: public; Owner: micasa; Tablespace: 
--

CREATE INDEX idx_per_usr_activo ON per_usuario USING btree (activo, id_usuario);


--
-- Name: idx_per_usr_cod_a; Type: INDEX; Schema: public; Owner: micasa; Tablespace: 
--

CREATE INDEX idx_per_usr_cod_a ON per_usuario USING btree (codigo_activacion);


--
-- Name: idx_pry_coment_pry; Type: INDEX; Schema: public; Owner: micasa; Tablespace: 
--

CREATE INDEX idx_pry_coment_pry ON pry_comentario USING btree (id_proyecto, activo);


--
-- Name: idx_pry_tecnico; Type: INDEX; Schema: public; Owner: micasa; Tablespace: 
--

CREATE INDEX idx_pry_tecnico ON pry_proyecto USING btree (usuario_tecnico);


--
-- Name: idx_pry_usuario; Type: INDEX; Schema: public; Owner: micasa; Tablespace: 
--

CREATE INDEX idx_pry_usuario ON pry_proyecto USING btree (usuario_duenio);


--
-- Name: idx_seg_login_fecha; Type: INDEX; Schema: public; Owner: micasa; Tablespace: 
--

CREATE INDEX idx_seg_login_fecha ON seg_login USING btree (fecha, correo);


--
-- Name: idx_uniq; Type: INDEX; Schema: public; Owner: micasa; Tablespace: 
--

CREATE UNIQUE INDEX idx_uniq ON oft_usar_oferta USING btree (id_oferta, id_usuario);


--
-- Name: cms_archivo_id_cms_tipo_archivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY cms_archivo
    ADD CONSTRAINT cms_archivo_id_cms_tipo_archivo_fkey FOREIGN KEY (id_cms_tipo_archivo) REFERENCES cat_maestro(id_cat_maestro) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: cms_archivo_id_nodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY cms_archivo
    ADD CONSTRAINT cms_archivo_id_nodo_fkey FOREIGN KEY (id_nodo) REFERENCES cms_nodo(id_nodo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: cms_archivo_id_proyecto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY cms_archivo
    ADD CONSTRAINT cms_archivo_id_proyecto_fkey FOREIGN KEY (id_proyecto) REFERENCES pry_proyecto(id_proyecto) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: cms_contenido_duenio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY cms_contenido
    ADD CONSTRAINT cms_contenido_duenio_fkey FOREIGN KEY (duenio) REFERENCES per_usuario(id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: cms_nodo_id_cms_tipo_nodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY cms_nodo
    ADD CONSTRAINT cms_nodo_id_cms_tipo_nodo_fkey FOREIGN KEY (id_cms_tipo_nodo) REFERENCES cat_maestro(id_cat_maestro) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: oft_oferta_duenio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY oft_oferta
    ADD CONSTRAINT oft_oferta_duenio_fkey FOREIGN KEY (duenio) REFERENCES per_usuario(id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: oft_usar_oferta_id_oferta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY oft_usar_oferta
    ADD CONSTRAINT oft_usar_oferta_id_oferta_fkey FOREIGN KEY (id_oferta) REFERENCES oft_oferta(id_oferta) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: oft_usar_oferta_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY oft_usar_oferta
    ADD CONSTRAINT oft_usar_oferta_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES per_usuario(id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: per_calificacion_id_autor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY per_calificacion
    ADD CONSTRAINT per_calificacion_id_autor_fkey FOREIGN KEY (id_autor) REFERENCES per_usuario(id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: per_calificacion_id_proveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY per_calificacion
    ADD CONSTRAINT per_calificacion_id_proveedor_fkey FOREIGN KEY (id_proveedor) REFERENCES per_usuario(id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: per_calificacion_usuario_reg_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY per_calificacion
    ADD CONSTRAINT per_calificacion_usuario_reg_fkey FOREIGN KEY (usuario_reg) REFERENCES per_usuario(id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: per_direccion_id_localidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY per_direccion
    ADD CONSTRAINT per_direccion_id_localidad_fkey FOREIGN KEY (id_localidad) REFERENCES cat_maestro(id_cat_maestro) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: per_direccion_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY per_direccion
    ADD CONSTRAINT per_direccion_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES per_usuario(id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: pry_comentario_id_comentarista_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY pry_comentario
    ADD CONSTRAINT pry_comentario_id_comentarista_fkey FOREIGN KEY (id_comentarista) REFERENCES per_usuario(id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: pry_comentario_id_proyecto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY pry_comentario
    ADD CONSTRAINT pry_comentario_id_proyecto_fkey FOREIGN KEY (id_proyecto) REFERENCES pry_proyecto(id_proyecto) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: pry_proyecto_id_banco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY pry_proyecto
    ADD CONSTRAINT pry_proyecto_id_banco_fkey FOREIGN KEY (id_banco) REFERENCES cat_maestro(id_cat_maestro) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: pry_proyecto_id_estado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY pry_proyecto
    ADD CONSTRAINT pry_proyecto_id_estado_fkey FOREIGN KEY (id_estado) REFERENCES cat_maestro(id_cat_maestro) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: pry_proyecto_id_moneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY pry_proyecto
    ADD CONSTRAINT pry_proyecto_id_moneda_fkey FOREIGN KEY (id_moneda) REFERENCES cat_maestro(id_cat_maestro) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: pry_proyecto_id_pry_forma_pago_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY pry_proyecto
    ADD CONSTRAINT pry_proyecto_id_pry_forma_pago_fkey FOREIGN KEY (id_pry_forma_pago) REFERENCES cat_maestro(id_cat_maestro) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: pry_proyecto_id_pry_tipo_servicio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY pry_proyecto
    ADD CONSTRAINT pry_proyecto_id_pry_tipo_servicio_fkey FOREIGN KEY (id_pry_tipo_servicio) REFERENCES cat_maestro(id_cat_maestro) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: pry_proyecto_usuario_duenio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY pry_proyecto
    ADD CONSTRAINT pry_proyecto_usuario_duenio_fkey FOREIGN KEY (usuario_duenio) REFERENCES per_usuario(id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: pry_proyecto_usuario_tecnico_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY pry_proyecto
    ADD CONSTRAINT pry_proyecto_usuario_tecnico_fkey FOREIGN KEY (usuario_tecnico) REFERENCES per_usuario(id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: pub_publicidad_id_ubicacion_anuncio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY pub_publicidad
    ADD CONSTRAINT pub_publicidad_id_ubicacion_anuncio_fkey FOREIGN KEY (id_ubicacion_anuncio) REFERENCES cat_maestro(id_cat_maestro) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: seg_rol_usuario_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY seg_rol_usuario
    ADD CONSTRAINT seg_rol_usuario_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES per_usuario(id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: seg_rol_usuario_rol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: micasa
--

ALTER TABLE ONLY seg_rol_usuario
    ADD CONSTRAINT seg_rol_usuario_rol_fkey FOREIGN KEY (rol) REFERENCES seg_rol(rol) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

