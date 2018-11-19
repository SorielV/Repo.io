--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Bundle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Bundle" (
    id integer NOT NULL,
    "idUser" integer NOT NULL,
    title character varying(80) NOT NULL,
    description character varying(200) NOT NULL,
    oficial boolean DEFAULT false,
    username character varying(20) NOT NULL,
    "createdAt" timestamp without time zone
);


ALTER TABLE public."Bundle" OWNER TO postgres;

--
-- Name: BundleComment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BundleComment" (
    id integer NOT NULL,
    "idUser" integer NOT NULL,
    username character varying(20) NOT NULL,
    "idBundle" integer NOT NULL,
    comment character varying(255) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);


ALTER TABLE public."BundleComment" OWNER TO postgres;

--
-- Name: BundleComment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."BundleComment_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."BundleComment_id_seq" OWNER TO postgres;

--
-- Name: BundleComment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."BundleComment_id_seq" OWNED BY public."BundleComment".id;


--
-- Name: BundleRepository; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BundleRepository" (
    id integer NOT NULL,
    "idBundle" integer NOT NULL,
    "idRepository" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


ALTER TABLE public."BundleRepository" OWNER TO postgres;

--
-- Name: BundleRepository_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."BundleRepository_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."BundleRepository_id_seq" OWNER TO postgres;

--
-- Name: BundleRepository_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."BundleRepository_id_seq" OWNED BY public."BundleRepository".id;


--
-- Name: Bundle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Bundle_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Bundle_id_seq" OWNER TO postgres;

--
-- Name: Bundle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Bundle_id_seq" OWNED BY public."Bundle".id;


--
-- Name: CatalogAuthors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CatalogAuthors" (
    id integer NOT NULL,
    image character varying(100),
    description character varying(200),
    "lastName" character varying(40) NOT NULL,
    "firstName" character varying(40) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


ALTER TABLE public."CatalogAuthors" OWNER TO postgres;

--
-- Name: CatalogAuthors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CatalogAuthors_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CatalogAuthors_id_seq" OWNER TO postgres;

--
-- Name: CatalogAuthors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CatalogAuthors_id_seq" OWNED BY public."CatalogAuthors".id;


--
-- Name: CatalogEditorials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CatalogEditorials" (
    id integer NOT NULL,
    image character varying(100),
    description character varying(200),
    name character varying(80) NOT NULL
);


ALTER TABLE public."CatalogEditorials" OWNER TO postgres;

--
-- Name: CatalogEditorials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CatalogEditorials_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CatalogEditorials_id_seq" OWNER TO postgres;

--
-- Name: CatalogEditorials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CatalogEditorials_id_seq" OWNED BY public."CatalogEditorials".id;


--
-- Name: CatalogTopics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CatalogTopics" (
    id integer NOT NULL,
    value character varying(30) NOT NULL,
    description character varying(200) DEFAULT ''::character varying NOT NULL,
    image character varying(100)
);


ALTER TABLE public."CatalogTopics" OWNER TO postgres;

--
-- Name: CatalogTopics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CatalogTopics_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CatalogTopics_id_seq" OWNER TO postgres;

--
-- Name: CatalogTopics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CatalogTopics_id_seq" OWNED BY public."CatalogTopics".id;


--
-- Name: CatalogTypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CatalogTypes" (
    id integer NOT NULL,
    value character varying(30) NOT NULL,
    description character varying(200) DEFAULT ''::character varying,
    image character varying(100)
);


ALTER TABLE public."CatalogTypes" OWNER TO postgres;

--
-- Name: CatalogTypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CatalogTypes_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CatalogTypes_id_seq" OWNER TO postgres;

--
-- Name: CatalogTypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CatalogTypes_id_seq" OWNED BY public."CatalogTypes".id;


--
-- Name: Files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Files" (
    id integer NOT NULL,
    type smallint NOT NULL,
    path character varying(80) NOT NULL,
    url character varying(80) NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);


ALTER TABLE public."Files" OWNER TO postgres;

--
-- Name: Files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Files_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Files_id_seq" OWNER TO postgres;

--
-- Name: Files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Files_id_seq" OWNED BY public."Files".id;


--
-- Name: MyList; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MyList" (
    id integer NOT NULL,
    "idUser" integer NOT NULL,
    username character varying(20) NOT NULL,
    "idRepository" integer NOT NULL,
    type smallint DEFAULT 0,
    "createdAt" timestamp without time zone DEFAULT now()
);


ALTER TABLE public."MyList" OWNER TO postgres;

--
-- Name: MyList_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MyList_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MyList_id_seq" OWNER TO postgres;

--
-- Name: MyList_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MyList_id_seq" OWNED BY public."MyList".id;


--
-- Name: Repositories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Repositories" (
    id integer NOT NULL,
    "idUser" integer NOT NULL,
    username character varying(20) NOT NULL,
    title character varying(80) NOT NULL,
    description character varying(200) NOT NULL,
    image character varying(100) NOT NULL,
    tags character varying(120) NOT NULL,
    visibility smallint DEFAULT 0,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);


ALTER TABLE public."Repositories" OWNER TO postgres;

--
-- Name: Repositories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Repositories_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Repositories_id_seq" OWNER TO postgres;

--
-- Name: Repositories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Repositories_id_seq" OWNED BY public."Repositories".id;


--
-- Name: RepositoryAuthors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RepositoryAuthors" (
    id integer NOT NULL,
    "idRepository" integer,
    "idAuthor" integer
);


ALTER TABLE public."RepositoryAuthors" OWNER TO postgres;

--
-- Name: RepositoryAuthors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RepositoryAuthors_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RepositoryAuthors_id_seq" OWNER TO postgres;

--
-- Name: RepositoryAuthors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RepositoryAuthors_id_seq" OWNED BY public."RepositoryAuthors".id;


--
-- Name: RepositoryComment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RepositoryComment" (
    id integer NOT NULL,
    "idUser" integer NOT NULL,
    username character varying(20) NOT NULL,
    "idRepository" integer NOT NULL,
    comment character varying(255) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);


ALTER TABLE public."RepositoryComment" OWNER TO postgres;

--
-- Name: RepositoryComment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RepositoryComment_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RepositoryComment_id_seq" OWNER TO postgres;

--
-- Name: RepositoryComment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RepositoryComment_id_seq" OWNED BY public."RepositoryComment".id;


--
-- Name: RepositoryEditorials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RepositoryEditorials" (
    id integer NOT NULL,
    "idRepository" integer,
    "idCatalog" integer
);


ALTER TABLE public."RepositoryEditorials" OWNER TO postgres;

--
-- Name: RepositoryEditorials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RepositoryEditorials_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RepositoryEditorials_id_seq" OWNER TO postgres;

--
-- Name: RepositoryEditorials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RepositoryEditorials_id_seq" OWNED BY public."RepositoryEditorials".id;


--
-- Name: RepositoryResources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RepositoryResources" (
    id integer NOT NULL,
    "idUser" integer NOT NULL,
    username character varying(20) NOT NULL,
    "idRepository" integer NOT NULL,
    file character varying(200) NOT NULL,
    type smallint DEFAULT 0,
    uploaded boolean DEFAULT false,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);


ALTER TABLE public."RepositoryResources" OWNER TO postgres;

--
-- Name: RepositoryResources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RepositoryResources_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RepositoryResources_id_seq" OWNER TO postgres;

--
-- Name: RepositoryResources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RepositoryResources_id_seq" OWNED BY public."RepositoryResources".id;


--
-- Name: RepositoryScore; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RepositoryScore" (
    id integer NOT NULL,
    "idUser" integer NOT NULL,
    username character varying(20) NOT NULL,
    score smallint NOT NULL,
    comment character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);


ALTER TABLE public."RepositoryScore" OWNER TO postgres;

--
-- Name: RepositoryScore_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RepositoryScore_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RepositoryScore_id_seq" OWNER TO postgres;

--
-- Name: RepositoryScore_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RepositoryScore_id_seq" OWNED BY public."RepositoryScore".id;


--
-- Name: RepositoryTopics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RepositoryTopics" (
    id integer NOT NULL,
    "idRepository" integer,
    "idCatalog" integer
);


ALTER TABLE public."RepositoryTopics" OWNER TO postgres;

--
-- Name: RepositoryTopics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RepositoryTopics_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RepositoryTopics_id_seq" OWNER TO postgres;

--
-- Name: RepositoryTopics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RepositoryTopics_id_seq" OWNED BY public."RepositoryTopics".id;


--
-- Name: RepositoryTypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RepositoryTypes" (
    id integer NOT NULL,
    "idRepository" integer,
    "idCatalog" integer
);


ALTER TABLE public."RepositoryTypes" OWNER TO postgres;

--
-- Name: RepositoryTypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RepositoryTypes_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RepositoryTypes_id_seq" OWNER TO postgres;

--
-- Name: RepositoryTypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RepositoryTypes_id_seq" OWNED BY public."RepositoryTypes".id;


--
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    email character varying(80) NOT NULL,
    username character varying(20) NOT NULL,
    password character varying(80) NOT NULL,
    "firstName" character varying(40) NOT NULL,
    "lastName" character varying(40) NOT NULL,
    type smallint DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone,
    "profileImage" character varying(120) NOT NULL
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_id_seq" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- Name: Verification_Token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Verification_Token" (
    id integer NOT NULL,
    "idUser" integer NOT NULL,
    username character varying(20),
    token character varying(120) NOT NULL,
    type smallint NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now(),
    "expiredAt" timestamp without time zone,
    column_8 boolean
);


ALTER TABLE public."Verification_Token" OWNER TO postgres;

--
-- Name: Verification_Token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Verification_Token_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Verification_Token_id_seq" OWNER TO postgres;

--
-- Name: Verification_Token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Verification_Token_id_seq" OWNED BY public."Verification_Token".id;


--
-- Name: catalogtopics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.catalogtopics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalogtopics_id_seq OWNER TO postgres;

--
-- Name: catalogtopics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.catalogtopics_id_seq OWNED BY public."CatalogTopics".id;


--
-- Name: catalogtypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.catalogtypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalogtypes_id_seq OWNER TO postgres;

--
-- Name: catalogtypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.catalogtypes_id_seq OWNED BY public."CatalogTypes".id;


--
-- Name: Bundle id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Bundle" ALTER COLUMN id SET DEFAULT nextval('public."Bundle_id_seq"'::regclass);


--
-- Name: BundleComment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BundleComment" ALTER COLUMN id SET DEFAULT nextval('public."BundleComment_id_seq"'::regclass);


--
-- Name: BundleRepository id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BundleRepository" ALTER COLUMN id SET DEFAULT nextval('public."BundleRepository_id_seq"'::regclass);


--
-- Name: CatalogAuthors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CatalogAuthors" ALTER COLUMN id SET DEFAULT nextval('public."CatalogAuthors_id_seq"'::regclass);


--
-- Name: CatalogEditorials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CatalogEditorials" ALTER COLUMN id SET DEFAULT nextval('public."CatalogEditorials_id_seq"'::regclass);


--
-- Name: CatalogTopics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CatalogTopics" ALTER COLUMN id SET DEFAULT nextval('public.catalogtopics_id_seq'::regclass);


--
-- Name: CatalogTypes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CatalogTypes" ALTER COLUMN id SET DEFAULT nextval('public.catalogtypes_id_seq'::regclass);


--
-- Name: Files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Files" ALTER COLUMN id SET DEFAULT nextval('public."Files_id_seq"'::regclass);


--
-- Name: MyList id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MyList" ALTER COLUMN id SET DEFAULT nextval('public."MyList_id_seq"'::regclass);


--
-- Name: Repositories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Repositories" ALTER COLUMN id SET DEFAULT nextval('public."Repositories_id_seq"'::regclass);


--
-- Name: RepositoryAuthors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryAuthors" ALTER COLUMN id SET DEFAULT nextval('public."RepositoryAuthors_id_seq"'::regclass);


--
-- Name: RepositoryComment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryComment" ALTER COLUMN id SET DEFAULT nextval('public."RepositoryComment_id_seq"'::regclass);


--
-- Name: RepositoryEditorials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryEditorials" ALTER COLUMN id SET DEFAULT nextval('public."RepositoryEditorials_id_seq"'::regclass);


--
-- Name: RepositoryResources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryResources" ALTER COLUMN id SET DEFAULT nextval('public."RepositoryResources_id_seq"'::regclass);


--
-- Name: RepositoryScore id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryScore" ALTER COLUMN id SET DEFAULT nextval('public."RepositoryScore_id_seq"'::regclass);


--
-- Name: RepositoryTopics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryTopics" ALTER COLUMN id SET DEFAULT nextval('public."RepositoryTopics_id_seq"'::regclass);


--
-- Name: RepositoryTypes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryTypes" ALTER COLUMN id SET DEFAULT nextval('public."RepositoryTypes_id_seq"'::regclass);


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- Name: Verification_Token id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Verification_Token" ALTER COLUMN id SET DEFAULT nextval('public."Verification_Token_id_seq"'::regclass);


--
-- Data for Name: Bundle; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: BundleComment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: BundleRepository; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: CatalogAuthors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."CatalogAuthors" (id, image, description, "lastName", "firstName", "createdAt") VALUES (1, 'http://www.nyan.cat/cats/original.gif', 'Is a Cat', 'Cat', 'Nyan', '2018-11-10 20:51:39.912119');
INSERT INTO public."CatalogAuthors" (id, image, description, "lastName", "firstName", "createdAt") VALUES (3, 'http://www.nyan.cat/cats/mexinyan.gif', 'Is a Mexican Cat', 'Mexican', 'Nyan', '2018-11-14 00:41:41.350202');


--
-- Data for Name: CatalogEditorials; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."CatalogEditorials" (id, image, description, name) VALUES (1, NULL, 'Nintendo', 'nintendo');


--
-- Data for Name: CatalogTopics; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."CatalogTopics" (id, value, description, image) VALUES (1, 'Examples', 'Examples', NULL);
INSERT INTO public."CatalogTopics" (id, value, description, image) VALUES (2, 'Samples', 'Samples', NULL);
INSERT INTO public."CatalogTopics" (id, value, description, image) VALUES (3, 'Cultura', '', NULL);
INSERT INTO public."CatalogTopics" (id, value, description, image) VALUES (4, 'Comida', '', NULL);
INSERT INTO public."CatalogTopics" (id, value, description, image) VALUES (5, 'Videojuegos', '', NULL);
INSERT INTO public."CatalogTopics" (id, value, description, image) VALUES (6, 'Humor', '', NULL);
INSERT INTO public."CatalogTopics" (id, value, description, image) VALUES (7, 'Musica', '', NULL);
INSERT INTO public."CatalogTopics" (id, value, description, image) VALUES (8, 'Fotografia', '', NULL);
INSERT INTO public."CatalogTopics" (id, value, description, image) VALUES (9, 'Deportes', '', NULL);
INSERT INTO public."CatalogTopics" (id, value, description, image) VALUES (10, 'Estilo', '', NULL);
INSERT INTO public."CatalogTopics" (id, value, description, image) VALUES (11, 'TV', '', NULL);
INSERT INTO public."CatalogTopics" (id, value, description, image) VALUES (12, 'Negocios', '', NULL);
INSERT INTO public."CatalogTopics" (id, value, description, image) VALUES (13, 'Disenio', '', NULL);
INSERT INTO public."CatalogTopics" (id, value, description, image) VALUES (16, 'Economia', '', NULL);
INSERT INTO public."CatalogTopics" (id, value, description, image) VALUES (17, 'Javascript', '', NULL);
INSERT INTO public."CatalogTopics" (id, value, description, image) VALUES (19, 'Machine Learning', '', NULL);
INSERT INTO public."CatalogTopics" (id, value, description, image) VALUES (20, 'Programing', '', NULL);
INSERT INTO public."CatalogTopics" (id, value, description, image) VALUES (21, 'Sotfware', '', NULL);
INSERT INTO public."CatalogTopics" (id, value, description, image) VALUES (22, 'Tecnologia', '', NULL);
INSERT INTO public."CatalogTopics" (id, value, description, image) VALUES (23, 'Otros', '', NULL);
INSERT INTO public."CatalogTopics" (id, value, description, image) VALUES (24, 'pokemon', 'El mundo pokemon', NULL);
INSERT INTO public."CatalogTopics" (id, value, description, image) VALUES (25, 'anime', 'Animes', NULL);
INSERT INTO public."CatalogTopics" (id, value, description, image) VALUES (26, 'cartoons', 'Cartoons', NULL);


--
-- Data for Name: CatalogTypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (1, 'Example', 'Example', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (3, 'Cursos', '', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (4, 'Videos', '', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (5, 'Portales Blogs', '', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (6, 'Tools Software', '', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (7, 'PPTs SlideShare', '', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (8, 'Infografias y Memes', '', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (9, 'People To Follow', '', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (10, 'Comunidades', '', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (11, 'APIs', '', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (12, 'DataSets', '', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (13, 'Papers', '', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (14, 'Books', '', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (15, 'water', 'Tipo de pokemon {water}', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (16, 'fire', 'Tipo de pokemon {fire}', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (17, 'normal', 'Tipo de pokemon {normal}', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (18, 'dark', 'Tipo de pokemon {dark}', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (19, 'poison', 'Tipo de pokemon {poison}', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (20, 'electric', 'Tipo de pokemon {electric}', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (21, 'ice', 'Tipo de pokemon {ice}', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (22, 'ground', 'Tipo de pokemon {ground}', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (23, 'fairy', 'Tipo de pokemon {fairy}', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (24, 'fighting', 'Tipo de pokemon {fighting}', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (25, 'psychic', 'Tipo de pokemon {psychic}', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (26, 'rock', 'Tipo de pokemon {rock}', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (27, 'ghost', 'Tipo de pokemon {ghost}', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (28, 'dragon', 'Tipo de pokemon {dragon}', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (29, 'steel', 'Tipo de pokemon {steel}', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (30, 'flying', 'Tipo de pokemon {flying}', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (32, 'bug', 'Tipo de pokemon {bug}', NULL);
INSERT INTO public."CatalogTypes" (id, value, description, image) VALUES (2, 'grass', 'Tipo de pokemon {grass}', '/public/catalog/types/2.jpeg');


--
-- Data for Name: Files; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: MyList; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Repositories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2585, 1, 'admin', 'Squirtle', 'Squirtle es el pokemon numero #7', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/007.png', 'electric,grass', 1, '2018-11-16 05:58:58.20554', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2586, 1, 'admin', 'Ivysaur', 'Ivysaur es el pokemon numero #2', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/002.png', 'fire,flying,ice,psychic', 1, '2018-11-16 05:58:58.207023', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2587, 1, 'admin', 'Charizard', 'Charizard es el pokemon numero #6', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/006.png', 'rock,electric,water', 1, '2018-11-16 05:58:58.218169', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2588, 1, 'admin', 'Charmeleon', 'Charmeleon es el pokemon numero #5', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/005.png', 'ground,rock,water', 1, '2018-11-16 05:58:58.220323', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2589, 1, 'admin', 'Wartortle', 'Wartortle es el pokemon numero #8', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/008.png', 'electric,grass', 1, '2018-11-16 05:58:58.225949', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2590, 1, 'admin', 'Bulbasaur', 'Bulbasaur es el pokemon numero #1', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/001.png', 'fire,flying,ice,psychic', 1, '2018-11-16 05:58:58.252687', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2591, 1, 'admin', 'Blastoise', 'Blastoise es el pokemon numero #9', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/009.png', 'electric,grass', 1, '2018-11-16 05:58:58.254838', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2592, 1, 'admin', 'Venusaur', 'Venusaur es el pokemon numero #3', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/003.png', 'fire,flying,ice,psychic', 1, '2018-11-16 05:58:58.259438', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2593, 1, 'admin', 'Charmander', 'Charmander es el pokemon numero #4', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/004.png', 'ground,rock,water', 1, '2018-11-16 05:58:58.261949', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2594, 1, 'admin', 'Caterpie', 'Caterpie es el pokemon numero #10', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/010.png', 'fire,flying,rock', 1, '2018-11-16 05:58:58.261463', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2595, 1, 'admin', 'Metapod', 'Metapod es el pokemon numero #11', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/011.png', 'fire,flying,rock', 1, '2018-11-16 05:58:58.319933', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2596, 1, 'admin', 'Butterfree', 'Butterfree es el pokemon numero #12', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/012.png', 'rock,electric,fire,flying,ice', 1, '2018-11-16 05:58:58.324873', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2597, 1, 'admin', 'Weedle', 'Weedle es el pokemon numero #13', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/013.png', 'fire,flying,psychic,rock', 1, '2018-11-16 05:58:58.337644', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2598, 1, 'admin', 'Beedrill', 'Beedrill es el pokemon numero #15', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/015.png', 'fire,flying,psychic,rock', 1, '2018-11-16 05:58:58.348104', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2599, 1, 'admin', 'Kakuna', 'Kakuna es el pokemon numero #14', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/014.png', 'fire,flying,psychic,rock', 1, '2018-11-16 05:58:58.350144', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2600, 1, 'admin', 'Pidgey', 'Pidgey es el pokemon numero #16', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/016.png', 'electric,ice,rock', 1, '2018-11-16 05:58:58.383302', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2601, 1, 'admin', 'Pidgeot', 'Pidgeot es el pokemon numero #18', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/018.png', 'electric,ice,rock', 1, '2018-11-16 05:58:58.386539', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2602, 1, 'admin', 'Pidgeotto', 'Pidgeotto es el pokemon numero #17', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/017.png', 'electric,ice,rock', 1, '2018-11-16 05:58:58.392595', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2603, 1, 'admin', 'Raticate', 'Raticate es el pokemon numero #20', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/020.png', 'fighting', 1, '2018-11-16 05:58:58.422183', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2604, 1, 'admin', 'Rattata', 'Rattata es el pokemon numero #19', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/019.png', 'fighting', 1, '2018-11-16 05:58:58.423787', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2605, 1, 'admin', 'Spearow', 'Spearow es el pokemon numero #21', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/021.png', 'electric,ice,rock', 1, '2018-11-16 05:58:58.425726', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2606, 1, 'admin', 'Fearow', 'Fearow es el pokemon numero #22', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/022.png', 'electric,ice,rock', 1, '2018-11-16 05:58:58.451019', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2607, 1, 'admin', 'Ekans', 'Ekans es el pokemon numero #23', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/023.png', 'ground,psychic', 1, '2018-11-16 05:58:58.459031', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2608, 1, 'admin', 'Arbok', 'Arbok es el pokemon numero #24', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/024.png', 'ground,psychic', 1, '2018-11-16 05:58:58.47008', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2609, 1, 'admin', 'Pikachu', 'Pikachu es el pokemon numero #25', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/025.png', 'ground', 1, '2018-11-16 05:58:58.47385', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2610, 1, 'admin', 'Raichu', 'Raichu es el pokemon numero #26', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/026.png', 'ground', 1, '2018-11-16 05:58:58.498134', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2611, 1, 'admin', 'Sandshrew', 'Sandshrew es el pokemon numero #27', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/027.png', 'grass,ice,water', 1, '2018-11-16 05:58:58.506224', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2612, 1, 'admin', 'Sandslash', 'Sandslash es el pokemon numero #28', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/028.png', 'grass,ice,water', 1, '2018-11-16 05:58:58.515336', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2613, 1, 'admin', 'Nidoran♀', 'Nidoran♀ es el pokemon numero #29', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/029.png', 'ground,psychic', 1, '2018-11-16 05:58:58.537283', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2614, 1, 'admin', 'Nidorina', 'Nidorina es el pokemon numero #30', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/030.png', 'ground,psychic', 1, '2018-11-16 05:58:58.546837', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2615, 1, 'admin', 'Nidoqueen', 'Nidoqueen es el pokemon numero #31', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/031.png', 'ground,ice,psychic,water', 1, '2018-11-16 05:58:58.548402', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2616, 1, 'admin', 'Nidoran♂', 'Nidoran♂ es el pokemon numero #32', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/032.png', 'ground,psychic', 1, '2018-11-16 05:58:58.566477', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2617, 1, 'admin', 'Nidorino', 'Nidorino es el pokemon numero #33', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/033.png', 'ground,psychic', 1, '2018-11-16 05:58:58.584565', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2618, 1, 'admin', 'Nidoking', 'Nidoking es el pokemon numero #34', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/034.png', 'ground,ice,psychic,water', 1, '2018-11-16 05:58:58.678252', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2619, 1, 'admin', 'Jigglypuff', 'Jigglypuff es el pokemon numero #39', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/039.png', 'steel,poison', 1, '2018-11-16 05:58:58.690871', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2620, 1, 'admin', 'Clefairy', 'Clefairy es el pokemon numero #35', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/035.png', 'steel,poison', 1, '2018-11-16 05:58:58.691765', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2621, 1, 'admin', 'Clefable', 'Clefable es el pokemon numero #36', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/036.png', 'steel,poison', 1, '2018-11-16 05:58:58.695607', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2622, 1, 'admin', 'Vulpix', 'Vulpix es el pokemon numero #37', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/037.png', 'ground,rock,water', 1, '2018-11-16 05:58:58.696392', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2623, 1, 'admin', 'Wigglytuff', 'Wigglytuff es el pokemon numero #40', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/040.png', 'steel,poison', 1, '2018-11-16 05:58:58.701188', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2624, 1, 'admin', 'Ninetales', 'Ninetales es el pokemon numero #38', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/038.png', 'ground,rock,water', 1, '2018-11-16 05:58:58.704893', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2625, 1, 'admin', 'Golbat', 'Golbat es el pokemon numero #42', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/042.png', 'electric,ice,psychic,rock', 1, '2018-11-16 05:58:58.707008', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2626, 1, 'admin', 'Zubat', 'Zubat es el pokemon numero #41', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/041.png', 'electric,ice,psychic,rock', 1, '2018-11-16 05:58:58.718171', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2628, 1, 'admin', 'Gloom', 'Gloom es el pokemon numero #44', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/044.png', 'fire,flying,ice,psychic', 1, '2018-11-16 05:58:58.792065', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2627, 1, 'admin', 'Oddish', 'Oddish es el pokemon numero #43', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/043.png', 'fire,flying,ice,psychic', 1, '2018-11-16 05:58:58.730434', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2637, 1, 'admin', 'Persian', 'Persian es el pokemon numero #53', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/053.png', 'fighting', 1, '2018-11-16 05:58:58.862376', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2647, 1, 'admin', 'Abra', 'Abra es el pokemon numero #63', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/063.png', 'bug,dark,ghost', 1, '2018-11-16 05:58:58.973004', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2655, 1, 'admin', 'Tentacruel', 'Tentacruel es el pokemon numero #73', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/073.png', 'electric,ground,psychic', 1, '2018-11-16 05:58:59.083714', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2665, 1, 'admin', 'Magneton', 'Magneton es el pokemon numero #82', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/082.png', 'ground,fire,fighting', 1, '2018-11-16 05:58:59.208689', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2673, 1, 'admin', 'Shellder', 'Shellder es el pokemon numero #90', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/090.png', 'electric,grass', 1, '2018-11-16 05:58:59.323532', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2681, 1, 'admin', 'Kingler', 'Kingler es el pokemon numero #99', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/099.png', 'electric,grass', 1, '2018-11-16 05:58:59.434827', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2691, 1, 'admin', 'Hitmonchan', 'Hitmonchan es el pokemon numero #107', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/107.png', 'flying,psychic,fairy', 1, '2018-11-16 05:58:59.550512', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2700, 1, 'admin', 'Horsea', 'Horsea es el pokemon numero #116', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/116.png', 'electric,grass', 1, '2018-11-16 05:58:59.662633', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2710, 1, 'admin', 'Magmar', 'Magmar es el pokemon numero #126', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/126.png', 'ground,rock,water', 1, '2018-11-16 05:58:59.772762', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2719, 1, 'admin', 'Jolteon', 'Jolteon es el pokemon numero #135', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/135.png', 'ground', 1, '2018-11-16 05:58:59.889755', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2729, 1, 'admin', 'Zapdos', 'Zapdos es el pokemon numero #145', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/145.png', 'ice,rock', 1, '2018-11-16 05:59:00.004282', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2739, 1, 'admin', 'Cyndaquil', 'Cyndaquil es el pokemon numero #155', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/155.png', 'ground,rock,water', 1, '2018-11-16 05:59:00.125936', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2749, 1, 'admin', 'Ledyba', 'Ledyba es el pokemon numero #165', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/165.png', 'rock,electric,fire,flying,ice', 1, '2018-11-16 05:59:00.240472', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2760, 1, 'admin', 'Togepi', 'Togepi es el pokemon numero #175', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/175.png', 'steel,poison', 1, '2018-11-16 05:59:00.360535', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2769, 1, 'admin', 'Sudowoodo', 'Sudowoodo es el pokemon numero #185', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/185.png', 'fighting,grass,ground,steel,water', 1, '2018-11-16 05:59:00.472515', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2778, 1, 'admin', 'Wooper', 'Wooper es el pokemon numero #194', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/194.png', 'grass', 1, '2018-11-16 05:59:00.594567', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2788, 1, 'admin', 'Pineco', 'Pineco es el pokemon numero #204', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/204.png', 'fire,flying,rock', 1, '2018-11-16 05:59:00.697023', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2796, 1, 'admin', 'Shuckle', 'Shuckle es el pokemon numero #213', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/213.png', 'rock,steel,water', 1, '2018-11-16 05:59:00.812218', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2807, 1, 'admin', 'Piloswine', 'Piloswine es el pokemon numero #221', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/221.png', 'fighting,fire,grass,steel,water', 1, '2018-11-16 05:59:00.976463', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2815, 1, 'admin', 'Phanpy', 'Phanpy es el pokemon numero #231', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/231.png', 'grass,ice,water', 1, '2018-11-16 05:59:01.086568', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2825, 1, 'admin', 'Miltank', 'Miltank es el pokemon numero #241', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/241.png', 'fighting', 1, '2018-11-16 05:59:01.20316', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2834, 1, 'admin', 'Ho-Oh', 'Ho-Oh es el pokemon numero #250', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/250.png', 'rock,electric,water', 1, '2018-11-16 05:59:01.336616', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2843, 1, 'admin', 'Marshtomp', 'Marshtomp es el pokemon numero #259', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/259.png', 'grass', 1, '2018-11-16 05:59:01.449814', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2852, 1, 'admin', 'Cascoon', 'Cascoon es el pokemon numero #268', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/268.png', 'fire,flying,rock', 1, '2018-11-16 05:59:01.566465', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2862, 1, 'admin', 'Wingull', 'Wingull es el pokemon numero #278', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/278.png', 'electric,rock', 1, '2018-11-16 05:59:01.67734', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2872, 1, 'admin', 'Vigoroth', 'Vigoroth es el pokemon numero #288', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/288.png', 'fighting', 1, '2018-11-16 05:59:01.799237', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2882, 1, 'admin', 'Azurill', 'Azurill es el pokemon numero #298', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/298.png', 'steel,poison', 1, '2018-11-16 05:59:01.912504', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2892, 1, 'admin', 'Medicham', 'Medicham es el pokemon numero #308', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/308.png', 'flying,ghost,fairy', 1, '2018-11-16 05:59:02.027354', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2902, 1, 'admin', 'Carvanha', 'Carvanha es el pokemon numero #318', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/318.png', 'bug,electric,fighting,grass,fairy', 1, '2018-11-16 05:59:02.139534', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2912, 1, 'admin', 'Trapinch', 'Trapinch es el pokemon numero #328', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/328.png', 'grass,ice,water', 1, '2018-11-16 05:59:02.254968', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2922, 1, 'admin', 'Solrock', 'Solrock es el pokemon numero #338', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/338.png', 'bug,dark,ghost,grass,steel,water', 1, '2018-11-16 05:59:02.370426', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2930, 1, 'admin', 'Anorith', 'Anorith es el pokemon numero #347', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/347.png', 'rock,steel,water', 1, '2018-11-16 05:59:02.482775', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2940, 1, 'admin', 'Shaymin', 'Shaymin es el pokemon numero #492', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/492.png', 'bug,fire,flying,ice,poison', 1, '2018-11-16 05:59:02.593142', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2951, 1, 'admin', 'Samurott', 'Samurott es el pokemon numero #503', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/503.png', 'grass,electric', 1, '2018-11-16 05:59:02.708782', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2962, 1, 'admin', 'Simisear', 'Simisear es el pokemon numero #514', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/514.png', 'water,ground,rock', 1, '2018-11-16 05:59:02.839262', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2971, 1, 'admin', 'Roggenrola', 'Roggenrola es el pokemon numero #524', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/524.png', 'water,grass,fighting,ground,steel', 1, '2018-11-16 05:59:02.949629', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2981, 1, 'admin', 'Gurdurr', 'Gurdurr es el pokemon numero #533', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/533.png', 'flying,psychic,fairy', 1, '2018-11-16 05:59:03.057423', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2991, 1, 'admin', 'Venipede', 'Venipede es el pokemon numero #543', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/543.png', 'fire,flying,psychic,rock', 1, '2018-11-16 05:59:03.168699', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3001, 1, 'admin', 'Krookodile', 'Krookodile es el pokemon numero #553', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/553.png', 'water,grass,ice,fighting,bug,fairy', 1, '2018-11-16 05:59:03.277656', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3011, 1, 'admin', 'Cofagrigus', 'Cofagrigus es el pokemon numero #563', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/563.png', 'ghost,dark', 1, '2018-11-16 05:59:03.390018', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3021, 1, 'admin', 'Cinccino', 'Cinccino es el pokemon numero #573', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/573.png', 'fighting', 1, '2018-11-16 05:59:03.499035', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2629, 1, 'admin', 'Vileplume', 'Vileplume es el pokemon numero #45', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/045.png', 'fire,flying,ice,psychic', 1, '2018-11-16 05:58:58.79696', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2639, 1, 'admin', 'Golduck', 'Golduck es el pokemon numero #55', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/055.png', 'electric,grass', 1, '2018-11-16 05:58:58.9054', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2649, 1, 'admin', 'Alakazam', 'Alakazam es el pokemon numero #65', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/065.png', 'bug,dark,ghost', 1, '2018-11-16 05:58:59.037566', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2658, 1, 'admin', 'Graveler', 'Graveler es el pokemon numero #75', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/075.png', 'grass,water,fighting,ground,ice,steel', 1, '2018-11-16 05:58:59.15331', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2668, 1, 'admin', 'Doduo', 'Doduo es el pokemon numero #84', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/084.png', 'electric,ice,rock', 1, '2018-11-16 05:58:59.281387', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2677, 1, 'admin', 'Haunter', 'Haunter es el pokemon numero #93', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/093.png', 'dark,ghost,psychic', 1, '2018-11-16 05:58:59.387251', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2685, 1, 'admin', 'Exeggcute', 'Exeggcute es el pokemon numero #102', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/102.png', 'bug,dark,fire,flying,ghost,ice,poison', 1, '2018-11-16 05:58:59.492089', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2696, 1, 'admin', 'Rhydon', 'Rhydon es el pokemon numero #112', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/112.png', 'grass,water,fighting,ground,ice,steel', 1, '2018-11-16 05:58:59.605711', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2706, 1, 'admin', 'Mr. Mime', 'Mr. Mime es el pokemon numero #122', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/122.png', 'ghost,steel,poison', 1, '2018-11-16 05:58:59.710679', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2715, 1, 'admin', 'Lapras', 'Lapras es el pokemon numero #131', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/131.png', 'electric,fighting,grass,rock', 1, '2018-11-16 05:58:59.821949', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2725, 1, 'admin', 'Kabutops', 'Kabutops es el pokemon numero #141', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/141.png', 'grass,electric,fighting,ground', 1, '2018-11-16 05:58:59.928407', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2733, 1, 'admin', 'Mew', 'Mew es el pokemon numero #151', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/151.png', 'bug,dark,ghost', 1, '2018-11-16 05:59:00.032696', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2742, 1, 'admin', 'Croconaw', 'Croconaw es el pokemon numero #159', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/159.png', 'electric,grass', 1, '2018-11-16 05:59:00.139656', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2752, 1, 'admin', 'Ariados', 'Ariados es el pokemon numero #168', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/168.png', 'fire,flying,psychic,rock', 1, '2018-11-16 05:59:00.247298', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2759, 1, 'admin', 'Natu', 'Natu es el pokemon numero #177', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/177.png', 'dark,electric,ghost,ice,rock', 1, '2018-11-16 05:59:00.359914', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2768, 1, 'admin', 'Azumarill', 'Azumarill es el pokemon numero #184', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/184.png', 'electric,grass,poison', 1, '2018-11-16 05:59:00.466309', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2777, 1, 'admin', 'Yanma', 'Yanma es el pokemon numero #193', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/193.png', 'rock,electric,fire,flying,ice', 1, '2018-11-16 05:59:00.585919', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2786, 1, 'admin', 'Girafarig', 'Girafarig es el pokemon numero #203', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/203.png', 'bug,dark', 1, '2018-11-16 05:59:00.689607', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2793, 1, 'admin', 'Qwilfish', 'Qwilfish es el pokemon numero #211', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/211.png', 'electric,ground,psychic', 1, '2018-11-16 05:59:00.807169', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2803, 1, 'admin', 'Magcargo', 'Magcargo es el pokemon numero #219', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/219.png', 'ground,water,fighting,rock', 1, '2018-11-16 05:59:00.925728', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2813, 1, 'admin', 'Houndoom', 'Houndoom es el pokemon numero #229', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/229.png', 'fighting,ground,rock,water', 1, '2018-11-16 05:59:01.032483', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2823, 1, 'admin', 'Elekid', 'Elekid es el pokemon numero #239', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/239.png', 'ground', 1, '2018-11-16 05:59:01.136448', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2832, 1, 'admin', 'Tyranitar', 'Tyranitar es el pokemon numero #248', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/248.png', 'fighting,bug,grass,ground,steel,water,fairy', 1, '2018-11-16 05:59:01.244827', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2839, 1, 'admin', 'Blaziken', 'Blaziken es el pokemon numero #257', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/257.png', 'flying,ground,psychic,water', 1, '2018-11-16 05:59:01.374237', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2847, 1, 'admin', 'Linoone', 'Linoone es el pokemon numero #264', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/264.png', 'fighting', 1, '2018-11-16 05:59:01.493743', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2857, 1, 'admin', 'Seedot', 'Seedot es el pokemon numero #273', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/273.png', 'bug,fire,flying,ice,poison', 1, '2018-11-16 05:59:01.606419', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2867, 1, 'admin', 'Surskit', 'Surskit es el pokemon numero #283', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/283.png', 'electric,flying,rock', 1, '2018-11-16 05:59:01.712893', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2876, 1, 'admin', 'Whismur', 'Whismur es el pokemon numero #293', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/293.png', 'fighting', 1, '2018-11-16 05:59:01.853372', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2886, 1, 'admin', 'Mawile', 'Mawile es el pokemon numero #303', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/303.png', 'fire,ground', 1, '2018-11-16 05:59:01.9577', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2897, 1, 'admin', 'Volbeat', 'Volbeat es el pokemon numero #313', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/313.png', 'fire,flying,rock', 1, '2018-11-16 05:59:02.064567', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2906, 1, 'admin', 'Camerupt', 'Camerupt es el pokemon numero #323', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/323.png', 'water,ground', 1, '2018-11-16 05:59:02.166198', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2916, 1, 'admin', 'Cacturne', 'Cacturne es el pokemon numero #332', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/332.png', 'bug,fire,fighting,flying,ice,poison,fairy', 1, '2018-11-16 05:59:02.277522', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2924, 1, 'admin', 'Crawdaunt', 'Crawdaunt es el pokemon numero #342', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/342.png', 'bug,electric,fighting,grass,fairy', 1, '2018-11-16 05:59:02.38275', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2932, 1, 'admin', 'Milotic', 'Milotic es el pokemon numero #350', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/350.png', 'electric,grass', 1, '2018-11-16 05:59:02.489783', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2942, 1, 'admin', 'Victini', 'Victini es el pokemon numero #494', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/494.png', 'water,ground,rock,ghost,dark', 1, '2018-11-16 05:59:02.59724', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2950, 1, 'admin', 'Patrat', 'Patrat es el pokemon numero #504', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/504.png', 'fighting', 1, '2018-11-16 05:59:02.706822', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2959, 1, 'admin', 'Simisage', 'Simisage es el pokemon numero #512', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/512.png', 'fire,ice,poison,flying,bug', 1, '2018-11-16 05:59:02.812689', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2969, 1, 'admin', 'Blitzle', 'Blitzle es el pokemon numero #522', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/522.png', 'ground', 1, '2018-11-16 05:59:02.927032', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2980, 1, 'admin', 'Timburr', 'Timburr es el pokemon numero #532', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/532.png', 'flying,psychic,fairy', 1, '2018-11-16 05:59:03.035444', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2988, 1, 'admin', 'Swadloon', 'Swadloon es el pokemon numero #541', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/541.png', 'fire,flying,ice,poison,bug,rock', 1, '2018-11-16 05:59:03.141032', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2998, 1, 'admin', 'Basculin', 'Basculin es el pokemon numero #550', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/550.png', 'grass,electric', 1, '2018-11-16 05:59:03.246968', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2630, 1, 'admin', 'Paras', 'Paras es el pokemon numero #46', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/046.png', 'fire,flying,bug,ice,poison,rock', 1, '2018-11-16 05:58:58.80744', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2640, 1, 'admin', 'Mankey', 'Mankey es el pokemon numero #56', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/056.png', 'flying,psychic,fairy', 1, '2018-11-16 05:58:58.919045', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2651, 1, 'admin', 'Machop', 'Machop es el pokemon numero #66', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/066.png', 'flying,psychic,fairy', 1, '2018-11-16 05:58:59.05021', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2661, 1, 'admin', 'Ponyta', 'Ponyta es el pokemon numero #77', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/077.png', 'ground,rock,water', 1, '2018-11-16 05:58:59.167604', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2669, 1, 'admin', 'Seel', 'Seel es el pokemon numero #86', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/086.png', 'electric,grass', 1, '2018-11-16 05:58:59.295845', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2679, 1, 'admin', 'Onix', 'Onix es el pokemon numero #95', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/095.png', 'grass,water,fighting,ground,ice,steel', 1, '2018-11-16 05:58:59.407687', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2687, 1, 'admin', 'Cubone', 'Cubone es el pokemon numero #104', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/104.png', 'grass,ice,water', 1, '2018-11-16 05:58:59.518812', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2698, 1, 'admin', 'Tangela', 'Tangela es el pokemon numero #114', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/114.png', 'bug,fire,flying,ice,poison', 1, '2018-11-16 05:58:59.639249', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2708, 1, 'admin', 'Jynx', 'Jynx es el pokemon numero #124', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/124.png', 'bug,dark,fire,ghost,rock,steel', 1, '2018-11-16 05:58:59.753208', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2717, 1, 'admin', 'Vaporeon', 'Vaporeon es el pokemon numero #134', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/134.png', 'electric,grass', 1, '2018-11-16 05:58:59.864906', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2727, 1, 'admin', 'Articuno', 'Articuno es el pokemon numero #144', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/144.png', 'rock,electric,fire,steel', 1, '2018-11-16 05:58:59.994136', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2738, 1, 'admin', 'Meganium', 'Meganium es el pokemon numero #154', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/154.png', 'bug,fire,flying,ice,poison', 1, '2018-11-16 05:59:00.122092', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2747, 1, 'admin', 'Noctowl', 'Noctowl es el pokemon numero #164', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/164.png', 'electric,ice,rock', 1, '2018-11-16 05:59:00.230741', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2757, 1, 'admin', 'Cleffa', 'Cleffa es el pokemon numero #173', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/173.png', 'steel,poison', 1, '2018-11-16 05:59:00.341028', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2766, 1, 'admin', 'Bellossom', 'Bellossom es el pokemon numero #182', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/182.png', 'bug,fire,flying,ice,poison', 1, '2018-11-16 05:59:00.454603', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2775, 1, 'admin', 'Sunkern', 'Sunkern es el pokemon numero #191', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/191.png', 'bug,fire,flying,ice,poison', 1, '2018-11-16 05:59:00.568867', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2785, 1, 'admin', 'Unown', 'Unown es el pokemon numero #201', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/201.png', 'bug,dark,ghost', 1, '2018-11-16 05:59:00.687565', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2794, 1, 'admin', 'Scizor', 'Scizor es el pokemon numero #212', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/212.png', 'fire', 1, '2018-11-16 05:59:00.810056', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2804, 1, 'admin', 'Swinub', 'Swinub es el pokemon numero #220', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/220.png', 'fighting,fire,grass,steel,water', 1, '2018-11-16 05:59:00.931325', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2814, 1, 'admin', 'Kingdra', 'Kingdra es el pokemon numero #230', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/230.png', 'dragon,fairy', 1, '2018-11-16 05:59:01.045217', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2824, 1, 'admin', 'Magby', 'Magby es el pokemon numero #240', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/240.png', 'ground,rock,water', 1, '2018-11-16 05:59:01.1601', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2855, 1, 'admin', 'Lombre', 'Lombre es el pokemon numero #271', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/271.png', 'bug,flying,poison', 1, '2018-11-16 05:59:01.589192', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2864, 1, 'admin', 'Kirlia', 'Kirlia es el pokemon numero #281', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/281.png', 'ghost,steel,poison', 1, '2018-11-16 05:59:01.69886', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2874, 1, 'admin', 'Nincada', 'Nincada es el pokemon numero #290', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/290.png', 'fire,flying,ice,water', 1, '2018-11-16 05:59:01.817996', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2884, 1, 'admin', 'Skitty', 'Skitty es el pokemon numero #300', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/300.png', 'fighting', 1, '2018-11-16 05:59:01.932998', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2894, 1, 'admin', 'Manectric', 'Manectric es el pokemon numero #310', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/310.png', 'ground', 1, '2018-11-16 05:59:02.044377', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2904, 1, 'admin', 'Wailmer', 'Wailmer es el pokemon numero #320', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/320.png', 'electric,grass', 1, '2018-11-16 05:59:02.160065', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2913, 1, 'admin', 'Flygon', 'Flygon es el pokemon numero #330', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/330.png', 'ice,dragon,fairy', 1, '2018-11-16 05:59:02.269394', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2923, 1, 'admin', 'Barboach', 'Barboach es el pokemon numero #339', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/339.png', 'grass', 1, '2018-11-16 05:59:02.380198', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2935, 1, 'admin', 'Castform', 'Castform es el pokemon numero #351', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/351.png', 'fighting', 1, '2018-11-16 05:59:02.505108', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2945, 1, 'admin', 'Serperior', 'Serperior es el pokemon numero #497', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/497.png', 'fire,ice,poison,flying,bug', 1, '2018-11-16 05:59:02.617815', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2955, 1, 'admin', 'Herdier', 'Herdier es el pokemon numero #507', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/507.png', 'fighting', 1, '2018-11-16 05:59:02.734806', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2963, 1, 'admin', 'Simipour', 'Simipour es el pokemon numero #516', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/516.png', 'grass,electric', 1, '2018-11-16 05:59:02.854259', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2973, 1, 'admin', 'Boldore', 'Boldore es el pokemon numero #525', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/525.png', 'water,grass,fighting,ground,steel', 1, '2018-11-16 05:59:02.988378', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2983, 1, 'admin', 'Tympole', 'Tympole es el pokemon numero #535', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/535.png', 'grass,electric', 1, '2018-11-16 05:59:03.101826', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2993, 1, 'admin', 'Scolipede', 'Scolipede es el pokemon numero #545', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/545.png', 'fire,flying,psychic,rock', 1, '2018-11-16 05:59:03.216022', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3002, 1, 'admin', 'Darmanitan', 'Darmanitan es el pokemon numero #555', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/555.png', 'water,ground,rock', 1, '2018-11-16 05:59:03.329493', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3012, 1, 'admin', 'Carracosta', 'Carracosta es el pokemon numero #565', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/565.png', 'grass,electric,fighting,ground', 1, '2018-11-16 05:59:03.439886', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3022, 1, 'admin', 'Gothita', 'Gothita es el pokemon numero #574', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/574.png', 'bug,ghost,dark', 1, '2018-11-16 05:59:03.550041', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3032, 1, 'admin', 'Vanilluxe', 'Vanilluxe es el pokemon numero #584', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/584.png', 'fire,fighting,rock,steel', 1, '2018-11-16 05:59:03.66194', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3041, 1, 'admin', 'Jellicent', 'Jellicent es el pokemon numero #593', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/593.png', 'grass,electric,ghost,dark', 1, '2018-11-16 05:59:03.776271', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3050, 1, 'admin', 'Tynamo', 'Tynamo es el pokemon numero #602', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/602.png', '', 1, '2018-11-16 05:59:03.889538', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2631, 1, 'admin', 'Parasect', 'Parasect es el pokemon numero #47', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/047.png', 'fire,flying,bug,ice,poison,rock', 1, '2018-11-16 05:58:58.809645', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2642, 1, 'admin', 'Primeape', 'Primeape es el pokemon numero #57', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/057.png', 'flying,psychic,fairy', 1, '2018-11-16 05:58:58.9261', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2652, 1, 'admin', 'Machamp', 'Machamp es el pokemon numero #68', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/068.png', 'flying,psychic,fairy', 1, '2018-11-16 05:58:59.057658', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2662, 1, 'admin', 'Rapidash', 'Rapidash es el pokemon numero #78', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/078.png', 'ground,rock,water', 1, '2018-11-16 05:58:59.169465', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2670, 1, 'admin', 'Dewgong', 'Dewgong es el pokemon numero #87', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/087.png', 'electric,fighting,grass,rock', 1, '2018-11-16 05:58:59.297705', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2680, 1, 'admin', 'Drowzee', 'Drowzee es el pokemon numero #96', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/096.png', 'bug,dark,ghost', 1, '2018-11-16 05:58:59.414017', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2689, 1, 'admin', 'Marowak', 'Marowak es el pokemon numero #105', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/105.png', 'grass,ice,water', 1, '2018-11-16 05:58:59.526607', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2699, 1, 'admin', 'Kangaskhan', 'Kangaskhan es el pokemon numero #115', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/115.png', 'fighting', 1, '2018-11-16 05:58:59.655206', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2709, 1, 'admin', 'Electabuzz', 'Electabuzz es el pokemon numero #125', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/125.png', 'ground', 1, '2018-11-16 05:58:59.771887', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2720, 1, 'admin', 'Flareon', 'Flareon es el pokemon numero #136', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/136.png', 'ground,rock,water', 1, '2018-11-16 05:58:59.892466', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2730, 1, 'admin', 'Moltres', 'Moltres es el pokemon numero #146', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/146.png', 'rock,electric,water', 1, '2018-11-16 05:59:00.007023', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2740, 1, 'admin', 'Quilava', 'Quilava es el pokemon numero #156', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/156.png', 'ground,rock,water', 1, '2018-11-16 05:59:00.130076', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2750, 1, 'admin', 'Ledian', 'Ledian es el pokemon numero #166', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/166.png', 'rock,electric,fire,flying,ice', 1, '2018-11-16 05:59:00.243222', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2783, 1, 'admin', 'Slowking', 'Slowking es el pokemon numero #199', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/199.png', 'bug,dark,electric,ghost,grass', 1, '2018-11-16 05:59:00.676773', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2795, 1, 'admin', 'Snubbull', 'Snubbull es el pokemon numero #209', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/209.png', 'steel,poison', 1, '2018-11-16 05:59:00.811121', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2805, 1, 'admin', 'Corsola', 'Corsola es el pokemon numero #222', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/222.png', 'grass,electric,fighting,ground', 1, '2018-11-16 05:59:00.97562', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2816, 1, 'admin', 'Donphan', 'Donphan es el pokemon numero #232', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/232.png', 'grass,ice,water', 1, '2018-11-16 05:59:01.092966', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2826, 1, 'admin', 'Blissey', 'Blissey es el pokemon numero #242', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/242.png', 'fighting', 1, '2018-11-16 05:59:01.207694', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2835, 1, 'admin', 'Celebi', 'Celebi es el pokemon numero #251', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/251.png', 'bug,dark,fire,flying,ghost,ice,poison', 1, '2018-11-16 05:59:01.339365', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2844, 1, 'admin', 'Swampert', 'Swampert es el pokemon numero #260', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/260.png', 'grass', 1, '2018-11-16 05:59:01.452453', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2853, 1, 'admin', 'Dustox', 'Dustox es el pokemon numero #269', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/269.png', 'fire,flying,psychic,rock', 1, '2018-11-16 05:59:01.575918', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2863, 1, 'admin', 'Pelipper', 'Pelipper es el pokemon numero #279', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/279.png', 'electric,rock', 1, '2018-11-16 05:59:01.691974', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2873, 1, 'admin', 'Slaking', 'Slaking es el pokemon numero #289', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/289.png', 'fighting', 1, '2018-11-16 05:59:01.806226', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2883, 1, 'admin', 'Nosepass', 'Nosepass es el pokemon numero #299', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/299.png', 'fighting,grass,ground,steel,water', 1, '2018-11-16 05:59:01.921085', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2893, 1, 'admin', 'Electrike', 'Electrike es el pokemon numero #309', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/309.png', 'ground', 1, '2018-11-16 05:59:02.035285', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2903, 1, 'admin', 'Sharpedo', 'Sharpedo es el pokemon numero #319', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/319.png', 'bug,electric,fighting,grass,fairy', 1, '2018-11-16 05:59:02.154849', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2914, 1, 'admin', 'Vibrava', 'Vibrava es el pokemon numero #329', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/329.png', 'ice,dragon,fairy', 1, '2018-11-16 05:59:02.27121', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2926, 1, 'admin', 'Whiscash', 'Whiscash es el pokemon numero #340', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/340.png', 'grass', 1, '2018-11-16 05:59:02.387565', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2936, 1, 'admin', 'Kecleon', 'Kecleon es el pokemon numero #352', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/352.png', 'fighting', 1, '2018-11-16 05:59:02.513994', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2946, 1, 'admin', 'Tepig', 'Tepig es el pokemon numero #498', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/498.png', 'water,ground,rock', 1, '2018-11-16 05:59:02.64228', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2956, 1, 'admin', 'Stoutland', 'Stoutland es el pokemon numero #508', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/508.png', 'fighting', 1, '2018-11-16 05:59:02.77529', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2966, 1, 'admin', 'Musharna', 'Musharna es el pokemon numero #518', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/518.png', 'bug,ghost,dark', 1, '2018-11-16 05:59:02.898529', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2976, 1, 'admin', 'Swoobat', 'Swoobat es el pokemon numero #528', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/528.png', 'electric,ice,rock,ghost,dark', 1, '2018-11-16 05:59:03.013144', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2986, 1, 'admin', 'Throh', 'Throh es el pokemon numero #538', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/538.png', 'flying,psychic,fairy', 1, '2018-11-16 05:59:03.12803', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2997, 1, 'admin', 'Petilil', 'Petilil es el pokemon numero #548', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/548.png', 'fire,ice,poison,flying,bug', 1, '2018-11-16 05:59:03.246512', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3007, 1, 'admin', 'Scrafty', 'Scrafty es el pokemon numero #560', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/560.png', 'fighting,flying,fairy', 1, '2018-11-16 05:59:03.360329', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3016, 1, 'admin', 'Zorua', 'Zorua es el pokemon numero #570', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/570.png', 'fighting,bug,fairy', 1, '2018-11-16 05:59:03.472294', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3027, 1, 'admin', 'Reuniclus', 'Reuniclus es el pokemon numero #579', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/579.png', 'bug,ghost,dark', 1, '2018-11-16 05:59:03.592126', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3062, 1, 'admin', 'Beartic', 'Beartic es el pokemon numero #614', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/614.png', 'fire,fighting,rock,steel', 1, '2018-11-16 05:59:04.025265', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3072, 1, 'admin', 'Durant', 'Durant es el pokemon numero #632', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/632.png', 'fire', 1, '2018-11-16 05:59:04.138146', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3081, 1, 'admin', 'Zweilous', 'Zweilous es el pokemon numero #634', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/634.png', 'ice,fighting,bug,dragon,fairy', 1, '2018-11-16 05:59:04.251808', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3090, 1, 'admin', 'Reshiram', 'Reshiram es el pokemon numero #643', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/643.png', 'ground,rock,dragon', 1, '2018-11-16 05:59:04.364763', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2632, 1, 'admin', 'Venonat', 'Venonat es el pokemon numero #48', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/048.png', 'fire,flying,psychic,rock', 1, '2018-11-16 05:58:58.81612', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2643, 1, 'admin', 'Arcanine', 'Arcanine es el pokemon numero #59', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/059.png', 'ground,rock,water', 1, '2018-11-16 05:58:58.93629', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2653, 1, 'admin', 'Bellsprout', 'Bellsprout es el pokemon numero #69', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/069.png', 'fire,flying,ice,psychic', 1, '2018-11-16 05:58:59.076093', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2663, 1, 'admin', 'Slowpoke', 'Slowpoke es el pokemon numero #79', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/079.png', 'bug,dark,electric,ghost,grass', 1, '2018-11-16 05:58:59.198144', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2672, 1, 'admin', 'Grimer', 'Grimer es el pokemon numero #88', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/088.png', 'ground,psychic', 1, '2018-11-16 05:58:59.315868', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2682, 1, 'admin', 'Hypno', 'Hypno es el pokemon numero #97', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/097.png', 'bug,dark,ghost', 1, '2018-11-16 05:58:59.43775', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2692, 1, 'admin', 'Lickitung', 'Lickitung es el pokemon numero #108', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/108.png', 'fighting', 1, '2018-11-16 05:58:59.553092', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2701, 1, 'admin', 'Goldeen', 'Goldeen es el pokemon numero #118', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/118.png', 'electric,grass', 1, '2018-11-16 05:58:59.665969', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2711, 1, 'admin', 'Pinsir', 'Pinsir es el pokemon numero #127', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/127.png', 'fire,flying,rock', 1, '2018-11-16 05:58:59.782227', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2721, 1, 'admin', 'Porygon', 'Porygon es el pokemon numero #137', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/137.png', 'fighting', 1, '2018-11-16 05:58:59.897738', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2731, 1, 'admin', 'Dratini', 'Dratini es el pokemon numero #147', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/147.png', 'dragon,ice,fairy', 1, '2018-11-16 05:59:00.013156', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2743, 1, 'admin', 'Typhlosion', 'Typhlosion es el pokemon numero #157', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/157.png', 'ground,rock,water', 1, '2018-11-16 05:59:00.144127', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2753, 1, 'admin', 'Crobat', 'Crobat es el pokemon numero #169', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/169.png', 'electric,ice,psychic,rock', 1, '2018-11-16 05:59:00.262234', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2762, 1, 'admin', 'Xatu', 'Xatu es el pokemon numero #178', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/178.png', 'dark,electric,ghost,ice,rock', 1, '2018-11-16 05:59:00.387932', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2771, 1, 'admin', 'Hoppip', 'Hoppip es el pokemon numero #187', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/187.png', 'ice,fire,flying,poison,rock', 1, '2018-11-16 05:59:00.503527', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2779, 1, 'admin', 'Espeon', 'Espeon es el pokemon numero #196', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/196.png', 'bug,dark,ghost', 1, '2018-11-16 05:59:00.620175', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2789, 1, 'admin', 'Forretress', 'Forretress es el pokemon numero #205', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/205.png', 'fire', 1, '2018-11-16 05:59:00.735696', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2799, 1, 'admin', 'Sneasel', 'Sneasel es el pokemon numero #215', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/215.png', 'fighting,bug,fire,rock,steel,fairy', 1, '2018-11-16 05:59:00.850556', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2806, 1, 'admin', 'Delibird', 'Delibird es el pokemon numero #225', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/225.png', 'rock,electric,fire,steel', 1, '2018-11-16 05:59:00.976132', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2817, 1, 'admin', 'Porygon2', 'Porygon2 es el pokemon numero #233', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/233.png', 'fighting', 1, '2018-11-16 05:59:01.093466', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2827, 1, 'admin', 'Raikou', 'Raikou es el pokemon numero #243', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/243.png', 'ground', 1, '2018-11-16 05:59:01.208103', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2836, 1, 'admin', 'Treecko', 'Treecko es el pokemon numero #252', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/252.png', 'bug,fire,flying,ice,poison', 1, '2018-11-16 05:59:01.346477', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2845, 1, 'admin', 'Poochyena', 'Poochyena es el pokemon numero #261', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/261.png', 'fighting,bug,fairy', 1, '2018-11-16 05:59:01.462474', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2854, 1, 'admin', 'Lotad', 'Lotad es el pokemon numero #270', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/270.png', 'bug,flying,poison', 1, '2018-11-16 05:59:01.576429', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2865, 1, 'admin', 'Ralts', 'Ralts es el pokemon numero #280', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/280.png', 'ghost,steel,poison', 1, '2018-11-16 05:59:01.700878', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2875, 1, 'admin', 'Ninjask', 'Ninjask es el pokemon numero #291', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/291.png', 'rock,electric,fire,flying,ice', 1, '2018-11-16 05:59:01.822563', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2885, 1, 'admin', 'Delcatty', 'Delcatty es el pokemon numero #301', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/301.png', 'fighting', 1, '2018-11-16 05:59:01.937946', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2895, 1, 'admin', 'Plusle', 'Plusle es el pokemon numero #311', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/311.png', 'ground', 1, '2018-11-16 05:59:02.052525', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2905, 1, 'admin', 'Wailord', 'Wailord es el pokemon numero #321', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/321.png', 'electric,grass', 1, '2018-11-16 05:59:02.162137', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2917, 1, 'admin', 'Swablu', 'Swablu es el pokemon numero #333', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/333.png', 'electric,ice,rock', 1, '2018-11-16 05:59:02.282018', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2927, 1, 'admin', 'Baltoy', 'Baltoy es el pokemon numero #343', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/343.png', 'bug,dark,ghost,grass,water,ice', 1, '2018-11-16 05:59:02.401288', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2937, 1, 'admin', 'Shuppet', 'Shuppet es el pokemon numero #353', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/353.png', 'dark,ghost', 1, '2018-11-16 05:59:02.514693', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2947, 1, 'admin', 'Pignite', 'Pignite es el pokemon numero #499', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/499.png', 'water,ground,flying,psychic', 1, '2018-11-16 05:59:02.642908', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2957, 1, 'admin', 'Purrloin', 'Purrloin es el pokemon numero #509', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/509.png', 'fighting,bug,fairy', 1, '2018-11-16 05:59:02.782444', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2967, 1, 'admin', 'Tranquill', 'Tranquill es el pokemon numero #520', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/520.png', 'electric,ice,rock', 1, '2018-11-16 05:59:02.918186', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2977, 1, 'admin', 'Excadrill', 'Excadrill es el pokemon numero #530', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/530.png', 'fire,water,fighting,ground', 1, '2018-11-16 05:59:03.034191', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2990, 1, 'admin', 'Leavanny', 'Leavanny es el pokemon numero #542', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/542.png', 'fire,flying,ice,poison,bug,rock', 1, '2018-11-16 05:59:03.149649', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3000, 1, 'admin', 'Krokorok', 'Krokorok es el pokemon numero #552', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/552.png', 'water,grass,ice,fighting,bug,fairy', 1, '2018-11-16 05:59:03.262664', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3010, 1, 'admin', 'Yamask', 'Yamask es el pokemon numero #562', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/562.png', 'ghost,dark', 1, '2018-11-16 05:59:03.381014', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3019, 1, 'admin', 'Minccino', 'Minccino es el pokemon numero #572', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/572.png', 'fighting', 1, '2018-11-16 05:59:03.497038', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3030, 1, 'admin', 'Swanna', 'Swanna es el pokemon numero #581', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/581.png', 'electric,rock', 1, '2018-11-16 05:59:03.616668', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3038, 1, 'admin', 'Frillish', 'Frillish es el pokemon numero #592', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/592.png', 'grass,electric,ghost,dark', 1, '2018-11-16 05:59:03.745607', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2633, 1, 'admin', 'Dugtrio', 'Dugtrio es el pokemon numero #51', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/051.png', 'grass,ice,water', 1, '2018-11-16 05:58:58.820725', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2641, 1, 'admin', 'Growlithe', 'Growlithe es el pokemon numero #58', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/058.png', 'ground,rock,water', 1, '2018-11-16 05:58:58.925535', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2650, 1, 'admin', 'Machoke', 'Machoke es el pokemon numero #67', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/067.png', 'flying,psychic,fairy', 1, '2018-11-16 05:58:59.047381', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2659, 1, 'admin', 'Golem', 'Golem es el pokemon numero #76', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/076.png', 'grass,water,fighting,ground,ice,steel', 1, '2018-11-16 05:58:59.153848', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2667, 1, 'admin', 'Farfetch''d', 'Farfetch''d es el pokemon numero #83', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/083.png', 'electric,ice,rock', 1, '2018-11-16 05:58:59.277719', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2676, 1, 'admin', 'Gastly', 'Gastly es el pokemon numero #92', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/092.png', 'dark,ghost,psychic', 1, '2018-11-16 05:58:59.386761', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2686, 1, 'admin', 'Electrode', 'Electrode es el pokemon numero #101', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/101.png', 'ground', 1, '2018-11-16 05:58:59.49271', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2695, 1, 'admin', 'Rhyhorn', 'Rhyhorn es el pokemon numero #111', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/111.png', 'grass,water,fighting,ground,ice,steel', 1, '2018-11-16 05:58:59.597697', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2704, 1, 'admin', 'Starmie', 'Starmie es el pokemon numero #121', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/121.png', 'bug,dark,electric,ghost,grass', 1, '2018-11-16 05:58:59.69622', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2714, 1, 'admin', 'Gyarados', 'Gyarados es el pokemon numero #130', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/130.png', 'electric,rock', 1, '2018-11-16 05:58:59.807484', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2722, 1, 'admin', 'Kabuto', 'Kabuto es el pokemon numero #140', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/140.png', 'grass,electric,fighting,ground', 1, '2018-11-16 05:58:59.918', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2732, 1, 'admin', 'Dragonair', 'Dragonair es el pokemon numero #148', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/148.png', 'dragon,ice,fairy', 1, '2018-11-16 05:59:00.022099', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2741, 1, 'admin', 'Totodile', 'Totodile es el pokemon numero #158', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/158.png', 'electric,grass', 1, '2018-11-16 05:59:00.139192', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2751, 1, 'admin', 'Spinarak', 'Spinarak es el pokemon numero #167', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/167.png', 'fire,flying,psychic,rock', 1, '2018-11-16 05:59:00.246719', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2758, 1, 'admin', 'Togetic', 'Togetic es el pokemon numero #176', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/176.png', 'electric,ice,rock,steel,poison', 1, '2018-11-16 05:59:00.358577', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2767, 1, 'admin', 'Marill', 'Marill es el pokemon numero #183', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/183.png', 'electric,grass,poison', 1, '2018-11-16 05:59:00.463593', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2776, 1, 'admin', 'Sunflora', 'Sunflora es el pokemon numero #192', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/192.png', 'bug,fire,flying,ice,poison', 1, '2018-11-16 05:59:00.573515', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2784, 1, 'admin', 'Misdreavus', 'Misdreavus es el pokemon numero #200', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/200.png', 'dark,ghost', 1, '2018-11-16 05:59:00.684723', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2792, 1, 'admin', 'Granbull', 'Granbull es el pokemon numero #210', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/210.png', 'steel,poison', 1, '2018-11-16 05:59:00.806412', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2802, 1, 'admin', 'Slugma', 'Slugma es el pokemon numero #218', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/218.png', 'ground,rock,water', 1, '2018-11-16 05:59:00.918154', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2812, 1, 'admin', 'Houndour', 'Houndour es el pokemon numero #228', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/228.png', 'fighting,ground,rock,water', 1, '2018-11-16 05:59:01.021544', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2821, 1, 'admin', 'Smoochum', 'Smoochum es el pokemon numero #238', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/238.png', 'bug,dark,fire,ghost,rock,steel', 1, '2018-11-16 05:59:01.127025', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2830, 1, 'admin', 'Pupitar', 'Pupitar es el pokemon numero #247', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/247.png', 'grass,water,fighting,ground,ice,steel', 1, '2018-11-16 05:59:01.232287', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2838, 1, 'admin', 'Torchic', 'Torchic es el pokemon numero #255', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/255.png', 'ground,rock,water', 1, '2018-11-16 05:59:01.37373', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2846, 1, 'admin', 'Zigzagoon', 'Zigzagoon es el pokemon numero #263', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/263.png', 'fighting', 1, '2018-11-16 05:59:01.485939', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2856, 1, 'admin', 'Ludicolo', 'Ludicolo es el pokemon numero #272', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/272.png', 'bug,flying,poison', 1, '2018-11-16 05:59:01.605932', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2866, 1, 'admin', 'Gardevoir', 'Gardevoir es el pokemon numero #282', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/282.png', 'ghost,steel,poison', 1, '2018-11-16 05:59:01.710829', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2877, 1, 'admin', 'Shedinja', 'Shedinja es el pokemon numero #292', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/292.png', 'dark,fire,flying,ghost,rock', 1, '2018-11-16 05:59:01.85387', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2887, 1, 'admin', 'Sableye', 'Sableye es el pokemon numero #302', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/302.png', 'fairy', 1, '2018-11-16 05:59:01.958232', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2896, 1, 'admin', 'Minun', 'Minun es el pokemon numero #312', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/312.png', 'ground', 1, '2018-11-16 05:59:02.064058', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2907, 1, 'admin', 'Numel', 'Numel es el pokemon numero #322', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/322.png', 'water,ground', 1, '2018-11-16 05:59:02.166594', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2915, 1, 'admin', 'Cacnea', 'Cacnea es el pokemon numero #331', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/331.png', 'bug,fire,flying,ice,poison', 1, '2018-11-16 05:59:02.277037', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2925, 1, 'admin', 'Corphish', 'Corphish es el pokemon numero #341', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/341.png', 'electric,grass', 1, '2018-11-16 05:59:02.383158', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2931, 1, 'admin', 'Feebas', 'Feebas es el pokemon numero #349', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/349.png', 'electric,grass', 1, '2018-11-16 05:59:02.489276', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2941, 1, 'admin', 'Arceus', 'Arceus es el pokemon numero #493', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/493.png', 'fighting', 1, '2018-11-16 05:59:02.596736', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2949, 1, 'admin', 'Dewott', 'Dewott es el pokemon numero #502', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/502.png', 'grass,electric', 1, '2018-11-16 05:59:02.701449', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2960, 1, 'admin', 'Pansage', 'Pansage es el pokemon numero #511', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/511.png', 'fire,ice,poison,flying,bug', 1, '2018-11-16 05:59:02.813327', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2970, 1, 'admin', 'Unfezant', 'Unfezant es el pokemon numero #521', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/521.png', 'electric,ice,rock', 1, '2018-11-16 05:59:02.92752', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2978, 1, 'admin', 'Audino', 'Audino es el pokemon numero #531', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/531.png', 'fighting', 1, '2018-11-16 05:59:03.034714', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2987, 1, 'admin', 'Sawk', 'Sawk es el pokemon numero #539', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/539.png', 'flying,psychic,fairy', 1, '2018-11-16 05:59:03.139987', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2996, 1, 'admin', 'Lilligant', 'Lilligant es el pokemon numero #549', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/549.png', 'fire,ice,poison,flying,bug', 1, '2018-11-16 05:59:03.245952', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3006, 1, 'admin', 'Dwebble', 'Dwebble es el pokemon numero #557', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/557.png', 'water,rock,steel', 1, '2018-11-16 05:59:03.356293', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2634, 1, 'admin', 'Diglett', 'Diglett es el pokemon numero #50', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/050.png', 'grass,ice,water', 1, '2018-11-16 05:58:58.820676', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2644, 1, 'admin', 'Poliwhirl', 'Poliwhirl es el pokemon numero #61', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/061.png', 'electric,grass', 1, '2018-11-16 05:58:58.941229', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2654, 1, 'admin', 'Victreebel', 'Victreebel es el pokemon numero #71', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/071.png', 'fire,flying,ice,psychic', 1, '2018-11-16 05:58:59.080486', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2666, 1, 'admin', 'Magnemite', 'Magnemite es el pokemon numero #81', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/081.png', 'ground,fire,fighting', 1, '2018-11-16 05:58:59.216218', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2675, 1, 'admin', 'Cloyster', 'Cloyster es el pokemon numero #91', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/091.png', 'electric,fighting,grass,rock', 1, '2018-11-16 05:58:59.3415', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2684, 1, 'admin', 'Voltorb', 'Voltorb es el pokemon numero #100', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/100.png', 'ground', 1, '2018-11-16 05:58:59.461623', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2694, 1, 'admin', 'Weezing', 'Weezing es el pokemon numero #110', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/110.png', 'psychic', 1, '2018-11-16 05:58:59.581548', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2705, 1, 'admin', 'Staryu', 'Staryu es el pokemon numero #120', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/120.png', 'electric,grass', 1, '2018-11-16 05:58:59.70575', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2716, 1, 'admin', 'Ditto', 'Ditto es el pokemon numero #132', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/132.png', 'fighting', 1, '2018-11-16 05:58:59.856032', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2726, 1, 'admin', 'Aerodactyl', 'Aerodactyl es el pokemon numero #142', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/142.png', 'electric,ice,rock,steel,water', 1, '2018-11-16 05:58:59.981618', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2737, 1, 'admin', 'Chikorita', 'Chikorita es el pokemon numero #152', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/152.png', 'bug,fire,flying,ice,poison', 1, '2018-11-16 05:59:00.109387', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2748, 1, 'admin', 'Hoothoot', 'Hoothoot es el pokemon numero #163', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/163.png', 'electric,ice,rock', 1, '2018-11-16 05:59:00.237363', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2761, 1, 'admin', 'Igglybuff', 'Igglybuff es el pokemon numero #174', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/174.png', 'steel,poison', 1, '2018-11-16 05:59:00.36804', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2770, 1, 'admin', 'Politoed', 'Politoed es el pokemon numero #186', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/186.png', 'electric,grass', 1, '2018-11-16 05:59:00.491741', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2780, 1, 'admin', 'Quagsire', 'Quagsire es el pokemon numero #195', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/195.png', 'grass', 1, '2018-11-16 05:59:00.624705', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2790, 1, 'admin', 'Dunsparce', 'Dunsparce es el pokemon numero #206', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/206.png', 'fighting', 1, '2018-11-16 05:59:00.755102', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2800, 1, 'admin', 'Teddiursa', 'Teddiursa es el pokemon numero #216', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/216.png', 'fighting', 1, '2018-11-16 05:59:00.890086', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2811, 1, 'admin', 'Skarmory', 'Skarmory es el pokemon numero #227', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/227.png', 'electric,fire', 1, '2018-11-16 05:59:01.012463', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2822, 1, 'admin', 'Hitmontop', 'Hitmontop es el pokemon numero #237', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/237.png', 'flying,psychic,fairy', 1, '2018-11-16 05:59:01.132756', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2833, 1, 'admin', 'Lugia', 'Lugia es el pokemon numero #249', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/249.png', 'dark,electric,ghost,ice,rock', 1, '2018-11-16 05:59:01.282229', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2842, 1, 'admin', 'Mudkip', 'Mudkip es el pokemon numero #258', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/258.png', 'electric,grass', 1, '2018-11-16 05:59:01.402917', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2851, 1, 'admin', 'Beautifly', 'Beautifly es el pokemon numero #267', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/267.png', 'rock,electric,fire,flying,ice', 1, '2018-11-16 05:59:01.527265', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2860, 1, 'admin', 'Swellow', 'Swellow es el pokemon numero #277', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/277.png', 'electric,ice,rock', 1, '2018-11-16 05:59:01.644561', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2870, 1, 'admin', 'Breloom', 'Breloom es el pokemon numero #286', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/286.png', 'flying,fire,ice,poison,psychic,fairy', 1, '2018-11-16 05:59:01.764918', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2880, 1, 'admin', 'Makuhita', 'Makuhita es el pokemon numero #296', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/296.png', 'flying,psychic,fairy', 1, '2018-11-16 05:59:01.887062', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2890, 1, 'admin', 'Aggron', 'Aggron es el pokemon numero #306', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/306.png', 'fighting,ground,water', 1, '2018-11-16 05:59:02.005034', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2900, 1, 'admin', 'Gulpin', 'Gulpin es el pokemon numero #316', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/316.png', 'ground,psychic', 1, '2018-11-16 05:59:02.126381', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2910, 1, 'admin', 'Grumpig', 'Grumpig es el pokemon numero #326', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/326.png', 'bug,dark,ghost', 1, '2018-11-16 05:59:02.247767', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2920, 1, 'admin', 'Seviper', 'Seviper es el pokemon numero #336', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/336.png', 'ground,psychic', 1, '2018-11-16 05:59:02.367936', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2933, 1, 'admin', 'Cradily', 'Cradily es el pokemon numero #346', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/346.png', 'bug,fighting,ice,steel', 1, '2018-11-16 05:59:02.490292', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2943, 1, 'admin', 'Snivy', 'Snivy es el pokemon numero #495', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/495.png', 'fire,ice,poison,flying,bug', 1, '2018-11-16 05:59:02.610301', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2953, 1, 'admin', 'Watchog', 'Watchog es el pokemon numero #505', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/505.png', 'fighting', 1, '2018-11-16 05:59:02.732312', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2964, 1, 'admin', 'Panpour', 'Panpour es el pokemon numero #515', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/515.png', 'grass,electric', 1, '2018-11-16 05:59:02.860802', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2974, 1, 'admin', 'Gigalith', 'Gigalith es el pokemon numero #526', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/526.png', 'water,grass,fighting,ground,steel', 1, '2018-11-16 05:59:02.994964', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2984, 1, 'admin', 'Palpitoad', 'Palpitoad es el pokemon numero #536', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/536.png', 'grass', 1, '2018-11-16 05:59:03.114394', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2994, 1, 'admin', 'Cottonee', 'Cottonee es el pokemon numero #546', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/546.png', 'fire,ice,poison,flying,steel', 1, '2018-11-16 05:59:03.231868', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3004, 1, 'admin', 'Maractus', 'Maractus es el pokemon numero #556', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/556.png', 'fire,ice,poison,flying,bug', 1, '2018-11-16 05:59:03.35518', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3018, 1, 'admin', 'Trubbish', 'Trubbish es el pokemon numero #568', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/568.png', 'ground,psychic', 1, '2018-11-16 05:59:03.477007', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3028, 1, 'admin', 'Ducklett', 'Ducklett es el pokemon numero #580', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/580.png', 'electric,rock', 1, '2018-11-16 05:59:03.607319', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3039, 1, 'admin', 'Escavalier', 'Escavalier es el pokemon numero #589', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/589.png', 'fire', 1, '2018-11-16 05:59:03.746139', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3048, 1, 'admin', 'Klang', 'Klang es el pokemon numero #600', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/600.png', 'fire,fighting,ground', 1, '2018-11-16 05:59:03.866038', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3057, 1, 'admin', 'Chandelure', 'Chandelure es el pokemon numero #609', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/609.png', 'water,ground,rock,ghost,dark', 1, '2018-11-16 05:59:03.986303', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2635, 1, 'admin', 'Venomoth', 'Venomoth es el pokemon numero #49', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/049.png', 'fire,flying,psychic,rock', 1, '2018-11-16 05:58:58.825191', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2645, 1, 'admin', 'Poliwag', 'Poliwag es el pokemon numero #60', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/060.png', 'electric,grass', 1, '2018-11-16 05:58:58.945371', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2656, 1, 'admin', 'Weepinbell', 'Weepinbell es el pokemon numero #70', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/070.png', 'fire,flying,ice,psychic', 1, '2018-11-16 05:58:59.085019', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2664, 1, 'admin', 'Slowbro', 'Slowbro es el pokemon numero #80', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/080.png', 'bug,dark,electric,ghost,grass', 1, '2018-11-16 05:58:59.207268', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2674, 1, 'admin', 'Muk', 'Muk es el pokemon numero #89', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/089.png', 'ground,psychic', 1, '2018-11-16 05:58:59.326997', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2683, 1, 'admin', 'Krabby', 'Krabby es el pokemon numero #98', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/098.png', 'electric,grass', 1, '2018-11-16 05:58:59.446881', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2693, 1, 'admin', 'Koffing', 'Koffing es el pokemon numero #109', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/109.png', 'psychic', 1, '2018-11-16 05:58:59.571667', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2703, 1, 'admin', 'Seaking', 'Seaking es el pokemon numero #119', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/119.png', 'electric,grass', 1, '2018-11-16 05:58:59.689447', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2713, 1, 'admin', 'Magikarp', 'Magikarp es el pokemon numero #129', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/129.png', 'electric,grass', 1, '2018-11-16 05:58:59.806778', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2724, 1, 'admin', 'Omastar', 'Omastar es el pokemon numero #139', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/139.png', 'grass,electric,fighting,ground', 1, '2018-11-16 05:58:59.927883', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2735, 1, 'admin', 'Mewtwo', 'Mewtwo es el pokemon numero #150', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/150.png', 'bug,dark,ghost', 1, '2018-11-16 05:59:00.046702', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2745, 1, 'admin', 'Feraligatr', 'Feraligatr es el pokemon numero #160', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/160.png', 'electric,grass', 1, '2018-11-16 05:59:00.17448', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2754, 1, 'admin', 'Chinchou', 'Chinchou es el pokemon numero #170', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/170.png', 'grass,ground', 1, '2018-11-16 05:59:00.295657', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2763, 1, 'admin', 'Mareep', 'Mareep es el pokemon numero #179', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/179.png', 'ground', 1, '2018-11-16 05:59:00.420448', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2772, 1, 'admin', 'Skiploom', 'Skiploom es el pokemon numero #188', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/188.png', 'ice,fire,flying,poison,rock', 1, '2018-11-16 05:59:00.542332', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2782, 1, 'admin', 'Umbreon', 'Umbreon es el pokemon numero #197', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/197.png', 'fighting,bug,fairy', 1, '2018-11-16 05:59:00.673788', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2797, 1, 'admin', 'Steelix', 'Steelix es el pokemon numero #208', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/208.png', 'fighting,fire,ground,water', 1, '2018-11-16 05:59:00.820472', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2808, 1, 'admin', 'Remoraid', 'Remoraid es el pokemon numero #223', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/223.png', 'electric,grass', 1, '2018-11-16 05:59:00.984913', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2818, 1, 'admin', 'Stantler', 'Stantler es el pokemon numero #234', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/234.png', 'fighting', 1, '2018-11-16 05:59:01.10991', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2828, 1, 'admin', 'Entei', 'Entei es el pokemon numero #244', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/244.png', 'ground,rock,water', 1, '2018-11-16 05:59:01.226617', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2837, 1, 'admin', 'Grovyle', 'Grovyle es el pokemon numero #253', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/253.png', 'bug,fire,flying,ice,poison', 1, '2018-11-16 05:59:01.363279', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2848, 1, 'admin', 'Mightyena', 'Mightyena es el pokemon numero #262', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/262.png', 'fighting,bug,fairy', 1, '2018-11-16 05:59:01.499925', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2858, 1, 'admin', 'Nuzleaf', 'Nuzleaf es el pokemon numero #274', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/274.png', 'bug,fire,fighting,flying,ice,poison,fairy', 1, '2018-11-16 05:59:01.628588', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2868, 1, 'admin', 'Masquerain', 'Masquerain es el pokemon numero #284', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/284.png', 'rock,electric,fire,flying,ice', 1, '2018-11-16 05:59:01.745384', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2879, 1, 'admin', 'Loudred', 'Loudred es el pokemon numero #294', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/294.png', 'fighting', 1, '2018-11-16 05:59:01.867428', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2889, 1, 'admin', 'Lairon', 'Lairon es el pokemon numero #305', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/305.png', 'fighting,ground,water', 1, '2018-11-16 05:59:01.985168', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2899, 1, 'admin', 'Roselia', 'Roselia es el pokemon numero #315', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/315.png', 'fire,flying,ice,psychic', 1, '2018-11-16 05:59:02.10528', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2909, 1, 'admin', 'Spoink', 'Spoink es el pokemon numero #325', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/325.png', 'bug,dark,ghost', 1, '2018-11-16 05:59:02.223924', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2919, 1, 'admin', 'Zangoose', 'Zangoose es el pokemon numero #335', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/335.png', 'fighting', 1, '2018-11-16 05:59:02.341688', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2929, 1, 'admin', 'Lileep', 'Lileep es el pokemon numero #345', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/345.png', 'bug,fighting,ice,steel', 1, '2018-11-16 05:59:02.472175', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2939, 1, 'admin', 'Darkrai', 'Darkrai es el pokemon numero #491', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/491.png', 'fighting,bug,fairy', 1, '2018-11-16 05:59:02.591731', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2952, 1, 'admin', 'Oshawott', 'Oshawott es el pokemon numero #501', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/501.png', 'grass,electric', 1, '2018-11-16 05:59:02.711716', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2961, 1, 'admin', 'Pansear', 'Pansear es el pokemon numero #513', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/513.png', 'water,ground,rock', 1, '2018-11-16 05:59:02.830518', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2972, 1, 'admin', 'Zebstrika', 'Zebstrika es el pokemon numero #523', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/523.png', 'ground', 1, '2018-11-16 05:59:02.961669', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2982, 1, 'admin', 'Conkeldurr', 'Conkeldurr es el pokemon numero #534', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/534.png', 'flying,psychic,fairy', 1, '2018-11-16 05:59:03.083021', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2992, 1, 'admin', 'Whirlipede', 'Whirlipede es el pokemon numero #544', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/544.png', 'fire,flying,rock,psychic', 1, '2018-11-16 05:59:03.200861', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3003, 1, 'admin', 'Darumaka', 'Darumaka es el pokemon numero #554', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/554.png', 'water,ground,rock', 1, '2018-11-16 05:59:03.331222', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3013, 1, 'admin', 'Tirtouga', 'Tirtouga es el pokemon numero #564', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/564.png', 'grass,electric,fighting,ground', 1, '2018-11-16 05:59:03.451022', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3023, 1, 'admin', 'Gothorita', 'Gothorita es el pokemon numero #575', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/575.png', 'bug,ghost,dark', 1, '2018-11-16 05:59:03.573194', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3035, 1, 'admin', 'Deerling', 'Deerling es el pokemon numero #585', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/585.png', 'fire,ice,fighting,poison,flying,bug', 1, '2018-11-16 05:59:03.695431', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3045, 1, 'admin', 'Galvantula', 'Galvantula es el pokemon numero #596', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/596.png', 'fire,rock', 1, '2018-11-16 05:59:03.821873', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3054, 1, 'admin', 'Beheeyem', 'Beheeyem es el pokemon numero #606', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/606.png', 'bug,ghost,dark', 1, '2018-11-16 05:59:03.950582', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2636, 1, 'admin', 'Meowth', 'Meowth es el pokemon numero #52', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/052.png', 'fighting', 1, '2018-11-16 05:58:58.840625', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2646, 1, 'admin', 'Poliwrath', 'Poliwrath es el pokemon numero #62', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/062.png', 'electric,flying,grass,psychic,fairy', 1, '2018-11-16 05:58:58.970907', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2657, 1, 'admin', 'Tentacool', 'Tentacool es el pokemon numero #72', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/072.png', 'electric,ground,psychic', 1, '2018-11-16 05:58:59.092877', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2690, 1, 'admin', 'Hitmonlee', 'Hitmonlee es el pokemon numero #106', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/106.png', 'flying,psychic,fairy', 1, '2018-11-16 05:58:59.549993', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2702, 1, 'admin', 'Seadra', 'Seadra es el pokemon numero #117', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/117.png', 'electric,grass', 1, '2018-11-16 05:58:59.671754', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2712, 1, 'admin', 'Tauros', 'Tauros es el pokemon numero #128', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/128.png', 'fighting', 1, '2018-11-16 05:58:59.796018', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2723, 1, 'admin', 'Omanyte', 'Omanyte es el pokemon numero #138', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/138.png', 'grass,electric,fighting,ground', 1, '2018-11-16 05:58:59.919063', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2734, 1, 'admin', 'Dragonite', 'Dragonite es el pokemon numero #149', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/149.png', 'ice,dragon,rock,fairy', 1, '2018-11-16 05:59:00.043139', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2744, 1, 'admin', 'Sentret', 'Sentret es el pokemon numero #161', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/161.png', 'fighting', 1, '2018-11-16 05:59:00.171625', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2755, 1, 'admin', 'Lanturn', 'Lanturn es el pokemon numero #171', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/171.png', 'grass,ground', 1, '2018-11-16 05:59:00.322714', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2765, 1, 'admin', 'Flaaffy', 'Flaaffy es el pokemon numero #180', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/180.png', 'ground', 1, '2018-11-16 05:59:00.447141', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2774, 1, 'admin', 'Aipom', 'Aipom es el pokemon numero #190', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/190.png', 'fighting', 1, '2018-11-16 05:59:00.569124', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2787, 1, 'admin', 'Wobbuffet', 'Wobbuffet es el pokemon numero #202', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/202.png', 'bug,dark,ghost', 1, '2018-11-16 05:59:00.695857', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2798, 1, 'admin', 'Heracross', 'Heracross es el pokemon numero #214', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/214.png', 'flying,fire,psychic,fairy', 1, '2018-11-16 05:59:00.821339', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2809, 1, 'admin', 'Octillery', 'Octillery es el pokemon numero #224', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/224.png', 'electric,grass', 1, '2018-11-16 05:59:00.987493', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2819, 1, 'admin', 'Smeargle', 'Smeargle es el pokemon numero #235', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/235.png', 'fighting', 1, '2018-11-16 05:59:01.110424', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2831, 1, 'admin', 'Suicune', 'Suicune es el pokemon numero #245', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/245.png', 'electric,grass', 1, '2018-11-16 05:59:01.236168', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2841, 1, 'admin', 'Combusken', 'Combusken es el pokemon numero #256', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/256.png', 'flying,ground,psychic,water', 1, '2018-11-16 05:59:01.384861', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2850, 1, 'admin', 'Silcoon', 'Silcoon es el pokemon numero #266', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/266.png', 'fire,flying,rock', 1, '2018-11-16 05:59:01.515999', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2861, 1, 'admin', 'Taillow', 'Taillow es el pokemon numero #276', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/276.png', 'electric,ice,rock', 1, '2018-11-16 05:59:01.646144', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2871, 1, 'admin', 'Slakoth', 'Slakoth es el pokemon numero #287', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/287.png', 'fighting', 1, '2018-11-16 05:59:01.766471', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2881, 1, 'admin', 'Hariyama', 'Hariyama es el pokemon numero #297', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/297.png', 'flying,psychic,fairy', 1, '2018-11-16 05:59:01.888693', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2891, 1, 'admin', 'Meditite', 'Meditite es el pokemon numero #307', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/307.png', 'flying,ghost,fairy', 1, '2018-11-16 05:59:02.008977', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2901, 1, 'admin', 'Swalot', 'Swalot es el pokemon numero #317', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/317.png', 'ground,psychic', 1, '2018-11-16 05:59:02.127975', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2911, 1, 'admin', 'Spinda', 'Spinda es el pokemon numero #327', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/327.png', 'fighting', 1, '2018-11-16 05:59:02.249372', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2921, 1, 'admin', 'Lunatone', 'Lunatone es el pokemon numero #337', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/337.png', 'bug,dark,ghost,grass,steel,water', 1, '2018-11-16 05:59:02.369528', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2934, 1, 'admin', 'Armaldo', 'Armaldo es el pokemon numero #348', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/348.png', 'rock,steel,water', 1, '2018-11-16 05:59:02.491866', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2944, 1, 'admin', 'Servine', 'Servine es el pokemon numero #496', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/496.png', 'fire,ice,poison,flying,bug', 1, '2018-11-16 05:59:02.612273', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2954, 1, 'admin', 'Lillipup', 'Lillipup es el pokemon numero #506', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/506.png', 'fighting', 1, '2018-11-16 05:59:02.733943', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2965, 1, 'admin', 'Munna', 'Munna es el pokemon numero #517', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/517.png', 'bug,ghost,dark', 1, '2018-11-16 05:59:02.86245', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2975, 1, 'admin', 'Woobat', 'Woobat es el pokemon numero #527', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/527.png', 'electric,ice,rock,ghost,dark', 1, '2018-11-16 05:59:02.996574', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2985, 1, 'admin', 'Seismitoad', 'Seismitoad es el pokemon numero #537', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/537.png', 'grass', 1, '2018-11-16 05:59:03.122703', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2995, 1, 'admin', 'Whimsicott', 'Whimsicott es el pokemon numero #547', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/547.png', 'fire,ice,poison,flying,steel', 1, '2018-11-16 05:59:03.242455', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3009, 1, 'admin', 'Scraggy', 'Scraggy es el pokemon numero #559', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/559.png', 'fighting,flying,fairy', 1, '2018-11-16 05:59:03.366702', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3020, 1, 'admin', 'Zoroark', 'Zoroark es el pokemon numero #571', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/571.png', 'fighting,bug,fairy', 1, '2018-11-16 05:59:03.497555', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3031, 1, 'admin', 'Vanillite', 'Vanillite es el pokemon numero #582', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/582.png', 'fire,fighting,rock,steel', 1, '2018-11-16 05:59:03.622886', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3040, 1, 'admin', 'Amoonguss', 'Amoonguss es el pokemon numero #591', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/591.png', 'fire,ice,flying,psychic', 1, '2018-11-16 05:59:03.75178', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3049, 1, 'admin', 'Klinklang', 'Klinklang es el pokemon numero #601', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/601.png', 'fire,fighting,ground', 1, '2018-11-16 05:59:03.877219', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3058, 1, 'admin', 'Axew', 'Axew es el pokemon numero #610', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/610.png', 'ice,dragon,fairy', 1, '2018-11-16 05:59:03.998176', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3071, 1, 'admin', 'Golett', 'Golett es el pokemon numero #622', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/622.png', 'water,grass,ice,ghost,dark', 1, '2018-11-16 05:59:04.135603', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3082, 1, 'admin', 'Deino', 'Deino es el pokemon numero #633', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/633.png', 'ice,fighting,bug,dragon,fairy', 1, '2018-11-16 05:59:04.260944', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3092, 1, 'admin', 'Zekrom', 'Zekrom es el pokemon numero #644', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/644.png', 'ice,ground,dragon,fairy', 1, '2018-11-16 05:59:04.38148', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2638, 1, 'admin', 'Psyduck', 'Psyduck es el pokemon numero #54', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/054.png', 'electric,grass', 1, '2018-11-16 05:58:58.900803', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2648, 1, 'admin', 'Kadabra', 'Kadabra es el pokemon numero #64', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/064.png', 'bug,dark,ghost', 1, '2018-11-16 05:58:59.036894', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2660, 1, 'admin', 'Geodude', 'Geodude es el pokemon numero #74', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/074.png', 'grass,water,fighting,ground,ice,steel', 1, '2018-11-16 05:58:59.158263', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2671, 1, 'admin', 'Dodrio', 'Dodrio es el pokemon numero #85', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/085.png', 'electric,ice,rock', 1, '2018-11-16 05:58:59.29811', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2678, 1, 'admin', 'Gengar', 'Gengar es el pokemon numero #94', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/094.png', 'dark,ghost,psychic', 1, '2018-11-16 05:58:59.406597', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2688, 1, 'admin', 'Exeggutor', 'Exeggutor es el pokemon numero #103', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/103.png', 'bug,dark,fire,flying,ghost,ice,poison', 1, '2018-11-16 05:58:59.520855', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2697, 1, 'admin', 'Chansey', 'Chansey es el pokemon numero #113', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/113.png', 'fighting', 1, '2018-11-16 05:58:59.631676', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2707, 1, 'admin', 'Scyther', 'Scyther es el pokemon numero #123', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/123.png', 'rock,electric,fire,flying,ice', 1, '2018-11-16 05:58:59.751354', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2718, 1, 'admin', 'Eevee', 'Eevee es el pokemon numero #133', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/133.png', 'fighting', 1, '2018-11-16 05:58:59.866945', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2728, 1, 'admin', 'Snorlax', 'Snorlax es el pokemon numero #143', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/143.png', 'fighting', 1, '2018-11-16 05:58:59.996211', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2736, 1, 'admin', 'Bayleef', 'Bayleef es el pokemon numero #153', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/153.png', 'bug,fire,flying,ice,poison', 1, '2018-11-16 05:59:00.10856', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2746, 1, 'admin', 'Furret', 'Furret es el pokemon numero #162', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/162.png', 'fighting', 1, '2018-11-16 05:59:00.222944', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2756, 1, 'admin', 'Pichu', 'Pichu es el pokemon numero #172', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/172.png', 'ground', 1, '2018-11-16 05:59:00.331709', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2764, 1, 'admin', 'Ampharos', 'Ampharos es el pokemon numero #181', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/181.png', 'ground', 1, '2018-11-16 05:59:00.443035', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2773, 1, 'admin', 'Jumpluff', 'Jumpluff es el pokemon numero #189', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/189.png', 'ice,fire,flying,poison,rock', 1, '2018-11-16 05:59:00.554974', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2781, 1, 'admin', 'Murkrow', 'Murkrow es el pokemon numero #198', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/198.png', 'electric,ice,rock,fairy', 1, '2018-11-16 05:59:00.664691', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2791, 1, 'admin', 'Gligar', 'Gligar es el pokemon numero #207', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/207.png', 'ice,water', 1, '2018-11-16 05:59:00.774516', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2801, 1, 'admin', 'Ursaring', 'Ursaring es el pokemon numero #217', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/217.png', 'fighting', 1, '2018-11-16 05:59:00.892463', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2810, 1, 'admin', 'Mantine', 'Mantine es el pokemon numero #226', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/226.png', 'electric,rock', 1, '2018-11-16 05:59:01.001324', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2820, 1, 'admin', 'Tyrogue', 'Tyrogue es el pokemon numero #236', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/236.png', 'flying,psychic,fairy', 1, '2018-11-16 05:59:01.11587', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2829, 1, 'admin', 'Larvitar', 'Larvitar es el pokemon numero #246', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/246.png', 'grass,water,fighting,ground,ice,steel', 1, '2018-11-16 05:59:01.230025', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2840, 1, 'admin', 'Sceptile', 'Sceptile es el pokemon numero #254', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/254.png', 'bug,fire,flying,ice,poison', 1, '2018-11-16 05:59:01.378661', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2849, 1, 'admin', 'Wurmple', 'Wurmple es el pokemon numero #265', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/265.png', 'fire,flying,rock', 1, '2018-11-16 05:59:01.50981', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2859, 1, 'admin', 'Shiftry', 'Shiftry es el pokemon numero #275', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/275.png', 'bug,fire,fighting,flying,ice,poison,fairy', 1, '2018-11-16 05:59:01.634795', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2869, 1, 'admin', 'Shroomish', 'Shroomish es el pokemon numero #285', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/285.png', 'bug,fire,flying,ice,poison', 1, '2018-11-16 05:59:01.746135', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2878, 1, 'admin', 'Exploud', 'Exploud es el pokemon numero #295', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/295.png', 'fighting', 1, '2018-11-16 05:59:01.858348', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2888, 1, 'admin', 'Aron', 'Aron es el pokemon numero #304', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/304.png', 'fighting,ground,water', 1, '2018-11-16 05:59:01.970655', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2898, 1, 'admin', 'Illumise', 'Illumise es el pokemon numero #314', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/314.png', 'fire,flying,rock', 1, '2018-11-16 05:59:02.081489', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2908, 1, 'admin', 'Torkoal', 'Torkoal es el pokemon numero #324', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/324.png', 'ground,rock,water', 1, '2018-11-16 05:59:02.191592', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2918, 1, 'admin', 'Altaria', 'Altaria es el pokemon numero #334', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/334.png', 'ice,dragon,rock,fairy', 1, '2018-11-16 05:59:02.322932', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2928, 1, 'admin', 'Claydol', 'Claydol es el pokemon numero #344', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/344.png', 'bug,dark,ghost,grass,water,ice', 1, '2018-11-16 05:59:02.433544', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2938, 1, 'admin', 'Manaphy', 'Manaphy es el pokemon numero #490', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/490.png', 'electric,grass', 1, '2018-11-16 05:59:02.545499', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2948, 1, 'admin', 'Emboar', 'Emboar es el pokemon numero #500', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/500.png', 'water,ground,flying,psychic', 1, '2018-11-16 05:59:02.659783', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2958, 1, 'admin', 'Liepard', 'Liepard es el pokemon numero #510', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/510.png', 'fighting,bug,fairy', 1, '2018-11-16 05:59:02.78291', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2968, 1, 'admin', 'Pidove', 'Pidove es el pokemon numero #519', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/519.png', 'electric,ice,rock', 1, '2018-11-16 05:59:02.918751', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2979, 1, 'admin', 'Drilbur', 'Drilbur es el pokemon numero #529', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/529.png', 'water,grass,ice', 1, '2018-11-16 05:59:03.035026', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2989, 1, 'admin', 'Sewaddle', 'Sewaddle es el pokemon numero #540', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/540.png', 'fire,flying,ice,poison,bug,rock', 1, '2018-11-16 05:59:03.144909', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (2999, 1, 'admin', 'Sandile', 'Sandile es el pokemon numero #551', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/551.png', 'water,grass,ice,fighting,bug,fairy', 1, '2018-11-16 05:59:03.251773', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3008, 1, 'admin', 'Sigilyph', 'Sigilyph es el pokemon numero #561', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/561.png', 'electric,ice,rock,ghost,dark', 1, '2018-11-16 05:59:03.362906', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3017, 1, 'admin', 'Garbodor', 'Garbodor es el pokemon numero #569', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/569.png', 'ground,psychic', 1, '2018-11-16 05:59:03.472858', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3026, 1, 'admin', 'Duosion', 'Duosion es el pokemon numero #578', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/578.png', 'bug,ghost,dark', 1, '2018-11-16 05:59:03.588023', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3036, 1, 'admin', 'Karrablast', 'Karrablast es el pokemon numero #588', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/588.png', 'fire,flying,rock', 1, '2018-11-16 05:59:03.69983', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3005, 1, 'admin', 'Crustle', 'Crustle es el pokemon numero #558', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/558.png', 'water,rock,steel', 1, '2018-11-16 05:59:03.355925', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3015, 1, 'admin', 'Archeops', 'Archeops es el pokemon numero #567', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/567.png', 'water,electric,ice,rock,steel', 1, '2018-11-16 05:59:03.462586', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3024, 1, 'admin', 'Solosis ', 'Solosis  es el pokemon numero #577', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/577.png', 'bug,ghost,dark', 1, '2018-11-16 05:59:03.573747', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3033, 1, 'admin', 'Emolga', 'Emolga es el pokemon numero #587', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/587.png', 'ice,rock', 1, '2018-11-16 05:59:03.681385', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3043, 1, 'admin', 'Joltik', 'Joltik es el pokemon numero #595', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/595.png', 'fire,rock', 1, '2018-11-16 05:59:03.786108', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3051, 1, 'admin', 'Eelektross', 'Eelektross es el pokemon numero #604', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/604.png', '', 1, '2018-11-16 05:59:03.892712', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3059, 1, 'admin', 'Haxorus', 'Haxorus es el pokemon numero #612', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/612.png', 'ice,dragon,fairy', 1, '2018-11-16 05:59:03.999233', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3069, 1, 'admin', 'Druddigon', 'Druddigon es el pokemon numero #621', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/621.png', 'ice,dragon,fairy', 1, '2018-11-16 05:59:04.124419', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3078, 1, 'admin', 'Bouffalant', 'Bouffalant es el pokemon numero #626', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/626.png', 'fighting', 1, '2018-11-16 05:59:04.23145', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3085, 1, 'admin', 'Virizion', 'Virizion es el pokemon numero #640', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/640.png', 'flying,fire,ice,poison,psychic,fairy', 1, '2018-11-16 05:59:04.335863', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3096, 1, 'admin', 'Meloetta', 'Meloetta es el pokemon numero #648', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/648.png', 'bug,dark', 1, '2018-11-16 05:59:04.450186', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3106, 1, 'admin', 'Greninja', 'Greninja es el pokemon numero #658', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/658.png', 'fairy,grass,electric,fighting,bug', 1, '2018-11-16 05:59:04.55971', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3115, 1, 'admin', 'Pyroar', 'Pyroar es el pokemon numero #668', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/668.png', 'water,rock,fighting,ground', 1, '2018-11-16 05:59:04.662056', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3125, 1, 'admin', 'Espurr', 'Espurr es el pokemon numero #677', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/677.png', 'ghost,dark,bug', 1, '2018-11-16 05:59:04.766272', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3134, 1, 'admin', 'Inkay', 'Inkay es el pokemon numero #686', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/686.png', 'fairy,bug', 1, '2018-11-16 05:59:04.872052', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3143, 1, 'admin', 'Noibat', 'Noibat es el pokemon numero #714', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/714.png', 'ice,rock,fairy,dragon', 1, '2018-11-16 05:59:04.978238', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3150, 1, 'admin', 'Lycanroc', 'Lycanroc es el pokemon numero #745', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/745.png', 'water,steel,grass,fighting,ground', 1, '2018-11-16 05:59:05.110797', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3159, 1, 'admin', 'Pyukumuku', 'Pyukumuku es el pokemon numero #771', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/771.png', 'grass,electric', 1, '2018-11-16 05:59:05.217022', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3168, 1, 'admin', 'Phione', 'Phione es el pokemon numero #489', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/489.png', 'electric,grass', 1, '2018-11-16 05:59:05.325365', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3177, 1, 'admin', 'Uxie', 'Uxie es el pokemon numero #480', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/480.png', 'bug,dark,ghost', 1, '2018-11-16 05:59:05.432877', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3186, 1, 'admin', 'Glaceon', 'Glaceon es el pokemon numero #471', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/471.png', 'fire,fighting,rock,steel', 1, '2018-11-16 05:59:05.538925', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3196, 1, 'admin', 'Weavile', 'Weavile es el pokemon numero #461', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/461.png', 'fighting,bug,fire,rock,steel,fairy', 1, '2018-11-16 05:59:05.645636', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3205, 1, 'admin', 'Drapion', 'Drapion es el pokemon numero #452', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/452.png', 'ground', 1, '2018-11-16 05:59:05.753101', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3215, 1, 'admin', 'Spiritomb', 'Spiritomb es el pokemon numero #442', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/442.png', 'fairy', 1, '2018-11-16 05:59:05.869546', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3224, 1, 'admin', 'Stunky', 'Stunky es el pokemon numero #434', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/434.png', 'ground', 1, '2018-11-16 05:59:05.97942', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3233, 1, 'admin', 'Ambipom', 'Ambipom es el pokemon numero #424', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/424.png', 'fighting', 1, '2018-11-16 05:59:06.095829', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3243, 1, 'admin', 'Combee', 'Combee es el pokemon numero #415', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/415.png', 'rock,electric,fire,flying,ice', 1, '2018-11-16 05:59:06.216892', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3251, 1, 'admin', 'Budew', 'Budew es el pokemon numero #406', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/406.png', 'fire,flying,ice,psychic', 1, '2018-11-16 05:59:06.321497', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3259, 1, 'admin', 'Bidoof', 'Bidoof es el pokemon numero #399', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/399.png', 'fighting', 1, '2018-11-16 05:59:06.452441', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3269, 1, 'admin', 'Torterra', 'Torterra es el pokemon numero #389', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/389.png', 'ice,bug,fire,flying', 1, '2018-11-16 05:59:06.557304', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3278, 1, 'admin', 'Registeel', 'Registeel es el pokemon numero #379', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/379.png', 'fighting,fire,ground', 1, '2018-11-16 05:59:06.662537', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3288, 1, 'admin', 'Luvdisc', 'Luvdisc es el pokemon numero #370', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/370.png', 'electric,grass', 1, '2018-11-16 05:59:06.78349', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3298, 1, 'admin', 'Wynaut', 'Wynaut es el pokemon numero #360', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/360.png', 'bug,dark,ghost', 1, '2018-11-16 05:59:06.887888', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3308, 1, 'admin', 'Poipole', 'Poipole es el pokemon numero #803', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/803.png', 'psychic,ground', 1, '2018-11-16 05:59:06.997742', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3317, 1, 'admin', 'Cosmoem', 'Cosmoem es el pokemon numero #790', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/790.png', 'ghost,dark,bug', 1, '2018-11-16 05:59:07.101656', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3326, 1, 'admin', 'Togedemaru', 'Togedemaru es el pokemon numero #777', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/777.png', 'fire,fighting,ground', 1, '2018-11-16 05:59:07.211386', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3336, 1, 'admin', 'Oranguru', 'Oranguru es el pokemon numero #765', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/765.png', 'dark,bug', 1, '2018-11-16 05:59:07.320363', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3345, 1, 'admin', 'Dewpider', 'Dewpider es el pokemon numero #751', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/751.png', 'flying,electric,rock', 1, '2018-11-16 05:59:07.422777', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3353, 1, 'admin', 'Crabrawler', 'Crabrawler es el pokemon numero #739', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/739.png', 'psychic,flying,fairy', 1, '2018-11-16 05:59:07.528909', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3361, 1, 'admin', 'Popplio', 'Popplio es el pokemon numero #728', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/728.png', 'grass,electric', 1, '2018-11-16 05:59:07.638646', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3370, 1, 'admin', 'Diancie', 'Diancie es el pokemon numero #719', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/719.png', 'steel,water,grass,ground', 1, '2018-11-16 05:59:07.744604', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3379, 1, 'admin', 'Klefki', 'Klefki es el pokemon numero #707', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/707.png', 'fire,ground', 1, '2018-11-16 05:59:07.848078', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3389, 1, 'admin', 'Clawitzer', 'Clawitzer es el pokemon numero #693', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/693.png', 'grass,electric', 1, '2018-11-16 05:59:07.965825', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3014, 1, 'admin', 'Archen', 'Archen es el pokemon numero #566', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/566.png', 'water,electric,ice,rock,steel', 1, '2018-11-16 05:59:03.461084', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3025, 1, 'admin', 'Gothitelle', 'Gothitelle es el pokemon numero #576', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/576.png', 'bug,ghost,dark', 1, '2018-11-16 05:59:03.574105', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3034, 1, 'admin', 'Sawsbuck', 'Sawsbuck es el pokemon numero #586', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/586.png', 'fire,ice,fighting,poison,flying,bug', 1, '2018-11-16 05:59:03.681868', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3042, 1, 'admin', 'Alomomola', 'Alomomola es el pokemon numero #594', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/594.png', 'grass,electric', 1, '2018-11-16 05:59:03.785576', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3052, 1, 'admin', 'Eelektrik', 'Eelektrik es el pokemon numero #603', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/603.png', '', 1, '2018-11-16 05:59:03.893252', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3060, 1, 'admin', 'Fraxure', 'Fraxure es el pokemon numero #611', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/611.png', 'ice,dragon,fairy', 1, '2018-11-16 05:59:03.999564', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3067, 1, 'admin', 'Mienshao', 'Mienshao es el pokemon numero #620', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/620.png', 'flying,psychic,fairy', 1, '2018-11-16 05:59:04.110611', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3077, 1, 'admin', 'Rufflet', 'Rufflet es el pokemon numero #627', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/627.png', 'electric,ice,rock', 1, '2018-11-16 05:59:04.223751', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3086, 1, 'admin', 'Cobalion', 'Cobalion es el pokemon numero #638', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/638.png', 'fire,fighting,ground', 1, '2018-11-16 05:59:04.336361', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3095, 1, 'admin', 'Keldeo', 'Keldeo es el pokemon numero #647', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/647.png', 'flying,grass,electric,fairy,psychic', 1, '2018-11-16 05:59:04.44032', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3104, 1, 'admin', 'Frogadier', 'Frogadier es el pokemon numero #657', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/657.png', 'grass,electric', 1, '2018-11-16 05:59:04.544857', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3114, 1, 'admin', 'Vivillon', 'Vivillon es el pokemon numero #666', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/666.png', 'fire,flying,electric,ice,rock', 1, '2018-11-16 05:59:04.647192', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3123, 1, 'admin', 'Furfrou', 'Furfrou es el pokemon numero #676', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/676.png', 'fighting', 1, '2018-11-16 05:59:04.751791', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3132, 1, 'admin', 'Slurpuff', 'Slurpuff es el pokemon numero #685', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/685.png', 'steel,poison', 1, '2018-11-16 05:59:04.855629', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3142, 1, 'admin', 'Goodra', 'Goodra es el pokemon numero #706', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/706.png', 'fairy,ice,dragon', 1, '2018-11-16 05:59:04.965848', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3149, 1, 'admin', 'Oricorio', 'Oricorio es el pokemon numero #741', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/741.png', 'water,electric,rock', 1, '2018-11-16 05:59:05.11025', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3158, 1, 'admin', 'Wimpod', 'Wimpod es el pokemon numero #767', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/767.png', 'flying,electric,rock', 1, '2018-11-16 05:59:05.216582', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3167, 1, 'admin', 'Blacephalon', 'Blacephalon es el pokemon numero #806', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/806.png', 'water,ghost,ground,dark,rock', 1, '2018-11-16 05:59:05.324844', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3178, 1, 'admin', 'Mesprit', 'Mesprit es el pokemon numero #481', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/481.png', 'bug,dark,ghost', 1, '2018-11-16 05:59:05.433387', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3187, 1, 'admin', 'Gliscor', 'Gliscor es el pokemon numero #472', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/472.png', 'ice,water', 1, '2018-11-16 05:59:05.539425', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3197, 1, 'admin', 'Magnezone', 'Magnezone es el pokemon numero #462', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/462.png', 'ground,fire,fighting', 1, '2018-11-16 05:59:05.646061', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3206, 1, 'admin', 'Croagunk', 'Croagunk es el pokemon numero #453', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/453.png', 'psychic,flying,ground', 1, '2018-11-16 05:59:05.753585', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3213, 1, 'admin', 'Gible', 'Gible es el pokemon numero #443', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/443.png', 'ice,dragon,fairy', 1, '2018-11-16 05:59:05.85991', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3221, 1, 'admin', 'Skuntank', 'Skuntank es el pokemon numero #435', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/435.png', 'ground', 1, '2018-11-16 05:59:05.966213', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3229, 1, 'admin', 'Mismagius', 'Mismagius es el pokemon numero #429', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/429.png', 'dark,ghost', 1, '2018-11-16 05:59:06.070767', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3239, 1, 'admin', 'Floatzel', 'Floatzel es el pokemon numero #419', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/419.png', 'electric,grass', 1, '2018-11-16 05:59:06.181225', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3248, 1, 'admin', 'Shieldon', 'Shieldon es el pokemon numero #410', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/410.png', 'fighting,ground,water', 1, '2018-11-16 05:59:06.28557', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3257, 1, 'admin', 'Kricketot', 'Kricketot es el pokemon numero #401', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/401.png', 'fire,flying,rock', 1, '2018-11-16 05:59:06.391261', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3266, 1, 'admin', 'Infernape', 'Infernape es el pokemon numero #392', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/392.png', 'flying,ground,psychic,water', 1, '2018-11-16 05:59:06.501588', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3275, 1, 'admin', 'Groudon', 'Groudon es el pokemon numero #383', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/383.png', 'grass,ice,water', 1, '2018-11-16 05:59:06.610616', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3284, 1, 'admin', 'Salamence', 'Salamence es el pokemon numero #373', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/373.png', 'ice,dragon,rock,fairy', 1, '2018-11-16 05:59:06.721734', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3294, 1, 'admin', 'Sealeo', 'Sealeo es el pokemon numero #364', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/364.png', 'electric,fighting,grass,rock', 1, '2018-11-16 05:59:06.828491', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3301, 1, 'admin', 'Dusclops', 'Dusclops es el pokemon numero #356', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/356.png', 'dark,ghost', 1, '2018-11-16 05:59:06.932432', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3309, 1, 'admin', 'Guzzlord', 'Guzzlord es el pokemon numero #799', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/799.png', 'fairy,fighting,bug,ice,dragon', 1, '2018-11-16 05:59:07.034971', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3319, 1, 'admin', 'Tapu Fini', 'Tapu Fini es el pokemon numero #788', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/788.png', 'grass,electric,poison', 1, '2018-11-16 05:59:07.144542', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3329, 1, 'admin', 'Minior', 'Minior es el pokemon numero #774', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/774.png', 'steel,water,electric,ice,rock', 1, '2018-11-16 05:59:07.24774', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3338, 1, 'admin', 'Bounsweet', 'Bounsweet es el pokemon numero #761', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/761.png', 'fire,flying,ice,poison,bug', 1, '2018-11-16 05:59:07.367838', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3348, 1, 'admin', 'Toxapex', 'Toxapex es el pokemon numero #748', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/748.png', 'psychic,electric,ground', 1, '2018-11-16 05:59:07.485596', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3358, 1, 'admin', 'Gumshoos', 'Gumshoos es el pokemon numero #735', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/735.png', 'fighting', 1, '2018-11-16 05:59:07.588888', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3367, 1, 'admin', 'Rowlet', 'Rowlet es el pokemon numero #722', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/722.png', 'fire,flying,ice,poison,rock', 1, '2018-11-16 05:59:07.692369', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3377, 1, 'admin', 'Trevenant', 'Trevenant es el pokemon numero #709', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/709.png', 'ghost,fire,flying,dark,ice', 1, '2018-11-16 05:59:07.796942', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3387, 1, 'admin', 'Tyrunt', 'Tyrunt es el pokemon numero #696', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/696.png', 'steel,ice,dragon,fighting,fairy,ground', 1, '2018-11-16 05:59:07.902013', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3029, 1, 'admin', 'Vanillish', 'Vanillish es el pokemon numero #583', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/583.png', 'fire,fighting,rock,steel', 1, '2018-11-16 05:59:03.613758', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3037, 1, 'admin', 'Foongus', 'Foongus es el pokemon numero #590', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/590.png', 'fire,ice,flying,psychic', 1, '2018-11-16 05:59:03.738308', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3046, 1, 'admin', 'Ferrothorn', 'Ferrothorn es el pokemon numero #598', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/598.png', 'fire,fighting', 1, '2018-11-16 05:59:03.849482', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3055, 1, 'admin', 'Litwick', 'Litwick es el pokemon numero #607', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/607.png', 'water,ground,rock,ghost,dark', 1, '2018-11-16 05:59:03.960597', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3064, 1, 'admin', 'Accelgor', 'Accelgor es el pokemon numero #617', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/617.png', 'fire,flying,rock', 1, '2018-11-16 05:59:04.071876', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3074, 1, 'admin', 'Mandibuzz', 'Mandibuzz es el pokemon numero #630', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/630.png', 'electric,ice,rock,fairy', 1, '2018-11-16 05:59:04.184797', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3084, 1, 'admin', 'Larvesta', 'Larvesta es el pokemon numero #636', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/636.png', 'rock,water,flying', 1, '2018-11-16 05:59:04.295959', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3094, 1, 'admin', 'Kyurem', 'Kyurem es el pokemon numero #646', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/646.png', 'fighting,rock,dragon,steel,fairy', 1, '2018-11-16 05:59:04.43249', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3105, 1, 'admin', 'Froakie', 'Froakie es el pokemon numero #656', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/656.png', 'grass,electric', 1, '2018-11-16 05:59:04.546791', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3116, 1, 'admin', 'Litleo', 'Litleo es el pokemon numero #667', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/667.png', 'rock,water,fighting,ground', 1, '2018-11-16 05:59:04.662593', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3126, 1, 'admin', 'Meowstic', 'Meowstic es el pokemon numero #678', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/678.png', 'ghost,dark,bug', 1, '2018-11-16 05:59:04.772849', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3136, 1, 'admin', 'Binacle', 'Binacle es el pokemon numero #688', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/688.png', 'electric,fighting,grass,ground', 1, '2018-11-16 05:59:04.893414', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3166, 1, 'admin', 'Kartana', 'Kartana es el pokemon numero #798', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/798.png', 'fire,fighting', 1, '2018-11-16 05:59:05.316321', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3176, 1, 'admin', 'Azelf', 'Azelf es el pokemon numero #482', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/482.png', 'bug,dark,ghost', 1, '2018-11-16 05:59:05.431949', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3188, 1, 'admin', 'Leafeon', 'Leafeon es el pokemon numero #470', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/470.png', 'bug,fire,flying,ice,poison', 1, '2018-11-16 05:59:05.540931', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3198, 1, 'admin', 'Abomasnow', 'Abomasnow es el pokemon numero #460', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/460.png', 'fire,bug,fighting,flying,poison,rock,steel', 1, '2018-11-16 05:59:05.652564', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3208, 1, 'admin', 'Hippowdon', 'Hippowdon es el pokemon numero #450', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/450.png', 'grass,ice,water', 1, '2018-11-16 05:59:05.763185', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3217, 1, 'admin', 'Happiny', 'Happiny es el pokemon numero #440', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/440.png', 'fighting', 1, '2018-11-16 05:59:05.875629', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3227, 1, 'admin', 'Glameow', 'Glameow es el pokemon numero #431', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/431.png', 'fighting', 1, '2018-11-16 05:59:05.9932', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3234, 1, 'admin', 'Shellos', 'Shellos es el pokemon numero #422', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/422.png', 'electric,grass', 1, '2018-11-16 05:59:06.107894', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3244, 1, 'admin', 'Wormadam', 'Wormadam es el pokemon numero #413', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/413.png', 'fire,flying,ice,poison,bug,rock', 1, '2018-11-16 05:59:06.242679', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3253, 1, 'admin', 'Luxray', 'Luxray es el pokemon numero #405', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/405.png', 'ground', 1, '2018-11-16 05:59:06.36106', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3262, 1, 'admin', 'Starly', 'Starly es el pokemon numero #396', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/396.png', 'electric,ice,rock', 1, '2018-11-16 05:59:06.47474', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3271, 1, 'admin', 'Deoxys', 'Deoxys es el pokemon numero #386', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/386.png', 'bug,dark,ghost', 1, '2018-11-16 05:59:06.585331', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3281, 1, 'admin', 'Regirock', 'Regirock es el pokemon numero #377', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/377.png', 'fighting,grass,ground,steel,water', 1, '2018-11-16 05:59:06.694602', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3291, 1, 'admin', 'Huntail', 'Huntail es el pokemon numero #367', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/367.png', 'electric,grass', 1, '2018-11-16 05:59:06.82079', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3302, 1, 'admin', 'Tropius', 'Tropius es el pokemon numero #357', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/357.png', 'ice,fire,flying,poison,rock', 1, '2018-11-16 05:59:06.934409', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3312, 1, 'admin', 'Celesteela', 'Celesteela es el pokemon numero #797', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/797.png', 'fire,electric', 1, '2018-11-16 05:59:07.045175', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3321, 1, 'admin', 'Kommo-o', 'Kommo-o es el pokemon numero #784', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/784.png', 'fairy,flying,psychic,ice,dragon', 1, '2018-11-16 05:59:07.158998', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3330, 1, 'admin', 'Type: Null', 'Type: Null es el pokemon numero #772', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/772.png', 'fighting', 1, '2018-11-16 05:59:07.288862', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3341, 1, 'admin', 'Stufful', 'Stufful es el pokemon numero #759', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/759.png', 'psychic,flying,fairy,fighting', 1, '2018-11-16 05:59:07.405932', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3350, 1, 'admin', 'Rockruff', 'Rockruff es el pokemon numero #744', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/744.png', 'water,steel,grass,fighting,ground', 1, '2018-11-16 05:59:07.516379', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3359, 1, 'admin', 'Trumbeak', 'Trumbeak es el pokemon numero #732', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/732.png', 'electric,ice,rock', 1, '2018-11-16 05:59:07.631989', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3369, 1, 'admin', 'Hoopa', 'Hoopa es el pokemon numero #720', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/720.png', 'ghost,dark', 1, '2018-11-16 05:59:07.743909', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3380, 1, 'admin', 'Sliggoo', 'Sliggoo es el pokemon numero #705', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/705.png', 'fairy,ice,dragon', 1, '2018-11-16 05:59:07.853944', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3390, 1, 'admin', 'Clauncher', 'Clauncher es el pokemon numero #692', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/692.png', 'grass,electric', 1, '2018-11-16 05:59:07.973925', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3044, 1, 'admin', 'Ferroseed', 'Ferroseed es el pokemon numero #597', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/597.png', 'fire,fighting', 1, '2018-11-16 05:59:03.820593', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3053, 1, 'admin', 'Elgyem', 'Elgyem es el pokemon numero #605', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/605.png', 'bug,ghost,dark', 1, '2018-11-16 05:59:03.93489', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3063, 1, 'admin', 'Cryogonal', 'Cryogonal es el pokemon numero #615', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/615.png', 'fire,fighting,rock,steel', 1, '2018-11-16 05:59:04.055352', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3073, 1, 'admin', 'Heatmor', 'Heatmor es el pokemon numero #631', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/631.png', 'water,ground,rock', 1, '2018-11-16 05:59:04.16668', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3083, 1, 'admin', 'Hydreigon', 'Hydreigon es el pokemon numero #635', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/635.png', 'ice,fighting,bug,dragon,fairy', 1, '2018-11-16 05:59:04.27706', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3093, 1, 'admin', 'Landorus', 'Landorus es el pokemon numero #645', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/645.png', 'ice,water', 1, '2018-11-16 05:59:04.388675', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3102, 1, 'admin', 'Delphox', 'Delphox es el pokemon numero #655', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/655.png', 'ghost,dark,water,rock,ground', 1, '2018-11-16 05:59:04.512348', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3111, 1, 'admin', 'Scatterbug', 'Scatterbug es el pokemon numero #664', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/664.png', 'fire,flying,rock', 1, '2018-11-16 05:59:04.621149', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3121, 1, 'admin', 'Gogoat', 'Gogoat es el pokemon numero #673', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/673.png', 'fire,flying,poison,ice,bug', 1, '2018-11-16 05:59:04.723364', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3130, 1, 'admin', 'Spritzee', 'Spritzee es el pokemon numero #682', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/682.png', 'steel,poison', 1, '2018-11-16 05:59:04.831055', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3139, 1, 'admin', 'Heliolisk', 'Heliolisk es el pokemon numero #695', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/695.png', 'fighting,ground', 1, '2018-11-16 05:59:04.938464', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3146, 1, 'admin', 'Volcanion', 'Volcanion es el pokemon numero #721', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/721.png', 'ground,electric,rock', 1, '2018-11-16 05:59:05.072708', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3155, 1, 'admin', 'Shiinotic', 'Shiinotic es el pokemon numero #756', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/756.png', 'steel,fire,flying,ice,poison', 1, '2018-11-16 05:59:05.180893', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3164, 1, 'admin', 'Solgaleo', 'Solgaleo es el pokemon numero #791', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/791.png', 'ghost,fire,dark,ground', 1, '2018-11-16 05:59:05.290829', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3174, 1, 'admin', 'Palkia', 'Palkia es el pokemon numero #484', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/484.png', 'dragon,fairy', 1, '2018-11-16 05:59:05.402677', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3184, 1, 'admin', 'Porygon-Z', 'Porygon-Z es el pokemon numero #474', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/474.png', 'fighting', 1, '2018-11-16 05:59:05.513388', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3194, 1, 'admin', 'Rhyperior', 'Rhyperior es el pokemon numero #464', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/464.png', 'grass,water,fighting,ground,ice,steel', 1, '2018-11-16 05:59:05.622665', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3202, 1, 'admin', 'Finneon', 'Finneon es el pokemon numero #456', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/456.png', 'electric,grass', 1, '2018-11-16 05:59:05.731841', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3212, 1, 'admin', 'Munchlax', 'Munchlax es el pokemon numero #446', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/446.png', 'fighting', 1, '2018-11-16 05:59:05.854173', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3222, 1, 'admin', 'Bronzor', 'Bronzor es el pokemon numero #436', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/436.png', 'fire,ground,ghost,dark', 1, '2018-11-16 05:59:05.967005', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3230, 1, 'admin', 'Lopunny', 'Lopunny es el pokemon numero #428', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/428.png', 'fighting', 1, '2018-11-16 05:59:06.075719', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3241, 1, 'admin', 'Buizel', 'Buizel es el pokemon numero #418', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/418.png', 'electric,grass', 1, '2018-11-16 05:59:06.201526', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3249, 1, 'admin', 'Rampardos', 'Rampardos es el pokemon numero #409', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/409.png', 'fighting,grass,ground,steel,water', 1, '2018-11-16 05:59:06.307807', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3258, 1, 'admin', 'Bibarel', 'Bibarel es el pokemon numero #400', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/400.png', 'electric,fighting,grass', 1, '2018-11-16 05:59:06.416646', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3267, 1, 'admin', 'Monferno', 'Monferno es el pokemon numero #391', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/391.png', 'flying,ground,psychic,water', 1, '2018-11-16 05:59:06.526221', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3277, 1, 'admin', 'Latios', 'Latios es el pokemon numero #381', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/381.png', 'bug,dark,dragon,ghost,ice,fairy', 1, '2018-11-16 05:59:06.640744', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3286, 1, 'admin', 'Bagon', 'Bagon es el pokemon numero #371', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/371.png', 'dragon,ice,fairy', 1, '2018-11-16 05:59:06.751315', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3296, 1, 'admin', 'Glalie', 'Glalie es el pokemon numero #362', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/362.png', 'fire,fighting,rock,steel', 1, '2018-11-16 05:59:06.86843', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3305, 1, 'admin', 'Stakataka', 'Stakataka es el pokemon numero #805', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/805.png', 'water,fighting,ground', 1, '2018-11-16 05:59:06.978838', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3315, 1, 'admin', 'Nihilego', 'Nihilego es el pokemon numero #793', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/793.png', 'steel,water,psychic,ground', 1, '2018-11-16 05:59:07.090099', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3325, 1, 'admin', 'Drampa', 'Drampa es el pokemon numero #780', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/780.png', 'fairy,fighting,ice,dragon', 1, '2018-11-16 05:59:07.200909', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3335, 1, 'admin', 'Passimian', 'Passimian es el pokemon numero #766', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/766.png', 'psychic,flying,fairy', 1, '2018-11-16 05:59:07.31903', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3346, 1, 'admin', 'Araquanid', 'Araquanid es el pokemon numero #752', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/752.png', 'flying,electric,rock', 1, '2018-11-16 05:59:07.424949', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3355, 1, 'admin', 'Vikavolt', 'Vikavolt es el pokemon numero #738', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/738.png', 'fire,rock', 1, '2018-11-16 05:59:07.538579', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3365, 1, 'admin', 'Torracat', 'Torracat es el pokemon numero #726', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/726.png', 'water,ground,rock', 1, '2018-11-16 05:59:07.649958', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3374, 1, 'admin', 'Bergmite', 'Bergmite es el pokemon numero #712', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/712.png', 'fire,steel,fighting,rock', 1, '2018-11-16 05:59:07.763305', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3384, 1, 'admin', 'Hawlucha', 'Hawlucha es el pokemon numero #701', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/701.png', 'electric,psychic,flying,ice,fairy', 1, '2018-11-16 05:59:07.878199', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3047, 1, 'admin', 'Klink', 'Klink es el pokemon numero #599', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/599.png', 'fire,fighting,ground', 1, '2018-11-16 05:59:03.861518', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3056, 1, 'admin', 'Lampent', 'Lampent es el pokemon numero #608', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/608.png', 'water,ground,rock,ghost,dark', 1, '2018-11-16 05:59:03.97913', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3066, 1, 'admin', 'Stunfisk', 'Stunfisk es el pokemon numero #618', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/618.png', 'water,grass,ice,ground', 1, '2018-11-16 05:59:04.098734', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3076, 1, 'admin', 'Braviary', 'Braviary es el pokemon numero #628', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/628.png', 'electric,ice,rock', 1, '2018-11-16 05:59:04.223204', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3088, 1, 'admin', 'Terrakion', 'Terrakion es el pokemon numero #639', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/639.png', 'water,grass,fighting,ground,steel,psychic,fairy', 1, '2018-11-16 05:59:04.340812', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3097, 1, 'admin', 'Chespin', 'Chespin es el pokemon numero #650', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/650.png', 'fire,flying,poison,ice,bug', 1, '2018-11-16 05:59:04.462996', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3108, 1, 'admin', 'Diggersby', 'Diggersby es el pokemon numero #660', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/660.png', 'water,grass,ice,fighting', 1, '2018-11-16 05:59:04.580327', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3118, 1, 'admin', 'Floette', 'Floette es el pokemon numero #670', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/670.png', 'steel,poison', 1, '2018-11-16 05:59:04.703628', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3127, 1, 'admin', 'Doublade', 'Doublade es el pokemon numero #680', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/680.png', 'fire,ghost,dark,ground', 1, '2018-11-16 05:59:04.816482', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3138, 1, 'admin', 'Dragalge', 'Dragalge es el pokemon numero #691', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/691.png', 'psychic,dragon,ice,ground', 1, '2018-11-16 05:59:04.938077', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3152, 1, 'admin', 'Toucannon', 'Toucannon es el pokemon numero #733', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/733.png', 'electric,ice,rock', 1, '2018-11-16 05:59:05.115459', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3161, 1, 'admin', 'Bruxish', 'Bruxish es el pokemon numero #779', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/779.png', 'ghost,dark,grass,electric,bug', 1, '2018-11-16 05:59:05.235446', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3171, 1, 'admin', 'Giratina', 'Giratina es el pokemon numero #487', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/487.png', 'dark,dragon,ghost,ice,fairy', 1, '2018-11-16 05:59:05.353379', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3181, 1, 'admin', 'Dusknoir', 'Dusknoir es el pokemon numero #477', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/477.png', 'dark,ghost', 1, '2018-11-16 05:59:05.469913', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3191, 1, 'admin', 'Magmortar', 'Magmortar es el pokemon numero #467', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/467.png', 'ground,rock,water', 1, '2018-11-16 05:59:05.599855', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3201, 1, 'admin', 'Lumineon', 'Lumineon es el pokemon numero #457', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/457.png', 'electric,grass', 1, '2018-11-16 05:59:05.714535', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3211, 1, 'admin', 'Riolu', 'Riolu es el pokemon numero #447', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/447.png', 'flying,psychic,fairy', 1, '2018-11-16 05:59:05.842415', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3220, 1, 'admin', 'Bronzong', 'Bronzong es el pokemon numero #437', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/437.png', 'fire,ground,ghost,dark', 1, '2018-11-16 05:59:05.962455', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3232, 1, 'admin', 'Drifblim', 'Drifblim es el pokemon numero #426', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/426.png', 'dark,electric,ghost,ice,rock', 1, '2018-11-16 05:59:06.083593', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3242, 1, 'admin', 'Vespiquen', 'Vespiquen es el pokemon numero #416', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/416.png', 'rock,electric,fire,flying,ice', 1, '2018-11-16 05:59:06.209928', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3252, 1, 'admin', 'Roserade', 'Roserade es el pokemon numero #407', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/407.png', 'fire,flying,ice,psychic', 1, '2018-11-16 05:59:06.323131', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3261, 1, 'admin', 'Staravia', 'Staravia es el pokemon numero #397', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/397.png', 'electric,ice,rock', 1, '2018-11-16 05:59:06.45775', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3272, 1, 'admin', 'Turtwig', 'Turtwig es el pokemon numero #387', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/387.png', 'bug,fire,flying,ice,poison', 1, '2018-11-16 05:59:06.588213', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3282, 1, 'admin', 'Metagross', 'Metagross es el pokemon numero #376', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/376.png', 'fire,ground,ghost,dark', 1, '2018-11-16 05:59:06.69756', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3292, 1, 'admin', 'Clamperl', 'Clamperl es el pokemon numero #366', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/366.png', 'electric,grass', 1, '2018-11-16 05:59:06.823708', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3303, 1, 'admin', 'Duskull', 'Duskull es el pokemon numero #355', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/355.png', 'dark,ghost', 1, '2018-11-16 05:59:06.937371', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3314, 1, 'admin', 'Xurkitree', 'Xurkitree es el pokemon numero #796', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/796.png', 'ground', 1, '2018-11-16 05:59:07.061102', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3324, 1, 'admin', 'Dhelmise', 'Dhelmise es el pokemon numero #781', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/781.png', 'ghost,fire,flying,dark,ice', 1, '2018-11-16 05:59:07.187507', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3334, 1, 'admin', 'Golisopod', 'Golisopod es el pokemon numero #768', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/768.png', 'flying,electric,rock', 1, '2018-11-16 05:59:07.302651', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3343, 1, 'admin', 'Lurantis', 'Lurantis es el pokemon numero #754', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/754.png', 'fire,flying,ice,poison,bug', 1, '2018-11-16 05:59:07.414127', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3354, 1, 'admin', 'Cutiefly', 'Cutiefly es el pokemon numero #742', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/742.png', 'fire,steel,flying,poison,rock', 1, '2018-11-16 05:59:07.531015', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3364, 1, 'admin', 'Incineroar', 'Incineroar es el pokemon numero #727', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/727.png', 'water,ground,fighting,rock', 1, '2018-11-16 05:59:07.644019', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3373, 1, 'admin', 'Avalugg', 'Avalugg es el pokemon numero #713', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/713.png', 'fire,steel,fighting,rock', 1, '2018-11-16 05:59:07.759935', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3383, 1, 'admin', 'Sylveon', 'Sylveon es el pokemon numero #700', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/700.png', 'steel,poison', 1, '2018-11-16 05:59:07.877633', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3061, 1, 'admin', 'Cubchoo', 'Cubchoo es el pokemon numero #613', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/613.png', 'fire,fighting,rock,steel', 1, '2018-11-16 05:59:04.001989', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3070, 1, 'admin', 'Golurk', 'Golurk es el pokemon numero #623', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/623.png', 'water,grass,ice,ghost,dark', 1, '2018-11-16 05:59:04.127322', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3079, 1, 'admin', 'Pawniard', 'Pawniard es el pokemon numero #624', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/624.png', 'fighting,fire,ground', 1, '2018-11-16 05:59:04.236951', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3089, 1, 'admin', 'Tornadus', 'Tornadus es el pokemon numero #641', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/641.png', 'electric,ice,rock', 1, '2018-11-16 05:59:04.348978', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3099, 1, 'admin', 'Quilladin', 'Quilladin es el pokemon numero #651', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/651.png', 'fire,flying,poison,ice,bug', 1, '2018-11-16 05:59:04.479856', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3109, 1, 'admin', 'Fletchling', 'Fletchling es el pokemon numero #661', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/661.png', 'ice,electric,rock', 1, '2018-11-16 05:59:04.591164', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3119, 1, 'admin', 'Florges', 'Florges es el pokemon numero #671', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/671.png', 'steel,poison', 1, '2018-11-16 05:59:04.715002', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3129, 1, 'admin', 'Aegislash', 'Aegislash es el pokemon numero #681', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/681.png', 'fire,ghost,dark,ground', 1, '2018-11-16 05:59:04.82903', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3137, 1, 'admin', 'Aurorus', 'Aurorus es el pokemon numero #699', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/699.png', 'steel,fighting,water,rock,grass,ground', 1, '2018-11-16 05:59:04.936052', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3147, 1, 'admin', 'Litten', 'Litten es el pokemon numero #725', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/725.png', 'water,ground,rock', 1, '2018-11-16 05:59:05.083918', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3156, 1, 'admin', 'Bewear', 'Bewear es el pokemon numero #760', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/760.png', 'psychic,flying,fairy,fighting', 1, '2018-11-16 05:59:05.195704', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3165, 1, 'admin', 'Buzzwole', 'Buzzwole es el pokemon numero #794', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/794.png', 'fire,psychic,flying,fairy', 1, '2018-11-16 05:59:05.309934', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3175, 1, 'admin', 'Dialga', 'Dialga es el pokemon numero #483', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/483.png', 'fighting,ground', 1, '2018-11-16 05:59:05.41918', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3185, 1, 'admin', 'Mamoswine', 'Mamoswine es el pokemon numero #473', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/473.png', 'fighting,fire,grass,steel,water', 1, '2018-11-16 05:59:05.529466', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3195, 1, 'admin', 'Lickilicky', 'Lickilicky es el pokemon numero #463', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/463.png', 'fighting', 1, '2018-11-16 05:59:05.643384', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3207, 1, 'admin', 'Skorupi', 'Skorupi es el pokemon numero #451', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/451.png', 'fire,flying,psychic,rock', 1, '2018-11-16 05:59:05.755943', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3218, 1, 'admin', 'Chatot', 'Chatot es el pokemon numero #441', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/441.png', 'electric,ice,rock', 1, '2018-11-16 05:59:05.87667', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3228, 1, 'admin', 'Honchkrow', 'Honchkrow es el pokemon numero #430', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/430.png', 'electric,ice,rock,fairy', 1, '2018-11-16 05:59:05.994066', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3236, 1, 'admin', 'Cherubi', 'Cherubi es el pokemon numero #420', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/420.png', 'bug,fire,flying,ice,poison', 1, '2018-11-16 05:59:06.108741', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3245, 1, 'admin', 'Burmy', 'Burmy es el pokemon numero #412', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/412.png', 'fire,flying,rock', 1, '2018-11-16 05:59:06.243514', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3254, 1, 'admin', 'Luxio', 'Luxio es el pokemon numero #404', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/404.png', 'ground', 1, '2018-11-16 05:59:06.361862', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3263, 1, 'admin', 'Empoleon', 'Empoleon es el pokemon numero #395', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/395.png', 'electric,fighting,ground', 1, '2018-11-16 05:59:06.475565', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3273, 1, 'admin', 'Jirachi', 'Jirachi es el pokemon numero #385', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/385.png', 'fire,ground,ghost,dark', 1, '2018-11-16 05:59:06.599979', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3283, 1, 'admin', 'Metang', 'Metang es el pokemon numero #375', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/375.png', 'fire,ground,ghost,dark', 1, '2018-11-16 05:59:06.711631', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3293, 1, 'admin', 'Walrein', 'Walrein es el pokemon numero #365', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/365.png', 'electric,fighting,grass,rock', 1, '2018-11-16 05:59:06.82784', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3304, 1, 'admin', 'Banette', 'Banette es el pokemon numero #354', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/354.png', 'dark,ghost', 1, '2018-11-16 05:59:06.948197', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3313, 1, 'admin', 'Pheromosa', 'Pheromosa es el pokemon numero #795', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/795.png', 'fire,psychic,flying,fairy', 1, '2018-11-16 05:59:07.059944', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3323, 1, 'admin', 'Jangmo-o', 'Jangmo-o es el pokemon numero #782', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/782.png', 'fairy,ice,dragon', 1, '2018-11-16 05:59:07.185493', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3333, 1, 'admin', 'Sandygast', 'Sandygast es el pokemon numero #769', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/769.png', 'ghost,dark,grass,water,ice', 1, '2018-11-16 05:59:07.300579', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3342, 1, 'admin', 'Morelull', 'Morelull es el pokemon numero #755', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/755.png', 'steel,fire,flying,ice,poison', 1, '2018-11-16 05:59:07.412348', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3352, 1, 'admin', 'Ribombee', 'Ribombee es el pokemon numero #743', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/743.png', 'fire,steel,flying,poison,rock', 1, '2018-11-16 05:59:07.523914', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3363, 1, 'admin', 'Primarina', 'Primarina es el pokemon numero #730', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/730.png', 'grass,electric,poison', 1, '2018-11-16 05:59:07.641527', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3372, 1, 'admin', 'Xerneas', 'Xerneas es el pokemon numero #716', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/716.png', 'steel,poison', 1, '2018-11-16 05:59:07.752728', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3381, 1, 'admin', 'Carbink', 'Carbink es el pokemon numero #703', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/703.png', 'steel,water,grass,ground', 1, '2018-11-16 05:59:07.865425', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3391, 1, 'admin', 'Skrelp', 'Skrelp es el pokemon numero #690', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/690.png', 'psychic,electric,ground', 1, '2018-11-16 05:59:07.974604', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3065, 1, 'admin', 'Shelmet', 'Shelmet es el pokemon numero #616', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/616.png', 'fire,flying,rock', 1, '2018-11-16 05:59:04.077065', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3075, 1, 'admin', 'Vullaby', 'Vullaby es el pokemon numero #629', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/629.png', 'electric,ice,rock,fairy', 1, '2018-11-16 05:59:04.222116', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3087, 1, 'admin', 'Volcarona', 'Volcarona es el pokemon numero #637', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/637.png', 'rock,water,flying', 1, '2018-11-16 05:59:04.339957', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3098, 1, 'admin', 'Genesect', 'Genesect es el pokemon numero #649', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/649.png', 'fire', 1, '2018-11-16 05:59:04.464241', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3107, 1, 'admin', 'Bunnelby', 'Bunnelby es el pokemon numero #659', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/659.png', 'fighting', 1, '2018-11-16 05:59:04.580018', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3117, 1, 'admin', 'Flabébé', 'Flabébé es el pokemon numero #669', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/669.png', 'steel,poison', 1, '2018-11-16 05:59:04.699827', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3128, 1, 'admin', 'Honedge', 'Honedge es el pokemon numero #679', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/679.png', 'fire,ghost,dark,ground', 1, '2018-11-16 05:59:04.819774', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3140, 1, 'admin', 'Barbaracle', 'Barbaracle es el pokemon numero #689', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/689.png', 'electric,fighting,grass,ground', 1, '2018-11-16 05:59:04.940464', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3148, 1, 'admin', 'Brionne', 'Brionne es el pokemon numero #729', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/729.png', 'grass,electric', 1, '2018-11-16 05:59:05.095091', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3157, 1, 'admin', 'Comfey', 'Comfey es el pokemon numero #764', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/764.png', 'steel,poison', 1, '2018-11-16 05:59:05.214097', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3169, 1, 'admin', 'Marshadow', 'Marshadow es el pokemon numero #802', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/802.png', 'ghost,psychic,flying,fairy', 1, '2018-11-16 05:59:05.338888', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3180, 1, 'admin', 'Rotom', 'Rotom es el pokemon numero #479', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/479.png', 'ghost,dark', 1, '2018-11-16 05:59:05.460281', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3189, 1, 'admin', 'Yanmega', 'Yanmega es el pokemon numero #469', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/469.png', 'rock,electric,fire,flying,ice', 1, '2018-11-16 05:59:05.584994', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3199, 1, 'admin', 'Snover', 'Snover es el pokemon numero #459', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/459.png', 'fire,bug,fighting,flying,poison,rock,steel', 1, '2018-11-16 05:59:05.705379', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3210, 1, 'admin', 'Hippopotas', 'Hippopotas es el pokemon numero #449', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/449.png', 'grass,ice,water', 1, '2018-11-16 05:59:05.836187', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3223, 1, 'admin', 'Bonsly', 'Bonsly es el pokemon numero #438', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/438.png', 'fighting,grass,ground,steel,water', 1, '2018-11-16 05:59:05.971008', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3237, 1, 'admin', 'Drifloon', 'Drifloon es el pokemon numero #425', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/425.png', 'dark,electric,ghost,ice,rock', 1, '2018-11-16 05:59:06.109856', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3246, 1, 'admin', 'Mothim', 'Mothim es el pokemon numero #414', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/414.png', 'rock,electric,fire,flying,ice', 1, '2018-11-16 05:59:06.254702', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3255, 1, 'admin', 'Shinx', 'Shinx es el pokemon numero #403', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/403.png', 'ground', 1, '2018-11-16 05:59:06.373075', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3264, 1, 'admin', 'Prinplup', 'Prinplup es el pokemon numero #394', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/394.png', 'electric,grass', 1, '2018-11-16 05:59:06.491189', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3274, 1, 'admin', 'Rayquaza', 'Rayquaza es el pokemon numero #384', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/384.png', 'ice,dragon,rock,fairy', 1, '2018-11-16 05:59:06.611139', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3285, 1, 'admin', 'Beldum', 'Beldum es el pokemon numero #374', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/374.png', 'fire,ground,ghost,dark', 1, '2018-11-16 05:59:06.735748', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3295, 1, 'admin', 'Spheal', 'Spheal es el pokemon numero #363', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/363.png', 'electric,fighting,grass,rock', 1, '2018-11-16 05:59:06.85764', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3306, 1, 'admin', 'Zeraora', 'Zeraora es el pokemon numero #807', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/807.png', 'ground', 1, '2018-11-16 05:59:06.979387', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3316, 1, 'admin', 'Lunala', 'Lunala es el pokemon numero #792', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/792.png', 'ghost,dark', 1, '2018-11-16 05:59:07.099211', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3327, 1, 'admin', 'Mimikyu', 'Mimikyu es el pokemon numero #778', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/778.png', 'ghost,steel', 1, '2018-11-16 05:59:07.222058', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3337, 1, 'admin', 'Tsareena', 'Tsareena es el pokemon numero #763', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/763.png', 'fire,flying,ice,poison,bug', 1, '2018-11-16 05:59:07.345379', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3347, 1, 'admin', 'Mudsdale', 'Mudsdale es el pokemon numero #750', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/750.png', 'water,grass,ice', 1, '2018-11-16 05:59:07.45852', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3357, 1, 'admin', 'Grubbin', 'Grubbin es el pokemon numero #736', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/736.png', 'fire,flying,rock', 1, '2018-11-16 05:59:07.578743', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3368, 1, 'admin', 'Dartrix', 'Dartrix es el pokemon numero #723', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/723.png', 'fire,flying,ice,poison,rock', 1, '2018-11-16 05:59:07.697415', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3378, 1, 'admin', 'Phantump', 'Phantump es el pokemon numero #708', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/708.png', 'ghost,fire,flying,dark,ice', 1, '2018-11-16 05:59:07.819553', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3388, 1, 'admin', 'Helioptile', 'Helioptile es el pokemon numero #694', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/694.png', 'fighting,ground', 1, '2018-11-16 05:59:07.948989', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3068, 1, 'admin', 'Mienfoo', 'Mienfoo es el pokemon numero #619', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/619.png', 'flying,psychic,fairy', 1, '2018-11-16 05:59:04.120107', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3080, 1, 'admin', 'Bisharp', 'Bisharp es el pokemon numero #625', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/625.png', 'fighting,fire,ground', 1, '2018-11-16 05:59:04.248121', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3091, 1, 'admin', 'Thundurus', 'Thundurus es el pokemon numero #642', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/642.png', 'ice,rock', 1, '2018-11-16 05:59:04.367909', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3101, 1, 'admin', 'Fennekin', 'Fennekin es el pokemon numero #653', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/653.png', 'water,rock,ground', 1, '2018-11-16 05:59:04.502976', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3112, 1, 'admin', 'Talonflame', 'Talonflame es el pokemon numero #663', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/663.png', 'water,rock,electric', 1, '2018-11-16 05:59:04.622617', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3122, 1, 'admin', 'Pancham', 'Pancham es el pokemon numero #674', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/674.png', 'psychic,flying,fairy', 1, '2018-11-16 05:59:04.741388', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3133, 1, 'admin', 'Swirlix', 'Swirlix es el pokemon numero #684', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/684.png', 'steel,poison', 1, '2018-11-16 05:59:04.861535', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3144, 1, 'admin', 'Pumpkaboo', 'Pumpkaboo es el pokemon numero #710', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/710.png', 'ghost,fire,flying,dark,ice', 1, '2018-11-16 05:59:04.980759', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3153, 1, 'admin', 'Mudbray', 'Mudbray es el pokemon numero #749', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/749.png', 'water,grass,ice', 1, '2018-11-16 05:59:05.120567', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3162, 1, 'admin', 'Hakamo-o', 'Hakamo-o es el pokemon numero #783', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/783.png', 'fairy,flying,psychic,ice,dragon', 1, '2018-11-16 05:59:05.253366', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3172, 1, 'admin', 'Regigigas', 'Regigigas es el pokemon numero #486', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/486.png', 'fighting', 1, '2018-11-16 05:59:05.370646', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3182, 1, 'admin', 'Probopass', 'Probopass es el pokemon numero #476', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/476.png', 'fighting,ground,water', 1, '2018-11-16 05:59:05.499875', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3192, 1, 'admin', 'Electivire', 'Electivire es el pokemon numero #466', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/466.png', 'ground', 1, '2018-11-16 05:59:05.619667', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3203, 1, 'admin', 'Carnivine', 'Carnivine es el pokemon numero #455', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/455.png', 'bug,fire,flying,ice,poison', 1, '2018-11-16 05:59:05.736364', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3214, 1, 'admin', 'Garchomp', 'Garchomp es el pokemon numero #445', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/445.png', 'ice,dragon,fairy', 1, '2018-11-16 05:59:05.868822', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3225, 1, 'admin', 'Chingling', 'Chingling es el pokemon numero #433', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/433.png', 'bug,dark,ghost', 1, '2018-11-16 05:59:05.990994', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3235, 1, 'admin', 'Gastrodon', 'Gastrodon es el pokemon numero #423', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/423.png', 'grass', 1, '2018-11-16 05:59:06.108393', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3268, 1, 'admin', 'Chimchar', 'Chimchar es el pokemon numero #390', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/390.png', 'ground,rock,water', 1, '2018-11-16 05:59:06.547823', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3279, 1, 'admin', 'Latias', 'Latias es el pokemon numero #380', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/380.png', 'bug,dark,dragon,ghost,ice,fairy', 1, '2018-11-16 05:59:06.666036', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3289, 1, 'admin', 'Relicanth', 'Relicanth es el pokemon numero #369', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/369.png', 'grass,electric,fighting,ground', 1, '2018-11-16 05:59:06.793032', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3299, 1, 'admin', 'Absol', 'Absol es el pokemon numero #359', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/359.png', 'fighting,bug,fairy', 1, '2018-11-16 05:59:06.912962', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3310, 1, 'admin', 'Magearna', 'Magearna es el pokemon numero #801', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/801.png', 'fire,ground', 1, '2018-11-16 05:59:07.036051', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3322, 1, 'admin', 'Tapu Lele', 'Tapu Lele es el pokemon numero #786', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/786.png', 'ghost,steel,poison', 1, '2018-11-16 05:59:07.160428', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3332, 1, 'admin', 'Palossand', 'Palossand es el pokemon numero #770', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/770.png', 'ghost,dark,grass,water,ice', 1, '2018-11-16 05:59:07.296326', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3344, 1, 'admin', 'Salandit', 'Salandit es el pokemon numero #757', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/757.png', 'water,psychic,ground,rock', 1, '2018-11-16 05:59:07.41775', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3356, 1, 'admin', 'Crabominable', 'Crabominable es el pokemon numero #740', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/740.png', 'steel,fire,psychic,flying,fighting,fairy', 1, '2018-11-16 05:59:07.540595', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3366, 1, 'admin', 'Decidueye', 'Decidueye es el pokemon numero #724', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/724.png', 'ghost,fire,flying,dark,ice', 1, '2018-11-16 05:59:07.661338', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3376, 1, 'admin', 'Gourgeist', 'Gourgeist es el pokemon numero #711', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/711.png', 'ghost,fire,flying,dark,ice', 1, '2018-11-16 05:59:07.782195', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3386, 1, 'admin', 'Tyrantrum', 'Tyrantrum es el pokemon numero #697', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/697.png', 'steel,ice,dragon,fighting,fairy,ground', 1, '2018-11-16 05:59:07.902117', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3100, 1, 'admin', 'Chesnaught', 'Chesnaught es el pokemon numero #652', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/652.png', 'fire,psychic,flying,poison,ice,fairy', 1, '2018-11-16 05:59:04.4822', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3110, 1, 'admin', 'Fletchinder', 'Fletchinder es el pokemon numero #662', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/662.png', 'water,rock,electric', 1, '2018-11-16 05:59:04.600303', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3120, 1, 'admin', 'Skiddo', 'Skiddo es el pokemon numero #672', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/672.png', 'fire,flying,poison,ice,bug', 1, '2018-11-16 05:59:04.722772', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3131, 1, 'admin', 'Aromatisse', 'Aromatisse es el pokemon numero #683', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/683.png', 'steel,poison', 1, '2018-11-16 05:59:04.840194', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3141, 1, 'admin', 'Dedenne', 'Dedenne es el pokemon numero #702', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/702.png', 'poison,ground', 1, '2018-11-16 05:59:04.958644', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3151, 1, 'admin', 'Charjabug', 'Charjabug es el pokemon numero #737', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/737.png', 'fire,rock', 1, '2018-11-16 05:59:05.115001', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3160, 1, 'admin', 'Komala', 'Komala es el pokemon numero #775', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/775.png', 'fighting', 1, '2018-11-16 05:59:05.228236', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3170, 1, 'admin', 'Cresselia', 'Cresselia es el pokemon numero #488', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/488.png', 'bug,dark,ghost', 1, '2018-11-16 05:59:05.344651', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3179, 1, 'admin', 'Froslass', 'Froslass es el pokemon numero #478', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/478.png', 'dark,fire,ghost,rock,steel', 1, '2018-11-16 05:59:05.460435', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3190, 1, 'admin', 'Togekiss', 'Togekiss es el pokemon numero #468', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/468.png', 'electric,ice,rock,steel,poison', 1, '2018-11-16 05:59:05.588782', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3200, 1, 'admin', 'Mantyke', 'Mantyke es el pokemon numero #458', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/458.png', 'electric,rock', 1, '2018-11-16 05:59:05.705942', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3209, 1, 'admin', 'Lucario', 'Lucario es el pokemon numero #448', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/448.png', 'fighting,fire,ground', 1, '2018-11-16 05:59:05.82687', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3219, 1, 'admin', 'Mime Jr.', 'Mime Jr. es el pokemon numero #439', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/439.png', 'ghost,steel,poison', 1, '2018-11-16 05:59:05.961735', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3231, 1, 'admin', 'Buneary', 'Buneary es el pokemon numero #427', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/427.png', 'fighting', 1, '2018-11-16 05:59:06.083087', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3240, 1, 'admin', 'Pachirisu', 'Pachirisu es el pokemon numero #417', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/417.png', 'ground', 1, '2018-11-16 05:59:06.201011', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3250, 1, 'admin', 'Cranidos', 'Cranidos es el pokemon numero #408', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/408.png', 'fighting,grass,ground,steel,water', 1, '2018-11-16 05:59:06.316935', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3260, 1, 'admin', 'Staraptor', 'Staraptor es el pokemon numero #398', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/398.png', 'electric,ice,rock', 1, '2018-11-16 05:59:06.457226', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3270, 1, 'admin', 'Grotle', 'Grotle es el pokemon numero #388', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/388.png', 'bug,fire,flying,ice,poison', 1, '2018-11-16 05:59:06.574635', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3280, 1, 'admin', 'Regice', 'Regice es el pokemon numero #378', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/378.png', 'fire,fighting,rock,steel', 1, '2018-11-16 05:59:06.691501', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3290, 1, 'admin', 'Gorebyss', 'Gorebyss es el pokemon numero #368', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/368.png', 'electric,grass', 1, '2018-11-16 05:59:06.810914', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3300, 1, 'admin', 'Chimecho', 'Chimecho es el pokemon numero #358', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/358.png', 'bug,dark,ghost', 1, '2018-11-16 05:59:06.924668', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3311, 1, 'admin', 'Necrozma', 'Necrozma es el pokemon numero #800', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/800.png', 'ghost,dark,bug', 1, '2018-11-16 05:59:07.039692', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3320, 1, 'admin', 'Tapu Koko', 'Tapu Koko es el pokemon numero #785', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/785.png', 'poison,ground', 1, '2018-11-16 05:59:07.155788', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3331, 1, 'admin', 'Silvally', 'Silvally es el pokemon numero #773', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/773.png', 'fighting', 1, '2018-11-16 05:59:07.291569', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3340, 1, 'admin', 'Salazzle', 'Salazzle es el pokemon numero #758', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/758.png', 'water,psychic,ground,rock', 1, '2018-11-16 05:59:07.40322', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3351, 1, 'admin', 'Wishiwashi', 'Wishiwashi es el pokemon numero #746', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/746.png', 'grass,electric', 1, '2018-11-16 05:59:07.519063', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3360, 1, 'admin', 'Pikipek', 'Pikipek es el pokemon numero #731', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/731.png', 'electric,ice,rock', 1, '2018-11-16 05:59:07.634716', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3371, 1, 'admin', 'Yveltal', 'Yveltal es el pokemon numero #717', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/717.png', 'electric,ice,rock,fairy', 1, '2018-11-16 05:59:07.749389', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3382, 1, 'admin', 'Goomy', 'Goomy es el pokemon numero #704', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/704.png', 'fairy,ice,dragon', 1, '2018-11-16 05:59:07.867246', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3103, 1, 'admin', 'Braixen', 'Braixen es el pokemon numero #654', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/654.png', 'water,rock,ground', 1, '2018-11-16 05:59:04.518499', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3113, 1, 'admin', 'Spewpa', 'Spewpa es el pokemon numero #665', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/665.png', 'fire,flying,rock', 1, '2018-11-16 05:59:04.638685', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3124, 1, 'admin', 'Pangoro', 'Pangoro es el pokemon numero #675', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/675.png', 'flying,fairy,fighting', 1, '2018-11-16 05:59:04.762463', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3135, 1, 'admin', 'Malamar', 'Malamar es el pokemon numero #687', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/687.png', 'fairy,bug', 1, '2018-11-16 05:59:04.883421', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3145, 1, 'admin', 'Zygarde', 'Zygarde es el pokemon numero #718', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/718.png', 'fairy,ice,dragon', 1, '2018-11-16 05:59:05.005948', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3154, 1, 'admin', 'Fomantis', 'Fomantis es el pokemon numero #753', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/753.png', 'fire,flying,ice,poison,bug', 1, '2018-11-16 05:59:05.130461', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3163, 1, 'admin', 'Tapu Bulu', 'Tapu Bulu es el pokemon numero #787', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/787.png', 'steel,fire,flying,ice,poison', 1, '2018-11-16 05:59:05.262007', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3173, 1, 'admin', 'Heatran', 'Heatran es el pokemon numero #485', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/485.png', 'ground,fighting,water', 1, '2018-11-16 05:59:05.381998', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3183, 1, 'admin', 'Gallade', 'Gallade es el pokemon numero #475', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/475.png', 'flying,ghost,fairy', 1, '2018-11-16 05:59:05.501473', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3193, 1, 'admin', 'Tangrowth', 'Tangrowth es el pokemon numero #465', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/465.png', 'bug,fire,flying,ice,poison', 1, '2018-11-16 05:59:05.621319', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3204, 1, 'admin', 'Toxicroak', 'Toxicroak es el pokemon numero #454', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/454.png', 'psychic,flying,ground', 1, '2018-11-16 05:59:05.744863', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3216, 1, 'admin', 'Gabite', 'Gabite es el pokemon numero #444', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/444.png', 'ice,dragon,fairy', 1, '2018-11-16 05:59:05.870982', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3226, 1, 'admin', 'Purugly', 'Purugly es el pokemon numero #432', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/432.png', 'fighting', 1, '2018-11-16 05:59:05.992609', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3238, 1, 'admin', 'Cherrim', 'Cherrim es el pokemon numero #421', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/421.png', 'bug,fire,flying,ice,poison', 1, '2018-11-16 05:59:06.117119', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3247, 1, 'admin', 'Bastiodon', 'Bastiodon es el pokemon numero #411', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/411.png', 'fighting,ground,water', 1, '2018-11-16 05:59:06.262225', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3256, 1, 'admin', 'Kricketune', 'Kricketune es el pokemon numero #402', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/402.png', 'fire,flying,rock', 1, '2018-11-16 05:59:06.381405', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3265, 1, 'admin', 'Piplup', 'Piplup es el pokemon numero #393', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/393.png', 'electric,grass', 1, '2018-11-16 05:59:06.500787', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3276, 1, 'admin', 'Kyogre', 'Kyogre es el pokemon numero #382', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/382.png', 'electric,grass', 1, '2018-11-16 05:59:06.634012', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3287, 1, 'admin', 'Shelgon', 'Shelgon es el pokemon numero #372', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/372.png', 'dragon,ice,fairy', 1, '2018-11-16 05:59:06.756465', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3297, 1, 'admin', 'Snorunt', 'Snorunt es el pokemon numero #361', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/361.png', 'fire,fighting,rock,steel', 1, '2018-11-16 05:59:06.878067', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3307, 1, 'admin', 'Naganadel', 'Naganadel es el pokemon numero #804', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/804.png', 'psychic,ground,ice,dragon', 1, '2018-11-16 05:59:06.997853', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3318, 1, 'admin', 'Cosmog', 'Cosmog es el pokemon numero #789', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/789.png', 'ghost,dark,bug', 1, '2018-11-16 05:59:07.121809', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3328, 1, 'admin', 'Turtonator', 'Turtonator es el pokemon numero #776', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/776.png', 'ground,rock,dragon', 1, '2018-11-16 05:59:07.242029', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3339, 1, 'admin', 'Steenee', 'Steenee es el pokemon numero #762', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/762.png', 'fire,flying,ice,poison,bug', 1, '2018-11-16 05:59:07.378958', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3349, 1, 'admin', 'Mareanie', 'Mareanie es el pokemon numero #747', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/747.png', 'psychic,electric,ground', 1, '2018-11-16 05:59:07.49845', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3362, 1, 'admin', 'Yungoos', 'Yungoos es el pokemon numero #734', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/734.png', 'fighting', 1, '2018-11-16 05:59:07.641729', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3375, 1, 'admin', 'Noivern', 'Noivern es el pokemon numero #715', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/715.png', 'fairy,dragon,ice,rock', 1, '2018-11-16 05:59:07.766072', NULL);
INSERT INTO public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") VALUES (3385, 1, 'admin', 'Amaura', 'Amaura es el pokemon numero #698', 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/698.png', 'steel,fighting,water,rock,grass,ground', 1, '2018-11-16 05:59:07.887674', NULL);


--
-- Data for Name: RepositoryAuthors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."RepositoryAuthors" (id, "idRepository", "idAuthor") VALUES (6, 2585, 3);
INSERT INTO public."RepositoryAuthors" (id, "idRepository", "idAuthor") VALUES (7, 2585, 3);


--
-- Data for Name: RepositoryComment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."RepositoryComment" (id, "idUser", username, "idRepository", comment, "createdAt", "updatedAt") VALUES (13, 1, 'admin', 2622, 'Vulpix <3', '2018-11-16 17:09:52.618972', NULL);


--
-- Data for Name: RepositoryEditorials; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: RepositoryResources; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (5, 1, 'admin', 2590, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/001.png', 1, false, '2018-11-16 05:59:53.087909', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (6, 1, 'admin', 2586, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/002.png', 1, false, '2018-11-16 05:59:53.089146', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (7, 1, 'admin', 2593, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/004.png', 1, false, '2018-11-16 05:59:53.094097', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (8, 1, 'admin', 2585, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/007.png', 1, false, '2018-11-16 05:59:53.10021', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (9, 1, 'admin', 2588, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/005.png', 1, false, '2018-11-16 05:59:53.104344', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (10, 1, 'admin', 2592, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/003.png', 1, false, '2018-11-16 05:59:53.106015', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (11, 1, 'admin', 2594, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/010.png', 1, false, '2018-11-16 05:59:53.110065', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (12, 1, 'admin', 2591, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/009.png', 1, false, '2018-11-16 05:59:53.112059', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (13, 1, 'admin', 2589, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/008.png', 1, false, '2018-11-16 05:59:53.113043', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (14, 1, 'admin', 2587, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/006.png', 1, false, '2018-11-16 05:59:53.117954', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (15, 1, 'admin', 2598, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/015.png', 1, false, '2018-11-16 05:59:53.247777', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (16, 1, 'admin', 2599, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/014.png', 1, false, '2018-11-16 05:59:53.248476', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (17, 1, 'admin', 2601, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/018.png', 1, false, '2018-11-16 05:59:53.250296', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (18, 1, 'admin', 2596, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/012.png', 1, false, '2018-11-16 05:59:53.250841', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (19, 1, 'admin', 2595, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/011.png', 1, false, '2018-11-16 05:59:53.251523', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (20, 1, 'admin', 2597, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/013.png', 1, false, '2018-11-16 05:59:53.253929', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (21, 1, 'admin', 2600, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/016.png', 1, false, '2018-11-16 05:59:53.257268', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (22, 1, 'admin', 2602, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/017.png', 1, false, '2018-11-16 05:59:53.259436', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (23, 1, 'admin', 2604, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/019.png', 1, false, '2018-11-16 05:59:53.265269', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (24, 1, 'admin', 2603, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/020.png', 1, false, '2018-11-16 05:59:53.270539', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (25, 1, 'admin', 2605, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/021.png', 1, false, '2018-11-16 05:59:53.359323', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (26, 1, 'admin', 2606, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/022.png', 1, false, '2018-11-16 05:59:53.360125', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (27, 1, 'admin', 2607, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/023.png', 1, false, '2018-11-16 05:59:53.365754', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (28, 1, 'admin', 2608, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/024.png', 1, false, '2018-11-16 05:59:53.369073', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (29, 1, 'admin', 2609, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/025.png', 1, false, '2018-11-16 05:59:53.3705', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (30, 1, 'admin', 2610, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/026.png', 1, false, '2018-11-16 05:59:53.372407', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (31, 1, 'admin', 2611, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/027.png', 1, false, '2018-11-16 05:59:53.38181', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (32, 1, 'admin', 2612, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/028.png', 1, false, '2018-11-16 05:59:53.393257', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (33, 1, 'admin', 2613, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/029.png', 1, false, '2018-11-16 05:59:53.39434', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (34, 1, 'admin', 2614, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/030.png', 1, false, '2018-11-16 05:59:53.415594', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (35, 1, 'admin', 2615, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/031.png', 1, false, '2018-11-16 05:59:53.463341', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (36, 1, 'admin', 2616, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/032.png', 1, false, '2018-11-16 05:59:53.464812', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (37, 1, 'admin', 2618, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/034.png', 1, false, '2018-11-16 05:59:53.479553', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (38, 1, 'admin', 2620, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/035.png', 1, false, '2018-11-16 05:59:53.48036', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (39, 1, 'admin', 2617, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/033.png', 1, false, '2018-11-16 05:59:53.482414', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (40, 1, 'admin', 2621, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/036.png', 1, false, '2018-11-16 05:59:53.483598', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (41, 1, 'admin', 2622, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/037.png', 1, false, '2018-11-16 05:59:53.499459', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (42, 1, 'admin', 2624, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/038.png', 1, false, '2018-11-16 05:59:53.530309', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (43, 1, 'admin', 2619, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/039.png', 1, false, '2018-11-16 05:59:53.533092', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (44, 1, 'admin', 2623, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/040.png', 1, false, '2018-11-16 05:59:53.565958', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (45, 1, 'admin', 2626, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/041.png', 1, false, '2018-11-16 05:59:53.571046', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (46, 1, 'admin', 2627, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/043.png', 1, false, '2018-11-16 05:59:53.593299', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (47, 1, 'admin', 2625, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/042.png', 1, false, '2018-11-16 05:59:53.594033', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (48, 1, 'admin', 2628, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/044.png', 1, false, '2018-11-16 05:59:53.59759', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (49, 1, 'admin', 2629, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/045.png', 1, false, '2018-11-16 05:59:53.599462', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (50, 1, 'admin', 2630, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/046.png', 1, false, '2018-11-16 05:59:53.649545', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (51, 1, 'admin', 2631, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/047.png', 1, false, '2018-11-16 05:59:53.652178', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (52, 1, 'admin', 2632, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/048.png', 1, false, '2018-11-16 05:59:53.664607', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (53, 1, 'admin', 2634, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/050.png', 1, false, '2018-11-16 05:59:53.677243', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (54, 1, 'admin', 2635, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/049.png', 1, false, '2018-11-16 05:59:53.677965', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (55, 1, 'admin', 2633, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/051.png', 1, false, '2018-11-16 05:59:53.701904', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (65, 1, 'admin', 2645, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/060.png', 1, false, '2018-11-16 05:59:53.815654', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (74, 1, 'admin', 2656, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/070.png', 1, false, '2018-11-16 05:59:53.923664', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (83, 1, 'admin', 2664, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/080.png', 1, false, '2018-11-16 05:59:54.034817', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (94, 1, 'admin', 2674, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/089.png', 1, false, '2018-11-16 05:59:54.21718', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (102, 1, 'admin', 2681, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/099.png', 1, false, '2018-11-16 05:59:54.328852', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (111, 1, 'admin', 2691, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/107.png', 1, false, '2018-11-16 05:59:54.472296', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (121, 1, 'admin', 2702, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/117.png', 1, false, '2018-11-16 05:59:54.586392', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (131, 1, 'admin', 2711, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/127.png', 1, false, '2018-11-16 05:59:54.700741', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (141, 1, 'admin', 2721, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/137.png', 1, false, '2018-11-16 05:59:54.811198', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (151, 1, 'admin', 2730, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/146.png', 1, false, '2018-11-16 05:59:54.922115', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (161, 1, 'admin', 2740, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/156.png', 1, false, '2018-11-16 05:59:55.037279', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (168, 1, 'admin', 2747, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/164.png', 1, false, '2018-11-16 05:59:55.145495', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (179, 1, 'admin', 2757, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/173.png', 1, false, '2018-11-16 05:59:55.266334', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (188, 1, 'admin', 2766, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/182.png', 1, false, '2018-11-16 05:59:55.375761', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (197, 1, 'admin', 2776, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/192.png', 1, false, '2018-11-16 05:59:55.491413', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (205, 1, 'admin', 2795, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/209.png', 1, false, '2018-11-16 05:59:55.602794', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (214, 1, 'admin', 2823, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/239.png', 1, false, '2018-11-16 05:59:55.713556', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (224, 1, 'admin', 2858, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/274.png', 1, false, '2018-11-16 05:59:55.82332', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (233, 1, 'admin', 2894, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/310.png', 1, false, '2018-11-16 05:59:55.936753', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (241, 1, 'admin', 2935, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/351.png', 1, false, '2018-11-16 05:59:56.055022', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (250, 1, 'admin', 3274, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/384.png', 1, false, '2018-11-16 05:59:56.166144', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (259, 1, 'admin', 3235, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/423.png', 1, false, '2018-11-16 05:59:56.267123', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (269, 1, 'admin', 3203, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/455.png', 1, false, '2018-11-16 05:59:56.380923', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (279, 1, 'admin', 2948, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/500.png', 1, false, '2018-11-16 05:59:56.488858', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (289, 1, 'admin', 2977, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/530.png', 1, false, '2018-11-16 05:59:56.598879', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (299, 1, 'admin', 3015, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/567.png', 1, false, '2018-11-16 05:59:56.717837', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (309, 1, 'admin', 3053, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/605.png', 1, false, '2018-11-16 05:59:56.847145', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (320, 1, 'admin', 3084, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/636.png', 1, false, '2018-11-16 05:59:56.957413', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (328, 1, 'admin', 3124, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/675.png', 1, false, '2018-11-16 05:59:57.06746', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (338, 1, 'admin', 3184, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/474.png', 1, false, '2018-11-16 05:59:57.185461', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (346, 1, 'admin', 3196, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/461.png', 1, false, '2018-11-16 05:59:57.294806', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (356, 1, 'admin', 3211, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/447.png', 1, false, '2018-11-16 05:59:57.414582', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (366, 1, 'admin', 3225, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/433.png', 1, false, '2018-11-16 05:59:57.525095', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (376, 1, 'admin', 3236, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/420.png', 1, false, '2018-11-16 05:59:57.641024', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (387, 1, 'admin', 3251, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/406.png', 1, false, '2018-11-16 05:59:57.762875', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (396, 1, 'admin', 3264, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/394.png', 1, false, '2018-11-16 05:59:57.87615', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (406, 1, 'admin', 3277, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/381.png', 1, false, '2018-11-16 05:59:57.986551', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (415, 1, 'admin', 3290, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/368.png', 1, false, '2018-11-16 05:59:58.096455', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (424, 1, 'admin', 3301, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/356.png', 1, false, '2018-11-16 05:59:58.214073', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (433, 1, 'admin', 2928, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/344.png', 1, false, '2018-11-16 05:59:58.321309', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (443, 1, 'admin', 2916, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/332.png', 1, false, '2018-11-16 05:59:58.444557', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (452, 1, 'admin', 2904, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/320.png', 1, false, '2018-11-16 05:59:58.552023', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (461, 1, 'admin', 2891, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/307.png', 1, false, '2018-11-16 05:59:58.663328', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (470, 1, 'admin', 2878, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/295.png', 1, false, '2018-11-16 05:59:58.775403', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (478, 1, 'admin', 2871, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/287.png', 1, false, '2018-11-16 05:59:58.883247', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (487, 1, 'admin', 2861, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/276.png', 1, false, '2018-11-16 05:59:58.995173', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (498, 1, 'admin', 2844, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/260.png', 1, false, '2018-11-16 05:59:59.112335', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (508, 1, 'admin', 2829, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/246.png', 1, false, '2018-11-16 05:59:59.239389', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (517, 1, 'admin', 2817, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/233.png', 1, false, '2018-11-16 05:59:59.350802', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (526, 1, 'admin', 2804, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/220.png', 1, false, '2018-11-16 05:59:59.46098', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (536, 1, 'admin', 2791, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/207.png', 1, false, '2018-11-16 05:59:59.570304', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (544, 1, 'admin', 3308, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/803.png', 1, false, '2018-11-16 05:59:59.68046', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (554, 1, 'admin', 3165, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/794.png', 1, false, '2018-11-16 05:59:59.791896', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (564, 1, 'admin', 3321, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/784.png', 1, false, '2018-11-16 05:59:59.901945', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (572, 1, 'admin', 3329, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/774.png', 1, false, '2018-11-16 06:00:00.010766', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (582, 1, 'admin', 3335, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/766.png', 1, false, '2018-11-16 06:00:00.118898', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (592, 1, 'admin', 3155, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/756.png', 1, false, '2018-11-16 06:00:00.226045', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (56, 1, 'admin', 2636, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/052.png', 1, false, '2018-11-16 05:59:53.707713', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (64, 1, 'admin', 2644, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/061.png', 1, false, '2018-11-16 05:59:53.813723', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (75, 1, 'admin', 2654, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/071.png', 1, false, '2018-11-16 05:59:53.924575', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (84, 1, 'admin', 2666, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/081.png', 1, false, '2018-11-16 05:59:54.037977', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (93, 1, 'admin', 2673, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/090.png', 1, false, '2018-11-16 05:59:54.214244', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (104, 1, 'admin', 2684, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/100.png', 1, false, '2018-11-16 05:59:54.348906', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (112, 1, 'admin', 2694, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/110.png', 1, false, '2018-11-16 05:59:54.486423', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (122, 1, 'admin', 2701, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/118.png', 1, false, '2018-11-16 05:59:54.595601', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (132, 1, 'admin', 2712, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/128.png', 1, false, '2018-11-16 05:59:54.706351', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (142, 1, 'admin', 2723, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/138.png', 1, false, '2018-11-16 05:59:54.813167', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (152, 1, 'admin', 2732, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/148.png', 1, false, '2018-11-16 05:59:54.927556', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (162, 1, 'admin', 2741, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/158.png', 1, false, '2018-11-16 05:59:55.039022', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (169, 1, 'admin', 2751, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/167.png', 1, false, '2018-11-16 05:59:55.152387', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (177, 1, 'admin', 2761, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/174.png', 1, false, '2018-11-16 05:59:55.2634', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (186, 1, 'admin', 2767, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/183.png', 1, false, '2018-11-16 05:59:55.372859', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (196, 1, 'admin', 2777, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/193.png', 1, false, '2018-11-16 05:59:55.488536', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (204, 1, 'admin', 2796, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/213.png', 1, false, '2018-11-16 05:59:55.599878', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (213, 1, 'admin', 2826, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/242.png', 1, false, '2018-11-16 05:59:55.710615', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (222, 1, 'admin', 2860, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/277.png', 1, false, '2018-11-16 05:59:55.81995', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (232, 1, 'admin', 2898, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/314.png', 1, false, '2018-11-16 05:59:55.933861', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (243, 1, 'admin', 3303, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/355.png', 1, false, '2018-11-16 05:59:56.088667', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (253, 1, 'admin', 3263, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/395.png', 1, false, '2018-11-16 05:59:56.199334', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (262, 1, 'admin', 3221, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/435.png', 1, false, '2018-11-16 05:59:56.310585', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (274, 1, 'admin', 3179, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/478.png', 1, false, '2018-11-16 05:59:56.423102', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (284, 1, 'admin', 2960, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/511.png', 1, false, '2018-11-16 05:59:56.535034', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (294, 1, 'admin', 2997, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/548.png', 1, false, '2018-11-16 05:59:56.644201', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (304, 1, 'admin', 3035, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/585.png', 1, false, '2018-11-16 05:59:56.757234', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (337, 1, 'admin', 3185, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/473.png', 1, false, '2018-11-16 05:59:57.183568', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (347, 1, 'admin', 3199, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/459.png', 1, false, '2018-11-16 05:59:57.306878', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (357, 1, 'admin', 3212, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/446.png', 1, false, '2018-11-16 05:59:57.41841', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (367, 1, 'admin', 3226, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/432.png', 1, false, '2018-11-16 05:59:57.530824', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (377, 1, 'admin', 3241, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/418.png', 1, false, '2018-11-16 05:59:57.642134', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (386, 1, 'admin', 3253, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/405.png', 1, false, '2018-11-16 05:59:57.759951', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (395, 1, 'admin', 3266, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/392.png', 1, false, '2018-11-16 05:59:57.873251', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (404, 1, 'admin', 3278, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/379.png', 1, false, '2018-11-16 05:59:57.983221', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (414, 1, 'admin', 3292, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/366.png', 1, false, '2018-11-16 05:59:58.093549', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (425, 1, 'admin', 3304, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/354.png', 1, false, '2018-11-16 05:59:58.218196', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (434, 1, 'admin', 2924, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/342.png', 1, false, '2018-11-16 05:59:58.326822', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (442, 1, 'admin', 2915, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/331.png', 1, false, '2018-11-16 05:59:58.441667', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (451, 1, 'admin', 2903, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/319.png', 1, false, '2018-11-16 05:59:58.549113', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (463, 1, 'admin', 2890, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/306.png', 1, false, '2018-11-16 05:59:58.674719', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (473, 1, 'admin', 2877, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/292.png', 1, false, '2018-11-16 05:59:58.788202', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (482, 1, 'admin', 2866, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/282.png', 1, false, '2018-11-16 05:59:58.904212', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (490, 1, 'admin', 2853, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/269.png', 1, false, '2018-11-16 05:59:59.013948', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (500, 1, 'admin', 2841, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/256.png', 1, false, '2018-11-16 05:59:59.124607', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (507, 1, 'admin', 2827, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/243.png', 1, false, '2018-11-16 05:59:59.238204', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (516, 1, 'admin', 2815, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/231.png', 1, false, '2018-11-16 05:59:59.349639', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (525, 1, 'admin', 2803, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/219.png', 1, false, '2018-11-16 05:59:59.45806', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (535, 1, 'admin', 2789, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/205.png', 1, false, '2018-11-16 05:59:59.567913', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (545, 1, 'admin', 3169, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/802.png', 1, false, '2018-11-16 05:59:59.682968', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (555, 1, 'admin', 3316, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/792.png', 1, false, '2018-11-16 05:59:59.79602', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (565, 1, 'admin', 3162, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/783.png', 1, false, '2018-11-16 05:59:59.912615', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (575, 1, 'admin', 3331, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/773.png', 1, false, '2018-11-16 06:00:00.023933', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (585, 1, 'admin', 3337, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/763.png', 1, false, '2018-11-16 06:00:00.136471', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (593, 1, 'admin', 3343, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/754.png', 1, false, '2018-11-16 06:00:00.262905', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (604, 1, 'admin', 3150, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/745.png', 1, false, '2018-11-16 06:00:00.383551', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (614, 1, 'admin', 3362, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/734.png', 1, false, '2018-11-16 06:00:00.499534', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (624, 1, 'admin', 3366, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/724.png', 1, false, '2018-11-16 06:00:00.62732', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (57, 1, 'admin', 2637, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/053.png', 1, false, '2018-11-16 05:59:53.709355', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (66, 1, 'admin', 2646, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/062.png', 1, false, '2018-11-16 05:59:53.823501', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (76, 1, 'admin', 2657, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/072.png', 1, false, '2018-11-16 05:59:53.936142', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (86, 1, 'admin', 2665, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/082.png', 1, false, '2018-11-16 05:59:54.052347', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (95, 1, 'admin', 2676, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/092.png', 1, false, '2018-11-16 05:59:54.232668', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (105, 1, 'admin', 2686, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/101.png', 1, false, '2018-11-16 05:59:54.34971', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (113, 1, 'admin', 2695, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/111.png', 1, false, '2018-11-16 05:59:54.487247', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (123, 1, 'admin', 2703, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/119.png', 1, false, '2018-11-16 05:59:54.596441', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (133, 1, 'admin', 2713, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/129.png', 1, false, '2018-11-16 05:59:54.707202', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (143, 1, 'admin', 2724, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/139.png', 1, false, '2018-11-16 05:59:54.819445', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (153, 1, 'admin', 2734, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/149.png', 1, false, '2018-11-16 05:59:54.931782', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (163, 1, 'admin', 2742, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/159.png', 1, false, '2018-11-16 05:59:55.0399', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (170, 1, 'admin', 2752, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/168.png', 1, false, '2018-11-16 05:59:55.153221', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (178, 1, 'admin', 2760, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/175.png', 1, false, '2018-11-16 05:59:55.264212', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (187, 1, 'admin', 2768, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/184.png', 1, false, '2018-11-16 05:59:55.373702', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (221, 1, 'admin', 2850, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/266.png', 1, false, '2018-11-16 05:59:55.810525', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (231, 1, 'admin', 2889, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/305.png', 1, false, '2018-11-16 05:59:55.926004', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (240, 1, 'admin', 2930, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/347.png', 1, false, '2018-11-16 05:59:56.052974', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (251, 1, 'admin', 3267, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/391.png', 1, false, '2018-11-16 05:59:56.179744', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (261, 1, 'admin', 3231, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/427.png', 1, false, '2018-11-16 05:59:56.289516', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (271, 1, 'admin', 3194, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/464.png', 1, false, '2018-11-16 05:59:56.405722', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (280, 1, 'admin', 2941, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/493.png', 1, false, '2018-11-16 05:59:56.513746', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (290, 1, 'admin', 2982, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/534.png', 1, false, '2018-11-16 05:59:56.625286', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (300, 1, 'admin', 3020, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/571.png', 1, false, '2018-11-16 05:59:56.737998', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (310, 1, 'admin', 3056, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/608.png', 1, false, '2018-11-16 05:59:56.848705', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (321, 1, 'admin', 3094, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/646.png', 1, false, '2018-11-16 05:59:56.964103', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (330, 1, 'admin', 3133, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/684.png', 1, false, '2018-11-16 05:59:57.083257', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (340, 1, 'admin', 3188, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/470.png', 1, false, '2018-11-16 05:59:57.192625', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (349, 1, 'admin', 3202, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/456.png', 1, false, '2018-11-16 05:59:57.319047', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (358, 1, 'admin', 3213, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/443.png', 1, false, '2018-11-16 05:59:57.422946', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (368, 1, 'admin', 3228, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/430.png', 1, false, '2018-11-16 05:59:57.536187', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (378, 1, 'admin', 3240, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/417.png', 1, false, '2018-11-16 05:59:57.646362', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (388, 1, 'admin', 3255, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/403.png', 1, false, '2018-11-16 05:59:57.7674', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (397, 1, 'admin', 3268, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/390.png', 1, false, '2018-11-16 05:59:57.881184', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (407, 1, 'admin', 3280, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/378.png', 1, false, '2018-11-16 05:59:57.994186', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (417, 1, 'admin', 3293, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/365.png', 1, false, '2018-11-16 05:59:58.104574', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (426, 1, 'admin', 2936, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/352.png', 1, false, '2018-11-16 05:59:58.226815', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (435, 1, 'admin', 2925, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/341.png', 1, false, '2018-11-16 05:59:58.339906', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (444, 1, 'admin', 2914, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/329.png', 1, false, '2018-11-16 05:59:58.450533', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (455, 1, 'admin', 2900, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/316.png', 1, false, '2018-11-16 05:59:58.566808', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (466, 1, 'admin', 2887, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/302.png', 1, false, '2018-11-16 05:59:58.687489', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (474, 1, 'admin', 2845, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/261.png', 1, false, '2018-11-16 05:59:58.801856', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (483, 1, 'admin', 2865, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/280.png', 1, false, '2018-11-16 05:59:58.911214', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (492, 1, 'admin', 2852, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/268.png', 1, false, '2018-11-16 05:59:59.02306', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (502, 1, 'admin', 2837, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/253.png', 1, false, '2018-11-16 05:59:59.135288', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (510, 1, 'admin', 2824, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/240.png', 1, false, '2018-11-16 05:59:59.245252', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (518, 1, 'admin', 2813, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/229.png', 1, false, '2018-11-16 05:59:59.358083', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (527, 1, 'admin', 2802, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/218.png', 1, false, '2018-11-16 05:59:59.479773', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (537, 1, 'admin', 2786, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/203.png', 1, false, '2018-11-16 05:59:59.589899', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (547, 1, 'admin', 3310, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/801.png', 1, false, '2018-11-16 05:59:59.704972', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (557, 1, 'admin', 3164, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/791.png', 1, false, '2018-11-16 05:59:59.818151', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (567, 1, 'admin', 3324, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/781.png', 1, false, '2018-11-16 05:59:59.937505', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (577, 1, 'admin', 3159, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/771.png', 1, false, '2018-11-16 06:00:00.050084', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (587, 1, 'admin', 3338, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/761.png', 1, false, '2018-11-16 06:00:00.163348', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (597, 1, 'admin', 3345, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/751.png', 1, false, '2018-11-16 06:00:00.274952', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (606, 1, 'admin', 3149, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/741.png', 1, false, '2018-11-16 06:00:00.39918', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (616, 1, 'admin', 3359, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/732.png', 1, false, '2018-11-16 06:00:00.521551', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (627, 1, 'admin', 3367, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/722.png', 1, false, '2018-11-16 06:00:00.6423', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (58, 1, 'admin', 2638, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/054.png', 1, false, '2018-11-16 05:59:53.725308', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (68, 1, 'admin', 2648, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/064.png', 1, false, '2018-11-16 05:59:53.841901', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (78, 1, 'admin', 2660, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/074.png', 1, false, '2018-11-16 05:59:53.969707', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (88, 1, 'admin', 2668, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/084.png', 1, false, '2018-11-16 05:59:54.101559', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (98, 1, 'admin', 2678, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/094.png', 1, false, '2018-11-16 05:59:54.274472', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (108, 1, 'admin', 2687, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/104.png', 1, false, '2018-11-16 05:59:54.461528', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (120, 1, 'admin', 2698, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/114.png', 1, false, '2018-11-16 05:59:54.574874', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (130, 1, 'admin', 2710, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/126.png', 1, false, '2018-11-16 05:59:54.691013', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (140, 1, 'admin', 2720, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/136.png', 1, false, '2018-11-16 05:59:54.808893', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (150, 1, 'admin', 2731, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/147.png', 1, false, '2018-11-16 05:59:54.921509', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (160, 1, 'admin', 2743, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/157.png', 1, false, '2018-11-16 05:59:55.036839', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (171, 1, 'admin', 2750, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/166.png', 1, false, '2018-11-16 05:59:55.155078', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (180, 1, 'admin', 2758, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/176.png', 1, false, '2018-11-16 05:59:55.26723', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (189, 1, 'admin', 2769, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/185.png', 1, false, '2018-11-16 05:59:55.385641', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (198, 1, 'admin', 2778, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/194.png', 1, false, '2018-11-16 05:59:55.518654', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (207, 1, 'admin', 2801, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/217.png', 1, false, '2018-11-16 05:59:55.633424', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (216, 1, 'admin', 2832, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/248.png', 1, false, '2018-11-16 05:59:55.751548', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (226, 1, 'admin', 2869, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/285.png', 1, false, '2018-11-16 05:59:55.865377', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (235, 1, 'admin', 2910, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/326.png', 1, false, '2018-11-16 05:59:55.981216', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (245, 1, 'admin', 3295, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/363.png', 1, false, '2018-11-16 05:59:56.095532', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (257, 1, 'admin', 3247, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/411.png', 1, false, '2018-11-16 05:59:56.212033', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (266, 1, 'admin', 3209, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/448.png', 1, false, '2018-11-16 05:59:56.325579', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (277, 1, 'admin', 3176, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/482.png', 1, false, '2018-11-16 05:59:56.442649', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (287, 1, 'admin', 2972, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/523.png', 1, false, '2018-11-16 05:59:56.581705', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (297, 1, 'admin', 3007, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/560.png', 1, false, '2018-11-16 05:59:56.696859', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (307, 1, 'admin', 3044, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/597.png', 1, false, '2018-11-16 05:59:56.827311', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (316, 1, 'admin', 3075, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/629.png', 1, false, '2018-11-16 05:59:56.943503', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (326, 1, 'admin', 3112, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/663.png', 1, false, '2018-11-16 05:59:57.05933', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (336, 1, 'admin', 3182, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/476.png', 1, false, '2018-11-16 05:59:57.176086', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (348, 1, 'admin', 3200, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/458.png', 1, false, '2018-11-16 05:59:57.309603', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (359, 1, 'admin', 3216, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/444.png', 1, false, '2018-11-16 05:59:57.424841', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (369, 1, 'admin', 3229, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/429.png', 1, false, '2018-11-16 05:59:57.538029', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (379, 1, 'admin', 3242, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/416.png', 1, false, '2018-11-16 05:59:57.653073', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (389, 1, 'admin', 3256, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/402.png', 1, false, '2018-11-16 05:59:57.779555', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (399, 1, 'admin', 3269, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/389.png', 1, false, '2018-11-16 05:59:57.895168', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (410, 1, 'admin', 3282, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/376.png', 1, false, '2018-11-16 05:59:58.011275', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (421, 1, 'admin', 3297, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/361.png', 1, false, '2018-11-16 05:59:58.151358', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (430, 1, 'admin', 2934, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/348.png', 1, false, '2018-11-16 05:59:58.273318', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (439, 1, 'admin', 2920, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/336.png', 1, false, '2018-11-16 05:59:58.386334', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (448, 1, 'admin', 2908, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/324.png', 1, false, '2018-11-16 05:59:58.50563', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (458, 1, 'admin', 2895, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/311.png', 1, false, '2018-11-16 05:59:58.622293', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (494, 1, 'admin', 2849, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/265.png', 1, false, '2018-11-16 05:59:59.056899', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (504, 1, 'admin', 2834, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/250.png', 1, false, '2018-11-16 05:59:59.17194', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (513, 1, 'admin', 2822, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/237.png', 1, false, '2018-11-16 05:59:59.285222', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (521, 1, 'admin', 2809, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/224.png', 1, false, '2018-11-16 05:59:59.397104', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (529, 1, 'admin', 2798, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/214.png', 1, false, '2018-11-16 05:59:59.511697', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (538, 1, 'admin', 2784, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/200.png', 1, false, '2018-11-16 05:59:59.623678', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (549, 1, 'admin', 3309, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/799.png', 1, false, '2018-11-16 05:59:59.736591', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (561, 1, 'admin', 3163, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/787.png', 1, false, '2018-11-16 05:59:59.861315', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (571, 1, 'admin', 3326, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/777.png', 1, false, '2018-11-16 05:59:59.977933', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (581, 1, 'admin', 3158, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/767.png', 1, false, '2018-11-16 06:00:00.103336', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (591, 1, 'admin', 3344, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/757.png', 1, false, '2018-11-16 06:00:00.215921', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (601, 1, 'admin', 3349, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/747.png', 1, false, '2018-11-16 06:00:00.330584', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (611, 1, 'admin', 3151, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/737.png', 1, false, '2018-11-16 06:00:00.445809', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (621, 1, 'admin', 3364, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/727.png', 1, false, '2018-11-16 06:00:00.569921', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (631, 1, 'admin', 3372, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/716.png', 1, false, '2018-11-16 06:00:00.681943', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (640, 1, 'admin', 3142, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/706.png', 1, false, '2018-11-16 06:00:00.795808', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (653, 1, 'admin', 3387, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/696.png', 1, false, '2018-11-16 06:00:00.92275', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (59, 1, 'admin', 2639, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/055.png', 1, false, '2018-11-16 05:59:53.770641', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (69, 1, 'admin', 2649, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/065.png', 1, false, '2018-11-16 05:59:53.888074', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (80, 1, 'admin', 2658, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/075.png', 1, false, '2018-11-16 05:59:54.009288', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (92, 1, 'admin', 2670, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/087.png', 1, false, '2018-11-16 05:59:54.207952', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (103, 1, 'admin', 2683, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/098.png', 1, false, '2018-11-16 05:59:54.333433', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (115, 1, 'admin', 2693, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/109.png', 1, false, '2018-11-16 05:59:54.493858', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (125, 1, 'admin', 2706, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/122.png', 1, false, '2018-11-16 05:59:54.614432', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (136, 1, 'admin', 2716, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/132.png', 1, false, '2018-11-16 05:59:54.749662', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (146, 1, 'admin', 2726, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/142.png', 1, false, '2018-11-16 05:59:54.870777', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (155, 1, 'admin', 2737, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/152.png', 1, false, '2018-11-16 05:59:54.990612', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (167, 1, 'admin', 2744, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/161.png', 1, false, '2018-11-16 05:59:55.127243', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (176, 1, 'admin', 2756, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/172.png', 1, false, '2018-11-16 05:59:55.246406', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (185, 1, 'admin', 2764, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/181.png', 1, false, '2018-11-16 05:59:55.364683', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (195, 1, 'admin', 2775, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/191.png', 1, false, '2018-11-16 05:59:55.485196', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (206, 1, 'admin', 2790, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/206.png', 1, false, '2018-11-16 05:59:55.607345', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (215, 1, 'admin', 2831, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/245.png', 1, false, '2018-11-16 05:59:55.72629', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (225, 1, 'admin', 2864, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/281.png', 1, false, '2018-11-16 05:59:55.846921', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (236, 1, 'admin', 2907, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/322.png', 1, false, '2018-11-16 05:59:55.986017', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (248, 1, 'admin', 3291, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/367.png', 1, false, '2018-11-16 05:59:56.106084', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (258, 1, 'admin', 3243, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/415.png', 1, false, '2018-11-16 05:59:56.229382', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (268, 1, 'admin', 3205, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/452.png', 1, false, '2018-11-16 05:59:56.349919', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (278, 1, 'admin', 2950, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/504.png', 1, false, '2018-11-16 05:59:56.468545', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (288, 1, 'admin', 2975, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/527.png', 1, false, '2018-11-16 05:59:56.591505', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (298, 1, 'admin', 3011, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/563.png', 1, false, '2018-11-16 05:59:56.711065', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (308, 1, 'admin', 3049, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/601.png', 1, false, '2018-11-16 05:59:56.832044', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (319, 1, 'admin', 3072, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/632.png', 1, false, '2018-11-16 05:59:56.954211', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (329, 1, 'admin', 3128, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/679.png', 1, false, '2018-11-16 05:59:57.072015', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (339, 1, 'admin', 3187, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/472.png', 1, false, '2018-11-16 05:59:57.191023', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (350, 1, 'admin', 3201, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/457.png', 1, false, '2018-11-16 05:59:57.325695', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (360, 1, 'admin', 3215, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/442.png', 1, false, '2018-11-16 05:59:57.449004', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (370, 1, 'admin', 3230, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/428.png', 1, false, '2018-11-16 05:59:57.565858', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (380, 1, 'admin', 3246, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/414.png', 1, false, '2018-11-16 05:59:57.687', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (391, 1, 'admin', 3259, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/399.png', 1, false, '2018-11-16 05:59:57.810659', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (402, 1, 'admin', 3271, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/386.png', 1, false, '2018-11-16 05:59:57.929402', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (413, 1, 'admin', 3287, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/372.png', 1, false, '2018-11-16 05:59:58.047917', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (423, 1, 'admin', 3302, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/357.png', 1, false, '2018-11-16 05:59:58.165216', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (432, 1, 'admin', 2929, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/345.png', 1, false, '2018-11-16 05:59:58.283671', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (441, 1, 'admin', 2917, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/333.png', 1, false, '2018-11-16 05:59:58.402567', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (450, 1, 'admin', 2905, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/321.png', 1, false, '2018-11-16 05:59:58.516447', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (460, 1, 'admin', 2892, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/308.png', 1, false, '2018-11-16 05:59:58.651825', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (469, 1, 'admin', 2880, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/296.png', 1, false, '2018-11-16 05:59:58.771485', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (480, 1, 'admin', 2868, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/284.png', 1, false, '2018-11-16 05:59:58.898492', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (491, 1, 'admin', 2855, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/271.png', 1, false, '2018-11-16 05:59:59.014991', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (501, 1, 'admin', 2840, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/254.png', 1, false, '2018-11-16 05:59:59.132293', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (511, 1, 'admin', 2825, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/241.png', 1, false, '2018-11-16 05:59:59.245753', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (520, 1, 'admin', 2811, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/227.png', 1, false, '2018-11-16 05:59:59.364984', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (530, 1, 'admin', 2799, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/215.png', 1, false, '2018-11-16 05:59:59.515654', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (542, 1, 'admin', 3306, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/807.png', 1, false, '2018-11-16 05:59:59.644302', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (552, 1, 'admin', 3314, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/796.png', 1, false, '2018-11-16 05:59:59.764216', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (562, 1, 'admin', 3322, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/786.png', 1, false, '2018-11-16 05:59:59.88279', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (573, 1, 'admin', 3328, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/776.png', 1, false, '2018-11-16 06:00:00.014561', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (583, 1, 'admin', 3336, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/765.png', 1, false, '2018-11-16 06:00:00.134492', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (594, 1, 'admin', 3342, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/755.png', 1, false, '2018-11-16 06:00:00.270345', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (605, 1, 'admin', 3352, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/743.png', 1, false, '2018-11-16 06:00:00.392039', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (615, 1, 'admin', 3152, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/733.png', 1, false, '2018-11-16 06:00:00.517499', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (625, 1, 'admin', 3368, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/723.png', 1, false, '2018-11-16 06:00:00.639479', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (637, 1, 'admin', 3374, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/712.png', 1, false, '2018-11-16 06:00:00.786188', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (648, 1, 'admin', 3384, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/701.png', 1, false, '2018-11-16 06:00:00.904758', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (60, 1, 'admin', 2643, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/059.png', 1, false, '2018-11-16 05:59:53.793275', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (71, 1, 'admin', 2650, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/067.png', 1, false, '2018-11-16 05:59:53.899073', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (81, 1, 'admin', 2661, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/077.png', 1, false, '2018-11-16 05:59:54.009848', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (89, 1, 'admin', 2669, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/086.png', 1, false, '2018-11-16 05:59:54.198463', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (100, 1, 'admin', 2680, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/096.png', 1, false, '2018-11-16 05:59:54.314877', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (109, 1, 'admin', 2690, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/106.png', 1, false, '2018-11-16 05:59:54.467319', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (119, 1, 'admin', 2700, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/116.png', 1, false, '2018-11-16 05:59:54.574373', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (128, 1, 'admin', 2709, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/125.png', 1, false, '2018-11-16 05:59:54.679448', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (138, 1, 'admin', 2719, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/135.png', 1, false, '2018-11-16 05:59:54.790249', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (147, 1, 'admin', 2727, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/144.png', 1, false, '2018-11-16 05:59:54.897091', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (158, 1, 'admin', 2738, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/154.png', 1, false, '2018-11-16 05:59:55.003557', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (165, 1, 'admin', 2748, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/163.png', 1, false, '2018-11-16 05:59:55.11796', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (175, 1, 'admin', 2755, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/171.png', 1, false, '2018-11-16 05:59:55.236856', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (183, 1, 'admin', 2765, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/180.png', 1, false, '2018-11-16 05:59:55.341076', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (193, 1, 'admin', 2773, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/189.png', 1, false, '2018-11-16 05:59:55.446569', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (201, 1, 'admin', 2781, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/198.png', 1, false, '2018-11-16 05:59:55.556985', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (210, 1, 'admin', 2812, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/228.png', 1, false, '2018-11-16 05:59:55.663902', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (219, 1, 'admin', 2842, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/258.png', 1, false, '2018-11-16 05:59:55.779691', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (227, 1, 'admin', 2876, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/293.png', 1, false, '2018-11-16 05:59:55.884048', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (238, 1, 'admin', 2919, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/335.png', 1, false, '2018-11-16 05:59:55.991861', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (246, 1, 'admin', 3283, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/375.png', 1, false, '2018-11-16 05:59:56.097547', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (254, 1, 'admin', 3252, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/407.png', 1, false, '2018-11-16 05:59:56.207245', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (265, 1, 'admin', 3218, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/441.png', 1, false, '2018-11-16 05:59:56.312528', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (272, 1, 'admin', 3183, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/475.png', 1, false, '2018-11-16 05:59:56.418353', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (282, 1, 'admin', 3168, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/489.png', 1, false, '2018-11-16 05:59:56.529991', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (292, 1, 'admin', 2990, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/542.png', 1, false, '2018-11-16 05:59:56.63576', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (302, 1, 'admin', 3022, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/574.png', 1, false, '2018-11-16 05:59:56.745957', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (312, 1, 'admin', 3065, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/616.png', 1, false, '2018-11-16 05:59:56.84947', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (318, 1, 'admin', 3090, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/643.png', 1, false, '2018-11-16 05:59:56.953047', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (327, 1, 'admin', 3119, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/671.png', 1, false, '2018-11-16 05:59:57.05983', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (335, 1, 'admin', 3181, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/477.png', 1, false, '2018-11-16 05:59:57.171275', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (345, 1, 'admin', 3197, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/462.png', 1, false, '2018-11-16 05:59:57.275913', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (354, 1, 'admin', 3210, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/449.png', 1, false, '2018-11-16 05:59:57.382054', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (364, 1, 'admin', 3222, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/436.png', 1, false, '2018-11-16 05:59:57.50081', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (374, 1, 'admin', 3234, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/422.png', 1, false, '2018-11-16 05:59:57.618042', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (383, 1, 'admin', 3249, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/409.png', 1, false, '2018-11-16 05:59:57.726721', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (393, 1, 'admin', 3261, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/397.png', 1, false, '2018-11-16 05:59:57.832788', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (403, 1, 'admin', 3275, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/383.png', 1, false, '2018-11-16 05:59:57.937535', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (412, 1, 'admin', 3288, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/370.png', 1, false, '2018-11-16 05:59:58.040563', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (420, 1, 'admin', 3298, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/360.png', 1, false, '2018-11-16 05:59:58.146596', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (429, 1, 'admin', 2931, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/349.png', 1, false, '2018-11-16 05:59:58.268518', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (438, 1, 'admin', 2921, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/337.png', 1, false, '2018-11-16 05:59:58.370944', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (447, 1, 'admin', 2909, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/325.png', 1, false, '2018-11-16 05:59:58.477947', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (456, 1, 'admin', 2896, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/312.png', 1, false, '2018-11-16 05:59:58.582348', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (465, 1, 'admin', 2884, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/300.png', 1, false, '2018-11-16 05:59:58.68468', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (472, 1, 'admin', 2875, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/291.png', 1, false, '2018-11-16 05:59:58.787709', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (481, 1, 'admin', 2867, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/283.png', 1, false, '2018-11-16 05:59:58.902124', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (489, 1, 'admin', 2856, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/272.png', 1, false, '2018-11-16 05:59:59.005483', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (497, 1, 'admin', 2839, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/257.png', 1, false, '2018-11-16 05:59:59.110994', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (531, 1, 'admin', 2793, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/211.png', 1, false, '2018-11-16 05:59:59.520192', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (540, 1, 'admin', 2783, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/199.png', 1, false, '2018-11-16 05:59:59.632054', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (550, 1, 'admin', 3166, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/798.png', 1, false, '2018-11-16 05:59:59.737032', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (558, 1, 'admin', 3318, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/789.png', 1, false, '2018-11-16 05:59:59.848223', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (568, 1, 'admin', 3161, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/779.png', 1, false, '2018-11-16 05:59:59.954973', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (578, 1, 'admin', 3333, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/769.png', 1, false, '2018-11-16 06:00:00.058559', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (589, 1, 'admin', 3341, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/759.png', 1, false, '2018-11-16 06:00:00.176821', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (598, 1, 'admin', 3153, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/749.png', 1, false, '2018-11-16 06:00:00.285663', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (608, 1, 'admin', 3356, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/740.png', 1, false, '2018-11-16 06:00:00.407851', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (61, 1, 'admin', 2641, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/058.png', 1, false, '2018-11-16 05:59:53.793871', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (70, 1, 'admin', 2651, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/066.png', 1, false, '2018-11-16 05:59:53.898589', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (79, 1, 'admin', 2659, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/076.png', 1, false, '2018-11-16 05:59:54.000388', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (90, 1, 'admin', 2671, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/085.png', 1, false, '2018-11-16 05:59:54.198999', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (99, 1, 'admin', 2679, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/095.png', 1, false, '2018-11-16 05:59:54.305516', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (110, 1, 'admin', 2689, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/105.png', 1, false, '2018-11-16 05:59:54.467913', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (118, 1, 'admin', 2699, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/115.png', 1, false, '2018-11-16 05:59:54.573792', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (129, 1, 'admin', 2708, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/124.png', 1, false, '2018-11-16 05:59:54.679942', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (139, 1, 'admin', 2717, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/134.png', 1, false, '2018-11-16 05:59:54.790728', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (148, 1, 'admin', 2728, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/143.png', 1, false, '2018-11-16 05:59:54.897599', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (157, 1, 'admin', 2736, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/153.png', 1, false, '2018-11-16 05:59:55.000772', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (166, 1, 'admin', 2746, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/162.png', 1, false, '2018-11-16 05:59:55.118457', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (173, 1, 'admin', 2754, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/170.png', 1, false, '2018-11-16 05:59:55.222608', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (182, 1, 'admin', 2762, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/178.png', 1, false, '2018-11-16 05:59:55.325798', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (191, 1, 'admin', 2772, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/188.png', 1, false, '2018-11-16 05:59:55.431148', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (200, 1, 'admin', 2779, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/196.png', 1, false, '2018-11-16 05:59:55.551001', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (209, 1, 'admin', 2806, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/225.png', 1, false, '2018-11-16 05:59:55.661046', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (217, 1, 'admin', 2838, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/255.png', 1, false, '2018-11-16 05:59:55.768818', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (228, 1, 'admin', 2873, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/289.png', 1, false, '2018-11-16 05:59:55.88459', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (237, 1, 'admin', 2913, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/330.png', 1, false, '2018-11-16 05:59:55.991286', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (247, 1, 'admin', 3286, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/371.png', 1, false, '2018-11-16 05:59:56.098157', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (256, 1, 'admin', 3254, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/404.png', 1, false, '2018-11-16 05:59:56.207968', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (264, 1, 'admin', 3223, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/438.png', 1, false, '2018-11-16 05:59:56.312188', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (273, 1, 'admin', 3186, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/471.png', 1, false, '2018-11-16 05:59:56.421084', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (283, 1, 'admin', 2956, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/508.png', 1, false, '2018-11-16 05:59:56.533036', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (293, 1, 'admin', 2993, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/545.png', 1, false, '2018-11-16 05:59:56.638288', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (301, 1, 'admin', 3026, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/578.png', 1, false, '2018-11-16 05:59:56.745402', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (311, 1, 'admin', 3059, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/612.png', 1, false, '2018-11-16 05:59:56.849115', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (317, 1, 'admin', 3088, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/639.png', 1, false, '2018-11-16 05:59:56.952491', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (325, 1, 'admin', 3116, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/667.png', 1, false, '2018-11-16 05:59:57.05455', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (334, 1, 'admin', 3180, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/479.png', 1, false, '2018-11-16 05:59:57.164494', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (344, 1, 'admin', 3193, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/465.png', 1, false, '2018-11-16 05:59:57.269756', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (353, 1, 'admin', 3208, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/450.png', 1, false, '2018-11-16 05:59:57.380079', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (362, 1, 'admin', 3220, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/437.png', 1, false, '2018-11-16 05:59:57.486709', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (371, 1, 'admin', 3237, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/425.png', 1, false, '2018-11-16 05:59:57.587379', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (381, 1, 'admin', 3244, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/413.png', 1, false, '2018-11-16 05:59:57.690456', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (390, 1, 'admin', 3257, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/401.png', 1, false, '2018-11-16 05:59:57.80119', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (400, 1, 'admin', 3272, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/387.png', 1, false, '2018-11-16 05:59:57.904524', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (409, 1, 'admin', 3285, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/374.png', 1, false, '2018-11-16 05:59:58.008178', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (418, 1, 'admin', 3296, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/362.png', 1, false, '2018-11-16 05:59:58.120086', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (428, 1, 'admin', 2932, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/350.png', 1, false, '2018-11-16 05:59:58.238451', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (436, 1, 'admin', 2922, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/338.png', 1, false, '2018-11-16 05:59:58.348586', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (445, 1, 'admin', 2912, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/328.png', 1, false, '2018-11-16 05:59:58.45908', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (454, 1, 'admin', 2899, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/315.png', 1, false, '2018-11-16 05:59:58.564753', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (462, 1, 'admin', 2888, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/304.png', 1, false, '2018-11-16 05:59:58.672792', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (471, 1, 'admin', 2879, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/294.png', 1, false, '2018-11-16 05:59:58.776948', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (479, 1, 'admin', 2870, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/286.png', 1, false, '2018-11-16 05:59:58.889038', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (486, 1, 'admin', 2857, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/273.png', 1, false, '2018-11-16 05:59:58.991313', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (496, 1, 'admin', 2846, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/263.png', 1, false, '2018-11-16 05:59:59.096997', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (506, 1, 'admin', 2830, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/247.png', 1, false, '2018-11-16 05:59:59.202163', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (515, 1, 'admin', 2818, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/234.png', 1, false, '2018-11-16 05:59:59.326301', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (523, 1, 'admin', 2805, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/222.png', 1, false, '2018-11-16 05:59:59.429905', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (533, 1, 'admin', 2792, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/210.png', 1, false, '2018-11-16 05:59:59.535342', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (541, 1, 'admin', 3305, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/805.png', 1, false, '2018-11-16 05:59:59.641598', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (551, 1, 'admin', 3312, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/797.png', 1, false, '2018-11-16 05:59:59.737459', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (559, 1, 'admin', 3317, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/790.png', 1, false, '2018-11-16 05:59:59.848723', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (569, 1, 'admin', 3325, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/780.png', 1, false, '2018-11-16 05:59:59.95564', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (579, 1, 'admin', 3332, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/770.png', 1, false, '2018-11-16 06:00:00.059057', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (62, 1, 'admin', 2640, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/056.png', 1, false, '2018-11-16 05:59:53.797766', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (73, 1, 'admin', 2652, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/068.png', 1, false, '2018-11-16 05:59:53.917929', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (85, 1, 'admin', 2663, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/079.png', 1, false, '2018-11-16 05:59:54.040931', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (96, 1, 'admin', 2675, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/091.png', 1, false, '2018-11-16 05:59:54.240916', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (107, 1, 'admin', 2688, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/103.png', 1, false, '2018-11-16 05:59:54.400553', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (117, 1, 'admin', 2697, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/113.png', 1, false, '2018-11-16 05:59:54.521983', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (127, 1, 'admin', 2707, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/123.png', 1, false, '2018-11-16 05:59:54.657195', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (137, 1, 'admin', 2718, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/133.png', 1, false, '2018-11-16 05:59:54.788527', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (149, 1, 'admin', 2729, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/145.png', 1, false, '2018-11-16 05:59:54.909115', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (159, 1, 'admin', 2739, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/155.png', 1, false, '2018-11-16 05:59:55.033264', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (172, 1, 'admin', 2749, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/165.png', 1, false, '2018-11-16 05:59:55.157824', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (181, 1, 'admin', 2759, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/177.png', 1, false, '2018-11-16 05:59:55.283631', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (190, 1, 'admin', 2770, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/186.png', 1, false, '2018-11-16 05:59:55.401276', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (199, 1, 'admin', 2780, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/195.png', 1, false, '2018-11-16 05:59:55.525036', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (208, 1, 'admin', 2807, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/221.png', 1, false, '2018-11-16 05:59:55.652529', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (218, 1, 'admin', 2836, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/252.png', 1, false, '2018-11-16 05:59:55.779896', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (229, 1, 'admin', 2881, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/297.png', 1, false, '2018-11-16 05:59:55.900059', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (239, 1, 'admin', 2923, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/339.png', 1, false, '2018-11-16 05:59:56.025908', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (249, 1, 'admin', 3279, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/380.png', 1, false, '2018-11-16 05:59:56.147491', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (260, 1, 'admin', 3239, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/419.png', 1, false, '2018-11-16 05:59:56.27259', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (270, 1, 'admin', 3198, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/460.png', 1, false, '2018-11-16 05:59:56.392617', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (281, 1, 'admin', 2945, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/497.png', 1, false, '2018-11-16 05:59:56.514525', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (291, 1, 'admin', 2986, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/538.png', 1, false, '2018-11-16 05:59:56.63354', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (303, 1, 'admin', 3031, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/582.png', 1, false, '2018-11-16 05:59:56.756576', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (313, 1, 'admin', 3068, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/619.png', 1, false, '2018-11-16 05:59:56.894561', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (322, 1, 'admin', 3097, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/650.png', 1, false, '2018-11-16 05:59:57.015278', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (332, 1, 'admin', 3136, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/688.png', 1, false, '2018-11-16 05:59:57.134566', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (342, 1, 'admin', 3191, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/467.png', 1, false, '2018-11-16 05:59:57.257136', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (355, 1, 'admin', 3207, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/451.png', 1, false, '2018-11-16 05:59:57.39063', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (365, 1, 'admin', 3224, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/434.png', 1, false, '2018-11-16 05:59:57.512019', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (375, 1, 'admin', 3238, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/421.png', 1, false, '2018-11-16 05:59:57.634343', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (385, 1, 'admin', 3250, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/408.png', 1, false, '2018-11-16 05:59:57.757713', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (398, 1, 'admin', 3265, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/393.png', 1, false, '2018-11-16 05:59:57.882317', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (408, 1, 'admin', 3281, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/377.png', 1, false, '2018-11-16 05:59:58.002432', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (419, 1, 'admin', 3294, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/364.png', 1, false, '2018-11-16 05:59:58.123012', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (453, 1, 'admin', 2901, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/317.png', 1, false, '2018-11-16 05:59:58.564096', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (464, 1, 'admin', 2886, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/303.png', 1, false, '2018-11-16 05:59:58.684843', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (475, 1, 'admin', 2874, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/290.png', 1, false, '2018-11-16 05:59:58.807625', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (484, 1, 'admin', 2863, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/279.png', 1, false, '2018-11-16 05:59:58.919488', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (493, 1, 'admin', 2851, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/267.png', 1, false, '2018-11-16 05:59:59.039075', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (503, 1, 'admin', 2835, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/251.png', 1, false, '2018-11-16 05:59:59.157735', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (512, 1, 'admin', 2821, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/238.png', 1, false, '2018-11-16 05:59:59.279543', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (522, 1, 'admin', 2810, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/226.png', 1, false, '2018-11-16 05:59:59.402791', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (532, 1, 'admin', 2794, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/212.png', 1, false, '2018-11-16 05:59:59.526301', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (543, 1, 'admin', 3167, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/806.png', 1, false, '2018-11-16 05:59:59.650627', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (553, 1, 'admin', 3313, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/795.png', 1, false, '2018-11-16 05:59:59.771906', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (563, 1, 'admin', 3320, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/785.png', 1, false, '2018-11-16 05:59:59.896863', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (574, 1, 'admin', 3160, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/775.png', 1, false, '2018-11-16 06:00:00.016905', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (584, 1, 'admin', 3157, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/764.png', 1, false, '2018-11-16 06:00:00.13611', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (596, 1, 'admin', 3154, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/753.png', 1, false, '2018-11-16 06:00:00.27195', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (607, 1, 'admin', 3354, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/742.png', 1, false, '2018-11-16 06:00:00.402492', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (617, 1, 'admin', 3360, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/731.png', 1, false, '2018-11-16 06:00:00.529861', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (628, 1, 'admin', 3369, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/720.png', 1, false, '2018-11-16 06:00:00.652424', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (638, 1, 'admin', 3144, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/710.png', 1, false, '2018-11-16 06:00:00.787802', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (649, 1, 'admin', 3383, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/700.png', 1, false, '2018-11-16 06:00:00.906372', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (661, 1, 'admin', 3135, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/687.png', 1, false, '2018-11-16 06:00:01.028296', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (671, 1, 'admin', 2959, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/512.png', 1, false, '2018-11-16 06:00:01.160012', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (682, 1, 'admin', 2974, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/526.png', 1, false, '2018-11-16 06:00:01.280687', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (63, 1, 'admin', 2642, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/057.png', 1, false, '2018-11-16 05:59:53.798612', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (72, 1, 'admin', 2653, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/069.png', 1, false, '2018-11-16 05:59:53.911721', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (82, 1, 'admin', 2662, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/078.png', 1, false, '2018-11-16 05:59:54.024762', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (91, 1, 'admin', 2672, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/088.png', 1, false, '2018-11-16 05:59:54.207377', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (101, 1, 'admin', 2682, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/097.png', 1, false, '2018-11-16 05:59:54.325339', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (114, 1, 'admin', 2692, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/108.png', 1, false, '2018-11-16 05:59:54.489295', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (124, 1, 'admin', 2705, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/120.png', 1, false, '2018-11-16 05:59:54.60995', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (134, 1, 'admin', 2714, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/130.png', 1, false, '2018-11-16 05:59:54.729566', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (144, 1, 'admin', 2722, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/140.png', 1, false, '2018-11-16 05:59:54.842346', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (154, 1, 'admin', 2735, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/150.png', 1, false, '2018-11-16 05:59:54.965876', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (164, 1, 'admin', 2745, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/160.png', 1, false, '2018-11-16 05:59:55.109719', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (174, 1, 'admin', 2753, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/169.png', 1, false, '2018-11-16 05:59:55.227544', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (184, 1, 'admin', 2763, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/179.png', 1, false, '2018-11-16 05:59:55.34356', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (194, 1, 'admin', 2774, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/190.png', 1, false, '2018-11-16 05:59:55.460952', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (203, 1, 'admin', 2787, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/202.png', 1, false, '2018-11-16 05:59:55.591842', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (212, 1, 'admin', 2819, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/235.png', 1, false, '2018-11-16 05:59:55.708402', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (223, 1, 'admin', 2854, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/270.png', 1, false, '2018-11-16 05:59:55.822823', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (234, 1, 'admin', 2902, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/318.png', 1, false, '2018-11-16 05:59:55.937159', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (244, 1, 'admin', 3299, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/359.png', 1, false, '2018-11-16 05:59:56.091544', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (255, 1, 'admin', 3258, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/400.png', 1, false, '2018-11-16 05:59:56.208349', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (267, 1, 'admin', 3214, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/445.png', 1, false, '2018-11-16 05:59:56.32845', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (276, 1, 'admin', 3173, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/485.png', 1, false, '2018-11-16 05:59:56.440114', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (286, 1, 'admin', 2968, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/519.png', 1, false, '2018-11-16 05:59:56.556511', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (296, 1, 'admin', 3004, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/556.png', 1, false, '2018-11-16 05:59:56.673147', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (306, 1, 'admin', 3041, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/593.png', 1, false, '2018-11-16 05:59:56.788382', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (315, 1, 'admin', 3078, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/626.png', 1, false, '2018-11-16 05:59:56.905858', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (324, 1, 'admin', 3107, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/659.png', 1, false, '2018-11-16 05:59:57.022117', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (331, 1, 'admin', 3177, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/480.png', 1, false, '2018-11-16 05:59:57.134015', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (341, 1, 'admin', 3189, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/469.png', 1, false, '2018-11-16 05:59:57.249456', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (351, 1, 'admin', 3204, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/454.png', 1, false, '2018-11-16 05:59:57.365059', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (361, 1, 'admin', 3217, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/440.png', 1, false, '2018-11-16 05:59:57.479644', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (372, 1, 'admin', 3232, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/426.png', 1, false, '2018-11-16 05:59:57.592324', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (382, 1, 'admin', 3245, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/412.png', 1, false, '2018-11-16 05:59:57.708092', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (392, 1, 'admin', 3260, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/398.png', 1, false, '2018-11-16 05:59:57.813663', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (401, 1, 'admin', 3273, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/385.png', 1, false, '2018-11-16 05:59:57.92458', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (411, 1, 'admin', 3284, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/373.png', 1, false, '2018-11-16 05:59:58.039986', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (422, 1, 'admin', 3300, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/358.png', 1, false, '2018-11-16 05:59:58.159698', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (431, 1, 'admin', 2933, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/346.png', 1, false, '2018-11-16 05:59:58.273796', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (440, 1, 'admin', 2918, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/334.png', 1, false, '2018-11-16 05:59:58.386895', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (449, 1, 'admin', 2906, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/323.png', 1, false, '2018-11-16 05:59:58.506196', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (459, 1, 'admin', 2893, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/309.png', 1, false, '2018-11-16 05:59:58.63254', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (468, 1, 'admin', 2882, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/298.png', 1, false, '2018-11-16 05:59:58.766945', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (477, 1, 'admin', 2872, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/288.png', 1, false, '2018-11-16 05:59:58.882746', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (488, 1, 'admin', 2859, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/275.png', 1, false, '2018-11-16 05:59:58.995579', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (499, 1, 'admin', 2843, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/259.png', 1, false, '2018-11-16 05:59:59.115871', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (509, 1, 'admin', 2828, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/244.png', 1, false, '2018-11-16 05:59:59.240037', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (519, 1, 'admin', 2814, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/230.png', 1, false, '2018-11-16 05:59:59.360102', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (528, 1, 'admin', 2800, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/216.png', 1, false, '2018-11-16 05:59:59.51115', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (539, 1, 'admin', 2785, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/201.png', 1, false, '2018-11-16 05:59:59.626556', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (548, 1, 'admin', 3311, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/800.png', 1, false, '2018-11-16 05:59:59.735041', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (560, 1, 'admin', 3319, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/788.png', 1, false, '2018-11-16 05:59:59.853182', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (570, 1, 'admin', 3327, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/778.png', 1, false, '2018-11-16 05:59:59.970903', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (580, 1, 'admin', 3334, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/768.png', 1, false, '2018-11-16 06:00:00.083481', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (590, 1, 'admin', 3340, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/758.png', 1, false, '2018-11-16 06:00:00.196664', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (600, 1, 'admin', 3348, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/748.png', 1, false, '2018-11-16 06:00:00.310872', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (610, 1, 'admin', 3355, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/738.png', 1, false, '2018-11-16 06:00:00.424051', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (620, 1, 'admin', 3361, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/728.png', 1, false, '2018-11-16 06:00:00.560055', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (630, 1, 'admin', 3145, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/718.png', 1, false, '2018-11-16 06:00:00.675604', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (67, 1, 'admin', 2647, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/063.png', 1, false, '2018-11-16 05:59:53.834736', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (77, 1, 'admin', 2655, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/073.png', 1, false, '2018-11-16 05:59:53.955283', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (87, 1, 'admin', 2667, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/083.png', 1, false, '2018-11-16 05:59:54.078388', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (97, 1, 'admin', 2677, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/093.png', 1, false, '2018-11-16 05:59:54.243814', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (106, 1, 'admin', 2685, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/102.png', 1, false, '2018-11-16 05:59:54.364958', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (116, 1, 'admin', 2696, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/112.png', 1, false, '2018-11-16 05:59:54.498438', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (126, 1, 'admin', 2704, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/121.png', 1, false, '2018-11-16 05:59:54.619052', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (135, 1, 'admin', 2715, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/131.png', 1, false, '2018-11-16 05:59:54.738645', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (145, 1, 'admin', 2725, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/141.png', 1, false, '2018-11-16 05:59:54.855438', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (156, 1, 'admin', 2733, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/151.png', 1, false, '2018-11-16 05:59:54.995104', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (192, 1, 'admin', 2771, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/187.png', 1, false, '2018-11-16 05:59:55.440358', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (202, 1, 'admin', 2782, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/197.png', 1, false, '2018-11-16 05:59:55.565045', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (211, 1, 'admin', 2816, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/232.png', 1, false, '2018-11-16 05:59:55.691096', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (220, 1, 'admin', 2848, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/262.png', 1, false, '2018-11-16 05:59:55.806983', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (230, 1, 'admin', 2885, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/301.png', 1, false, '2018-11-16 05:59:55.925069', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (242, 1, 'admin', 2927, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/343.png', 1, false, '2018-11-16 05:59:56.055413', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (252, 1, 'admin', 3270, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/388.png', 1, false, '2018-11-16 05:59:56.190893', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (263, 1, 'admin', 3227, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/431.png', 1, false, '2018-11-16 05:59:56.311138', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (275, 1, 'admin', 3190, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/468.png', 1, false, '2018-11-16 05:59:56.429118', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (285, 1, 'admin', 2964, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/515.png', 1, false, '2018-11-16 05:59:56.54712', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (295, 1, 'admin', 3000, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/552.png', 1, false, '2018-11-16 05:59:56.664629', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (305, 1, 'admin', 3039, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/589.png', 1, false, '2018-11-16 05:59:56.781427', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (314, 1, 'admin', 3071, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/622.png', 1, false, '2018-11-16 05:59:56.902204', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (323, 1, 'admin', 3102, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/655.png', 1, false, '2018-11-16 05:59:57.021575', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (333, 1, 'admin', 3178, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/481.png', 1, false, '2018-11-16 05:59:57.143074', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (343, 1, 'admin', 3192, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/466.png', 1, false, '2018-11-16 05:59:57.260006', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (352, 1, 'admin', 3206, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/453.png', 1, false, '2018-11-16 05:59:57.379493', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (363, 1, 'admin', 3219, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/439.png', 1, false, '2018-11-16 05:59:57.496793', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (373, 1, 'admin', 3233, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/424.png', 1, false, '2018-11-16 05:59:57.616191', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (384, 1, 'admin', 3248, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/410.png', 1, false, '2018-11-16 05:59:57.734843', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (394, 1, 'admin', 3262, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/396.png', 1, false, '2018-11-16 05:59:57.857287', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (405, 1, 'admin', 3276, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/382.png', 1, false, '2018-11-16 05:59:57.985962', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (416, 1, 'admin', 3289, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/369.png', 1, false, '2018-11-16 05:59:58.101169', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (427, 1, 'admin', 2937, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/353.png', 1, false, '2018-11-16 05:59:58.237957', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (437, 1, 'admin', 2926, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/340.png', 1, false, '2018-11-16 05:59:58.354977', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (446, 1, 'admin', 2911, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/327.png', 1, false, '2018-11-16 05:59:58.473513', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (457, 1, 'admin', 2897, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/313.png', 1, false, '2018-11-16 05:59:58.59088', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (467, 1, 'admin', 2883, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/299.png', 1, false, '2018-11-16 05:59:58.707883', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (476, 1, 'admin', 2788, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/204.png', 1, false, '2018-11-16 05:59:58.828078', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (485, 1, 'admin', 2862, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/278.png', 1, false, '2018-11-16 05:59:58.947255', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (495, 1, 'admin', 2847, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/264.png', 1, false, '2018-11-16 05:59:59.066152', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (505, 1, 'admin', 2833, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/249.png', 1, false, '2018-11-16 05:59:59.196576', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (514, 1, 'admin', 2820, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/236.png', 1, false, '2018-11-16 05:59:59.317324', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (524, 1, 'admin', 2808, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/223.png', 1, false, '2018-11-16 05:59:59.435472', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (534, 1, 'admin', 2797, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/208.png', 1, false, '2018-11-16 05:59:59.565653', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (546, 1, 'admin', 3307, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/804.png', 1, false, '2018-11-16 05:59:59.685333', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (556, 1, 'admin', 3315, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/793.png', 1, false, '2018-11-16 05:59:59.80803', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (566, 1, 'admin', 3323, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/782.png', 1, false, '2018-11-16 05:59:59.921955', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (576, 1, 'admin', 3330, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/772.png', 1, false, '2018-11-16 06:00:00.047293', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (588, 1, 'admin', 3339, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/762.png', 1, false, '2018-11-16 06:00:00.169213', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (599, 1, 'admin', 3347, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/750.png', 1, false, '2018-11-16 06:00:00.290368', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (609, 1, 'admin', 3353, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/739.png', 1, false, '2018-11-16 06:00:00.421944', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (619, 1, 'admin', 3148, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/729.png', 1, false, '2018-11-16 06:00:00.546157', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (629, 1, 'admin', 3370, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/719.png', 1, false, '2018-11-16 06:00:00.674672', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (642, 1, 'admin', 3377, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/709.png', 1, false, '2018-11-16 06:00:00.796841', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (652, 1, 'admin', 3386, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/697.png', 1, false, '2018-11-16 06:00:00.919824', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (663, 1, 'admin', 3132, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/685.png', 1, false, '2018-11-16 06:00:01.040354', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (672, 1, 'admin', 2961, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/513.png', 1, false, '2018-11-16 06:00:01.162886', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (586, 1, 'admin', 3156, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/760.png', 1, false, '2018-11-16 06:00:00.160553', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (595, 1, 'admin', 3346, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/752.png', 1, false, '2018-11-16 06:00:00.271118', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (603, 1, 'admin', 3350, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/744.png', 1, false, '2018-11-16 06:00:00.381623', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (613, 1, 'admin', 3358, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/735.png', 1, false, '2018-11-16 06:00:00.487678', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (623, 1, 'admin', 3147, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/725.png', 1, false, '2018-11-16 06:00:00.594396', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (633, 1, 'admin', 3375, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/715.png', 1, false, '2018-11-16 06:00:00.699285', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (643, 1, 'admin', 3380, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/705.png', 1, false, '2018-11-16 06:00:00.802534', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (651, 1, 'admin', 3139, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/695.png', 1, false, '2018-11-16 06:00:00.918017', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (660, 1, 'admin', 3134, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/686.png', 1, false, '2018-11-16 06:00:01.026325', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (668, 1, 'admin', 3123, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/676.png', 1, false, '2018-11-16 06:00:01.138898', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (676, 1, 'admin', 2970, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/521.png', 1, false, '2018-11-16 06:00:01.241283', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (686, 1, 'admin', 2980, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/532.png', 1, false, '2018-11-16 06:00:01.347603', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (696, 1, 'admin', 2994, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/546.png', 1, false, '2018-11-16 06:00:01.45411', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (706, 1, 'admin', 3009, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/559.png', 1, false, '2018-11-16 06:00:01.571736', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (716, 1, 'admin', 3021, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/573.png', 1, false, '2018-11-16 06:00:01.676561', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (726, 1, 'admin', 3033, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/587.png', 1, false, '2018-11-16 06:00:01.784392', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (735, 1, 'admin', 3048, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/600.png', 1, false, '2018-11-16 06:00:01.892825', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (744, 1, 'admin', 3060, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/611.png', 1, false, '2018-11-16 06:00:02.014917', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (754, 1, 'admin', 3080, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/625.png', 1, false, '2018-11-16 06:00:02.141213', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (763, 1, 'admin', 3085, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/640.png', 1, false, '2018-11-16 06:00:02.250339', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (771, 1, 'admin', 3111, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/664.png', 1, false, '2018-11-16 06:00:02.37591', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (781, 1, 'admin', 3101, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/653.png', 1, false, '2018-11-16 06:00:02.492669', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (791, 1, 'admin', 3175, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/483.png', 1, false, '2018-11-16 06:00:02.598808', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (801, 1, 'admin', 2944, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/496.png', 1, false, '2018-11-16 06:00:02.703295', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (811, 1, 'admin', 2958, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/510.png', 1, false, '2018-11-16 06:00:02.820597', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (602, 1, 'admin', 3351, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/746.png', 1, false, '2018-11-16 06:00:00.345174', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (612, 1, 'admin', 3357, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/736.png', 1, false, '2018-11-16 06:00:00.457234', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (622, 1, 'admin', 3365, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/726.png', 1, false, '2018-11-16 06:00:00.57044', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (632, 1, 'admin', 3371, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/717.png', 1, false, '2018-11-16 06:00:00.682459', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (641, 1, 'admin', 3379, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/707.png', 1, false, '2018-11-16 06:00:00.796407', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (650, 1, 'admin', 3385, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/698.png', 1, false, '2018-11-16 06:00:00.910758', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (657, 1, 'admin', 3140, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/689.png', 1, false, '2018-11-16 06:00:01.017852', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (667, 1, 'admin', 3126, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/678.png', 1, false, '2018-11-16 06:00:01.13451', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (678, 1, 'admin', 2967, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/520.png', 1, false, '2018-11-16 06:00:01.246197', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (687, 1, 'admin', 2981, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/533.png', 1, false, '2018-11-16 06:00:01.354969', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (697, 1, 'admin', 2995, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/547.png', 1, false, '2018-11-16 06:00:01.465361', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (707, 1, 'admin', 3008, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/561.png', 1, false, '2018-11-16 06:00:01.576696', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (718, 1, 'admin', 3023, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/575.png', 1, false, '2018-11-16 06:00:01.695837', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (728, 1, 'admin', 3036, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/588.png', 1, false, '2018-11-16 06:00:01.807852', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (737, 1, 'admin', 3050, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/602.png', 1, false, '2018-11-16 06:00:01.922713', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (747, 1, 'admin', 3063, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/615.png', 1, false, '2018-11-16 06:00:02.036866', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (758, 1, 'admin', 3074, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/630.png', 1, false, '2018-11-16 06:00:02.166339', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (766, 1, 'admin', 3091, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/642.png', 1, false, '2018-11-16 06:00:02.284048', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (776, 1, 'admin', 3108, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/660.png', 1, false, '2018-11-16 06:00:02.391608', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (784, 1, 'admin', 3096, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/648.png', 1, false, '2018-11-16 06:00:02.50245', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (793, 1, 'admin', 3174, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/484.png', 1, false, '2018-11-16 06:00:02.615259', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (802, 1, 'admin', 2946, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/498.png', 1, false, '2018-11-16 06:00:02.725555', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (618, 1, 'admin', 3363, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/730.png', 1, false, '2018-11-16 06:00:00.532062', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (626, 1, 'admin', 3146, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/721.png', 1, false, '2018-11-16 06:00:00.639969', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (635, 1, 'admin', 3373, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/713.png', 1, false, '2018-11-16 06:00:00.763017', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (645, 1, 'admin', 3381, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/703.png', 1, false, '2018-11-16 06:00:00.877797', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (655, 1, 'admin', 3389, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/693.png', 1, false, '2018-11-16 06:00:00.987374', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (665, 1, 'admin', 3129, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/681.png', 1, false, '2018-11-16 06:00:01.09518', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (674, 1, 'admin', 2965, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/517.png', 1, false, '2018-11-16 06:00:01.197332', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (684, 1, 'admin', 2979, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/529.png', 1, false, '2018-11-16 06:00:01.310099', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (694, 1, 'admin', 2991, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/543.png', 1, false, '2018-11-16 06:00:01.418636', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (702, 1, 'admin', 3006, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/557.png', 1, false, '2018-11-16 06:00:01.521743', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (710, 1, 'admin', 3018, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/568.png', 1, false, '2018-11-16 06:00:01.63067', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (719, 1, 'admin', 3027, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/579.png', 1, false, '2018-11-16 06:00:01.736498', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (729, 1, 'admin', 3040, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/591.png', 1, false, '2018-11-16 06:00:01.842183', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (739, 1, 'admin', 3051, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/604.png', 1, false, '2018-11-16 06:00:01.949365', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (749, 1, 'admin', 3066, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/618.png', 1, false, '2018-11-16 06:00:02.056796', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (757, 1, 'admin', 3082, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/633.png', 1, false, '2018-11-16 06:00:02.166032', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (767, 1, 'admin', 3120, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/672.png', 1, false, '2018-11-16 06:00:02.290641', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (777, 1, 'admin', 3106, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/658.png', 1, false, '2018-11-16 06:00:02.395752', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (787, 1, 'admin', 3093, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/645.png', 1, false, '2018-11-16 06:00:02.526892', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (795, 1, 'admin', 2939, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/491.png', 1, false, '2018-11-16 06:00:02.631179', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (805, 1, 'admin', 2949, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/502.png', 1, false, '2018-11-16 06:00:02.744836', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (634, 1, 'admin', 3143, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/714.png', 1, false, '2018-11-16 06:00:00.752166', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (644, 1, 'admin', 3382, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/704.png', 1, false, '2018-11-16 06:00:00.868241', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (654, 1, 'admin', 3388, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/694.png', 1, false, '2018-11-16 06:00:00.978595', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (664, 1, 'admin', 3130, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/682.png', 1, false, '2018-11-16 06:00:01.090805', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (675, 1, 'admin', 2963, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/516.png', 1, false, '2018-11-16 06:00:01.199325', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (685, 1, 'admin', 2978, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/531.png', 1, false, '2018-11-16 06:00:01.312103', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (695, 1, 'admin', 2992, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/544.png', 1, false, '2018-11-16 06:00:01.420665', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (703, 1, 'admin', 3005, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/558.png', 1, false, '2018-11-16 06:00:01.529958', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (712, 1, 'admin', 3017, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/569.png', 1, false, '2018-11-16 06:00:01.644181', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (722, 1, 'admin', 3029, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/583.png', 1, false, '2018-11-16 06:00:01.759352', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (732, 1, 'admin', 3043, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/595.png', 1, false, '2018-11-16 06:00:01.86954', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (740, 1, 'admin', 3057, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/609.png', 1, false, '2018-11-16 06:00:01.982847', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (750, 1, 'admin', 3067, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/620.png', 1, false, '2018-11-16 06:00:02.096119', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (760, 1, 'admin', 3081, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/634.png', 1, false, '2018-11-16 06:00:02.231859', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (770, 1, 'admin', 3115, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/668.png', 1, false, '2018-11-16 06:00:02.343385', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (780, 1, 'admin', 3103, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/654.png', 1, false, '2018-11-16 06:00:02.471565', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (790, 1, 'admin', 3122, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/674.png', 1, false, '2018-11-16 06:00:02.581547', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (800, 1, 'admin', 2943, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/495.png', 1, false, '2018-11-16 06:00:02.693068', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (810, 1, 'admin', 2957, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/509.png', 1, false, '2018-11-16 06:00:02.813643', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (636, 1, 'admin', 3376, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/711.png', 1, false, '2018-11-16 06:00:00.779588', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (646, 1, 'admin', 3141, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/702.png', 1, false, '2018-11-16 06:00:00.892733', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (656, 1, 'admin', 3390, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/692.png', 1, false, '2018-11-16 06:00:01.005124', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (666, 1, 'admin', 3127, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/680.png', 1, false, '2018-11-16 06:00:01.130313', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (677, 1, 'admin', 2966, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/518.png', 1, false, '2018-11-16 06:00:01.243879', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (688, 1, 'admin', 2983, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/535.png', 1, false, '2018-11-16 06:00:01.359004', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (698, 1, 'admin', 2996, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/549.png', 1, false, '2018-11-16 06:00:01.471335', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (708, 1, 'admin', 3010, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/562.png', 1, false, '2018-11-16 06:00:01.583506', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (717, 1, 'admin', 3025, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/576.png', 1, false, '2018-11-16 06:00:01.694379', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (727, 1, 'admin', 3037, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/590.png', 1, false, '2018-11-16 06:00:01.80583', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (738, 1, 'admin', 3052, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/603.png', 1, false, '2018-11-16 06:00:01.92968', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (748, 1, 'admin', 3064, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/617.png', 1, false, '2018-11-16 06:00:02.041234', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (756, 1, 'admin', 3073, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/631.png', 1, false, '2018-11-16 06:00:02.164337', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (768, 1, 'admin', 3118, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/670.png', 1, false, '2018-11-16 06:00:02.302247', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (778, 1, 'admin', 3104, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/657.png', 1, false, '2018-11-16 06:00:02.415071', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (788, 1, 'admin', 3092, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/644.png', 1, false, '2018-11-16 06:00:02.529689', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (796, 1, 'admin', 2940, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/492.png', 1, false, '2018-11-16 06:00:02.63406', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (806, 1, 'admin', 2953, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/505.png', 1, false, '2018-11-16 06:00:02.747668', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (639, 1, 'admin', 3378, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/708.png', 1, false, '2018-11-16 06:00:00.790207', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (647, 1, 'admin', 3137, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/699.png', 1, false, '2018-11-16 06:00:00.900241', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (658, 1, 'admin', 3138, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/691.png', 1, false, '2018-11-16 06:00:01.018535', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (669, 1, 'admin', 3125, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/677.png', 1, false, '2018-11-16 06:00:01.143845', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (679, 1, 'admin', 2969, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/522.png', 1, false, '2018-11-16 06:00:01.266091', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (689, 1, 'admin', 2984, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/536.png', 1, false, '2018-11-16 06:00:01.379347', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (699, 1, 'admin', 2998, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/550.png', 1, false, '2018-11-16 06:00:01.498819', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (709, 1, 'admin', 3013, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/564.png', 1, false, '2018-11-16 06:00:01.625194', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (720, 1, 'admin', 3024, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/577.png', 1, false, '2018-11-16 06:00:01.741487', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (730, 1, 'admin', 3038, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/592.png', 1, false, '2018-11-16 06:00:01.857556', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (742, 1, 'admin', 3054, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/606.png', 1, false, '2018-11-16 06:00:01.986232', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (752, 1, 'admin', 3070, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/623.png', 1, false, '2018-11-16 06:00:02.11801', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (762, 1, 'admin', 3087, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/637.png', 1, false, '2018-11-16 06:00:02.244688', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (773, 1, 'admin', 3113, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/665.png', 1, false, '2018-11-16 06:00:02.38138', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (783, 1, 'admin', 3099, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/651.png', 1, false, '2018-11-16 06:00:02.498109', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (794, 1, 'admin', 3171, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/487.png', 1, false, '2018-11-16 06:00:02.623369', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (804, 1, 'admin', 2952, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/501.png', 1, false, '2018-11-16 06:00:02.736472', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (659, 1, 'admin', 3391, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/690.png', 1, false, '2018-11-16 06:00:01.02232', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (670, 1, 'admin', 3195, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/463.png', 1, false, '2018-11-16 06:00:01.14858', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (681, 1, 'admin', 2971, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/524.png', 1, false, '2018-11-16 06:00:01.279048', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (691, 1, 'admin', 2989, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/540.png', 1, false, '2018-11-16 06:00:01.397317', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (704, 1, 'admin', 3003, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/554.png', 1, false, '2018-11-16 06:00:01.53069', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (714, 1, 'admin', 3016, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/570.png', 1, false, '2018-11-16 06:00:01.651661', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (724, 1, 'admin', 3032, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/584.png', 1, false, '2018-11-16 06:00:01.772846', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (734, 1, 'admin', 3046, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/598.png', 1, false, '2018-11-16 06:00:01.892018', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (745, 1, 'admin', 3061, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/613.png', 1, false, '2018-11-16 06:00:02.022718', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (755, 1, 'admin', 3077, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/627.png', 1, false, '2018-11-16 06:00:02.150712', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (765, 1, 'admin', 3089, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/641.png', 1, false, '2018-11-16 06:00:02.26724', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (774, 1, 'admin', 3109, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/661.png', 1, false, '2018-11-16 06:00:02.387498', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (786, 1, 'admin', 3095, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/647.png', 1, false, '2018-11-16 06:00:02.512118', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (798, 1, 'admin', 2938, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/490.png', 1, false, '2018-11-16 06:00:02.637579', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (808, 1, 'admin', 2954, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/506.png', 1, false, '2018-11-16 06:00:02.76524', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (662, 1, 'admin', 3131, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/683.png', 1, false, '2018-11-16 06:00:01.037431', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (673, 1, 'admin', 2962, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/514.png', 1, false, '2018-11-16 06:00:01.16642', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (680, 1, 'admin', 2976, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/528.png', 1, false, '2018-11-16 06:00:01.274327', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (690, 1, 'admin', 2985, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/537.png', 1, false, '2018-11-16 06:00:01.385', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (700, 1, 'admin', 2999, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/551.png', 1, false, '2018-11-16 06:00:01.51069', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (711, 1, 'admin', 3012, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/565.png', 1, false, '2018-11-16 06:00:01.631076', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (721, 1, 'admin', 3028, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/580.png', 1, false, '2018-11-16 06:00:01.752867', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (731, 1, 'admin', 3042, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/594.png', 1, false, '2018-11-16 06:00:01.867178', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (741, 1, 'admin', 3055, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/607.png', 1, false, '2018-11-16 06:00:01.985571', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (751, 1, 'admin', 3069, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/621.png', 1, false, '2018-11-16 06:00:02.098877', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (761, 1, 'admin', 3083, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/635.png', 1, false, '2018-11-16 06:00:02.24392', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (772, 1, 'admin', 3114, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/666.png', 1, false, '2018-11-16 06:00:02.380664', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (782, 1, 'admin', 3100, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/652.png', 1, false, '2018-11-16 06:00:02.497395', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (792, 1, 'admin', 3172, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/486.png', 1, false, '2018-11-16 06:00:02.61453', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (803, 1, 'admin', 2947, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/499.png', 1, false, '2018-11-16 06:00:02.725456', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (683, 1, 'admin', 2973, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/525.png', 1, false, '2018-11-16 06:00:01.283584', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (693, 1, 'admin', 2987, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/539.png', 1, false, '2018-11-16 06:00:01.401821', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (701, 1, 'admin', 3001, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/553.png', 1, false, '2018-11-16 06:00:01.519976', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (713, 1, 'admin', 3014, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/566.png', 1, false, '2018-11-16 06:00:01.644863', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (723, 1, 'admin', 3030, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/581.png', 1, false, '2018-11-16 06:00:01.771385', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (733, 1, 'admin', 3045, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/596.png', 1, false, '2018-11-16 06:00:01.890708', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (743, 1, 'admin', 3058, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/610.png', 1, false, '2018-11-16 06:00:02.014055', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (753, 1, 'admin', 3079, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/624.png', 1, false, '2018-11-16 06:00:02.133602', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (764, 1, 'admin', 3086, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/638.png', 1, false, '2018-11-16 06:00:02.253169', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (775, 1, 'admin', 3110, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/662.png', 1, false, '2018-11-16 06:00:02.389965', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (785, 1, 'admin', 3098, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/649.png', 1, false, '2018-11-16 06:00:02.51156', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (797, 1, 'admin', 3170, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/488.png', 1, false, '2018-11-16 06:00:02.635513', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (807, 1, 'admin', 2951, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/503.png', 1, false, '2018-11-16 06:00:02.75888', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (692, 1, 'admin', 2988, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/541.png', 1, false, '2018-11-16 06:00:01.399586', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (705, 1, 'admin', 3002, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/555.png', 1, false, '2018-11-16 06:00:01.534', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (715, 1, 'admin', 3019, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/572.png', 1, false, '2018-11-16 06:00:01.653292', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (725, 1, 'admin', 3034, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/586.png', 1, false, '2018-11-16 06:00:01.778234', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (736, 1, 'admin', 3047, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/599.png', 1, false, '2018-11-16 06:00:01.903119', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (746, 1, 'admin', 3062, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/614.png', 1, false, '2018-11-16 06:00:02.024344', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (759, 1, 'admin', 3076, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/628.png', 1, false, '2018-11-16 06:00:02.172546', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (769, 1, 'admin', 3117, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/669.png', 1, false, '2018-11-16 06:00:02.310537', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (779, 1, 'admin', 3105, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/656.png', 1, false, '2018-11-16 06:00:02.437674', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (789, 1, 'admin', 3121, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/673.png', 1, false, '2018-11-16 06:00:02.563979', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (799, 1, 'admin', 2942, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/494.png', 1, false, '2018-11-16 06:00:02.685623', NULL);
INSERT INTO public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") VALUES (809, 1, 'admin', 2955, 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/507.png', 1, false, '2018-11-16 06:00:02.807401', NULL);


--
-- Data for Name: RepositoryScore; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: RepositoryTopics; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2870, 2586, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2871, 2586, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2872, 2586, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2873, 2590, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2874, 2590, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2875, 2592, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2876, 2593, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2877, 2592, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2878, 2590, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2879, 2592, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2880, 2593, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2881, 2593, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2882, 2587, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2883, 2588, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2884, 2585, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2885, 2585, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2886, 2587, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2887, 2588, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2888, 2588, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2889, 2587, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2890, 2585, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2891, 2589, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2892, 2589, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2893, 2589, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2894, 2591, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2895, 2591, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2896, 2594, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2897, 2594, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2898, 2591, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2899, 2594, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2900, 2595, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2901, 2595, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2902, 2595, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2903, 2596, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2904, 2596, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2905, 2596, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2906, 2597, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2907, 2599, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2908, 2597, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2909, 2597, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2910, 2599, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2911, 2599, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2912, 2598, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2913, 2598, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2914, 2598, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2915, 2600, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2916, 2600, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2917, 2602, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2918, 2602, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2919, 2600, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2920, 2604, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2921, 2601, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2922, 2604, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2923, 2603, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2924, 2604, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2925, 2603, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2926, 2603, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2927, 2601, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2928, 2601, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2929, 2602, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2930, 2605, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2931, 2605, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2932, 2606, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2933, 2606, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2934, 2605, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2935, 2606, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2936, 2607, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2937, 2607, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2938, 2608, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2939, 2607, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2940, 2608, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2941, 2608, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2942, 2609, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2943, 2609, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2944, 2609, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2945, 2610, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2946, 2610, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2947, 2611, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2948, 2611, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2949, 2610, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2950, 2612, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2951, 2611, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2952, 2612, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2953, 2612, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2954, 2613, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2955, 2613, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2956, 2613, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2957, 2614, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2958, 2614, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2959, 2614, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2960, 2615, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2961, 2615, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2962, 2615, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2963, 2616, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2964, 2616, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2965, 2616, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2966, 2617, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2967, 2617, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2968, 2617, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2969, 2618, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2970, 2618, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2971, 2618, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2972, 2620, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2973, 2620, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2974, 2620, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2975, 2621, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2976, 2621, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2977, 2622, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2978, 2621, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2979, 2622, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2980, 2624, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2981, 2622, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2982, 2624, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2983, 2624, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2984, 2619, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2985, 2619, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2986, 2619, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2987, 2623, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2988, 2623, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2989, 2626, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2990, 2623, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2991, 2626, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2992, 2625, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2993, 2626, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2994, 2625, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2995, 2625, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2996, 2627, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2997, 2627, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2998, 2628, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (2999, 2627, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3000, 2628, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3001, 2628, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3002, 2629, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3003, 2629, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3004, 2629, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3005, 2630, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3006, 2630, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3007, 2631, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3008, 2630, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3009, 2631, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3010, 2631, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3011, 2632, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3012, 2632, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3013, 2632, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3014, 2635, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3015, 2635, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3016, 2635, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3017, 2634, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3018, 2634, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3019, 2633, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3020, 2633, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3021, 2633, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3022, 2634, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3023, 2636, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3024, 2636, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3025, 2636, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3026, 2637, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3027, 2637, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3028, 2638, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3029, 2638, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3030, 2637, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3031, 2638, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3032, 2639, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3033, 2639, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3034, 2639, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3035, 2640, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3036, 2640, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3037, 2640, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3038, 2642, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3039, 2642, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3040, 2642, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3041, 2641, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3042, 2641, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3043, 2643, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3044, 2641, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3045, 2643, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3046, 2643, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3055, 2647, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3066, 2651, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3076, 2653, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3086, 2655, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3096, 2659, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3106, 2663, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3116, 2667, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3126, 2669, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3135, 2674, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3145, 2676, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3155, 2688, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3164, 2693, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3174, 2698, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3185, 2703, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3195, 2708, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3205, 2713, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3215, 2717, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3226, 2724, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3235, 2727, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3246, 2732, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3255, 2737, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3265, 2739, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3275, 2742, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3287, 2747, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3296, 2752, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3305, 2756, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3315, 2759, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3326, 2766, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3336, 2772, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3346, 2777, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3356, 2781, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3366, 2787, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3376, 2791, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3388, 2812, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3399, 2817, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3410, 2823, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3418, 2827, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3427, 2832, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3434, 2836, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3445, 2841, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3455, 2848, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3465, 2851, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3475, 2856, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3485, 2860, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3495, 2866, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3505, 2887, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3515, 2905, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3525, 2910, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3536, 2913, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3547, 2919, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3555, 2926, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3563, 2927, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3571, 2930, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3579, 2936, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3589, 3302, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3599, 3296, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3610, 3289, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3619, 3253, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3630, 3248, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3639, 3244, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3649, 3240, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3659, 3234, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3669, 3232, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3679, 3228, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3688, 3224, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3698, 3223, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3708, 3215, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3719, 3211, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3729, 3207, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3739, 3203, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3749, 3198, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3758, 3195, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3792, 3179, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3803, 3176, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3812, 3171, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3821, 2938, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3831, 2942, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3841, 2946, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3852, 2949, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3863, 2953, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3873, 2957, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3883, 2959, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3893, 2964, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3903, 2968, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3913, 2969, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3923, 2973, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3933, 2979, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3943, 2980, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3953, 2983, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3962, 2987, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3972, 2990, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3982, 2993, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3992, 2997, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4002, 3000, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4012, 3002, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4023, 3005, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4033, 3010, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4044, 3014, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4054, 3065, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4064, 3067, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4075, 3080, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4085, 3076, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4095, 3072, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4105, 3083, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4115, 3086, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4125, 3091, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4135, 3093, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4145, 3096, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4156, 3100, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4165, 3110, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4175, 3107, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4185, 3102, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4196, 3100, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4205, 3117, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4215, 3120, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4225, 3124, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4235, 3126, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4245, 3130, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4254, 3132, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4262, 3136, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4271, 3391, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4282, 3388, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4292, 3386, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4302, 3384, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4312, 3382, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4321, 3379, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4331, 3144, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4341, 3143, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4352, 3145, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4362, 3146, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4371, 3366, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4382, 3364, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4393, 3360, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4403, 3362, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4413, 3355, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4422, 3069, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4432, 3061, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4441, 3058, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4451, 3054, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4461, 3052, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4470, 3048, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4479, 3044, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4488, 3042, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4499, 3037, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4509, 3033, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4518, 3032, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4528, 3028, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4538, 3024, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4548, 3022, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4558, 3020, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4568, 2944, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4578, 3177, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4588, 3194, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4598, 3211, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4608, 3227, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4618, 3235, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4628, 3250, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4639, 3259, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4648, 3262, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4659, 3266, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4668, 3269, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4680, 3273, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4691, 3276, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4701, 3280, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4711, 3285, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4721, 3286, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4731, 3293, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4741, 3301, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4751, 2934, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4761, 2920, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4773, 2906, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4783, 2901, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4793, 2851, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4803, 2897, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4813, 2893, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4823, 2890, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4833, 2883, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4843, 2878, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4853, 2877, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4865, 2872, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4876, 2864, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4886, 2856, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4897, 2845, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4907, 2835, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3047, 2645, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3056, 2647, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3067, 2651, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3077, 2656, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3087, 2655, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3097, 2659, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3107, 2664, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3117, 2667, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3127, 2669, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3137, 2673, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3146, 2677, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3157, 2687, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3165, 2693, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3175, 2698, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3186, 2703, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3197, 2709, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3207, 2713, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3217, 2719, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3227, 2722, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3237, 2729, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3247, 2734, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3257, 2737, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3267, 2740, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3278, 2745, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3288, 2747, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3297, 2753, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3306, 2757, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3316, 2762, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3325, 2767, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3335, 2771, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3345, 2776, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3355, 2782, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3365, 2787, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3374, 2791, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3384, 2793, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3396, 2815, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3406, 2822, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3416, 2826, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3425, 2830, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3435, 2835, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3446, 2839, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3456, 2848, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3466, 2850, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3476, 2857, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3486, 2862, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3496, 2867, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3506, 2887, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3517, 2907, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3528, 2911, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3538, 2915, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3548, 2920, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3557, 2926, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3566, 2928, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3575, 2931, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3586, 3303, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3597, 3298, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3607, 3290, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3617, 3254, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3626, 3250, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3636, 3245, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3646, 3242, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3657, 3236, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3667, 3237, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3677, 3229, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3687, 3225, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3697, 3220, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3707, 3215, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3716, 3212, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3726, 3208, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3736, 3204, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3745, 3200, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3754, 3197, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3764, 3192, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3774, 3189, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3783, 3184, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3794, 3179, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3804, 3176, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3813, 3171, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3823, 2939, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3833, 2943, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3844, 2947, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3853, 2949, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3864, 2954, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3874, 2957, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3884, 2959, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3894, 2963, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3906, 2968, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3916, 2972, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3926, 2974, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3936, 2977, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3946, 2981, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3956, 2984, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3966, 2989, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3976, 2991, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3987, 2994, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3997, 2998, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4007, 3001, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4018, 3006, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4028, 3008, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4037, 3013, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4047, 3015, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4057, 3064, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4066, 3071, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4076, 3078, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4086, 3075, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4096, 3072, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4106, 3083, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4116, 3088, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4126, 3091, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4137, 3094, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4147, 3098, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4157, 3113, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4167, 3109, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4176, 3106, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4186, 3102, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4197, 3113, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4207, 3117, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4216, 3120, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4226, 3124, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4237, 3128, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4247, 3130, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4256, 3132, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4265, 3136, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4275, 3390, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4285, 3139, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4295, 3385, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4306, 3141, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4318, 3380, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4328, 3377, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4338, 3373, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4348, 3372, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4358, 3369, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4367, 3368, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4376, 3365, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4386, 3148, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4396, 3359, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4406, 3358, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4442, 3057, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4453, 3054, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4462, 3052, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4471, 3048, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4481, 3044, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4491, 3041, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4501, 3037, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4511, 3034, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4521, 3029, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4531, 3028, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4541, 3025, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4553, 3021, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4563, 3017, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4574, 3173, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4584, 3188, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4595, 3204, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4605, 3220, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4614, 3228, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4625, 3244, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4635, 3257, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4645, 3261, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4655, 3264, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4665, 3268, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4675, 3272, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4685, 3275, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4695, 3279, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4705, 3282, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4714, 3284, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4724, 3288, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4734, 3294, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4744, 2937, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4755, 2929, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4764, 2915, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4774, 2904, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4784, 2900, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4794, 2812, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4804, 2896, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4814, 2893, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4825, 2889, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4834, 2882, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4846, 2878, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4857, 2875, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4868, 2871, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4878, 2863, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4888, 2854, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4898, 2844, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4908, 2834, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4919, 2823, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3048, 2645, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3058, 2647, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3065, 2651, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3073, 2653, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3080, 2657, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3091, 2658, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3101, 2662, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3111, 2666, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3121, 2668, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3130, 2672, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3140, 2675, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3150, 2681, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3159, 2690, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3168, 2694, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3176, 2699, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3184, 2701, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3194, 2707, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3204, 2712, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3214, 2718, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3223, 2723, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3233, 2728, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3241, 2731, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3250, 2735, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3260, 2736, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3269, 2743, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3279, 2744, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3311, 2759, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3320, 2765, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3330, 2769, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3339, 2774, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3349, 2778, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3357, 2783, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3367, 2786, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3377, 2797, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3385, 2794, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3393, 2816, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3403, 2819, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3413, 2824, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3422, 2831, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3431, 2833, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3441, 2840, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3450, 2843, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3460, 2847, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3470, 2853, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3479, 2859, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3488, 2863, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3498, 2868, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3508, 2886, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3518, 2907, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3527, 2910, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3537, 2915, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3546, 2919, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3554, 2923, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3561, 2924, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3568, 2933, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3577, 2935, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3587, 3301, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3596, 3298, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3605, 3291, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3614, 3255, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3624, 3252, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3634, 3247, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3644, 3243, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3654, 3239, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3663, 3233, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3672, 3231, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3682, 3227, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3691, 3221, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3699, 3219, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3709, 3213, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3718, 3212, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3728, 3208, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3761, 3194, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3768, 3190, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3777, 3186, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3786, 3183, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3796, 3180, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3806, 3175, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3815, 3170, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3825, 2939, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3834, 2943, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3842, 2947, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3851, 2952, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3861, 2953, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3871, 2956, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3881, 2960, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3891, 2964, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3900, 2966, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3909, 2970, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3918, 2971, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3928, 2975, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3938, 2977, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3949, 2982, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3958, 2985, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3969, 2988, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3979, 2992, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3989, 2995, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3998, 2999, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4008, 3003, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4016, 3006, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4024, 3007, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4034, 3010, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4043, 3012, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4052, 3063, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4062, 3068, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4072, 3079, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4082, 3077, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4092, 3073, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4102, 3081, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4112, 3087, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4122, 3089, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4130, 3090, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4140, 3095, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4149, 3097, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4158, 3111, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4168, 3109, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4178, 3106, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4187, 3103, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4194, 3114, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4204, 3115, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4214, 3119, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4224, 3124, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4234, 3126, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4244, 3129, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4251, 3133, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4260, 3135, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4267, 3391, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4277, 3389, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4286, 3387, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4296, 3137, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4307, 3141, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4316, 3142, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4326, 3377, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4335, 3374, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4345, 3375, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4355, 3145, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4364, 3367, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4374, 3147, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4383, 3361, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4391, 3360, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4401, 3362, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4411, 3151, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4419, 3079, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4427, 3062, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4436, 3060, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4445, 3056, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4480, 3045, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4490, 3041, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4498, 3040, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4507, 3033, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4517, 3032, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4527, 3030, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4536, 3026, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4545, 3023, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4555, 3019, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4564, 3018, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4573, 3172, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4583, 3187, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4591, 3202, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4601, 3215, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4610, 3278, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4620, 3238, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4629, 3251, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4638, 3259, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4647, 3262, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4657, 3265, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4667, 3268, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4676, 3271, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4686, 3275, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4696, 3279, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4706, 3282, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4716, 3284, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4725, 3290, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4733, 3294, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4743, 3304, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4752, 2933, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4762, 2919, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4771, 2907, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4781, 2901, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4791, 2884, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4801, 2897, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4810, 2894, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4819, 2891, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4827, 2885, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4837, 2881, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3049, 2645, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3059, 2648, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3069, 2650, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3079, 2656, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3089, 2660, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3099, 2661, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3109, 2664, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3119, 2668, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3129, 2670, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3139, 2673, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3149, 2683, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3160, 2689, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3169, 2695, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3179, 2700, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3187, 2704, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3196, 2708, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3206, 2713, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3216, 2717, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3225, 2724, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3236, 2727, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3245, 2732, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3256, 2733, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3266, 2739, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3276, 2742, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3285, 2748, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3294, 2751, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3301, 2755, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3309, 2760, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3319, 2763, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3329, 2768, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3340, 2773, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3350, 2780, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3360, 2784, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3371, 2788, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3381, 2792, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3391, 2814, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3400, 2818, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3407, 2821, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3417, 2825, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3426, 2829, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3436, 2834, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3444, 2838, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3453, 2844, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3464, 2849, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3472, 2854, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3482, 2861, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3492, 2864, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3502, 2884, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3510, 2889, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3520, 2906, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3529, 2911, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3539, 2916, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3549, 2920, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3558, 2926, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3565, 2928, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3573, 2934, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3584, 3304, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3592, 3300, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3603, 3295, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3612, 3257, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3622, 3251, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3632, 3248, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3643, 3246, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3651, 3241, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3661, 3234, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3671, 3231, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3680, 3228, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3690, 3224, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3700, 3219, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3711, 3213, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3721, 3211, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3730, 3207, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3740, 3203, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3748, 3199, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3757, 3195, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3766, 3191, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3775, 3188, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3784, 3184, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3793, 3179, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3802, 3178, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3810, 3172, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3820, 3168, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3830, 2941, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3840, 2946, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3850, 2952, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3860, 2950, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3870, 2956, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3879, 2960, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3889, 2962, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3898, 2965, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3907, 2967, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3917, 2972, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3927, 2975, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3937, 2977, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3947, 2981, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3957, 2985, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3967, 2989, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3978, 2991, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3988, 2995, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3999, 2998, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4009, 3003, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4019, 3006, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4029, 3007, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4035, 3011, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4045, 3014, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4055, 3065, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4065, 3067, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4074, 3080, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4084, 3076, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4094, 3073, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4104, 3083, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4114, 3086, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4124, 3089, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4133, 3092, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4141, 3095, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4151, 3097, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4161, 3112, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4171, 3108, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4181, 3104, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4190, 3101, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4201, 3116, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4211, 3118, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4218, 3121, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4228, 3123, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4236, 3128, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4246, 3130, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4255, 3132, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4264, 3136, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4274, 3138, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4284, 3139, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4293, 3385, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4303, 3384, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4313, 3382, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4323, 3378, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4332, 3376, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4342, 3143, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4353, 3371, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4363, 3146, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4372, 3366, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4381, 3364, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4392, 3363, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4402, 3362, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4412, 3151, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4421, 3070, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4430, 3062, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4439, 3058, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4448, 3055, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4456, 3051, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4465, 3050, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4474, 3047, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4482, 3045, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4492, 3041, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4502, 3039, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4512, 3034, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4522, 3029, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4532, 3027, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4540, 3024, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4551, 3021, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4560, 3016, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4570, 2940, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4580, 3182, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4590, 3199, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4599, 3214, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4609, 3258, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4619, 3233, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4627, 3247, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4637, 3258, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4649, 3262, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4658, 3265, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4669, 3269, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4678, 3271, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4688, 3276, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4697, 3278, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4708, 3282, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4718, 3287, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4729, 3291, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4738, 3298, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4748, 2932, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4757, 2923, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4767, 2914, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4777, 2903, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4786, 2900, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4795, 2778, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4805, 2896, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4815, 2893, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3050, 2644, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3060, 2648, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3070, 2650, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3081, 2654, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3092, 2660, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3104, 2662, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3113, 2665, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3124, 2671, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3133, 2672, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3144, 2676, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3154, 2688, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3167, 2692, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3178, 2697, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3188, 2705, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3198, 2709, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3208, 2714, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3219, 2719, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3228, 2722, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3239, 2729, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3249, 2734, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3259, 2736, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3270, 2743, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3281, 2744, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3291, 2749, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3300, 2754, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3310, 2761, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3321, 2765, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3331, 2769, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3342, 2774, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3352, 2779, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3362, 2785, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3372, 2789, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3382, 2792, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3392, 2814, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3402, 2819, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3439, 2837, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3449, 2842, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3459, 2846, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3469, 2853, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3481, 2858, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3491, 2865, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3501, 2869, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3513, 2888, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3521, 2908, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3533, 2912, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3543, 2917, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3553, 2922, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3562, 2924, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3570, 2933, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3580, 2936, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3590, 3302, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3600, 3297, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3609, 3289, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3620, 3254, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3631, 3249, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3641, 3246, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3652, 3241, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3664, 3235, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3675, 3230, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3685, 3226, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3696, 3222, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3706, 3218, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3717, 3212, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3727, 3208, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3737, 3204, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3746, 3200, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3756, 3197, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3767, 3192, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3776, 3186, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3785, 3184, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3795, 3180, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3805, 3175, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3816, 3171, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3827, 2940, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3839, 2944, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3849, 2948, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3859, 2950, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3869, 2955, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3880, 2960, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3890, 2962, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3901, 2966, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3911, 2970, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3922, 2973, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3932, 2976, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3941, 2978, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3951, 2983, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3961, 2986, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3973, 2988, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3983, 2993, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3993, 2996, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4005, 3000, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4015, 3004, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4027, 3009, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4036, 3011, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4046, 3014, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4056, 3065, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4067, 3069, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4077, 3080, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4087, 3075, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4097, 3072, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4108, 3084, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4118, 3088, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4128, 3090, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4139, 3094, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4150, 3098, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4160, 3111, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4170, 3108, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4180, 3104, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4192, 3103, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4202, 3116, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4212, 3119, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4222, 3122, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4232, 3125, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4243, 3129, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4253, 3133, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4261, 3135, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4270, 3391, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4280, 3389, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4290, 3386, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4301, 3383, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4311, 3381, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4322, 3379, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4333, 3376, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4344, 3143, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4354, 3145, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4366, 3146, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4377, 3147, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4387, 3148, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4398, 3359, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4407, 3357, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4418, 3353, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4428, 3063, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4437, 3060, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4447, 3056, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4457, 3053, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4466, 3049, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4475, 3046, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4487, 3043, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4497, 3040, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4508, 3036, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4519, 3032, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4529, 3030, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4539, 3024, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4549, 3022, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4561, 3016, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4571, 2938, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4582, 3183, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4593, 3200, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4604, 3219, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4615, 2898, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4626, 3242, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4636, 3258, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4646, 3261, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4656, 3265, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4666, 3268, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4677, 3271, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4687, 3275, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4699, 3278, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4709, 3283, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4722, 3287, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4732, 3293, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4742, 3303, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4754, 2930, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4765, 2916, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4775, 2903, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4785, 2900, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4796, 2801, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4806, 2896, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4817, 2892, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4828, 2886, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4838, 2881, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4849, 2879, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4859, 2874, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4869, 2870, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4879, 2862, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4890, 2853, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4901, 2842, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4911, 2830, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4921, 2822, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4933, 2811, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4944, 2808, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4954, 2803, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4964, 2799, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4974, 2793, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4985, 2784, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3051, 2644, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3061, 2648, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3071, 2652, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3083, 2654, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3093, 2658, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3102, 2662, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3112, 2666, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3122, 2671, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3131, 2672, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3141, 2675, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3151, 2686, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3161, 2690, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3171, 2696, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3181, 2702, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3191, 2706, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3201, 2711, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3212, 2716, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3222, 2721, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3232, 2726, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3240, 2731, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3251, 2735, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3261, 2736, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3271, 2741, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3280, 2746, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3289, 2749, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3298, 2753, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3307, 2757, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3317, 2762, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3327, 2767, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3337, 2772, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3347, 2777, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3358, 2781, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3368, 2786, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3378, 2797, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3386, 2812, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3395, 2816, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3405, 2820, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3414, 2825, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3423, 2829, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3432, 2834, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3442, 2838, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3452, 2844, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3462, 2849, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3473, 2855, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3483, 2861, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3493, 2864, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3503, 2885, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3511, 2904, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3522, 2908, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3531, 2912, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3541, 2917, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3551, 2921, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3581, 2937, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3593, 3300, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3602, 3295, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3613, 3256, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3623, 3251, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3633, 3248, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3642, 3243, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3653, 3239, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3662, 3235, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3673, 3231, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3683, 3226, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3692, 3222, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3701, 3217, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3710, 3213, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3720, 3209, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3732, 3205, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3741, 3202, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3750, 3198, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3759, 3195, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3769, 3191, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3778, 3186, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3787, 3183, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3798, 3180, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3808, 3174, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3818, 3168, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3828, 2941, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3837, 2945, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3847, 2948, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3857, 2951, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3866, 2955, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3875, 2958, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3885, 2961, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3895, 2963, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3904, 2968, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3914, 2969, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3924, 2974, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3934, 2979, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3944, 2980, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3954, 2984, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3963, 2987, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3971, 2990, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3980, 2993, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3990, 2997, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4000, 2999, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4010, 3003, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4020, 3005, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4030, 3008, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4040, 3013, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4050, 3018, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4060, 3066, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4070, 3070, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4081, 3077, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4091, 3074, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4101, 3081, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4111, 3087, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4119, 3085, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4129, 3090, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4138, 3094, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4148, 3097, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4159, 3111, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4169, 3109, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4179, 3104, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4189, 3103, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4199, 3114, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4209, 3118, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4220, 3121, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4229, 3125, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4239, 3127, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4249, 3131, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4258, 3134, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4269, 3140, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4279, 3389, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4289, 3387, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4299, 3383, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4308, 3381, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4317, 3142, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4327, 3377, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4337, 3374, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4347, 3372, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4357, 3370, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4365, 3367, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4375, 3147, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4385, 3361, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4395, 3359, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4404, 3358, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4414, 3355, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4423, 3069, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4431, 3061, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4440, 3058, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4450, 3055, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4459, 3051, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4468, 3049, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4477, 3044, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4486, 3042, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4496, 3040, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4506, 3036, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4516, 3035, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4525, 3030, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4535, 3026, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4546, 3023, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4556, 3020, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4566, 3018, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4575, 3175, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4585, 3189, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4594, 3205, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4603, 3223, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4613, 2924, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4624, 3241, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4634, 3257, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4644, 3261, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4654, 3264, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4664, 3267, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4672, 3272, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4681, 3274, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4690, 3277, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4700, 3280, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4710, 3283, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4719, 3286, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4728, 3292, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4739, 3299, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4749, 2932, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4758, 2922, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4768, 2912, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4778, 2902, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4788, 2899, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4798, 2700, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4807, 2895, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4816, 2892, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4826, 2888, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4836, 2882, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4845, 2879, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4855, 2875, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4864, 2871, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3052, 2644, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3063, 2649, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3075, 2652, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3085, 2657, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3095, 2659, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3105, 2663, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3115, 2665, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3125, 2669, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3136, 2674, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3147, 2677, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3158, 2689, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3170, 2694, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3180, 2700, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3190, 2704, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3200, 2710, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3210, 2715, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3221, 2720, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3230, 2726, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3242, 2730, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3252, 2735, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3262, 2738, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3272, 2743, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3283, 2746, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3292, 2750, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3302, 2755, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3313, 2760, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3323, 2766, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3333, 2770, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3343, 2775, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3353, 2779, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3363, 2785, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3373, 2790, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3383, 2793, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3394, 2815, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3408, 2820, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3419, 2827, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3428, 2832, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3437, 2836, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3447, 2839, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3457, 2846, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3467, 2852, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3477, 2857, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3487, 2862, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3499, 2869, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3509, 2888, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3519, 2906, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3530, 2911, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3540, 2916, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3550, 2921, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3560, 2925, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3569, 2929, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3578, 2935, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3588, 3301, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3598, 3297, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3608, 3290, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3618, 3254, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3629, 3250, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3640, 3244, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3650, 3240, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3660, 3234, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3670, 3232, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3681, 3227, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3694, 3221, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3704, 3217, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3715, 3214, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3724, 3210, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3734, 3206, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3743, 3201, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3752, 3196, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3762, 3193, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3771, 3190, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3780, 3187, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3790, 3181, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3800, 3178, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3811, 3173, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3822, 2938, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3832, 2942, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3843, 2946, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3854, 2949, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3868, 2954, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3878, 2958, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3888, 2962, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3899, 2965, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3910, 2970, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3920, 2971, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3931, 2976, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3942, 2980, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3952, 2983, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3964, 2986, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3974, 2990, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3984, 2994, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3994, 2996, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4006, 3000, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4017, 3004, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4026, 3007, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4038, 3013, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4048, 3015, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4058, 3064, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4068, 3071, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4078, 3078, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4088, 3075, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4099, 3082, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4109, 3084, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4120, 3085, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4131, 3092, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4142, 3095, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4153, 3099, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4163, 3112, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4173, 3107, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4184, 3105, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4195, 3100, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4206, 3115, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4217, 3120, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4227, 3123, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4238, 3128, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4248, 3131, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4257, 3134, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4266, 3140, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4276, 3390, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4288, 3387, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4298, 3137, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4309, 3381, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4319, 3142, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4329, 3144, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4340, 3373, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4350, 3371, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4360, 3369, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4373, 3366, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4384, 3361, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4394, 3360, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4405, 3358, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4415, 3355, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4424, 3067, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4433, 3059, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4444, 3057, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4454, 3053, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4463, 3050, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4472, 3047, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4484, 3045, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4494, 3038, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4504, 3039, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4515, 3035, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4526, 3031, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4537, 3026, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4547, 3022, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4557, 3020, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4567, 2945, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4579, 3176, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4589, 3196, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4600, 3216, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4611, 3269, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4622, 3236, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4632, 3255, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4642, 3260, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4653, 3264, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4662, 3267, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4673, 3270, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4683, 3274, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4693, 3277, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4703, 3281, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4713, 3285, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4723, 3288, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4735, 3294, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4745, 2936, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4756, 2928, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4766, 2913, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4776, 2903, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4787, 2899, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4797, 2745, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4808, 2895, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4818, 2892, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4829, 2887, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4840, 2881, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4851, 2876, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4861, 2873, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4871, 2869, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4882, 2859, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4894, 2849, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4904, 2840, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4915, 2826, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4925, 2816, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4935, 2806, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4945, 2805, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4955, 2803, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4966, 2799, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3053, 2646, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3062, 2649, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3074, 2652, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3084, 2657, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3094, 2658, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3103, 2663, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3114, 2665, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3123, 2671, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3134, 2674, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3143, 2676, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3152, 2685, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3162, 2691, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3172, 2696, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3182, 2702, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3193, 2706, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3203, 2711, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3213, 2716, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3224, 2723, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3234, 2728, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3244, 2732, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3254, 2733, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3264, 2738, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3274, 2742, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3282, 2748, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3290, 2750, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3299, 2754, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3308, 2761, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3318, 2763, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3328, 2768, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3338, 2773, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3348, 2778, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3359, 2783, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3369, 2788, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3379, 2795, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3390, 2813, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3401, 2818, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3409, 2823, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3415, 2827, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3424, 2830, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3433, 2835, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3443, 2841, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3454, 2845, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3463, 2850, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3474, 2855, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3484, 2860, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3494, 2866, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3504, 2885, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3514, 2904, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3523, 2909, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3532, 2914, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3542, 2917, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3552, 2922, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3559, 2925, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3567, 2929, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3576, 2931, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3585, 3303, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3595, 3299, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3606, 3293, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3615, 3255, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3625, 3252, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3635, 3247, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3645, 3243, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3655, 3236, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3665, 3233, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3674, 3230, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3684, 3226, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3693, 3222, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3703, 3217, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3713, 3216, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3723, 3209, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3733, 3206, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3742, 3202, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3751, 3198, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3760, 3194, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3770, 3190, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3779, 3187, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3788, 3182, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3799, 3177, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3809, 3173, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3819, 3168, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3829, 2941, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3838, 2945, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3848, 2952, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3858, 2950, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3865, 2955, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3876, 2957, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3886, 2961, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3896, 2963, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3905, 2967, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3915, 2972, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3925, 2974, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3935, 2979, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3945, 2981, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3955, 2984, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3965, 2987, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3975, 2991, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3985, 2994, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3995, 2996, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4004, 3001, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4013, 3004, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4022, 3009, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4032, 3010, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4042, 3012, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4053, 3063, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4063, 3068, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4073, 3079, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4083, 3076, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4093, 3073, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4103, 3081, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4113, 3086, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4123, 3089, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4132, 3093, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4143, 3096, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4152, 3099, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4162, 3112, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4172, 3108, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4182, 3105, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4191, 3101, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4200, 3116, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4210, 3118, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4219, 3122, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4230, 3123, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4240, 3127, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4272, 3138, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4281, 3388, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4291, 3386, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4300, 3383, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4310, 3382, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4320, 3379, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4330, 3144, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4339, 3373, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4349, 3372, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4359, 3370, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4369, 3368, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4379, 3365, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4388, 3363, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4397, 3152, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4408, 3357, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4416, 3353, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4426, 3066, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4435, 3059, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4446, 3056, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4455, 3053, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4464, 3050, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4473, 3047, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4483, 3043, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4493, 3038, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4503, 3039, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4514, 3034, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4524, 3031, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4534, 3027, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4543, 3023, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4552, 3019, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4562, 3017, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4572, 3170, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4581, 3185, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4592, 3201, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4602, 3218, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4612, 3292, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4621, 3239, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4631, 3253, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4640, 3259, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4650, 3263, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4661, 3266, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4671, 3270, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4682, 3273, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4692, 3277, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4702, 3281, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4712, 3285, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4720, 3286, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4730, 3292, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4740, 3302, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4750, 2931, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4760, 2921, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4770, 2908, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4780, 2902, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4790, 2898, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4799, 2898, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4809, 2895, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4820, 2891, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4830, 2884, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4841, 2880, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4850, 2876, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4860, 2873, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4870, 2870, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3054, 2646, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3064, 2649, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3072, 2653, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3082, 2654, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3090, 2660, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3100, 2661, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3110, 2666, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3118, 2668, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3128, 2670, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3138, 2673, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3148, 2683, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3156, 2687, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3163, 2692, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3173, 2697, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3183, 2701, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3192, 2707, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3202, 2711, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3211, 2716, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3220, 2721, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3229, 2725, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3238, 2730, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3248, 2734, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3258, 2737, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3268, 2740, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3277, 2745, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3286, 2747, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3295, 2752, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3304, 2756, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3314, 2758, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3322, 2764, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3332, 2770, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3341, 2775, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3351, 2780, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3361, 2784, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3370, 2789, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3380, 2795, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3389, 2813, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3397, 2817, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3404, 2822, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3412, 2824, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3421, 2828, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3430, 2833, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3440, 2840, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3451, 2843, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3461, 2847, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3471, 2854, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3480, 2859, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3489, 2865, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3497, 2868, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3507, 2886, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3516, 2905, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3526, 2910, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3535, 2913, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3544, 2918, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3574, 2934, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3583, 3304, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3591, 3300, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3601, 3296, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3611, 3288, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3621, 3253, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3628, 3249, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3638, 3245, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3648, 3240, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3656, 3238, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3666, 3237, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3676, 3229, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3686, 3225, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3695, 3220, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3705, 3218, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3712, 3214, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3722, 3209, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3731, 3205, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3738, 3203, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3747, 3199, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3755, 3197, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3765, 3192, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3773, 3188, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3781, 3185, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3789, 3182, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3797, 3177, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3807, 3174, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3817, 3170, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3826, 2940, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3836, 2944, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3845, 2947, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3855, 2951, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3862, 2953, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3872, 2956, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3882, 2959, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3892, 2964, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3902, 2966, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3912, 2969, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3921, 2973, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3929, 2976, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3939, 2978, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3948, 2982, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3959, 2985, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3968, 2989, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3977, 2992, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3986, 2995, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3996, 2998, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4003, 3001, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4011, 3002, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4021, 3005, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4031, 3008, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4041, 3012, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4051, 3061, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4061, 3068, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4071, 3070, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4080, 3077, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4090, 3074, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4098, 3082, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4107, 3084, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4117, 3088, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4127, 3091, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4136, 3093, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4146, 3098, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4155, 3113, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4164, 3110, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4174, 3107, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4183, 3105, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4193, 3101, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4203, 3115, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4213, 3119, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4223, 3122, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4233, 3126, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4242, 3129, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4250, 3133, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4259, 3134, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4268, 3140, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4278, 3390, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4287, 3139, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4297, 3137, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4305, 3141, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4314, 3380, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4324, 3378, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4334, 3376, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4343, 3375, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4351, 3371, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4361, 3369, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4370, 3368, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4380, 3364, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4390, 3363, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4400, 3152, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4409, 3151, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4417, 3353, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4425, 3064, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4434, 3059, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4443, 3057, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4452, 3054, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4460, 3052, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4469, 3048, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4476, 3046, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4485, 3043, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4495, 3038, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4505, 3036, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4513, 3035, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4523, 3031, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4533, 3027, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4542, 3025, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4550, 3021, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4559, 3016, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4569, 2942, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4577, 3181, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4587, 3193, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4596, 3210, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4606, 3221, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4616, 3230, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4623, 3246, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4633, 3256, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4643, 3260, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4651, 3263, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4660, 3266, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4670, 3270, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4679, 3273, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4689, 3276, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4698, 3280, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4707, 3283, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4717, 3287, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4727, 3291, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4737, 3297, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4746, 2932, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4753, 2927, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4763, 2918, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4772, 2905, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3057, 2646, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3068, 2650, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3078, 2656, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3088, 2655, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3098, 2661, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3108, 2664, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3120, 2667, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3132, 2670, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3142, 2675, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3153, 2685, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3166, 2691, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3177, 2699, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3189, 2705, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3199, 2710, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3209, 2715, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3218, 2720, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3231, 2725, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3243, 2731, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3253, 2733, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3263, 2738, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3273, 2741, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3284, 2748, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3293, 2751, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3303, 2756, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3312, 2758, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3324, 2764, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3334, 2771, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3344, 2776, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3354, 2782, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3364, 2787, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3375, 2791, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3387, 2794, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3398, 2817, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3411, 2821, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3420, 2828, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3429, 2832, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3438, 2837, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3448, 2842, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3458, 2846, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3468, 2852, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3478, 2858, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3490, 2863, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3500, 2870, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3512, 2889, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3524, 2909, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3534, 2914, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3545, 2918, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3556, 2923, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3564, 2927, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3572, 2930, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3582, 2937, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3594, 3299, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3604, 3295, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3616, 3256, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3627, 3252, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3637, 3245, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3647, 3242, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3658, 3238, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3668, 3237, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3678, 3229, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3689, 3224, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3702, 3223, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3714, 3216, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3725, 3210, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3735, 3206, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3744, 3201, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3753, 3196, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3763, 3193, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3772, 3189, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3782, 3185, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3791, 3181, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3801, 3178, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3814, 3172, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3824, 2939, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3835, 2943, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3846, 2948, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3856, 2951, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3867, 2954, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3877, 2958, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3887, 2961, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3897, 2965, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3908, 2967, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3919, 2971, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3930, 2975, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3940, 2978, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3950, 2982, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3960, 2986, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3970, 2988, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3981, 2992, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (3991, 2997, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4001, 2999, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4014, 3002, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4025, 3009, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4039, 3011, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4049, 3015, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4059, 3066, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4069, 3071, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4079, 3078, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4089, 3074, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4100, 3082, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4110, 3087, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4121, 3085, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4134, 3092, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4144, 3096, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4154, 3099, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4166, 3110, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4177, 3106, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4188, 3102, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4198, 3114, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4208, 3117, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4221, 3121, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4231, 3125, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4241, 3127, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4252, 3131, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4263, 3135, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4273, 3138, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4283, 3388, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4294, 3385, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4304, 3384, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4315, 3380, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4325, 3378, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4336, 3374, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4346, 3375, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4356, 3370, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4368, 3367, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4378, 3365, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4389, 3148, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4399, 3152, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4410, 3357, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4420, 3356, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4429, 3062, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4438, 3060, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4449, 3055, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4458, 3051, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4467, 3049, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4478, 3046, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4489, 3042, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4500, 3037, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4510, 3033, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4520, 3029, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4530, 3028, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4544, 3025, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4554, 3019, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4565, 3017, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4576, 3174, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4586, 3191, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4597, 3207, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4607, 3225, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4617, 3232, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4630, 3249, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4641, 3260, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4652, 3263, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4663, 3267, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4674, 3272, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4684, 3274, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4694, 3279, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4704, 3281, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4715, 3284, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4726, 3289, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4736, 3296, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4747, 2935, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4759, 2925, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4769, 2909, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4779, 2902, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4789, 2899, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4800, 2678, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4811, 2894, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4821, 2891, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4832, 2883, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4842, 2880, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4852, 2877, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4862, 2873, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4872, 2868, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4883, 2858, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4895, 2848, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4905, 2837, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4917, 2826, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4927, 2814, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4938, 2809, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4950, 2807, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4961, 2801, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4971, 2796, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4981, 2788, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4991, 2776, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5002, 2766, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4782, 2901, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4792, 2874, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4802, 2897, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4812, 2894, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4822, 2890, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4831, 2883, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4839, 2880, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4848, 2876, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4858, 2874, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4867, 2871, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4877, 2865, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4887, 2855, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4896, 2845, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4906, 2836, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4914, 2828, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4922, 2818, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4931, 2810, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4941, 2808, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4949, 2804, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4959, 2801, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4969, 2798, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4976, 2790, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4986, 2781, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4995, 2771, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5005, 2762, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5015, 2752, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5024, 2729, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5033, 2720, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5041, 2712, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5051, 3305, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5061, 3310, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5071, 3166, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5079, 3313, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5089, 3316, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5095, 3318, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5103, 3163, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5112, 3321, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5122, 3324, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5132, 3327, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5142, 3329, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5150, 3159, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5159, 3333, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5169, 3336, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5179, 2680, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5189, 2684, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5197, 2691, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5206, 2702, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5216, 2710, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5226, 3352, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5234, 3351, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5244, 3153, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5252, 3346, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5262, 3342, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5272, 3340, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5281, 3339, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4824, 2890, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4835, 2882, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4844, 2878, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4856, 2877, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4866, 2872, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4875, 2867, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4885, 2857, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4893, 2850, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4903, 2841, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4912, 2831, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4924, 2820, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4934, 2810, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4943, 2808, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4953, 2804, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4963, 2800, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4973, 2796, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4983, 2786, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4992, 2775, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5001, 2764, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5011, 2755, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5020, 2741, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5030, 2724, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5039, 2714, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5049, 3305, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5059, 3169, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5068, 3309, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5078, 3314, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5087, 3315, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5098, 3317, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5106, 3322, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5114, 3321, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5124, 3325, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5134, 3326, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5144, 3329, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5154, 3332, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5164, 3158, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5174, 2678, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5182, 2683, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5191, 2685, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5201, 2695, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5211, 2704, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5221, 3149, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5230, 3350, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5241, 3349, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5250, 3345, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5260, 3343, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5271, 3340, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5280, 3338, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5290, 3157, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4847, 2879, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4854, 2875, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4863, 2872, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4873, 2867, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4881, 2861, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4889, 2852, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4899, 2843, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4909, 2833, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4918, 2824, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4928, 2813, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4937, 2806, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4947, 2807, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4957, 2802, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4965, 2799, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4975, 2792, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4984, 2783, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4994, 2773, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5004, 2763, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5014, 2751, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5023, 2727, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5034, 2719, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5043, 3306, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5053, 3307, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5062, 3310, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5072, 3166, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5081, 3165, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5088, 3164, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5097, 3318, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5104, 3163, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5113, 3321, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5123, 3324, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5133, 3326, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5143, 3329, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5153, 3159, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5163, 3158, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5171, 2678, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5180, 2680, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5190, 2686, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5199, 2694, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5209, 2703, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5219, 3149, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5229, 3350, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5238, 3348, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5248, 3347, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5258, 3343, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5266, 3344, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5275, 3156, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5284, 3339, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4874, 2866, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4884, 2856, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4892, 2847, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4902, 2838, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4913, 2831, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4923, 2819, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4932, 2810, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4942, 2805, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4952, 2803, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4962, 2800, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4972, 2794, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4982, 2785, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4993, 2774, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5003, 2765, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5012, 2753, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5021, 2739, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5031, 2723, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5042, 2712, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5052, 3307, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5063, 3310, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5073, 3312, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5083, 3165, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5093, 3164, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5101, 3319, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5109, 3320, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5116, 3323, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5126, 3325, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5136, 3328, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5146, 3331, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5155, 3332, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5165, 3158, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5175, 2679, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5185, 2681, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5195, 2689, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5205, 2698, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5213, 2709, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5223, 3354, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5232, 3150, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5242, 3348, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5253, 3346, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5263, 3342, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5273, 3341, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5282, 3339, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4880, 2860, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4891, 2851, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4900, 2839, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4910, 2829, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4920, 2821, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4930, 2811, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4939, 2809, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4948, 2807, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4958, 2802, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4968, 2798, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4977, 2797, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4987, 2782, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4997, 2770, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5006, 2758, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5016, 2749, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5026, 2728, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5036, 2718, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5045, 3167, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5055, 3308, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5064, 3311, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5074, 3312, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5084, 3165, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5119, 3323, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5129, 3161, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5138, 3160, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5148, 3330, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5158, 3333, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5168, 3335, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5178, 2680, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5187, 2684, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5198, 2692, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5208, 2701, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5218, 3356, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5228, 3350, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5239, 3349, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5249, 3345, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5259, 3343, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5269, 3344, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5279, 3338, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5289, 3157, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4916, 2825, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4926, 2815, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4936, 2806, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4946, 2805, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4956, 2802, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4967, 2798, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4978, 2790, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4988, 2779, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4998, 2769, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5008, 2760, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5017, 2746, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5027, 2725, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5037, 2715, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5047, 3167, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5056, 3308, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5066, 3311, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5076, 3314, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5085, 3315, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5094, 3317, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5105, 3163, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5115, 3162, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5125, 3325, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5135, 3326, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5145, 3331, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5156, 3332, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5166, 3335, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5176, 2679, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5186, 2681, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5196, 2690, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5207, 2699, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5217, 3356, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5227, 3352, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5237, 3349, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5247, 3347, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5257, 3154, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5267, 3344, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5277, 3156, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5286, 3337, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4929, 2811, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4940, 2809, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4951, 2804, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4960, 2800, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4970, 2796, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4980, 2789, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4990, 2777, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4999, 2767, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5009, 2761, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5019, 2744, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5029, 2722, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5040, 2714, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5050, 3305, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5060, 3169, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5070, 3166, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5080, 3313, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5090, 3316, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5099, 3318, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5108, 3322, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5117, 3162, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5127, 3161, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5137, 3328, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5147, 3331, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5157, 3333, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5167, 3335, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5177, 2679, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5188, 2684, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5200, 2693, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5210, 2705, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5220, 3149, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5231, 3150, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5240, 3348, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5251, 3345, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5261, 3342, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5270, 3340, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5283, 3338, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4979, 2795, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4989, 2780, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5000, 2768, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5010, 2757, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5022, 2740, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5032, 2721, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5044, 3306, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5054, 3307, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5065, 3311, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5075, 3312, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5086, 3315, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5096, 3317, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5107, 3322, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5118, 3162, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5128, 3161, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5139, 3328, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5149, 3330, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5160, 3334, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5170, 3336, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5181, 2682, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5192, 2686, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5202, 2695, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5212, 2706, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5222, 3354, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5233, 3150, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5243, 3153, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5254, 3346, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5264, 3155, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5274, 3341, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5285, 3337, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (4996, 2772, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5007, 2759, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5018, 2750, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5028, 2726, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5038, 2718, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5048, 3167, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5058, 3169, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5069, 3309, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5082, 3313, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5092, 3164, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5100, 3319, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5110, 3320, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5120, 3323, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5130, 3327, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5140, 3160, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5151, 3330, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5161, 3334, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5173, 3336, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5184, 2682, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5194, 2688, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5204, 2696, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5215, 2707, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5225, 3354, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5236, 3351, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5246, 3153, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5255, 3154, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5265, 3155, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5276, 3341, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5287, 3337, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5013, 2754, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5025, 2730, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5035, 2717, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5046, 3306, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5057, 3308, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5067, 3309, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5077, 3314, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5091, 3316, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5102, 3319, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5111, 3320, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5121, 3324, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5131, 3327, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5141, 3160, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5152, 3159, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5162, 3334, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5172, 2677, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5183, 2682, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5193, 2687, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5203, 2697, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5214, 2708, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5224, 3352, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5235, 3351, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5245, 3347, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5256, 3154, 25);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5268, 3155, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5278, 3156, 26);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5288, 3157, 24);
INSERT INTO public."RepositoryTopics" (id, "idRepository", "idCatalog") VALUES (5291, 2585, 17);


--
-- Data for Name: RepositoryTypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1479, 2586, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1480, 2590, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1481, 2590, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1482, 2592, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1483, 2592, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1484, 2586, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1485, 2588, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1486, 2593, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1487, 2587, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1488, 2587, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1489, 2585, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1490, 2594, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1491, 2589, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1492, 2591, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1493, 2597, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1494, 2596, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1495, 2599, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1496, 2595, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1497, 2597, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1498, 2596, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1499, 2598, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1500, 2599, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1501, 2600, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1502, 2598, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1503, 2600, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1504, 2602, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1505, 2602, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1506, 2601, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1507, 2601, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1508, 2604, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1509, 2605, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1510, 2603, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1511, 2605, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1512, 2606, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1513, 2606, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1514, 2607, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1515, 2608, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1516, 2610, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1517, 2609, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1518, 2611, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1519, 2612, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1520, 2613, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1521, 2614, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1522, 2615, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1523, 2615, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1524, 2616, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1525, 2617, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1526, 2618, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1527, 2618, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1528, 2621, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1529, 2622, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1530, 2620, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1531, 2619, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1532, 2624, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1533, 2619, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1534, 2623, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1535, 2623, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1536, 2626, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1537, 2626, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1538, 2625, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1539, 2625, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1540, 2627, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1541, 2628, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1542, 2627, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1543, 2628, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1544, 2629, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1545, 2629, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1546, 2630, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1547, 2630, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1548, 2631, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1549, 2631, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1550, 2632, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1551, 2632, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1552, 2635, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1553, 2635, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1554, 2633, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1555, 2634, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1556, 2639, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1557, 2638, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1558, 2640, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1559, 2637, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1560, 2636, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1561, 2641, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1562, 2643, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1563, 2642, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1564, 2644, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1565, 2645, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1566, 2646, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1567, 2646, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1568, 2647, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1569, 2649, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1570, 2651, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1571, 2650, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1572, 2648, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1573, 2652, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1574, 2656, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1575, 2656, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1576, 2653, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1577, 2654, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1578, 2653, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1579, 2654, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1580, 2655, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1581, 2657, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1582, 2657, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1583, 2655, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1584, 2660, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1585, 2660, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1586, 2658, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1587, 2658, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1588, 2659, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1589, 2659, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1590, 2661, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1591, 2662, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1592, 2663, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1593, 2663, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1594, 2664, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1595, 2664, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1596, 2666, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1597, 2665, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1598, 2666, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1599, 2665, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1600, 2667, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1601, 2667, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1602, 2668, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1603, 2671, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1604, 2668, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1605, 2671, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1606, 2669, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1607, 2670, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1608, 2670, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1609, 2674, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1610, 2672, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1611, 2673, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1612, 2675, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1613, 2675, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1614, 2676, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1615, 2676, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1616, 2677, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1617, 2677, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1618, 2678, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1619, 2678, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1620, 2679, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1621, 2679, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1622, 2680, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1623, 2682, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1624, 2683, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1625, 2681, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1626, 2684, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1627, 2685, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1628, 2686, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1629, 2685, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1630, 2688, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1631, 2688, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1632, 2687, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1633, 2689, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1634, 2690, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1635, 2691, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1636, 2692, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1637, 2693, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1638, 2694, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1639, 2695, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1640, 2695, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1641, 2696, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1642, 2696, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1643, 2697, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1644, 2698, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1645, 2700, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1646, 2699, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1647, 2702, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1648, 2705, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1649, 2701, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1650, 2703, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1651, 2706, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1652, 2706, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1653, 2708, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1654, 2716, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1655, 2713, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1656, 2723, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1657, 2727, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1658, 2722, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1668, 2765, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1678, 2799, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1689, 2839, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1698, 2863, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1708, 2891, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1718, 2927, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1727, 3277, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1737, 3217, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1747, 3196, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1757, 2941, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1767, 2985, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1777, 3076, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1787, 3102, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1798, 3129, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1808, 3140, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1818, 3139, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1829, 3384, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1839, 3379, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1849, 3373, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1859, 3370, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1869, 3366, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1878, 3360, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1888, 3151, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1898, 3354, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1908, 3153, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1918, 3155, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1926, 3338, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1935, 3334, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1945, 3331, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1955, 3161, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1966, 3321, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1977, 3164, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1986, 3314, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1996, 3169, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2006, 2901, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2016, 2891, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2026, 2884, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2035, 2874, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2045, 2867, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1659, 2730, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1669, 2768, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1680, 2804, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1690, 2844, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1700, 2866, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1710, 2899, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1720, 2934, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1730, 3269, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1740, 3214, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1750, 3190, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1759, 2955, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1769, 2991, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1779, 3081, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1790, 3111, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1799, 3133, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1811, 3391, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1820, 3387, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1830, 3141, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1840, 3378, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1850, 3143, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1860, 3370, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1870, 3366, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1880, 3360, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1890, 3355, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1901, 3352, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1911, 3345, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1922, 3340, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1933, 3336, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1943, 3159, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1952, 3327, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1961, 3162, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1971, 3163, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1981, 3315, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1991, 3309, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2001, 3305, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2011, 2896, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2021, 2888, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2030, 2879, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2040, 2870, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1660, 2735, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1670, 2772, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1681, 2805, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1691, 2847, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1701, 2869, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1711, 2902, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1721, 2937, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1731, 3266, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1741, 3209, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1751, 3188, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1760, 2959, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1770, 2994, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1780, 3084, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1791, 3114, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1800, 3132, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1812, 3391, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1822, 3386, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1832, 3141, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1842, 3377, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1851, 3375, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1863, 3369, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1872, 3364, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1884, 3152, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1894, 3149, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1904, 3349, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1914, 3154, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1924, 3341, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1936, 3335, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1946, 3329, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1957, 3161, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1968, 3322, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1978, 3316, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1988, 3312, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1998, 3308, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2008, 2899, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2018, 2890, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2028, 2882, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2038, 2872, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1661, 2739, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1671, 2776, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1679, 2810, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1686, 2833, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1695, 2857, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1703, 2883, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1713, 2909, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1723, 3295, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1733, 3262, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1743, 3205, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1752, 3183, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1762, 2965, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1771, 3000, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1781, 3088, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1788, 3109, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1797, 3130, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1806, 3136, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1816, 3388, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1826, 3137, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1834, 3381, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1844, 3144, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1854, 3372, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1862, 3146, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1871, 3365, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1881, 3359, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1891, 3355, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1900, 3350, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1910, 3345, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1919, 3344, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1929, 3339, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1937, 3334, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1947, 3329, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1956, 3325, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1965, 3320, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1973, 3318, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1983, 3165, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1992, 3311, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2002, 3305, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2012, 2895, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2022, 2886, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2033, 2876, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2043, 2868, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1662, 2747, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1672, 2780, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1682, 2813, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1692, 2852, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1702, 2873, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1709, 2907, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1719, 2929, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1729, 3273, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1736, 3216, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1746, 3199, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1756, 3170, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1766, 2980, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1775, 3070, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1785, 3096, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1793, 3123, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1802, 3134, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1810, 3138, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1819, 3387, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1828, 3383, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1838, 3379, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1848, 3374, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1857, 3145, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1865, 3367, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1875, 3361, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1883, 3362, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1893, 3356, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1903, 3351, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1913, 3346, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1921, 3340, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1930, 3157, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1940, 3333, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1948, 3328, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1958, 3325, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1967, 3320, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1975, 3164, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1985, 3313, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1994, 3310, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2003, 3167, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2013, 2893, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2023, 2886, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2032, 2877, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2042, 2868, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1663, 2744, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1673, 2783, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1683, 2817, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1693, 2854, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1704, 2875, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1715, 2914, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1726, 3288, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1739, 3220, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1748, 3197, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1758, 2945, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1768, 2989, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1778, 3073, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1789, 3106, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1801, 3131, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1809, 3140, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1821, 3139, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1831, 3384, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1841, 3378, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1852, 3143, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1861, 3369, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1874, 3147, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1885, 3152, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1895, 3356, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1905, 3349, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1915, 3343, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1927, 3341, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1938, 3158, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1949, 3160, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1959, 3324, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1969, 3322, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1979, 3316, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1989, 3166, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1999, 3307, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2009, 2898, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2019, 2889, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2029, 2881, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2039, 2871, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1664, 2751, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1674, 2786, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1684, 2821, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1694, 2855, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1705, 2878, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1714, 2917, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1724, 3293, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1734, 3225, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1744, 3204, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1754, 3178, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1764, 2973, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1774, 3009, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1784, 3094, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1794, 3121, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1804, 3135, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1813, 3138, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1823, 3386, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1833, 3381, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1843, 3377, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1853, 3375, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1864, 3146, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1873, 3364, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1882, 3359, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1892, 3353, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1902, 3150, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1912, 3346, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1923, 3344, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1932, 3336, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1941, 3332, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1951, 3326, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1960, 3324, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1970, 3163, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1980, 3315, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1990, 3166, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2000, 3307, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2010, 2897, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2020, 2889, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2031, 2880, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2041, 2870, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1665, 2754, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1675, 2790, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1685, 2827, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1696, 2858, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1707, 2885, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1717, 2923, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1728, 3281, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1738, 3215, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1749, 3194, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1761, 2952, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1772, 2996, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1782, 3091, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1792, 3117, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1803, 3134, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1814, 3390, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1824, 3385, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1835, 3382, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1845, 3144, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1855, 3371, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1866, 3367, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1876, 3148, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1886, 3358, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1896, 3149, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1906, 3348, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1916, 3342, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1928, 3156, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1939, 3333, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1950, 3328, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1962, 3323, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1972, 3319, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1982, 3165, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1993, 3309, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2004, 3167, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2014, 2892, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2025, 2887, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2036, 2875, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2046, 2866, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1666, 2757, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1676, 2792, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1688, 2830, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1699, 2860, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1712, 2894, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1722, 3302, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1732, 3264, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1742, 3208, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1753, 3187, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1763, 2967, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1773, 3004, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1783, 3092, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1795, 3127, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1805, 3135, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1815, 3389, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1825, 3385, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1836, 3380, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1846, 3376, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1856, 3371, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1867, 3368, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1879, 3363, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1889, 3151, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1899, 3352, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1909, 3347, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1920, 3155, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1931, 3337, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1942, 3332, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1953, 3326, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1963, 3162, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1976, 3319, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1987, 3312, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1997, 3169, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2007, 2900, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2017, 2890, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2027, 2882, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2037, 2874, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1667, 2759, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1677, 2796, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1687, 2836, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1697, 2858, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1706, 2888, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1716, 2921, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1725, 3285, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1735, 3221, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1745, 3201, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1755, 3173, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1765, 2976, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1776, 3010, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1786, 3100, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1796, 3129, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1807, 3136, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1817, 3388, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1827, 3137, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1837, 3142, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1847, 3376, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1858, 3145, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1868, 3368, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1877, 3363, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1887, 3357, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1897, 3354, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1907, 3348, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1917, 3342, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1925, 3156, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1934, 3158, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1944, 3330, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1954, 3327, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1964, 3321, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1974, 3317, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1984, 3313, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (1995, 3310, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2005, 3306, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2015, 2892, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2024, 2887, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2034, 2877, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2044, 2867, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2047, 2864, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2048, 2864, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2049, 2865, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2050, 2865, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2051, 2862, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2052, 2862, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2053, 2863, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2054, 2860, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2055, 2861, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2056, 2861, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2057, 2859, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2058, 2859, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2059, 2856, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2060, 2856, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2061, 2854, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2062, 2855, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2063, 2853, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2064, 2853, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2065, 2851, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2066, 2851, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2067, 2850, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2068, 2845, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2069, 2846, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2070, 2848, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2071, 2849, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2072, 2843, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2073, 2844, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2074, 2843, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2075, 2842, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2076, 2839, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2077, 2841, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2078, 2841, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2079, 2838, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2080, 2840, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2081, 2834, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2082, 2835, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2083, 2837, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2084, 2835, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2085, 2834, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2086, 2833, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2087, 2832, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2088, 2832, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2089, 2830, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2090, 2829, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2091, 2829, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2092, 2831, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2093, 2825, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2094, 2828, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2095, 2826, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2096, 2824, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2097, 2823, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2098, 2821, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2099, 2822, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2100, 2820, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2101, 2819, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2102, 2818, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2103, 2816, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2104, 2814, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2105, 2815, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2106, 2814, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2107, 2812, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2108, 2813, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2109, 2812, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2110, 2811, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2111, 2811, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2112, 2810, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2113, 2806, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2114, 2809, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2115, 2806, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2116, 2808, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2117, 2805, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2118, 2807, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2119, 2807, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2120, 2804, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2121, 2803, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2122, 2803, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2123, 2802, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2124, 2801, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2125, 2799, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2126, 2800, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2127, 2798, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2128, 2798, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2129, 2796, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2130, 2794, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2131, 2794, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2132, 2793, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2133, 2793, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2134, 2797, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2135, 2795, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2136, 2797, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2137, 2791, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2138, 2789, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2139, 2791, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2140, 2789, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2141, 2788, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2142, 2786, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2143, 2787, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2144, 2785, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2145, 2784, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2146, 2781, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2147, 2783, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2148, 2781, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2149, 2779, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2150, 2778, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2151, 2780, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2152, 2778, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2153, 2782, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2154, 2760, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2155, 2777, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2156, 2726, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2157, 2777, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2158, 2775, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2159, 2771, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2160, 2774, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2161, 2773, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2162, 2773, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2163, 2772, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2164, 2771, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2165, 2770, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2166, 2769, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2167, 2768, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2168, 2767, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2169, 2767, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2170, 2766, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2171, 2764, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2172, 2762, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2173, 2763, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2174, 2762, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2175, 2759, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2176, 2758, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2177, 2758, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2178, 2761, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2179, 2761, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2180, 2756, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2181, 2755, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2182, 2755, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2183, 2754, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2184, 2753, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2185, 2753, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2186, 2752, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2187, 2750, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2188, 2751, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2189, 2752, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2190, 2750, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2191, 2749, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2192, 2749, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2193, 2747, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2203, 2736, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2214, 2724, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2224, 3128, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2234, 3115, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2244, 3109, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2254, 3100, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2265, 3093, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2275, 3087, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2282, 3074, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2292, 3078, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2302, 3068, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2312, 3058, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2322, 3051, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2331, 3045, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2342, 3040, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2353, 2704, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2362, 2723, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2371, 3028, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2381, 3232, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2414, 3204, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2424, 3195, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2434, 3185, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2444, 3180, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2455, 3171, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2464, 2947, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2473, 2958, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2482, 2968, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2491, 2975, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2502, 2984, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2512, 2905, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2522, 2913, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2531, 2922, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2541, 2928, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2551, 2935, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2561, 3296, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2571, 3286, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2581, 3278, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2592, 3272, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2602, 3261, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2614, 3254, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2624, 3245, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2634, 3241, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2644, 3016, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2654, 3013, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2663, 3006, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2672, 2998, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2682, 2990, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2194, 2748, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2205, 2733, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2215, 2721, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2226, 3128, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2236, 3116, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2247, 3107, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2259, 3096, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2271, 3085, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2283, 3072, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2293, 3080, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2303, 3066, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2314, 3057, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2323, 3049, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2336, 3043, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2372, 3028, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2382, 3231, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2391, 3221, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2402, 3213, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2412, 3206, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2422, 3196, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2432, 3186, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2443, 3180, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2452, 3171, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2463, 2946, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2474, 2957, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2484, 2967, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2495, 2979, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2504, 2987, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2514, 2906, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2524, 2916, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2534, 2926, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2544, 2933, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2556, 3301, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2568, 3292, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2578, 3282, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2588, 3274, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2599, 3265, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2609, 3257, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2620, 3249, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2630, 3243, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2642, 3022, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2652, 3012, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2659, 3005, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2669, 2999, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2678, 2992, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2688, 3234, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2195, 2748, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2204, 2737, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2213, 2722, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2222, 3127, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2232, 3119, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2242, 3110, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2251, 3102, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2260, 3095, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2269, 3089, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2279, 3083, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2288, 3076, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2297, 3071, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2306, 3063, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2315, 3056, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2321, 3050, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2329, 3044, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2338, 3038, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2347, 3033, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2356, 2711, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2365, 2727, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2374, 3029, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2384, 3228, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2393, 3220, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2400, 3216, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2409, 3207, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2419, 3199, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2430, 3189, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2440, 3181, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2449, 3174, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2458, 2942, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2468, 2949, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2500, 2983, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2509, 2904, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2518, 2914, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2528, 2918, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2537, 2924, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2547, 2930, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2557, 3299, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2565, 3290, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2575, 3283, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2584, 3276, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2593, 3267, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2603, 3260, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2613, 3251, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2622, 3247, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2632, 3240, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2643, 3020, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2653, 3013, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2661, 3005, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2668, 3001, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2676, 2994, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2685, 3233, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2196, 2745, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2206, 2734, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2216, 2719, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2225, 3126, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2235, 3115, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2245, 3108, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2255, 3099, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2264, 3092, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2270, 3086, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2280, 3081, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2290, 3077, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2300, 3069, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2308, 3059, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2318, 3055, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2326, 3046, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2333, 3042, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2341, 3037, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2348, 3034, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2357, 2714, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2366, 2725, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2375, 3031, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2385, 3229, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2394, 3222, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2401, 3213, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2410, 3207, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2420, 3198, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2429, 3190, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2438, 3182, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2448, 3175, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2457, 2939, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2467, 2948, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2477, 2961, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2485, 2970, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2492, 2976, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2501, 2984, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2510, 2903, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2519, 2912, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2527, 2918, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2538, 2925, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2548, 2934, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2558, 3300, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2566, 3291, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2574, 3285, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2585, 3277, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2594, 3268, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2604, 3261, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2612, 3253, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2623, 3247, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2633, 3242, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2640, 3019, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2648, 3014, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2656, 3008, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2665, 3002, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2674, 2995, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2684, 2988, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2197, 2742, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2207, 2734, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2217, 2715, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2227, 3125, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2237, 3116, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2246, 3108, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2256, 3097, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2266, 3090, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2276, 3087, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2286, 3074, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2296, 3079, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2307, 3065, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2316, 3055, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2324, 3048, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2332, 3045, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2340, 3040, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2349, 3033, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2358, 2715, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2367, 2729, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2379, 3032, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2388, 3227, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2397, 3219, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2404, 3212, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2413, 3206, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2423, 3197, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2433, 3187, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2441, 3179, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2451, 3173, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2461, 2943, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2471, 2953, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2479, 2964, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2487, 2969, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2496, 2977, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2506, 2989, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2516, 2908, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2526, 2917, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2536, 2926, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2546, 2930, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2555, 3302, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2567, 3293, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2577, 3283, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2587, 3274, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2597, 3266, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2607, 3258, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2617, 3252, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2628, 3246, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2635, 3024, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2646, 3017, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2681, 2991, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2198, 2746, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2208, 2732, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2218, 2714, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2228, 3124, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2240, 3114, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2250, 3105, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2261, 3095, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2274, 3085, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2285, 3082, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2295, 3080, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2304, 3066, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2313, 3057, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2325, 3052, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2334, 3043, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2345, 3039, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2354, 2708, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2363, 2724, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2373, 3030, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2383, 3230, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2392, 3222, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2403, 3215, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2411, 3205, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2421, 3198, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2431, 3189, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2442, 3179, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2453, 3172, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2465, 2944, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2475, 2956, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2483, 2968, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2494, 2975, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2505, 2986, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2515, 2906, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2525, 2916, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2535, 2923, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2545, 2933, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2554, 3303, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2564, 3294, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2576, 3284, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2586, 3275, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2596, 3267, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2606, 3259, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2616, 3252, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2626, 3244, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2638, 3239, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2647, 3018, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2662, 3008, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2671, 3000, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2680, 2993, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2689, 3235, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2199, 2741, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2211, 2730, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2221, 2707, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2231, 3120, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2241, 3112, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2252, 3103, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2262, 3094, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2273, 3088, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2284, 3072, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2294, 3079, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2305, 3064, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2317, 3056, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2327, 3047, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2337, 3041, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2346, 3036, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2355, 2709, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2364, 2725, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2376, 3030, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2386, 3228, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2395, 3223, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2405, 3214, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2415, 3203, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2428, 3193, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2439, 3182, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2450, 3174, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2460, 2942, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2470, 2950, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2480, 2963, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2489, 2971, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2499, 2981, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2511, 2903, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2521, 2913, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2532, 2921, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2542, 2928, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2552, 2936, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2562, 3295, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2573, 3287, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2583, 3279, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2595, 3269, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2605, 3260, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2615, 3251, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2625, 3244, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2637, 3236, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2649, 3015, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2660, 3007, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2670, 2999, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2679, 2992, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2690, 3238, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2200, 2743, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2209, 2729, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2219, 2712, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2229, 3124, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2238, 3113, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2248, 3106, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2257, 3098, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2267, 3090, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2277, 3084, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2287, 3075, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2298, 3070, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2309, 3062, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2319, 3054, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2328, 3046, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2335, 3041, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2344, 3039, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2351, 2707, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2359, 2717, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2368, 2731, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2377, 3035, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2387, 3226, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2396, 3219, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2406, 3211, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2418, 3202, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2426, 3192, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2436, 3184, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2446, 3176, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2456, 2938, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2466, 2948, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2476, 2960, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2486, 2970, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2493, 2977, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2503, 2985, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2513, 2907, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2523, 2915, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2533, 2922, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2543, 2929, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2553, 3304, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2563, 3294, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2572, 3284, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2582, 3279, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2591, 3270, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2601, 3262, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2611, 3255, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2621, 3248, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2631, 3242, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2641, 3021, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2651, 3012, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2657, 3009, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2666, 3003, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2675, 2995, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2686, 3237, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2201, 2740, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2210, 2728, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2220, 2710, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2230, 3122, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2239, 3112, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2249, 3104, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2258, 3098, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2268, 3091, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2278, 3083, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2289, 3075, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2299, 3071, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2310, 3061, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2343, 3037, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2352, 3035, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2360, 2720, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2369, 3026, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2378, 3237, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2389, 3224, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2398, 3218, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2407, 3209, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2416, 3200, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2425, 3194, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2435, 3185, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2445, 3177, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2454, 3168, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2462, 2947, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2472, 2954, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2481, 2966, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2490, 2974, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2498, 2982, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2508, 2902, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2520, 2911, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2529, 2920, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2539, 2924, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2549, 2931, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2559, 3298, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2569, 3289, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2579, 3282, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2589, 3273, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2598, 3263, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2608, 3258, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2618, 3250, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2627, 3246, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2636, 3025, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2645, 3015, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2655, 3011, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2664, 3006, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2673, 2997, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2683, 2990, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2202, 2738, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2212, 2726, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2223, 2704, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2233, 3118, 23);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2243, 3110, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2253, 3101, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2263, 3093, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2272, 3086, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2281, 3082, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2291, 3077, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2301, 3067, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2311, 3060, 28);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2320, 3053, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2330, 3044, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2339, 3038, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2350, 3034, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2361, 2718, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2370, 3027, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2380, 3232, 27);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2390, 3224, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2399, 3218, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2408, 3210, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2417, 3200, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2427, 3191, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2437, 3183, 24);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2447, 3175, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2459, 2940, 2);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2469, 2951, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2478, 2962, 16);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2488, 2972, 20);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2497, 2978, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2507, 2988, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2517, 2910, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2530, 2919, 17);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2540, 2927, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2550, 2932, 15);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2560, 3297, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2570, 3289, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2580, 3280, 21);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2590, 3271, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2600, 3263, 29);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2610, 3256, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2619, 3248, 26);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2629, 3243, 32);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2639, 3023, 25);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2650, 3014, 30);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2658, 3007, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2667, 3001, 18);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2677, 2993, 19);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2687, 3235, 22);
INSERT INTO public."RepositoryTypes" (id, "idRepository", "idCatalog") VALUES (2691, 2585, 8);


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Users" (id, email, username, password, "firstName", "lastName", type, "createdAt", "updatedAt", "profileImage") VALUES (1, 'admin@admin', 'admin', 'Nyan', 'Admin', 'Is Admin', 1, NULL, NULL, 'http://www.nyan.cat/cats/original.gif');


--
-- Data for Name: Verification_Token; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: BundleComment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."BundleComment_id_seq"', 1, false);


--
-- Name: BundleRepository_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."BundleRepository_id_seq"', 1, false);


--
-- Name: Bundle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Bundle_id_seq"', 1, false);


--
-- Name: CatalogAuthors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CatalogAuthors_id_seq"', 1, true);


--
-- Name: CatalogEditorials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CatalogEditorials_id_seq"', 1, false);


--
-- Name: CatalogTopics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CatalogTopics_id_seq"', 3, true);


--
-- Name: CatalogTypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CatalogTypes_id_seq"', 4, true);


--
-- Name: Files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Files_id_seq"', 1, false);


--
-- Name: MyList_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MyList_id_seq"', 1, false);


--
-- Name: Repositories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Repositories_id_seq"', 3391, true);


--
-- Name: RepositoryAuthors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RepositoryAuthors_id_seq"', 7, true);


--
-- Name: RepositoryComment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RepositoryComment_id_seq"', 13, true);


--
-- Name: RepositoryEditorials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RepositoryEditorials_id_seq"', 2, true);


--
-- Name: RepositoryResources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RepositoryResources_id_seq"', 811, true);


--
-- Name: RepositoryScore_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RepositoryScore_id_seq"', 1, false);


--
-- Name: RepositoryTopics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RepositoryTopics_id_seq"', 5291, true);


--
-- Name: RepositoryTypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RepositoryTypes_id_seq"', 2691, true);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_id_seq"', 1, false);


--
-- Name: Verification_Token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Verification_Token_id_seq"', 1, false);


--
-- Name: catalogtopics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.catalogtopics_id_seq', 42, true);


--
-- Name: catalogtypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.catalogtypes_id_seq', 35, true);


--
-- Name: BundleComment BundleComment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BundleComment"
    ADD CONSTRAINT "BundleComment_pkey" PRIMARY KEY (id);


--
-- Name: BundleRepository BundleRepository_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BundleRepository"
    ADD CONSTRAINT "BundleRepository_pkey" PRIMARY KEY (id);


--
-- Name: Bundle Bundle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Bundle"
    ADD CONSTRAINT "Bundle_pkey" PRIMARY KEY (id);


--
-- Name: CatalogAuthors CatalogAuthors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CatalogAuthors"
    ADD CONSTRAINT "CatalogAuthors_pkey" PRIMARY KEY (id);


--
-- Name: CatalogEditorials CatalogEditorials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CatalogEditorials"
    ADD CONSTRAINT "CatalogEditorials_pkey" PRIMARY KEY (id);


--
-- Name: CatalogTopics CatalogTopics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CatalogTopics"
    ADD CONSTRAINT "CatalogTopics_pkey" PRIMARY KEY (id);


--
-- Name: CatalogTypes CatalogTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CatalogTypes"
    ADD CONSTRAINT "CatalogTypes_pkey" PRIMARY KEY (id);


--
-- Name: Files Files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Files"
    ADD CONSTRAINT "Files_pkey" PRIMARY KEY (id);


--
-- Name: Files Files_url_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Files"
    ADD CONSTRAINT "Files_url_key" UNIQUE (url);


--
-- Name: MyList MyList_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MyList"
    ADD CONSTRAINT "MyList_pkey" PRIMARY KEY (id);


--
-- Name: Repositories Repositories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Repositories"
    ADD CONSTRAINT "Repositories_pkey" PRIMARY KEY (id);


--
-- Name: RepositoryAuthors RepositoryAuthors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryAuthors"
    ADD CONSTRAINT "RepositoryAuthors_pkey" PRIMARY KEY (id);


--
-- Name: RepositoryComment RepositoryComment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryComment"
    ADD CONSTRAINT "RepositoryComment_pkey" PRIMARY KEY (id);


--
-- Name: RepositoryEditorials RepositoryEditorials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryEditorials"
    ADD CONSTRAINT "RepositoryEditorials_pkey" PRIMARY KEY (id);


--
-- Name: RepositoryResources RepositoryResources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryResources"
    ADD CONSTRAINT "RepositoryResources_pkey" PRIMARY KEY (id);


--
-- Name: RepositoryScore RepositoryScore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryScore"
    ADD CONSTRAINT "RepositoryScore_pkey" PRIMARY KEY (id);


--
-- Name: RepositoryTopics RepositoryTopics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryTopics"
    ADD CONSTRAINT "RepositoryTopics_pkey" PRIMARY KEY (id);


--
-- Name: RepositoryTypes RepositoryTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryTypes"
    ADD CONSTRAINT "RepositoryTypes_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);


--
-- Name: Users Users_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_id_key" UNIQUE (id);


--
-- Name: Users Users_password_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_password_key" UNIQUE (password);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id, username);


--
-- Name: Users Users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key" UNIQUE (username);


--
-- Name: Verification_Token Verification_Token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Verification_Token"
    ADD CONSTRAINT "Verification_Token_pkey" PRIMARY KEY (id);


--
-- Name: catalogeditorials_name_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX catalogeditorials_name_uindex ON public."CatalogEditorials" USING btree (name);


--
-- Name: catalogtopics_value_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX catalogtopics_value_uindex ON public."CatalogTopics" USING btree (value);


--
-- Name: catalogtypes_value_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX catalogtypes_value_uindex ON public."CatalogTypes" USING btree (value);


--
-- Name: BundleComment BundleComment_idBundle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BundleComment"
    ADD CONSTRAINT "BundleComment_idBundle_fkey" FOREIGN KEY ("idBundle") REFERENCES public."Bundle"(id);


--
-- Name: BundleComment BundleComment_idUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BundleComment"
    ADD CONSTRAINT "BundleComment_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);


--
-- Name: BundleComment BundleComment_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BundleComment"
    ADD CONSTRAINT "BundleComment_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);


--
-- Name: BundleRepository BundleRepository_idBundle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BundleRepository"
    ADD CONSTRAINT "BundleRepository_idBundle_fkey" FOREIGN KEY ("idBundle") REFERENCES public."Bundle"(id);


--
-- Name: BundleRepository BundleRepository_idRepository_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BundleRepository"
    ADD CONSTRAINT "BundleRepository_idRepository_fkey" FOREIGN KEY ("idRepository") REFERENCES public."Repositories"(id);


--
-- Name: Bundle Bundle_idUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Bundle"
    ADD CONSTRAINT "Bundle_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);


--
-- Name: Bundle Bundle_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Bundle"
    ADD CONSTRAINT "Bundle_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);


--
-- Name: MyList MyList_idRepository_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MyList"
    ADD CONSTRAINT "MyList_idRepository_fkey" FOREIGN KEY ("idRepository") REFERENCES public."Repositories"(id);


--
-- Name: MyList MyList_idUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MyList"
    ADD CONSTRAINT "MyList_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);


--
-- Name: MyList MyList_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MyList"
    ADD CONSTRAINT "MyList_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);


--
-- Name: Repositories Repositories_idUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Repositories"
    ADD CONSTRAINT "Repositories_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);


--
-- Name: Repositories Repositories_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Repositories"
    ADD CONSTRAINT "Repositories_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);


--
-- Name: RepositoryAuthors RepositoryAuthors_idAuthor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryAuthors"
    ADD CONSTRAINT "RepositoryAuthors_idAuthor_fkey" FOREIGN KEY ("idAuthor") REFERENCES public."CatalogAuthors"(id);


--
-- Name: RepositoryAuthors RepositoryAuthors_idRepository_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryAuthors"
    ADD CONSTRAINT "RepositoryAuthors_idRepository_fkey" FOREIGN KEY ("idRepository") REFERENCES public."Repositories"(id);


--
-- Name: RepositoryComment RepositoryComment_idRepositoty_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryComment"
    ADD CONSTRAINT "RepositoryComment_idRepositoty_fkey" FOREIGN KEY ("idRepository") REFERENCES public."Repositories"(id);


--
-- Name: RepositoryComment RepositoryComment_idUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryComment"
    ADD CONSTRAINT "RepositoryComment_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);


--
-- Name: RepositoryComment RepositoryComment_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryComment"
    ADD CONSTRAINT "RepositoryComment_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);


--
-- Name: RepositoryEditorials RepositoryEditorials_idCatalog_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryEditorials"
    ADD CONSTRAINT "RepositoryEditorials_idCatalog_fkey" FOREIGN KEY ("idCatalog") REFERENCES public."CatalogEditorials"(id);


--
-- Name: RepositoryEditorials RepositoryEditorials_idRepository_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryEditorials"
    ADD CONSTRAINT "RepositoryEditorials_idRepository_fkey" FOREIGN KEY ("idRepository") REFERENCES public."Repositories"(id);


--
-- Name: RepositoryResources RepositoryResources_idRepository_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryResources"
    ADD CONSTRAINT "RepositoryResources_idRepository_fkey" FOREIGN KEY ("idRepository") REFERENCES public."Repositories"(id);


--
-- Name: RepositoryResources RepositoryResources_idUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryResources"
    ADD CONSTRAINT "RepositoryResources_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);


--
-- Name: RepositoryResources RepositoryResources_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryResources"
    ADD CONSTRAINT "RepositoryResources_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);


--
-- Name: RepositoryScore RepositoryScore_idUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryScore"
    ADD CONSTRAINT "RepositoryScore_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);


--
-- Name: RepositoryScore RepositoryScore_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryScore"
    ADD CONSTRAINT "RepositoryScore_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);


--
-- Name: RepositoryTopics RepositoryTopics_idCatalog_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryTopics"
    ADD CONSTRAINT "RepositoryTopics_idCatalog_fkey" FOREIGN KEY ("idCatalog") REFERENCES public."CatalogTopics"(id);


--
-- Name: RepositoryTopics RepositoryTopics_idRepository_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryTopics"
    ADD CONSTRAINT "RepositoryTopics_idRepository_fkey" FOREIGN KEY ("idRepository") REFERENCES public."Repositories"(id);


--
-- Name: RepositoryTypes RepositoryTypes_idCatalog_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryTypes"
    ADD CONSTRAINT "RepositoryTypes_idCatalog_fkey" FOREIGN KEY ("idCatalog") REFERENCES public."CatalogTypes"(id);


--
-- Name: RepositoryTypes RepositoryTypes_idRepository_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RepositoryTypes"
    ADD CONSTRAINT "RepositoryTypes_idRepository_fkey" FOREIGN KEY ("idRepository") REFERENCES public."Repositories"(id);


--
-- Name: Verification_Token Verification_Token_idUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Verification_Token"
    ADD CONSTRAINT "Verification_Token_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);


--
-- Name: Verification_Token Verification_Token_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Verification_Token"
    ADD CONSTRAINT "Verification_Token_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);


--
-- PostgreSQL database dump complete
--

