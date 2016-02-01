--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
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


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: favorito; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE favorito (
    id_favorito integer NOT NULL,
    favorito integer NOT NULL,
    usuario integer NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT now()
);


ALTER TABLE favorito OWNER TO postgres;

--
-- Name: favorito_id_favorito_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE favorito_id_favorito_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE favorito_id_favorito_seq OWNER TO postgres;

--
-- Name: favorito_id_favorito_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE favorito_id_favorito_seq OWNED BY favorito.id_favorito;


--
-- Name: idioma; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE idioma (
    id_idioma integer NOT NULL,
    idioma character varying(50)
);


ALTER TABLE idioma OWNER TO postgres;

--
-- Name: idioma_id_idioma_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idioma_id_idioma_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE idioma_id_idioma_seq OWNER TO postgres;

--
-- Name: idioma_id_idioma_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE idioma_id_idioma_seq OWNED BY idioma.id_idioma;


--
-- Name: pais; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pais (
    id_pais integer NOT NULL,
    pais character varying(50)
);


ALTER TABLE pais OWNER TO postgres;

--
-- Name: pais_id_pais_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pais_id_pais_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pais_id_pais_seq OWNER TO postgres;

--
-- Name: pais_id_pais_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pais_id_pais_seq OWNED BY pais.id_pais;


--
-- Name: pregunta_secreta; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pregunta_secreta (
    id_pregunta_secreta integer NOT NULL,
    pregunta_secreta character varying(50)
);


ALTER TABLE pregunta_secreta OWNER TO postgres;

--
-- Name: pregunta_secreta_id_pregunta_secreta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pregunta_secreta_id_pregunta_secreta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pregunta_secreta_id_pregunta_secreta_seq OWNER TO postgres;

--
-- Name: pregunta_secreta_id_pregunta_secreta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pregunta_secreta_id_pregunta_secreta_seq OWNED BY pregunta_secreta.id_pregunta_secreta;


--
-- Name: retweet; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE retweet (
    id_retweet integer NOT NULL,
    retweet integer NOT NULL,
    usuario integer NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT now()
);


ALTER TABLE retweet OWNER TO postgres;

--
-- Name: retweet_id_retweet_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE retweet_id_retweet_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE retweet_id_retweet_seq OWNER TO postgres;

--
-- Name: retweet_id_retweet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE retweet_id_retweet_seq OWNED BY retweet.id_retweet;


--
-- Name: seguidor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE seguidor (
    id_seguidor integer NOT NULL,
    seguidor integer NOT NULL,
    siguiendo integer NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT now()
);


ALTER TABLE seguidor OWNER TO postgres;

--
-- Name: seguidor_id_seguidor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seguidor_id_seguidor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seguidor_id_seguidor_seq OWNER TO postgres;

--
-- Name: seguidor_id_seguidor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE seguidor_id_seguidor_seq OWNED BY seguidor.id_seguidor;


--
-- Name: tweet; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tweet (
    id_tweet integer NOT NULL,
    tweet character varying(140) NOT NULL,
    foto character varying(50),
    usuario integer NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT now()
);


ALTER TABLE tweet OWNER TO postgres;

--
-- Name: tweet_id_tweet_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tweet_id_tweet_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tweet_id_tweet_seq OWNER TO postgres;

--
-- Name: tweet_id_tweet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tweet_id_tweet_seq OWNED BY tweet.id_tweet;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    id_usuario integer NOT NULL,
    usuario character varying(30) NOT NULL,
    correo character varying(80) NOT NULL,
    nombre_completo character varying(100) NOT NULL,
    password character varying(256) NOT NULL,
    fk_idioma integer,
    fk_pais integer,
    fk_pregunta_secreta integer,
    respuesta_secreta character varying(256),
    telefono character varying(15),
    foto_perfil character varying(100),
    imagen_fondo character varying(100),
    activo boolean,
    fecha_creacion timestamp without time zone DEFAULT now(),
    sitioweb character varying(60),
    biografia character varying(200)
);


ALTER TABLE usuario OWNER TO postgres;

--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_usuario_seq OWNER TO postgres;

--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_id_usuario_seq OWNED BY usuario.id_usuario;


--
-- Name: id_favorito; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY favorito ALTER COLUMN id_favorito SET DEFAULT nextval('favorito_id_favorito_seq'::regclass);


--
-- Name: id_idioma; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY idioma ALTER COLUMN id_idioma SET DEFAULT nextval('idioma_id_idioma_seq'::regclass);


--
-- Name: id_pais; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pais ALTER COLUMN id_pais SET DEFAULT nextval('pais_id_pais_seq'::regclass);


--
-- Name: id_pregunta_secreta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pregunta_secreta ALTER COLUMN id_pregunta_secreta SET DEFAULT nextval('pregunta_secreta_id_pregunta_secreta_seq'::regclass);


--
-- Name: id_retweet; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY retweet ALTER COLUMN id_retweet SET DEFAULT nextval('retweet_id_retweet_seq'::regclass);


--
-- Name: id_seguidor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seguidor ALTER COLUMN id_seguidor SET DEFAULT nextval('seguidor_id_seguidor_seq'::regclass);


