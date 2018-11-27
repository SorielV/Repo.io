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
-- Name: Blog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Blog" (
    id integer NOT NULL,
    "idUser" integer,
    username character varying(20),
    title character varying(80) NOT NULL,
    slug character varying(80) NOT NULL,
    description character varying(120) NOT NULL,
    image character varying(140) DEFAULT NULL::character varying,
    content text NOT NULL,
    tags character varying(255) DEFAULT NULL::character varying,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."Blog" OWNER TO postgres;

--
-- Name: Blog_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Blog_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Blog_id_seq" OWNER TO postgres;

--
-- Name: Blog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Blog_id_seq" OWNED BY public."Blog".id;


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
    "createdAt" timestamp without time zone,
    image character varying(120)
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
    image character varying(100) DEFAULT NULL::character varying,
    tags character varying(120) NOT NULL,
    visibility smallint DEFAULT 0,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone,
    slug character varying(80) DEFAULT NULL::character varying,
    content text DEFAULT 'Sin Contenido'::text
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
    "updatedAt" timestamp without time zone,
    name character varying(80),
    description character varying(80)
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
-- Name: Blog id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Blog" ALTER COLUMN id SET DEFAULT nextval('public."Blog_id_seq"'::regclass);


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
-- Data for Name: Blog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Blog" (id, "idUser", username, title, slug, description, image, content, tags, "createdAt") FROM stdin;
2	2	Soriel	Digital Ocean	digital-ocean	Hosting 	https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/DigitalOcean_logo.svg/600px-DigitalOcean_logo.svg.png	# Exul clamor tigres et increvit tellurem pectora\n\n## Si consistite deplorata Tamasenum\n\nLorem markdownum aurum, Pirenidas curru, temperat hanc esse **longo corpora**\nNemeaea nocte supplevit. Passa repetita pascas et eris salutem sagax Pyracmon:\ncuius mihi, maiora es ad certa Turnus, in. Quondam vera. Silentum agrestes\n**rastrorumque sectos Memnonis** ignis, Troiae deos nodosque, deflevere.\n\n    var postscript_scroll = vram - map;\n    vector -= pipelineBitrateDual;\n    var boot = kilobyte.dongleDrive.system(memory / drag) +\n            accessPermalink.station.sdk_readme(pack_up_suffix(489452));\n    mcaNorthbridgeComponent.engine_ripping_encoding *= isdn(driver(3,\n            supply_cybersquatter, 2) + pretestPowerSyntax);\n\nUmbras cessent hos, publica infelix te quod in procis deripit dixit, binominis?\nFoedere nati utque et tamen summa taceam lassa et [numerare\nomnes](http://darearmeniae.com/se-exemplo.html), esse. Legit nullos luctataque\nremovit, illa uncis, adde hoc laboris. Parvis tamen postquam Andromedan plura\nurbem vosque decusque. Ingenti praeda Minos, lite pete, *vix* bis cervi cum\nfrater.\n\n## Unda exigit patris si festum positas pecori\n\nDonis natam, cum [guttae sortis](http://putria.net/agat.aspx). Hecabesque dicere\nvelut et turis, morte ipsos vertar. Abdit tibi naves in praebet superstes\niunctissimus sibi est iamque Sol honor Me Pelasgi dabit, *hos debita Lycaei*;\nincepto.\n\n    if (bespoke(analystDvdDram, samba_myspace + 438968, directory_simplex)) {\n        css(cad);\n        card_restore_click += metal_hibernate;\n    }\n    camera(ctr * rich_null_kvm);\n    ups_device_cookie += secondaryRingView.controllerRayE(upJre, 5) -\n            viewSambaHexadecimal;\n    var duplexPhreakingApple = lossy_suffix_horse;\n\nInduroque deieci: servati e *regna pronusque* solus septem in idem tendebat\nmare, truces. Imago obnoxia reperitur dixit. Clademque loquendo; ignes\nexsiluisse prius caelo vox, cruciataque Iris iussus coniugis sed indignantesque\nflumina ministris avari? Usus *circumsona medullis lapsus* pressaeque congesta\ncontemptaque silvas movitque tenues pollice tori ovis rectorque oris. Uteroque\nsociis occupat Perseus futura deicit acta canes non pro sine et discordia,\nmoenibus.\n\n1. Ut fecerat Dianae vulnere spina\n2. Quae et hinc manus materiaque\n3. Cum harundine Amnis cura aliorum mons quae\n4. Pugnabo et tabo gestare attenuatus totidem nisi\n\nGeniti quem **quae** et locus meruisse pugnet, albis nobis occasus. Valuere\nlatos, fetu Nise ille, rursus ergo famulasque. Ignis precaria? Sinuessa contulit\ncongelat patriosque Aeaciden felicia cetera.	hosting,servers,devops	2018-11-20 23:19:42.98276
\.


--
-- Data for Name: Bundle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Bundle" (id, "idUser", title, description, oficial, username, "createdAt", image) FROM stdin;
1	2	Full Stack Developer	Conviertete en un Full Stack Developer	f	Soriel	2018-11-20 14:24:21.718	https://media.makeameme.org/created/full-stack-developer.jpg
\.


--
-- Data for Name: BundleComment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BundleComment" (id, "idUser", username, "idBundle", comment, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: BundleRepository; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BundleRepository" (id, "idBundle", "idRepository", "createdAt") FROM stdin;
1	1	2782	2018-11-20 17:54:16.804098
2	1	2783	2018-11-20 20:09:05.321572
\.


--
-- Data for Name: CatalogAuthors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CatalogAuthors" (id, image, description, "lastName", "firstName", "createdAt") FROM stdin;
1	http://www.nyan.cat/cats/original.gif	Is a Cat	Cat	Nyan	2018-11-10 20:51:39.912119
3	http://www.nyan.cat/cats/mexinyan.gif	Is a Mexican Cat	Mexican	Nyan	2018-11-14 00:41:41.350202
2	/public/repositories/author/1542929397445.jpg	Arthur Ignatius Conan Doyle ​ fue un escritor y médico ...	Conan Doyle	Arthur	2018-10-04 17:27:31
\.


--
-- Data for Name: CatalogEditorials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CatalogEditorials" (id, image, description, name) FROM stdin;
1	/public/repositories/editorial/1542991877781.png	Nintendo	nintendo
\.


--
-- Data for Name: CatalogTopics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CatalogTopics" (id, value, description, image) FROM stdin;
2	Samples	Samples	\N
3	Cultura		\N
8	Fotografia		\N
12	Negocios		\N
13	Disenio		\N
17	Javascript		\N
19	Machine Learning		\N
20	Programing		\N
21	Sotfware		\N
22	Tecnologia		\N
23	Otros		\N
26	cartoons	Cartoons	\N
1	Examples	Examples	/public/repositories/topic/1542923104975.png
5	Videojuegos	jsjsjsjs	/public/repositories/topic/1542925161094.jpg
6	Humor	Es el dia del platanooooooooooo	/public/repositories/topic/1542925182247.jpg
25	anime	Gorubin slaya	/public/repositories/topic/1542925214137.jpg
24	pokemon	El mundo pokemon	/public/repositories/topic/1542925257184.jpg
9	Deportes	Vive sano	/public/repositories/topic/1542925296798.jpg
11	TV	Tv chavos	/public/repositories/topic/1542925331120.jpg
16	Economia	dinero	/public/repositories/topic/1542925351444.jpg
4	Comida	Para chuparse los dedos	/public/repositories/topic/1542925425995.jpg
7	Musica	Relax	/public/repositories/topic/1542925463115.jpg
10	Estilo	Manera de vivir	/public/repositories/topic/1542925517090.jpg
\.


--
-- Data for Name: CatalogTypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CatalogTypes" (id, value, description, image) FROM stdin;
8	Infografias y Memes		\N
32	bug	Tipo de pokemon {bug}	\N
2	grass	Tipo de pokemon {grass}	/public/catalog/types/2.jpeg
36	Exampleee	1111	\N
29	steel	Tipo de pokemon {steel}	/public/repositories/type/1542924202119.png
30	flying	Tipo de pokemon {flying}	/public/repositories/type/1542924241606.jpg
28	dragon	BESTO POKEMON DRAGON	/public/repositories/type/1542924154620.png
24	fighting	BESTO HUSBANDO	/public/repositories/type/1542923886326.png
20	electric	uy	/public/repositories/type/1542924297001.png
21	ice	Nievesita de la villa	/public/repositories/type/1542923645574.jpg
18	dark	Este no es ditto	/public/repositories/type/1542923426076.jpg
15	water	Tipo de pokemon {water}	/public/repositories/type/1542924548431.jpg
39	Gato	Soy en un gato	/public/repositories/type/1542925698239.png
42	1	11111	/public/repositories/type/1543207625545.gif
1	Example	222222	/public/repositories/type/1542922171911.png
6	Tools Software	111111	/public/repositories/type/1542922546005.png
5	Portales Blogs	1111	/public/repositories/type/1542922562831.png
7	PPTs SlideShare	Es CHIdo	/public/repositories/type/1542922613227.png
9	People To Follow	Ni Idea	/public/repositories/type/1542922677135.png
3	Cursos	22211111111111222	/public/repositories/type/1542922848657.jpg
4	Videos	22211111111111222	/public/repositories/type/1542922881736.jpg
10	Comunidades	Comunidades comunitivas	/public/repositories/type/1542922974203.jpg
12	DataSets	Lorem ipsum dolore	/public/repositories/type/1542923118304.png
13	Papers	Cosas cientificas	undefined
14	Books	C U L T U R A	/public/repositories/type/1542923192722.jpg
11	APIs	COSAS	/public/repositories/type/1542923214261.png
17	normal	Tipo de pokemon {normal}	/public/repositories/type/1542923348496.png
16	fire	Tipo de pokemon {fire}	/public/repositories/type/1542923389154.jpg
19	poison	Tipo de pokemon {poison}	/public/repositories/type/1542923453725.jpg
22	ground	Tipo de pokemon {ground}	/public/repositories/type/1542923731687.jpg
23	fairy	Tipo de pokemon {fairy}	/public/repositories/type/1542923816746.png
25	psychic	Tipo de pokemon {psychic}	/public/repositories/type/1542924008060.jpg
26	rock	Tipo de pokemon {rock}	/public/repositories/type/1542924094888.png
27	ghost	Tipo de pokemon {ghost}	/public/repositories/type/1542924130006.jpg
\.


--
-- Data for Name: Files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Files" (id, type, path, url, "createdAt") FROM stdin;
\.


--
-- Data for Name: MyList; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MyList" (id, "idUser", username, "idRepository", type, "createdAt") FROM stdin;
\.


--
-- Data for Name: Repositories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt", slug, content) FROM stdin;
3397	1	admin	Nuevo Repositorio	Es Solo Un Nuevo Repositorio	/public/repositories/images/1543065644038.png	nuevo	2	2018-11-24 07:20:44.046192	\N	nuevo-repositorio	Sin Descripcion
3125	1	admin	Espurr	Espurr es el pokemon numero #677	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/677.png	ghost,dark,bug	1	2018-11-16 05:59:04.766272	\N	espurr	Sin Descripcion
3344	1	admin	Salandit	Salandit es el pokemon numero #757	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/757.png	water,psychic,ground,rock	1	2018-11-16 05:59:07.41775	\N	salandit	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed malesuada risus eu congue tristique. Aenean pharetra laoreet ligula, sit amet sagittis massa. Cras cursus ultricies egestas. Pellentesque iaculis tincidunt elit id convallis. Sed maximus ligula augue, vel convallis lectus iaculis ut. Proin diam enim, porttitor sollicitudin magna vitae, aliquam cursus ligula. Proin sit amet erat ac massa volutpat interdum. Donec ut tristique neque, vitae egestas arcu. Aliquam gravida mauris nec nunc lacinia pulvinar. In iaculis nec nisl sed volutpat. Nullam at hendrerit nunc, quis auctor nibh. Pellentesque volutpat luctus molestie. Morbi molestie purus ultrices, semper nunc accumsan, lobortis dolor. Maecenas lacinia, tortor vel suscipit vulputate, justo tellus molestie tortor, ac laoreet ipsum orci eget felis. Donec id magna vitae nulla feugiat molestie. Duis porttitor orci quis odio sagittis laoreet.\n\nIn dignissim eros quis laoreet vehicula. Nunc placerat ante vel fringilla semper. Duis non ornare ex, eu lacinia sapien. Mauris mauris arcu, pharetra vitae convallis et, elementum non sem. Nullam id ipsum orci. Maecenas sit amet libero erat. Maecenas quis nisi feugiat, finibus nisi nec, ullamcorper eros. Integer nec eleifend erat. Aenean ultricies nibh orci, ac luctus turpis dignissim faucibus. In erat elit, fermentum at arcu at, malesuada interdum orci. Nam ultrices finibus sagittis. Quisque feugiat vestibulum scelerisque.\n\nSed quis ultricies ex. Suspendisse vitae quam faucibus orci efficitur dictum. Donec ac tempus ipsum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nunc commodo turpis vitae interdum viverra. Sed dignissim magna lacus, sit amet mollis est tempus at.
3396	1	admin	Gato	Es solo un gato	/public/repositories/images/1542837643699.png	gato,cat,kawaii,moe	2	2018-11-21 16:00:43.725486	\N	gato	Sin Descripcion
3398	1	admin	1111111	11111111111111	/public/repositories/images/1543205492940.jpg	11111111111	1	2018-11-25 22:11:32.971983	\N	\N	Sin Contenido
3399	1	admin	11	1111	/public/repositories/images/1543205582179.jpg	11	1	2018-11-25 22:13:02.181692	\N	\N	Sin Contenido
3346	1	admin	Araquanid	Araquanid es el pokemon numero #752111	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/752.png	flying,electric,rock	1	2018-11-16 05:59:07.424949	\N	araquanid	Sin Descripcion
2585	1	admin	Squirtle	Squirtle es el pokemon numero #7	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/007.png	electric,grass	1	2018-11-16 05:58:58.20554	\N	squirtle	Sin Descripcion
2586	1	admin	Ivysaur	Ivysaur es el pokemon numero #2	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/002.png	fire,flying,ice,psychic	1	2018-11-16 05:58:58.207023	\N	ivysaur	Sin Descripcion
2587	1	admin	Charizard	Charizard es el pokemon numero #6	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/006.png	rock,electric,water	1	2018-11-16 05:58:58.218169	\N	charizard	Sin Descripcion
2588	1	admin	Charmeleon	Charmeleon es el pokemon numero #5	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/005.png	ground,rock,water	1	2018-11-16 05:58:58.220323	\N	charmeleon	Sin Descripcion
2589	1	admin	Wartortle	Wartortle es el pokemon numero #8	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/008.png	electric,grass	1	2018-11-16 05:58:58.225949	\N	wartortle	Sin Descripcion
2590	1	admin	Bulbasaur	Bulbasaur es el pokemon numero #1	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/001.png	fire,flying,ice,psychic	1	2018-11-16 05:58:58.252687	\N	bulbasaur	Sin Descripcion
2591	1	admin	Blastoise	Blastoise es el pokemon numero #9	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/009.png	electric,grass	1	2018-11-16 05:58:58.254838	\N	blastoise	Sin Descripcion
2592	1	admin	Venusaur	Venusaur es el pokemon numero #3	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/003.png	fire,flying,ice,psychic	1	2018-11-16 05:58:58.259438	\N	venusaur	Sin Descripcion
2593	1	admin	Charmander	Charmander es el pokemon numero #4	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/004.png	ground,rock,water	1	2018-11-16 05:58:58.261949	\N	charmander	Sin Descripcion
2594	1	admin	Caterpie	Caterpie es el pokemon numero #10	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/010.png	fire,flying,rock	1	2018-11-16 05:58:58.261463	\N	caterpie	Sin Descripcion
2595	1	admin	Metapod	Metapod es el pokemon numero #11	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/011.png	fire,flying,rock	1	2018-11-16 05:58:58.319933	\N	metapod	Sin Descripcion
2596	1	admin	Butterfree	Butterfree es el pokemon numero #12	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/012.png	rock,electric,fire,flying,ice	1	2018-11-16 05:58:58.324873	\N	butterfree	Sin Descripcion
2597	1	admin	Weedle	Weedle es el pokemon numero #13	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/013.png	fire,flying,psychic,rock	1	2018-11-16 05:58:58.337644	\N	weedle	Sin Descripcion
2598	1	admin	Beedrill	Beedrill es el pokemon numero #15	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/015.png	fire,flying,psychic,rock	1	2018-11-16 05:58:58.348104	\N	beedrill	Sin Descripcion
2599	1	admin	Kakuna	Kakuna es el pokemon numero #14	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/014.png	fire,flying,psychic,rock	1	2018-11-16 05:58:58.350144	\N	kakuna	Sin Descripcion
2600	1	admin	Pidgey	Pidgey es el pokemon numero #16	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/016.png	electric,ice,rock	1	2018-11-16 05:58:58.383302	\N	pidgey	Sin Descripcion
2601	1	admin	Pidgeot	Pidgeot es el pokemon numero #18	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/018.png	electric,ice,rock	1	2018-11-16 05:58:58.386539	\N	pidgeot	Sin Descripcion
2602	1	admin	Pidgeotto	Pidgeotto es el pokemon numero #17	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/017.png	electric,ice,rock	1	2018-11-16 05:58:58.392595	\N	pidgeotto	Sin Descripcion
2603	1	admin	Raticate	Raticate es el pokemon numero #20	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/020.png	fighting	1	2018-11-16 05:58:58.422183	\N	raticate	Sin Descripcion
2604	1	admin	Rattata	Rattata es el pokemon numero #19	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/019.png	fighting	1	2018-11-16 05:58:58.423787	\N	rattata	Sin Descripcion
2605	1	admin	Spearow	Spearow es el pokemon numero #21	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/021.png	electric,ice,rock	1	2018-11-16 05:58:58.425726	\N	spearow	Sin Descripcion
2606	1	admin	Fearow	Fearow es el pokemon numero #22	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/022.png	electric,ice,rock	1	2018-11-16 05:58:58.451019	\N	fearow	Sin Descripcion
2607	1	admin	Ekans	Ekans es el pokemon numero #23	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/023.png	ground,psychic	1	2018-11-16 05:58:58.459031	\N	ekans	Sin Descripcion
2608	1	admin	Arbok	Arbok es el pokemon numero #24	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/024.png	ground,psychic	1	2018-11-16 05:58:58.47008	\N	arbok	Sin Descripcion
2609	1	admin	Pikachu	Pikachu es el pokemon numero #25	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/025.png	ground	1	2018-11-16 05:58:58.47385	\N	pikachu	Sin Descripcion
2610	1	admin	Raichu	Raichu es el pokemon numero #26	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/026.png	ground	1	2018-11-16 05:58:58.498134	\N	raichu	Sin Descripcion
2611	1	admin	Sandshrew	Sandshrew es el pokemon numero #27	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/027.png	grass,ice,water	1	2018-11-16 05:58:58.506224	\N	sandshrew	Sin Descripcion
2612	1	admin	Sandslash	Sandslash es el pokemon numero #28	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/028.png	grass,ice,water	1	2018-11-16 05:58:58.515336	\N	sandslash	Sin Descripcion
2613	1	admin	Nidoran♀	Nidoran♀ es el pokemon numero #29	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/029.png	ground,psychic	1	2018-11-16 05:58:58.537283	\N	nidoran♀	Sin Descripcion
2614	1	admin	Nidorina	Nidorina es el pokemon numero #30	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/030.png	ground,psychic	1	2018-11-16 05:58:58.546837	\N	nidorina	Sin Descripcion
2615	1	admin	Nidoqueen	Nidoqueen es el pokemon numero #31	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/031.png	ground,ice,psychic,water	1	2018-11-16 05:58:58.548402	\N	nidoqueen	Sin Descripcion
2616	1	admin	Nidoran♂	Nidoran♂ es el pokemon numero #32	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/032.png	ground,psychic	1	2018-11-16 05:58:58.566477	\N	nidoran♂	Sin Descripcion
2617	1	admin	Nidorino	Nidorino es el pokemon numero #33	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/033.png	ground,psychic	1	2018-11-16 05:58:58.584565	\N	nidorino	Sin Descripcion
2618	1	admin	Nidoking	Nidoking es el pokemon numero #34	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/034.png	ground,ice,psychic,water	1	2018-11-16 05:58:58.678252	\N	nidoking	Sin Descripcion
2619	1	admin	Jigglypuff	Jigglypuff es el pokemon numero #39	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/039.png	steel,poison	1	2018-11-16 05:58:58.690871	\N	jigglypuff	Sin Descripcion
2620	1	admin	Clefairy	Clefairy es el pokemon numero #35	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/035.png	steel,poison	1	2018-11-16 05:58:58.691765	\N	clefairy	Sin Descripcion
2621	1	admin	Clefable	Clefable es el pokemon numero #36	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/036.png	steel,poison	1	2018-11-16 05:58:58.695607	\N	clefable	Sin Descripcion
2622	1	admin	Vulpix	Vulpix es el pokemon numero #37	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/037.png	ground,rock,water	1	2018-11-16 05:58:58.696392	\N	vulpix	Sin Descripcion
2623	1	admin	Wigglytuff	Wigglytuff es el pokemon numero #40	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/040.png	steel,poison	1	2018-11-16 05:58:58.701188	\N	wigglytuff	Sin Descripcion
2624	1	admin	Ninetales	Ninetales es el pokemon numero #38	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/038.png	ground,rock,water	1	2018-11-16 05:58:58.704893	\N	ninetales	Sin Descripcion
2625	1	admin	Golbat	Golbat es el pokemon numero #42	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/042.png	electric,ice,psychic,rock	1	2018-11-16 05:58:58.707008	\N	golbat	Sin Descripcion
2626	1	admin	Zubat	Zubat es el pokemon numero #41	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/041.png	electric,ice,psychic,rock	1	2018-11-16 05:58:58.718171	\N	zubat	Sin Descripcion
2628	1	admin	Gloom	Gloom es el pokemon numero #44	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/044.png	fire,flying,ice,psychic	1	2018-11-16 05:58:58.792065	\N	gloom	Sin Descripcion
2627	1	admin	Oddish	Oddish es el pokemon numero #43	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/043.png	fire,flying,ice,psychic	1	2018-11-16 05:58:58.730434	\N	oddish	Sin Descripcion
2637	1	admin	Persian	Persian es el pokemon numero #53	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/053.png	fighting	1	2018-11-16 05:58:58.862376	\N	persian	Sin Descripcion
2647	1	admin	Abra	Abra es el pokemon numero #63	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/063.png	bug,dark,ghost	1	2018-11-16 05:58:58.973004	\N	abra	Sin Descripcion
2655	1	admin	Tentacruel	Tentacruel es el pokemon numero #73	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/073.png	electric,ground,psychic	1	2018-11-16 05:58:59.083714	\N	tentacruel	Sin Descripcion
2665	1	admin	Magneton	Magneton es el pokemon numero #82	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/082.png	ground,fire,fighting	1	2018-11-16 05:58:59.208689	\N	magneton	Sin Descripcion
2673	1	admin	Shellder	Shellder es el pokemon numero #90	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/090.png	electric,grass	1	2018-11-16 05:58:59.323532	\N	shellder	Sin Descripcion
2681	1	admin	Kingler	Kingler es el pokemon numero #99	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/099.png	electric,grass	1	2018-11-16 05:58:59.434827	\N	kingler	Sin Descripcion
2691	1	admin	Hitmonchan	Hitmonchan es el pokemon numero #107	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/107.png	flying,psychic,fairy	1	2018-11-16 05:58:59.550512	\N	hitmonchan	Sin Descripcion
2700	1	admin	Horsea	Horsea es el pokemon numero #116	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/116.png	electric,grass	1	2018-11-16 05:58:59.662633	\N	horsea	Sin Descripcion
2710	1	admin	Magmar	Magmar es el pokemon numero #126	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/126.png	ground,rock,water	1	2018-11-16 05:58:59.772762	\N	magmar	Sin Descripcion
2719	1	admin	Jolteon	Jolteon es el pokemon numero #135	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/135.png	ground	1	2018-11-16 05:58:59.889755	\N	jolteon	Sin Descripcion
2729	1	admin	Zapdos	Zapdos es el pokemon numero #145	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/145.png	ice,rock	1	2018-11-16 05:59:00.004282	\N	zapdos	Sin Descripcion
2739	1	admin	Cyndaquil	Cyndaquil es el pokemon numero #155	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/155.png	ground,rock,water	1	2018-11-16 05:59:00.125936	\N	cyndaquil	Sin Descripcion
2749	1	admin	Ledyba	Ledyba es el pokemon numero #165	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/165.png	rock,electric,fire,flying,ice	1	2018-11-16 05:59:00.240472	\N	ledyba	Sin Descripcion
2760	1	admin	Togepi	Togepi es el pokemon numero #175	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/175.png	steel,poison	1	2018-11-16 05:59:00.360535	\N	togepi	Sin Descripcion
2769	1	admin	Sudowoodo	Sudowoodo es el pokemon numero #185	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/185.png	fighting,grass,ground,steel,water	1	2018-11-16 05:59:00.472515	\N	sudowoodo	Sin Descripcion
2778	1	admin	Wooper	Wooper es el pokemon numero #194	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/194.png	grass	1	2018-11-16 05:59:00.594567	\N	wooper	Sin Descripcion
2788	1	admin	Pineco	Pineco es el pokemon numero #204	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/204.png	fire,flying,rock	1	2018-11-16 05:59:00.697023	\N	pineco	Sin Descripcion
2796	1	admin	Shuckle	Shuckle es el pokemon numero #213	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/213.png	rock,steel,water	1	2018-11-16 05:59:00.812218	\N	shuckle	Sin Descripcion
2807	1	admin	Piloswine	Piloswine es el pokemon numero #221	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/221.png	fighting,fire,grass,steel,water	1	2018-11-16 05:59:00.976463	\N	piloswine	Sin Descripcion
2815	1	admin	Phanpy	Phanpy es el pokemon numero #231	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/231.png	grass,ice,water	1	2018-11-16 05:59:01.086568	\N	phanpy	Sin Descripcion
2825	1	admin	Miltank	Miltank es el pokemon numero #241	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/241.png	fighting	1	2018-11-16 05:59:01.20316	\N	miltank	Sin Descripcion
2834	1	admin	Ho-Oh	Ho-Oh es el pokemon numero #250	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/250.png	rock,electric,water	1	2018-11-16 05:59:01.336616	\N	ho-oh	Sin Descripcion
2843	1	admin	Marshtomp	Marshtomp es el pokemon numero #259	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/259.png	grass	1	2018-11-16 05:59:01.449814	\N	marshtomp	Sin Descripcion
2852	1	admin	Cascoon	Cascoon es el pokemon numero #268	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/268.png	fire,flying,rock	1	2018-11-16 05:59:01.566465	\N	cascoon	Sin Descripcion
2862	1	admin	Wingull	Wingull es el pokemon numero #278	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/278.png	electric,rock	1	2018-11-16 05:59:01.67734	\N	wingull	Sin Descripcion
2872	1	admin	Vigoroth	Vigoroth es el pokemon numero #288	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/288.png	fighting	1	2018-11-16 05:59:01.799237	\N	vigoroth	Sin Descripcion
2882	1	admin	Azurill	Azurill es el pokemon numero #298	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/298.png	steel,poison	1	2018-11-16 05:59:01.912504	\N	azurill	Sin Descripcion
2892	1	admin	Medicham	Medicham es el pokemon numero #308	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/308.png	flying,ghost,fairy	1	2018-11-16 05:59:02.027354	\N	medicham	Sin Descripcion
2902	1	admin	Carvanha	Carvanha es el pokemon numero #318	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/318.png	bug,electric,fighting,grass,fairy	1	2018-11-16 05:59:02.139534	\N	carvanha	Sin Descripcion
2912	1	admin	Trapinch	Trapinch es el pokemon numero #328	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/328.png	grass,ice,water	1	2018-11-16 05:59:02.254968	\N	trapinch	Sin Descripcion
2922	1	admin	Solrock	Solrock es el pokemon numero #338	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/338.png	bug,dark,ghost,grass,steel,water	1	2018-11-16 05:59:02.370426	\N	solrock	Sin Descripcion
2930	1	admin	Anorith	Anorith es el pokemon numero #347	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/347.png	rock,steel,water	1	2018-11-16 05:59:02.482775	\N	anorith	Sin Descripcion
2940	1	admin	Shaymin	Shaymin es el pokemon numero #492	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/492.png	bug,fire,flying,ice,poison	1	2018-11-16 05:59:02.593142	\N	shaymin	Sin Descripcion
2951	1	admin	Samurott	Samurott es el pokemon numero #503	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/503.png	grass,electric	1	2018-11-16 05:59:02.708782	\N	samurott	Sin Descripcion
2962	1	admin	Simisear	Simisear es el pokemon numero #514	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/514.png	water,ground,rock	1	2018-11-16 05:59:02.839262	\N	simisear	Sin Descripcion
2971	1	admin	Roggenrola	Roggenrola es el pokemon numero #524	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/524.png	water,grass,fighting,ground,steel	1	2018-11-16 05:59:02.949629	\N	roggenrola	Sin Descripcion
2981	1	admin	Gurdurr	Gurdurr es el pokemon numero #533	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/533.png	flying,psychic,fairy	1	2018-11-16 05:59:03.057423	\N	gurdurr	Sin Descripcion
2991	1	admin	Venipede	Venipede es el pokemon numero #543	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/543.png	fire,flying,psychic,rock	1	2018-11-16 05:59:03.168699	\N	venipede	Sin Descripcion
3001	1	admin	Krookodile	Krookodile es el pokemon numero #553	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/553.png	water,grass,ice,fighting,bug,fairy	1	2018-11-16 05:59:03.277656	\N	krookodile	Sin Descripcion
3011	1	admin	Cofagrigus	Cofagrigus es el pokemon numero #563	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/563.png	ghost,dark	1	2018-11-16 05:59:03.390018	\N	cofagrigus	Sin Descripcion
3021	1	admin	Cinccino	Cinccino es el pokemon numero #573	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/573.png	fighting	1	2018-11-16 05:59:03.499035	\N	cinccino	Sin Descripcion
2629	1	admin	Vileplume	Vileplume es el pokemon numero #45	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/045.png	fire,flying,ice,psychic	1	2018-11-16 05:58:58.79696	\N	vileplume	Sin Descripcion
2639	1	admin	Golduck	Golduck es el pokemon numero #55	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/055.png	electric,grass	1	2018-11-16 05:58:58.9054	\N	golduck	Sin Descripcion
2649	1	admin	Alakazam	Alakazam es el pokemon numero #65	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/065.png	bug,dark,ghost	1	2018-11-16 05:58:59.037566	\N	alakazam	Sin Descripcion
2658	1	admin	Graveler	Graveler es el pokemon numero #75	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/075.png	grass,water,fighting,ground,ice,steel	1	2018-11-16 05:58:59.15331	\N	graveler	Sin Descripcion
2668	1	admin	Doduo	Doduo es el pokemon numero #84	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/084.png	electric,ice,rock	1	2018-11-16 05:58:59.281387	\N	doduo	Sin Descripcion
2677	1	admin	Haunter	Haunter es el pokemon numero #93	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/093.png	dark,ghost,psychic	1	2018-11-16 05:58:59.387251	\N	haunter	Sin Descripcion
2685	1	admin	Exeggcute	Exeggcute es el pokemon numero #102	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/102.png	bug,dark,fire,flying,ghost,ice,poison	1	2018-11-16 05:58:59.492089	\N	exeggcute	Sin Descripcion
2696	1	admin	Rhydon	Rhydon es el pokemon numero #112	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/112.png	grass,water,fighting,ground,ice,steel	1	2018-11-16 05:58:59.605711	\N	rhydon	Sin Descripcion
2706	1	admin	Mr. Mime	Mr. Mime es el pokemon numero #122	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/122.png	ghost,steel,poison	1	2018-11-16 05:58:59.710679	\N	mr. mime	Sin Descripcion
2715	1	admin	Lapras	Lapras es el pokemon numero #131	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/131.png	electric,fighting,grass,rock	1	2018-11-16 05:58:59.821949	\N	lapras	Sin Descripcion
2725	1	admin	Kabutops	Kabutops es el pokemon numero #141	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/141.png	grass,electric,fighting,ground	1	2018-11-16 05:58:59.928407	\N	kabutops	Sin Descripcion
2733	1	admin	Mew	Mew es el pokemon numero #151	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/151.png	bug,dark,ghost	1	2018-11-16 05:59:00.032696	\N	mew	Sin Descripcion
2742	1	admin	Croconaw	Croconaw es el pokemon numero #159	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/159.png	electric,grass	1	2018-11-16 05:59:00.139656	\N	croconaw	Sin Descripcion
2752	1	admin	Ariados	Ariados es el pokemon numero #168	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/168.png	fire,flying,psychic,rock	1	2018-11-16 05:59:00.247298	\N	ariados	Sin Descripcion
2759	1	admin	Natu	Natu es el pokemon numero #177	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/177.png	dark,electric,ghost,ice,rock	1	2018-11-16 05:59:00.359914	\N	natu	Sin Descripcion
2768	1	admin	Azumarill	Azumarill es el pokemon numero #184	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/184.png	electric,grass,poison	1	2018-11-16 05:59:00.466309	\N	azumarill	Sin Descripcion
2777	1	admin	Yanma	Yanma es el pokemon numero #193	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/193.png	rock,electric,fire,flying,ice	1	2018-11-16 05:59:00.585919	\N	yanma	Sin Descripcion
2786	1	admin	Girafarig	Girafarig es el pokemon numero #203	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/203.png	bug,dark	1	2018-11-16 05:59:00.689607	\N	girafarig	Sin Descripcion
2793	1	admin	Qwilfish	Qwilfish es el pokemon numero #211	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/211.png	electric,ground,psychic	1	2018-11-16 05:59:00.807169	\N	qwilfish	Sin Descripcion
2803	1	admin	Magcargo	Magcargo es el pokemon numero #219	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/219.png	ground,water,fighting,rock	1	2018-11-16 05:59:00.925728	\N	magcargo	Sin Descripcion
2813	1	admin	Houndoom	Houndoom es el pokemon numero #229	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/229.png	fighting,ground,rock,water	1	2018-11-16 05:59:01.032483	\N	houndoom	Sin Descripcion
2823	1	admin	Elekid	Elekid es el pokemon numero #239	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/239.png	ground	1	2018-11-16 05:59:01.136448	\N	elekid	Sin Descripcion
2832	1	admin	Tyranitar	Tyranitar es el pokemon numero #248	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/248.png	fighting,bug,grass,ground,steel,water,fairy	1	2018-11-16 05:59:01.244827	\N	tyranitar	Sin Descripcion
2839	1	admin	Blaziken	Blaziken es el pokemon numero #257	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/257.png	flying,ground,psychic,water	1	2018-11-16 05:59:01.374237	\N	blaziken	Sin Descripcion
2847	1	admin	Linoone	Linoone es el pokemon numero #264	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/264.png	fighting	1	2018-11-16 05:59:01.493743	\N	linoone	Sin Descripcion
2857	1	admin	Seedot	Seedot es el pokemon numero #273	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/273.png	bug,fire,flying,ice,poison	1	2018-11-16 05:59:01.606419	\N	seedot	Sin Descripcion
2867	1	admin	Surskit	Surskit es el pokemon numero #283	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/283.png	electric,flying,rock	1	2018-11-16 05:59:01.712893	\N	surskit	Sin Descripcion
2876	1	admin	Whismur	Whismur es el pokemon numero #293	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/293.png	fighting	1	2018-11-16 05:59:01.853372	\N	whismur	Sin Descripcion
2886	1	admin	Mawile	Mawile es el pokemon numero #303	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/303.png	fire,ground	1	2018-11-16 05:59:01.9577	\N	mawile	Sin Descripcion
2897	1	admin	Volbeat	Volbeat es el pokemon numero #313	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/313.png	fire,flying,rock	1	2018-11-16 05:59:02.064567	\N	volbeat	Sin Descripcion
2906	1	admin	Camerupt	Camerupt es el pokemon numero #323	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/323.png	water,ground	1	2018-11-16 05:59:02.166198	\N	camerupt	Sin Descripcion
2916	1	admin	Cacturne	Cacturne es el pokemon numero #332	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/332.png	bug,fire,fighting,flying,ice,poison,fairy	1	2018-11-16 05:59:02.277522	\N	cacturne	Sin Descripcion
2924	1	admin	Crawdaunt	Crawdaunt es el pokemon numero #342	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/342.png	bug,electric,fighting,grass,fairy	1	2018-11-16 05:59:02.38275	\N	crawdaunt	Sin Descripcion
2932	1	admin	Milotic	Milotic es el pokemon numero #350	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/350.png	electric,grass	1	2018-11-16 05:59:02.489783	\N	milotic	Sin Descripcion
2942	1	admin	Victini	Victini es el pokemon numero #494	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/494.png	water,ground,rock,ghost,dark	1	2018-11-16 05:59:02.59724	\N	victini	Sin Descripcion
2950	1	admin	Patrat	Patrat es el pokemon numero #504	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/504.png	fighting	1	2018-11-16 05:59:02.706822	\N	patrat	Sin Descripcion
2959	1	admin	Simisage	Simisage es el pokemon numero #512	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/512.png	fire,ice,poison,flying,bug	1	2018-11-16 05:59:02.812689	\N	simisage	Sin Descripcion
2969	1	admin	Blitzle	Blitzle es el pokemon numero #522	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/522.png	ground	1	2018-11-16 05:59:02.927032	\N	blitzle	Sin Descripcion
2980	1	admin	Timburr	Timburr es el pokemon numero #532	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/532.png	flying,psychic,fairy	1	2018-11-16 05:59:03.035444	\N	timburr	Sin Descripcion
2988	1	admin	Swadloon	Swadloon es el pokemon numero #541	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/541.png	fire,flying,ice,poison,bug,rock	1	2018-11-16 05:59:03.141032	\N	swadloon	Sin Descripcion
2998	1	admin	Basculin	Basculin es el pokemon numero #550	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/550.png	grass,electric	1	2018-11-16 05:59:03.246968	\N	basculin	Sin Descripcion
2630	1	admin	Paras	Paras es el pokemon numero #46	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/046.png	fire,flying,bug,ice,poison,rock	1	2018-11-16 05:58:58.80744	\N	paras	Sin Descripcion
2640	1	admin	Mankey	Mankey es el pokemon numero #56	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/056.png	flying,psychic,fairy	1	2018-11-16 05:58:58.919045	\N	mankey	Sin Descripcion
2651	1	admin	Machop	Machop es el pokemon numero #66	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/066.png	flying,psychic,fairy	1	2018-11-16 05:58:59.05021	\N	machop	Sin Descripcion
2661	1	admin	Ponyta	Ponyta es el pokemon numero #77	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/077.png	ground,rock,water	1	2018-11-16 05:58:59.167604	\N	ponyta	Sin Descripcion
2669	1	admin	Seel	Seel es el pokemon numero #86	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/086.png	electric,grass	1	2018-11-16 05:58:59.295845	\N	seel	Sin Descripcion
2679	1	admin	Onix	Onix es el pokemon numero #95	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/095.png	grass,water,fighting,ground,ice,steel	1	2018-11-16 05:58:59.407687	\N	onix	Sin Descripcion
2687	1	admin	Cubone	Cubone es el pokemon numero #104	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/104.png	grass,ice,water	1	2018-11-16 05:58:59.518812	\N	cubone	Sin Descripcion
2698	1	admin	Tangela	Tangela es el pokemon numero #114	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/114.png	bug,fire,flying,ice,poison	1	2018-11-16 05:58:59.639249	\N	tangela	Sin Descripcion
2708	1	admin	Jynx	Jynx es el pokemon numero #124	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/124.png	bug,dark,fire,ghost,rock,steel	1	2018-11-16 05:58:59.753208	\N	jynx	Sin Descripcion
2717	1	admin	Vaporeon	Vaporeon es el pokemon numero #134	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/134.png	electric,grass	1	2018-11-16 05:58:59.864906	\N	vaporeon	Sin Descripcion
2727	1	admin	Articuno	Articuno es el pokemon numero #144	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/144.png	rock,electric,fire,steel	1	2018-11-16 05:58:59.994136	\N	articuno	Sin Descripcion
2738	1	admin	Meganium	Meganium es el pokemon numero #154	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/154.png	bug,fire,flying,ice,poison	1	2018-11-16 05:59:00.122092	\N	meganium	Sin Descripcion
2747	1	admin	Noctowl	Noctowl es el pokemon numero #164	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/164.png	electric,ice,rock	1	2018-11-16 05:59:00.230741	\N	noctowl	Sin Descripcion
2757	1	admin	Cleffa	Cleffa es el pokemon numero #173	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/173.png	steel,poison	1	2018-11-16 05:59:00.341028	\N	cleffa	Sin Descripcion
2766	1	admin	Bellossom	Bellossom es el pokemon numero #182	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/182.png	bug,fire,flying,ice,poison	1	2018-11-16 05:59:00.454603	\N	bellossom	Sin Descripcion
2775	1	admin	Sunkern	Sunkern es el pokemon numero #191	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/191.png	bug,fire,flying,ice,poison	1	2018-11-16 05:59:00.568867	\N	sunkern	Sin Descripcion
2785	1	admin	Unown	Unown es el pokemon numero #201	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/201.png	bug,dark,ghost	1	2018-11-16 05:59:00.687565	\N	unown	Sin Descripcion
2794	1	admin	Scizor	Scizor es el pokemon numero #212	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/212.png	fire	1	2018-11-16 05:59:00.810056	\N	scizor	Sin Descripcion
2804	1	admin	Swinub	Swinub es el pokemon numero #220	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/220.png	fighting,fire,grass,steel,water	1	2018-11-16 05:59:00.931325	\N	swinub	Sin Descripcion
2814	1	admin	Kingdra	Kingdra es el pokemon numero #230	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/230.png	dragon,fairy	1	2018-11-16 05:59:01.045217	\N	kingdra	Sin Descripcion
2824	1	admin	Magby	Magby es el pokemon numero #240	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/240.png	ground,rock,water	1	2018-11-16 05:59:01.1601	\N	magby	Sin Descripcion
2855	1	admin	Lombre	Lombre es el pokemon numero #271	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/271.png	bug,flying,poison	1	2018-11-16 05:59:01.589192	\N	lombre	Sin Descripcion
2864	1	admin	Kirlia	Kirlia es el pokemon numero #281	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/281.png	ghost,steel,poison	1	2018-11-16 05:59:01.69886	\N	kirlia	Sin Descripcion
2874	1	admin	Nincada	Nincada es el pokemon numero #290	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/290.png	fire,flying,ice,water	1	2018-11-16 05:59:01.817996	\N	nincada	Sin Descripcion
2884	1	admin	Skitty	Skitty es el pokemon numero #300	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/300.png	fighting	1	2018-11-16 05:59:01.932998	\N	skitty	Sin Descripcion
2894	1	admin	Manectric	Manectric es el pokemon numero #310	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/310.png	ground	1	2018-11-16 05:59:02.044377	\N	manectric	Sin Descripcion
2904	1	admin	Wailmer	Wailmer es el pokemon numero #320	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/320.png	electric,grass	1	2018-11-16 05:59:02.160065	\N	wailmer	Sin Descripcion
2913	1	admin	Flygon	Flygon es el pokemon numero #330	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/330.png	ice,dragon,fairy	1	2018-11-16 05:59:02.269394	\N	flygon	Sin Descripcion
2923	1	admin	Barboach	Barboach es el pokemon numero #339	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/339.png	grass	1	2018-11-16 05:59:02.380198	\N	barboach	Sin Descripcion
2935	1	admin	Castform	Castform es el pokemon numero #351	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/351.png	fighting	1	2018-11-16 05:59:02.505108	\N	castform	Sin Descripcion
2945	1	admin	Serperior	Serperior es el pokemon numero #497	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/497.png	fire,ice,poison,flying,bug	1	2018-11-16 05:59:02.617815	\N	serperior	Sin Descripcion
2955	1	admin	Herdier	Herdier es el pokemon numero #507	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/507.png	fighting	1	2018-11-16 05:59:02.734806	\N	herdier	Sin Descripcion
2963	1	admin	Simipour	Simipour es el pokemon numero #516	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/516.png	grass,electric	1	2018-11-16 05:59:02.854259	\N	simipour	Sin Descripcion
2973	1	admin	Boldore	Boldore es el pokemon numero #525	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/525.png	water,grass,fighting,ground,steel	1	2018-11-16 05:59:02.988378	\N	boldore	Sin Descripcion
2983	1	admin	Tympole	Tympole es el pokemon numero #535	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/535.png	grass,electric	1	2018-11-16 05:59:03.101826	\N	tympole	Sin Descripcion
2993	1	admin	Scolipede	Scolipede es el pokemon numero #545	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/545.png	fire,flying,psychic,rock	1	2018-11-16 05:59:03.216022	\N	scolipede	Sin Descripcion
3002	1	admin	Darmanitan	Darmanitan es el pokemon numero #555	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/555.png	water,ground,rock	1	2018-11-16 05:59:03.329493	\N	darmanitan	Sin Descripcion
3012	1	admin	Carracosta	Carracosta es el pokemon numero #565	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/565.png	grass,electric,fighting,ground	1	2018-11-16 05:59:03.439886	\N	carracosta	Sin Descripcion
3022	1	admin	Gothita	Gothita es el pokemon numero #574	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/574.png	bug,ghost,dark	1	2018-11-16 05:59:03.550041	\N	gothita	Sin Descripcion
3032	1	admin	Vanilluxe	Vanilluxe es el pokemon numero #584	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/584.png	fire,fighting,rock,steel	1	2018-11-16 05:59:03.66194	\N	vanilluxe	Sin Descripcion
3041	1	admin	Jellicent	Jellicent es el pokemon numero #593	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/593.png	grass,electric,ghost,dark	1	2018-11-16 05:59:03.776271	\N	jellicent	Sin Descripcion
3050	1	admin	Tynamo	Tynamo es el pokemon numero #602	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/602.png		1	2018-11-16 05:59:03.889538	\N	tynamo	Sin Descripcion
2631	1	admin	Parasect	Parasect es el pokemon numero #47	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/047.png	fire,flying,bug,ice,poison,rock	1	2018-11-16 05:58:58.809645	\N	parasect	Sin Descripcion
2642	1	admin	Primeape	Primeape es el pokemon numero #57	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/057.png	flying,psychic,fairy	1	2018-11-16 05:58:58.9261	\N	primeape	Sin Descripcion
2652	1	admin	Machamp	Machamp es el pokemon numero #68	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/068.png	flying,psychic,fairy	1	2018-11-16 05:58:59.057658	\N	machamp	Sin Descripcion
2662	1	admin	Rapidash	Rapidash es el pokemon numero #78	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/078.png	ground,rock,water	1	2018-11-16 05:58:59.169465	\N	rapidash	Sin Descripcion
2670	1	admin	Dewgong	Dewgong es el pokemon numero #87	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/087.png	electric,fighting,grass,rock	1	2018-11-16 05:58:59.297705	\N	dewgong	Sin Descripcion
2680	1	admin	Drowzee	Drowzee es el pokemon numero #96	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/096.png	bug,dark,ghost	1	2018-11-16 05:58:59.414017	\N	drowzee	Sin Descripcion
2689	1	admin	Marowak	Marowak es el pokemon numero #105	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/105.png	grass,ice,water	1	2018-11-16 05:58:59.526607	\N	marowak	Sin Descripcion
2699	1	admin	Kangaskhan	Kangaskhan es el pokemon numero #115	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/115.png	fighting	1	2018-11-16 05:58:59.655206	\N	kangaskhan	Sin Descripcion
2709	1	admin	Electabuzz	Electabuzz es el pokemon numero #125	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/125.png	ground	1	2018-11-16 05:58:59.771887	\N	electabuzz	Sin Descripcion
2720	1	admin	Flareon	Flareon es el pokemon numero #136	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/136.png	ground,rock,water	1	2018-11-16 05:58:59.892466	\N	flareon	Sin Descripcion
2730	1	admin	Moltres	Moltres es el pokemon numero #146	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/146.png	rock,electric,water	1	2018-11-16 05:59:00.007023	\N	moltres	Sin Descripcion
2740	1	admin	Quilava	Quilava es el pokemon numero #156	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/156.png	ground,rock,water	1	2018-11-16 05:59:00.130076	\N	quilava	Sin Descripcion
2750	1	admin	Ledian	Ledian es el pokemon numero #166	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/166.png	rock,electric,fire,flying,ice	1	2018-11-16 05:59:00.243222	\N	ledian	Sin Descripcion
2783	1	admin	Slowking	Slowking es el pokemon numero #199	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/199.png	bug,dark,electric,ghost,grass	1	2018-11-16 05:59:00.676773	\N	slowking	Sin Descripcion
2795	1	admin	Snubbull	Snubbull es el pokemon numero #209	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/209.png	steel,poison	1	2018-11-16 05:59:00.811121	\N	snubbull	Sin Descripcion
2805	1	admin	Corsola	Corsola es el pokemon numero #222	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/222.png	grass,electric,fighting,ground	1	2018-11-16 05:59:00.97562	\N	corsola	Sin Descripcion
2816	1	admin	Donphan	Donphan es el pokemon numero #232	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/232.png	grass,ice,water	1	2018-11-16 05:59:01.092966	\N	donphan	Sin Descripcion
2826	1	admin	Blissey	Blissey es el pokemon numero #242	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/242.png	fighting	1	2018-11-16 05:59:01.207694	\N	blissey	Sin Descripcion
2835	1	admin	Celebi	Celebi es el pokemon numero #251	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/251.png	bug,dark,fire,flying,ghost,ice,poison	1	2018-11-16 05:59:01.339365	\N	celebi	Sin Descripcion
2844	1	admin	Swampert	Swampert es el pokemon numero #260	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/260.png	grass	1	2018-11-16 05:59:01.452453	\N	swampert	Sin Descripcion
2853	1	admin	Dustox	Dustox es el pokemon numero #269	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/269.png	fire,flying,psychic,rock	1	2018-11-16 05:59:01.575918	\N	dustox	Sin Descripcion
2863	1	admin	Pelipper	Pelipper es el pokemon numero #279	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/279.png	electric,rock	1	2018-11-16 05:59:01.691974	\N	pelipper	Sin Descripcion
2873	1	admin	Slaking	Slaking es el pokemon numero #289	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/289.png	fighting	1	2018-11-16 05:59:01.806226	\N	slaking	Sin Descripcion
2883	1	admin	Nosepass	Nosepass es el pokemon numero #299	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/299.png	fighting,grass,ground,steel,water	1	2018-11-16 05:59:01.921085	\N	nosepass	Sin Descripcion
2893	1	admin	Electrike	Electrike es el pokemon numero #309	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/309.png	ground	1	2018-11-16 05:59:02.035285	\N	electrike	Sin Descripcion
2903	1	admin	Sharpedo	Sharpedo es el pokemon numero #319	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/319.png	bug,electric,fighting,grass,fairy	1	2018-11-16 05:59:02.154849	\N	sharpedo	Sin Descripcion
2914	1	admin	Vibrava	Vibrava es el pokemon numero #329	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/329.png	ice,dragon,fairy	1	2018-11-16 05:59:02.27121	\N	vibrava	Sin Descripcion
2926	1	admin	Whiscash	Whiscash es el pokemon numero #340	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/340.png	grass	1	2018-11-16 05:59:02.387565	\N	whiscash	Sin Descripcion
2936	1	admin	Kecleon	Kecleon es el pokemon numero #352	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/352.png	fighting	1	2018-11-16 05:59:02.513994	\N	kecleon	Sin Descripcion
2946	1	admin	Tepig	Tepig es el pokemon numero #498	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/498.png	water,ground,rock	1	2018-11-16 05:59:02.64228	\N	tepig	Sin Descripcion
2956	1	admin	Stoutland	Stoutland es el pokemon numero #508	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/508.png	fighting	1	2018-11-16 05:59:02.77529	\N	stoutland	Sin Descripcion
2966	1	admin	Musharna	Musharna es el pokemon numero #518	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/518.png	bug,ghost,dark	1	2018-11-16 05:59:02.898529	\N	musharna	Sin Descripcion
2976	1	admin	Swoobat	Swoobat es el pokemon numero #528	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/528.png	electric,ice,rock,ghost,dark	1	2018-11-16 05:59:03.013144	\N	swoobat	Sin Descripcion
2986	1	admin	Throh	Throh es el pokemon numero #538	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/538.png	flying,psychic,fairy	1	2018-11-16 05:59:03.12803	\N	throh	Sin Descripcion
2997	1	admin	Petilil	Petilil es el pokemon numero #548	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/548.png	fire,ice,poison,flying,bug	1	2018-11-16 05:59:03.246512	\N	petilil	Sin Descripcion
3007	1	admin	Scrafty	Scrafty es el pokemon numero #560	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/560.png	fighting,flying,fairy	1	2018-11-16 05:59:03.360329	\N	scrafty	Sin Descripcion
3016	1	admin	Zorua	Zorua es el pokemon numero #570	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/570.png	fighting,bug,fairy	1	2018-11-16 05:59:03.472294	\N	zorua	Sin Descripcion
3027	1	admin	Reuniclus	Reuniclus es el pokemon numero #579	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/579.png	bug,ghost,dark	1	2018-11-16 05:59:03.592126	\N	reuniclus	Sin Descripcion
3062	1	admin	Beartic	Beartic es el pokemon numero #614	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/614.png	fire,fighting,rock,steel	1	2018-11-16 05:59:04.025265	\N	beartic	Sin Descripcion
3072	1	admin	Durant	Durant es el pokemon numero #632	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/632.png	fire	1	2018-11-16 05:59:04.138146	\N	durant	Sin Descripcion
3081	1	admin	Zweilous	Zweilous es el pokemon numero #634	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/634.png	ice,fighting,bug,dragon,fairy	1	2018-11-16 05:59:04.251808	\N	zweilous	Sin Descripcion
3090	1	admin	Reshiram	Reshiram es el pokemon numero #643	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/643.png	ground,rock,dragon	1	2018-11-16 05:59:04.364763	\N	reshiram	Sin Descripcion
2632	1	admin	Venonat	Venonat es el pokemon numero #48	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/048.png	fire,flying,psychic,rock	1	2018-11-16 05:58:58.81612	\N	venonat	Sin Descripcion
2643	1	admin	Arcanine	Arcanine es el pokemon numero #59	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/059.png	ground,rock,water	1	2018-11-16 05:58:58.93629	\N	arcanine	Sin Descripcion
2653	1	admin	Bellsprout	Bellsprout es el pokemon numero #69	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/069.png	fire,flying,ice,psychic	1	2018-11-16 05:58:59.076093	\N	bellsprout	Sin Descripcion
2663	1	admin	Slowpoke	Slowpoke es el pokemon numero #79	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/079.png	bug,dark,electric,ghost,grass	1	2018-11-16 05:58:59.198144	\N	slowpoke	Sin Descripcion
2672	1	admin	Grimer	Grimer es el pokemon numero #88	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/088.png	ground,psychic	1	2018-11-16 05:58:59.315868	\N	grimer	Sin Descripcion
2682	1	admin	Hypno	Hypno es el pokemon numero #97	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/097.png	bug,dark,ghost	1	2018-11-16 05:58:59.43775	\N	hypno	Sin Descripcion
2692	1	admin	Lickitung	Lickitung es el pokemon numero #108	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/108.png	fighting	1	2018-11-16 05:58:59.553092	\N	lickitung	Sin Descripcion
2701	1	admin	Goldeen	Goldeen es el pokemon numero #118	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/118.png	electric,grass	1	2018-11-16 05:58:59.665969	\N	goldeen	Sin Descripcion
2711	1	admin	Pinsir	Pinsir es el pokemon numero #127	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/127.png	fire,flying,rock	1	2018-11-16 05:58:59.782227	\N	pinsir	Sin Descripcion
2721	1	admin	Porygon	Porygon es el pokemon numero #137	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/137.png	fighting	1	2018-11-16 05:58:59.897738	\N	porygon	Sin Descripcion
2731	1	admin	Dratini	Dratini es el pokemon numero #147	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/147.png	dragon,ice,fairy	1	2018-11-16 05:59:00.013156	\N	dratini	Sin Descripcion
2743	1	admin	Typhlosion	Typhlosion es el pokemon numero #157	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/157.png	ground,rock,water	1	2018-11-16 05:59:00.144127	\N	typhlosion	Sin Descripcion
2753	1	admin	Crobat	Crobat es el pokemon numero #169	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/169.png	electric,ice,psychic,rock	1	2018-11-16 05:59:00.262234	\N	crobat	Sin Descripcion
2762	1	admin	Xatu	Xatu es el pokemon numero #178	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/178.png	dark,electric,ghost,ice,rock	1	2018-11-16 05:59:00.387932	\N	xatu	Sin Descripcion
2771	1	admin	Hoppip	Hoppip es el pokemon numero #187	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/187.png	ice,fire,flying,poison,rock	1	2018-11-16 05:59:00.503527	\N	hoppip	Sin Descripcion
2779	1	admin	Espeon	Espeon es el pokemon numero #196	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/196.png	bug,dark,ghost	1	2018-11-16 05:59:00.620175	\N	espeon	Sin Descripcion
2789	1	admin	Forretress	Forretress es el pokemon numero #205	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/205.png	fire	1	2018-11-16 05:59:00.735696	\N	forretress	Sin Descripcion
2799	1	admin	Sneasel	Sneasel es el pokemon numero #215	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/215.png	fighting,bug,fire,rock,steel,fairy	1	2018-11-16 05:59:00.850556	\N	sneasel	Sin Descripcion
2806	1	admin	Delibird	Delibird es el pokemon numero #225	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/225.png	rock,electric,fire,steel	1	2018-11-16 05:59:00.976132	\N	delibird	Sin Descripcion
2817	1	admin	Porygon2	Porygon2 es el pokemon numero #233	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/233.png	fighting	1	2018-11-16 05:59:01.093466	\N	porygon2	Sin Descripcion
2827	1	admin	Raikou	Raikou es el pokemon numero #243	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/243.png	ground	1	2018-11-16 05:59:01.208103	\N	raikou	Sin Descripcion
2836	1	admin	Treecko	Treecko es el pokemon numero #252	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/252.png	bug,fire,flying,ice,poison	1	2018-11-16 05:59:01.346477	\N	treecko	Sin Descripcion
2845	1	admin	Poochyena	Poochyena es el pokemon numero #261	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/261.png	fighting,bug,fairy	1	2018-11-16 05:59:01.462474	\N	poochyena	Sin Descripcion
2854	1	admin	Lotad	Lotad es el pokemon numero #270	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/270.png	bug,flying,poison	1	2018-11-16 05:59:01.576429	\N	lotad	Sin Descripcion
2865	1	admin	Ralts	Ralts es el pokemon numero #280	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/280.png	ghost,steel,poison	1	2018-11-16 05:59:01.700878	\N	ralts	Sin Descripcion
2875	1	admin	Ninjask	Ninjask es el pokemon numero #291	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/291.png	rock,electric,fire,flying,ice	1	2018-11-16 05:59:01.822563	\N	ninjask	Sin Descripcion
2885	1	admin	Delcatty	Delcatty es el pokemon numero #301	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/301.png	fighting	1	2018-11-16 05:59:01.937946	\N	delcatty	Sin Descripcion
2895	1	admin	Plusle	Plusle es el pokemon numero #311	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/311.png	ground	1	2018-11-16 05:59:02.052525	\N	plusle	Sin Descripcion
2905	1	admin	Wailord	Wailord es el pokemon numero #321	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/321.png	electric,grass	1	2018-11-16 05:59:02.162137	\N	wailord	Sin Descripcion
2917	1	admin	Swablu	Swablu es el pokemon numero #333	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/333.png	electric,ice,rock	1	2018-11-16 05:59:02.282018	\N	swablu	Sin Descripcion
2927	1	admin	Baltoy	Baltoy es el pokemon numero #343	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/343.png	bug,dark,ghost,grass,water,ice	1	2018-11-16 05:59:02.401288	\N	baltoy	Sin Descripcion
2937	1	admin	Shuppet	Shuppet es el pokemon numero #353	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/353.png	dark,ghost	1	2018-11-16 05:59:02.514693	\N	shuppet	Sin Descripcion
2947	1	admin	Pignite	Pignite es el pokemon numero #499	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/499.png	water,ground,flying,psychic	1	2018-11-16 05:59:02.642908	\N	pignite	Sin Descripcion
2957	1	admin	Purrloin	Purrloin es el pokemon numero #509	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/509.png	fighting,bug,fairy	1	2018-11-16 05:59:02.782444	\N	purrloin	Sin Descripcion
2967	1	admin	Tranquill	Tranquill es el pokemon numero #520	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/520.png	electric,ice,rock	1	2018-11-16 05:59:02.918186	\N	tranquill	Sin Descripcion
2977	1	admin	Excadrill	Excadrill es el pokemon numero #530	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/530.png	fire,water,fighting,ground	1	2018-11-16 05:59:03.034191	\N	excadrill	Sin Descripcion
2990	1	admin	Leavanny	Leavanny es el pokemon numero #542	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/542.png	fire,flying,ice,poison,bug,rock	1	2018-11-16 05:59:03.149649	\N	leavanny	Sin Descripcion
3000	1	admin	Krokorok	Krokorok es el pokemon numero #552	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/552.png	water,grass,ice,fighting,bug,fairy	1	2018-11-16 05:59:03.262664	\N	krokorok	Sin Descripcion
3010	1	admin	Yamask	Yamask es el pokemon numero #562	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/562.png	ghost,dark	1	2018-11-16 05:59:03.381014	\N	yamask	Sin Descripcion
3019	1	admin	Minccino	Minccino es el pokemon numero #572	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/572.png	fighting	1	2018-11-16 05:59:03.497038	\N	minccino	Sin Descripcion
3030	1	admin	Swanna	Swanna es el pokemon numero #581	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/581.png	electric,rock	1	2018-11-16 05:59:03.616668	\N	swanna	Sin Descripcion
3038	1	admin	Frillish	Frillish es el pokemon numero #592	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/592.png	grass,electric,ghost,dark	1	2018-11-16 05:59:03.745607	\N	frillish	Sin Descripcion
2633	1	admin	Dugtrio	Dugtrio es el pokemon numero #51	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/051.png	grass,ice,water	1	2018-11-16 05:58:58.820725	\N	dugtrio	Sin Descripcion
2641	1	admin	Growlithe	Growlithe es el pokemon numero #58	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/058.png	ground,rock,water	1	2018-11-16 05:58:58.925535	\N	growlithe	Sin Descripcion
2650	1	admin	Machoke	Machoke es el pokemon numero #67	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/067.png	flying,psychic,fairy	1	2018-11-16 05:58:59.047381	\N	machoke	Sin Descripcion
2659	1	admin	Golem	Golem es el pokemon numero #76	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/076.png	grass,water,fighting,ground,ice,steel	1	2018-11-16 05:58:59.153848	\N	golem	Sin Descripcion
2667	1	admin	Farfetch'd	Farfetch'd es el pokemon numero #83	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/083.png	electric,ice,rock	1	2018-11-16 05:58:59.277719	\N	farfetch'd	Sin Descripcion
2676	1	admin	Gastly	Gastly es el pokemon numero #92	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/092.png	dark,ghost,psychic	1	2018-11-16 05:58:59.386761	\N	gastly	Sin Descripcion
2686	1	admin	Electrode	Electrode es el pokemon numero #101	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/101.png	ground	1	2018-11-16 05:58:59.49271	\N	electrode	Sin Descripcion
2695	1	admin	Rhyhorn	Rhyhorn es el pokemon numero #111	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/111.png	grass,water,fighting,ground,ice,steel	1	2018-11-16 05:58:59.597697	\N	rhyhorn	Sin Descripcion
2704	1	admin	Starmie	Starmie es el pokemon numero #121	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/121.png	bug,dark,electric,ghost,grass	1	2018-11-16 05:58:59.69622	\N	starmie	Sin Descripcion
2714	1	admin	Gyarados	Gyarados es el pokemon numero #130	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/130.png	electric,rock	1	2018-11-16 05:58:59.807484	\N	gyarados	Sin Descripcion
2722	1	admin	Kabuto	Kabuto es el pokemon numero #140	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/140.png	grass,electric,fighting,ground	1	2018-11-16 05:58:59.918	\N	kabuto	Sin Descripcion
2732	1	admin	Dragonair	Dragonair es el pokemon numero #148	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/148.png	dragon,ice,fairy	1	2018-11-16 05:59:00.022099	\N	dragonair	Sin Descripcion
2741	1	admin	Totodile	Totodile es el pokemon numero #158	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/158.png	electric,grass	1	2018-11-16 05:59:00.139192	\N	totodile	Sin Descripcion
2751	1	admin	Spinarak	Spinarak es el pokemon numero #167	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/167.png	fire,flying,psychic,rock	1	2018-11-16 05:59:00.246719	\N	spinarak	Sin Descripcion
2758	1	admin	Togetic	Togetic es el pokemon numero #176	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/176.png	electric,ice,rock,steel,poison	1	2018-11-16 05:59:00.358577	\N	togetic	Sin Descripcion
2767	1	admin	Marill	Marill es el pokemon numero #183	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/183.png	electric,grass,poison	1	2018-11-16 05:59:00.463593	\N	marill	Sin Descripcion
2776	1	admin	Sunflora	Sunflora es el pokemon numero #192	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/192.png	bug,fire,flying,ice,poison	1	2018-11-16 05:59:00.573515	\N	sunflora	Sin Descripcion
2784	1	admin	Misdreavus	Misdreavus es el pokemon numero #200	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/200.png	dark,ghost	1	2018-11-16 05:59:00.684723	\N	misdreavus	Sin Descripcion
2792	1	admin	Granbull	Granbull es el pokemon numero #210	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/210.png	steel,poison	1	2018-11-16 05:59:00.806412	\N	granbull	Sin Descripcion
2802	1	admin	Slugma	Slugma es el pokemon numero #218	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/218.png	ground,rock,water	1	2018-11-16 05:59:00.918154	\N	slugma	Sin Descripcion
2812	1	admin	Houndour	Houndour es el pokemon numero #228	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/228.png	fighting,ground,rock,water	1	2018-11-16 05:59:01.021544	\N	houndour	Sin Descripcion
2821	1	admin	Smoochum	Smoochum es el pokemon numero #238	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/238.png	bug,dark,fire,ghost,rock,steel	1	2018-11-16 05:59:01.127025	\N	smoochum	Sin Descripcion
2830	1	admin	Pupitar	Pupitar es el pokemon numero #247	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/247.png	grass,water,fighting,ground,ice,steel	1	2018-11-16 05:59:01.232287	\N	pupitar	Sin Descripcion
2838	1	admin	Torchic	Torchic es el pokemon numero #255	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/255.png	ground,rock,water	1	2018-11-16 05:59:01.37373	\N	torchic	Sin Descripcion
2846	1	admin	Zigzagoon	Zigzagoon es el pokemon numero #263	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/263.png	fighting	1	2018-11-16 05:59:01.485939	\N	zigzagoon	Sin Descripcion
2856	1	admin	Ludicolo	Ludicolo es el pokemon numero #272	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/272.png	bug,flying,poison	1	2018-11-16 05:59:01.605932	\N	ludicolo	Sin Descripcion
2866	1	admin	Gardevoir	Gardevoir es el pokemon numero #282	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/282.png	ghost,steel,poison	1	2018-11-16 05:59:01.710829	\N	gardevoir	Sin Descripcion
2877	1	admin	Shedinja	Shedinja es el pokemon numero #292	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/292.png	dark,fire,flying,ghost,rock	1	2018-11-16 05:59:01.85387	\N	shedinja	Sin Descripcion
2887	1	admin	Sableye	Sableye es el pokemon numero #302	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/302.png	fairy	1	2018-11-16 05:59:01.958232	\N	sableye	Sin Descripcion
2896	1	admin	Minun	Minun es el pokemon numero #312	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/312.png	ground	1	2018-11-16 05:59:02.064058	\N	minun	Sin Descripcion
2907	1	admin	Numel	Numel es el pokemon numero #322	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/322.png	water,ground	1	2018-11-16 05:59:02.166594	\N	numel	Sin Descripcion
2915	1	admin	Cacnea	Cacnea es el pokemon numero #331	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/331.png	bug,fire,flying,ice,poison	1	2018-11-16 05:59:02.277037	\N	cacnea	Sin Descripcion
2925	1	admin	Corphish	Corphish es el pokemon numero #341	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/341.png	electric,grass	1	2018-11-16 05:59:02.383158	\N	corphish	Sin Descripcion
2931	1	admin	Feebas	Feebas es el pokemon numero #349	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/349.png	electric,grass	1	2018-11-16 05:59:02.489276	\N	feebas	Sin Descripcion
2941	1	admin	Arceus	Arceus es el pokemon numero #493	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/493.png	fighting	1	2018-11-16 05:59:02.596736	\N	arceus	Sin Descripcion
2949	1	admin	Dewott	Dewott es el pokemon numero #502	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/502.png	grass,electric	1	2018-11-16 05:59:02.701449	\N	dewott	Sin Descripcion
2960	1	admin	Pansage	Pansage es el pokemon numero #511	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/511.png	fire,ice,poison,flying,bug	1	2018-11-16 05:59:02.813327	\N	pansage	Sin Descripcion
2970	1	admin	Unfezant	Unfezant es el pokemon numero #521	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/521.png	electric,ice,rock	1	2018-11-16 05:59:02.92752	\N	unfezant	Sin Descripcion
2978	1	admin	Audino	Audino es el pokemon numero #531	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/531.png	fighting	1	2018-11-16 05:59:03.034714	\N	audino	Sin Descripcion
2987	1	admin	Sawk	Sawk es el pokemon numero #539	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/539.png	flying,psychic,fairy	1	2018-11-16 05:59:03.139987	\N	sawk	Sin Descripcion
2996	1	admin	Lilligant	Lilligant es el pokemon numero #549	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/549.png	fire,ice,poison,flying,bug	1	2018-11-16 05:59:03.245952	\N	lilligant	Sin Descripcion
3006	1	admin	Dwebble	Dwebble es el pokemon numero #557	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/557.png	water,rock,steel	1	2018-11-16 05:59:03.356293	\N	dwebble	Sin Descripcion
2634	1	admin	Diglett	Diglett es el pokemon numero #50	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/050.png	grass,ice,water	1	2018-11-16 05:58:58.820676	\N	diglett	Sin Descripcion
2644	1	admin	Poliwhirl	Poliwhirl es el pokemon numero #61	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/061.png	electric,grass	1	2018-11-16 05:58:58.941229	\N	poliwhirl	Sin Descripcion
2654	1	admin	Victreebel	Victreebel es el pokemon numero #71	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/071.png	fire,flying,ice,psychic	1	2018-11-16 05:58:59.080486	\N	victreebel	Sin Descripcion
2666	1	admin	Magnemite	Magnemite es el pokemon numero #81	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/081.png	ground,fire,fighting	1	2018-11-16 05:58:59.216218	\N	magnemite	Sin Descripcion
2675	1	admin	Cloyster	Cloyster es el pokemon numero #91	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/091.png	electric,fighting,grass,rock	1	2018-11-16 05:58:59.3415	\N	cloyster	Sin Descripcion
2684	1	admin	Voltorb	Voltorb es el pokemon numero #100	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/100.png	ground	1	2018-11-16 05:58:59.461623	\N	voltorb	Sin Descripcion
2694	1	admin	Weezing	Weezing es el pokemon numero #110	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/110.png	psychic	1	2018-11-16 05:58:59.581548	\N	weezing	Sin Descripcion
2705	1	admin	Staryu	Staryu es el pokemon numero #120	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/120.png	electric,grass	1	2018-11-16 05:58:59.70575	\N	staryu	Sin Descripcion
2716	1	admin	Ditto	Ditto es el pokemon numero #132	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/132.png	fighting	1	2018-11-16 05:58:59.856032	\N	ditto	Sin Descripcion
2726	1	admin	Aerodactyl	Aerodactyl es el pokemon numero #142	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/142.png	electric,ice,rock,steel,water	1	2018-11-16 05:58:59.981618	\N	aerodactyl	Sin Descripcion
2737	1	admin	Chikorita	Chikorita es el pokemon numero #152	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/152.png	bug,fire,flying,ice,poison	1	2018-11-16 05:59:00.109387	\N	chikorita	Sin Descripcion
2748	1	admin	Hoothoot	Hoothoot es el pokemon numero #163	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/163.png	electric,ice,rock	1	2018-11-16 05:59:00.237363	\N	hoothoot	Sin Descripcion
2761	1	admin	Igglybuff	Igglybuff es el pokemon numero #174	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/174.png	steel,poison	1	2018-11-16 05:59:00.36804	\N	igglybuff	Sin Descripcion
2770	1	admin	Politoed	Politoed es el pokemon numero #186	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/186.png	electric,grass	1	2018-11-16 05:59:00.491741	\N	politoed	Sin Descripcion
2780	1	admin	Quagsire	Quagsire es el pokemon numero #195	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/195.png	grass	1	2018-11-16 05:59:00.624705	\N	quagsire	Sin Descripcion
2790	1	admin	Dunsparce	Dunsparce es el pokemon numero #206	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/206.png	fighting	1	2018-11-16 05:59:00.755102	\N	dunsparce	Sin Descripcion
2800	1	admin	Teddiursa	Teddiursa es el pokemon numero #216	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/216.png	fighting	1	2018-11-16 05:59:00.890086	\N	teddiursa	Sin Descripcion
2811	1	admin	Skarmory	Skarmory es el pokemon numero #227	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/227.png	electric,fire	1	2018-11-16 05:59:01.012463	\N	skarmory	Sin Descripcion
2822	1	admin	Hitmontop	Hitmontop es el pokemon numero #237	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/237.png	flying,psychic,fairy	1	2018-11-16 05:59:01.132756	\N	hitmontop	Sin Descripcion
2833	1	admin	Lugia	Lugia es el pokemon numero #249	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/249.png	dark,electric,ghost,ice,rock	1	2018-11-16 05:59:01.282229	\N	lugia	Sin Descripcion
2842	1	admin	Mudkip	Mudkip es el pokemon numero #258	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/258.png	electric,grass	1	2018-11-16 05:59:01.402917	\N	mudkip	Sin Descripcion
2851	1	admin	Beautifly	Beautifly es el pokemon numero #267	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/267.png	rock,electric,fire,flying,ice	1	2018-11-16 05:59:01.527265	\N	beautifly	Sin Descripcion
2860	1	admin	Swellow	Swellow es el pokemon numero #277	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/277.png	electric,ice,rock	1	2018-11-16 05:59:01.644561	\N	swellow	Sin Descripcion
2870	1	admin	Breloom	Breloom es el pokemon numero #286	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/286.png	flying,fire,ice,poison,psychic,fairy	1	2018-11-16 05:59:01.764918	\N	breloom	Sin Descripcion
2880	1	admin	Makuhita	Makuhita es el pokemon numero #296	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/296.png	flying,psychic,fairy	1	2018-11-16 05:59:01.887062	\N	makuhita	Sin Descripcion
2890	1	admin	Aggron	Aggron es el pokemon numero #306	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/306.png	fighting,ground,water	1	2018-11-16 05:59:02.005034	\N	aggron	Sin Descripcion
2900	1	admin	Gulpin	Gulpin es el pokemon numero #316	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/316.png	ground,psychic	1	2018-11-16 05:59:02.126381	\N	gulpin	Sin Descripcion
2910	1	admin	Grumpig	Grumpig es el pokemon numero #326	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/326.png	bug,dark,ghost	1	2018-11-16 05:59:02.247767	\N	grumpig	Sin Descripcion
2920	1	admin	Seviper	Seviper es el pokemon numero #336	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/336.png	ground,psychic	1	2018-11-16 05:59:02.367936	\N	seviper	Sin Descripcion
2933	1	admin	Cradily	Cradily es el pokemon numero #346	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/346.png	bug,fighting,ice,steel	1	2018-11-16 05:59:02.490292	\N	cradily	Sin Descripcion
2943	1	admin	Snivy	Snivy es el pokemon numero #495	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/495.png	fire,ice,poison,flying,bug	1	2018-11-16 05:59:02.610301	\N	snivy	Sin Descripcion
2953	1	admin	Watchog	Watchog es el pokemon numero #505	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/505.png	fighting	1	2018-11-16 05:59:02.732312	\N	watchog	Sin Descripcion
2964	1	admin	Panpour	Panpour es el pokemon numero #515	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/515.png	grass,electric	1	2018-11-16 05:59:02.860802	\N	panpour	Sin Descripcion
2974	1	admin	Gigalith	Gigalith es el pokemon numero #526	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/526.png	water,grass,fighting,ground,steel	1	2018-11-16 05:59:02.994964	\N	gigalith	Sin Descripcion
2984	1	admin	Palpitoad	Palpitoad es el pokemon numero #536	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/536.png	grass	1	2018-11-16 05:59:03.114394	\N	palpitoad	Sin Descripcion
2994	1	admin	Cottonee	Cottonee es el pokemon numero #546	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/546.png	fire,ice,poison,flying,steel	1	2018-11-16 05:59:03.231868	\N	cottonee	Sin Descripcion
3004	1	admin	Maractus	Maractus es el pokemon numero #556	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/556.png	fire,ice,poison,flying,bug	1	2018-11-16 05:59:03.35518	\N	maractus	Sin Descripcion
3018	1	admin	Trubbish	Trubbish es el pokemon numero #568	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/568.png	ground,psychic	1	2018-11-16 05:59:03.477007	\N	trubbish	Sin Descripcion
3028	1	admin	Ducklett	Ducklett es el pokemon numero #580	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/580.png	electric,rock	1	2018-11-16 05:59:03.607319	\N	ducklett	Sin Descripcion
3039	1	admin	Escavalier	Escavalier es el pokemon numero #589	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/589.png	fire	1	2018-11-16 05:59:03.746139	\N	escavalier	Sin Descripcion
3048	1	admin	Klang	Klang es el pokemon numero #600	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/600.png	fire,fighting,ground	1	2018-11-16 05:59:03.866038	\N	klang	Sin Descripcion
3057	1	admin	Chandelure	Chandelure es el pokemon numero #609	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/609.png	water,ground,rock,ghost,dark	1	2018-11-16 05:59:03.986303	\N	chandelure	Sin Descripcion
2635	1	admin	Venomoth	Venomoth es el pokemon numero #49	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/049.png	fire,flying,psychic,rock	1	2018-11-16 05:58:58.825191	\N	venomoth	Sin Descripcion
2645	1	admin	Poliwag	Poliwag es el pokemon numero #60	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/060.png	electric,grass	1	2018-11-16 05:58:58.945371	\N	poliwag	Sin Descripcion
2656	1	admin	Weepinbell	Weepinbell es el pokemon numero #70	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/070.png	fire,flying,ice,psychic	1	2018-11-16 05:58:59.085019	\N	weepinbell	Sin Descripcion
2664	1	admin	Slowbro	Slowbro es el pokemon numero #80	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/080.png	bug,dark,electric,ghost,grass	1	2018-11-16 05:58:59.207268	\N	slowbro	Sin Descripcion
2674	1	admin	Muk	Muk es el pokemon numero #89	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/089.png	ground,psychic	1	2018-11-16 05:58:59.326997	\N	muk	Sin Descripcion
2683	1	admin	Krabby	Krabby es el pokemon numero #98	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/098.png	electric,grass	1	2018-11-16 05:58:59.446881	\N	krabby	Sin Descripcion
2693	1	admin	Koffing	Koffing es el pokemon numero #109	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/109.png	psychic	1	2018-11-16 05:58:59.571667	\N	koffing	Sin Descripcion
2703	1	admin	Seaking	Seaking es el pokemon numero #119	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/119.png	electric,grass	1	2018-11-16 05:58:59.689447	\N	seaking	Sin Descripcion
2713	1	admin	Magikarp	Magikarp es el pokemon numero #129	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/129.png	electric,grass	1	2018-11-16 05:58:59.806778	\N	magikarp	Sin Descripcion
2724	1	admin	Omastar	Omastar es el pokemon numero #139	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/139.png	grass,electric,fighting,ground	1	2018-11-16 05:58:59.927883	\N	omastar	Sin Descripcion
2735	1	admin	Mewtwo	Mewtwo es el pokemon numero #150	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/150.png	bug,dark,ghost	1	2018-11-16 05:59:00.046702	\N	mewtwo	Sin Descripcion
2745	1	admin	Feraligatr	Feraligatr es el pokemon numero #160	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/160.png	electric,grass	1	2018-11-16 05:59:00.17448	\N	feraligatr	Sin Descripcion
2754	1	admin	Chinchou	Chinchou es el pokemon numero #170	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/170.png	grass,ground	1	2018-11-16 05:59:00.295657	\N	chinchou	Sin Descripcion
2763	1	admin	Mareep	Mareep es el pokemon numero #179	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/179.png	ground	1	2018-11-16 05:59:00.420448	\N	mareep	Sin Descripcion
2772	1	admin	Skiploom	Skiploom es el pokemon numero #188	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/188.png	ice,fire,flying,poison,rock	1	2018-11-16 05:59:00.542332	\N	skiploom	Sin Descripcion
2782	1	admin	Umbreon	Umbreon es el pokemon numero #197	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/197.png	fighting,bug,fairy	1	2018-11-16 05:59:00.673788	\N	umbreon	Sin Descripcion
2797	1	admin	Steelix	Steelix es el pokemon numero #208	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/208.png	fighting,fire,ground,water	1	2018-11-16 05:59:00.820472	\N	steelix	Sin Descripcion
2808	1	admin	Remoraid	Remoraid es el pokemon numero #223	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/223.png	electric,grass	1	2018-11-16 05:59:00.984913	\N	remoraid	Sin Descripcion
2818	1	admin	Stantler	Stantler es el pokemon numero #234	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/234.png	fighting	1	2018-11-16 05:59:01.10991	\N	stantler	Sin Descripcion
2828	1	admin	Entei	Entei es el pokemon numero #244	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/244.png	ground,rock,water	1	2018-11-16 05:59:01.226617	\N	entei	Sin Descripcion
2837	1	admin	Grovyle	Grovyle es el pokemon numero #253	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/253.png	bug,fire,flying,ice,poison	1	2018-11-16 05:59:01.363279	\N	grovyle	Sin Descripcion
2848	1	admin	Mightyena	Mightyena es el pokemon numero #262	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/262.png	fighting,bug,fairy	1	2018-11-16 05:59:01.499925	\N	mightyena	Sin Descripcion
2858	1	admin	Nuzleaf	Nuzleaf es el pokemon numero #274	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/274.png	bug,fire,fighting,flying,ice,poison,fairy	1	2018-11-16 05:59:01.628588	\N	nuzleaf	Sin Descripcion
2868	1	admin	Masquerain	Masquerain es el pokemon numero #284	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/284.png	rock,electric,fire,flying,ice	1	2018-11-16 05:59:01.745384	\N	masquerain	Sin Descripcion
2879	1	admin	Loudred	Loudred es el pokemon numero #294	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/294.png	fighting	1	2018-11-16 05:59:01.867428	\N	loudred	Sin Descripcion
2889	1	admin	Lairon	Lairon es el pokemon numero #305	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/305.png	fighting,ground,water	1	2018-11-16 05:59:01.985168	\N	lairon	Sin Descripcion
2899	1	admin	Roselia	Roselia es el pokemon numero #315	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/315.png	fire,flying,ice,psychic	1	2018-11-16 05:59:02.10528	\N	roselia	Sin Descripcion
2909	1	admin	Spoink	Spoink es el pokemon numero #325	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/325.png	bug,dark,ghost	1	2018-11-16 05:59:02.223924	\N	spoink	Sin Descripcion
2919	1	admin	Zangoose	Zangoose es el pokemon numero #335	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/335.png	fighting	1	2018-11-16 05:59:02.341688	\N	zangoose	Sin Descripcion
2929	1	admin	Lileep	Lileep es el pokemon numero #345	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/345.png	bug,fighting,ice,steel	1	2018-11-16 05:59:02.472175	\N	lileep	Sin Descripcion
2939	1	admin	Darkrai	Darkrai es el pokemon numero #491	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/491.png	fighting,bug,fairy	1	2018-11-16 05:59:02.591731	\N	darkrai	Sin Descripcion
2952	1	admin	Oshawott	Oshawott es el pokemon numero #501	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/501.png	grass,electric	1	2018-11-16 05:59:02.711716	\N	oshawott	Sin Descripcion
2961	1	admin	Pansear	Pansear es el pokemon numero #513	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/513.png	water,ground,rock	1	2018-11-16 05:59:02.830518	\N	pansear	Sin Descripcion
2972	1	admin	Zebstrika	Zebstrika es el pokemon numero #523	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/523.png	ground	1	2018-11-16 05:59:02.961669	\N	zebstrika	Sin Descripcion
2982	1	admin	Conkeldurr	Conkeldurr es el pokemon numero #534	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/534.png	flying,psychic,fairy	1	2018-11-16 05:59:03.083021	\N	conkeldurr	Sin Descripcion
2992	1	admin	Whirlipede	Whirlipede es el pokemon numero #544	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/544.png	fire,flying,rock,psychic	1	2018-11-16 05:59:03.200861	\N	whirlipede	Sin Descripcion
3003	1	admin	Darumaka	Darumaka es el pokemon numero #554	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/554.png	water,ground,rock	1	2018-11-16 05:59:03.331222	\N	darumaka	Sin Descripcion
3013	1	admin	Tirtouga	Tirtouga es el pokemon numero #564	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/564.png	grass,electric,fighting,ground	1	2018-11-16 05:59:03.451022	\N	tirtouga	Sin Descripcion
3023	1	admin	Gothorita	Gothorita es el pokemon numero #575	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/575.png	bug,ghost,dark	1	2018-11-16 05:59:03.573194	\N	gothorita	Sin Descripcion
3035	1	admin	Deerling	Deerling es el pokemon numero #585	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/585.png	fire,ice,fighting,poison,flying,bug	1	2018-11-16 05:59:03.695431	\N	deerling	Sin Descripcion
3045	1	admin	Galvantula	Galvantula es el pokemon numero #596	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/596.png	fire,rock	1	2018-11-16 05:59:03.821873	\N	galvantula	Sin Descripcion
3054	1	admin	Beheeyem	Beheeyem es el pokemon numero #606	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/606.png	bug,ghost,dark	1	2018-11-16 05:59:03.950582	\N	beheeyem	Sin Descripcion
2636	1	admin	Meowth	Meowth es el pokemon numero #52	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/052.png	fighting	1	2018-11-16 05:58:58.840625	\N	meowth	Sin Descripcion
2646	1	admin	Poliwrath	Poliwrath es el pokemon numero #62	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/062.png	electric,flying,grass,psychic,fairy	1	2018-11-16 05:58:58.970907	\N	poliwrath	Sin Descripcion
2657	1	admin	Tentacool	Tentacool es el pokemon numero #72	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/072.png	electric,ground,psychic	1	2018-11-16 05:58:59.092877	\N	tentacool	Sin Descripcion
2690	1	admin	Hitmonlee	Hitmonlee es el pokemon numero #106	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/106.png	flying,psychic,fairy	1	2018-11-16 05:58:59.549993	\N	hitmonlee	Sin Descripcion
2702	1	admin	Seadra	Seadra es el pokemon numero #117	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/117.png	electric,grass	1	2018-11-16 05:58:59.671754	\N	seadra	Sin Descripcion
2712	1	admin	Tauros	Tauros es el pokemon numero #128	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/128.png	fighting	1	2018-11-16 05:58:59.796018	\N	tauros	Sin Descripcion
2723	1	admin	Omanyte	Omanyte es el pokemon numero #138	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/138.png	grass,electric,fighting,ground	1	2018-11-16 05:58:59.919063	\N	omanyte	Sin Descripcion
2734	1	admin	Dragonite	Dragonite es el pokemon numero #149	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/149.png	ice,dragon,rock,fairy	1	2018-11-16 05:59:00.043139	\N	dragonite	Sin Descripcion
2744	1	admin	Sentret	Sentret es el pokemon numero #161	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/161.png	fighting	1	2018-11-16 05:59:00.171625	\N	sentret	Sin Descripcion
2755	1	admin	Lanturn	Lanturn es el pokemon numero #171	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/171.png	grass,ground	1	2018-11-16 05:59:00.322714	\N	lanturn	Sin Descripcion
2765	1	admin	Flaaffy	Flaaffy es el pokemon numero #180	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/180.png	ground	1	2018-11-16 05:59:00.447141	\N	flaaffy	Sin Descripcion
2774	1	admin	Aipom	Aipom es el pokemon numero #190	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/190.png	fighting	1	2018-11-16 05:59:00.569124	\N	aipom	Sin Descripcion
2787	1	admin	Wobbuffet	Wobbuffet es el pokemon numero #202	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/202.png	bug,dark,ghost	1	2018-11-16 05:59:00.695857	\N	wobbuffet	Sin Descripcion
2798	1	admin	Heracross	Heracross es el pokemon numero #214	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/214.png	flying,fire,psychic,fairy	1	2018-11-16 05:59:00.821339	\N	heracross	Sin Descripcion
2809	1	admin	Octillery	Octillery es el pokemon numero #224	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/224.png	electric,grass	1	2018-11-16 05:59:00.987493	\N	octillery	Sin Descripcion
2819	1	admin	Smeargle	Smeargle es el pokemon numero #235	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/235.png	fighting	1	2018-11-16 05:59:01.110424	\N	smeargle	Sin Descripcion
2831	1	admin	Suicune	Suicune es el pokemon numero #245	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/245.png	electric,grass	1	2018-11-16 05:59:01.236168	\N	suicune	Sin Descripcion
2841	1	admin	Combusken	Combusken es el pokemon numero #256	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/256.png	flying,ground,psychic,water	1	2018-11-16 05:59:01.384861	\N	combusken	Sin Descripcion
2850	1	admin	Silcoon	Silcoon es el pokemon numero #266	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/266.png	fire,flying,rock	1	2018-11-16 05:59:01.515999	\N	silcoon	Sin Descripcion
2861	1	admin	Taillow	Taillow es el pokemon numero #276	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/276.png	electric,ice,rock	1	2018-11-16 05:59:01.646144	\N	taillow	Sin Descripcion
2871	1	admin	Slakoth	Slakoth es el pokemon numero #287	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/287.png	fighting	1	2018-11-16 05:59:01.766471	\N	slakoth	Sin Descripcion
2881	1	admin	Hariyama	Hariyama es el pokemon numero #297	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/297.png	flying,psychic,fairy	1	2018-11-16 05:59:01.888693	\N	hariyama	Sin Descripcion
2891	1	admin	Meditite	Meditite es el pokemon numero #307	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/307.png	flying,ghost,fairy	1	2018-11-16 05:59:02.008977	\N	meditite	Sin Descripcion
2901	1	admin	Swalot	Swalot es el pokemon numero #317	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/317.png	ground,psychic	1	2018-11-16 05:59:02.127975	\N	swalot	Sin Descripcion
2911	1	admin	Spinda	Spinda es el pokemon numero #327	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/327.png	fighting	1	2018-11-16 05:59:02.249372	\N	spinda	Sin Descripcion
2921	1	admin	Lunatone	Lunatone es el pokemon numero #337	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/337.png	bug,dark,ghost,grass,steel,water	1	2018-11-16 05:59:02.369528	\N	lunatone	Sin Descripcion
2934	1	admin	Armaldo	Armaldo es el pokemon numero #348	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/348.png	rock,steel,water	1	2018-11-16 05:59:02.491866	\N	armaldo	Sin Descripcion
2944	1	admin	Servine	Servine es el pokemon numero #496	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/496.png	fire,ice,poison,flying,bug	1	2018-11-16 05:59:02.612273	\N	servine	Sin Descripcion
2954	1	admin	Lillipup	Lillipup es el pokemon numero #506	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/506.png	fighting	1	2018-11-16 05:59:02.733943	\N	lillipup	Sin Descripcion
2965	1	admin	Munna	Munna es el pokemon numero #517	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/517.png	bug,ghost,dark	1	2018-11-16 05:59:02.86245	\N	munna	Sin Descripcion
2975	1	admin	Woobat	Woobat es el pokemon numero #527	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/527.png	electric,ice,rock,ghost,dark	1	2018-11-16 05:59:02.996574	\N	woobat	Sin Descripcion
2985	1	admin	Seismitoad	Seismitoad es el pokemon numero #537	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/537.png	grass	1	2018-11-16 05:59:03.122703	\N	seismitoad	Sin Descripcion
2995	1	admin	Whimsicott	Whimsicott es el pokemon numero #547	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/547.png	fire,ice,poison,flying,steel	1	2018-11-16 05:59:03.242455	\N	whimsicott	Sin Descripcion
3009	1	admin	Scraggy	Scraggy es el pokemon numero #559	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/559.png	fighting,flying,fairy	1	2018-11-16 05:59:03.366702	\N	scraggy	Sin Descripcion
3020	1	admin	Zoroark	Zoroark es el pokemon numero #571	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/571.png	fighting,bug,fairy	1	2018-11-16 05:59:03.497555	\N	zoroark	Sin Descripcion
3031	1	admin	Vanillite	Vanillite es el pokemon numero #582	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/582.png	fire,fighting,rock,steel	1	2018-11-16 05:59:03.622886	\N	vanillite	Sin Descripcion
3040	1	admin	Amoonguss	Amoonguss es el pokemon numero #591	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/591.png	fire,ice,flying,psychic	1	2018-11-16 05:59:03.75178	\N	amoonguss	Sin Descripcion
3049	1	admin	Klinklang	Klinklang es el pokemon numero #601	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/601.png	fire,fighting,ground	1	2018-11-16 05:59:03.877219	\N	klinklang	Sin Descripcion
3058	1	admin	Axew	Axew es el pokemon numero #610	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/610.png	ice,dragon,fairy	1	2018-11-16 05:59:03.998176	\N	axew	Sin Descripcion
3071	1	admin	Golett	Golett es el pokemon numero #622	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/622.png	water,grass,ice,ghost,dark	1	2018-11-16 05:59:04.135603	\N	golett	Sin Descripcion
3082	1	admin	Deino	Deino es el pokemon numero #633	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/633.png	ice,fighting,bug,dragon,fairy	1	2018-11-16 05:59:04.260944	\N	deino	Sin Descripcion
3092	1	admin	Zekrom	Zekrom es el pokemon numero #644	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/644.png	ice,ground,dragon,fairy	1	2018-11-16 05:59:04.38148	\N	zekrom	Sin Descripcion
2638	1	admin	Psyduck	Psyduck es el pokemon numero #54	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/054.png	electric,grass	1	2018-11-16 05:58:58.900803	\N	psyduck	Sin Descripcion
2648	1	admin	Kadabra	Kadabra es el pokemon numero #64	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/064.png	bug,dark,ghost	1	2018-11-16 05:58:59.036894	\N	kadabra	Sin Descripcion
2660	1	admin	Geodude	Geodude es el pokemon numero #74	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/074.png	grass,water,fighting,ground,ice,steel	1	2018-11-16 05:58:59.158263	\N	geodude	Sin Descripcion
2671	1	admin	Dodrio	Dodrio es el pokemon numero #85	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/085.png	electric,ice,rock	1	2018-11-16 05:58:59.29811	\N	dodrio	Sin Descripcion
2678	1	admin	Gengar	Gengar es el pokemon numero #94	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/094.png	dark,ghost,psychic	1	2018-11-16 05:58:59.406597	\N	gengar	Sin Descripcion
2688	1	admin	Exeggutor	Exeggutor es el pokemon numero #103	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/103.png	bug,dark,fire,flying,ghost,ice,poison	1	2018-11-16 05:58:59.520855	\N	exeggutor	Sin Descripcion
2697	1	admin	Chansey	Chansey es el pokemon numero #113	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/113.png	fighting	1	2018-11-16 05:58:59.631676	\N	chansey	Sin Descripcion
2707	1	admin	Scyther	Scyther es el pokemon numero #123	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/123.png	rock,electric,fire,flying,ice	1	2018-11-16 05:58:59.751354	\N	scyther	Sin Descripcion
2718	1	admin	Eevee	Eevee es el pokemon numero #133	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/133.png	fighting	1	2018-11-16 05:58:59.866945	\N	eevee	Sin Descripcion
2728	1	admin	Snorlax	Snorlax es el pokemon numero #143	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/143.png	fighting	1	2018-11-16 05:58:59.996211	\N	snorlax	Sin Descripcion
2736	1	admin	Bayleef	Bayleef es el pokemon numero #153	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/153.png	bug,fire,flying,ice,poison	1	2018-11-16 05:59:00.10856	\N	bayleef	Sin Descripcion
2746	1	admin	Furret	Furret es el pokemon numero #162	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/162.png	fighting	1	2018-11-16 05:59:00.222944	\N	furret	Sin Descripcion
2756	1	admin	Pichu	Pichu es el pokemon numero #172	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/172.png	ground	1	2018-11-16 05:59:00.331709	\N	pichu	Sin Descripcion
2764	1	admin	Ampharos	Ampharos es el pokemon numero #181	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/181.png	ground	1	2018-11-16 05:59:00.443035	\N	ampharos	Sin Descripcion
2773	1	admin	Jumpluff	Jumpluff es el pokemon numero #189	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/189.png	ice,fire,flying,poison,rock	1	2018-11-16 05:59:00.554974	\N	jumpluff	Sin Descripcion
2781	1	admin	Murkrow	Murkrow es el pokemon numero #198	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/198.png	electric,ice,rock,fairy	1	2018-11-16 05:59:00.664691	\N	murkrow	Sin Descripcion
2791	1	admin	Gligar	Gligar es el pokemon numero #207	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/207.png	ice,water	1	2018-11-16 05:59:00.774516	\N	gligar	Sin Descripcion
2801	1	admin	Ursaring	Ursaring es el pokemon numero #217	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/217.png	fighting	1	2018-11-16 05:59:00.892463	\N	ursaring	Sin Descripcion
2810	1	admin	Mantine	Mantine es el pokemon numero #226	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/226.png	electric,rock	1	2018-11-16 05:59:01.001324	\N	mantine	Sin Descripcion
2820	1	admin	Tyrogue	Tyrogue es el pokemon numero #236	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/236.png	flying,psychic,fairy	1	2018-11-16 05:59:01.11587	\N	tyrogue	Sin Descripcion
2829	1	admin	Larvitar	Larvitar es el pokemon numero #246	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/246.png	grass,water,fighting,ground,ice,steel	1	2018-11-16 05:59:01.230025	\N	larvitar	Sin Descripcion
2840	1	admin	Sceptile	Sceptile es el pokemon numero #254	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/254.png	bug,fire,flying,ice,poison	1	2018-11-16 05:59:01.378661	\N	sceptile	Sin Descripcion
2849	1	admin	Wurmple	Wurmple es el pokemon numero #265	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/265.png	fire,flying,rock	1	2018-11-16 05:59:01.50981	\N	wurmple	Sin Descripcion
2859	1	admin	Shiftry	Shiftry es el pokemon numero #275	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/275.png	bug,fire,fighting,flying,ice,poison,fairy	1	2018-11-16 05:59:01.634795	\N	shiftry	Sin Descripcion
2869	1	admin	Shroomish	Shroomish es el pokemon numero #285	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/285.png	bug,fire,flying,ice,poison	1	2018-11-16 05:59:01.746135	\N	shroomish	Sin Descripcion
2878	1	admin	Exploud	Exploud es el pokemon numero #295	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/295.png	fighting	1	2018-11-16 05:59:01.858348	\N	exploud	Sin Descripcion
2888	1	admin	Aron	Aron es el pokemon numero #304	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/304.png	fighting,ground,water	1	2018-11-16 05:59:01.970655	\N	aron	Sin Descripcion
2898	1	admin	Illumise	Illumise es el pokemon numero #314	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/314.png	fire,flying,rock	1	2018-11-16 05:59:02.081489	\N	illumise	Sin Descripcion
2908	1	admin	Torkoal	Torkoal es el pokemon numero #324	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/324.png	ground,rock,water	1	2018-11-16 05:59:02.191592	\N	torkoal	Sin Descripcion
2918	1	admin	Altaria	Altaria es el pokemon numero #334	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/334.png	ice,dragon,rock,fairy	1	2018-11-16 05:59:02.322932	\N	altaria	Sin Descripcion
2928	1	admin	Claydol	Claydol es el pokemon numero #344	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/344.png	bug,dark,ghost,grass,water,ice	1	2018-11-16 05:59:02.433544	\N	claydol	Sin Descripcion
2938	1	admin	Manaphy	Manaphy es el pokemon numero #490	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/490.png	electric,grass	1	2018-11-16 05:59:02.545499	\N	manaphy	Sin Descripcion
2948	1	admin	Emboar	Emboar es el pokemon numero #500	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/500.png	water,ground,flying,psychic	1	2018-11-16 05:59:02.659783	\N	emboar	Sin Descripcion
2958	1	admin	Liepard	Liepard es el pokemon numero #510	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/510.png	fighting,bug,fairy	1	2018-11-16 05:59:02.78291	\N	liepard	Sin Descripcion
2968	1	admin	Pidove	Pidove es el pokemon numero #519	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/519.png	electric,ice,rock	1	2018-11-16 05:59:02.918751	\N	pidove	Sin Descripcion
2979	1	admin	Drilbur	Drilbur es el pokemon numero #529	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/529.png	water,grass,ice	1	2018-11-16 05:59:03.035026	\N	drilbur	Sin Descripcion
2989	1	admin	Sewaddle	Sewaddle es el pokemon numero #540	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/540.png	fire,flying,ice,poison,bug,rock	1	2018-11-16 05:59:03.144909	\N	sewaddle	Sin Descripcion
2999	1	admin	Sandile	Sandile es el pokemon numero #551	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/551.png	water,grass,ice,fighting,bug,fairy	1	2018-11-16 05:59:03.251773	\N	sandile	Sin Descripcion
3008	1	admin	Sigilyph	Sigilyph es el pokemon numero #561	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/561.png	electric,ice,rock,ghost,dark	1	2018-11-16 05:59:03.362906	\N	sigilyph	Sin Descripcion
3017	1	admin	Garbodor	Garbodor es el pokemon numero #569	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/569.png	ground,psychic	1	2018-11-16 05:59:03.472858	\N	garbodor	Sin Descripcion
3026	1	admin	Duosion	Duosion es el pokemon numero #578	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/578.png	bug,ghost,dark	1	2018-11-16 05:59:03.588023	\N	duosion	Sin Descripcion
3036	1	admin	Karrablast	Karrablast es el pokemon numero #588	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/588.png	fire,flying,rock	1	2018-11-16 05:59:03.69983	\N	karrablast	Sin Descripcion
3005	1	admin	Crustle	Crustle es el pokemon numero #558	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/558.png	water,rock,steel	1	2018-11-16 05:59:03.355925	\N	crustle	Sin Descripcion
3015	1	admin	Archeops	Archeops es el pokemon numero #567	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/567.png	water,electric,ice,rock,steel	1	2018-11-16 05:59:03.462586	\N	archeops	Sin Descripcion
3024	1	admin	Solosis 	Solosis  es el pokemon numero #577	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/577.png	bug,ghost,dark	1	2018-11-16 05:59:03.573747	\N	solosis	Sin Descripcion
3033	1	admin	Emolga	Emolga es el pokemon numero #587	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/587.png	ice,rock	1	2018-11-16 05:59:03.681385	\N	emolga	Sin Descripcion
3043	1	admin	Joltik	Joltik es el pokemon numero #595	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/595.png	fire,rock	1	2018-11-16 05:59:03.786108	\N	joltik	Sin Descripcion
3051	1	admin	Eelektross	Eelektross es el pokemon numero #604	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/604.png		1	2018-11-16 05:59:03.892712	\N	eelektross	Sin Descripcion
3059	1	admin	Haxorus	Haxorus es el pokemon numero #612	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/612.png	ice,dragon,fairy	1	2018-11-16 05:59:03.999233	\N	haxorus	Sin Descripcion
3069	1	admin	Druddigon	Druddigon es el pokemon numero #621	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/621.png	ice,dragon,fairy	1	2018-11-16 05:59:04.124419	\N	druddigon	Sin Descripcion
3078	1	admin	Bouffalant	Bouffalant es el pokemon numero #626	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/626.png	fighting	1	2018-11-16 05:59:04.23145	\N	bouffalant	Sin Descripcion
3085	1	admin	Virizion	Virizion es el pokemon numero #640	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/640.png	flying,fire,ice,poison,psychic,fairy	1	2018-11-16 05:59:04.335863	\N	virizion	Sin Descripcion
3096	1	admin	Meloetta	Meloetta es el pokemon numero #648	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/648.png	bug,dark	1	2018-11-16 05:59:04.450186	\N	meloetta	Sin Descripcion
3106	1	admin	Greninja	Greninja es el pokemon numero #658	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/658.png	fairy,grass,electric,fighting,bug	1	2018-11-16 05:59:04.55971	\N	greninja	Sin Descripcion
3115	1	admin	Pyroar	Pyroar es el pokemon numero #668	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/668.png	water,rock,fighting,ground	1	2018-11-16 05:59:04.662056	\N	pyroar	Sin Descripcion
3134	1	admin	Inkay	Inkay es el pokemon numero #686	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/686.png	fairy,bug	1	2018-11-16 05:59:04.872052	\N	inkay	Sin Descripcion
3143	1	admin	Noibat	Noibat es el pokemon numero #714	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/714.png	ice,rock,fairy,dragon	1	2018-11-16 05:59:04.978238	\N	noibat	Sin Descripcion
3150	1	admin	Lycanroc	Lycanroc es el pokemon numero #745	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/745.png	water,steel,grass,fighting,ground	1	2018-11-16 05:59:05.110797	\N	lycanroc	Sin Descripcion
3159	1	admin	Pyukumuku	Pyukumuku es el pokemon numero #771	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/771.png	grass,electric	1	2018-11-16 05:59:05.217022	\N	pyukumuku	Sin Descripcion
3168	1	admin	Phione	Phione es el pokemon numero #489	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/489.png	electric,grass	1	2018-11-16 05:59:05.325365	\N	phione	Sin Descripcion
3177	1	admin	Uxie	Uxie es el pokemon numero #480	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/480.png	bug,dark,ghost	1	2018-11-16 05:59:05.432877	\N	uxie	Sin Descripcion
3186	1	admin	Glaceon	Glaceon es el pokemon numero #471	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/471.png	fire,fighting,rock,steel	1	2018-11-16 05:59:05.538925	\N	glaceon	Sin Descripcion
3196	1	admin	Weavile	Weavile es el pokemon numero #461	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/461.png	fighting,bug,fire,rock,steel,fairy	1	2018-11-16 05:59:05.645636	\N	weavile	Sin Descripcion
3205	1	admin	Drapion	Drapion es el pokemon numero #452	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/452.png	ground	1	2018-11-16 05:59:05.753101	\N	drapion	Sin Descripcion
3215	1	admin	Spiritomb	Spiritomb es el pokemon numero #442	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/442.png	fairy	1	2018-11-16 05:59:05.869546	\N	spiritomb	Sin Descripcion
3224	1	admin	Stunky	Stunky es el pokemon numero #434	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/434.png	ground	1	2018-11-16 05:59:05.97942	\N	stunky	Sin Descripcion
3233	1	admin	Ambipom	Ambipom es el pokemon numero #424	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/424.png	fighting	1	2018-11-16 05:59:06.095829	\N	ambipom	Sin Descripcion
3243	1	admin	Combee	Combee es el pokemon numero #415	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/415.png	rock,electric,fire,flying,ice	1	2018-11-16 05:59:06.216892	\N	combee	Sin Descripcion
3251	1	admin	Budew	Budew es el pokemon numero #406	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/406.png	fire,flying,ice,psychic	1	2018-11-16 05:59:06.321497	\N	budew	Sin Descripcion
3259	1	admin	Bidoof	Bidoof es el pokemon numero #399	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/399.png	fighting	1	2018-11-16 05:59:06.452441	\N	bidoof	Sin Descripcion
3269	1	admin	Torterra	Torterra es el pokemon numero #389	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/389.png	ice,bug,fire,flying	1	2018-11-16 05:59:06.557304	\N	torterra	Sin Descripcion
3278	1	admin	Registeel	Registeel es el pokemon numero #379	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/379.png	fighting,fire,ground	1	2018-11-16 05:59:06.662537	\N	registeel	Sin Descripcion
3288	1	admin	Luvdisc	Luvdisc es el pokemon numero #370	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/370.png	electric,grass	1	2018-11-16 05:59:06.78349	\N	luvdisc	Sin Descripcion
3298	1	admin	Wynaut	Wynaut es el pokemon numero #360	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/360.png	bug,dark,ghost	1	2018-11-16 05:59:06.887888	\N	wynaut	Sin Descripcion
3308	1	admin	Poipole	Poipole es el pokemon numero #803	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/803.png	psychic,ground	1	2018-11-16 05:59:06.997742	\N	poipole	Sin Descripcion
3317	1	admin	Cosmoem	Cosmoem es el pokemon numero #790	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/790.png	ghost,dark,bug	1	2018-11-16 05:59:07.101656	\N	cosmoem	Sin Descripcion
3326	1	admin	Togedemaru	Togedemaru es el pokemon numero #777	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/777.png	fire,fighting,ground	1	2018-11-16 05:59:07.211386	\N	togedemaru	Sin Descripcion
3336	1	admin	Oranguru	Oranguru es el pokemon numero #765	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/765.png	dark,bug	1	2018-11-16 05:59:07.320363	\N	oranguru	Sin Descripcion
3345	1	admin	Dewpider	Dewpider es el pokemon numero #751	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/751.png	flying,electric,rock	1	2018-11-16 05:59:07.422777	\N	dewpider	Sin Descripcion
3353	1	admin	Crabrawler	Crabrawler es el pokemon numero #739	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/739.png	psychic,flying,fairy	1	2018-11-16 05:59:07.528909	\N	crabrawler	Sin Descripcion
3361	1	admin	Popplio	Popplio es el pokemon numero #728	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/728.png	grass,electric	1	2018-11-16 05:59:07.638646	\N	popplio	Sin Descripcion
3370	1	admin	Diancie	Diancie es el pokemon numero #719	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/719.png	steel,water,grass,ground	1	2018-11-16 05:59:07.744604	\N	diancie	Sin Descripcion
3379	1	admin	Klefki	Klefki es el pokemon numero #707	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/707.png	fire,ground	1	2018-11-16 05:59:07.848078	\N	klefki	Sin Descripcion
3389	1	admin	Clawitzer	Clawitzer es el pokemon numero #693	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/693.png	grass,electric	1	2018-11-16 05:59:07.965825	\N	clawitzer	Sin Descripcion
3014	1	admin	Archen	Archen es el pokemon numero #566	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/566.png	water,electric,ice,rock,steel	1	2018-11-16 05:59:03.461084	\N	archen	Sin Descripcion
3025	1	admin	Gothitelle	Gothitelle es el pokemon numero #576	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/576.png	bug,ghost,dark	1	2018-11-16 05:59:03.574105	\N	gothitelle	Sin Descripcion
3034	1	admin	Sawsbuck	Sawsbuck es el pokemon numero #586	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/586.png	fire,ice,fighting,poison,flying,bug	1	2018-11-16 05:59:03.681868	\N	sawsbuck	Sin Descripcion
3042	1	admin	Alomomola	Alomomola es el pokemon numero #594	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/594.png	grass,electric	1	2018-11-16 05:59:03.785576	\N	alomomola	Sin Descripcion
3052	1	admin	Eelektrik	Eelektrik es el pokemon numero #603	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/603.png		1	2018-11-16 05:59:03.893252	\N	eelektrik	Sin Descripcion
3060	1	admin	Fraxure	Fraxure es el pokemon numero #611	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/611.png	ice,dragon,fairy	1	2018-11-16 05:59:03.999564	\N	fraxure	Sin Descripcion
3067	1	admin	Mienshao	Mienshao es el pokemon numero #620	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/620.png	flying,psychic,fairy	1	2018-11-16 05:59:04.110611	\N	mienshao	Sin Descripcion
3077	1	admin	Rufflet	Rufflet es el pokemon numero #627	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/627.png	electric,ice,rock	1	2018-11-16 05:59:04.223751	\N	rufflet	Sin Descripcion
3086	1	admin	Cobalion	Cobalion es el pokemon numero #638	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/638.png	fire,fighting,ground	1	2018-11-16 05:59:04.336361	\N	cobalion	Sin Descripcion
3095	1	admin	Keldeo	Keldeo es el pokemon numero #647	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/647.png	flying,grass,electric,fairy,psychic	1	2018-11-16 05:59:04.44032	\N	keldeo	Sin Descripcion
3104	1	admin	Frogadier	Frogadier es el pokemon numero #657	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/657.png	grass,electric	1	2018-11-16 05:59:04.544857	\N	frogadier	Sin Descripcion
3114	1	admin	Vivillon	Vivillon es el pokemon numero #666	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/666.png	fire,flying,electric,ice,rock	1	2018-11-16 05:59:04.647192	\N	vivillon	Sin Descripcion
3123	1	admin	Furfrou	Furfrou es el pokemon numero #676	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/676.png	fighting	1	2018-11-16 05:59:04.751791	\N	furfrou	Sin Descripcion
3132	1	admin	Slurpuff	Slurpuff es el pokemon numero #685	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/685.png	steel,poison	1	2018-11-16 05:59:04.855629	\N	slurpuff	Sin Descripcion
3142	1	admin	Goodra	Goodra es el pokemon numero #706	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/706.png	fairy,ice,dragon	1	2018-11-16 05:59:04.965848	\N	goodra	Sin Descripcion
3149	1	admin	Oricorio	Oricorio es el pokemon numero #741	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/741.png	water,electric,rock	1	2018-11-16 05:59:05.11025	\N	oricorio	Sin Descripcion
3158	1	admin	Wimpod	Wimpod es el pokemon numero #767	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/767.png	flying,electric,rock	1	2018-11-16 05:59:05.216582	\N	wimpod	Sin Descripcion
3167	1	admin	Blacephalon	Blacephalon es el pokemon numero #806	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/806.png	water,ghost,ground,dark,rock	1	2018-11-16 05:59:05.324844	\N	blacephalon	Sin Descripcion
3178	1	admin	Mesprit	Mesprit es el pokemon numero #481	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/481.png	bug,dark,ghost	1	2018-11-16 05:59:05.433387	\N	mesprit	Sin Descripcion
3187	1	admin	Gliscor	Gliscor es el pokemon numero #472	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/472.png	ice,water	1	2018-11-16 05:59:05.539425	\N	gliscor	Sin Descripcion
3197	1	admin	Magnezone	Magnezone es el pokemon numero #462	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/462.png	ground,fire,fighting	1	2018-11-16 05:59:05.646061	\N	magnezone	Sin Descripcion
3206	1	admin	Croagunk	Croagunk es el pokemon numero #453	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/453.png	psychic,flying,ground	1	2018-11-16 05:59:05.753585	\N	croagunk	Sin Descripcion
3213	1	admin	Gible	Gible es el pokemon numero #443	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/443.png	ice,dragon,fairy	1	2018-11-16 05:59:05.85991	\N	gible	Sin Descripcion
3221	1	admin	Skuntank	Skuntank es el pokemon numero #435	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/435.png	ground	1	2018-11-16 05:59:05.966213	\N	skuntank	Sin Descripcion
3229	1	admin	Mismagius	Mismagius es el pokemon numero #429	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/429.png	dark,ghost	1	2018-11-16 05:59:06.070767	\N	mismagius	Sin Descripcion
3239	1	admin	Floatzel	Floatzel es el pokemon numero #419	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/419.png	electric,grass	1	2018-11-16 05:59:06.181225	\N	floatzel	Sin Descripcion
3248	1	admin	Shieldon	Shieldon es el pokemon numero #410	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/410.png	fighting,ground,water	1	2018-11-16 05:59:06.28557	\N	shieldon	Sin Descripcion
3257	1	admin	Kricketot	Kricketot es el pokemon numero #401	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/401.png	fire,flying,rock	1	2018-11-16 05:59:06.391261	\N	kricketot	Sin Descripcion
3266	1	admin	Infernape	Infernape es el pokemon numero #392	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/392.png	flying,ground,psychic,water	1	2018-11-16 05:59:06.501588	\N	infernape	Sin Descripcion
3275	1	admin	Groudon	Groudon es el pokemon numero #383	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/383.png	grass,ice,water	1	2018-11-16 05:59:06.610616	\N	groudon	Sin Descripcion
3284	1	admin	Salamence	Salamence es el pokemon numero #373	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/373.png	ice,dragon,rock,fairy	1	2018-11-16 05:59:06.721734	\N	salamence	Sin Descripcion
3294	1	admin	Sealeo	Sealeo es el pokemon numero #364	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/364.png	electric,fighting,grass,rock	1	2018-11-16 05:59:06.828491	\N	sealeo	Sin Descripcion
3301	1	admin	Dusclops	Dusclops es el pokemon numero #356	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/356.png	dark,ghost	1	2018-11-16 05:59:06.932432	\N	dusclops	Sin Descripcion
3309	1	admin	Guzzlord	Guzzlord es el pokemon numero #799	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/799.png	fairy,fighting,bug,ice,dragon	1	2018-11-16 05:59:07.034971	\N	guzzlord	Sin Descripcion
3319	1	admin	Tapu Fini	Tapu Fini es el pokemon numero #788	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/788.png	grass,electric,poison	1	2018-11-16 05:59:07.144542	\N	tapu fini	Sin Descripcion
3329	1	admin	Minior	Minior es el pokemon numero #774	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/774.png	steel,water,electric,ice,rock	1	2018-11-16 05:59:07.24774	\N	minior	Sin Descripcion
3338	1	admin	Bounsweet	Bounsweet es el pokemon numero #761	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/761.png	fire,flying,ice,poison,bug	1	2018-11-16 05:59:07.367838	\N	bounsweet	Sin Descripcion
3348	1	admin	Toxapex	Toxapex es el pokemon numero #748	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/748.png	psychic,electric,ground	1	2018-11-16 05:59:07.485596	\N	toxapex	Sin Descripcion
3358	1	admin	Gumshoos	Gumshoos es el pokemon numero #735	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/735.png	fighting	1	2018-11-16 05:59:07.588888	\N	gumshoos	Sin Descripcion
3367	1	admin	Rowlet	Rowlet es el pokemon numero #722	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/722.png	fire,flying,ice,poison,rock	1	2018-11-16 05:59:07.692369	\N	rowlet	Sin Descripcion
3377	1	admin	Trevenant	Trevenant es el pokemon numero #709	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/709.png	ghost,fire,flying,dark,ice	1	2018-11-16 05:59:07.796942	\N	trevenant	Sin Descripcion
3387	1	admin	Tyrunt	Tyrunt es el pokemon numero #696	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/696.png	steel,ice,dragon,fighting,fairy,ground	1	2018-11-16 05:59:07.902013	\N	tyrunt	Sin Descripcion
3029	1	admin	Vanillish	Vanillish es el pokemon numero #583	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/583.png	fire,fighting,rock,steel	1	2018-11-16 05:59:03.613758	\N	vanillish	Sin Descripcion
3037	1	admin	Foongus	Foongus es el pokemon numero #590	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/590.png	fire,ice,flying,psychic	1	2018-11-16 05:59:03.738308	\N	foongus	Sin Descripcion
3046	1	admin	Ferrothorn	Ferrothorn es el pokemon numero #598	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/598.png	fire,fighting	1	2018-11-16 05:59:03.849482	\N	ferrothorn	Sin Descripcion
3055	1	admin	Litwick	Litwick es el pokemon numero #607	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/607.png	water,ground,rock,ghost,dark	1	2018-11-16 05:59:03.960597	\N	litwick	Sin Descripcion
3064	1	admin	Accelgor	Accelgor es el pokemon numero #617	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/617.png	fire,flying,rock	1	2018-11-16 05:59:04.071876	\N	accelgor	Sin Descripcion
3074	1	admin	Mandibuzz	Mandibuzz es el pokemon numero #630	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/630.png	electric,ice,rock,fairy	1	2018-11-16 05:59:04.184797	\N	mandibuzz	Sin Descripcion
3084	1	admin	Larvesta	Larvesta es el pokemon numero #636	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/636.png	rock,water,flying	1	2018-11-16 05:59:04.295959	\N	larvesta	Sin Descripcion
3094	1	admin	Kyurem	Kyurem es el pokemon numero #646	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/646.png	fighting,rock,dragon,steel,fairy	1	2018-11-16 05:59:04.43249	\N	kyurem	Sin Descripcion
3105	1	admin	Froakie	Froakie es el pokemon numero #656	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/656.png	grass,electric	1	2018-11-16 05:59:04.546791	\N	froakie	Sin Descripcion
3116	1	admin	Litleo	Litleo es el pokemon numero #667	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/667.png	rock,water,fighting,ground	1	2018-11-16 05:59:04.662593	\N	litleo	Sin Descripcion
3126	1	admin	Meowstic	Meowstic es el pokemon numero #678	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/678.png	ghost,dark,bug	1	2018-11-16 05:59:04.772849	\N	meowstic	Sin Descripcion
3136	1	admin	Binacle	Binacle es el pokemon numero #688	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/688.png	electric,fighting,grass,ground	1	2018-11-16 05:59:04.893414	\N	binacle	Sin Descripcion
3166	1	admin	Kartana	Kartana es el pokemon numero #798	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/798.png	fire,fighting	1	2018-11-16 05:59:05.316321	\N	kartana	Sin Descripcion
3176	1	admin	Azelf	Azelf es el pokemon numero #482	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/482.png	bug,dark,ghost	1	2018-11-16 05:59:05.431949	\N	azelf	Sin Descripcion
3188	1	admin	Leafeon	Leafeon es el pokemon numero #470	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/470.png	bug,fire,flying,ice,poison	1	2018-11-16 05:59:05.540931	\N	leafeon	Sin Descripcion
3198	1	admin	Abomasnow	Abomasnow es el pokemon numero #460	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/460.png	fire,bug,fighting,flying,poison,rock,steel	1	2018-11-16 05:59:05.652564	\N	abomasnow	Sin Descripcion
3208	1	admin	Hippowdon	Hippowdon es el pokemon numero #450	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/450.png	grass,ice,water	1	2018-11-16 05:59:05.763185	\N	hippowdon	Sin Descripcion
3217	1	admin	Happiny	Happiny es el pokemon numero #440	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/440.png	fighting	1	2018-11-16 05:59:05.875629	\N	happiny	Sin Descripcion
3227	1	admin	Glameow	Glameow es el pokemon numero #431	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/431.png	fighting	1	2018-11-16 05:59:05.9932	\N	glameow	Sin Descripcion
3234	1	admin	Shellos	Shellos es el pokemon numero #422	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/422.png	electric,grass	1	2018-11-16 05:59:06.107894	\N	shellos	Sin Descripcion
3244	1	admin	Wormadam	Wormadam es el pokemon numero #413	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/413.png	fire,flying,ice,poison,bug,rock	1	2018-11-16 05:59:06.242679	\N	wormadam	Sin Descripcion
3253	1	admin	Luxray	Luxray es el pokemon numero #405	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/405.png	ground	1	2018-11-16 05:59:06.36106	\N	luxray	Sin Descripcion
3262	1	admin	Starly	Starly es el pokemon numero #396	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/396.png	electric,ice,rock	1	2018-11-16 05:59:06.47474	\N	starly	Sin Descripcion
3271	1	admin	Deoxys	Deoxys es el pokemon numero #386	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/386.png	bug,dark,ghost	1	2018-11-16 05:59:06.585331	\N	deoxys	Sin Descripcion
3281	1	admin	Regirock	Regirock es el pokemon numero #377	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/377.png	fighting,grass,ground,steel,water	1	2018-11-16 05:59:06.694602	\N	regirock	Sin Descripcion
3291	1	admin	Huntail	Huntail es el pokemon numero #367	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/367.png	electric,grass	1	2018-11-16 05:59:06.82079	\N	huntail	Sin Descripcion
3302	1	admin	Tropius	Tropius es el pokemon numero #357	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/357.png	ice,fire,flying,poison,rock	1	2018-11-16 05:59:06.934409	\N	tropius	Sin Descripcion
3312	1	admin	Celesteela	Celesteela es el pokemon numero #797	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/797.png	fire,electric	1	2018-11-16 05:59:07.045175	\N	celesteela	Sin Descripcion
3321	1	admin	Kommo-o	Kommo-o es el pokemon numero #784	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/784.png	fairy,flying,psychic,ice,dragon	1	2018-11-16 05:59:07.158998	\N	kommo-o	Sin Descripcion
3330	1	admin	Type: Null	Type: Null es el pokemon numero #772	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/772.png	fighting	1	2018-11-16 05:59:07.288862	\N	type: null	Sin Descripcion
3341	1	admin	Stufful	Stufful es el pokemon numero #759	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/759.png	psychic,flying,fairy,fighting	1	2018-11-16 05:59:07.405932	\N	stufful	Sin Descripcion
3350	1	admin	Rockruff	Rockruff es el pokemon numero #744	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/744.png	water,steel,grass,fighting,ground	1	2018-11-16 05:59:07.516379	\N	rockruff	Sin Descripcion
3359	1	admin	Trumbeak	Trumbeak es el pokemon numero #732	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/732.png	electric,ice,rock	1	2018-11-16 05:59:07.631989	\N	trumbeak	Sin Descripcion
3369	1	admin	Hoopa	Hoopa es el pokemon numero #720	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/720.png	ghost,dark	1	2018-11-16 05:59:07.743909	\N	hoopa	Sin Descripcion
3380	1	admin	Sliggoo	Sliggoo es el pokemon numero #705	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/705.png	fairy,ice,dragon	1	2018-11-16 05:59:07.853944	\N	sliggoo	Sin Descripcion
3390	1	admin	Clauncher	Clauncher es el pokemon numero #692	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/692.png	grass,electric	1	2018-11-16 05:59:07.973925	\N	clauncher	Sin Descripcion
3044	1	admin	Ferroseed	Ferroseed es el pokemon numero #597	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/597.png	fire,fighting	1	2018-11-16 05:59:03.820593	\N	ferroseed	Sin Descripcion
3053	1	admin	Elgyem	Elgyem es el pokemon numero #605	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/605.png	bug,ghost,dark	1	2018-11-16 05:59:03.93489	\N	elgyem	Sin Descripcion
3063	1	admin	Cryogonal	Cryogonal es el pokemon numero #615	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/615.png	fire,fighting,rock,steel	1	2018-11-16 05:59:04.055352	\N	cryogonal	Sin Descripcion
3073	1	admin	Heatmor	Heatmor es el pokemon numero #631	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/631.png	water,ground,rock	1	2018-11-16 05:59:04.16668	\N	heatmor	Sin Descripcion
3083	1	admin	Hydreigon	Hydreigon es el pokemon numero #635	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/635.png	ice,fighting,bug,dragon,fairy	1	2018-11-16 05:59:04.27706	\N	hydreigon	Sin Descripcion
3093	1	admin	Landorus	Landorus es el pokemon numero #645	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/645.png	ice,water	1	2018-11-16 05:59:04.388675	\N	landorus	Sin Descripcion
3102	1	admin	Delphox	Delphox es el pokemon numero #655	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/655.png	ghost,dark,water,rock,ground	1	2018-11-16 05:59:04.512348	\N	delphox	Sin Descripcion
3111	1	admin	Scatterbug	Scatterbug es el pokemon numero #664	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/664.png	fire,flying,rock	1	2018-11-16 05:59:04.621149	\N	scatterbug	Sin Descripcion
3121	1	admin	Gogoat	Gogoat es el pokemon numero #673	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/673.png	fire,flying,poison,ice,bug	1	2018-11-16 05:59:04.723364	\N	gogoat	Sin Descripcion
3130	1	admin	Spritzee	Spritzee es el pokemon numero #682	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/682.png	steel,poison	1	2018-11-16 05:59:04.831055	\N	spritzee	Sin Descripcion
3139	1	admin	Heliolisk	Heliolisk es el pokemon numero #695	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/695.png	fighting,ground	1	2018-11-16 05:59:04.938464	\N	heliolisk	Sin Descripcion
3146	1	admin	Volcanion	Volcanion es el pokemon numero #721	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/721.png	ground,electric,rock	1	2018-11-16 05:59:05.072708	\N	volcanion	Sin Descripcion
3155	1	admin	Shiinotic	Shiinotic es el pokemon numero #756	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/756.png	steel,fire,flying,ice,poison	1	2018-11-16 05:59:05.180893	\N	shiinotic	Sin Descripcion
3164	1	admin	Solgaleo	Solgaleo es el pokemon numero #791	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/791.png	ghost,fire,dark,ground	1	2018-11-16 05:59:05.290829	\N	solgaleo	Sin Descripcion
3174	1	admin	Palkia	Palkia es el pokemon numero #484	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/484.png	dragon,fairy	1	2018-11-16 05:59:05.402677	\N	palkia	Sin Descripcion
3184	1	admin	Porygon-Z	Porygon-Z es el pokemon numero #474	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/474.png	fighting	1	2018-11-16 05:59:05.513388	\N	porygon-z	Sin Descripcion
3194	1	admin	Rhyperior	Rhyperior es el pokemon numero #464	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/464.png	grass,water,fighting,ground,ice,steel	1	2018-11-16 05:59:05.622665	\N	rhyperior	Sin Descripcion
3202	1	admin	Finneon	Finneon es el pokemon numero #456	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/456.png	electric,grass	1	2018-11-16 05:59:05.731841	\N	finneon	Sin Descripcion
3212	1	admin	Munchlax	Munchlax es el pokemon numero #446	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/446.png	fighting	1	2018-11-16 05:59:05.854173	\N	munchlax	Sin Descripcion
3222	1	admin	Bronzor	Bronzor es el pokemon numero #436	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/436.png	fire,ground,ghost,dark	1	2018-11-16 05:59:05.967005	\N	bronzor	Sin Descripcion
3230	1	admin	Lopunny	Lopunny es el pokemon numero #428	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/428.png	fighting	1	2018-11-16 05:59:06.075719	\N	lopunny	Sin Descripcion
3241	1	admin	Buizel	Buizel es el pokemon numero #418	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/418.png	electric,grass	1	2018-11-16 05:59:06.201526	\N	buizel	Sin Descripcion
3249	1	admin	Rampardos	Rampardos es el pokemon numero #409	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/409.png	fighting,grass,ground,steel,water	1	2018-11-16 05:59:06.307807	\N	rampardos	Sin Descripcion
3258	1	admin	Bibarel	Bibarel es el pokemon numero #400	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/400.png	electric,fighting,grass	1	2018-11-16 05:59:06.416646	\N	bibarel	Sin Descripcion
3267	1	admin	Monferno	Monferno es el pokemon numero #391	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/391.png	flying,ground,psychic,water	1	2018-11-16 05:59:06.526221	\N	monferno	Sin Descripcion
3277	1	admin	Latios	Latios es el pokemon numero #381	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/381.png	bug,dark,dragon,ghost,ice,fairy	1	2018-11-16 05:59:06.640744	\N	latios	Sin Descripcion
3286	1	admin	Bagon	Bagon es el pokemon numero #371	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/371.png	dragon,ice,fairy	1	2018-11-16 05:59:06.751315	\N	bagon	Sin Descripcion
3296	1	admin	Glalie	Glalie es el pokemon numero #362	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/362.png	fire,fighting,rock,steel	1	2018-11-16 05:59:06.86843	\N	glalie	Sin Descripcion
3305	1	admin	Stakataka	Stakataka es el pokemon numero #805	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/805.png	water,fighting,ground	1	2018-11-16 05:59:06.978838	\N	stakataka	Sin Descripcion
3315	1	admin	Nihilego	Nihilego es el pokemon numero #793	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/793.png	steel,water,psychic,ground	1	2018-11-16 05:59:07.090099	\N	nihilego	Sin Descripcion
3325	1	admin	Drampa	Drampa es el pokemon numero #780	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/780.png	fairy,fighting,ice,dragon	1	2018-11-16 05:59:07.200909	\N	drampa	Sin Descripcion
3335	1	admin	Passimian	Passimian es el pokemon numero #766	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/766.png	psychic,flying,fairy	1	2018-11-16 05:59:07.31903	\N	passimian	Sin Descripcion
3355	1	admin	Vikavolt	Vikavolt es el pokemon numero #738	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/738.png	fire,rock	1	2018-11-16 05:59:07.538579	\N	vikavolt	Sin Descripcion
3365	1	admin	Torracat	Torracat es el pokemon numero #726	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/726.png	water,ground,rock	1	2018-11-16 05:59:07.649958	\N	torracat	Sin Descripcion
3374	1	admin	Bergmite	Bergmite es el pokemon numero #712	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/712.png	fire,steel,fighting,rock	1	2018-11-16 05:59:07.763305	\N	bergmite	Sin Descripcion
3384	1	admin	Hawlucha	Hawlucha es el pokemon numero #701	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/701.png	electric,psychic,flying,ice,fairy	1	2018-11-16 05:59:07.878199	\N	hawlucha	Sin Descripcion
3047	1	admin	Klink	Klink es el pokemon numero #599	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/599.png	fire,fighting,ground	1	2018-11-16 05:59:03.861518	\N	klink	Sin Descripcion
3056	1	admin	Lampent	Lampent es el pokemon numero #608	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/608.png	water,ground,rock,ghost,dark	1	2018-11-16 05:59:03.97913	\N	lampent	Sin Descripcion
3066	1	admin	Stunfisk	Stunfisk es el pokemon numero #618	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/618.png	water,grass,ice,ground	1	2018-11-16 05:59:04.098734	\N	stunfisk	Sin Descripcion
3076	1	admin	Braviary	Braviary es el pokemon numero #628	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/628.png	electric,ice,rock	1	2018-11-16 05:59:04.223204	\N	braviary	Sin Descripcion
3088	1	admin	Terrakion	Terrakion es el pokemon numero #639	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/639.png	water,grass,fighting,ground,steel,psychic,fairy	1	2018-11-16 05:59:04.340812	\N	terrakion	Sin Descripcion
3097	1	admin	Chespin	Chespin es el pokemon numero #650	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/650.png	fire,flying,poison,ice,bug	1	2018-11-16 05:59:04.462996	\N	chespin	Sin Descripcion
3108	1	admin	Diggersby	Diggersby es el pokemon numero #660	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/660.png	water,grass,ice,fighting	1	2018-11-16 05:59:04.580327	\N	diggersby	Sin Descripcion
3118	1	admin	Floette	Floette es el pokemon numero #670	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/670.png	steel,poison	1	2018-11-16 05:59:04.703628	\N	floette	Sin Descripcion
3127	1	admin	Doublade	Doublade es el pokemon numero #680	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/680.png	fire,ghost,dark,ground	1	2018-11-16 05:59:04.816482	\N	doublade	Sin Descripcion
3138	1	admin	Dragalge	Dragalge es el pokemon numero #691	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/691.png	psychic,dragon,ice,ground	1	2018-11-16 05:59:04.938077	\N	dragalge	Sin Descripcion
3152	1	admin	Toucannon	Toucannon es el pokemon numero #733	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/733.png	electric,ice,rock	1	2018-11-16 05:59:05.115459	\N	toucannon	Sin Descripcion
3161	1	admin	Bruxish	Bruxish es el pokemon numero #779	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/779.png	ghost,dark,grass,electric,bug	1	2018-11-16 05:59:05.235446	\N	bruxish	Sin Descripcion
3171	1	admin	Giratina	Giratina es el pokemon numero #487	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/487.png	dark,dragon,ghost,ice,fairy	1	2018-11-16 05:59:05.353379	\N	giratina	Sin Descripcion
3181	1	admin	Dusknoir	Dusknoir es el pokemon numero #477	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/477.png	dark,ghost	1	2018-11-16 05:59:05.469913	\N	dusknoir	Sin Descripcion
3191	1	admin	Magmortar	Magmortar es el pokemon numero #467	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/467.png	ground,rock,water	1	2018-11-16 05:59:05.599855	\N	magmortar	Sin Descripcion
3201	1	admin	Lumineon	Lumineon es el pokemon numero #457	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/457.png	electric,grass	1	2018-11-16 05:59:05.714535	\N	lumineon	Sin Descripcion
3211	1	admin	Riolu	Riolu es el pokemon numero #447	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/447.png	flying,psychic,fairy	1	2018-11-16 05:59:05.842415	\N	riolu	Sin Descripcion
3220	1	admin	Bronzong	Bronzong es el pokemon numero #437	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/437.png	fire,ground,ghost,dark	1	2018-11-16 05:59:05.962455	\N	bronzong	Sin Descripcion
3232	1	admin	Drifblim	Drifblim es el pokemon numero #426	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/426.png	dark,electric,ghost,ice,rock	1	2018-11-16 05:59:06.083593	\N	drifblim	Sin Descripcion
3242	1	admin	Vespiquen	Vespiquen es el pokemon numero #416	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/416.png	rock,electric,fire,flying,ice	1	2018-11-16 05:59:06.209928	\N	vespiquen	Sin Descripcion
3252	1	admin	Roserade	Roserade es el pokemon numero #407	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/407.png	fire,flying,ice,psychic	1	2018-11-16 05:59:06.323131	\N	roserade	Sin Descripcion
3261	1	admin	Staravia	Staravia es el pokemon numero #397	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/397.png	electric,ice,rock	1	2018-11-16 05:59:06.45775	\N	staravia	Sin Descripcion
3272	1	admin	Turtwig	Turtwig es el pokemon numero #387	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/387.png	bug,fire,flying,ice,poison	1	2018-11-16 05:59:06.588213	\N	turtwig	Sin Descripcion
3282	1	admin	Metagross	Metagross es el pokemon numero #376	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/376.png	fire,ground,ghost,dark	1	2018-11-16 05:59:06.69756	\N	metagross	Sin Descripcion
3292	1	admin	Clamperl	Clamperl es el pokemon numero #366	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/366.png	electric,grass	1	2018-11-16 05:59:06.823708	\N	clamperl	Sin Descripcion
3303	1	admin	Duskull	Duskull es el pokemon numero #355	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/355.png	dark,ghost	1	2018-11-16 05:59:06.937371	\N	duskull	Sin Descripcion
3314	1	admin	Xurkitree	Xurkitree es el pokemon numero #796	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/796.png	ground	1	2018-11-16 05:59:07.061102	\N	xurkitree	Sin Descripcion
3324	1	admin	Dhelmise	Dhelmise es el pokemon numero #781	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/781.png	ghost,fire,flying,dark,ice	1	2018-11-16 05:59:07.187507	\N	dhelmise	Sin Descripcion
3334	1	admin	Golisopod	Golisopod es el pokemon numero #768	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/768.png	flying,electric,rock	1	2018-11-16 05:59:07.302651	\N	golisopod	Sin Descripcion
3343	1	admin	Lurantis	Lurantis es el pokemon numero #754	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/754.png	fire,flying,ice,poison,bug	1	2018-11-16 05:59:07.414127	\N	lurantis	Sin Descripcion
3354	1	admin	Cutiefly	Cutiefly es el pokemon numero #742	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/742.png	fire,steel,flying,poison,rock	1	2018-11-16 05:59:07.531015	\N	cutiefly	Sin Descripcion
3364	1	admin	Incineroar	Incineroar es el pokemon numero #727	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/727.png	water,ground,fighting,rock	1	2018-11-16 05:59:07.644019	\N	incineroar	Sin Descripcion
3373	1	admin	Avalugg	Avalugg es el pokemon numero #713	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/713.png	fire,steel,fighting,rock	1	2018-11-16 05:59:07.759935	\N	avalugg	Sin Descripcion
3383	1	admin	Sylveon	Sylveon es el pokemon numero #700	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/700.png	steel,poison	1	2018-11-16 05:59:07.877633	\N	sylveon	Sin Descripcion
3061	1	admin	Cubchoo	Cubchoo es el pokemon numero #613	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/613.png	fire,fighting,rock,steel	1	2018-11-16 05:59:04.001989	\N	cubchoo	Sin Descripcion
3070	1	admin	Golurk	Golurk es el pokemon numero #623	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/623.png	water,grass,ice,ghost,dark	1	2018-11-16 05:59:04.127322	\N	golurk	Sin Descripcion
3079	1	admin	Pawniard	Pawniard es el pokemon numero #624	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/624.png	fighting,fire,ground	1	2018-11-16 05:59:04.236951	\N	pawniard	Sin Descripcion
3089	1	admin	Tornadus	Tornadus es el pokemon numero #641	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/641.png	electric,ice,rock	1	2018-11-16 05:59:04.348978	\N	tornadus	Sin Descripcion
3099	1	admin	Quilladin	Quilladin es el pokemon numero #651	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/651.png	fire,flying,poison,ice,bug	1	2018-11-16 05:59:04.479856	\N	quilladin	Sin Descripcion
3109	1	admin	Fletchling	Fletchling es el pokemon numero #661	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/661.png	ice,electric,rock	1	2018-11-16 05:59:04.591164	\N	fletchling	Sin Descripcion
3119	1	admin	Florges	Florges es el pokemon numero #671	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/671.png	steel,poison	1	2018-11-16 05:59:04.715002	\N	florges	Sin Descripcion
3180	1	admin	Rotom	Rotom es el pokemon numero #479	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/479.png	ghost,dark	1	2018-11-16 05:59:05.460281	\N	rotom	Sin Descripcion
3129	1	admin	Aegislash	Aegislash es el pokemon numero #681	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/681.png	fire,ghost,dark,ground	1	2018-11-16 05:59:04.82903	\N	aegislash	Sin Descripcion
3137	1	admin	Aurorus	Aurorus es el pokemon numero #699	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/699.png	steel,fighting,water,rock,grass,ground	1	2018-11-16 05:59:04.936052	\N	aurorus	Sin Descripcion
3147	1	admin	Litten	Litten es el pokemon numero #725	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/725.png	water,ground,rock	1	2018-11-16 05:59:05.083918	\N	litten	Sin Descripcion
3156	1	admin	Bewear	Bewear es el pokemon numero #760	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/760.png	psychic,flying,fairy,fighting	1	2018-11-16 05:59:05.195704	\N	bewear	Sin Descripcion
3165	1	admin	Buzzwole	Buzzwole es el pokemon numero #794	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/794.png	fire,psychic,flying,fairy	1	2018-11-16 05:59:05.309934	\N	buzzwole	Sin Descripcion
3175	1	admin	Dialga	Dialga es el pokemon numero #483	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/483.png	fighting,ground	1	2018-11-16 05:59:05.41918	\N	dialga	Sin Descripcion
3185	1	admin	Mamoswine	Mamoswine es el pokemon numero #473	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/473.png	fighting,fire,grass,steel,water	1	2018-11-16 05:59:05.529466	\N	mamoswine	Sin Descripcion
3195	1	admin	Lickilicky	Lickilicky es el pokemon numero #463	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/463.png	fighting	1	2018-11-16 05:59:05.643384	\N	lickilicky	Sin Descripcion
3207	1	admin	Skorupi	Skorupi es el pokemon numero #451	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/451.png	fire,flying,psychic,rock	1	2018-11-16 05:59:05.755943	\N	skorupi	Sin Descripcion
3218	1	admin	Chatot	Chatot es el pokemon numero #441	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/441.png	electric,ice,rock	1	2018-11-16 05:59:05.87667	\N	chatot	Sin Descripcion
3228	1	admin	Honchkrow	Honchkrow es el pokemon numero #430	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/430.png	electric,ice,rock,fairy	1	2018-11-16 05:59:05.994066	\N	honchkrow	Sin Descripcion
3236	1	admin	Cherubi	Cherubi es el pokemon numero #420	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/420.png	bug,fire,flying,ice,poison	1	2018-11-16 05:59:06.108741	\N	cherubi	Sin Descripcion
3245	1	admin	Burmy	Burmy es el pokemon numero #412	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/412.png	fire,flying,rock	1	2018-11-16 05:59:06.243514	\N	burmy	Sin Descripcion
3254	1	admin	Luxio	Luxio es el pokemon numero #404	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/404.png	ground	1	2018-11-16 05:59:06.361862	\N	luxio	Sin Descripcion
3263	1	admin	Empoleon	Empoleon es el pokemon numero #395	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/395.png	electric,fighting,ground	1	2018-11-16 05:59:06.475565	\N	empoleon	Sin Descripcion
3273	1	admin	Jirachi	Jirachi es el pokemon numero #385	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/385.png	fire,ground,ghost,dark	1	2018-11-16 05:59:06.599979	\N	jirachi	Sin Descripcion
3283	1	admin	Metang	Metang es el pokemon numero #375	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/375.png	fire,ground,ghost,dark	1	2018-11-16 05:59:06.711631	\N	metang	Sin Descripcion
3293	1	admin	Walrein	Walrein es el pokemon numero #365	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/365.png	electric,fighting,grass,rock	1	2018-11-16 05:59:06.82784	\N	walrein	Sin Descripcion
3304	1	admin	Banette	Banette es el pokemon numero #354	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/354.png	dark,ghost	1	2018-11-16 05:59:06.948197	\N	banette	Sin Descripcion
3313	1	admin	Pheromosa	Pheromosa es el pokemon numero #795	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/795.png	fire,psychic,flying,fairy	1	2018-11-16 05:59:07.059944	\N	pheromosa	Sin Descripcion
3323	1	admin	Jangmo-o	Jangmo-o es el pokemon numero #782	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/782.png	fairy,ice,dragon	1	2018-11-16 05:59:07.185493	\N	jangmo-o	Sin Descripcion
3333	1	admin	Sandygast	Sandygast es el pokemon numero #769	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/769.png	ghost,dark,grass,water,ice	1	2018-11-16 05:59:07.300579	\N	sandygast	Sin Descripcion
3342	1	admin	Morelull	Morelull es el pokemon numero #755	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/755.png	steel,fire,flying,ice,poison	1	2018-11-16 05:59:07.412348	\N	morelull	Sin Descripcion
3352	1	admin	Ribombee	Ribombee es el pokemon numero #743	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/743.png	fire,steel,flying,poison,rock	1	2018-11-16 05:59:07.523914	\N	ribombee	Sin Descripcion
3363	1	admin	Primarina	Primarina es el pokemon numero #730	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/730.png	grass,electric,poison	1	2018-11-16 05:59:07.641527	\N	primarina	Sin Descripcion
3372	1	admin	Xerneas	Xerneas es el pokemon numero #716	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/716.png	steel,poison	1	2018-11-16 05:59:07.752728	\N	xerneas	Sin Descripcion
3381	1	admin	Carbink	Carbink es el pokemon numero #703	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/703.png	steel,water,grass,ground	1	2018-11-16 05:59:07.865425	\N	carbink	Sin Descripcion
3391	1	admin	Skrelp	Skrelp es el pokemon numero #690	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/690.png	psychic,electric,ground	1	2018-11-16 05:59:07.974604	\N	skrelp	Sin Descripcion
3065	1	admin	Shelmet	Shelmet es el pokemon numero #616	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/616.png	fire,flying,rock	1	2018-11-16 05:59:04.077065	\N	shelmet	Sin Descripcion
3075	1	admin	Vullaby	Vullaby es el pokemon numero #629	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/629.png	electric,ice,rock,fairy	1	2018-11-16 05:59:04.222116	\N	vullaby	Sin Descripcion
3087	1	admin	Volcarona	Volcarona es el pokemon numero #637	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/637.png	rock,water,flying	1	2018-11-16 05:59:04.339957	\N	volcarona	Sin Descripcion
3098	1	admin	Genesect	Genesect es el pokemon numero #649	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/649.png	fire	1	2018-11-16 05:59:04.464241	\N	genesect	Sin Descripcion
3107	1	admin	Bunnelby	Bunnelby es el pokemon numero #659	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/659.png	fighting	1	2018-11-16 05:59:04.580018	\N	bunnelby	Sin Descripcion
3117	1	admin	Flabébé	Flabébé es el pokemon numero #669	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/669.png	steel,poison	1	2018-11-16 05:59:04.699827	\N	flabébé	Sin Descripcion
3128	1	admin	Honedge	Honedge es el pokemon numero #679	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/679.png	fire,ghost,dark,ground	1	2018-11-16 05:59:04.819774	\N	honedge	Sin Descripcion
3140	1	admin	Barbaracle	Barbaracle es el pokemon numero #689	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/689.png	electric,fighting,grass,ground	1	2018-11-16 05:59:04.940464	\N	barbaracle	Sin Descripcion
3148	1	admin	Brionne	Brionne es el pokemon numero #729	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/729.png	grass,electric	1	2018-11-16 05:59:05.095091	\N	brionne	Sin Descripcion
3157	1	admin	Comfey	Comfey es el pokemon numero #764	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/764.png	steel,poison	1	2018-11-16 05:59:05.214097	\N	comfey	Sin Descripcion
3169	1	admin	Marshadow	Marshadow es el pokemon numero #802	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/802.png	ghost,psychic,flying,fairy	1	2018-11-16 05:59:05.338888	\N	marshadow	Sin Descripcion
3189	1	admin	Yanmega	Yanmega es el pokemon numero #469	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/469.png	rock,electric,fire,flying,ice	1	2018-11-16 05:59:05.584994	\N	yanmega	Sin Descripcion
3199	1	admin	Snover	Snover es el pokemon numero #459	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/459.png	fire,bug,fighting,flying,poison,rock,steel	1	2018-11-16 05:59:05.705379	\N	snover	Sin Descripcion
3210	1	admin	Hippopotas	Hippopotas es el pokemon numero #449	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/449.png	grass,ice,water	1	2018-11-16 05:59:05.836187	\N	hippopotas	Sin Descripcion
3223	1	admin	Bonsly	Bonsly es el pokemon numero #438	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/438.png	fighting,grass,ground,steel,water	1	2018-11-16 05:59:05.971008	\N	bonsly	Sin Descripcion
3237	1	admin	Drifloon	Drifloon es el pokemon numero #425	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/425.png	dark,electric,ghost,ice,rock	1	2018-11-16 05:59:06.109856	\N	drifloon	Sin Descripcion
3246	1	admin	Mothim	Mothim es el pokemon numero #414	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/414.png	rock,electric,fire,flying,ice	1	2018-11-16 05:59:06.254702	\N	mothim	Sin Descripcion
3255	1	admin	Shinx	Shinx es el pokemon numero #403	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/403.png	ground	1	2018-11-16 05:59:06.373075	\N	shinx	Sin Descripcion
3264	1	admin	Prinplup	Prinplup es el pokemon numero #394	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/394.png	electric,grass	1	2018-11-16 05:59:06.491189	\N	prinplup	Sin Descripcion
3274	1	admin	Rayquaza	Rayquaza es el pokemon numero #384	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/384.png	ice,dragon,rock,fairy	1	2018-11-16 05:59:06.611139	\N	rayquaza	Sin Descripcion
3285	1	admin	Beldum	Beldum es el pokemon numero #374	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/374.png	fire,ground,ghost,dark	1	2018-11-16 05:59:06.735748	\N	beldum	Sin Descripcion
3295	1	admin	Spheal	Spheal es el pokemon numero #363	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/363.png	electric,fighting,grass,rock	1	2018-11-16 05:59:06.85764	\N	spheal	Sin Descripcion
3306	1	admin	Zeraora	Zeraora es el pokemon numero #807	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/807.png	ground	1	2018-11-16 05:59:06.979387	\N	zeraora	Sin Descripcion
3316	1	admin	Lunala	Lunala es el pokemon numero #792	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/792.png	ghost,dark	1	2018-11-16 05:59:07.099211	\N	lunala	Sin Descripcion
3327	1	admin	Mimikyu	Mimikyu es el pokemon numero #778	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/778.png	ghost,steel	1	2018-11-16 05:59:07.222058	\N	mimikyu	Sin Descripcion
3337	1	admin	Tsareena	Tsareena es el pokemon numero #763	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/763.png	fire,flying,ice,poison,bug	1	2018-11-16 05:59:07.345379	\N	tsareena	Sin Descripcion
3347	1	admin	Mudsdale	Mudsdale es el pokemon numero #750	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/750.png	water,grass,ice	1	2018-11-16 05:59:07.45852	\N	mudsdale	Sin Descripcion
3357	1	admin	Grubbin	Grubbin es el pokemon numero #736	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/736.png	fire,flying,rock	1	2018-11-16 05:59:07.578743	\N	grubbin	Sin Descripcion
3368	1	admin	Dartrix	Dartrix es el pokemon numero #723	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/723.png	fire,flying,ice,poison,rock	1	2018-11-16 05:59:07.697415	\N	dartrix	Sin Descripcion
3378	1	admin	Phantump	Phantump es el pokemon numero #708	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/708.png	ghost,fire,flying,dark,ice	1	2018-11-16 05:59:07.819553	\N	phantump	Sin Descripcion
3388	1	admin	Helioptile	Helioptile es el pokemon numero #694	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/694.png	fighting,ground	1	2018-11-16 05:59:07.948989	\N	helioptile	Sin Descripcion
3068	1	admin	Mienfoo	Mienfoo es el pokemon numero #619	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/619.png	flying,psychic,fairy	1	2018-11-16 05:59:04.120107	\N	mienfoo	Sin Descripcion
3080	1	admin	Bisharp	Bisharp es el pokemon numero #625	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/625.png	fighting,fire,ground	1	2018-11-16 05:59:04.248121	\N	bisharp	Sin Descripcion
3091	1	admin	Thundurus	Thundurus es el pokemon numero #642	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/642.png	ice,rock	1	2018-11-16 05:59:04.367909	\N	thundurus	Sin Descripcion
3101	1	admin	Fennekin	Fennekin es el pokemon numero #653	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/653.png	water,rock,ground	1	2018-11-16 05:59:04.502976	\N	fennekin	Sin Descripcion
3112	1	admin	Talonflame	Talonflame es el pokemon numero #663	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/663.png	water,rock,electric	1	2018-11-16 05:59:04.622617	\N	talonflame	Sin Descripcion
3122	1	admin	Pancham	Pancham es el pokemon numero #674	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/674.png	psychic,flying,fairy	1	2018-11-16 05:59:04.741388	\N	pancham	Sin Descripcion
3133	1	admin	Swirlix	Swirlix es el pokemon numero #684	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/684.png	steel,poison	1	2018-11-16 05:59:04.861535	\N	swirlix	Sin Descripcion
3144	1	admin	Pumpkaboo	Pumpkaboo es el pokemon numero #710	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/710.png	ghost,fire,flying,dark,ice	1	2018-11-16 05:59:04.980759	\N	pumpkaboo	Sin Descripcion
3153	1	admin	Mudbray	Mudbray es el pokemon numero #749	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/749.png	water,grass,ice	1	2018-11-16 05:59:05.120567	\N	mudbray	Sin Descripcion
3162	1	admin	Hakamo-o	Hakamo-o es el pokemon numero #783	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/783.png	fairy,flying,psychic,ice,dragon	1	2018-11-16 05:59:05.253366	\N	hakamo-o	Sin Descripcion
3172	1	admin	Regigigas	Regigigas es el pokemon numero #486	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/486.png	fighting	1	2018-11-16 05:59:05.370646	\N	regigigas	Sin Descripcion
3182	1	admin	Probopass	Probopass es el pokemon numero #476	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/476.png	fighting,ground,water	1	2018-11-16 05:59:05.499875	\N	probopass	Sin Descripcion
3192	1	admin	Electivire	Electivire es el pokemon numero #466	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/466.png	ground	1	2018-11-16 05:59:05.619667	\N	electivire	Sin Descripcion
3203	1	admin	Carnivine	Carnivine es el pokemon numero #455	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/455.png	bug,fire,flying,ice,poison	1	2018-11-16 05:59:05.736364	\N	carnivine	Sin Descripcion
3214	1	admin	Garchomp	Garchomp es el pokemon numero #445	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/445.png	ice,dragon,fairy	1	2018-11-16 05:59:05.868822	\N	garchomp	Sin Descripcion
3225	1	admin	Chingling	Chingling es el pokemon numero #433	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/433.png	bug,dark,ghost	1	2018-11-16 05:59:05.990994	\N	chingling	Sin Descripcion
3235	1	admin	Gastrodon	Gastrodon es el pokemon numero #423	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/423.png	grass	1	2018-11-16 05:59:06.108393	\N	gastrodon	Sin Descripcion
3268	1	admin	Chimchar	Chimchar es el pokemon numero #390	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/390.png	ground,rock,water	1	2018-11-16 05:59:06.547823	\N	chimchar	Sin Descripcion
3279	1	admin	Latias	Latias es el pokemon numero #380	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/380.png	bug,dark,dragon,ghost,ice,fairy	1	2018-11-16 05:59:06.666036	\N	latias	Sin Descripcion
3289	1	admin	Relicanth	Relicanth es el pokemon numero #369	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/369.png	grass,electric,fighting,ground	1	2018-11-16 05:59:06.793032	\N	relicanth	Sin Descripcion
3299	1	admin	Absol	Absol es el pokemon numero #359	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/359.png	fighting,bug,fairy	1	2018-11-16 05:59:06.912962	\N	absol	Sin Descripcion
3310	1	admin	Magearna	Magearna es el pokemon numero #801	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/801.png	fire,ground	1	2018-11-16 05:59:07.036051	\N	magearna	Sin Descripcion
3322	1	admin	Tapu Lele	Tapu Lele es el pokemon numero #786	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/786.png	ghost,steel,poison	1	2018-11-16 05:59:07.160428	\N	tapu lele	Sin Descripcion
3332	1	admin	Palossand	Palossand es el pokemon numero #770	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/770.png	ghost,dark,grass,water,ice	1	2018-11-16 05:59:07.296326	\N	palossand	Sin Descripcion
3356	1	admin	Crabominable	Crabominable es el pokemon numero #740	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/740.png	steel,fire,psychic,flying,fighting,fairy	1	2018-11-16 05:59:07.540595	\N	crabominable	Sin Descripcion
3366	1	admin	Decidueye	Decidueye es el pokemon numero #724	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/724.png	ghost,fire,flying,dark,ice	1	2018-11-16 05:59:07.661338	\N	decidueye	Sin Descripcion
3376	1	admin	Gourgeist	Gourgeist es el pokemon numero #711	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/711.png	ghost,fire,flying,dark,ice	1	2018-11-16 05:59:07.782195	\N	gourgeist	Sin Descripcion
3386	1	admin	Tyrantrum	Tyrantrum es el pokemon numero #697	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/697.png	steel,ice,dragon,fighting,fairy,ground	1	2018-11-16 05:59:07.902117	\N	tyrantrum	Sin Descripcion
3100	1	admin	Chesnaught	Chesnaught es el pokemon numero #652	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/652.png	fire,psychic,flying,poison,ice,fairy	1	2018-11-16 05:59:04.4822	\N	chesnaught	Sin Descripcion
3110	1	admin	Fletchinder	Fletchinder es el pokemon numero #662	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/662.png	water,rock,electric	1	2018-11-16 05:59:04.600303	\N	fletchinder	Sin Descripcion
3120	1	admin	Skiddo	Skiddo es el pokemon numero #672	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/672.png	fire,flying,poison,ice,bug	1	2018-11-16 05:59:04.722772	\N	skiddo	Sin Descripcion
3131	1	admin	Aromatisse	Aromatisse es el pokemon numero #683	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/683.png	steel,poison	1	2018-11-16 05:59:04.840194	\N	aromatisse	Sin Descripcion
3141	1	admin	Dedenne	Dedenne es el pokemon numero #702	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/702.png	poison,ground	1	2018-11-16 05:59:04.958644	\N	dedenne	Sin Descripcion
3151	1	admin	Charjabug	Charjabug es el pokemon numero #737	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/737.png	fire,rock	1	2018-11-16 05:59:05.115001	\N	charjabug	Sin Descripcion
3160	1	admin	Komala	Komala es el pokemon numero #775	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/775.png	fighting	1	2018-11-16 05:59:05.228236	\N	komala	Sin Descripcion
3170	1	admin	Cresselia	Cresselia es el pokemon numero #488	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/488.png	bug,dark,ghost	1	2018-11-16 05:59:05.344651	\N	cresselia	Sin Descripcion
3179	1	admin	Froslass	Froslass es el pokemon numero #478	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/478.png	dark,fire,ghost,rock,steel	1	2018-11-16 05:59:05.460435	\N	froslass	Sin Descripcion
3190	1	admin	Togekiss	Togekiss es el pokemon numero #468	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/468.png	electric,ice,rock,steel,poison	1	2018-11-16 05:59:05.588782	\N	togekiss	Sin Descripcion
3200	1	admin	Mantyke	Mantyke es el pokemon numero #458	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/458.png	electric,rock	1	2018-11-16 05:59:05.705942	\N	mantyke	Sin Descripcion
3209	1	admin	Lucario	Lucario es el pokemon numero #448	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/448.png	fighting,fire,ground	1	2018-11-16 05:59:05.82687	\N	lucario	Sin Descripcion
3219	1	admin	Mime Jr.	Mime Jr. es el pokemon numero #439	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/439.png	ghost,steel,poison	1	2018-11-16 05:59:05.961735	\N	mime jr.	Sin Descripcion
3231	1	admin	Buneary	Buneary es el pokemon numero #427	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/427.png	fighting	1	2018-11-16 05:59:06.083087	\N	buneary	Sin Descripcion
3240	1	admin	Pachirisu	Pachirisu es el pokemon numero #417	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/417.png	ground	1	2018-11-16 05:59:06.201011	\N	pachirisu	Sin Descripcion
3250	1	admin	Cranidos	Cranidos es el pokemon numero #408	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/408.png	fighting,grass,ground,steel,water	1	2018-11-16 05:59:06.316935	\N	cranidos	Sin Descripcion
3260	1	admin	Staraptor	Staraptor es el pokemon numero #398	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/398.png	electric,ice,rock	1	2018-11-16 05:59:06.457226	\N	staraptor	Sin Descripcion
3270	1	admin	Grotle	Grotle es el pokemon numero #388	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/388.png	bug,fire,flying,ice,poison	1	2018-11-16 05:59:06.574635	\N	grotle	Sin Descripcion
3280	1	admin	Regice	Regice es el pokemon numero #378	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/378.png	fire,fighting,rock,steel	1	2018-11-16 05:59:06.691501	\N	regice	Sin Descripcion
3290	1	admin	Gorebyss	Gorebyss es el pokemon numero #368	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/368.png	electric,grass	1	2018-11-16 05:59:06.810914	\N	gorebyss	Sin Descripcion
3300	1	admin	Chimecho	Chimecho es el pokemon numero #358	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/358.png	bug,dark,ghost	1	2018-11-16 05:59:06.924668	\N	chimecho	Sin Descripcion
3311	1	admin	Necrozma	Necrozma es el pokemon numero #800	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/800.png	ghost,dark,bug	1	2018-11-16 05:59:07.039692	\N	necrozma	Sin Descripcion
3320	1	admin	Tapu Koko	Tapu Koko es el pokemon numero #785	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/785.png	poison,ground	1	2018-11-16 05:59:07.155788	\N	tapu koko	Sin Descripcion
3331	1	admin	Silvally	Silvally es el pokemon numero #773	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/773.png	fighting	1	2018-11-16 05:59:07.291569	\N	silvally	Sin Descripcion
3340	1	admin	Salazzle	Salazzle es el pokemon numero #758	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/758.png	water,psychic,ground,rock	1	2018-11-16 05:59:07.40322	\N	salazzle	Sin Descripcion
3351	1	admin	Wishiwashi	Wishiwashi es el pokemon numero #746	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/746.png	grass,electric	1	2018-11-16 05:59:07.519063	\N	wishiwashi	Sin Descripcion
3360	1	admin	Pikipek	Pikipek es el pokemon numero #731	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/731.png	electric,ice,rock	1	2018-11-16 05:59:07.634716	\N	pikipek	Sin Descripcion
3371	1	admin	Yveltal	Yveltal es el pokemon numero #717	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/717.png	electric,ice,rock,fairy	1	2018-11-16 05:59:07.749389	\N	yveltal	Sin Descripcion
3382	1	admin	Goomy	Goomy es el pokemon numero #704	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/704.png	fairy,ice,dragon	1	2018-11-16 05:59:07.867246	\N	goomy	Sin Descripcion
3103	1	admin	Braixen	Braixen es el pokemon numero #654	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/654.png	water,rock,ground	1	2018-11-16 05:59:04.518499	\N	braixen	Sin Descripcion
3113	1	admin	Spewpa	Spewpa es el pokemon numero #665	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/665.png	fire,flying,rock	1	2018-11-16 05:59:04.638685	\N	spewpa	Sin Descripcion
3124	1	admin	Pangoro	Pangoro es el pokemon numero #675	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/675.png	flying,fairy,fighting	1	2018-11-16 05:59:04.762463	\N	pangoro	Sin Descripcion
3135	1	admin	Malamar	Malamar es el pokemon numero #687	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/687.png	fairy,bug	1	2018-11-16 05:59:04.883421	\N	malamar	Sin Descripcion
3145	1	admin	Zygarde	Zygarde es el pokemon numero #718	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/718.png	fairy,ice,dragon	1	2018-11-16 05:59:05.005948	\N	zygarde	Sin Descripcion
3154	1	admin	Fomantis	Fomantis es el pokemon numero #753	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/753.png	fire,flying,ice,poison,bug	1	2018-11-16 05:59:05.130461	\N	fomantis	Sin Descripcion
3163	1	admin	Tapu Bulu	Tapu Bulu es el pokemon numero #787	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/787.png	steel,fire,flying,ice,poison	1	2018-11-16 05:59:05.262007	\N	tapu bulu	Sin Descripcion
3173	1	admin	Heatran	Heatran es el pokemon numero #485	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/485.png	ground,fighting,water	1	2018-11-16 05:59:05.381998	\N	heatran	Sin Descripcion
3183	1	admin	Gallade	Gallade es el pokemon numero #475	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/475.png	flying,ghost,fairy	1	2018-11-16 05:59:05.501473	\N	gallade	Sin Descripcion
3193	1	admin	Tangrowth	Tangrowth es el pokemon numero #465	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/465.png	bug,fire,flying,ice,poison	1	2018-11-16 05:59:05.621319	\N	tangrowth	Sin Descripcion
3204	1	admin	Toxicroak	Toxicroak es el pokemon numero #454	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/454.png	psychic,flying,ground	1	2018-11-16 05:59:05.744863	\N	toxicroak	Sin Descripcion
3216	1	admin	Gabite	Gabite es el pokemon numero #444	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/444.png	ice,dragon,fairy	1	2018-11-16 05:59:05.870982	\N	gabite	Sin Descripcion
3226	1	admin	Purugly	Purugly es el pokemon numero #432	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/432.png	fighting	1	2018-11-16 05:59:05.992609	\N	purugly	Sin Descripcion
3238	1	admin	Cherrim	Cherrim es el pokemon numero #421	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/421.png	bug,fire,flying,ice,poison	1	2018-11-16 05:59:06.117119	\N	cherrim	Sin Descripcion
3247	1	admin	Bastiodon	Bastiodon es el pokemon numero #411	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/411.png	fighting,ground,water	1	2018-11-16 05:59:06.262225	\N	bastiodon	Sin Descripcion
3256	1	admin	Kricketune	Kricketune es el pokemon numero #402	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/402.png	fire,flying,rock	1	2018-11-16 05:59:06.381405	\N	kricketune	Sin Descripcion
3265	1	admin	Piplup	Piplup es el pokemon numero #393	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/393.png	electric,grass	1	2018-11-16 05:59:06.500787	\N	piplup	Sin Descripcion
3276	1	admin	Kyogre	Kyogre es el pokemon numero #382	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/382.png	electric,grass	1	2018-11-16 05:59:06.634012	\N	kyogre	Sin Descripcion
3287	1	admin	Shelgon	Shelgon es el pokemon numero #372	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/372.png	dragon,ice,fairy	1	2018-11-16 05:59:06.756465	\N	shelgon	Sin Descripcion
3297	1	admin	Snorunt	Snorunt es el pokemon numero #361	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/361.png	fire,fighting,rock,steel	1	2018-11-16 05:59:06.878067	\N	snorunt	Sin Descripcion
3307	1	admin	Naganadel	Naganadel es el pokemon numero #804	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/804.png	psychic,ground,ice,dragon	1	2018-11-16 05:59:06.997853	\N	naganadel	Sin Descripcion
3318	1	admin	Cosmog	Cosmog es el pokemon numero #789	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/789.png	ghost,dark,bug	1	2018-11-16 05:59:07.121809	\N	cosmog	Sin Descripcion
3328	1	admin	Turtonator	Turtonator es el pokemon numero #776	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/776.png	ground,rock,dragon	1	2018-11-16 05:59:07.242029	\N	turtonator	Sin Descripcion
3339	1	admin	Steenee	Steenee es el pokemon numero #762	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/762.png	fire,flying,ice,poison,bug	1	2018-11-16 05:59:07.378958	\N	steenee	Sin Descripcion
3349	1	admin	Mareanie	Mareanie es el pokemon numero #747	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/747.png	psychic,electric,ground	1	2018-11-16 05:59:07.49845	\N	mareanie	Sin Descripcion
3362	1	admin	Yungoos	Yungoos es el pokemon numero #734	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/734.png	fighting	1	2018-11-16 05:59:07.641729	\N	yungoos	Sin Descripcion
3375	1	admin	Noivern	Noivern es el pokemon numero #715	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/715.png	fairy,dragon,ice,rock	1	2018-11-16 05:59:07.766072	\N	noivern	Sin Descripcion
3385	1	admin	Amaura	Amaura es el pokemon numero #698	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/698.png	steel,fighting,water,rock,grass,ground	1	2018-11-16 05:59:07.887674	\N	amaura	Sin Descripcion
\.


--
-- Data for Name: RepositoryAuthors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RepositoryAuthors" (id, "idRepository", "idAuthor") FROM stdin;
6	2585	3
7	2585	1
8	3396	3
9	3344	3
\.


--
-- Data for Name: RepositoryComment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RepositoryComment" (id, "idUser", username, "idRepository", comment, "createdAt", "updatedAt") FROM stdin;
13	1	admin	2622	Vulpix <3	2018-11-16 17:09:52.618972	\N
14	1	admin	2783	dsdasd	2018-11-20 14:50:32.085589	\N
15	1	admin	3391	Nuevo Comentario\n	2018-11-24 14:41:21.385227	\N
16	2	Soriel	3345	Nuevo	2018-11-24 15:44:15.309763	\N
17	2	Soriel	3345	NUevo2	2018-11-24 15:45:07.281748	\N
18	2	Soriel	3391	Nuevo x2	2018-11-24 23:26:56.075059	\N
19	1	admin	3396	\nLindo gatito ☺	2018-11-25 11:56:49.237752	\N
20	1	admin	3397	Hi	2018-11-25 17:13:07.875024	\N
21	1	admin	3344	hola\n	2018-11-25 17:37:18.580961	\N
22	1	admin	3344	1111111111111111111111111	2018-11-25 21:30:42.484896	\N
23	1	admin	3360	1111111111111111111\n	2018-11-25 23:14:51.482593	\N
\.


--
-- Data for Name: RepositoryEditorials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RepositoryEditorials" (id, "idRepository", "idCatalog") FROM stdin;
\.


--
-- Data for Name: RepositoryResources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt", name, description) FROM stdin;
5	1	admin	2590	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/001.png	1	f	2018-11-16 05:59:53.087909	\N	\N	\N
6	1	admin	2586	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/002.png	1	f	2018-11-16 05:59:53.089146	\N	\N	\N
7	1	admin	2593	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/004.png	1	f	2018-11-16 05:59:53.094097	\N	\N	\N
8	1	admin	2585	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/007.png	1	f	2018-11-16 05:59:53.10021	\N	\N	\N
9	1	admin	2588	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/005.png	1	f	2018-11-16 05:59:53.104344	\N	\N	\N
10	1	admin	2592	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/003.png	1	f	2018-11-16 05:59:53.106015	\N	\N	\N
11	1	admin	2594	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/010.png	1	f	2018-11-16 05:59:53.110065	\N	\N	\N
12	1	admin	2591	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/009.png	1	f	2018-11-16 05:59:53.112059	\N	\N	\N
13	1	admin	2589	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/008.png	1	f	2018-11-16 05:59:53.113043	\N	\N	\N
14	1	admin	2587	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/006.png	1	f	2018-11-16 05:59:53.117954	\N	\N	\N
15	1	admin	2598	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/015.png	1	f	2018-11-16 05:59:53.247777	\N	\N	\N
16	1	admin	2599	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/014.png	1	f	2018-11-16 05:59:53.248476	\N	\N	\N
17	1	admin	2601	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/018.png	1	f	2018-11-16 05:59:53.250296	\N	\N	\N
18	1	admin	2596	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/012.png	1	f	2018-11-16 05:59:53.250841	\N	\N	\N
19	1	admin	2595	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/011.png	1	f	2018-11-16 05:59:53.251523	\N	\N	\N
20	1	admin	2597	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/013.png	1	f	2018-11-16 05:59:53.253929	\N	\N	\N
21	1	admin	2600	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/016.png	1	f	2018-11-16 05:59:53.257268	\N	\N	\N
22	1	admin	2602	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/017.png	1	f	2018-11-16 05:59:53.259436	\N	\N	\N
23	1	admin	2604	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/019.png	1	f	2018-11-16 05:59:53.265269	\N	\N	\N
24	1	admin	2603	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/020.png	1	f	2018-11-16 05:59:53.270539	\N	\N	\N
25	1	admin	2605	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/021.png	1	f	2018-11-16 05:59:53.359323	\N	\N	\N
26	1	admin	2606	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/022.png	1	f	2018-11-16 05:59:53.360125	\N	\N	\N
27	1	admin	2607	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/023.png	1	f	2018-11-16 05:59:53.365754	\N	\N	\N
28	1	admin	2608	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/024.png	1	f	2018-11-16 05:59:53.369073	\N	\N	\N
29	1	admin	2609	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/025.png	1	f	2018-11-16 05:59:53.3705	\N	\N	\N
30	1	admin	2610	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/026.png	1	f	2018-11-16 05:59:53.372407	\N	\N	\N
31	1	admin	2611	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/027.png	1	f	2018-11-16 05:59:53.38181	\N	\N	\N
32	1	admin	2612	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/028.png	1	f	2018-11-16 05:59:53.393257	\N	\N	\N
33	1	admin	2613	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/029.png	1	f	2018-11-16 05:59:53.39434	\N	\N	\N
34	1	admin	2614	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/030.png	1	f	2018-11-16 05:59:53.415594	\N	\N	\N
35	1	admin	2615	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/031.png	1	f	2018-11-16 05:59:53.463341	\N	\N	\N
36	1	admin	2616	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/032.png	1	f	2018-11-16 05:59:53.464812	\N	\N	\N
37	1	admin	2618	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/034.png	1	f	2018-11-16 05:59:53.479553	\N	\N	\N
38	1	admin	2620	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/035.png	1	f	2018-11-16 05:59:53.48036	\N	\N	\N
39	1	admin	2617	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/033.png	1	f	2018-11-16 05:59:53.482414	\N	\N	\N
40	1	admin	2621	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/036.png	1	f	2018-11-16 05:59:53.483598	\N	\N	\N
41	1	admin	2622	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/037.png	1	f	2018-11-16 05:59:53.499459	\N	\N	\N
42	1	admin	2624	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/038.png	1	f	2018-11-16 05:59:53.530309	\N	\N	\N
43	1	admin	2619	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/039.png	1	f	2018-11-16 05:59:53.533092	\N	\N	\N
44	1	admin	2623	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/040.png	1	f	2018-11-16 05:59:53.565958	\N	\N	\N
45	1	admin	2626	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/041.png	1	f	2018-11-16 05:59:53.571046	\N	\N	\N
46	1	admin	2627	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/043.png	1	f	2018-11-16 05:59:53.593299	\N	\N	\N
47	1	admin	2625	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/042.png	1	f	2018-11-16 05:59:53.594033	\N	\N	\N
48	1	admin	2628	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/044.png	1	f	2018-11-16 05:59:53.59759	\N	\N	\N
49	1	admin	2629	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/045.png	1	f	2018-11-16 05:59:53.599462	\N	\N	\N
50	1	admin	2630	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/046.png	1	f	2018-11-16 05:59:53.649545	\N	\N	\N
51	1	admin	2631	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/047.png	1	f	2018-11-16 05:59:53.652178	\N	\N	\N
52	1	admin	2632	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/048.png	1	f	2018-11-16 05:59:53.664607	\N	\N	\N
53	1	admin	2634	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/050.png	1	f	2018-11-16 05:59:53.677243	\N	\N	\N
54	1	admin	2635	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/049.png	1	f	2018-11-16 05:59:53.677965	\N	\N	\N
55	1	admin	2633	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/051.png	1	f	2018-11-16 05:59:53.701904	\N	\N	\N
65	1	admin	2645	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/060.png	1	f	2018-11-16 05:59:53.815654	\N	\N	\N
74	1	admin	2656	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/070.png	1	f	2018-11-16 05:59:53.923664	\N	\N	\N
83	1	admin	2664	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/080.png	1	f	2018-11-16 05:59:54.034817	\N	\N	\N
94	1	admin	2674	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/089.png	1	f	2018-11-16 05:59:54.21718	\N	\N	\N
102	1	admin	2681	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/099.png	1	f	2018-11-16 05:59:54.328852	\N	\N	\N
111	1	admin	2691	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/107.png	1	f	2018-11-16 05:59:54.472296	\N	\N	\N
121	1	admin	2702	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/117.png	1	f	2018-11-16 05:59:54.586392	\N	\N	\N
131	1	admin	2711	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/127.png	1	f	2018-11-16 05:59:54.700741	\N	\N	\N
141	1	admin	2721	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/137.png	1	f	2018-11-16 05:59:54.811198	\N	\N	\N
151	1	admin	2730	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/146.png	1	f	2018-11-16 05:59:54.922115	\N	\N	\N
161	1	admin	2740	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/156.png	1	f	2018-11-16 05:59:55.037279	\N	\N	\N
168	1	admin	2747	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/164.png	1	f	2018-11-16 05:59:55.145495	\N	\N	\N
179	1	admin	2757	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/173.png	1	f	2018-11-16 05:59:55.266334	\N	\N	\N
188	1	admin	2766	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/182.png	1	f	2018-11-16 05:59:55.375761	\N	\N	\N
197	1	admin	2776	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/192.png	1	f	2018-11-16 05:59:55.491413	\N	\N	\N
205	1	admin	2795	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/209.png	1	f	2018-11-16 05:59:55.602794	\N	\N	\N
214	1	admin	2823	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/239.png	1	f	2018-11-16 05:59:55.713556	\N	\N	\N
224	1	admin	2858	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/274.png	1	f	2018-11-16 05:59:55.82332	\N	\N	\N
233	1	admin	2894	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/310.png	1	f	2018-11-16 05:59:55.936753	\N	\N	\N
241	1	admin	2935	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/351.png	1	f	2018-11-16 05:59:56.055022	\N	\N	\N
250	1	admin	3274	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/384.png	1	f	2018-11-16 05:59:56.166144	\N	\N	\N
259	1	admin	3235	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/423.png	1	f	2018-11-16 05:59:56.267123	\N	\N	\N
269	1	admin	3203	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/455.png	1	f	2018-11-16 05:59:56.380923	\N	\N	\N
279	1	admin	2948	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/500.png	1	f	2018-11-16 05:59:56.488858	\N	\N	\N
289	1	admin	2977	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/530.png	1	f	2018-11-16 05:59:56.598879	\N	\N	\N
299	1	admin	3015	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/567.png	1	f	2018-11-16 05:59:56.717837	\N	\N	\N
309	1	admin	3053	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/605.png	1	f	2018-11-16 05:59:56.847145	\N	\N	\N
320	1	admin	3084	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/636.png	1	f	2018-11-16 05:59:56.957413	\N	\N	\N
328	1	admin	3124	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/675.png	1	f	2018-11-16 05:59:57.06746	\N	\N	\N
338	1	admin	3184	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/474.png	1	f	2018-11-16 05:59:57.185461	\N	\N	\N
346	1	admin	3196	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/461.png	1	f	2018-11-16 05:59:57.294806	\N	\N	\N
356	1	admin	3211	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/447.png	1	f	2018-11-16 05:59:57.414582	\N	\N	\N
366	1	admin	3225	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/433.png	1	f	2018-11-16 05:59:57.525095	\N	\N	\N
376	1	admin	3236	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/420.png	1	f	2018-11-16 05:59:57.641024	\N	\N	\N
387	1	admin	3251	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/406.png	1	f	2018-11-16 05:59:57.762875	\N	\N	\N
396	1	admin	3264	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/394.png	1	f	2018-11-16 05:59:57.87615	\N	\N	\N
406	1	admin	3277	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/381.png	1	f	2018-11-16 05:59:57.986551	\N	\N	\N
415	1	admin	3290	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/368.png	1	f	2018-11-16 05:59:58.096455	\N	\N	\N
424	1	admin	3301	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/356.png	1	f	2018-11-16 05:59:58.214073	\N	\N	\N
433	1	admin	2928	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/344.png	1	f	2018-11-16 05:59:58.321309	\N	\N	\N
443	1	admin	2916	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/332.png	1	f	2018-11-16 05:59:58.444557	\N	\N	\N
452	1	admin	2904	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/320.png	1	f	2018-11-16 05:59:58.552023	\N	\N	\N
461	1	admin	2891	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/307.png	1	f	2018-11-16 05:59:58.663328	\N	\N	\N
470	1	admin	2878	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/295.png	1	f	2018-11-16 05:59:58.775403	\N	\N	\N
478	1	admin	2871	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/287.png	1	f	2018-11-16 05:59:58.883247	\N	\N	\N
487	1	admin	2861	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/276.png	1	f	2018-11-16 05:59:58.995173	\N	\N	\N
498	1	admin	2844	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/260.png	1	f	2018-11-16 05:59:59.112335	\N	\N	\N
508	1	admin	2829	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/246.png	1	f	2018-11-16 05:59:59.239389	\N	\N	\N
517	1	admin	2817	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/233.png	1	f	2018-11-16 05:59:59.350802	\N	\N	\N
526	1	admin	2804	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/220.png	1	f	2018-11-16 05:59:59.46098	\N	\N	\N
536	1	admin	2791	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/207.png	1	f	2018-11-16 05:59:59.570304	\N	\N	\N
544	1	admin	3308	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/803.png	1	f	2018-11-16 05:59:59.68046	\N	\N	\N
554	1	admin	3165	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/794.png	1	f	2018-11-16 05:59:59.791896	\N	\N	\N
564	1	admin	3321	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/784.png	1	f	2018-11-16 05:59:59.901945	\N	\N	\N
572	1	admin	3329	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/774.png	1	f	2018-11-16 06:00:00.010766	\N	\N	\N
582	1	admin	3335	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/766.png	1	f	2018-11-16 06:00:00.118898	\N	\N	\N
592	1	admin	3155	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/756.png	1	f	2018-11-16 06:00:00.226045	\N	\N	\N
56	1	admin	2636	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/052.png	1	f	2018-11-16 05:59:53.707713	\N	\N	\N
64	1	admin	2644	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/061.png	1	f	2018-11-16 05:59:53.813723	\N	\N	\N
75	1	admin	2654	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/071.png	1	f	2018-11-16 05:59:53.924575	\N	\N	\N
84	1	admin	2666	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/081.png	1	f	2018-11-16 05:59:54.037977	\N	\N	\N
93	1	admin	2673	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/090.png	1	f	2018-11-16 05:59:54.214244	\N	\N	\N
104	1	admin	2684	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/100.png	1	f	2018-11-16 05:59:54.348906	\N	\N	\N
112	1	admin	2694	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/110.png	1	f	2018-11-16 05:59:54.486423	\N	\N	\N
122	1	admin	2701	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/118.png	1	f	2018-11-16 05:59:54.595601	\N	\N	\N
132	1	admin	2712	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/128.png	1	f	2018-11-16 05:59:54.706351	\N	\N	\N
142	1	admin	2723	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/138.png	1	f	2018-11-16 05:59:54.813167	\N	\N	\N
152	1	admin	2732	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/148.png	1	f	2018-11-16 05:59:54.927556	\N	\N	\N
162	1	admin	2741	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/158.png	1	f	2018-11-16 05:59:55.039022	\N	\N	\N
169	1	admin	2751	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/167.png	1	f	2018-11-16 05:59:55.152387	\N	\N	\N
177	1	admin	2761	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/174.png	1	f	2018-11-16 05:59:55.2634	\N	\N	\N
186	1	admin	2767	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/183.png	1	f	2018-11-16 05:59:55.372859	\N	\N	\N
196	1	admin	2777	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/193.png	1	f	2018-11-16 05:59:55.488536	\N	\N	\N
204	1	admin	2796	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/213.png	1	f	2018-11-16 05:59:55.599878	\N	\N	\N
213	1	admin	2826	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/242.png	1	f	2018-11-16 05:59:55.710615	\N	\N	\N
222	1	admin	2860	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/277.png	1	f	2018-11-16 05:59:55.81995	\N	\N	\N
232	1	admin	2898	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/314.png	1	f	2018-11-16 05:59:55.933861	\N	\N	\N
243	1	admin	3303	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/355.png	1	f	2018-11-16 05:59:56.088667	\N	\N	\N
253	1	admin	3263	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/395.png	1	f	2018-11-16 05:59:56.199334	\N	\N	\N
262	1	admin	3221	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/435.png	1	f	2018-11-16 05:59:56.310585	\N	\N	\N
274	1	admin	3179	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/478.png	1	f	2018-11-16 05:59:56.423102	\N	\N	\N
284	1	admin	2960	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/511.png	1	f	2018-11-16 05:59:56.535034	\N	\N	\N
294	1	admin	2997	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/548.png	1	f	2018-11-16 05:59:56.644201	\N	\N	\N
304	1	admin	3035	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/585.png	1	f	2018-11-16 05:59:56.757234	\N	\N	\N
337	1	admin	3185	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/473.png	1	f	2018-11-16 05:59:57.183568	\N	\N	\N
347	1	admin	3199	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/459.png	1	f	2018-11-16 05:59:57.306878	\N	\N	\N
357	1	admin	3212	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/446.png	1	f	2018-11-16 05:59:57.41841	\N	\N	\N
367	1	admin	3226	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/432.png	1	f	2018-11-16 05:59:57.530824	\N	\N	\N
377	1	admin	3241	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/418.png	1	f	2018-11-16 05:59:57.642134	\N	\N	\N
386	1	admin	3253	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/405.png	1	f	2018-11-16 05:59:57.759951	\N	\N	\N
395	1	admin	3266	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/392.png	1	f	2018-11-16 05:59:57.873251	\N	\N	\N
404	1	admin	3278	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/379.png	1	f	2018-11-16 05:59:57.983221	\N	\N	\N
414	1	admin	3292	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/366.png	1	f	2018-11-16 05:59:58.093549	\N	\N	\N
425	1	admin	3304	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/354.png	1	f	2018-11-16 05:59:58.218196	\N	\N	\N
434	1	admin	2924	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/342.png	1	f	2018-11-16 05:59:58.326822	\N	\N	\N
442	1	admin	2915	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/331.png	1	f	2018-11-16 05:59:58.441667	\N	\N	\N
451	1	admin	2903	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/319.png	1	f	2018-11-16 05:59:58.549113	\N	\N	\N
463	1	admin	2890	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/306.png	1	f	2018-11-16 05:59:58.674719	\N	\N	\N
473	1	admin	2877	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/292.png	1	f	2018-11-16 05:59:58.788202	\N	\N	\N
482	1	admin	2866	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/282.png	1	f	2018-11-16 05:59:58.904212	\N	\N	\N
490	1	admin	2853	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/269.png	1	f	2018-11-16 05:59:59.013948	\N	\N	\N
500	1	admin	2841	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/256.png	1	f	2018-11-16 05:59:59.124607	\N	\N	\N
507	1	admin	2827	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/243.png	1	f	2018-11-16 05:59:59.238204	\N	\N	\N
516	1	admin	2815	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/231.png	1	f	2018-11-16 05:59:59.349639	\N	\N	\N
525	1	admin	2803	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/219.png	1	f	2018-11-16 05:59:59.45806	\N	\N	\N
535	1	admin	2789	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/205.png	1	f	2018-11-16 05:59:59.567913	\N	\N	\N
545	1	admin	3169	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/802.png	1	f	2018-11-16 05:59:59.682968	\N	\N	\N
555	1	admin	3316	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/792.png	1	f	2018-11-16 05:59:59.79602	\N	\N	\N
565	1	admin	3162	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/783.png	1	f	2018-11-16 05:59:59.912615	\N	\N	\N
575	1	admin	3331	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/773.png	1	f	2018-11-16 06:00:00.023933	\N	\N	\N
585	1	admin	3337	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/763.png	1	f	2018-11-16 06:00:00.136471	\N	\N	\N
593	1	admin	3343	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/754.png	1	f	2018-11-16 06:00:00.262905	\N	\N	\N
604	1	admin	3150	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/745.png	1	f	2018-11-16 06:00:00.383551	\N	\N	\N
614	1	admin	3362	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/734.png	1	f	2018-11-16 06:00:00.499534	\N	\N	\N
624	1	admin	3366	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/724.png	1	f	2018-11-16 06:00:00.62732	\N	\N	\N
57	1	admin	2637	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/053.png	1	f	2018-11-16 05:59:53.709355	\N	\N	\N
66	1	admin	2646	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/062.png	1	f	2018-11-16 05:59:53.823501	\N	\N	\N
76	1	admin	2657	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/072.png	1	f	2018-11-16 05:59:53.936142	\N	\N	\N
86	1	admin	2665	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/082.png	1	f	2018-11-16 05:59:54.052347	\N	\N	\N
95	1	admin	2676	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/092.png	1	f	2018-11-16 05:59:54.232668	\N	\N	\N
105	1	admin	2686	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/101.png	1	f	2018-11-16 05:59:54.34971	\N	\N	\N
113	1	admin	2695	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/111.png	1	f	2018-11-16 05:59:54.487247	\N	\N	\N
123	1	admin	2703	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/119.png	1	f	2018-11-16 05:59:54.596441	\N	\N	\N
133	1	admin	2713	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/129.png	1	f	2018-11-16 05:59:54.707202	\N	\N	\N
143	1	admin	2724	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/139.png	1	f	2018-11-16 05:59:54.819445	\N	\N	\N
153	1	admin	2734	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/149.png	1	f	2018-11-16 05:59:54.931782	\N	\N	\N
163	1	admin	2742	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/159.png	1	f	2018-11-16 05:59:55.0399	\N	\N	\N
170	1	admin	2752	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/168.png	1	f	2018-11-16 05:59:55.153221	\N	\N	\N
178	1	admin	2760	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/175.png	1	f	2018-11-16 05:59:55.264212	\N	\N	\N
187	1	admin	2768	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/184.png	1	f	2018-11-16 05:59:55.373702	\N	\N	\N
221	1	admin	2850	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/266.png	1	f	2018-11-16 05:59:55.810525	\N	\N	\N
231	1	admin	2889	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/305.png	1	f	2018-11-16 05:59:55.926004	\N	\N	\N
240	1	admin	2930	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/347.png	1	f	2018-11-16 05:59:56.052974	\N	\N	\N
251	1	admin	3267	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/391.png	1	f	2018-11-16 05:59:56.179744	\N	\N	\N
261	1	admin	3231	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/427.png	1	f	2018-11-16 05:59:56.289516	\N	\N	\N
271	1	admin	3194	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/464.png	1	f	2018-11-16 05:59:56.405722	\N	\N	\N
280	1	admin	2941	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/493.png	1	f	2018-11-16 05:59:56.513746	\N	\N	\N
290	1	admin	2982	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/534.png	1	f	2018-11-16 05:59:56.625286	\N	\N	\N
300	1	admin	3020	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/571.png	1	f	2018-11-16 05:59:56.737998	\N	\N	\N
310	1	admin	3056	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/608.png	1	f	2018-11-16 05:59:56.848705	\N	\N	\N
321	1	admin	3094	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/646.png	1	f	2018-11-16 05:59:56.964103	\N	\N	\N
330	1	admin	3133	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/684.png	1	f	2018-11-16 05:59:57.083257	\N	\N	\N
340	1	admin	3188	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/470.png	1	f	2018-11-16 05:59:57.192625	\N	\N	\N
349	1	admin	3202	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/456.png	1	f	2018-11-16 05:59:57.319047	\N	\N	\N
358	1	admin	3213	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/443.png	1	f	2018-11-16 05:59:57.422946	\N	\N	\N
368	1	admin	3228	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/430.png	1	f	2018-11-16 05:59:57.536187	\N	\N	\N
378	1	admin	3240	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/417.png	1	f	2018-11-16 05:59:57.646362	\N	\N	\N
388	1	admin	3255	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/403.png	1	f	2018-11-16 05:59:57.7674	\N	\N	\N
397	1	admin	3268	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/390.png	1	f	2018-11-16 05:59:57.881184	\N	\N	\N
407	1	admin	3280	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/378.png	1	f	2018-11-16 05:59:57.994186	\N	\N	\N
417	1	admin	3293	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/365.png	1	f	2018-11-16 05:59:58.104574	\N	\N	\N
426	1	admin	2936	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/352.png	1	f	2018-11-16 05:59:58.226815	\N	\N	\N
435	1	admin	2925	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/341.png	1	f	2018-11-16 05:59:58.339906	\N	\N	\N
444	1	admin	2914	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/329.png	1	f	2018-11-16 05:59:58.450533	\N	\N	\N
455	1	admin	2900	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/316.png	1	f	2018-11-16 05:59:58.566808	\N	\N	\N
466	1	admin	2887	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/302.png	1	f	2018-11-16 05:59:58.687489	\N	\N	\N
474	1	admin	2845	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/261.png	1	f	2018-11-16 05:59:58.801856	\N	\N	\N
483	1	admin	2865	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/280.png	1	f	2018-11-16 05:59:58.911214	\N	\N	\N
492	1	admin	2852	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/268.png	1	f	2018-11-16 05:59:59.02306	\N	\N	\N
502	1	admin	2837	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/253.png	1	f	2018-11-16 05:59:59.135288	\N	\N	\N
510	1	admin	2824	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/240.png	1	f	2018-11-16 05:59:59.245252	\N	\N	\N
518	1	admin	2813	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/229.png	1	f	2018-11-16 05:59:59.358083	\N	\N	\N
527	1	admin	2802	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/218.png	1	f	2018-11-16 05:59:59.479773	\N	\N	\N
537	1	admin	2786	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/203.png	1	f	2018-11-16 05:59:59.589899	\N	\N	\N
547	1	admin	3310	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/801.png	1	f	2018-11-16 05:59:59.704972	\N	\N	\N
557	1	admin	3164	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/791.png	1	f	2018-11-16 05:59:59.818151	\N	\N	\N
567	1	admin	3324	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/781.png	1	f	2018-11-16 05:59:59.937505	\N	\N	\N
577	1	admin	3159	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/771.png	1	f	2018-11-16 06:00:00.050084	\N	\N	\N
587	1	admin	3338	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/761.png	1	f	2018-11-16 06:00:00.163348	\N	\N	\N
597	1	admin	3345	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/751.png	1	f	2018-11-16 06:00:00.274952	\N	\N	\N
606	1	admin	3149	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/741.png	1	f	2018-11-16 06:00:00.39918	\N	\N	\N
616	1	admin	3359	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/732.png	1	f	2018-11-16 06:00:00.521551	\N	\N	\N
627	1	admin	3367	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/722.png	1	f	2018-11-16 06:00:00.6423	\N	\N	\N
58	1	admin	2638	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/054.png	1	f	2018-11-16 05:59:53.725308	\N	\N	\N
68	1	admin	2648	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/064.png	1	f	2018-11-16 05:59:53.841901	\N	\N	\N
78	1	admin	2660	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/074.png	1	f	2018-11-16 05:59:53.969707	\N	\N	\N
88	1	admin	2668	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/084.png	1	f	2018-11-16 05:59:54.101559	\N	\N	\N
98	1	admin	2678	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/094.png	1	f	2018-11-16 05:59:54.274472	\N	\N	\N
108	1	admin	2687	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/104.png	1	f	2018-11-16 05:59:54.461528	\N	\N	\N
120	1	admin	2698	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/114.png	1	f	2018-11-16 05:59:54.574874	\N	\N	\N
130	1	admin	2710	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/126.png	1	f	2018-11-16 05:59:54.691013	\N	\N	\N
140	1	admin	2720	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/136.png	1	f	2018-11-16 05:59:54.808893	\N	\N	\N
150	1	admin	2731	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/147.png	1	f	2018-11-16 05:59:54.921509	\N	\N	\N
160	1	admin	2743	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/157.png	1	f	2018-11-16 05:59:55.036839	\N	\N	\N
171	1	admin	2750	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/166.png	1	f	2018-11-16 05:59:55.155078	\N	\N	\N
180	1	admin	2758	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/176.png	1	f	2018-11-16 05:59:55.26723	\N	\N	\N
189	1	admin	2769	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/185.png	1	f	2018-11-16 05:59:55.385641	\N	\N	\N
198	1	admin	2778	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/194.png	1	f	2018-11-16 05:59:55.518654	\N	\N	\N
207	1	admin	2801	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/217.png	1	f	2018-11-16 05:59:55.633424	\N	\N	\N
216	1	admin	2832	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/248.png	1	f	2018-11-16 05:59:55.751548	\N	\N	\N
226	1	admin	2869	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/285.png	1	f	2018-11-16 05:59:55.865377	\N	\N	\N
235	1	admin	2910	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/326.png	1	f	2018-11-16 05:59:55.981216	\N	\N	\N
245	1	admin	3295	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/363.png	1	f	2018-11-16 05:59:56.095532	\N	\N	\N
257	1	admin	3247	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/411.png	1	f	2018-11-16 05:59:56.212033	\N	\N	\N
266	1	admin	3209	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/448.png	1	f	2018-11-16 05:59:56.325579	\N	\N	\N
277	1	admin	3176	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/482.png	1	f	2018-11-16 05:59:56.442649	\N	\N	\N
287	1	admin	2972	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/523.png	1	f	2018-11-16 05:59:56.581705	\N	\N	\N
297	1	admin	3007	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/560.png	1	f	2018-11-16 05:59:56.696859	\N	\N	\N
307	1	admin	3044	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/597.png	1	f	2018-11-16 05:59:56.827311	\N	\N	\N
316	1	admin	3075	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/629.png	1	f	2018-11-16 05:59:56.943503	\N	\N	\N
326	1	admin	3112	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/663.png	1	f	2018-11-16 05:59:57.05933	\N	\N	\N
336	1	admin	3182	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/476.png	1	f	2018-11-16 05:59:57.176086	\N	\N	\N
348	1	admin	3200	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/458.png	1	f	2018-11-16 05:59:57.309603	\N	\N	\N
359	1	admin	3216	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/444.png	1	f	2018-11-16 05:59:57.424841	\N	\N	\N
369	1	admin	3229	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/429.png	1	f	2018-11-16 05:59:57.538029	\N	\N	\N
379	1	admin	3242	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/416.png	1	f	2018-11-16 05:59:57.653073	\N	\N	\N
389	1	admin	3256	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/402.png	1	f	2018-11-16 05:59:57.779555	\N	\N	\N
399	1	admin	3269	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/389.png	1	f	2018-11-16 05:59:57.895168	\N	\N	\N
410	1	admin	3282	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/376.png	1	f	2018-11-16 05:59:58.011275	\N	\N	\N
421	1	admin	3297	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/361.png	1	f	2018-11-16 05:59:58.151358	\N	\N	\N
430	1	admin	2934	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/348.png	1	f	2018-11-16 05:59:58.273318	\N	\N	\N
439	1	admin	2920	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/336.png	1	f	2018-11-16 05:59:58.386334	\N	\N	\N
448	1	admin	2908	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/324.png	1	f	2018-11-16 05:59:58.50563	\N	\N	\N
458	1	admin	2895	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/311.png	1	f	2018-11-16 05:59:58.622293	\N	\N	\N
494	1	admin	2849	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/265.png	1	f	2018-11-16 05:59:59.056899	\N	\N	\N
504	1	admin	2834	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/250.png	1	f	2018-11-16 05:59:59.17194	\N	\N	\N
513	1	admin	2822	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/237.png	1	f	2018-11-16 05:59:59.285222	\N	\N	\N
521	1	admin	2809	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/224.png	1	f	2018-11-16 05:59:59.397104	\N	\N	\N
529	1	admin	2798	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/214.png	1	f	2018-11-16 05:59:59.511697	\N	\N	\N
538	1	admin	2784	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/200.png	1	f	2018-11-16 05:59:59.623678	\N	\N	\N
549	1	admin	3309	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/799.png	1	f	2018-11-16 05:59:59.736591	\N	\N	\N
561	1	admin	3163	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/787.png	1	f	2018-11-16 05:59:59.861315	\N	\N	\N
571	1	admin	3326	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/777.png	1	f	2018-11-16 05:59:59.977933	\N	\N	\N
581	1	admin	3158	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/767.png	1	f	2018-11-16 06:00:00.103336	\N	\N	\N
601	1	admin	3349	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/747.png	1	f	2018-11-16 06:00:00.330584	\N	\N	\N
611	1	admin	3151	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/737.png	1	f	2018-11-16 06:00:00.445809	\N	\N	\N
621	1	admin	3364	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/727.png	1	f	2018-11-16 06:00:00.569921	\N	\N	\N
631	1	admin	3372	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/716.png	1	f	2018-11-16 06:00:00.681943	\N	\N	\N
640	1	admin	3142	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/706.png	1	f	2018-11-16 06:00:00.795808	\N	\N	\N
653	1	admin	3387	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/696.png	1	f	2018-11-16 06:00:00.92275	\N	\N	\N
59	1	admin	2639	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/055.png	1	f	2018-11-16 05:59:53.770641	\N	\N	\N
69	1	admin	2649	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/065.png	1	f	2018-11-16 05:59:53.888074	\N	\N	\N
80	1	admin	2658	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/075.png	1	f	2018-11-16 05:59:54.009288	\N	\N	\N
92	1	admin	2670	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/087.png	1	f	2018-11-16 05:59:54.207952	\N	\N	\N
103	1	admin	2683	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/098.png	1	f	2018-11-16 05:59:54.333433	\N	\N	\N
115	1	admin	2693	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/109.png	1	f	2018-11-16 05:59:54.493858	\N	\N	\N
125	1	admin	2706	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/122.png	1	f	2018-11-16 05:59:54.614432	\N	\N	\N
136	1	admin	2716	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/132.png	1	f	2018-11-16 05:59:54.749662	\N	\N	\N
146	1	admin	2726	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/142.png	1	f	2018-11-16 05:59:54.870777	\N	\N	\N
155	1	admin	2737	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/152.png	1	f	2018-11-16 05:59:54.990612	\N	\N	\N
167	1	admin	2744	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/161.png	1	f	2018-11-16 05:59:55.127243	\N	\N	\N
176	1	admin	2756	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/172.png	1	f	2018-11-16 05:59:55.246406	\N	\N	\N
185	1	admin	2764	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/181.png	1	f	2018-11-16 05:59:55.364683	\N	\N	\N
195	1	admin	2775	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/191.png	1	f	2018-11-16 05:59:55.485196	\N	\N	\N
206	1	admin	2790	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/206.png	1	f	2018-11-16 05:59:55.607345	\N	\N	\N
215	1	admin	2831	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/245.png	1	f	2018-11-16 05:59:55.72629	\N	\N	\N
225	1	admin	2864	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/281.png	1	f	2018-11-16 05:59:55.846921	\N	\N	\N
236	1	admin	2907	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/322.png	1	f	2018-11-16 05:59:55.986017	\N	\N	\N
248	1	admin	3291	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/367.png	1	f	2018-11-16 05:59:56.106084	\N	\N	\N
258	1	admin	3243	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/415.png	1	f	2018-11-16 05:59:56.229382	\N	\N	\N
268	1	admin	3205	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/452.png	1	f	2018-11-16 05:59:56.349919	\N	\N	\N
278	1	admin	2950	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/504.png	1	f	2018-11-16 05:59:56.468545	\N	\N	\N
288	1	admin	2975	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/527.png	1	f	2018-11-16 05:59:56.591505	\N	\N	\N
298	1	admin	3011	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/563.png	1	f	2018-11-16 05:59:56.711065	\N	\N	\N
308	1	admin	3049	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/601.png	1	f	2018-11-16 05:59:56.832044	\N	\N	\N
319	1	admin	3072	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/632.png	1	f	2018-11-16 05:59:56.954211	\N	\N	\N
329	1	admin	3128	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/679.png	1	f	2018-11-16 05:59:57.072015	\N	\N	\N
339	1	admin	3187	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/472.png	1	f	2018-11-16 05:59:57.191023	\N	\N	\N
350	1	admin	3201	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/457.png	1	f	2018-11-16 05:59:57.325695	\N	\N	\N
360	1	admin	3215	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/442.png	1	f	2018-11-16 05:59:57.449004	\N	\N	\N
370	1	admin	3230	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/428.png	1	f	2018-11-16 05:59:57.565858	\N	\N	\N
380	1	admin	3246	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/414.png	1	f	2018-11-16 05:59:57.687	\N	\N	\N
391	1	admin	3259	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/399.png	1	f	2018-11-16 05:59:57.810659	\N	\N	\N
402	1	admin	3271	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/386.png	1	f	2018-11-16 05:59:57.929402	\N	\N	\N
413	1	admin	3287	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/372.png	1	f	2018-11-16 05:59:58.047917	\N	\N	\N
423	1	admin	3302	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/357.png	1	f	2018-11-16 05:59:58.165216	\N	\N	\N
432	1	admin	2929	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/345.png	1	f	2018-11-16 05:59:58.283671	\N	\N	\N
441	1	admin	2917	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/333.png	1	f	2018-11-16 05:59:58.402567	\N	\N	\N
450	1	admin	2905	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/321.png	1	f	2018-11-16 05:59:58.516447	\N	\N	\N
460	1	admin	2892	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/308.png	1	f	2018-11-16 05:59:58.651825	\N	\N	\N
469	1	admin	2880	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/296.png	1	f	2018-11-16 05:59:58.771485	\N	\N	\N
480	1	admin	2868	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/284.png	1	f	2018-11-16 05:59:58.898492	\N	\N	\N
491	1	admin	2855	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/271.png	1	f	2018-11-16 05:59:59.014991	\N	\N	\N
501	1	admin	2840	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/254.png	1	f	2018-11-16 05:59:59.132293	\N	\N	\N
511	1	admin	2825	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/241.png	1	f	2018-11-16 05:59:59.245753	\N	\N	\N
520	1	admin	2811	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/227.png	1	f	2018-11-16 05:59:59.364984	\N	\N	\N
530	1	admin	2799	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/215.png	1	f	2018-11-16 05:59:59.515654	\N	\N	\N
542	1	admin	3306	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/807.png	1	f	2018-11-16 05:59:59.644302	\N	\N	\N
552	1	admin	3314	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/796.png	1	f	2018-11-16 05:59:59.764216	\N	\N	\N
562	1	admin	3322	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/786.png	1	f	2018-11-16 05:59:59.88279	\N	\N	\N
573	1	admin	3328	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/776.png	1	f	2018-11-16 06:00:00.014561	\N	\N	\N
583	1	admin	3336	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/765.png	1	f	2018-11-16 06:00:00.134492	\N	\N	\N
594	1	admin	3342	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/755.png	1	f	2018-11-16 06:00:00.270345	\N	\N	\N
605	1	admin	3352	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/743.png	1	f	2018-11-16 06:00:00.392039	\N	\N	\N
615	1	admin	3152	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/733.png	1	f	2018-11-16 06:00:00.517499	\N	\N	\N
625	1	admin	3368	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/723.png	1	f	2018-11-16 06:00:00.639479	\N	\N	\N
637	1	admin	3374	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/712.png	1	f	2018-11-16 06:00:00.786188	\N	\N	\N
648	1	admin	3384	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/701.png	1	f	2018-11-16 06:00:00.904758	\N	\N	\N
60	1	admin	2643	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/059.png	1	f	2018-11-16 05:59:53.793275	\N	\N	\N
71	1	admin	2650	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/067.png	1	f	2018-11-16 05:59:53.899073	\N	\N	\N
81	1	admin	2661	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/077.png	1	f	2018-11-16 05:59:54.009848	\N	\N	\N
89	1	admin	2669	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/086.png	1	f	2018-11-16 05:59:54.198463	\N	\N	\N
100	1	admin	2680	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/096.png	1	f	2018-11-16 05:59:54.314877	\N	\N	\N
109	1	admin	2690	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/106.png	1	f	2018-11-16 05:59:54.467319	\N	\N	\N
119	1	admin	2700	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/116.png	1	f	2018-11-16 05:59:54.574373	\N	\N	\N
128	1	admin	2709	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/125.png	1	f	2018-11-16 05:59:54.679448	\N	\N	\N
138	1	admin	2719	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/135.png	1	f	2018-11-16 05:59:54.790249	\N	\N	\N
147	1	admin	2727	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/144.png	1	f	2018-11-16 05:59:54.897091	\N	\N	\N
158	1	admin	2738	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/154.png	1	f	2018-11-16 05:59:55.003557	\N	\N	\N
165	1	admin	2748	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/163.png	1	f	2018-11-16 05:59:55.11796	\N	\N	\N
175	1	admin	2755	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/171.png	1	f	2018-11-16 05:59:55.236856	\N	\N	\N
183	1	admin	2765	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/180.png	1	f	2018-11-16 05:59:55.341076	\N	\N	\N
193	1	admin	2773	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/189.png	1	f	2018-11-16 05:59:55.446569	\N	\N	\N
201	1	admin	2781	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/198.png	1	f	2018-11-16 05:59:55.556985	\N	\N	\N
210	1	admin	2812	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/228.png	1	f	2018-11-16 05:59:55.663902	\N	\N	\N
219	1	admin	2842	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/258.png	1	f	2018-11-16 05:59:55.779691	\N	\N	\N
227	1	admin	2876	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/293.png	1	f	2018-11-16 05:59:55.884048	\N	\N	\N
238	1	admin	2919	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/335.png	1	f	2018-11-16 05:59:55.991861	\N	\N	\N
246	1	admin	3283	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/375.png	1	f	2018-11-16 05:59:56.097547	\N	\N	\N
254	1	admin	3252	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/407.png	1	f	2018-11-16 05:59:56.207245	\N	\N	\N
265	1	admin	3218	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/441.png	1	f	2018-11-16 05:59:56.312528	\N	\N	\N
272	1	admin	3183	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/475.png	1	f	2018-11-16 05:59:56.418353	\N	\N	\N
282	1	admin	3168	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/489.png	1	f	2018-11-16 05:59:56.529991	\N	\N	\N
292	1	admin	2990	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/542.png	1	f	2018-11-16 05:59:56.63576	\N	\N	\N
302	1	admin	3022	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/574.png	1	f	2018-11-16 05:59:56.745957	\N	\N	\N
312	1	admin	3065	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/616.png	1	f	2018-11-16 05:59:56.84947	\N	\N	\N
318	1	admin	3090	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/643.png	1	f	2018-11-16 05:59:56.953047	\N	\N	\N
327	1	admin	3119	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/671.png	1	f	2018-11-16 05:59:57.05983	\N	\N	\N
335	1	admin	3181	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/477.png	1	f	2018-11-16 05:59:57.171275	\N	\N	\N
345	1	admin	3197	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/462.png	1	f	2018-11-16 05:59:57.275913	\N	\N	\N
354	1	admin	3210	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/449.png	1	f	2018-11-16 05:59:57.382054	\N	\N	\N
364	1	admin	3222	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/436.png	1	f	2018-11-16 05:59:57.50081	\N	\N	\N
374	1	admin	3234	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/422.png	1	f	2018-11-16 05:59:57.618042	\N	\N	\N
383	1	admin	3249	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/409.png	1	f	2018-11-16 05:59:57.726721	\N	\N	\N
393	1	admin	3261	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/397.png	1	f	2018-11-16 05:59:57.832788	\N	\N	\N
403	1	admin	3275	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/383.png	1	f	2018-11-16 05:59:57.937535	\N	\N	\N
412	1	admin	3288	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/370.png	1	f	2018-11-16 05:59:58.040563	\N	\N	\N
420	1	admin	3298	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/360.png	1	f	2018-11-16 05:59:58.146596	\N	\N	\N
429	1	admin	2931	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/349.png	1	f	2018-11-16 05:59:58.268518	\N	\N	\N
438	1	admin	2921	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/337.png	1	f	2018-11-16 05:59:58.370944	\N	\N	\N
447	1	admin	2909	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/325.png	1	f	2018-11-16 05:59:58.477947	\N	\N	\N
456	1	admin	2896	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/312.png	1	f	2018-11-16 05:59:58.582348	\N	\N	\N
465	1	admin	2884	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/300.png	1	f	2018-11-16 05:59:58.68468	\N	\N	\N
472	1	admin	2875	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/291.png	1	f	2018-11-16 05:59:58.787709	\N	\N	\N
481	1	admin	2867	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/283.png	1	f	2018-11-16 05:59:58.902124	\N	\N	\N
489	1	admin	2856	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/272.png	1	f	2018-11-16 05:59:59.005483	\N	\N	\N
497	1	admin	2839	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/257.png	1	f	2018-11-16 05:59:59.110994	\N	\N	\N
531	1	admin	2793	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/211.png	1	f	2018-11-16 05:59:59.520192	\N	\N	\N
540	1	admin	2783	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/199.png	1	f	2018-11-16 05:59:59.632054	\N	\N	\N
550	1	admin	3166	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/798.png	1	f	2018-11-16 05:59:59.737032	\N	\N	\N
558	1	admin	3318	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/789.png	1	f	2018-11-16 05:59:59.848223	\N	\N	\N
568	1	admin	3161	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/779.png	1	f	2018-11-16 05:59:59.954973	\N	\N	\N
578	1	admin	3333	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/769.png	1	f	2018-11-16 06:00:00.058559	\N	\N	\N
589	1	admin	3341	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/759.png	1	f	2018-11-16 06:00:00.176821	\N	\N	\N
598	1	admin	3153	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/749.png	1	f	2018-11-16 06:00:00.285663	\N	\N	\N
608	1	admin	3356	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/740.png	1	f	2018-11-16 06:00:00.407851	\N	\N	\N
61	1	admin	2641	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/058.png	1	f	2018-11-16 05:59:53.793871	\N	\N	\N
70	1	admin	2651	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/066.png	1	f	2018-11-16 05:59:53.898589	\N	\N	\N
79	1	admin	2659	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/076.png	1	f	2018-11-16 05:59:54.000388	\N	\N	\N
90	1	admin	2671	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/085.png	1	f	2018-11-16 05:59:54.198999	\N	\N	\N
99	1	admin	2679	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/095.png	1	f	2018-11-16 05:59:54.305516	\N	\N	\N
110	1	admin	2689	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/105.png	1	f	2018-11-16 05:59:54.467913	\N	\N	\N
118	1	admin	2699	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/115.png	1	f	2018-11-16 05:59:54.573792	\N	\N	\N
129	1	admin	2708	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/124.png	1	f	2018-11-16 05:59:54.679942	\N	\N	\N
139	1	admin	2717	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/134.png	1	f	2018-11-16 05:59:54.790728	\N	\N	\N
148	1	admin	2728	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/143.png	1	f	2018-11-16 05:59:54.897599	\N	\N	\N
157	1	admin	2736	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/153.png	1	f	2018-11-16 05:59:55.000772	\N	\N	\N
166	1	admin	2746	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/162.png	1	f	2018-11-16 05:59:55.118457	\N	\N	\N
173	1	admin	2754	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/170.png	1	f	2018-11-16 05:59:55.222608	\N	\N	\N
182	1	admin	2762	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/178.png	1	f	2018-11-16 05:59:55.325798	\N	\N	\N
191	1	admin	2772	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/188.png	1	f	2018-11-16 05:59:55.431148	\N	\N	\N
200	1	admin	2779	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/196.png	1	f	2018-11-16 05:59:55.551001	\N	\N	\N
209	1	admin	2806	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/225.png	1	f	2018-11-16 05:59:55.661046	\N	\N	\N
217	1	admin	2838	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/255.png	1	f	2018-11-16 05:59:55.768818	\N	\N	\N
228	1	admin	2873	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/289.png	1	f	2018-11-16 05:59:55.88459	\N	\N	\N
237	1	admin	2913	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/330.png	1	f	2018-11-16 05:59:55.991286	\N	\N	\N
247	1	admin	3286	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/371.png	1	f	2018-11-16 05:59:56.098157	\N	\N	\N
256	1	admin	3254	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/404.png	1	f	2018-11-16 05:59:56.207968	\N	\N	\N
264	1	admin	3223	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/438.png	1	f	2018-11-16 05:59:56.312188	\N	\N	\N
273	1	admin	3186	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/471.png	1	f	2018-11-16 05:59:56.421084	\N	\N	\N
283	1	admin	2956	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/508.png	1	f	2018-11-16 05:59:56.533036	\N	\N	\N
293	1	admin	2993	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/545.png	1	f	2018-11-16 05:59:56.638288	\N	\N	\N
301	1	admin	3026	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/578.png	1	f	2018-11-16 05:59:56.745402	\N	\N	\N
311	1	admin	3059	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/612.png	1	f	2018-11-16 05:59:56.849115	\N	\N	\N
317	1	admin	3088	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/639.png	1	f	2018-11-16 05:59:56.952491	\N	\N	\N
325	1	admin	3116	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/667.png	1	f	2018-11-16 05:59:57.05455	\N	\N	\N
334	1	admin	3180	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/479.png	1	f	2018-11-16 05:59:57.164494	\N	\N	\N
344	1	admin	3193	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/465.png	1	f	2018-11-16 05:59:57.269756	\N	\N	\N
353	1	admin	3208	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/450.png	1	f	2018-11-16 05:59:57.380079	\N	\N	\N
362	1	admin	3220	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/437.png	1	f	2018-11-16 05:59:57.486709	\N	\N	\N
371	1	admin	3237	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/425.png	1	f	2018-11-16 05:59:57.587379	\N	\N	\N
381	1	admin	3244	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/413.png	1	f	2018-11-16 05:59:57.690456	\N	\N	\N
390	1	admin	3257	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/401.png	1	f	2018-11-16 05:59:57.80119	\N	\N	\N
400	1	admin	3272	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/387.png	1	f	2018-11-16 05:59:57.904524	\N	\N	\N
409	1	admin	3285	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/374.png	1	f	2018-11-16 05:59:58.008178	\N	\N	\N
418	1	admin	3296	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/362.png	1	f	2018-11-16 05:59:58.120086	\N	\N	\N
428	1	admin	2932	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/350.png	1	f	2018-11-16 05:59:58.238451	\N	\N	\N
436	1	admin	2922	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/338.png	1	f	2018-11-16 05:59:58.348586	\N	\N	\N
445	1	admin	2912	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/328.png	1	f	2018-11-16 05:59:58.45908	\N	\N	\N
454	1	admin	2899	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/315.png	1	f	2018-11-16 05:59:58.564753	\N	\N	\N
462	1	admin	2888	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/304.png	1	f	2018-11-16 05:59:58.672792	\N	\N	\N
471	1	admin	2879	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/294.png	1	f	2018-11-16 05:59:58.776948	\N	\N	\N
479	1	admin	2870	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/286.png	1	f	2018-11-16 05:59:58.889038	\N	\N	\N
486	1	admin	2857	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/273.png	1	f	2018-11-16 05:59:58.991313	\N	\N	\N
496	1	admin	2846	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/263.png	1	f	2018-11-16 05:59:59.096997	\N	\N	\N
506	1	admin	2830	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/247.png	1	f	2018-11-16 05:59:59.202163	\N	\N	\N
515	1	admin	2818	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/234.png	1	f	2018-11-16 05:59:59.326301	\N	\N	\N
523	1	admin	2805	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/222.png	1	f	2018-11-16 05:59:59.429905	\N	\N	\N
533	1	admin	2792	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/210.png	1	f	2018-11-16 05:59:59.535342	\N	\N	\N
541	1	admin	3305	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/805.png	1	f	2018-11-16 05:59:59.641598	\N	\N	\N
551	1	admin	3312	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/797.png	1	f	2018-11-16 05:59:59.737459	\N	\N	\N
559	1	admin	3317	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/790.png	1	f	2018-11-16 05:59:59.848723	\N	\N	\N
569	1	admin	3325	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/780.png	1	f	2018-11-16 05:59:59.95564	\N	\N	\N
579	1	admin	3332	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/770.png	1	f	2018-11-16 06:00:00.059057	\N	\N	\N
62	1	admin	2640	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/056.png	1	f	2018-11-16 05:59:53.797766	\N	\N	\N
73	1	admin	2652	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/068.png	1	f	2018-11-16 05:59:53.917929	\N	\N	\N
85	1	admin	2663	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/079.png	1	f	2018-11-16 05:59:54.040931	\N	\N	\N
96	1	admin	2675	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/091.png	1	f	2018-11-16 05:59:54.240916	\N	\N	\N
107	1	admin	2688	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/103.png	1	f	2018-11-16 05:59:54.400553	\N	\N	\N
117	1	admin	2697	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/113.png	1	f	2018-11-16 05:59:54.521983	\N	\N	\N
127	1	admin	2707	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/123.png	1	f	2018-11-16 05:59:54.657195	\N	\N	\N
137	1	admin	2718	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/133.png	1	f	2018-11-16 05:59:54.788527	\N	\N	\N
149	1	admin	2729	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/145.png	1	f	2018-11-16 05:59:54.909115	\N	\N	\N
159	1	admin	2739	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/155.png	1	f	2018-11-16 05:59:55.033264	\N	\N	\N
172	1	admin	2749	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/165.png	1	f	2018-11-16 05:59:55.157824	\N	\N	\N
181	1	admin	2759	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/177.png	1	f	2018-11-16 05:59:55.283631	\N	\N	\N
190	1	admin	2770	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/186.png	1	f	2018-11-16 05:59:55.401276	\N	\N	\N
199	1	admin	2780	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/195.png	1	f	2018-11-16 05:59:55.525036	\N	\N	\N
208	1	admin	2807	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/221.png	1	f	2018-11-16 05:59:55.652529	\N	\N	\N
218	1	admin	2836	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/252.png	1	f	2018-11-16 05:59:55.779896	\N	\N	\N
229	1	admin	2881	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/297.png	1	f	2018-11-16 05:59:55.900059	\N	\N	\N
239	1	admin	2923	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/339.png	1	f	2018-11-16 05:59:56.025908	\N	\N	\N
249	1	admin	3279	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/380.png	1	f	2018-11-16 05:59:56.147491	\N	\N	\N
260	1	admin	3239	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/419.png	1	f	2018-11-16 05:59:56.27259	\N	\N	\N
270	1	admin	3198	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/460.png	1	f	2018-11-16 05:59:56.392617	\N	\N	\N
281	1	admin	2945	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/497.png	1	f	2018-11-16 05:59:56.514525	\N	\N	\N
291	1	admin	2986	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/538.png	1	f	2018-11-16 05:59:56.63354	\N	\N	\N
303	1	admin	3031	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/582.png	1	f	2018-11-16 05:59:56.756576	\N	\N	\N
313	1	admin	3068	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/619.png	1	f	2018-11-16 05:59:56.894561	\N	\N	\N
322	1	admin	3097	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/650.png	1	f	2018-11-16 05:59:57.015278	\N	\N	\N
332	1	admin	3136	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/688.png	1	f	2018-11-16 05:59:57.134566	\N	\N	\N
342	1	admin	3191	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/467.png	1	f	2018-11-16 05:59:57.257136	\N	\N	\N
355	1	admin	3207	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/451.png	1	f	2018-11-16 05:59:57.39063	\N	\N	\N
365	1	admin	3224	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/434.png	1	f	2018-11-16 05:59:57.512019	\N	\N	\N
375	1	admin	3238	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/421.png	1	f	2018-11-16 05:59:57.634343	\N	\N	\N
385	1	admin	3250	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/408.png	1	f	2018-11-16 05:59:57.757713	\N	\N	\N
398	1	admin	3265	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/393.png	1	f	2018-11-16 05:59:57.882317	\N	\N	\N
408	1	admin	3281	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/377.png	1	f	2018-11-16 05:59:58.002432	\N	\N	\N
419	1	admin	3294	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/364.png	1	f	2018-11-16 05:59:58.123012	\N	\N	\N
453	1	admin	2901	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/317.png	1	f	2018-11-16 05:59:58.564096	\N	\N	\N
464	1	admin	2886	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/303.png	1	f	2018-11-16 05:59:58.684843	\N	\N	\N
475	1	admin	2874	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/290.png	1	f	2018-11-16 05:59:58.807625	\N	\N	\N
484	1	admin	2863	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/279.png	1	f	2018-11-16 05:59:58.919488	\N	\N	\N
493	1	admin	2851	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/267.png	1	f	2018-11-16 05:59:59.039075	\N	\N	\N
503	1	admin	2835	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/251.png	1	f	2018-11-16 05:59:59.157735	\N	\N	\N
512	1	admin	2821	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/238.png	1	f	2018-11-16 05:59:59.279543	\N	\N	\N
522	1	admin	2810	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/226.png	1	f	2018-11-16 05:59:59.402791	\N	\N	\N
532	1	admin	2794	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/212.png	1	f	2018-11-16 05:59:59.526301	\N	\N	\N
543	1	admin	3167	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/806.png	1	f	2018-11-16 05:59:59.650627	\N	\N	\N
553	1	admin	3313	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/795.png	1	f	2018-11-16 05:59:59.771906	\N	\N	\N
563	1	admin	3320	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/785.png	1	f	2018-11-16 05:59:59.896863	\N	\N	\N
574	1	admin	3160	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/775.png	1	f	2018-11-16 06:00:00.016905	\N	\N	\N
584	1	admin	3157	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/764.png	1	f	2018-11-16 06:00:00.13611	\N	\N	\N
596	1	admin	3154	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/753.png	1	f	2018-11-16 06:00:00.27195	\N	\N	\N
607	1	admin	3354	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/742.png	1	f	2018-11-16 06:00:00.402492	\N	\N	\N
617	1	admin	3360	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/731.png	1	f	2018-11-16 06:00:00.529861	\N	\N	\N
628	1	admin	3369	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/720.png	1	f	2018-11-16 06:00:00.652424	\N	\N	\N
638	1	admin	3144	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/710.png	1	f	2018-11-16 06:00:00.787802	\N	\N	\N
649	1	admin	3383	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/700.png	1	f	2018-11-16 06:00:00.906372	\N	\N	\N
661	1	admin	3135	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/687.png	1	f	2018-11-16 06:00:01.028296	\N	\N	\N
671	1	admin	2959	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/512.png	1	f	2018-11-16 06:00:01.160012	\N	\N	\N
682	1	admin	2974	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/526.png	1	f	2018-11-16 06:00:01.280687	\N	\N	\N
63	1	admin	2642	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/057.png	1	f	2018-11-16 05:59:53.798612	\N	\N	\N
72	1	admin	2653	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/069.png	1	f	2018-11-16 05:59:53.911721	\N	\N	\N
82	1	admin	2662	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/078.png	1	f	2018-11-16 05:59:54.024762	\N	\N	\N
91	1	admin	2672	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/088.png	1	f	2018-11-16 05:59:54.207377	\N	\N	\N
101	1	admin	2682	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/097.png	1	f	2018-11-16 05:59:54.325339	\N	\N	\N
114	1	admin	2692	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/108.png	1	f	2018-11-16 05:59:54.489295	\N	\N	\N
124	1	admin	2705	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/120.png	1	f	2018-11-16 05:59:54.60995	\N	\N	\N
134	1	admin	2714	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/130.png	1	f	2018-11-16 05:59:54.729566	\N	\N	\N
144	1	admin	2722	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/140.png	1	f	2018-11-16 05:59:54.842346	\N	\N	\N
154	1	admin	2735	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/150.png	1	f	2018-11-16 05:59:54.965876	\N	\N	\N
164	1	admin	2745	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/160.png	1	f	2018-11-16 05:59:55.109719	\N	\N	\N
174	1	admin	2753	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/169.png	1	f	2018-11-16 05:59:55.227544	\N	\N	\N
184	1	admin	2763	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/179.png	1	f	2018-11-16 05:59:55.34356	\N	\N	\N
194	1	admin	2774	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/190.png	1	f	2018-11-16 05:59:55.460952	\N	\N	\N
203	1	admin	2787	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/202.png	1	f	2018-11-16 05:59:55.591842	\N	\N	\N
212	1	admin	2819	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/235.png	1	f	2018-11-16 05:59:55.708402	\N	\N	\N
223	1	admin	2854	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/270.png	1	f	2018-11-16 05:59:55.822823	\N	\N	\N
234	1	admin	2902	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/318.png	1	f	2018-11-16 05:59:55.937159	\N	\N	\N
244	1	admin	3299	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/359.png	1	f	2018-11-16 05:59:56.091544	\N	\N	\N
255	1	admin	3258	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/400.png	1	f	2018-11-16 05:59:56.208349	\N	\N	\N
267	1	admin	3214	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/445.png	1	f	2018-11-16 05:59:56.32845	\N	\N	\N
276	1	admin	3173	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/485.png	1	f	2018-11-16 05:59:56.440114	\N	\N	\N
286	1	admin	2968	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/519.png	1	f	2018-11-16 05:59:56.556511	\N	\N	\N
296	1	admin	3004	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/556.png	1	f	2018-11-16 05:59:56.673147	\N	\N	\N
306	1	admin	3041	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/593.png	1	f	2018-11-16 05:59:56.788382	\N	\N	\N
315	1	admin	3078	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/626.png	1	f	2018-11-16 05:59:56.905858	\N	\N	\N
324	1	admin	3107	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/659.png	1	f	2018-11-16 05:59:57.022117	\N	\N	\N
331	1	admin	3177	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/480.png	1	f	2018-11-16 05:59:57.134015	\N	\N	\N
341	1	admin	3189	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/469.png	1	f	2018-11-16 05:59:57.249456	\N	\N	\N
351	1	admin	3204	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/454.png	1	f	2018-11-16 05:59:57.365059	\N	\N	\N
361	1	admin	3217	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/440.png	1	f	2018-11-16 05:59:57.479644	\N	\N	\N
372	1	admin	3232	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/426.png	1	f	2018-11-16 05:59:57.592324	\N	\N	\N
382	1	admin	3245	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/412.png	1	f	2018-11-16 05:59:57.708092	\N	\N	\N
392	1	admin	3260	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/398.png	1	f	2018-11-16 05:59:57.813663	\N	\N	\N
401	1	admin	3273	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/385.png	1	f	2018-11-16 05:59:57.92458	\N	\N	\N
411	1	admin	3284	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/373.png	1	f	2018-11-16 05:59:58.039986	\N	\N	\N
422	1	admin	3300	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/358.png	1	f	2018-11-16 05:59:58.159698	\N	\N	\N
431	1	admin	2933	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/346.png	1	f	2018-11-16 05:59:58.273796	\N	\N	\N
440	1	admin	2918	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/334.png	1	f	2018-11-16 05:59:58.386895	\N	\N	\N
449	1	admin	2906	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/323.png	1	f	2018-11-16 05:59:58.506196	\N	\N	\N
459	1	admin	2893	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/309.png	1	f	2018-11-16 05:59:58.63254	\N	\N	\N
468	1	admin	2882	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/298.png	1	f	2018-11-16 05:59:58.766945	\N	\N	\N
477	1	admin	2872	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/288.png	1	f	2018-11-16 05:59:58.882746	\N	\N	\N
488	1	admin	2859	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/275.png	1	f	2018-11-16 05:59:58.995579	\N	\N	\N
499	1	admin	2843	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/259.png	1	f	2018-11-16 05:59:59.115871	\N	\N	\N
509	1	admin	2828	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/244.png	1	f	2018-11-16 05:59:59.240037	\N	\N	\N
519	1	admin	2814	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/230.png	1	f	2018-11-16 05:59:59.360102	\N	\N	\N
528	1	admin	2800	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/216.png	1	f	2018-11-16 05:59:59.51115	\N	\N	\N
539	1	admin	2785	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/201.png	1	f	2018-11-16 05:59:59.626556	\N	\N	\N
548	1	admin	3311	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/800.png	1	f	2018-11-16 05:59:59.735041	\N	\N	\N
560	1	admin	3319	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/788.png	1	f	2018-11-16 05:59:59.853182	\N	\N	\N
570	1	admin	3327	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/778.png	1	f	2018-11-16 05:59:59.970903	\N	\N	\N
580	1	admin	3334	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/768.png	1	f	2018-11-16 06:00:00.083481	\N	\N	\N
590	1	admin	3340	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/758.png	1	f	2018-11-16 06:00:00.196664	\N	\N	\N
600	1	admin	3348	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/748.png	1	f	2018-11-16 06:00:00.310872	\N	\N	\N
610	1	admin	3355	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/738.png	1	f	2018-11-16 06:00:00.424051	\N	\N	\N
620	1	admin	3361	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/728.png	1	f	2018-11-16 06:00:00.560055	\N	\N	\N
630	1	admin	3145	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/718.png	1	f	2018-11-16 06:00:00.675604	\N	\N	\N
67	1	admin	2647	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/063.png	1	f	2018-11-16 05:59:53.834736	\N	\N	\N
77	1	admin	2655	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/073.png	1	f	2018-11-16 05:59:53.955283	\N	\N	\N
87	1	admin	2667	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/083.png	1	f	2018-11-16 05:59:54.078388	\N	\N	\N
97	1	admin	2677	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/093.png	1	f	2018-11-16 05:59:54.243814	\N	\N	\N
106	1	admin	2685	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/102.png	1	f	2018-11-16 05:59:54.364958	\N	\N	\N
116	1	admin	2696	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/112.png	1	f	2018-11-16 05:59:54.498438	\N	\N	\N
126	1	admin	2704	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/121.png	1	f	2018-11-16 05:59:54.619052	\N	\N	\N
135	1	admin	2715	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/131.png	1	f	2018-11-16 05:59:54.738645	\N	\N	\N
145	1	admin	2725	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/141.png	1	f	2018-11-16 05:59:54.855438	\N	\N	\N
156	1	admin	2733	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/151.png	1	f	2018-11-16 05:59:54.995104	\N	\N	\N
192	1	admin	2771	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/187.png	1	f	2018-11-16 05:59:55.440358	\N	\N	\N
202	1	admin	2782	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/197.png	1	f	2018-11-16 05:59:55.565045	\N	\N	\N
211	1	admin	2816	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/232.png	1	f	2018-11-16 05:59:55.691096	\N	\N	\N
220	1	admin	2848	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/262.png	1	f	2018-11-16 05:59:55.806983	\N	\N	\N
230	1	admin	2885	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/301.png	1	f	2018-11-16 05:59:55.925069	\N	\N	\N
242	1	admin	2927	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/343.png	1	f	2018-11-16 05:59:56.055413	\N	\N	\N
252	1	admin	3270	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/388.png	1	f	2018-11-16 05:59:56.190893	\N	\N	\N
263	1	admin	3227	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/431.png	1	f	2018-11-16 05:59:56.311138	\N	\N	\N
275	1	admin	3190	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/468.png	1	f	2018-11-16 05:59:56.429118	\N	\N	\N
285	1	admin	2964	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/515.png	1	f	2018-11-16 05:59:56.54712	\N	\N	\N
295	1	admin	3000	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/552.png	1	f	2018-11-16 05:59:56.664629	\N	\N	\N
305	1	admin	3039	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/589.png	1	f	2018-11-16 05:59:56.781427	\N	\N	\N
314	1	admin	3071	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/622.png	1	f	2018-11-16 05:59:56.902204	\N	\N	\N
323	1	admin	3102	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/655.png	1	f	2018-11-16 05:59:57.021575	\N	\N	\N
333	1	admin	3178	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/481.png	1	f	2018-11-16 05:59:57.143074	\N	\N	\N
343	1	admin	3192	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/466.png	1	f	2018-11-16 05:59:57.260006	\N	\N	\N
352	1	admin	3206	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/453.png	1	f	2018-11-16 05:59:57.379493	\N	\N	\N
363	1	admin	3219	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/439.png	1	f	2018-11-16 05:59:57.496793	\N	\N	\N
373	1	admin	3233	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/424.png	1	f	2018-11-16 05:59:57.616191	\N	\N	\N
384	1	admin	3248	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/410.png	1	f	2018-11-16 05:59:57.734843	\N	\N	\N
394	1	admin	3262	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/396.png	1	f	2018-11-16 05:59:57.857287	\N	\N	\N
405	1	admin	3276	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/382.png	1	f	2018-11-16 05:59:57.985962	\N	\N	\N
416	1	admin	3289	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/369.png	1	f	2018-11-16 05:59:58.101169	\N	\N	\N
427	1	admin	2937	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/353.png	1	f	2018-11-16 05:59:58.237957	\N	\N	\N
437	1	admin	2926	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/340.png	1	f	2018-11-16 05:59:58.354977	\N	\N	\N
446	1	admin	2911	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/327.png	1	f	2018-11-16 05:59:58.473513	\N	\N	\N
457	1	admin	2897	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/313.png	1	f	2018-11-16 05:59:58.59088	\N	\N	\N
467	1	admin	2883	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/299.png	1	f	2018-11-16 05:59:58.707883	\N	\N	\N
476	1	admin	2788	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/204.png	1	f	2018-11-16 05:59:58.828078	\N	\N	\N
485	1	admin	2862	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/278.png	1	f	2018-11-16 05:59:58.947255	\N	\N	\N
495	1	admin	2847	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/264.png	1	f	2018-11-16 05:59:59.066152	\N	\N	\N
505	1	admin	2833	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/249.png	1	f	2018-11-16 05:59:59.196576	\N	\N	\N
514	1	admin	2820	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/236.png	1	f	2018-11-16 05:59:59.317324	\N	\N	\N
524	1	admin	2808	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/223.png	1	f	2018-11-16 05:59:59.435472	\N	\N	\N
534	1	admin	2797	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/208.png	1	f	2018-11-16 05:59:59.565653	\N	\N	\N
546	1	admin	3307	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/804.png	1	f	2018-11-16 05:59:59.685333	\N	\N	\N
556	1	admin	3315	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/793.png	1	f	2018-11-16 05:59:59.80803	\N	\N	\N
566	1	admin	3323	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/782.png	1	f	2018-11-16 05:59:59.921955	\N	\N	\N
576	1	admin	3330	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/772.png	1	f	2018-11-16 06:00:00.047293	\N	\N	\N
588	1	admin	3339	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/762.png	1	f	2018-11-16 06:00:00.169213	\N	\N	\N
599	1	admin	3347	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/750.png	1	f	2018-11-16 06:00:00.290368	\N	\N	\N
609	1	admin	3353	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/739.png	1	f	2018-11-16 06:00:00.421944	\N	\N	\N
619	1	admin	3148	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/729.png	1	f	2018-11-16 06:00:00.546157	\N	\N	\N
629	1	admin	3370	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/719.png	1	f	2018-11-16 06:00:00.674672	\N	\N	\N
642	1	admin	3377	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/709.png	1	f	2018-11-16 06:00:00.796841	\N	\N	\N
652	1	admin	3386	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/697.png	1	f	2018-11-16 06:00:00.919824	\N	\N	\N
663	1	admin	3132	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/685.png	1	f	2018-11-16 06:00:01.040354	\N	\N	\N
672	1	admin	2961	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/513.png	1	f	2018-11-16 06:00:01.162886	\N	\N	\N
586	1	admin	3156	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/760.png	1	f	2018-11-16 06:00:00.160553	\N	\N	\N
595	1	admin	3346	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/752.png	1	f	2018-11-16 06:00:00.271118	\N	\N	\N
603	1	admin	3350	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/744.png	1	f	2018-11-16 06:00:00.381623	\N	\N	\N
613	1	admin	3358	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/735.png	1	f	2018-11-16 06:00:00.487678	\N	\N	\N
623	1	admin	3147	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/725.png	1	f	2018-11-16 06:00:00.594396	\N	\N	\N
633	1	admin	3375	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/715.png	1	f	2018-11-16 06:00:00.699285	\N	\N	\N
643	1	admin	3380	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/705.png	1	f	2018-11-16 06:00:00.802534	\N	\N	\N
651	1	admin	3139	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/695.png	1	f	2018-11-16 06:00:00.918017	\N	\N	\N
660	1	admin	3134	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/686.png	1	f	2018-11-16 06:00:01.026325	\N	\N	\N
668	1	admin	3123	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/676.png	1	f	2018-11-16 06:00:01.138898	\N	\N	\N
676	1	admin	2970	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/521.png	1	f	2018-11-16 06:00:01.241283	\N	\N	\N
686	1	admin	2980	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/532.png	1	f	2018-11-16 06:00:01.347603	\N	\N	\N
696	1	admin	2994	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/546.png	1	f	2018-11-16 06:00:01.45411	\N	\N	\N
706	1	admin	3009	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/559.png	1	f	2018-11-16 06:00:01.571736	\N	\N	\N
716	1	admin	3021	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/573.png	1	f	2018-11-16 06:00:01.676561	\N	\N	\N
726	1	admin	3033	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/587.png	1	f	2018-11-16 06:00:01.784392	\N	\N	\N
735	1	admin	3048	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/600.png	1	f	2018-11-16 06:00:01.892825	\N	\N	\N
744	1	admin	3060	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/611.png	1	f	2018-11-16 06:00:02.014917	\N	\N	\N
754	1	admin	3080	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/625.png	1	f	2018-11-16 06:00:02.141213	\N	\N	\N
763	1	admin	3085	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/640.png	1	f	2018-11-16 06:00:02.250339	\N	\N	\N
771	1	admin	3111	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/664.png	1	f	2018-11-16 06:00:02.37591	\N	\N	\N
781	1	admin	3101	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/653.png	1	f	2018-11-16 06:00:02.492669	\N	\N	\N
791	1	admin	3175	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/483.png	1	f	2018-11-16 06:00:02.598808	\N	\N	\N
801	1	admin	2944	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/496.png	1	f	2018-11-16 06:00:02.703295	\N	\N	\N
811	1	admin	2958	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/510.png	1	f	2018-11-16 06:00:02.820597	\N	\N	\N
602	1	admin	3351	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/746.png	1	f	2018-11-16 06:00:00.345174	\N	\N	\N
612	1	admin	3357	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/736.png	1	f	2018-11-16 06:00:00.457234	\N	\N	\N
622	1	admin	3365	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/726.png	1	f	2018-11-16 06:00:00.57044	\N	\N	\N
632	1	admin	3371	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/717.png	1	f	2018-11-16 06:00:00.682459	\N	\N	\N
641	1	admin	3379	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/707.png	1	f	2018-11-16 06:00:00.796407	\N	\N	\N
650	1	admin	3385	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/698.png	1	f	2018-11-16 06:00:00.910758	\N	\N	\N
657	1	admin	3140	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/689.png	1	f	2018-11-16 06:00:01.017852	\N	\N	\N
667	1	admin	3126	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/678.png	1	f	2018-11-16 06:00:01.13451	\N	\N	\N
678	1	admin	2967	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/520.png	1	f	2018-11-16 06:00:01.246197	\N	\N	\N
687	1	admin	2981	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/533.png	1	f	2018-11-16 06:00:01.354969	\N	\N	\N
697	1	admin	2995	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/547.png	1	f	2018-11-16 06:00:01.465361	\N	\N	\N
707	1	admin	3008	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/561.png	1	f	2018-11-16 06:00:01.576696	\N	\N	\N
718	1	admin	3023	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/575.png	1	f	2018-11-16 06:00:01.695837	\N	\N	\N
728	1	admin	3036	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/588.png	1	f	2018-11-16 06:00:01.807852	\N	\N	\N
737	1	admin	3050	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/602.png	1	f	2018-11-16 06:00:01.922713	\N	\N	\N
747	1	admin	3063	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/615.png	1	f	2018-11-16 06:00:02.036866	\N	\N	\N
758	1	admin	3074	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/630.png	1	f	2018-11-16 06:00:02.166339	\N	\N	\N
766	1	admin	3091	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/642.png	1	f	2018-11-16 06:00:02.284048	\N	\N	\N
776	1	admin	3108	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/660.png	1	f	2018-11-16 06:00:02.391608	\N	\N	\N
784	1	admin	3096	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/648.png	1	f	2018-11-16 06:00:02.50245	\N	\N	\N
793	1	admin	3174	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/484.png	1	f	2018-11-16 06:00:02.615259	\N	\N	\N
802	1	admin	2946	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/498.png	1	f	2018-11-16 06:00:02.725555	\N	\N	\N
618	1	admin	3363	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/730.png	1	f	2018-11-16 06:00:00.532062	\N	\N	\N
626	1	admin	3146	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/721.png	1	f	2018-11-16 06:00:00.639969	\N	\N	\N
635	1	admin	3373	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/713.png	1	f	2018-11-16 06:00:00.763017	\N	\N	\N
645	1	admin	3381	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/703.png	1	f	2018-11-16 06:00:00.877797	\N	\N	\N
655	1	admin	3389	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/693.png	1	f	2018-11-16 06:00:00.987374	\N	\N	\N
665	1	admin	3129	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/681.png	1	f	2018-11-16 06:00:01.09518	\N	\N	\N
674	1	admin	2965	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/517.png	1	f	2018-11-16 06:00:01.197332	\N	\N	\N
684	1	admin	2979	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/529.png	1	f	2018-11-16 06:00:01.310099	\N	\N	\N
694	1	admin	2991	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/543.png	1	f	2018-11-16 06:00:01.418636	\N	\N	\N
702	1	admin	3006	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/557.png	1	f	2018-11-16 06:00:01.521743	\N	\N	\N
710	1	admin	3018	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/568.png	1	f	2018-11-16 06:00:01.63067	\N	\N	\N
719	1	admin	3027	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/579.png	1	f	2018-11-16 06:00:01.736498	\N	\N	\N
729	1	admin	3040	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/591.png	1	f	2018-11-16 06:00:01.842183	\N	\N	\N
739	1	admin	3051	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/604.png	1	f	2018-11-16 06:00:01.949365	\N	\N	\N
749	1	admin	3066	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/618.png	1	f	2018-11-16 06:00:02.056796	\N	\N	\N
757	1	admin	3082	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/633.png	1	f	2018-11-16 06:00:02.166032	\N	\N	\N
767	1	admin	3120	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/672.png	1	f	2018-11-16 06:00:02.290641	\N	\N	\N
777	1	admin	3106	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/658.png	1	f	2018-11-16 06:00:02.395752	\N	\N	\N
787	1	admin	3093	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/645.png	1	f	2018-11-16 06:00:02.526892	\N	\N	\N
795	1	admin	2939	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/491.png	1	f	2018-11-16 06:00:02.631179	\N	\N	\N
805	1	admin	2949	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/502.png	1	f	2018-11-16 06:00:02.744836	\N	\N	\N
634	1	admin	3143	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/714.png	1	f	2018-11-16 06:00:00.752166	\N	\N	\N
644	1	admin	3382	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/704.png	1	f	2018-11-16 06:00:00.868241	\N	\N	\N
654	1	admin	3388	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/694.png	1	f	2018-11-16 06:00:00.978595	\N	\N	\N
664	1	admin	3130	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/682.png	1	f	2018-11-16 06:00:01.090805	\N	\N	\N
675	1	admin	2963	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/516.png	1	f	2018-11-16 06:00:01.199325	\N	\N	\N
685	1	admin	2978	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/531.png	1	f	2018-11-16 06:00:01.312103	\N	\N	\N
695	1	admin	2992	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/544.png	1	f	2018-11-16 06:00:01.420665	\N	\N	\N
703	1	admin	3005	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/558.png	1	f	2018-11-16 06:00:01.529958	\N	\N	\N
712	1	admin	3017	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/569.png	1	f	2018-11-16 06:00:01.644181	\N	\N	\N
722	1	admin	3029	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/583.png	1	f	2018-11-16 06:00:01.759352	\N	\N	\N
732	1	admin	3043	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/595.png	1	f	2018-11-16 06:00:01.86954	\N	\N	\N
740	1	admin	3057	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/609.png	1	f	2018-11-16 06:00:01.982847	\N	\N	\N
750	1	admin	3067	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/620.png	1	f	2018-11-16 06:00:02.096119	\N	\N	\N
760	1	admin	3081	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/634.png	1	f	2018-11-16 06:00:02.231859	\N	\N	\N
770	1	admin	3115	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/668.png	1	f	2018-11-16 06:00:02.343385	\N	\N	\N
780	1	admin	3103	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/654.png	1	f	2018-11-16 06:00:02.471565	\N	\N	\N
790	1	admin	3122	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/674.png	1	f	2018-11-16 06:00:02.581547	\N	\N	\N
800	1	admin	2943	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/495.png	1	f	2018-11-16 06:00:02.693068	\N	\N	\N
810	1	admin	2957	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/509.png	1	f	2018-11-16 06:00:02.813643	\N	\N	\N
636	1	admin	3376	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/711.png	1	f	2018-11-16 06:00:00.779588	\N	\N	\N
646	1	admin	3141	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/702.png	1	f	2018-11-16 06:00:00.892733	\N	\N	\N
656	1	admin	3390	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/692.png	1	f	2018-11-16 06:00:01.005124	\N	\N	\N
666	1	admin	3127	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/680.png	1	f	2018-11-16 06:00:01.130313	\N	\N	\N
677	1	admin	2966	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/518.png	1	f	2018-11-16 06:00:01.243879	\N	\N	\N
688	1	admin	2983	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/535.png	1	f	2018-11-16 06:00:01.359004	\N	\N	\N
698	1	admin	2996	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/549.png	1	f	2018-11-16 06:00:01.471335	\N	\N	\N
708	1	admin	3010	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/562.png	1	f	2018-11-16 06:00:01.583506	\N	\N	\N
717	1	admin	3025	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/576.png	1	f	2018-11-16 06:00:01.694379	\N	\N	\N
727	1	admin	3037	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/590.png	1	f	2018-11-16 06:00:01.80583	\N	\N	\N
738	1	admin	3052	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/603.png	1	f	2018-11-16 06:00:01.92968	\N	\N	\N
748	1	admin	3064	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/617.png	1	f	2018-11-16 06:00:02.041234	\N	\N	\N
756	1	admin	3073	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/631.png	1	f	2018-11-16 06:00:02.164337	\N	\N	\N
768	1	admin	3118	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/670.png	1	f	2018-11-16 06:00:02.302247	\N	\N	\N
778	1	admin	3104	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/657.png	1	f	2018-11-16 06:00:02.415071	\N	\N	\N
788	1	admin	3092	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/644.png	1	f	2018-11-16 06:00:02.529689	\N	\N	\N
796	1	admin	2940	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/492.png	1	f	2018-11-16 06:00:02.63406	\N	\N	\N
806	1	admin	2953	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/505.png	1	f	2018-11-16 06:00:02.747668	\N	\N	\N
639	1	admin	3378	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/708.png	1	f	2018-11-16 06:00:00.790207	\N	\N	\N
647	1	admin	3137	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/699.png	1	f	2018-11-16 06:00:00.900241	\N	\N	\N
658	1	admin	3138	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/691.png	1	f	2018-11-16 06:00:01.018535	\N	\N	\N
669	1	admin	3125	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/677.png	1	f	2018-11-16 06:00:01.143845	\N	\N	\N
679	1	admin	2969	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/522.png	1	f	2018-11-16 06:00:01.266091	\N	\N	\N
689	1	admin	2984	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/536.png	1	f	2018-11-16 06:00:01.379347	\N	\N	\N
699	1	admin	2998	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/550.png	1	f	2018-11-16 06:00:01.498819	\N	\N	\N
709	1	admin	3013	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/564.png	1	f	2018-11-16 06:00:01.625194	\N	\N	\N
720	1	admin	3024	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/577.png	1	f	2018-11-16 06:00:01.741487	\N	\N	\N
730	1	admin	3038	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/592.png	1	f	2018-11-16 06:00:01.857556	\N	\N	\N
742	1	admin	3054	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/606.png	1	f	2018-11-16 06:00:01.986232	\N	\N	\N
752	1	admin	3070	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/623.png	1	f	2018-11-16 06:00:02.11801	\N	\N	\N
762	1	admin	3087	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/637.png	1	f	2018-11-16 06:00:02.244688	\N	\N	\N
773	1	admin	3113	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/665.png	1	f	2018-11-16 06:00:02.38138	\N	\N	\N
783	1	admin	3099	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/651.png	1	f	2018-11-16 06:00:02.498109	\N	\N	\N
794	1	admin	3171	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/487.png	1	f	2018-11-16 06:00:02.623369	\N	\N	\N
804	1	admin	2952	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/501.png	1	f	2018-11-16 06:00:02.736472	\N	\N	\N
670	1	admin	3195	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/463.png	1	f	2018-11-16 06:00:01.14858	\N	\N	\N
681	1	admin	2971	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/524.png	1	f	2018-11-16 06:00:01.279048	\N	\N	\N
691	1	admin	2989	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/540.png	1	f	2018-11-16 06:00:01.397317	\N	\N	\N
704	1	admin	3003	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/554.png	1	f	2018-11-16 06:00:01.53069	\N	\N	\N
714	1	admin	3016	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/570.png	1	f	2018-11-16 06:00:01.651661	\N	\N	\N
724	1	admin	3032	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/584.png	1	f	2018-11-16 06:00:01.772846	\N	\N	\N
734	1	admin	3046	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/598.png	1	f	2018-11-16 06:00:01.892018	\N	\N	\N
745	1	admin	3061	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/613.png	1	f	2018-11-16 06:00:02.022718	\N	\N	\N
755	1	admin	3077	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/627.png	1	f	2018-11-16 06:00:02.150712	\N	\N	\N
765	1	admin	3089	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/641.png	1	f	2018-11-16 06:00:02.26724	\N	\N	\N
774	1	admin	3109	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/661.png	1	f	2018-11-16 06:00:02.387498	\N	\N	\N
786	1	admin	3095	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/647.png	1	f	2018-11-16 06:00:02.512118	\N	\N	\N
798	1	admin	2938	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/490.png	1	f	2018-11-16 06:00:02.637579	\N	\N	\N
808	1	admin	2954	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/506.png	1	f	2018-11-16 06:00:02.76524	\N	\N	\N
662	1	admin	3131	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/683.png	1	f	2018-11-16 06:00:01.037431	\N	\N	\N
673	1	admin	2962	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/514.png	1	f	2018-11-16 06:00:01.16642	\N	\N	\N
680	1	admin	2976	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/528.png	1	f	2018-11-16 06:00:01.274327	\N	\N	\N
690	1	admin	2985	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/537.png	1	f	2018-11-16 06:00:01.385	\N	\N	\N
700	1	admin	2999	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/551.png	1	f	2018-11-16 06:00:01.51069	\N	\N	\N
711	1	admin	3012	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/565.png	1	f	2018-11-16 06:00:01.631076	\N	\N	\N
721	1	admin	3028	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/580.png	1	f	2018-11-16 06:00:01.752867	\N	\N	\N
731	1	admin	3042	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/594.png	1	f	2018-11-16 06:00:01.867178	\N	\N	\N
741	1	admin	3055	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/607.png	1	f	2018-11-16 06:00:01.985571	\N	\N	\N
751	1	admin	3069	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/621.png	1	f	2018-11-16 06:00:02.098877	\N	\N	\N
761	1	admin	3083	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/635.png	1	f	2018-11-16 06:00:02.24392	\N	\N	\N
772	1	admin	3114	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/666.png	1	f	2018-11-16 06:00:02.380664	\N	\N	\N
782	1	admin	3100	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/652.png	1	f	2018-11-16 06:00:02.497395	\N	\N	\N
792	1	admin	3172	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/486.png	1	f	2018-11-16 06:00:02.61453	\N	\N	\N
803	1	admin	2947	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/499.png	1	f	2018-11-16 06:00:02.725456	\N	\N	\N
683	1	admin	2973	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/525.png	1	f	2018-11-16 06:00:01.283584	\N	\N	\N
693	1	admin	2987	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/539.png	1	f	2018-11-16 06:00:01.401821	\N	\N	\N
701	1	admin	3001	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/553.png	1	f	2018-11-16 06:00:01.519976	\N	\N	\N
713	1	admin	3014	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/566.png	1	f	2018-11-16 06:00:01.644863	\N	\N	\N
723	1	admin	3030	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/581.png	1	f	2018-11-16 06:00:01.771385	\N	\N	\N
733	1	admin	3045	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/596.png	1	f	2018-11-16 06:00:01.890708	\N	\N	\N
743	1	admin	3058	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/610.png	1	f	2018-11-16 06:00:02.014055	\N	\N	\N
753	1	admin	3079	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/624.png	1	f	2018-11-16 06:00:02.133602	\N	\N	\N
764	1	admin	3086	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/638.png	1	f	2018-11-16 06:00:02.253169	\N	\N	\N
775	1	admin	3110	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/662.png	1	f	2018-11-16 06:00:02.389965	\N	\N	\N
785	1	admin	3098	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/649.png	1	f	2018-11-16 06:00:02.51156	\N	\N	\N
797	1	admin	3170	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/488.png	1	f	2018-11-16 06:00:02.635513	\N	\N	\N
807	1	admin	2951	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/503.png	1	f	2018-11-16 06:00:02.75888	\N	\N	\N
692	1	admin	2988	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/541.png	1	f	2018-11-16 06:00:01.399586	\N	\N	\N
705	1	admin	3002	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/555.png	1	f	2018-11-16 06:00:01.534	\N	\N	\N
715	1	admin	3019	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/572.png	1	f	2018-11-16 06:00:01.653292	\N	\N	\N
725	1	admin	3034	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/586.png	1	f	2018-11-16 06:00:01.778234	\N	\N	\N
736	1	admin	3047	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/599.png	1	f	2018-11-16 06:00:01.903119	\N	\N	\N
746	1	admin	3062	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/614.png	1	f	2018-11-16 06:00:02.024344	\N	\N	\N
759	1	admin	3076	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/628.png	1	f	2018-11-16 06:00:02.172546	\N	\N	\N
769	1	admin	3117	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/669.png	1	f	2018-11-16 06:00:02.310537	\N	\N	\N
779	1	admin	3105	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/656.png	1	f	2018-11-16 06:00:02.437674	\N	\N	\N
789	1	admin	3121	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/673.png	1	f	2018-11-16 06:00:02.563979	\N	\N	\N
799	1	admin	2942	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/494.png	1	f	2018-11-16 06:00:02.685623	\N	\N	\N
809	1	admin	2955	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/507.png	1	f	2018-11-16 06:00:02.807401	\N	\N	\N
659	1	admin	3391	https://assets.pokemon.com/assets/cms2/img/pokedex/detail/690.png	1	f	2018-11-16 06:00:01.02232	\N	Pokemon	Imagen de Pokemon
812	1	admin	3391	/public/repositories/resources/Skrelp.pdf	2	f	2018-11-25 05:17:53.208723	\N	Pokemon	Info
817	1	admin	3344	/public/repositories/resources/1543181566085.gif	1	t	2018-11-25 15:32:46.09806	\N	Nyan Cat	Nyan Cat Gif
818	1	admin	3344	/public/repositories/resources/1543186271089.pdf	2	t	2018-11-25 16:51:11.111863	\N	pdf	Solo un pdf
820	1	admin	3344	https://www.youtube.com/watch?v=4jBDnYE1WjI	3	f	2018-11-25 16:55:05.955346	\N	pdf2	pdf2
821	1	admin	3344	https://www.youtube.com/watch?v=8YReJfHIyo0&list=PLi38ScxZn6T6s1c-8eRL-a95JZHmOSZTZ	4	f	2018-11-25 16:58:43.062013	\N	Playlist	Super Science Friends
822	1	admin	3344	/public/repositories/resources/1543188283862.svg	2	t	2018-11-25 17:24:44.034881	\N	svg	Dabase de datos
\.


--
-- Data for Name: RepositoryScore; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RepositoryScore" (id, "idUser", username, score, comment, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: RepositoryTopics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RepositoryTopics" (id, "idRepository", "idCatalog") FROM stdin;
2870	2586	26
2871	2586	25
2872	2586	24
2873	2590	24
2874	2590	25
2875	2592	25
2876	2593	24
2877	2592	26
2878	2590	26
2879	2592	24
2880	2593	25
2881	2593	26
2882	2587	24
2883	2588	25
2884	2585	25
2885	2585	24
2886	2587	25
2887	2588	26
2888	2588	24
2889	2587	26
2890	2585	26
2891	2589	26
2892	2589	24
2893	2589	25
2894	2591	25
2895	2591	24
2896	2594	24
2897	2594	25
2898	2591	26
2899	2594	26
2900	2595	24
2901	2595	25
2902	2595	26
2903	2596	24
2904	2596	25
2905	2596	26
2906	2597	24
2907	2599	24
2908	2597	26
2909	2597	25
2910	2599	26
2911	2599	25
2912	2598	25
2913	2598	24
2914	2598	26
2915	2600	24
2916	2600	25
2917	2602	24
2918	2602	25
2919	2600	26
2920	2604	24
2921	2601	26
2922	2604	26
2923	2603	24
2924	2604	25
2925	2603	25
2926	2603	26
2927	2601	24
2928	2601	25
2929	2602	26
2930	2605	24
2931	2605	25
2932	2606	24
2933	2606	25
2934	2605	26
2935	2606	26
2936	2607	24
2937	2607	26
2938	2608	24
2939	2607	25
2940	2608	26
2941	2608	25
2942	2609	24
2943	2609	25
2944	2609	26
2945	2610	24
2946	2610	25
2947	2611	24
2948	2611	25
2949	2610	26
2950	2612	24
2951	2611	26
2952	2612	25
2953	2612	26
2954	2613	24
2955	2613	25
2956	2613	26
2957	2614	25
2958	2614	24
2959	2614	26
2960	2615	24
2961	2615	25
2962	2615	26
2963	2616	24
2964	2616	25
2965	2616	26
2966	2617	24
2967	2617	26
2968	2617	25
2969	2618	24
2970	2618	25
2971	2618	26
2972	2620	24
2973	2620	25
2974	2620	26
2975	2621	24
2976	2621	25
2977	2622	24
2978	2621	26
2979	2622	25
2980	2624	24
2981	2622	26
2982	2624	25
2983	2624	26
2984	2619	24
2985	2619	25
2986	2619	26
2987	2623	24
2988	2623	25
2989	2626	24
2990	2623	26
2991	2626	25
2992	2625	24
2993	2626	26
2994	2625	25
2995	2625	26
2996	2627	24
2997	2627	25
2998	2628	24
2999	2627	26
3000	2628	26
3001	2628	25
3002	2629	24
3003	2629	25
3004	2629	26
3005	2630	24
3006	2630	25
3007	2631	24
3008	2630	26
3009	2631	25
3010	2631	26
3011	2632	25
3012	2632	24
3013	2632	26
3014	2635	24
3015	2635	25
3016	2635	26
3017	2634	24
3018	2634	25
3019	2633	24
3020	2633	25
3021	2633	26
3022	2634	26
3023	2636	24
3024	2636	25
3025	2636	26
3026	2637	24
3027	2637	25
3028	2638	24
3029	2638	25
3030	2637	26
3031	2638	26
3032	2639	24
3033	2639	25
3034	2639	26
3035	2640	24
3036	2640	25
3037	2640	26
3038	2642	24
3039	2642	25
3040	2642	26
3041	2641	24
3042	2641	25
3043	2643	24
3044	2641	26
3045	2643	26
3046	2643	25
3055	2647	24
3066	2651	24
3076	2653	26
3086	2655	24
3096	2659	25
3106	2663	26
3116	2667	24
3126	2669	25
3135	2674	26
3145	2676	26
3155	2688	25
3164	2693	24
3174	2698	24
3185	2703	24
3195	2708	24
3205	2713	24
3215	2717	26
3226	2724	26
3235	2727	25
3246	2732	26
3255	2737	24
3265	2739	26
3275	2742	26
3287	2747	24
3296	2752	26
3305	2756	26
3315	2759	26
3326	2766	26
3336	2772	24
3346	2777	24
3356	2781	24
3366	2787	26
3376	2791	26
3388	2812	24
3399	2817	25
3410	2823	26
3418	2827	26
3427	2832	24
3434	2836	25
3445	2841	26
3455	2848	24
3465	2851	25
3475	2856	25
3485	2860	26
3495	2866	26
3505	2887	25
3515	2905	25
3525	2910	24
3536	2913	24
3547	2919	26
3555	2926	24
3563	2927	25
3571	2930	24
3579	2936	26
3589	3302	25
3599	3296	24
3610	3289	25
3619	3253	25
3630	3248	24
3639	3244	26
3649	3240	25
3659	3234	24
3669	3232	24
3679	3228	25
3688	3224	25
3698	3223	24
3708	3215	25
3719	3211	25
3729	3207	24
3739	3203	24
3749	3198	24
3758	3195	25
3792	3179	26
3803	3176	25
3812	3171	24
3821	2938	26
3831	2942	24
3841	2946	25
3852	2949	24
3863	2953	25
3873	2957	24
3883	2959	25
3893	2964	26
3903	2968	24
3913	2969	25
3923	2973	26
3933	2979	24
3943	2980	25
3953	2983	26
3962	2987	24
3972	2990	24
3982	2993	26
3992	2997	26
4002	3000	24
4012	3002	25
4023	3005	26
4033	3010	25
4044	3014	24
4054	3065	24
4064	3067	26
4075	3080	25
4085	3076	26
4095	3072	24
4105	3083	25
4115	3086	26
4125	3091	24
4135	3093	25
4145	3096	26
4156	3100	24
4165	3110	24
4175	3107	24
4185	3102	26
4196	3100	25
4205	3117	24
4215	3120	24
4225	3124	25
4235	3126	26
4245	3130	24
4254	3132	24
4262	3136	24
4271	3391	26
4282	3388	24
4292	3386	26
4302	3384	24
4312	3382	25
4321	3379	26
4331	3144	26
4341	3143	24
4352	3145	24
4362	3146	25
4371	3366	26
4382	3364	26
4393	3360	25
4403	3362	26
4413	3355	24
4422	3069	26
4432	3061	26
4441	3058	24
4451	3054	26
4461	3052	25
4470	3048	25
4479	3044	25
4488	3042	24
4499	3037	26
4509	3033	25
4518	3032	24
4528	3028	26
4538	3024	26
4548	3022	25
4558	3020	24
4568	2944	24
4578	3177	26
4588	3194	24
4598	3211	24
4608	3227	26
4618	3235	26
4628	3250	25
4639	3259	25
4648	3262	24
4659	3266	26
4668	3269	24
4680	3273	26
4691	3276	24
4701	3280	24
4711	3285	26
4721	3286	25
4731	3293	24
4741	3301	26
4751	2934	25
4761	2920	25
4773	2906	24
4783	2901	24
4793	2851	26
4803	2897	24
4813	2893	26
4823	2890	25
4833	2883	24
4843	2878	26
4853	2877	25
4865	2872	26
4876	2864	24
4886	2856	24
4897	2845	26
4907	2835	24
3047	2645	24
3056	2647	25
3067	2651	25
3077	2656	24
3087	2655	25
3097	2659	26
3107	2664	24
3117	2667	25
3127	2669	26
3137	2673	24
3146	2677	25
3157	2687	24
3165	2693	26
3175	2698	26
3186	2703	26
3197	2709	24
3207	2713	26
3217	2719	24
3227	2722	24
3237	2729	24
3247	2734	24
3257	2737	25
3267	2740	24
3278	2745	26
3288	2747	26
3297	2753	24
3306	2757	25
3316	2762	25
3325	2767	25
3335	2771	26
3345	2776	25
3355	2782	25
3365	2787	25
3374	2791	25
3384	2793	26
3396	2815	26
3406	2822	25
3416	2826	25
3425	2830	25
3435	2835	26
3446	2839	25
3456	2848	25
3466	2850	26
3476	2857	24
3486	2862	25
3496	2867	25
3506	2887	26
3517	2907	25
3528	2911	24
3538	2915	25
3548	2920	24
3557	2926	25
3566	2928	26
3575	2931	24
3586	3303	24
3597	3298	25
3607	3290	24
3617	3254	24
3626	3250	24
3636	3245	24
3646	3242	24
3657	3236	26
3667	3237	25
3677	3229	25
3687	3225	25
3697	3220	26
3707	3215	24
3716	3212	25
3726	3208	24
3736	3204	24
3745	3200	24
3754	3197	24
3764	3192	24
3774	3189	26
3783	3184	24
3794	3179	24
3804	3176	26
3813	3171	25
3823	2939	24
3833	2943	24
3844	2947	25
3853	2949	26
3864	2954	24
3874	2957	25
3884	2959	26
3894	2963	24
3906	2968	25
3916	2972	25
3926	2974	26
3936	2977	24
3946	2981	25
3956	2984	26
3966	2989	24
3976	2991	25
3987	2994	26
3997	2998	25
4007	3001	26
4018	3006	25
4028	3008	24
4037	3013	25
4047	3015	24
4057	3064	25
4066	3071	24
4076	3078	24
4086	3075	24
4096	3072	25
4106	3083	26
4116	3088	24
4126	3091	25
4137	3094	24
4147	3098	25
4157	3113	24
4167	3109	26
4176	3106	25
4186	3102	25
4197	3113	26
4207	3117	25
4216	3120	26
4226	3124	26
4237	3128	24
4247	3130	26
4256	3132	26
4265	3136	26
4275	3390	24
4285	3139	25
4295	3385	26
4306	3141	24
4318	3380	26
4328	3377	26
4338	3373	24
4348	3372	25
4358	3369	24
4367	3368	24
4376	3365	24
4386	3148	24
4396	3359	25
4406	3358	26
4442	3057	26
4453	3054	25
4462	3052	24
4471	3048	24
4481	3044	24
4491	3041	25
4501	3037	24
4511	3034	26
4521	3029	25
4531	3028	24
4541	3025	25
4553	3021	24
4563	3017	25
4574	3173	25
4584	3188	26
4595	3204	25
4605	3220	25
4614	3228	24
4625	3244	24
4635	3257	24
4645	3261	25
4655	3264	24
4665	3268	26
4675	3272	24
4685	3275	26
4695	3279	25
4705	3282	26
4714	3284	25
4724	3288	25
4734	3294	24
4744	2937	26
4755	2929	24
4764	2915	26
4774	2904	25
4784	2900	26
4794	2812	26
4804	2896	26
4814	2893	24
4825	2889	25
4834	2882	25
4846	2878	24
4857	2875	24
4868	2871	25
4878	2863	24
4888	2854	24
4898	2844	24
4908	2834	24
4919	2823	25
3048	2645	25
3058	2647	26
3065	2651	26
3073	2653	25
3080	2657	24
3091	2658	24
3101	2662	24
3111	2666	25
3121	2668	26
3130	2672	24
3140	2675	24
3150	2681	25
3159	2690	24
3168	2694	25
3176	2699	26
3184	2701	26
3194	2707	26
3204	2712	25
3214	2718	25
3223	2723	24
3233	2728	24
3241	2731	26
3250	2735	24
3260	2736	25
3269	2743	25
3279	2744	25
3311	2759	25
3320	2765	26
3330	2769	25
3339	2774	24
3349	2778	25
3357	2783	25
3367	2786	25
3377	2797	25
3385	2794	26
3393	2816	24
3403	2819	26
3413	2824	26
3422	2831	25
3431	2833	26
3441	2840	26
3450	2843	26
3460	2847	25
3470	2853	26
3479	2859	25
3488	2863	25
3498	2868	25
3508	2886	26
3518	2907	26
3527	2910	26
3537	2915	24
3546	2919	25
3554	2923	24
3561	2924	26
3568	2933	25
3577	2935	24
3587	3301	24
3596	3298	26
3605	3291	26
3614	3255	24
3624	3252	24
3634	3247	24
3644	3243	25
3654	3239	26
3663	3233	24
3672	3231	25
3682	3227	25
3691	3221	24
3699	3219	25
3709	3213	24
3718	3212	26
3728	3208	26
3761	3194	26
3768	3190	25
3777	3186	25
3786	3183	24
3796	3180	25
3806	3175	25
3815	3170	25
3825	2939	26
3834	2943	26
3842	2947	24
3851	2952	26
3861	2953	24
3871	2956	25
3881	2960	26
3891	2964	24
3900	2966	25
3909	2970	26
3918	2971	24
3928	2975	25
3938	2977	26
3949	2982	24
3958	2985	26
3969	2988	24
3979	2992	25
3989	2995	26
3998	2999	24
4008	3003	24
4016	3006	24
4024	3007	24
4034	3010	26
4043	3012	26
4052	3063	24
4062	3068	25
4072	3079	24
4082	3077	26
4092	3073	24
4102	3081	25
4112	3087	26
4122	3089	24
4130	3090	26
4140	3095	24
4149	3097	25
4158	3111	26
4168	3109	25
4178	3106	24
4187	3103	26
4194	3114	24
4204	3115	25
4214	3119	26
4224	3124	24
4234	3126	25
4244	3129	26
4251	3133	26
4260	3135	24
4267	3391	24
4277	3389	24
4286	3387	25
4296	3137	25
4307	3141	26
4316	3142	24
4326	3377	24
4335	3374	25
4345	3375	25
4355	3145	26
4364	3367	24
4374	3147	24
4383	3361	25
4391	3360	24
4401	3362	24
4411	3151	25
4419	3079	25
4427	3062	26
4436	3060	26
4445	3056	25
4480	3045	26
4490	3041	26
4498	3040	24
4507	3033	26
4517	3032	26
4527	3030	25
4536	3026	24
4545	3023	25
4555	3019	24
4564	3018	26
4573	3172	25
4583	3187	24
4591	3202	24
4601	3215	26
4610	3278	24
4620	3238	26
4629	3251	26
4638	3259	26
4647	3262	25
4657	3265	25
4667	3268	24
4676	3271	25
4686	3275	25
4696	3279	24
4706	3282	25
4716	3284	24
4725	3290	25
4733	3294	26
4743	3304	26
4752	2933	24
4762	2919	24
4771	2907	24
4781	2901	26
4791	2884	25
4801	2897	26
4810	2894	25
4819	2891	25
4827	2885	24
4837	2881	26
3049	2645	26
3059	2648	24
3069	2650	25
3079	2656	26
3089	2660	24
3099	2661	25
3109	2664	26
3119	2668	24
3129	2670	25
3139	2673	26
3149	2683	26
3160	2689	26
3169	2695	26
3179	2700	24
3187	2704	24
3196	2708	26
3206	2713	25
3216	2717	24
3225	2724	24
3236	2727	24
3245	2732	25
3256	2733	26
3266	2739	25
3276	2742	25
3285	2748	26
3294	2751	26
3301	2755	24
3309	2760	25
3319	2763	26
3329	2768	26
3340	2773	25
3350	2780	24
3360	2784	24
3371	2788	26
3381	2792	25
3391	2814	24
3400	2818	25
3407	2821	25
3417	2825	26
3426	2829	24
3436	2834	25
3444	2838	25
3453	2844	25
3464	2849	25
3472	2854	26
3482	2861	25
3492	2864	25
3502	2884	26
3510	2889	24
3520	2906	26
3529	2911	26
3539	2916	24
3549	2920	26
3558	2926	26
3565	2928	25
3573	2934	24
3584	3304	25
3592	3300	26
3603	3295	24
3612	3257	26
3622	3251	24
3632	3248	25
3643	3246	26
3651	3241	26
3661	3234	26
3671	3231	24
3680	3228	26
3690	3224	26
3700	3219	24
3711	3213	25
3721	3211	26
3730	3207	26
3740	3203	25
3748	3199	25
3757	3195	24
3766	3191	24
3775	3188	25
3784	3184	25
3793	3179	25
3802	3178	26
3810	3172	24
3820	3168	26
3830	2941	26
3840	2946	24
3850	2952	25
3860	2950	26
3870	2956	24
3879	2960	25
3889	2962	25
3898	2965	25
3907	2967	26
3917	2972	26
3927	2975	24
3937	2977	25
3947	2981	26
3957	2985	24
3967	2989	25
3978	2991	26
3988	2995	25
3999	2998	26
4009	3003	25
4019	3006	26
4029	3007	26
4035	3011	25
4045	3014	25
4055	3065	25
4065	3067	25
4074	3080	24
4084	3076	25
4094	3073	26
4104	3083	24
4114	3086	24
4124	3089	25
4133	3092	26
4141	3095	26
4151	3097	26
4161	3112	26
4171	3108	25
4181	3104	24
4190	3101	26
4201	3116	24
4211	3118	25
4218	3121	26
4228	3123	25
4236	3128	25
4246	3130	25
4255	3132	25
4264	3136	25
4274	3138	26
4284	3139	24
4293	3385	24
4303	3384	25
4313	3382	26
4323	3378	24
4332	3376	25
4342	3143	25
4353	3371	25
4363	3146	24
4372	3366	25
4381	3364	25
4392	3363	26
4402	3362	25
4412	3151	26
4421	3070	25
4430	3062	24
4439	3058	26
4448	3055	25
4456	3051	26
4465	3050	25
4474	3047	25
4482	3045	24
4492	3041	24
4502	3039	26
4512	3034	25
4522	3029	24
4532	3027	26
4540	3024	24
4551	3021	26
4560	3016	25
4570	2940	25
4580	3182	26
4590	3199	26
4599	3214	25
4609	3258	24
4619	3233	26
4627	3247	25
4637	3258	25
4649	3262	26
4658	3265	24
4669	3269	25
4678	3271	24
4688	3276	26
4697	3278	25
4708	3282	24
4718	3287	25
4729	3291	24
4738	3298	24
4748	2932	25
4757	2923	26
4767	2914	25
4777	2903	24
4786	2900	24
4795	2778	26
4805	2896	25
4815	2893	25
3050	2644	24
3060	2648	25
3070	2650	26
3081	2654	24
3092	2660	25
3104	2662	25
3113	2665	24
3124	2671	25
3133	2672	26
3144	2676	24
3154	2688	24
3167	2692	24
3178	2697	26
3188	2705	24
3198	2709	26
3208	2714	25
3219	2719	26
3228	2722	26
3239	2729	25
3249	2734	26
3259	2736	24
3270	2743	24
3281	2744	26
3291	2749	26
3300	2754	24
3310	2761	26
3321	2765	24
3331	2769	26
3342	2774	25
3352	2779	24
3362	2785	24
3372	2789	26
3382	2792	26
3392	2814	26
3402	2819	25
3439	2837	26
3449	2842	26
3459	2846	26
3469	2853	24
3481	2858	26
3491	2865	26
3501	2869	25
3513	2888	26
3521	2908	24
3533	2912	24
3543	2917	24
3553	2922	25
3562	2924	25
3570	2933	26
3580	2936	24
3590	3302	24
3600	3297	26
3609	3289	24
3620	3254	26
3631	3249	24
3641	3246	24
3652	3241	25
3664	3235	24
3675	3230	24
3685	3226	26
3696	3222	26
3706	3218	26
3717	3212	24
3727	3208	25
3737	3204	26
3746	3200	26
3756	3197	25
3767	3192	26
3776	3186	24
3785	3184	26
3795	3180	24
3805	3175	24
3816	3171	26
3827	2940	24
3839	2944	26
3849	2948	25
3859	2950	25
3869	2955	26
3880	2960	24
3890	2962	26
3901	2966	24
3911	2970	25
3922	2973	24
3932	2976	25
3941	2978	26
3951	2983	24
3961	2986	25
3973	2988	26
3983	2993	25
3993	2996	24
4005	3000	25
4015	3004	24
4027	3009	26
4036	3011	24
4046	3014	26
4056	3065	26
4067	3069	25
4077	3080	26
4087	3075	25
4097	3072	26
4108	3084	24
4118	3088	26
4128	3090	24
4139	3094	25
4150	3098	26
4160	3111	24
4170	3108	26
4180	3104	25
4192	3103	24
4202	3116	25
4212	3119	24
4222	3122	25
4232	3125	26
4243	3129	24
4253	3133	25
4261	3135	25
4270	3391	25
4280	3389	26
4290	3386	24
4301	3383	25
4311	3381	26
4322	3379	25
4333	3376	24
4344	3143	26
4354	3145	25
4366	3146	26
4377	3147	26
4387	3148	25
4398	3359	26
4407	3357	24
4418	3353	24
4428	3063	25
4437	3060	25
4447	3056	24
4457	3053	24
4466	3049	26
4475	3046	26
4487	3043	25
4497	3040	25
4508	3036	24
4519	3032	25
4529	3030	24
4539	3024	25
4549	3022	24
4561	3016	26
4571	2938	25
4582	3183	26
4593	3200	25
4604	3219	26
4615	2898	25
4626	3242	25
4636	3258	26
4646	3261	24
4656	3265	26
4666	3268	25
4677	3271	26
4687	3275	24
4699	3278	26
4709	3283	25
4722	3287	24
4732	3293	26
4742	3303	26
4754	2930	25
4765	2916	26
4775	2903	26
4785	2900	25
4796	2801	24
4806	2896	24
4817	2892	26
4828	2886	24
4838	2881	25
4849	2879	24
4859	2874	25
4869	2870	26
4879	2862	24
4890	2853	25
4901	2842	24
4911	2830	26
4921	2822	24
4933	2811	24
4944	2808	25
4954	2803	25
4964	2799	26
4974	2793	24
4985	2784	26
3051	2644	25
3061	2648	26
3071	2652	24
3083	2654	25
3093	2658	25
3102	2662	26
3112	2666	26
3122	2671	24
3131	2672	25
3141	2675	25
3151	2686	25
3161	2690	26
3171	2696	24
3181	2702	24
3191	2706	24
3201	2711	24
3212	2716	24
3222	2721	26
3232	2726	25
3240	2731	25
3251	2735	25
3261	2736	26
3271	2741	25
3280	2746	25
3289	2749	25
3298	2753	26
3307	2757	26
3317	2762	26
3327	2767	26
3337	2772	25
3347	2777	25
3358	2781	25
3368	2786	26
3378	2797	26
3386	2812	25
3395	2816	26
3405	2820	25
3414	2825	25
3423	2829	25
3432	2834	26
3442	2838	26
3452	2844	26
3462	2849	26
3473	2855	25
3483	2861	26
3493	2864	26
3503	2885	25
3511	2904	24
3522	2908	26
3531	2912	26
3541	2917	25
3551	2921	25
3581	2937	25
3593	3300	25
3602	3295	25
3613	3256	24
3623	3251	25
3633	3248	26
3642	3243	24
3653	3239	25
3662	3235	25
3673	3231	26
3683	3226	24
3692	3222	24
3701	3217	24
3710	3213	26
3720	3209	24
3732	3205	24
3741	3202	25
3750	3198	25
3759	3195	26
3769	3191	26
3778	3186	26
3787	3183	25
3798	3180	26
3808	3174	26
3818	3168	24
3828	2941	24
3837	2945	25
3847	2948	26
3857	2951	26
3866	2955	24
3875	2958	24
3885	2961	24
3895	2963	25
3904	2968	26
3914	2969	26
3924	2974	24
3934	2979	25
3944	2980	26
3954	2984	24
3963	2987	25
3971	2990	25
3980	2993	24
3990	2997	24
4000	2999	25
4010	3003	26
4020	3005	24
4030	3008	25
4040	3013	26
4050	3018	24
4060	3066	25
4070	3070	24
4081	3077	24
4091	3074	26
4101	3081	24
4111	3087	25
4119	3085	25
4129	3090	25
4138	3094	26
4148	3097	24
4159	3111	25
4169	3109	24
4179	3104	26
4189	3103	25
4199	3114	26
4209	3118	24
4220	3121	25
4229	3125	24
4239	3127	24
4249	3131	25
4258	3134	25
4269	3140	25
4279	3389	25
4289	3387	26
4299	3383	24
4308	3381	25
4317	3142	25
4327	3377	25
4337	3374	26
4347	3372	24
4357	3370	25
4365	3367	25
4375	3147	25
4385	3361	26
4395	3359	24
4404	3358	25
4414	3355	25
4423	3069	24
4431	3061	24
4440	3058	25
4450	3055	24
4459	3051	24
4468	3049	24
4477	3044	26
4486	3042	26
4496	3040	26
4506	3036	25
4516	3035	24
4525	3030	26
4535	3026	26
4546	3023	24
4556	3020	26
4566	3018	25
4575	3175	26
4585	3189	25
4594	3205	26
4603	3223	25
4613	2924	24
4624	3241	24
4634	3257	25
4644	3261	26
4654	3264	25
4664	3267	24
4672	3272	26
4681	3274	26
4690	3277	26
4700	3280	25
4710	3283	24
4719	3286	26
4728	3292	25
4739	3299	24
4749	2932	24
4758	2922	26
4768	2912	25
4778	2902	26
4788	2899	25
4798	2700	25
4807	2895	26
4816	2892	25
4826	2888	25
4836	2882	24
4845	2879	26
4855	2875	26
4864	2871	26
3052	2644	26
3063	2649	24
3075	2652	26
3085	2657	26
3095	2659	24
3105	2663	25
3115	2665	26
3125	2669	24
3136	2674	25
3147	2677	24
3158	2689	24
3170	2694	24
3180	2700	26
3190	2704	26
3200	2710	25
3210	2715	25
3221	2720	26
3230	2726	24
3242	2730	25
3252	2735	26
3262	2738	24
3272	2743	26
3283	2746	26
3292	2750	26
3302	2755	26
3313	2760	26
3323	2766	25
3333	2770	26
3343	2775	25
3353	2779	25
3363	2785	25
3373	2790	25
3383	2793	25
3394	2815	24
3408	2820	26
3419	2827	25
3428	2832	25
3437	2836	26
3447	2839	26
3457	2846	24
3467	2852	24
3477	2857	26
3487	2862	26
3499	2869	24
3509	2888	24
3519	2906	25
3530	2911	25
3540	2916	25
3550	2921	24
3560	2925	24
3569	2929	26
3578	2935	26
3588	3301	25
3598	3297	24
3608	3290	26
3618	3254	25
3629	3250	26
3640	3244	25
3650	3240	26
3660	3234	25
3670	3232	26
3681	3227	24
3694	3221	26
3704	3217	26
3715	3214	26
3724	3210	25
3734	3206	25
3743	3201	24
3752	3196	24
3762	3193	24
3771	3190	26
3780	3187	26
3790	3181	24
3800	3178	24
3811	3173	26
3822	2938	24
3832	2942	25
3843	2946	26
3854	2949	25
3868	2954	25
3878	2958	26
3888	2962	24
3899	2965	26
3910	2970	24
3920	2971	26
3931	2976	26
3942	2980	24
3952	2983	25
3964	2986	26
3974	2990	26
3984	2994	24
3994	2996	25
4006	3000	26
4017	3004	26
4026	3007	25
4038	3013	24
4048	3015	25
4058	3064	26
4068	3071	25
4078	3078	25
4088	3075	26
4099	3082	24
4109	3084	26
4120	3085	24
4131	3092	24
4142	3095	25
4153	3099	25
4163	3112	24
4173	3107	26
4184	3105	25
4195	3100	26
4206	3115	26
4217	3120	25
4227	3123	24
4238	3128	26
4248	3131	24
4257	3134	24
4266	3140	24
4276	3390	25
4288	3387	24
4298	3137	26
4309	3381	24
4319	3142	26
4329	3144	24
4340	3373	25
4350	3371	24
4360	3369	25
4373	3366	24
4384	3361	24
4394	3360	26
4405	3358	24
4415	3355	26
4424	3067	24
4433	3059	26
4444	3057	25
4454	3053	26
4463	3050	26
4472	3047	26
4484	3045	25
4494	3038	25
4504	3039	24
4515	3035	25
4526	3031	24
4537	3026	25
4547	3022	26
4557	3020	25
4567	2945	24
4579	3176	24
4589	3196	26
4600	3216	24
4611	3269	26
4622	3236	25
4632	3255	26
4642	3260	25
4653	3264	26
4662	3267	25
4673	3270	24
4683	3274	25
4693	3277	24
4703	3281	25
4713	3285	24
4723	3288	26
4735	3294	25
4745	2936	25
4756	2928	24
4766	2913	26
4776	2903	25
4787	2899	26
4797	2745	24
4808	2895	25
4818	2892	24
4829	2887	24
4840	2881	24
4851	2876	25
4861	2873	25
4871	2869	26
4882	2859	24
4894	2849	24
4904	2840	24
4915	2826	26
4925	2816	25
4935	2806	26
4945	2805	25
4955	2803	24
4966	2799	25
3053	2646	24
3062	2649	25
3074	2652	25
3084	2657	25
3094	2658	26
3103	2663	24
3114	2665	25
3123	2671	26
3134	2674	24
3143	2676	25
3152	2685	24
3162	2691	24
3172	2696	26
3182	2702	26
3193	2706	26
3203	2711	26
3213	2716	26
3224	2723	26
3234	2728	25
3244	2732	24
3254	2733	25
3264	2738	26
3274	2742	24
3282	2748	25
3290	2750	24
3299	2754	26
3308	2761	25
3318	2763	25
3328	2768	25
3338	2773	24
3348	2778	24
3359	2783	24
3369	2788	25
3379	2795	25
3390	2813	24
3401	2818	26
3409	2823	24
3415	2827	24
3424	2830	24
3433	2835	25
3443	2841	25
3454	2845	25
3463	2850	25
3474	2855	26
3484	2860	25
3494	2866	25
3504	2885	26
3514	2904	26
3523	2909	25
3532	2914	24
3542	2917	26
3552	2922	24
3559	2925	26
3567	2929	25
3576	2931	26
3585	3303	25
3595	3299	26
3606	3293	25
3615	3255	25
3625	3252	25
3635	3247	26
3645	3243	26
3655	3236	24
3665	3233	25
3674	3230	26
3684	3226	25
3693	3222	25
3703	3217	25
3713	3216	26
3723	3209	26
3733	3206	24
3742	3202	26
3751	3198	26
3760	3194	25
3770	3190	24
3779	3187	25
3788	3182	24
3799	3177	25
3809	3173	24
3819	3168	25
3829	2941	25
3838	2945	26
3848	2952	24
3858	2950	24
3865	2955	25
3876	2957	26
3886	2961	25
3896	2963	26
3905	2967	24
3915	2972	24
3925	2974	25
3935	2979	26
3945	2981	24
3955	2984	25
3965	2987	26
3975	2991	24
3985	2994	25
3995	2996	26
4004	3001	24
4013	3004	25
4022	3009	24
4032	3010	24
4042	3012	25
4053	3063	26
4063	3068	26
4073	3079	26
4083	3076	24
4093	3073	25
4103	3081	26
4113	3086	25
4123	3089	26
4132	3093	24
4143	3096	24
4152	3099	24
4162	3112	25
4172	3108	24
4182	3105	26
4191	3101	25
4200	3116	26
4210	3118	26
4219	3122	24
4230	3123	26
4240	3127	25
4272	3138	25
4281	3388	25
4291	3386	25
4300	3383	26
4310	3382	24
4320	3379	24
4330	3144	25
4339	3373	26
4349	3372	26
4359	3370	26
4369	3368	25
4379	3365	26
4388	3363	24
4397	3152	24
4408	3357	25
4416	3353	25
4426	3066	26
4435	3059	24
4446	3056	26
4455	3053	25
4464	3050	24
4473	3047	24
4483	3043	26
4493	3038	26
4503	3039	25
4514	3034	24
4524	3031	25
4534	3027	24
4543	3023	26
4552	3019	26
4562	3017	26
4572	3170	24
4581	3185	26
4592	3201	25
4602	3218	25
4612	3292	26
4621	3239	24
4631	3253	24
4640	3259	24
4650	3263	26
4661	3266	25
4671	3270	25
4682	3273	24
4692	3277	25
4702	3281	26
4712	3285	25
4720	3286	24
4730	3292	24
4740	3302	26
4750	2931	25
4760	2921	26
4770	2908	25
4780	2902	24
4790	2898	26
4799	2898	24
4809	2895	24
4820	2891	26
4830	2884	24
4841	2880	26
4850	2876	24
4860	2873	26
4870	2870	25
3054	2646	26
3064	2649	26
3072	2653	24
3082	2654	26
3090	2660	26
3100	2661	26
3110	2666	24
3118	2668	25
3128	2670	24
3138	2673	25
3148	2683	24
3156	2687	25
3163	2692	26
3173	2697	24
3183	2701	24
3192	2707	24
3202	2711	25
3211	2716	25
3220	2721	24
3229	2725	25
3238	2730	24
3248	2734	25
3258	2737	26
3268	2740	25
3277	2745	25
3286	2747	25
3295	2752	24
3304	2756	25
3314	2758	26
3322	2764	25
3332	2770	25
3341	2775	24
3351	2780	25
3361	2784	25
3370	2789	25
3380	2795	26
3389	2813	25
3397	2817	26
3404	2822	26
3412	2824	24
3421	2828	26
3430	2833	25
3440	2840	25
3451	2843	25
3461	2847	26
3471	2854	25
3480	2859	26
3489	2865	25
3497	2868	24
3507	2886	25
3516	2905	26
3526	2910	25
3535	2913	25
3544	2918	26
3574	2934	26
3583	3304	24
3591	3300	24
3601	3296	25
3611	3288	24
3621	3253	26
3628	3249	25
3638	3245	26
3648	3240	24
3656	3238	24
3666	3237	24
3676	3229	24
3686	3225	24
3695	3220	24
3705	3218	24
3712	3214	24
3722	3209	25
3731	3205	25
3738	3203	26
3747	3199	24
3755	3197	26
3765	3192	25
3773	3188	24
3781	3185	24
3789	3182	25
3797	3177	24
3807	3174	25
3817	3170	26
3826	2940	26
3836	2944	25
3845	2947	26
3855	2951	24
3862	2953	26
3872	2956	26
3882	2959	24
3892	2964	25
3902	2966	26
3912	2969	24
3921	2973	25
3929	2976	24
3939	2978	24
3948	2982	25
3959	2985	25
3968	2989	26
3977	2992	24
3986	2995	24
3996	2998	24
4003	3001	25
4011	3002	26
4021	3005	25
4031	3008	26
4041	3012	24
4051	3061	25
4061	3068	24
4071	3070	26
4080	3077	25
4090	3074	25
4098	3082	26
4107	3084	25
4117	3088	25
4127	3091	26
4136	3093	26
4146	3098	24
4155	3113	25
4164	3110	25
4174	3107	25
4183	3105	24
4193	3101	24
4203	3115	24
4213	3119	25
4223	3122	26
4233	3126	24
4242	3129	25
4250	3133	24
4259	3134	26
4268	3140	26
4278	3390	26
4287	3139	26
4297	3137	24
4305	3141	25
4314	3380	25
4324	3378	25
4334	3376	26
4343	3375	24
4351	3371	26
4361	3369	26
4370	3368	26
4380	3364	24
4390	3363	25
4400	3152	26
4409	3151	24
4417	3353	26
4425	3064	24
4434	3059	25
4443	3057	24
4452	3054	24
4460	3052	26
4469	3048	26
4476	3046	25
4485	3043	24
4495	3038	24
4505	3036	26
4513	3035	26
4523	3031	26
4533	3027	25
4542	3025	24
4550	3021	25
4559	3016	24
4569	2942	26
4577	3181	26
4587	3193	26
4596	3210	26
4606	3221	25
4616	3230	25
4623	3246	25
4633	3256	25
4643	3260	24
4651	3263	24
4660	3266	24
4670	3270	26
4679	3273	25
4689	3276	25
4698	3280	26
4707	3283	26
4717	3287	26
4727	3291	25
4737	3297	25
4746	2932	26
4753	2927	24
4763	2918	24
4772	2905	24
3057	2646	25
3068	2650	24
3078	2656	25
3088	2655	26
3098	2661	24
3108	2664	25
3120	2667	26
3132	2670	26
3142	2675	26
3153	2685	25
3166	2691	26
3177	2699	24
3189	2705	26
3199	2710	24
3209	2715	24
3218	2720	24
3231	2725	24
3243	2731	24
3253	2733	24
3263	2738	25
3273	2741	26
3284	2748	24
3293	2751	24
3303	2756	24
3312	2758	25
3324	2764	26
3334	2771	24
3344	2776	24
3354	2782	24
3364	2787	24
3375	2791	24
3387	2794	25
3398	2817	24
3411	2821	26
3420	2828	25
3429	2832	26
3438	2837	25
3448	2842	25
3458	2846	25
3468	2852	26
3478	2858	24
3490	2863	26
3500	2870	24
3512	2889	26
3524	2909	24
3534	2914	26
3545	2918	25
3556	2923	25
3564	2927	26
3572	2930	26
3582	2937	24
3594	3299	25
3604	3295	26
3616	3256	26
3627	3252	26
3637	3245	25
3647	3242	26
3658	3238	25
3668	3237	26
3678	3229	26
3689	3224	24
3702	3223	26
3714	3216	25
3725	3210	24
3735	3206	26
3744	3201	26
3753	3196	25
3763	3193	25
3772	3189	24
3782	3185	25
3791	3181	25
3801	3178	25
3814	3172	26
3824	2939	25
3835	2943	25
3846	2948	24
3856	2951	25
3867	2954	26
3877	2958	25
3887	2961	26
3897	2965	24
3908	2967	25
3919	2971	25
3930	2975	26
3940	2978	25
3950	2982	26
3960	2986	24
3970	2988	25
3981	2992	26
3991	2997	25
4001	2999	26
4014	3002	24
4025	3009	25
4039	3011	26
4049	3015	26
4059	3066	24
4069	3071	26
4079	3078	26
4089	3074	24
4100	3082	25
4110	3087	24
4121	3085	26
4134	3092	25
4144	3096	25
4154	3099	26
4166	3110	26
4177	3106	26
4188	3102	24
4198	3114	25
4208	3117	26
4221	3121	24
4231	3125	25
4241	3127	26
4252	3131	26
4263	3135	26
4273	3138	24
4283	3388	26
4294	3385	25
4304	3384	26
4315	3380	24
4325	3378	26
4336	3374	24
4346	3375	26
4356	3370	24
4368	3367	26
4378	3365	25
4389	3148	26
4399	3152	25
4410	3357	26
4420	3356	24
4429	3062	25
4438	3060	24
4449	3055	26
4458	3051	25
4467	3049	25
4478	3046	24
4489	3042	25
4500	3037	25
4510	3033	24
4520	3029	26
4530	3028	25
4544	3025	26
4554	3019	25
4565	3017	24
4576	3174	24
4586	3191	25
4597	3207	25
4607	3225	26
4617	3232	25
4630	3249	26
4641	3260	26
4652	3263	25
4663	3267	26
4674	3272	25
4684	3274	24
4694	3279	26
4704	3281	24
4715	3284	26
4726	3289	26
4736	3296	26
4747	2935	25
4759	2925	25
4769	2909	26
4779	2902	25
4789	2899	24
4800	2678	26
4811	2894	26
4821	2891	24
4832	2883	26
4842	2880	24
4852	2877	26
4862	2873	24
4872	2868	26
4883	2858	25
4895	2848	26
4905	2837	24
4917	2826	24
4927	2814	25
4938	2809	26
4950	2807	25
4961	2801	25
4971	2796	25
4981	2788	24
4991	2776	26
5002	2766	24
4782	2901	25
4792	2874	24
4802	2897	25
4812	2894	24
4822	2890	26
4831	2883	25
4839	2880	25
4848	2876	26
4858	2874	26
4867	2871	24
4877	2865	24
4887	2855	24
4896	2845	24
4906	2836	24
4914	2828	24
4922	2818	24
4931	2810	26
4941	2808	26
4949	2804	25
4959	2801	26
4969	2798	24
4976	2790	24
4986	2781	26
4995	2771	25
5005	2762	24
5015	2752	25
5024	2729	26
5033	2720	25
5041	2712	24
5051	3305	24
5061	3310	26
5071	3166	25
5079	3313	25
5089	3316	25
5095	3318	26
5103	3163	26
5112	3321	26
5122	3324	25
5132	3327	24
5142	3329	26
5150	3159	26
5159	3333	24
5169	3336	26
5179	2680	25
5189	2684	26
5197	2691	25
5206	2702	25
5216	2710	26
5226	3352	25
5234	3351	26
5244	3153	25
5252	3346	25
5262	3342	25
5272	3340	26
5281	3339	24
4824	2890	24
4835	2882	26
4844	2878	25
4856	2877	24
4866	2872	24
4875	2867	24
4885	2857	25
4893	2850	24
4903	2841	24
4912	2831	26
4924	2820	24
4934	2810	25
4943	2808	24
4953	2804	24
4963	2800	25
4973	2796	24
4983	2786	24
4992	2775	26
5001	2764	24
5011	2755	25
5020	2741	24
5030	2724	25
5039	2714	24
5049	3305	26
5059	3169	25
5068	3309	24
5078	3314	24
5087	3315	24
5098	3317	24
5106	3322	26
5114	3321	24
5124	3325	26
5134	3326	25
5144	3329	24
5154	3332	26
5164	3158	25
5174	2678	25
5182	2683	25
5191	2685	26
5201	2695	24
5211	2704	25
5221	3149	26
5230	3350	26
5241	3349	26
5250	3345	25
5260	3343	26
5271	3340	24
5280	3338	25
5290	3157	26
4847	2879	25
4854	2875	25
4863	2872	25
4873	2867	26
4881	2861	24
4889	2852	25
4899	2843	24
4909	2833	24
4918	2824	25
4928	2813	26
4937	2806	24
4947	2807	26
4957	2802	25
4965	2799	24
4975	2792	24
4984	2783	26
4994	2773	26
5004	2763	24
5014	2751	25
5023	2727	26
5034	2719	25
5043	3306	25
5053	3307	25
5062	3310	24
5072	3166	24
5081	3165	26
5088	3164	26
5097	3318	25
5104	3163	25
5113	3321	25
5123	3324	24
5133	3326	26
5143	3329	25
5153	3159	24
5163	3158	26
5171	2678	24
5180	2680	26
5190	2686	24
5199	2694	26
5209	2703	25
5219	3149	24
5229	3350	25
5238	3348	24
5248	3347	26
5258	3343	24
5266	3344	25
5275	3156	24
5284	3339	26
4874	2866	24
4884	2856	26
4892	2847	24
4902	2838	24
4913	2831	24
4923	2819	24
4932	2810	24
4942	2805	26
4952	2803	26
4962	2800	24
4972	2794	24
4982	2785	26
4993	2774	26
5003	2765	25
5012	2753	25
5021	2739	24
5031	2723	25
5042	2712	26
5052	3307	26
5063	3310	25
5073	3312	26
5083	3165	25
5093	3164	24
5101	3319	24
5109	3320	25
5116	3323	26
5126	3325	24
5136	3328	26
5146	3331	25
5155	3332	24
5165	3158	24
5175	2679	24
5185	2681	24
5195	2689	25
5205	2698	25
5213	2709	25
5223	3354	25
5232	3150	25
5242	3348	26
5253	3346	24
5263	3342	26
5273	3341	24
5282	3339	25
4880	2860	24
4891	2851	24
4900	2839	24
4910	2829	26
4920	2821	24
4930	2811	25
4939	2809	24
4948	2807	24
4958	2802	24
4968	2798	25
4977	2797	24
4987	2782	26
4997	2770	24
5006	2758	24
5016	2749	24
5026	2728	26
5036	2718	26
5045	3167	26
5055	3308	26
5064	3311	25
5074	3312	25
5084	3165	24
5119	3323	24
5129	3161	24
5138	3160	26
5148	3330	26
5158	3333	25
5168	3335	24
5178	2680	24
5187	2684	25
5198	2692	25
5208	2701	25
5218	3356	26
5228	3350	24
5239	3349	24
5249	3345	24
5259	3343	25
5269	3344	26
5279	3338	24
5289	3157	25
4916	2825	24
4926	2815	25
4936	2806	25
4946	2805	24
4956	2802	26
4967	2798	26
4978	2790	26
4988	2779	26
4998	2769	24
5008	2760	24
5017	2746	24
5027	2725	26
5037	2715	26
5047	3167	25
5056	3308	24
5066	3311	24
5076	3314	26
5085	3315	25
5094	3317	26
5105	3163	24
5115	3162	26
5125	3325	25
5135	3326	24
5145	3331	26
5156	3332	25
5166	3335	26
5176	2679	25
5186	2681	26
5196	2690	25
5207	2699	25
5217	3356	25
5227	3352	26
5237	3349	25
5247	3347	25
5257	3154	26
5267	3344	24
5277	3156	25
5286	3337	26
4929	2811	26
4940	2809	25
4951	2804	26
4960	2800	26
4970	2796	26
4980	2789	24
4990	2777	26
4999	2767	24
5009	2761	24
5019	2744	24
5029	2722	25
5040	2714	26
5050	3305	25
5060	3169	24
5070	3166	26
5080	3313	24
5090	3316	24
5099	3318	24
5108	3322	24
5117	3162	24
5127	3161	26
5137	3328	25
5147	3331	24
5157	3333	26
5167	3335	25
5177	2679	26
5188	2684	24
5200	2693	25
5210	2705	25
5220	3149	25
5231	3150	24
5240	3348	25
5251	3345	26
5261	3342	24
5270	3340	25
5283	3338	26
4979	2795	24
4989	2780	26
5000	2768	24
5010	2757	24
5022	2740	26
5032	2721	25
5044	3306	26
5054	3307	24
5065	3311	26
5075	3312	24
5086	3315	26
5096	3317	25
5107	3322	25
5118	3162	25
5128	3161	25
5139	3328	24
5149	3330	25
5160	3334	26
5170	3336	25
5181	2682	24
5192	2686	26
5202	2695	25
5212	2706	25
5222	3354	24
5233	3150	26
5243	3153	24
5254	3346	26
5264	3155	24
5274	3341	25
5285	3337	24
4996	2772	26
5007	2759	24
5018	2750	25
5028	2726	26
5038	2718	24
5048	3167	24
5058	3169	26
5069	3309	25
5082	3313	26
5092	3164	25
5100	3319	26
5110	3320	26
5120	3323	25
5130	3327	26
5140	3160	25
5151	3330	24
5161	3334	25
5173	3336	24
5184	2682	25
5194	2688	26
5204	2696	25
5215	2707	25
5225	3354	26
5236	3351	24
5246	3153	26
5255	3154	24
5265	3155	25
5276	3341	26
5287	3337	25
5013	2754	25
5025	2730	26
5035	2717	25
5046	3306	24
5057	3308	25
5067	3309	26
5077	3314	25
5091	3316	26
5102	3319	25
5111	3320	24
5121	3324	26
5131	3327	25
5141	3160	24
5152	3159	25
5162	3334	24
5172	2677	26
5183	2682	26
5193	2687	26
5203	2697	25
5214	2708	25
5224	3352	24
5235	3351	25
5245	3347	24
5256	3154	25
5268	3155	26
5278	3156	26
5288	3157	24
5291	2585	17
5292	2585	2
5293	3396	1
5294	3381	17
\.


--
-- Data for Name: RepositoryTypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RepositoryTypes" (id, "idRepository", "idCatalog") FROM stdin;
1479	2586	2
1480	2590	19
1481	2590	2
1482	2592	2
1483	2592	19
1484	2586	19
1485	2588	16
1486	2593	16
1487	2587	30
1488	2587	16
1489	2585	15
1490	2594	32
1491	2589	15
1492	2591	15
1493	2597	32
1494	2596	30
1495	2599	32
1496	2595	32
1497	2597	19
1498	2596	32
1499	2598	32
1500	2599	19
1501	2600	17
1502	2598	19
1503	2600	30
1504	2602	30
1505	2602	17
1506	2601	30
1507	2601	17
1508	2604	17
1509	2605	17
1510	2603	17
1511	2605	30
1512	2606	17
1513	2606	30
1514	2607	19
1515	2608	19
1516	2610	20
1517	2609	20
1518	2611	22
1519	2612	22
1520	2613	19
1521	2614	19
1522	2615	19
1523	2615	22
1524	2616	19
1525	2617	19
1526	2618	22
1527	2618	19
1528	2621	23
1529	2622	16
1530	2620	23
1531	2619	17
1532	2624	16
1533	2619	23
1534	2623	23
1535	2623	17
1536	2626	30
1537	2626	19
1538	2625	19
1539	2625	30
1540	2627	2
1541	2628	2
1542	2627	19
1543	2628	19
1544	2629	2
1545	2629	19
1546	2630	2
1547	2630	32
1548	2631	32
1549	2631	2
1550	2632	32
1551	2632	19
1552	2635	32
1553	2635	19
1554	2633	22
1555	2634	22
1556	2639	15
1557	2638	15
1558	2640	24
1559	2637	17
1560	2636	17
1561	2641	16
1562	2643	16
1563	2642	24
1564	2644	15
1565	2645	15
1566	2646	15
1567	2646	24
1568	2647	25
1569	2649	25
1570	2651	24
1571	2650	24
1572	2648	25
1573	2652	24
1574	2656	19
1575	2656	2
1576	2653	2
1577	2654	2
1578	2653	19
1579	2654	19
1580	2655	15
1581	2657	19
1582	2657	15
1583	2655	19
1584	2660	26
1585	2660	22
1586	2658	22
1587	2658	26
1588	2659	26
1589	2659	22
1590	2661	16
1591	2662	16
1592	2663	15
1593	2663	25
1594	2664	15
1595	2664	25
1596	2666	20
1597	2665	20
1598	2666	29
1599	2665	29
1600	2667	17
1601	2667	30
1602	2668	17
1603	2671	17
1604	2668	30
1605	2671	30
1606	2669	15
1607	2670	15
1608	2670	21
1609	2674	19
1610	2672	19
1611	2673	15
1612	2675	15
1613	2675	21
1614	2676	27
1615	2676	19
1616	2677	27
1617	2677	19
1618	2678	27
1619	2678	19
1620	2679	22
1621	2679	26
1622	2680	25
1623	2682	25
1624	2683	15
1625	2681	15
1626	2684	20
1627	2685	25
1628	2686	20
1629	2685	2
1630	2688	2
1631	2688	25
1632	2687	22
1633	2689	22
1634	2690	24
1635	2691	24
1636	2692	17
1637	2693	19
1638	2694	19
1639	2695	22
1640	2695	26
1641	2696	26
1642	2696	22
1643	2697	17
1644	2698	2
1645	2700	15
1646	2699	17
1647	2702	15
1648	2705	15
1649	2701	15
1650	2703	15
1651	2706	25
1652	2706	23
1653	2708	25
1654	2716	17
1655	2713	15
1656	2723	26
1657	2727	21
1658	2722	15
1668	2765	20
1678	2799	21
1689	2839	16
1698	2863	30
1708	2891	24
1718	2927	22
1727	3277	25
1737	3217	17
1747	3196	18
1757	2941	17
1767	2985	15
1777	3076	17
1787	3102	16
1798	3129	27
1808	3140	26
1818	3139	20
1829	3384	24
1839	3379	23
1849	3373	21
1859	3370	26
1869	3366	2
1878	3360	17
1888	3151	32
1898	3354	23
1908	3153	22
1918	3155	2
1926	3338	2
1935	3334	32
1945	3331	17
1955	3161	15
1966	3321	24
1977	3164	25
1986	3314	20
1996	3169	24
2006	2901	19
2016	2891	25
2026	2884	17
2035	2874	22
2045	2867	32
1659	2730	30
1669	2768	15
1680	2804	21
1690	2844	15
1700	2866	23
1710	2899	2
1720	2934	32
1730	3269	22
1740	3214	22
1750	3190	23
1759	2955	17
1769	2991	19
1779	3081	18
1790	3111	32
1799	3133	23
1811	3391	19
1820	3387	28
1830	3141	20
1840	3378	27
1850	3143	30
1860	3370	23
1870	3366	27
1880	3360	30
1890	3355	32
1901	3352	23
1911	3345	32
1922	3340	19
1933	3336	25
1943	3159	15
1952	3327	27
1961	3162	28
1971	3163	23
1981	3315	19
1991	3309	18
2001	3305	26
2011	2896	20
2021	2888	26
2030	2879	17
2040	2870	2
1660	2735	25
1670	2772	2
1681	2805	26
1691	2847	17
1701	2869	2
1711	2902	18
1721	2937	27
1731	3266	24
1741	3209	24
1751	3188	2
1760	2959	2
1770	2994	2
1780	3084	16
1791	3114	30
1800	3132	23
1812	3391	15
1822	3386	26
1832	3141	23
1842	3377	27
1851	3375	30
1863	3369	27
1872	3364	18
1884	3152	30
1894	3149	16
1904	3349	19
1914	3154	2
1924	3341	24
1936	3335	24
1946	3329	26
1957	3161	25
1968	3322	25
1978	3316	25
1988	3312	30
1998	3308	19
2008	2899	19
2018	2890	29
2028	2882	17
2038	2872	17
1661	2739	16
1671	2776	2
1679	2810	30
1686	2833	30
1695	2857	2
1703	2883	26
1713	2909	25
1723	3295	21
1733	3262	17
1743	3205	18
1752	3183	25
1762	2965	25
1771	3000	22
1781	3088	26
1788	3109	30
1797	3130	23
1806	3136	26
1816	3388	20
1826	3137	26
1834	3381	23
1844	3144	27
1854	3372	23
1862	3146	15
1871	3365	16
1881	3359	17
1891	3355	20
1900	3350	26
1910	3345	15
1919	3344	19
1929	3339	2
1937	3334	15
1947	3329	30
1956	3325	17
1965	3320	20
1973	3318	25
1983	3165	24
1992	3311	25
2002	3305	29
2012	2895	20
2022	2886	23
2033	2876	17
2043	2868	30
1662	2747	30
1672	2780	15
1682	2813	18
1692	2852	32
1702	2873	17
1709	2907	16
1719	2929	2
1729	3273	25
1736	3216	28
1746	3199	2
1756	3170	25
1766	2980	24
1775	3070	27
1785	3096	17
1793	3123	17
1802	3134	18
1810	3138	19
1819	3387	26
1828	3383	23
1838	3379	29
1848	3374	21
1857	3145	28
1865	3367	30
1875	3361	15
1883	3362	17
1893	3356	24
1903	3351	15
1913	3346	32
1921	3340	16
1930	3157	23
1940	3333	22
1948	3328	16
1958	3325	28
1967	3320	23
1975	3164	29
1985	3313	24
1994	3310	29
2003	3167	27
2013	2893	20
2023	2886	29
2032	2877	27
2042	2868	32
1663	2744	17
1673	2783	15
1683	2817	17
1693	2854	15
1704	2875	30
1715	2914	28
1726	3288	15
1739	3220	25
1748	3197	29
1758	2945	2
1768	2989	2
1778	3073	16
1789	3106	18
1801	3131	23
1809	3140	15
1821	3139	17
1831	3384	30
1841	3378	2
1852	3143	28
1861	3369	25
1874	3147	16
1885	3152	17
1895	3356	21
1905	3349	15
1915	3343	2
1927	3341	17
1938	3158	32
1949	3160	17
1959	3324	27
1969	3322	23
1979	3316	27
1989	3166	2
1999	3307	19
2009	2898	32
2019	2889	26
2029	2881	24
2039	2871	17
1664	2751	32
1674	2786	17
1684	2821	21
1694	2855	15
1705	2878	17
1714	2917	17
1724	3293	15
1734	3225	25
1744	3204	19
1754	3178	25
1764	2973	26
1774	3009	18
1784	3094	28
1794	3121	2
1804	3135	18
1813	3138	28
1823	3386	28
1833	3381	26
1843	3377	2
1853	3375	28
1864	3146	16
1873	3364	16
1882	3359	30
1892	3353	24
1902	3150	26
1912	3346	15
1923	3344	16
1932	3336	17
1941	3332	27
1951	3326	20
1960	3324	2
1970	3163	2
1980	3315	26
1990	3166	29
2000	3307	28
2010	2897	32
2020	2889	29
2031	2880	24
2041	2870	24
1665	2754	15
1675	2790	17
1685	2827	20
1696	2858	2
1707	2885	17
1717	2923	22
1728	3281	26
1738	3215	27
1749	3194	26
1761	2952	15
1772	2996	2
1782	3091	20
1792	3117	23
1803	3134	25
1814	3390	15
1824	3385	26
1835	3382	28
1845	3144	2
1855	3371	18
1866	3367	2
1876	3148	15
1886	3358	17
1896	3149	30
1906	3348	19
1916	3342	2
1928	3156	17
1939	3333	27
1950	3328	28
1962	3323	28
1972	3319	15
1982	3165	32
1993	3309	28
2004	3167	16
2014	2892	25
2025	2887	27
2036	2875	32
2046	2866	25
1666	2757	23
1676	2792	23
1688	2830	26
1699	2860	17
1712	2894	20
1722	3302	30
1732	3264	15
1742	3208	22
1753	3187	30
1763	2967	30
1773	3004	2
1783	3092	28
1795	3127	27
1805	3135	25
1815	3389	15
1825	3385	21
1836	3380	28
1846	3376	27
1856	3371	30
1867	3368	2
1879	3363	15
1889	3151	20
1899	3352	32
1909	3347	22
1920	3155	23
1931	3337	2
1942	3332	22
1953	3326	29
1963	3162	24
1976	3319	23
1987	3312	29
1997	3169	27
2007	2900	19
2017	2890	26
2027	2882	23
2037	2874	32
1667	2759	25
1677	2796	32
1687	2836	2
1697	2858	18
1706	2888	29
1716	2921	26
1725	3285	25
1735	3221	18
1745	3201	15
1755	3173	29
1765	2976	30
1776	3010	27
1786	3100	2
1796	3129	29
1807	3136	15
1817	3388	17
1827	3137	21
1837	3142	28
1847	3376	2
1858	3145	22
1868	3368	30
1877	3363	23
1887	3357	32
1897	3354	32
1907	3348	15
1917	3342	23
1925	3156	24
1934	3158	15
1944	3330	17
1954	3327	23
1964	3321	28
1974	3317	25
1984	3313	32
1995	3310	23
2005	3306	20
2015	2892	24
2024	2887	18
2034	2877	32
2044	2867	15
2047	2864	23
2048	2864	25
2049	2865	25
2050	2865	23
2051	2862	30
2052	2862	15
2053	2863	15
2054	2860	30
2055	2861	30
2056	2861	17
2057	2859	2
2058	2859	18
2059	2856	15
2060	2856	2
2061	2854	2
2062	2855	2
2063	2853	19
2064	2853	32
2065	2851	30
2066	2851	32
2067	2850	32
2068	2845	18
2069	2846	17
2070	2848	18
2071	2849	32
2072	2843	22
2073	2844	22
2074	2843	15
2075	2842	15
2076	2839	24
2077	2841	24
2078	2841	16
2079	2838	16
2080	2840	2
2081	2834	30
2082	2835	25
2083	2837	2
2084	2835	2
2085	2834	16
2086	2833	25
2087	2832	18
2088	2832	26
2089	2830	22
2090	2829	22
2091	2829	26
2092	2831	15
2093	2825	17
2094	2828	16
2095	2826	17
2096	2824	16
2097	2823	20
2098	2821	25
2099	2822	24
2100	2820	24
2101	2819	17
2102	2818	17
2103	2816	22
2104	2814	28
2105	2815	22
2106	2814	15
2107	2812	16
2108	2813	16
2109	2812	18
2110	2811	30
2111	2811	29
2112	2810	15
2113	2806	30
2114	2809	15
2115	2806	21
2116	2808	15
2117	2805	15
2118	2807	22
2119	2807	21
2120	2804	22
2121	2803	26
2122	2803	16
2123	2802	16
2124	2801	17
2125	2799	18
2126	2800	17
2127	2798	24
2128	2798	32
2129	2796	26
2130	2794	29
2131	2794	32
2132	2793	19
2133	2793	15
2134	2797	22
2135	2795	23
2136	2797	29
2137	2791	30
2138	2789	29
2139	2791	22
2140	2789	32
2141	2788	32
2142	2786	25
2143	2787	25
2144	2785	25
2145	2784	27
2146	2781	30
2147	2783	25
2148	2781	18
2149	2779	25
2150	2778	15
2151	2780	22
2152	2778	22
2153	2782	18
2154	2760	23
2155	2777	30
2156	2726	30
2157	2777	32
2158	2775	2
2159	2771	30
2160	2774	17
2161	2773	2
2162	2773	30
2163	2772	30
2164	2771	2
2165	2770	15
2166	2769	26
2167	2768	23
2168	2767	23
2169	2767	15
2170	2766	2
2171	2764	20
2172	2762	30
2173	2763	20
2174	2762	25
2175	2759	30
2176	2758	30
2177	2758	23
2178	2761	23
2179	2761	17
2180	2756	20
2181	2755	20
2182	2755	15
2183	2754	20
2184	2753	30
2185	2753	19
2186	2752	19
2187	2750	30
2188	2751	19
2189	2752	32
2190	2750	32
2191	2749	30
2192	2749	32
2193	2747	17
2203	2736	2
2214	2724	26
2224	3128	27
2234	3115	17
2244	3109	17
2254	3100	24
2265	3093	22
2275	3087	16
2282	3074	30
2292	3078	17
2302	3068	24
2312	3058	28
2322	3051	20
2331	3045	20
2342	3040	2
2353	2704	15
2362	2723	15
2371	3028	15
2381	3232	30
2414	3204	24
2424	3195	17
2434	3185	21
2444	3180	27
2455	3171	28
2464	2947	24
2473	2958	18
2482	2968	17
2491	2975	25
2502	2984	22
2512	2905	15
2522	2913	28
2531	2922	26
2541	2928	22
2551	2935	17
2561	3296	21
2571	3286	28
2581	3278	29
2592	3272	2
2602	3261	17
2614	3254	20
2624	3245	32
2634	3241	15
2644	3016	18
2654	3013	15
2663	3006	26
2672	2998	15
2682	2990	2
2194	2748	30
2205	2733	25
2215	2721	17
2226	3128	29
2236	3116	17
2247	3107	17
2259	3096	25
2271	3085	24
2283	3072	29
2293	3080	29
2303	3066	22
2314	3057	27
2323	3049	29
2336	3043	32
2372	3028	30
2382	3231	17
2391	3221	19
2402	3213	28
2412	3206	19
2422	3196	21
2432	3186	21
2443	3180	20
2452	3171	27
2463	2946	16
2474	2957	18
2484	2967	17
2495	2979	22
2504	2987	24
2514	2906	22
2524	2916	18
2534	2926	15
2544	2933	2
2556	3301	27
2568	3292	15
2578	3282	29
2588	3274	30
2599	3265	15
2609	3257	32
2620	3249	26
2630	3243	30
2642	3022	25
2652	3012	15
2659	3005	26
2669	2999	18
2678	2992	19
2688	3234	15
2195	2748	17
2204	2737	2
2213	2722	26
2222	3127	29
2232	3119	23
2242	3110	30
2251	3102	25
2260	3095	15
2269	3089	30
2279	3083	18
2288	3076	30
2297	3071	27
2306	3063	21
2315	3056	27
2321	3050	20
2329	3044	29
2338	3038	27
2347	3033	30
2356	2711	32
2365	2727	30
2374	3029	21
2384	3228	18
2393	3220	29
2400	3216	22
2409	3207	32
2419	3199	21
2430	3189	32
2440	3181	27
2449	3174	15
2458	2942	25
2468	2949	15
2500	2983	15
2509	2904	15
2518	2914	22
2528	2918	30
2537	2924	15
2547	2930	32
2557	3299	18
2565	3290	15
2575	3283	29
2584	3276	15
2593	3267	16
2603	3260	17
2613	3251	2
2622	3247	29
2632	3240	20
2643	3020	18
2653	3013	26
2661	3005	32
2668	3001	22
2676	2994	23
2685	3233	17
2196	2745	15
2206	2734	30
2216	2719	20
2225	3126	25
2235	3115	16
2245	3108	22
2255	3099	2
2264	3092	20
2270	3086	29
2280	3081	28
2290	3077	30
2300	3069	28
2308	3059	28
2318	3055	27
2326	3046	29
2333	3042	15
2341	3037	2
2348	3034	2
2357	2714	15
2366	2725	15
2375	3031	21
2385	3229	27
2394	3222	25
2401	3213	22
2410	3207	19
2420	3198	2
2429	3190	30
2438	3182	29
2448	3175	28
2457	2939	18
2467	2948	24
2477	2961	16
2485	2970	17
2492	2976	25
2501	2984	15
2510	2903	18
2519	2912	22
2527	2918	28
2538	2925	15
2548	2934	26
2558	3300	25
2566	3291	15
2574	3285	29
2585	3277	28
2594	3268	16
2604	3261	30
2612	3253	20
2623	3247	26
2633	3242	30
2640	3019	17
2648	3014	26
2656	3008	25
2665	3002	16
2674	2995	23
2684	2988	2
2197	2742	15
2207	2734	28
2217	2715	21
2227	3125	25
2237	3116	16
2246	3108	17
2256	3097	2
2266	3090	16
2276	3087	32
2286	3074	18
2296	3079	18
2307	3065	32
2316	3055	16
2324	3048	29
2332	3045	32
2340	3040	19
2349	3033	20
2358	2715	15
2367	2729	30
2379	3032	21
2388	3227	17
2397	3219	25
2404	3212	17
2413	3206	24
2423	3197	20
2433	3187	22
2441	3179	27
2451	3173	16
2461	2943	2
2471	2953	17
2479	2964	15
2487	2969	20
2496	2977	29
2506	2989	32
2516	2908	16
2526	2917	30
2536	2926	22
2546	2930	26
2555	3302	2
2567	3293	21
2577	3283	25
2587	3274	28
2597	3266	16
2607	3258	17
2617	3252	19
2628	3246	32
2635	3024	25
2646	3017	19
2681	2991	32
2198	2746	17
2208	2732	28
2218	2714	30
2228	3124	18
2240	3114	32
2250	3105	15
2261	3095	24
2274	3085	2
2285	3082	28
2295	3080	18
2304	3066	20
2313	3057	16
2325	3052	20
2334	3043	20
2345	3039	29
2354	2708	21
2363	2724	15
2373	3030	15
2383	3230	17
2392	3222	29
2403	3215	18
2411	3205	19
2421	3198	21
2431	3189	30
2442	3179	21
2453	3172	17
2465	2944	2
2475	2956	17
2483	2968	30
2494	2975	30
2505	2986	24
2515	2906	16
2525	2916	2
2535	2923	15
2545	2933	26
2554	3303	27
2564	3294	15
2576	3284	30
2586	3275	22
2596	3267	24
2606	3259	17
2616	3252	2
2626	3244	2
2638	3239	15
2647	3018	19
2662	3008	30
2671	3000	18
2680	2993	32
2689	3235	15
2199	2741	15
2211	2730	16
2221	2707	30
2231	3120	2
2241	3112	16
2252	3103	16
2262	3094	21
2273	3088	24
2284	3072	32
2294	3079	29
2305	3064	32
2317	3056	16
2327	3047	29
2337	3041	27
2346	3036	32
2355	2709	20
2364	2725	26
2376	3030	30
2386	3228	30
2395	3223	26
2405	3214	28
2415	3203	2
2428	3193	2
2439	3182	26
2450	3174	28
2460	2942	16
2470	2950	17
2480	2963	15
2489	2971	26
2499	2981	24
2511	2903	15
2521	2913	22
2532	2921	25
2542	2928	25
2552	2936	17
2562	3295	15
2573	3287	28
2583	3279	25
2595	3269	2
2605	3260	30
2615	3251	19
2625	3244	32
2637	3236	2
2649	3015	26
2660	3007	24
2670	2999	22
2679	2992	32
2690	3238	2
2200	2743	16
2209	2729	20
2219	2712	17
2229	3124	24
2238	3113	32
2248	3106	15
2257	3098	29
2267	3090	28
2277	3084	32
2287	3075	30
2298	3070	22
2309	3062	21
2319	3054	25
2328	3046	2
2335	3041	15
2344	3039	32
2351	2707	32
2359	2717	15
2368	2731	28
2377	3035	17
2387	3226	17
2396	3219	23
2406	3211	24
2418	3202	15
2426	3192	20
2436	3184	17
2446	3176	25
2456	2938	15
2466	2948	16
2476	2960	2
2486	2970	30
2493	2977	22
2503	2985	22
2513	2907	22
2523	2915	2
2533	2922	25
2543	2929	26
2553	3304	27
2563	3294	21
2572	3284	28
2582	3279	28
2591	3270	2
2601	3262	30
2611	3255	20
2621	3248	29
2631	3242	32
2641	3021	17
2651	3012	26
2657	3009	24
2666	3003	16
2675	2995	2
2686	3237	27
2201	2740	16
2210	2728	17
2220	2710	16
2230	3122	24
2239	3112	30
2249	3104	15
2258	3098	32
2268	3091	30
2278	3083	28
2289	3075	18
2299	3071	22
2310	3061	21
2343	3037	19
2352	3035	2
2360	2720	16
2369	3026	25
2378	3237	30
2389	3224	19
2398	3218	17
2407	3209	29
2416	3200	15
2425	3194	22
2435	3185	22
2445	3177	25
2454	3168	15
2462	2947	16
2472	2954	17
2481	2966	25
2490	2974	26
2498	2982	24
2508	2902	15
2520	2911	17
2529	2920	19
2539	2924	18
2549	2931	15
2559	3298	25
2569	3289	15
2579	3282	25
2589	3273	29
2598	3263	15
2608	3258	15
2618	3250	26
2627	3246	30
2636	3025	25
2645	3015	30
2655	3011	27
2664	3006	32
2673	2997	2
2683	2990	32
2202	2738	2
2212	2726	26
2223	2704	25
2233	3118	23
2243	3110	16
2253	3101	16
2263	3093	30
2272	3086	24
2281	3082	18
2291	3077	17
2301	3067	24
2311	3060	28
2320	3053	25
2330	3044	2
2339	3038	15
2350	3034	17
2361	2718	17
2370	3027	25
2380	3232	27
2390	3224	18
2399	3218	30
2408	3210	22
2417	3200	30
2427	3191	16
2437	3183	24
2447	3175	29
2459	2940	2
2469	2951	15
2478	2962	16
2488	2972	20
2497	2978	17
2507	2988	32
2517	2910	25
2530	2919	17
2540	2927	25
2550	2932	15
2560	3297	21
2570	3289	26
2580	3280	21
2590	3271	25
2600	3263	29
2610	3256	32
2619	3248	26
2629	3243	32
2639	3023	25
2650	3014	30
2658	3007	18
2667	3001	18
2677	2993	19
2687	3235	22
2691	2585	8
2692	3396	8
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" (id, email, username, password, "firstName", "lastName", type, "createdAt", "updatedAt", "profileImage") FROM stdin;
1	admin@admin	admin	Nyan	Admin	Is Admin	1	\N	\N	/public/profiles/admin.gif
2	xxsorielxx@gmail.com	Soriel	Nyan	Soriel	Vallejo	2	2018-11-20 14:18:05.000653	\N	/public/profiles/admin.gif
\.


--
-- Data for Name: Verification_Token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Verification_Token" (id, "idUser", username, token, type, "createdAt", "expiredAt", column_8) FROM stdin;
\.


--
-- Name: Blog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Blog_id_seq"', 2, true);


--
-- Name: BundleComment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."BundleComment_id_seq"', 1, false);


--
-- Name: BundleRepository_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."BundleRepository_id_seq"', 2, true);


--
-- Name: Bundle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Bundle_id_seq"', 1, false);


--
-- Name: CatalogAuthors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CatalogAuthors_id_seq"', 2, true);


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

SELECT pg_catalog.setval('public."Repositories_id_seq"', 3399, true);


--
-- Name: RepositoryAuthors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RepositoryAuthors_id_seq"', 9, true);


--
-- Name: RepositoryComment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RepositoryComment_id_seq"', 23, true);


--
-- Name: RepositoryEditorials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RepositoryEditorials_id_seq"', 2, true);


--
-- Name: RepositoryResources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RepositoryResources_id_seq"', 828, true);


--
-- Name: RepositoryScore_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RepositoryScore_id_seq"', 1, false);


--
-- Name: RepositoryTopics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RepositoryTopics_id_seq"', 5294, true);


--
-- Name: RepositoryTypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RepositoryTypes_id_seq"', 2692, true);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_id_seq"', 2, true);


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

SELECT pg_catalog.setval('public.catalogtypes_id_seq', 42, true);


--
-- Name: Blog Blog_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Blog"
    ADD CONSTRAINT "Blog_id_key" UNIQUE (id);


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
-- Name: Blog Blog_idUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Blog"
    ADD CONSTRAINT "Blog_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);


--
-- Name: Blog Blog_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Blog"
    ADD CONSTRAINT "Blog_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);


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

