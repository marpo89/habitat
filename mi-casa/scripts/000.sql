/*Usuario: postgres */

-- micasa/12345678

CREATE ROLE micasa LOGIN ENCRYPTED PASSWORD 'md5bc6a29a11480df8cad634a627e4cfb43' VALID UNTIL 'infinity';

CREATE DATABASE micasa WITH ENCODING='UTF8' OWNER=micasa CONNECTION LIMIT=-1;

GRANT ALL PRIVILEGES ON DATABASE micasa TO micasa;

/*Cerrar BD postgres y abrir BD micasa */

ALTER SCHEMA public OWNER TO micasa;

DROP SCHEMA IF EXISTS public CASCADE;

CREATE SCHEMA public;