--
-- Name: id_tweet; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tweet ALTER COLUMN id_tweet SET DEFAULT nextval('tweet_id_tweet_seq'::regclass);


--
-- Name: id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN id_usuario SET DEFAULT nextval('usuario_id_usuario_seq'::regclass);


--
-- Data for Name: favorito; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY favorito (id_favorito, favorito, usuario, fecha_creacion) FROM stdin;
2	8	3	2015-09-16 23:19:53.527972
3	8	4	2015-09-16 23:20:01.304012
4	8	7	2015-09-16 23:20:09.079853
5	5	8	2015-09-16 23:20:15.111829
6	5	1	2015-09-16 23:20:20.735755
7	6	2	2015-09-16 23:20:37.831605
\.


--
-- Name: favorito_id_favorito_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('favorito_id_favorito_seq', 7, true);


--
-- Data for Name: idioma; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY idioma (id_idioma, idioma) FROM stdin;
1	Español
2	Ingles
\.


--
-- Name: idioma_id_idioma_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('idioma_id_idioma_seq', 2, true);


--
-- Data for Name: pais; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pais (id_pais, pais) FROM stdin;
1	Venezuela
3	Portugal
2	Cuba
\.


--
-- Name: pais_id_pais_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pais_id_pais_seq', 3, true);


--
-- Data for Name: pregunta_secreta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pregunta_secreta (id_pregunta_secreta, pregunta_secreta) FROM stdin;
3	Aniversario de Bodas
4	Nombre de Mascota
5	Nombre de tu primer colegio
6	Equipo de Beisbol
7	Color Favorito
\.


--
-- Name: pregunta_secreta_id_pregunta_secreta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pregunta_secreta_id_pregunta_secreta_seq', 7, true);


--
-- Data for Name: retweet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY retweet (id_retweet, retweet, usuario, fecha_creacion) FROM stdin;
1	2	4	2015-09-16 23:11:53.602481
2	2	3	2015-09-16 23:12:00.258453
5	2	2	2015-09-16 23:12:13.435917
6	2	1	2015-09-16 23:12:27.042332
7	8	7	2015-09-16 23:12:47.641549
8	8	8	2015-09-16 23:12:51.394207
9	8	4	2015-09-16 23:13:26.506142
10	5	3	2015-09-16 23:13:35.426003
\.


--
-- Name: retweet_id_retweet_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('retweet_id_retweet_seq', 10, true);


--
-- Data for Name: seguidor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) FROM stdin;
19	1	2	2015-09-16 11:33:26.309385
24	1	3	2015-09-16 12:00:36.45076
\.


--
-- Name: seguidor_id_seguidor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seguidor_id_seguidor_seq', 28, true);


--
-- Data for Name: tweet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tweet (id_tweet, tweet, foto, usuario, fecha_creacion) FROM stdin;
1	mi primer tweet		1	2015-09-16 00:38:22.262166
2	espale que mas este es mi twett	\N	2	2015-09-16 22:41:18.731977
4	aqui en mi clon de tweeter	\N	3	2015-09-16 22:41:33.803952
5	eesto pinta bien	\N	2	2015-09-16 22:41:44.139859
6	con hambre y sueño	\N	2	2015-09-16 22:42:07.955146
8	este clon tiene 140 caracteres todo parece bien por aqui	\N	3	2015-09-16 22:42:26.523531
9	algodon este twetter pinta bien	\N	4	2015-09-16 22:42:56.68353
10	el tweeter desde el modal2		1	2015-09-17 02:35:23.060322
\.


--
-- Name: tweet_id_tweet_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tweet_id_tweet_seq', 10, true);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (id_usuario, usuario, correo, nombre_completo, password, fk_idioma, fk_pais, fk_pregunta_secreta, respuesta_secreta, telefono, foto_perfil, imagen_fondo, activo, fecha_creacion, sitioweb, biografia) FROM stdin;
7	leninmhs2	usuarioycorreo@gmail.com	El Usuario  2	1	2	\N	\N			\N		f	2015-09-15 02:39:14.654634	\N	\N
8	leninmhs3	usuarioycorreo@gmail.com	Lenin Hernandez3	1	\N	\N	\N			\N		f	2015-09-15 02:39:41.242364	\N	\N
12	el user2	el user2@gmail.com	Usuario Y	111	\N	\N	\N			trigger funcion postgres codigo compuesto insert.png		f	2015-09-15 02:48:23.048689	\N	\N
13	el user2	el user2@gmail.com	Usuario Y	1	\N	\N	\N			\N		f	2015-09-15 02:48:38.193672	\N	\N
18	13123123	el use23123r2@gmail.com	Usuario Y312312	11	\N	\N	\N			\N		f	2015-09-15 04:37:48.773379	\N	\N
19	el user231231231	el 321312312user2@gmail.com	Usuario Y3123123	321312	\N	\N	\N			\N		f	2015-09-15 04:38:01.45305	\N	\N
21	qweqwerrqwe	el rerwerwuser2@gmail.com	Usuario Y	rewrqweq	\N	\N	\N			\N		f	2015-09-15 04:43:28.093678	\N	\N
22	rwerqwerqwer	el rewrwererwerwuser2@gmail.com	Usuario Y	rewrweq	\N	\N	\N			Canada_Family2.jpg		f	2015-09-15 04:43:55.341269	\N	\N
1	leninmhs	leninmhs@gmail.com	Lenin Hernandez	e10adc3949ba59abbe56e057f20f883e	2	\N	\N			popcorn-time.jpg		f	2015-09-14 00:33:08.183621	\N	\N
2	usuariox	usuarioxcorreo@gmail.com	El Usuario  X	e10adc3949ba59abbe56e057f20f883e	1	\N	\N			PostgreSQL-leninmhs.svg		f	2015-09-14 01:50:36.382064	\N	\N
3	usuarioy	usuarioycorreo@gmail.com	Usuario Y	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N			yii booster boostrap yii.png		f	2015-09-14 02:06:43.060158	\N	\N
4	usuarioxy	usuarioxycorreo@gmail.com	El Usuario  XY	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N			PostgreSQL_logo.3colors.svg		f	2015-09-14 02:08:55.053386	\N	\N
23	lorendym	lorendym@gmail.com	Lorendy Martinez	123456	\N	\N	\N					f	2016-01-29 01:11:28.761009		
16	el user2	el user2@gmail.com	El Usuario  3	s	\N	\N	\N					f	2015-09-15 02:51:48.820243		
24	jmonsa02	juanconsalves@gmail.com	Juan Carlos Monsalve Sarmiento	123456	2	1	7	rojo	02129410040			t	2016-01-30 16:32:59.717348		
25	usuario	Curso	usuario Curso	linux	1	1	6	Caracas	04269028389			f	2016-01-30 16:33:18.680676	leninmhs.wordpress.com	activista software libre
26	Crisma	crismarilian@gmail.com	Cris Silva	123	1	1	6	Tigres	5007601			f	2016-01-30 16:34:12.383429		
27	cgome1	cgomeznt@gmail.com	Carlos Gómez Gómez	Venezuela21	1	1	3	12	04166095772			f	2016-01-30 16:34:34.034268		
28	Ksh	Kshgmail.com	Ksh	1234	1	2	7	n				f	2016-01-30 16:35:13.164402		
29	lizandra	lizandraperez	lizandra	123	1	1	6					f	2016-01-30 16:37:11.750709		
\.


--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_usuario_seq', 29, true);


--
-- Name: pk_favorito; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY favorito
    ADD CONSTRAINT pk_favorito PRIMARY KEY (id_favorito);


--
-- Name: pk_idioma; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY idioma
    ADD CONSTRAINT pk_idioma PRIMARY KEY (id_idioma);


--
-- Name: pk_pais; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT pk_pais PRIMARY KEY (id_pais);


--
-- Name: pk_pregunta_secreta; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pregunta_secreta
    ADD CONSTRAINT pk_pregunta_secreta PRIMARY KEY (id_pregunta_secreta);


--
-- Name: pk_retweet; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY retweet
    ADD CONSTRAINT pk_retweet PRIMARY KEY (id_retweet);


--
-- Name: pk_seguidor; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY seguidor
    ADD CONSTRAINT pk_seguidor PRIMARY KEY (id_seguidor);


--
-- Name: pk_tweet; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tweet
    ADD CONSTRAINT pk_tweet PRIMARY KEY (id_tweet);


--
-- Name: pk_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_usuario PRIMARY KEY (id_usuario);


--
-- Name: fk_favorito; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY favorito
    ADD CONSTRAINT fk_favorito FOREIGN KEY (favorito) REFERENCES tweet(id_tweet);


--
-- Name: fk_idioma; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_idioma FOREIGN KEY (fk_idioma) REFERENCES idioma(id_idioma);


--
-- Name: fk_pais; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_pais FOREIGN KEY (fk_pais) REFERENCES pais(id_pais);


--
-- Name: fk_pregunta_secreta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_pregunta_secreta FOREIGN KEY (fk_pregunta_secreta) REFERENCES pregunta_secreta(id_pregunta_secreta);


--
-- Name: fk_retweet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY retweet
    ADD CONSTRAINT fk_retweet FOREIGN KEY (retweet) REFERENCES tweet(id_tweet);


--
-- Name: fk_seguidor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seguidor
    ADD CONSTRAINT fk_seguidor FOREIGN KEY (seguidor) REFERENCES usuario(id_usuario);


--
-- Name: fk_siguiendo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seguidor
    ADD CONSTRAINT fk_siguiendo FOREIGN KEY (siguiendo) REFERENCES usuario(id_usuario);


--
-- Name: fk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tweet
    ADD CONSTRAINT fk_usuario FOREIGN KEY (usuario) REFERENCES usuario(id_usuario);


--
-- Name: fk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY retweet
    ADD CONSTRAINT fk_usuario FOREIGN KEY (usuario) REFERENCES usuario(id_usuario);


--
-- Name: fk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY favorito
    ADD CONSTRAINT fk_usuario FOREIGN KEY (usuario) REFERENCES usuario(id_usuario);


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

