PGDMP         6             
    v            repo-development    11.1    11.1 �    r           0    0    ENCODING    ENCODING     #   SET client_encoding = 'SQL_ASCII';
                       false            s           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            t           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            u           1262    16641    repo-development    DATABASE     u   CREATE DATABASE "repo-development" WITH TEMPLATE = template0 ENCODING = 'SQL_ASCII' LC_COLLATE = 'C' LC_CTYPE = 'C';
 "   DROP DATABASE "repo-development";
             postgres    false            �            1259    33610    Blog    TABLE     �  CREATE TABLE public."Blog" (
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
    DROP TABLE public."Blog";
       public         postgres    false            �            1259    33608    Blog_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Blog_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Blog_id_seq";
       public       postgres    false    237            v           0    0    Blog_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Blog_id_seq" OWNED BY public."Blog".id;
            public       postgres    false    236            �            1259    33267    Bundle    TABLE     S  CREATE TABLE public."Bundle" (
    id integer NOT NULL,
    "idUser" integer NOT NULL,
    title character varying(80) NOT NULL,
    description character varying(200) NOT NULL,
    oficial boolean DEFAULT false,
    username character varying(20) NOT NULL,
    "createdAt" timestamp without time zone,
    image character varying(120)
);
    DROP TABLE public."Bundle";
       public         postgres    false            �            1259    33271    BundleComment    TABLE     C  CREATE TABLE public."BundleComment" (
    id integer NOT NULL,
    "idUser" integer NOT NULL,
    username character varying(20) NOT NULL,
    "idBundle" integer NOT NULL,
    comment character varying(255) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);
 #   DROP TABLE public."BundleComment";
       public         postgres    false            �            1259    33275    BundleComment_id_seq    SEQUENCE        CREATE SEQUENCE public."BundleComment_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."BundleComment_id_seq";
       public       postgres    false    197            w           0    0    BundleComment_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."BundleComment_id_seq" OWNED BY public."BundleComment".id;
            public       postgres    false    198            �            1259    33277    BundleRepository    TABLE     �   CREATE TABLE public."BundleRepository" (
    id integer NOT NULL,
    "idBundle" integer NOT NULL,
    "idRepository" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);
 &   DROP TABLE public."BundleRepository";
       public         postgres    false            �            1259    33281    BundleRepository_id_seq    SEQUENCE     �   CREATE SEQUENCE public."BundleRepository_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."BundleRepository_id_seq";
       public       postgres    false    199            x           0    0    BundleRepository_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."BundleRepository_id_seq" OWNED BY public."BundleRepository".id;
            public       postgres    false    200            �            1259    33283    Bundle_id_seq    SEQUENCE     x   CREATE SEQUENCE public."Bundle_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Bundle_id_seq";
       public       postgres    false    196            y           0    0    Bundle_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Bundle_id_seq" OWNED BY public."Bundle".id;
            public       postgres    false    201            �            1259    33285    CatalogAuthors    TABLE     &  CREATE TABLE public."CatalogAuthors" (
    id integer NOT NULL,
    image character varying(100),
    description character varying(200),
    "lastName" character varying(40) NOT NULL,
    "firstName" character varying(40) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);
 $   DROP TABLE public."CatalogAuthors";
       public         postgres    false            �            1259    33289    CatalogAuthors_id_seq    SEQUENCE     �   CREATE SEQUENCE public."CatalogAuthors_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."CatalogAuthors_id_seq";
       public       postgres    false    202            z           0    0    CatalogAuthors_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."CatalogAuthors_id_seq" OWNED BY public."CatalogAuthors".id;
            public       postgres    false    203            �            1259    33291    CatalogEditorials    TABLE     �   CREATE TABLE public."CatalogEditorials" (
    id integer NOT NULL,
    image character varying(100),
    description character varying(200),
    name character varying(80) NOT NULL
);
 '   DROP TABLE public."CatalogEditorials";
       public         postgres    false            �            1259    33294    CatalogEditorials_id_seq    SEQUENCE     �   CREATE SEQUENCE public."CatalogEditorials_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."CatalogEditorials_id_seq";
       public       postgres    false    204            {           0    0    CatalogEditorials_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."CatalogEditorials_id_seq" OWNED BY public."CatalogEditorials".id;
            public       postgres    false    205            �            1259    33296    CatalogTopics    TABLE     �   CREATE TABLE public."CatalogTopics" (
    id integer NOT NULL,
    value character varying(30) NOT NULL,
    description character varying(200) DEFAULT ''::character varying NOT NULL,
    image character varying(100)
);
 #   DROP TABLE public."CatalogTopics";
       public         postgres    false            �            1259    33300    CatalogTopics_id_seq    SEQUENCE        CREATE SEQUENCE public."CatalogTopics_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."CatalogTopics_id_seq";
       public       postgres    false    206            |           0    0    CatalogTopics_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."CatalogTopics_id_seq" OWNED BY public."CatalogTopics".id;
            public       postgres    false    207            �            1259    33302    CatalogTypes    TABLE     �   CREATE TABLE public."CatalogTypes" (
    id integer NOT NULL,
    value character varying(30) NOT NULL,
    description character varying(200) DEFAULT ''::character varying,
    image character varying(100)
);
 "   DROP TABLE public."CatalogTypes";
       public         postgres    false            �            1259    33306    CatalogTypes_id_seq    SEQUENCE     ~   CREATE SEQUENCE public."CatalogTypes_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."CatalogTypes_id_seq";
       public       postgres    false    208            }           0    0    CatalogTypes_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."CatalogTypes_id_seq" OWNED BY public."CatalogTypes".id;
            public       postgres    false    209            �            1259    33308    Files    TABLE     �   CREATE TABLE public."Files" (
    id integer NOT NULL,
    type smallint NOT NULL,
    path character varying(80) NOT NULL,
    url character varying(80) NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);
    DROP TABLE public."Files";
       public         postgres    false            �            1259    33311    Files_id_seq    SEQUENCE     w   CREATE SEQUENCE public."Files_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Files_id_seq";
       public       postgres    false    210            ~           0    0    Files_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Files_id_seq" OWNED BY public."Files".id;
            public       postgres    false    211            �            1259    33313    MyList    TABLE       CREATE TABLE public."MyList" (
    id integer NOT NULL,
    "idUser" integer NOT NULL,
    username character varying(20) NOT NULL,
    "idRepository" integer NOT NULL,
    type smallint DEFAULT 0,
    "createdAt" timestamp without time zone DEFAULT now()
);
    DROP TABLE public."MyList";
       public         postgres    false            �            1259    33318    MyList_id_seq    SEQUENCE     x   CREATE SEQUENCE public."MyList_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."MyList_id_seq";
       public       postgres    false    212                       0    0    MyList_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."MyList_id_seq" OWNED BY public."MyList".id;
            public       postgres    false    213            �            1259    33320    Repositories    TABLE     N  CREATE TABLE public."Repositories" (
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
 "   DROP TABLE public."Repositories";
       public         postgres    false            �            1259    33325    Repositories_id_seq    SEQUENCE     ~   CREATE SEQUENCE public."Repositories_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Repositories_id_seq";
       public       postgres    false    214            �           0    0    Repositories_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Repositories_id_seq" OWNED BY public."Repositories".id;
            public       postgres    false    215            �            1259    33327    RepositoryAuthors    TABLE     y   CREATE TABLE public."RepositoryAuthors" (
    id integer NOT NULL,
    "idRepository" integer,
    "idAuthor" integer
);
 '   DROP TABLE public."RepositoryAuthors";
       public         postgres    false            �            1259    33330    RepositoryAuthors_id_seq    SEQUENCE     �   CREATE SEQUENCE public."RepositoryAuthors_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."RepositoryAuthors_id_seq";
       public       postgres    false    216            �           0    0    RepositoryAuthors_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."RepositoryAuthors_id_seq" OWNED BY public."RepositoryAuthors".id;
            public       postgres    false    217            �            1259    33332    RepositoryComment    TABLE     K  CREATE TABLE public."RepositoryComment" (
    id integer NOT NULL,
    "idUser" integer NOT NULL,
    username character varying(20) NOT NULL,
    "idRepository" integer NOT NULL,
    comment character varying(255) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);
 '   DROP TABLE public."RepositoryComment";
       public         postgres    false            �            1259    33336    RepositoryComment_id_seq    SEQUENCE     �   CREATE SEQUENCE public."RepositoryComment_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."RepositoryComment_id_seq";
       public       postgres    false    218            �           0    0    RepositoryComment_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."RepositoryComment_id_seq" OWNED BY public."RepositoryComment".id;
            public       postgres    false    219            �            1259    33338    RepositoryEditorials    TABLE     }   CREATE TABLE public."RepositoryEditorials" (
    id integer NOT NULL,
    "idRepository" integer,
    "idCatalog" integer
);
 *   DROP TABLE public."RepositoryEditorials";
       public         postgres    false            �            1259    33341    RepositoryEditorials_id_seq    SEQUENCE     �   CREATE SEQUENCE public."RepositoryEditorials_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public."RepositoryEditorials_id_seq";
       public       postgres    false    220            �           0    0    RepositoryEditorials_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public."RepositoryEditorials_id_seq" OWNED BY public."RepositoryEditorials".id;
            public       postgres    false    221            �            1259    33343    RepositoryResources    TABLE     �  CREATE TABLE public."RepositoryResources" (
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
 )   DROP TABLE public."RepositoryResources";
       public         postgres    false            �            1259    33349    RepositoryResources_id_seq    SEQUENCE     �   CREATE SEQUENCE public."RepositoryResources_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."RepositoryResources_id_seq";
       public       postgres    false    222            �           0    0    RepositoryResources_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."RepositoryResources_id_seq" OWNED BY public."RepositoryResources".id;
            public       postgres    false    223            �            1259    33351    RepositoryScore    TABLE     8  CREATE TABLE public."RepositoryScore" (
    id integer NOT NULL,
    "idUser" integer NOT NULL,
    username character varying(20) NOT NULL,
    score smallint NOT NULL,
    comment character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);
 %   DROP TABLE public."RepositoryScore";
       public         postgres    false            �            1259    33355    RepositoryScore_id_seq    SEQUENCE     �   CREATE SEQUENCE public."RepositoryScore_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."RepositoryScore_id_seq";
       public       postgres    false    224            �           0    0    RepositoryScore_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."RepositoryScore_id_seq" OWNED BY public."RepositoryScore".id;
            public       postgres    false    225            �            1259    33357    RepositoryTopics    TABLE     y   CREATE TABLE public."RepositoryTopics" (
    id integer NOT NULL,
    "idRepository" integer,
    "idCatalog" integer
);
 &   DROP TABLE public."RepositoryTopics";
       public         postgres    false            �            1259    33360    RepositoryTopics_id_seq    SEQUENCE     �   CREATE SEQUENCE public."RepositoryTopics_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."RepositoryTopics_id_seq";
       public       postgres    false    226            �           0    0    RepositoryTopics_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."RepositoryTopics_id_seq" OWNED BY public."RepositoryTopics".id;
            public       postgres    false    227            �            1259    33362    RepositoryTypes    TABLE     x   CREATE TABLE public."RepositoryTypes" (
    id integer NOT NULL,
    "idRepository" integer,
    "idCatalog" integer
);
 %   DROP TABLE public."RepositoryTypes";
       public         postgres    false            �            1259    33365    RepositoryTypes_id_seq    SEQUENCE     �   CREATE SEQUENCE public."RepositoryTypes_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."RepositoryTypes_id_seq";
       public       postgres    false    228            �           0    0    RepositoryTypes_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."RepositoryTypes_id_seq" OWNED BY public."RepositoryTypes".id;
            public       postgres    false    229            �            1259    33367    Users    TABLE     �  CREATE TABLE public."Users" (
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
    DROP TABLE public."Users";
       public         postgres    false            �            1259    33372    Users_id_seq    SEQUENCE     w   CREATE SEQUENCE public."Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Users_id_seq";
       public       postgres    false    230            �           0    0    Users_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;
            public       postgres    false    231            �            1259    33374    Verification_Token    TABLE     N  CREATE TABLE public."Verification_Token" (
    id integer NOT NULL,
    "idUser" integer NOT NULL,
    username character varying(20),
    token character varying(120) NOT NULL,
    type smallint NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now(),
    "expiredAt" timestamp without time zone,
    column_8 boolean
);
 (   DROP TABLE public."Verification_Token";
       public         postgres    false            �            1259    33378    Verification_Token_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Verification_Token_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public."Verification_Token_id_seq";
       public       postgres    false    232            �           0    0    Verification_Token_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."Verification_Token_id_seq" OWNED BY public."Verification_Token".id;
            public       postgres    false    233            �            1259    33380    catalogtopics_id_seq    SEQUENCE     }   CREATE SEQUENCE public.catalogtopics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.catalogtopics_id_seq;
       public       postgres    false    206            �           0    0    catalogtopics_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.catalogtopics_id_seq OWNED BY public."CatalogTopics".id;
            public       postgres    false    234            �            1259    33382    catalogtypes_id_seq    SEQUENCE     |   CREATE SEQUENCE public.catalogtypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.catalogtypes_id_seq;
       public       postgres    false    208            �           0    0    catalogtypes_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.catalogtypes_id_seq OWNED BY public."CatalogTypes".id;
            public       postgres    false    235            v           2604    33613    Blog id    DEFAULT     f   ALTER TABLE ONLY public."Blog" ALTER COLUMN id SET DEFAULT nextval('public."Blog_id_seq"'::regclass);
 8   ALTER TABLE public."Blog" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    237    236    237            O           2604    16660 	   Bundle id    DEFAULT     j   ALTER TABLE ONLY public."Bundle" ALTER COLUMN id SET DEFAULT nextval('public."Bundle_id_seq"'::regclass);
 :   ALTER TABLE public."Bundle" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    196            Q           2604    16661    BundleComment id    DEFAULT     x   ALTER TABLE ONLY public."BundleComment" ALTER COLUMN id SET DEFAULT nextval('public."BundleComment_id_seq"'::regclass);
 A   ALTER TABLE public."BundleComment" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    197            S           2604    16662    BundleRepository id    DEFAULT     ~   ALTER TABLE ONLY public."BundleRepository" ALTER COLUMN id SET DEFAULT nextval('public."BundleRepository_id_seq"'::regclass);
 D   ALTER TABLE public."BundleRepository" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    199            U           2604    16663    CatalogAuthors id    DEFAULT     z   ALTER TABLE ONLY public."CatalogAuthors" ALTER COLUMN id SET DEFAULT nextval('public."CatalogAuthors_id_seq"'::regclass);
 B   ALTER TABLE public."CatalogAuthors" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    202            V           2604    16664    CatalogEditorials id    DEFAULT     �   ALTER TABLE ONLY public."CatalogEditorials" ALTER COLUMN id SET DEFAULT nextval('public."CatalogEditorials_id_seq"'::regclass);
 E   ALTER TABLE public."CatalogEditorials" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204            X           2604    16665    CatalogTopics id    DEFAULT     v   ALTER TABLE ONLY public."CatalogTopics" ALTER COLUMN id SET DEFAULT nextval('public.catalogtopics_id_seq'::regclass);
 A   ALTER TABLE public."CatalogTopics" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    234    206            Z           2604    16666    CatalogTypes id    DEFAULT     t   ALTER TABLE ONLY public."CatalogTypes" ALTER COLUMN id SET DEFAULT nextval('public.catalogtypes_id_seq'::regclass);
 @   ALTER TABLE public."CatalogTypes" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    235    208            [           2604    16667    Files id    DEFAULT     h   ALTER TABLE ONLY public."Files" ALTER COLUMN id SET DEFAULT nextval('public."Files_id_seq"'::regclass);
 9   ALTER TABLE public."Files" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    211    210            ^           2604    16668 	   MyList id    DEFAULT     j   ALTER TABLE ONLY public."MyList" ALTER COLUMN id SET DEFAULT nextval('public."MyList_id_seq"'::regclass);
 :   ALTER TABLE public."MyList" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    213    212            a           2604    16669    Repositories id    DEFAULT     v   ALTER TABLE ONLY public."Repositories" ALTER COLUMN id SET DEFAULT nextval('public."Repositories_id_seq"'::regclass);
 @   ALTER TABLE public."Repositories" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    215    214            e           2604    16670    RepositoryAuthors id    DEFAULT     �   ALTER TABLE ONLY public."RepositoryAuthors" ALTER COLUMN id SET DEFAULT nextval('public."RepositoryAuthors_id_seq"'::regclass);
 E   ALTER TABLE public."RepositoryAuthors" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    217    216            g           2604    16671    RepositoryComment id    DEFAULT     �   ALTER TABLE ONLY public."RepositoryComment" ALTER COLUMN id SET DEFAULT nextval('public."RepositoryComment_id_seq"'::regclass);
 E   ALTER TABLE public."RepositoryComment" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    219    218            h           2604    16672    RepositoryEditorials id    DEFAULT     �   ALTER TABLE ONLY public."RepositoryEditorials" ALTER COLUMN id SET DEFAULT nextval('public."RepositoryEditorials_id_seq"'::regclass);
 H   ALTER TABLE public."RepositoryEditorials" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    221    220            l           2604    16673    RepositoryResources id    DEFAULT     �   ALTER TABLE ONLY public."RepositoryResources" ALTER COLUMN id SET DEFAULT nextval('public."RepositoryResources_id_seq"'::regclass);
 G   ALTER TABLE public."RepositoryResources" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    223    222            n           2604    16674    RepositoryScore id    DEFAULT     |   ALTER TABLE ONLY public."RepositoryScore" ALTER COLUMN id SET DEFAULT nextval('public."RepositoryScore_id_seq"'::regclass);
 C   ALTER TABLE public."RepositoryScore" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    225    224            o           2604    16675    RepositoryTopics id    DEFAULT     ~   ALTER TABLE ONLY public."RepositoryTopics" ALTER COLUMN id SET DEFAULT nextval('public."RepositoryTopics_id_seq"'::regclass);
 D   ALTER TABLE public."RepositoryTopics" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    227    226            p           2604    16676    RepositoryTypes id    DEFAULT     |   ALTER TABLE ONLY public."RepositoryTypes" ALTER COLUMN id SET DEFAULT nextval('public."RepositoryTypes_id_seq"'::regclass);
 C   ALTER TABLE public."RepositoryTypes" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    229    228            s           2604    16677    Users id    DEFAULT     h   ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);
 9   ALTER TABLE public."Users" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    231    230            u           2604    16678    Verification_Token id    DEFAULT     �   ALTER TABLE ONLY public."Verification_Token" ALTER COLUMN id SET DEFAULT nextval('public."Verification_Token_id_seq"'::regclass);
 F   ALTER TABLE public."Verification_Token" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    233    232            o          0    33610    Blog 
   TABLE DATA               u   COPY public."Blog" (id, "idUser", username, title, slug, description, image, content, tags, "createdAt") FROM stdin;
    public       postgres    false    237   &�       F          0    33267    Bundle 
   TABLE DATA               k   COPY public."Bundle" (id, "idUser", title, description, oficial, username, "createdAt", image) FROM stdin;
    public       postgres    false    196   ��       G          0    33271    BundleComment 
   TABLE DATA               p   COPY public."BundleComment" (id, "idUser", username, "idBundle", comment, "createdAt", "updatedAt") FROM stdin;
    public       postgres    false    197   ��       I          0    33277    BundleRepository 
   TABLE DATA               Y   COPY public."BundleRepository" (id, "idBundle", "idRepository", "createdAt") FROM stdin;
    public       postgres    false    199   ��       L          0    33285    CatalogAuthors 
   TABLE DATA               h   COPY public."CatalogAuthors" (id, image, description, "lastName", "firstName", "createdAt") FROM stdin;
    public       postgres    false    202   ��       N          0    33291    CatalogEditorials 
   TABLE DATA               K   COPY public."CatalogEditorials" (id, image, description, name) FROM stdin;
    public       postgres    false    204   ��       P          0    33296    CatalogTopics 
   TABLE DATA               H   COPY public."CatalogTopics" (id, value, description, image) FROM stdin;
    public       postgres    false    206   K�       R          0    33302    CatalogTypes 
   TABLE DATA               G   COPY public."CatalogTypes" (id, value, description, image) FROM stdin;
    public       postgres    false    208   �       T          0    33308    Files 
   TABLE DATA               C   COPY public."Files" (id, type, path, url, "createdAt") FROM stdin;
    public       postgres    false    210   %�       V          0    33313    MyList 
   TABLE DATA               ]   COPY public."MyList" (id, "idUser", username, "idRepository", type, "createdAt") FROM stdin;
    public       postgres    false    212   B�       X          0    33320    Repositories 
   TABLE DATA               �   COPY public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt", slug, content) FROM stdin;
    public       postgres    false    214   _�       Z          0    33327    RepositoryAuthors 
   TABLE DATA               M   COPY public."RepositoryAuthors" (id, "idRepository", "idAuthor") FROM stdin;
    public       postgres    false    216   Yf      \          0    33332    RepositoryComment 
   TABLE DATA               x   COPY public."RepositoryComment" (id, "idUser", username, "idRepository", comment, "createdAt", "updatedAt") FROM stdin;
    public       postgres    false    218   �f      ^          0    33338    RepositoryEditorials 
   TABLE DATA               Q   COPY public."RepositoryEditorials" (id, "idRepository", "idCatalog") FROM stdin;
    public       postgres    false    220   �g      `          0    33343    RepositoryResources 
   TABLE DATA               �   COPY public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt", name, description) FROM stdin;
    public       postgres    false    222   �g      b          0    33351    RepositoryScore 
   TABLE DATA               m   COPY public."RepositoryScore" (id, "idUser", username, score, comment, "createdAt", "updatedAt") FROM stdin;
    public       postgres    false    224   �      d          0    33357    RepositoryTopics 
   TABLE DATA               M   COPY public."RepositoryTopics" (id, "idRepository", "idCatalog") FROM stdin;
    public       postgres    false    226   �      f          0    33362    RepositoryTypes 
   TABLE DATA               L   COPY public."RepositoryTypes" (id, "idRepository", "idCatalog") FROM stdin;
    public       postgres    false    228   ��      h          0    33367    Users 
   TABLE DATA               �   COPY public."Users" (id, email, username, password, "firstName", "lastName", type, "createdAt", "updatedAt", "profileImage") FROM stdin;
    public       postgres    false    230   ��      j          0    33374    Verification_Token 
   TABLE DATA               w   COPY public."Verification_Token" (id, "idUser", username, token, type, "createdAt", "expiredAt", column_8) FROM stdin;
    public       postgres    false    232   :�      �           0    0    Blog_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."Blog_id_seq"', 2, true);
            public       postgres    false    236            �           0    0    BundleComment_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."BundleComment_id_seq"', 1, false);
            public       postgres    false    198            �           0    0    BundleRepository_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."BundleRepository_id_seq"', 2, true);
            public       postgres    false    200            �           0    0    Bundle_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Bundle_id_seq"', 1, false);
            public       postgres    false    201            �           0    0    CatalogAuthors_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."CatalogAuthors_id_seq"', 2, true);
            public       postgres    false    203            �           0    0    CatalogEditorials_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."CatalogEditorials_id_seq"', 1, false);
            public       postgres    false    205            �           0    0    CatalogTopics_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."CatalogTopics_id_seq"', 3, true);
            public       postgres    false    207            �           0    0    CatalogTypes_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."CatalogTypes_id_seq"', 4, true);
            public       postgres    false    209            �           0    0    Files_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Files_id_seq"', 1, false);
            public       postgres    false    211            �           0    0    MyList_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."MyList_id_seq"', 1, false);
            public       postgres    false    213            �           0    0    Repositories_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Repositories_id_seq"', 3399, true);
            public       postgres    false    215            �           0    0    RepositoryAuthors_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."RepositoryAuthors_id_seq"', 9, true);
            public       postgres    false    217            �           0    0    RepositoryComment_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."RepositoryComment_id_seq"', 23, true);
            public       postgres    false    219            �           0    0    RepositoryEditorials_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."RepositoryEditorials_id_seq"', 2, true);
            public       postgres    false    221            �           0    0    RepositoryResources_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."RepositoryResources_id_seq"', 828, true);
            public       postgres    false    223            �           0    0    RepositoryScore_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."RepositoryScore_id_seq"', 1, false);
            public       postgres    false    225            �           0    0    RepositoryTopics_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."RepositoryTopics_id_seq"', 5294, true);
            public       postgres    false    227            �           0    0    RepositoryTypes_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."RepositoryTypes_id_seq"', 2692, true);
            public       postgres    false    229            �           0    0    Users_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Users_id_seq"', 2, true);
            public       postgres    false    231            �           0    0    Verification_Token_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."Verification_Token_id_seq"', 1, false);
            public       postgres    false    233            �           0    0    catalogtopics_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.catalogtopics_id_seq', 42, true);
            public       postgres    false    234            �           0    0    catalogtypes_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.catalogtypes_id_seq', 42, true);
            public       postgres    false    235            �           2606    33621    Blog Blog_id_key 
   CONSTRAINT     M   ALTER TABLE ONLY public."Blog"
    ADD CONSTRAINT "Blog_id_key" UNIQUE (id);
 >   ALTER TABLE ONLY public."Blog" DROP CONSTRAINT "Blog_id_key";
       public         postgres    false    237            }           2606    16679     BundleComment BundleComment_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."BundleComment"
    ADD CONSTRAINT "BundleComment_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."BundleComment" DROP CONSTRAINT "BundleComment_pkey";
       public         postgres    false    197                       2606    16680 &   BundleRepository BundleRepository_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."BundleRepository"
    ADD CONSTRAINT "BundleRepository_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public."BundleRepository" DROP CONSTRAINT "BundleRepository_pkey";
       public         postgres    false    199            {           2606    16681    Bundle Bundle_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Bundle"
    ADD CONSTRAINT "Bundle_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Bundle" DROP CONSTRAINT "Bundle_pkey";
       public         postgres    false    196            �           2606    16682 "   CatalogAuthors CatalogAuthors_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."CatalogAuthors"
    ADD CONSTRAINT "CatalogAuthors_pkey" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public."CatalogAuthors" DROP CONSTRAINT "CatalogAuthors_pkey";
       public         postgres    false    202            �           2606    16683 (   CatalogEditorials CatalogEditorials_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."CatalogEditorials"
    ADD CONSTRAINT "CatalogEditorials_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."CatalogEditorials" DROP CONSTRAINT "CatalogEditorials_pkey";
       public         postgres    false    204            �           2606    16684     CatalogTopics CatalogTopics_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."CatalogTopics"
    ADD CONSTRAINT "CatalogTopics_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."CatalogTopics" DROP CONSTRAINT "CatalogTopics_pkey";
       public         postgres    false    206            �           2606    16685    CatalogTypes CatalogTypes_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."CatalogTypes"
    ADD CONSTRAINT "CatalogTypes_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."CatalogTypes" DROP CONSTRAINT "CatalogTypes_pkey";
       public         postgres    false    208            �           2606    16686    Files Files_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Files"
    ADD CONSTRAINT "Files_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Files" DROP CONSTRAINT "Files_pkey";
       public         postgres    false    210            �           2606    16687    Files Files_url_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public."Files"
    ADD CONSTRAINT "Files_url_key" UNIQUE (url);
 A   ALTER TABLE ONLY public."Files" DROP CONSTRAINT "Files_url_key";
       public         postgres    false    210            �           2606    16688    MyList MyList_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."MyList"
    ADD CONSTRAINT "MyList_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."MyList" DROP CONSTRAINT "MyList_pkey";
       public         postgres    false    212            �           2606    16689    Repositories Repositories_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Repositories"
    ADD CONSTRAINT "Repositories_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."Repositories" DROP CONSTRAINT "Repositories_pkey";
       public         postgres    false    214            �           2606    16690 (   RepositoryAuthors RepositoryAuthors_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."RepositoryAuthors"
    ADD CONSTRAINT "RepositoryAuthors_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."RepositoryAuthors" DROP CONSTRAINT "RepositoryAuthors_pkey";
       public         postgres    false    216            �           2606    16691 (   RepositoryComment RepositoryComment_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."RepositoryComment"
    ADD CONSTRAINT "RepositoryComment_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."RepositoryComment" DROP CONSTRAINT "RepositoryComment_pkey";
       public         postgres    false    218            �           2606    16692 .   RepositoryEditorials RepositoryEditorials_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."RepositoryEditorials"
    ADD CONSTRAINT "RepositoryEditorials_pkey" PRIMARY KEY (id);
 \   ALTER TABLE ONLY public."RepositoryEditorials" DROP CONSTRAINT "RepositoryEditorials_pkey";
       public         postgres    false    220            �           2606    16693 ,   RepositoryResources RepositoryResources_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."RepositoryResources"
    ADD CONSTRAINT "RepositoryResources_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public."RepositoryResources" DROP CONSTRAINT "RepositoryResources_pkey";
       public         postgres    false    222            �           2606    16694 $   RepositoryScore RepositoryScore_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."RepositoryScore"
    ADD CONSTRAINT "RepositoryScore_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."RepositoryScore" DROP CONSTRAINT "RepositoryScore_pkey";
       public         postgres    false    224            �           2606    16695 &   RepositoryTopics RepositoryTopics_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."RepositoryTopics"
    ADD CONSTRAINT "RepositoryTopics_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public."RepositoryTopics" DROP CONSTRAINT "RepositoryTopics_pkey";
       public         postgres    false    226            �           2606    16696 $   RepositoryTypes RepositoryTypes_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."RepositoryTypes"
    ADD CONSTRAINT "RepositoryTypes_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."RepositoryTypes" DROP CONSTRAINT "RepositoryTypes_pkey";
       public         postgres    false    228            �           2606    16697    Users Users_email_key 
   CONSTRAINT     U   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);
 C   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key";
       public         postgres    false    230            �           2606    16698    Users Users_id_key 
   CONSTRAINT     O   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_id_key" UNIQUE (id);
 @   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_id_key";
       public         postgres    false    230            �           2606    16700    Users Users_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id, username);
 >   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
       public         postgres    false    230    230            �           2606    16701    Users Users_username_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key" UNIQUE (username);
 F   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key";
       public         postgres    false    230            �           2606    16702 *   Verification_Token Verification_Token_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."Verification_Token"
    ADD CONSTRAINT "Verification_Token_pkey" PRIMARY KEY (id);
 X   ALTER TABLE ONLY public."Verification_Token" DROP CONSTRAINT "Verification_Token_pkey";
       public         postgres    false    232            �           1259    33451    catalogeditorials_name_uindex    INDEX     d   CREATE UNIQUE INDEX catalogeditorials_name_uindex ON public."CatalogEditorials" USING btree (name);
 1   DROP INDEX public.catalogeditorials_name_uindex;
       public         postgres    false    204            �           1259    33452    catalogtopics_value_uindex    INDEX     ^   CREATE UNIQUE INDEX catalogtopics_value_uindex ON public."CatalogTopics" USING btree (value);
 .   DROP INDEX public.catalogtopics_value_uindex;
       public         postgres    false    206            �           1259    33453    catalogtypes_value_uindex    INDEX     \   CREATE UNIQUE INDEX catalogtypes_value_uindex ON public."CatalogTypes" USING btree (value);
 -   DROP INDEX public.catalogtypes_value_uindex;
       public         postgres    false    208            �           2606    33622    Blog Blog_idUser_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public."Blog"
    ADD CONSTRAINT "Blog_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);
 C   ALTER TABLE ONLY public."Blog" DROP CONSTRAINT "Blog_idUser_fkey";
       public       postgres    false    230    2980    237            �           2606    33627    Blog Blog_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Blog"
    ADD CONSTRAINT "Blog_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);
 E   ALTER TABLE ONLY public."Blog" DROP CONSTRAINT "Blog_username_fkey";
       public       postgres    false    2984    230    237            �           2606    16703 )   BundleComment BundleComment_idBundle_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."BundleComment"
    ADD CONSTRAINT "BundleComment_idBundle_fkey" FOREIGN KEY ("idBundle") REFERENCES public."Bundle"(id);
 W   ALTER TABLE ONLY public."BundleComment" DROP CONSTRAINT "BundleComment_idBundle_fkey";
       public       postgres    false    197    196    2939            �           2606    16708 '   BundleComment BundleComment_idUser_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."BundleComment"
    ADD CONSTRAINT "BundleComment_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);
 U   ALTER TABLE ONLY public."BundleComment" DROP CONSTRAINT "BundleComment_idUser_fkey";
       public       postgres    false    2980    197    230            �           2606    16713 )   BundleComment BundleComment_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."BundleComment"
    ADD CONSTRAINT "BundleComment_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);
 W   ALTER TABLE ONLY public."BundleComment" DROP CONSTRAINT "BundleComment_username_fkey";
       public       postgres    false    197    230    2984            �           2606    16718 /   BundleRepository BundleRepository_idBundle_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."BundleRepository"
    ADD CONSTRAINT "BundleRepository_idBundle_fkey" FOREIGN KEY ("idBundle") REFERENCES public."Bundle"(id);
 ]   ALTER TABLE ONLY public."BundleRepository" DROP CONSTRAINT "BundleRepository_idBundle_fkey";
       public       postgres    false    199    196    2939            �           2606    16723 3   BundleRepository BundleRepository_idRepository_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."BundleRepository"
    ADD CONSTRAINT "BundleRepository_idRepository_fkey" FOREIGN KEY ("idRepository") REFERENCES public."Repositories"(id);
 a   ALTER TABLE ONLY public."BundleRepository" DROP CONSTRAINT "BundleRepository_idRepository_fkey";
       public       postgres    false    199    214    2962            �           2606    16728    Bundle Bundle_idUser_fkey    FK CONSTRAINT        ALTER TABLE ONLY public."Bundle"
    ADD CONSTRAINT "Bundle_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);
 G   ALTER TABLE ONLY public."Bundle" DROP CONSTRAINT "Bundle_idUser_fkey";
       public       postgres    false    196    230    2980            �           2606    16733    Bundle Bundle_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Bundle"
    ADD CONSTRAINT "Bundle_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);
 I   ALTER TABLE ONLY public."Bundle" DROP CONSTRAINT "Bundle_username_fkey";
       public       postgres    false    196    230    2984            �           2606    16738    MyList MyList_idRepository_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."MyList"
    ADD CONSTRAINT "MyList_idRepository_fkey" FOREIGN KEY ("idRepository") REFERENCES public."Repositories"(id);
 M   ALTER TABLE ONLY public."MyList" DROP CONSTRAINT "MyList_idRepository_fkey";
       public       postgres    false    212    214    2962            �           2606    16743    MyList MyList_idUser_fkey    FK CONSTRAINT        ALTER TABLE ONLY public."MyList"
    ADD CONSTRAINT "MyList_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);
 G   ALTER TABLE ONLY public."MyList" DROP CONSTRAINT "MyList_idUser_fkey";
       public       postgres    false    212    230    2980            �           2606    16748    MyList MyList_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."MyList"
    ADD CONSTRAINT "MyList_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);
 I   ALTER TABLE ONLY public."MyList" DROP CONSTRAINT "MyList_username_fkey";
       public       postgres    false    212    230    2984            �           2606    16753 %   Repositories Repositories_idUser_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Repositories"
    ADD CONSTRAINT "Repositories_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);
 S   ALTER TABLE ONLY public."Repositories" DROP CONSTRAINT "Repositories_idUser_fkey";
       public       postgres    false    214    230    2980            �           2606    16758 '   Repositories Repositories_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Repositories"
    ADD CONSTRAINT "Repositories_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);
 U   ALTER TABLE ONLY public."Repositories" DROP CONSTRAINT "Repositories_username_fkey";
       public       postgres    false    214    230    2984            �           2606    16763 1   RepositoryAuthors RepositoryAuthors_idAuthor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryAuthors"
    ADD CONSTRAINT "RepositoryAuthors_idAuthor_fkey" FOREIGN KEY ("idAuthor") REFERENCES public."CatalogAuthors"(id);
 _   ALTER TABLE ONLY public."RepositoryAuthors" DROP CONSTRAINT "RepositoryAuthors_idAuthor_fkey";
       public       postgres    false    202    2945    216            �           2606    16768 5   RepositoryAuthors RepositoryAuthors_idRepository_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryAuthors"
    ADD CONSTRAINT "RepositoryAuthors_idRepository_fkey" FOREIGN KEY ("idRepository") REFERENCES public."Repositories"(id);
 c   ALTER TABLE ONLY public."RepositoryAuthors" DROP CONSTRAINT "RepositoryAuthors_idRepository_fkey";
       public       postgres    false    214    216    2962            �           2606    16773 5   RepositoryComment RepositoryComment_idRepositoty_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryComment"
    ADD CONSTRAINT "RepositoryComment_idRepositoty_fkey" FOREIGN KEY ("idRepository") REFERENCES public."Repositories"(id);
 c   ALTER TABLE ONLY public."RepositoryComment" DROP CONSTRAINT "RepositoryComment_idRepositoty_fkey";
       public       postgres    false    214    218    2962            �           2606    16778 /   RepositoryComment RepositoryComment_idUser_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryComment"
    ADD CONSTRAINT "RepositoryComment_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);
 ]   ALTER TABLE ONLY public."RepositoryComment" DROP CONSTRAINT "RepositoryComment_idUser_fkey";
       public       postgres    false    2980    230    218            �           2606    16783 1   RepositoryComment RepositoryComment_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryComment"
    ADD CONSTRAINT "RepositoryComment_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);
 _   ALTER TABLE ONLY public."RepositoryComment" DROP CONSTRAINT "RepositoryComment_username_fkey";
       public       postgres    false    230    218    2984            �           2606    16788 8   RepositoryEditorials RepositoryEditorials_idCatalog_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryEditorials"
    ADD CONSTRAINT "RepositoryEditorials_idCatalog_fkey" FOREIGN KEY ("idCatalog") REFERENCES public."CatalogEditorials"(id);
 f   ALTER TABLE ONLY public."RepositoryEditorials" DROP CONSTRAINT "RepositoryEditorials_idCatalog_fkey";
       public       postgres    false    2947    220    204            �           2606    16793 ;   RepositoryEditorials RepositoryEditorials_idRepository_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryEditorials"
    ADD CONSTRAINT "RepositoryEditorials_idRepository_fkey" FOREIGN KEY ("idRepository") REFERENCES public."Repositories"(id);
 i   ALTER TABLE ONLY public."RepositoryEditorials" DROP CONSTRAINT "RepositoryEditorials_idRepository_fkey";
       public       postgres    false    220    214    2962            �           2606    16798 9   RepositoryResources RepositoryResources_idRepository_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryResources"
    ADD CONSTRAINT "RepositoryResources_idRepository_fkey" FOREIGN KEY ("idRepository") REFERENCES public."Repositories"(id);
 g   ALTER TABLE ONLY public."RepositoryResources" DROP CONSTRAINT "RepositoryResources_idRepository_fkey";
       public       postgres    false    214    222    2962            �           2606    16803 3   RepositoryResources RepositoryResources_idUser_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryResources"
    ADD CONSTRAINT "RepositoryResources_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);
 a   ALTER TABLE ONLY public."RepositoryResources" DROP CONSTRAINT "RepositoryResources_idUser_fkey";
       public       postgres    false    222    230    2980            �           2606    16808 5   RepositoryResources RepositoryResources_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryResources"
    ADD CONSTRAINT "RepositoryResources_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);
 c   ALTER TABLE ONLY public."RepositoryResources" DROP CONSTRAINT "RepositoryResources_username_fkey";
       public       postgres    false    222    230    2984            �           2606    16813 +   RepositoryScore RepositoryScore_idUser_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryScore"
    ADD CONSTRAINT "RepositoryScore_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);
 Y   ALTER TABLE ONLY public."RepositoryScore" DROP CONSTRAINT "RepositoryScore_idUser_fkey";
       public       postgres    false    224    230    2980            �           2606    16818 -   RepositoryScore RepositoryScore_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryScore"
    ADD CONSTRAINT "RepositoryScore_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);
 [   ALTER TABLE ONLY public."RepositoryScore" DROP CONSTRAINT "RepositoryScore_username_fkey";
       public       postgres    false    224    230    2984            �           2606    16823 0   RepositoryTopics RepositoryTopics_idCatalog_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryTopics"
    ADD CONSTRAINT "RepositoryTopics_idCatalog_fkey" FOREIGN KEY ("idCatalog") REFERENCES public."CatalogTopics"(id);
 ^   ALTER TABLE ONLY public."RepositoryTopics" DROP CONSTRAINT "RepositoryTopics_idCatalog_fkey";
       public       postgres    false    226    206    2950            �           2606    16828 3   RepositoryTopics RepositoryTopics_idRepository_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryTopics"
    ADD CONSTRAINT "RepositoryTopics_idRepository_fkey" FOREIGN KEY ("idRepository") REFERENCES public."Repositories"(id);
 a   ALTER TABLE ONLY public."RepositoryTopics" DROP CONSTRAINT "RepositoryTopics_idRepository_fkey";
       public       postgres    false    226    214    2962            �           2606    16833 .   RepositoryTypes RepositoryTypes_idCatalog_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryTypes"
    ADD CONSTRAINT "RepositoryTypes_idCatalog_fkey" FOREIGN KEY ("idCatalog") REFERENCES public."CatalogTypes"(id);
 \   ALTER TABLE ONLY public."RepositoryTypes" DROP CONSTRAINT "RepositoryTypes_idCatalog_fkey";
       public       postgres    false    228    208    2953            �           2606    16838 1   RepositoryTypes RepositoryTypes_idRepository_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryTypes"
    ADD CONSTRAINT "RepositoryTypes_idRepository_fkey" FOREIGN KEY ("idRepository") REFERENCES public."Repositories"(id);
 _   ALTER TABLE ONLY public."RepositoryTypes" DROP CONSTRAINT "RepositoryTypes_idRepository_fkey";
       public       postgres    false    228    214    2962            �           2606    16843 1   Verification_Token Verification_Token_idUser_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Verification_Token"
    ADD CONSTRAINT "Verification_Token_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);
 _   ALTER TABLE ONLY public."Verification_Token" DROP CONSTRAINT "Verification_Token_idUser_fkey";
       public       postgres    false    232    230    2980            �           2606    16848 3   Verification_Token Verification_Token_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Verification_Token"
    ADD CONSTRAINT "Verification_Token_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);
 a   ALTER TABLE ONLY public."Verification_Token" DROP CONSTRAINT "Verification_Token_username_fkey";
       public       postgres    false    2984    232    230            o   �  x�mV]oG|�E~�jiъ#�0%J�>�>]�%����r����ǚ����U/�N/���t�TWU��lu��wvg{[�ѿ�p8�Noqz{s����])C�Y.��"w�g��^:�ML�R�}[��}yYvշ��r�]>���o\�c��~��ٳ�p��5C�Ϟ�χ��8�1Q�}�LR��d���8W�xĔ�x���Sz�dP�E�E����0�ƞ���u���=�}?�7⚪_нMlǙLM�.������`Hr��]}D�4 �|��S�9s�%6t�93%�0�O��d3ev	���@����ݬ���f�vg(�"Rwd$�Qj
5/ EC��1t�iD��$=��U$��|�8�q��*�S�2}b�y>'�㹠�R����k�]�X���G�$��F�9� Rd��P6xD��5�	U\�����©-t�p�� ?�(宲{�5Xc���u�=i:���.�Q�|�!��8p�%u��s�������K�,�&.6�&w�M��6�M6�n��0��~y������
o�cLe�&���S�C���У��9@	&v���k���NkL��o��ܘc+	(r)��B�4$AS�}�,��
��u��ۤ�S��-�!Cm�5�.o��T��j���0р?X4@	�=ز�ֆ�-��f~���BPP-�y�������g��yrC��� J�F� �ϙ*���'l=�{��BЅ�ͮxw��t��{��)T�@!W��H��Z�B�SF��]'8�A-l(�X҈S��T�;O��KN��z��kj!�qb(00U�i�]聝8���h �S�����hs��8#$/�*#S�h��%����Z&�Zڢe�J����
�w*!Ř�G���(�N�+�CE(n��%�^��ἡ�b���1,jT���Vդ(������*���m۩���"�c���b��M· Ed뫞�q�<��Ct ?@���,�-u�j��pmձ������]J���f(~�{�q`�ލ�]R(2��7���;���_�|q7���)7�
y8?��|��yf��"��'N�F���1�Þ�{M^036;�|y\���ð�xfJ�9%kv��f?�/��7� d�{+ƨN���B�[�����&�W>�<��?X��9]|�����o������[W���;�h�з:�wI>>�fS��	ޅ��xb�E��FU1&O�>��?L���gN���@����,�=.���K�0�3�VlC<��PJ4;�GC?9?��i���W:�Jr��U��oH:�@
!�h����tz�����K��ګ�D=����Ll��\�S1Mv5Ɍ�}C�t���5�+�C����os�P8�h:��AX��
�t������9�<*T2��h9�J��:͉���d@��q�/�_� Saڃ¶x�v�@��@s2e���v6�#p�h����<)�R��P�t���P��X]P��38�J�:OqvPFj�ۀ��=�stn��T,R�z5"��a�'��a`0�_�[+�o�i�9ᆔ:�F�X&� �dn�@٠z�y4.���r$=���N�5����Y����k����VJ���0
@�T�6\��e_�C'/�;������m!�6��ӧ���G�>�[a�3҉	V��ދ�v�[�B��^.��8�ճ���ˋ�3Z=��|ys�j^^�~x�d�<y��̏]      F   �   x�m̽� F��� �H��6��.D^-�� z��C�&g<y���Cc��*�8rAe����� �Ğ��mfc����zI$M'�2�3RW�٫��ZG8oU�+lD��u�S�mpz>e�}e�~�z��?����4�      G      x������ � �      I   A   x�Mʱ�0��L��I�	�Y��)�����P�����.f�n�^�8e����q�K��=nf/r�      L   �   x�u��M�0��v���~����r�T�ńlb��#�(�ƝJ��N��*B	��4}3H�������mƱ�$^�v���l�'r�`�`���xS!V(@
ݠ�;֡D�h�?�<�ګ��/No���
��cu#��T����<��6��C�&��������U�a/�HnC�r���L�9����x�y���w8���!��Ο϶��#��;i�&*� [-[]#}d��o�f�      N   I   x�3��/(M��L�/J-�/�,�/�L-�OM�s�MM�,--���-�
��9�2�JR�R�9��=... ���      P   �  x����r� ���S�����9M���v;�LN��6u�b����������>���~҇��gF��u}y�
�N&L�m����t��G�S�ɧ���Ք��qF�:=��Hx��][�~*tV�����܉<\����S)�W�%C���(�Wp�ʢ�] ����SA�}\�\7�qz5�];5�ׁ�V~h��J!E��R6�j�}V�Aw��S������=��5�e�:�}V��4���gʰN#��:h��Y�Q6g�� �� 7�j˼���!xɋ������,�&�����o�C	7�3������Ɩd��͙�9���Y��3-9��\�)��]K��8].��xQ�L헰���:�L#:��!�T���RTRVgZ��-�oe�cIn��\��)	�P�'��iRجg�`*��2��*˲�Vz8�      R     x����n�8������E��M�mm�v��#Q
YD9Yc�wߑ��ب��`S#���g���W�)�	�L>ۣ �6���T��������}C�E��;\�������v�27��}��ϭK~��B(X�c�mm���H� ��֗���������!q�.Y"y�%����mp
e}v��}N2E*�\Cљ�7p���d��k�y�!�_V��4
���2.�t�s?h���_�����v#�V����`k�����t��L�R��R.��q���\3D�6��յ�֠d��r�
è���x@���R�����MchYo����A���H-a"����LlCN��=��41s$6�$��2���$2��\�`?3��L��Y�2OD���:��/�7�Ś�000�(MFF;�a��!�b��IP\��"���"jW��� c����b:�\1�y:b2�Y�� O>���o�j䱰���U�2�pw�C<ٯgVh��*Iǌ��7���R����Ը��!�7&�8�ݫ	��,�.%"��=6ǽ�|�=׆ӑ�Ʒ�bL*�X1;��n����6�+]��NMaK��b�$�z����W���Y��(�)�Q3���	��j?��3,��\,��wGs��G�t�������vQ��ewG���p}ʠ�.`o��E��LDʓxU7�Ǩ_��\*��1��Ҹ�|���<��J����@��3����3�-��*�)�|�rI�sP��ZGm)T�>�W�6�g�������v�X,�
�ٓ      T      x������ � �      V      x������ � �      X      x���ۖ�Ʊ6x�y�Zk.�M�|�]�ےl�������M�D�A�¡��W��o�?�<Ǽ�<�d""�I"�+��Ve��U��<��ED���?�������P�4O���+��-�?��{��T��?�����iXW��/��gE���(vr��(��8�"/�V�z��Z}���?������DO^�U�}E+/J�<����ϭ�[>���Ǣ۴�iS6���A<!�kw����{*��Ss(�M�TǢm���$M����S��_�"�����զ9��es�	~�����l�^��_�w��w����mE{x�v���O����8�ʋVi���G�f��(�����e?�i�q@~������ݩ;o���ݮm�z��m6�/�*��4V�t�M[��S7���h��3zǢ��i���E?�Ob[��nS�;�Mٯ�>ۧ���n[�Ԗ� ����⩗З���}Q�~:�E[��x����E�T������ԉ]��e'l׉�ӇVtO��U?y��Oܔ곔ob/����EUu_t�<�b3T�[��ޔۡ�G�O�Vz��w���( ��'1H��^����S%��E��Az�s�ȧ�-����;�<[��W�W#�iS��V�9Qj��R�B�TQ�O@~� �R������ڀ�O/M5�'�'�t�����Ǧ.6��P�����=�y�f�7��]+^J�d�b����~D=���ˇX���P���hWO�'WǿUv�S'?*e%����?R����-Z�]��wO�İQD]��W�e�Ə����/�[�cӮ���K4����N���T��Xl6ñ����Yˏ]���M�?D�����S�$E=O��o�;�?��i��Ly������S/!Z`�ީ��_N�M�)���?=������Y�����î��?��Ƽ'�?�f[6�m�_�����뿩wl'�@W��m:��ꥐ�||�~R�I�o���G��[9AK>@Q˅�i�Ö/��wj�균����'9�%���7静�ঙjm(��(������mzK�c>=�M/|U����[�ztTz^�O��ӳ���O���i���U��x����Ԏo��T>�4.<f�P/�
5��rq;�7j�؟��~�81ƏW-%MѢ����Г�h�@=a���G������WO�!�U3D�6/�Y���n#i�=�j�?k�,W��;Ig%���8�5||y��ǵ��Jw��D���7D�r�Y�Ŷ��ϓ8��ŧ^�})W6��Ir�M��BM	K���1��KT�]���O��\�S/_�})?-Q�g���������e�ų|�:��83�u<��Q~�r�5Ox�Fr�=6�F�	�YNO�|)�V��a�X �4:k;60A�^��E��<�ߊ~<�u�6�O;���,L�(L��-�[�m��w��,���>��O~�'�`�*�(KԆ?����%�&`>�G����;^�Ay��O;���#H?�W��U���ϳPA��S�>4��m����?-��q�i���kï�`�g~�Qǯ���y�
9���<�
����:�U�]��r~�<�Q��1�~�A����'�p�}UL��σ���<zt�܃L�o�W4�@'ds��q�����=I�����B���Q�5[�I7R/��:�0��r+-��vk,�b�r%]Q/�y��;��8-��	�Ñ���эm��,WbX�̕�#�����O���P�>�N�G��#{`n1���	�܇ܛ|�z��b|�&����Ny�����ҙ����o�����)��X�39˙��"w�0}��9|&�U���6B��G�+/�Ó�r��z+g�1	o"�7�c=�q�lB�'&"�A�4y˙j�x7|o�P����"J`���>�m�G�[N�V���Y��g�B?��у#bs8�X+U/�|��Xˤ�`m�~����
�SeiK�����+���AƁr�5���d��[OG��c�+ txa6����i˪��֎��o�$�|o�d�Q:|1����0��ւ�Go�#��8�q �3/�l�?��]qƁ�uT���mP� ��ga�ק@s��/�7�)X+?{Ё$��	��Ap큼3O���䧏y��ۂ��q��~�m�їj�������������(�׍qym5*���ދ^���Y�A?_�<L�,�"&p��}*Dۼ���Y�u�?��DA�c ��������;����ڦ��1��/����L�7��_���+��)�}f�}���-�G�pD� nv����9�W
8k�
�����
�&ʁ;��˃��=R�Y�������G 4G�{�S��������y�,.%��l��䍧۷ū�(䬍)@�\ݎ��y�R{I@T���{\z!��{cQ^�	A��~�����{a6ן�mӊ������2)?X�T�/��q�����Ï�ҏR�I�AE-X���{��(��t�t����?���,�֮��V����e��	�Ýd�b��eR���0x�$I��/����H�_�f2(X�q��ngQ��֋�:?�مu0��k[���VI���Z�(��M���nW�O��eR�������/��ݩ)���|Ƚ,OG�ts/�i��gQ��ɠ<`6�x�~
o�F#s��/�b2(���G�,����ƿv���nB�Cu*?�@ag=����p�'!0�/ ���ٿ��Y�^3cRqm�~yKA��~6�_:���]��R���G�:?��C�"��,ǣ�������6�Z�8PO���E�{�p]���� :�0����WƯ��cG��/q��|X\��f���j�#|�|`�q�<lz��J����u7�sx`N��nKyd���u҈�¼�����r� ���q���J1���r#��2�l��u脘��#����J���� �������&����@(LsԱY�~-�^lڡ�,��Ȱ<H�k���q5_y�䏮��ܡ�b
�N���1(QkU�.�0n�M�*�$xG�p�Gj��O���FnJ�ڣso� _�A��9����<��A�{�aT�/�H�g���b�|%�,zD6�o�1�+{�b��IR�����+2��n_�؋��Y�̙;�Ũ}״]!p �sΙۿ��n=�D�>��9x+P)��Q�8��9�E���I/_�i�&Ng�́ߺy6U�Y8�D9���w���*��4��#�9�����8m��Lf�� 5M�_y�J�gA6~�_ �vh`8�[��PV�"}�x�Ho��W
��D�����#?��Z�@��,��-r�ѝ �"H� �ܗ���_�]q*q �d�/钠�=L�!p�=�r@7��Ӱm^�f����Yd���VP}R�n�_�i�>���3�Rs���i���_�\{�w���Q���+��c��?˛����d�9�o~U��6%��B� ��%��6c����9g� ES㤾��d�&���]{�Y���e�t��Uc�9����l�L��N�i�
�ӄw�E��,�P�3$k�rhbO�q�_^}�8��	���[��˪�A�$y���w��#���q�;"�9�0�Υ�����9�#�{yN��?��7n�,
��i����x2��#���:�"ŤGp&ը��c�� �M�L#� ��P�w/_L��cC6��=H���7T�I% ˃�Jiw~���zE`s��E%���m��d� �,[2m�<�r~Ѱ��3���aT��H��,�y��D�ry�Ơ���~,���4'���9�C�~���-��\e�y��aGp�F��3�}�^L����@���>Zw��C�-��0�aZl4޹W�:��Vȣ�f?$���j�8f�!����^���`ф��j\'p$��a�
/<"�0��j��h�3�Bs�{_7m)WI! '&�{��5X����n�A�Ygoq�F�"�9�a���3��$��[P�G^E�3_b[w�"�OŔx��D���s�� ���4�n悵yR���;�r���c����W"&Xea@d�3���H̓���튺m*a��',�j\z2.�f6A³\�`�HA�    ��7+����nU�I2����|iY�[:��8��ƽC�s/�H����<�_9�,r4v���9��?ɒ<ǼD�9�R�Y�%߷Msh�����r�E��H�گ�ZŦWn\�n<&�6�+�H��s�,q��Y��r7t�I9�"Tc$TM,0�����o����I6JX�����H�~��:7�CC�[W��8U���m��/���pK�I��E�th	�3�6�v�3Gr�����t�܃��q9���J�y��+`����]A���T^��Ӗ���X��V��J>�Aa�
b�k�����,bcS��Q&�ӈ���f;4���BY�@jP�
2?����!+0���Ġ
��"�YJ�V&�Fr[�!������CW`�G�\�v��/�E�򜓼��s�^���[�z����bB�Pz���y�聤�Yn�{�$��O�����GU�����6H��f�����:�W��%)(r$�c��MR� �A��G�I�s�~x�s����X�@��� ���7�|/�Cߜ�� �}�;��<^�l�Cy�E �>h���
�����g9��vI�*��R��,0ys1'E�@�Z�N��C��2�H���n�E!�oK��8�N��wPwoVJ������	 ����O��/�6������c�Ĵ���#��ev<7�
�C�`��~�B���"�
,Z���s���"J���1B�(�sV�/Q|%�	����[4��ڗ8�s��>�(���aيg���X�p���{�*aJ���񲛀94fm��ײzV�mm��������m�0��+���Q:�6a�ۈv�L����/V�NY7&{��d�+�Ղq�;��Uf�6H)˝�LĻe�7_m�Q�2O�1w�Z�r�)�`��O���I�O� @	�EW�[Q��h�E�/XlhtI�8J"v#2�˭QK��	��E�9~]�/�0)r�l�A|!�����5* �b�:@�m��凲n���#�|`�Ȓ�~�ΗWD	~�"�rh6�OE�U�{Ɓ�;�v���"0X��&���K7,G��;�>0���+�U��}J����i�s	���ۗ�qh�H� X^�B��*��丯ʡ߰n��U��a �ܡ]���z�ǐWL�yo��T�B�z$,䎪s7(C�ޣ���9D�� $���O)o`�\�7����$�ᦴ���ہM?�u1����	�k&}�^/H7�'J"��v(7�z��xݪ@��H�˿���UM(�p`v&���%y*����hɲ�e/K(C�F�������[-���L�GR��ٳ����C*�F
%�^�C�a8}+�	H�K-�-8~(�F���8$l+BI"Į�R����o�$�g9�{�UQ���d��3�}�-�/U�GR��r&�]8y�K=ȭ\#$�.�ʥ)�k%{���e�p����2�8��=txa�U�^Ŷ%�h��NX!�����N����<#���tڹ��*%+:�I�$��Yf��sD�)F��rq��9Xs{iR����ZcY�Y�d�<�C��ɍ����vN�#����P�q U$,�?y,q7[�~�E1�uGtݷ<����� yЃ|��J�2:0�sP�V!ܦ>���g�I)��ˣn��L����NQ����>��|i�g��t��BjP��.?�_(v�����z��K�5BS;�ٝC�����@��,.óR�I�W��e�y�d:�l��zWTB�$���G�5����3��z���/?ן�/$}��"�.���O�FNQ��Պ~W 4�?��U��� �|�;�� ���$R�uw����Uj�����n&���Y.`�"=v�Y�y�C���0Ľy�~,v�.��d�$8˙��I�9���Վ��ӷJ>6��y��H�,g��
1`�Cyj���9�pkɭ��g�Ɇ��W1/�ԗp �6 ��[m6��j��9��Yb��MY�*�#U�~l砡:Hp��� ���4�D8Kߒ�o�&N����9���/���W�J��,�{@�#X	ua9p����Ҵ8��1�
��Eu��ڜ�̉n�kYkHV��Z}������8�"�9�m�QE����#I���
����nƔ�����TKj몲�Y!��n}��$3�ByKoA�o�f%�1X�
X�~h�k�F�@�Y�Z��Coьq�c_�
�9hF��i�R�@��,���Xx
<i�AO�`s��N7b+�H���'�7�W�"��d�5"t���jt(����6���^��1^���4'�[clm�H�����(
5O�a9�F��7������$��B<���u˙�"4�h�@�Tg��@r�,��䫷�����>����3@s��תq���'�t�#h
�{�AU�!��֘T�Y�?��n��d�d!g���d��*u�!;��<�ub.T{�R���Er��У�T��fX��@��nƣ�v[��I���M��Pޡ�(�P�A96��iy,O��N�r"���X�;Y�Y�R<�"�Y~�5��j��S�$G�	�����͙�Y�0���x3.�z>����#I�\
��$\��ϠE��$��Vm�
S��ER�,Y�R�������n�l�86r-{a�$q��(�|�nCW��nk0:R�/*Ҵb#O��2I��K�z��A^t��ؑ�m�����}=�I�,�Fj��w3���� ��Chs����_��U��0�+5$��ꉶ������3ι;�a�^T��t��X�;,�e��*��:i���eB:w�R�z�ű���zY	�	&���,��CvP*��U���0&�:c���(�-��h�8ӓ��X=O��X�S1�gi,���� _�����X2?�ʆ��H�I��(I��J5��� (�ʄ�U�q*����6(� ˍ���.J;�cm�V�s��fF,^�q�GJC�z������3��!7�Fo�����[δ�뗢�#%-`	"�dy1�ȏ<��n�~n�
���A����U�ٳ$w���0��J��w��A��7&�'`���wn���� n��! 0.�U��b=|�b�������^������
�0�����Tb$�q$��F�c��<��(�3�s��&������H
X.��oi�]U�_��>">�n�����ċ�#)`9/~�8/�������~(����H��@�z
K+��A�+�;;�V8�SռB�E4H��U� {�L���Y�VU�$U�y���uN�Z!�zX���h�t5+�[�&�_��e7A���V �i;U�G��e1�A����*�C��"u��F��Ut=��/˝0X�{�9,�[�� �-]JU��~�#I����\U�=MঽFP��_�M�v]�@f������*��Y�y�e��#�זF�H���A���X�����8���Ӝ�7K�ǡ��8��Y�R�?��Wq�P&q��q��*O�Ӈ6Ha˕���ͭ������������	��č/�X��|Ʉ�T�y�iPs&�j��t�I��� %,���b�X���_��eЧZ�u���ݢ-��H��m�TT ��	��������T�n=h�"vߜ��T�]�qϱB5���f��W�n�AGR~��	+�,%�S<F� 6��ܿQam�y�,Bto�P�+�jL� ���T�.�#I߳���`�a��r����ũ��W����"l)��x ?�G`�����7C_	�.L��s|��=���{��jp��z�"Ġ�u-&�$�Y�fw���<C�������kӌ��a$�z��U?���O
y~�C�b���yzk.��f_I���I�H������#6Mo�r�˪��HR�,"�6�rΘ�TO�A�[�j6�xVjAIB��՛\���[�#L�'�F8g�F�M;�J�[,�+�Ո�� �����A����K1��:c�^pq�/]��U,��p�n'xs/,n��bL��#Eбr�$|��8�c�A�=��W}ZQ�8P~��2Ix'+"Z�a�����s�3�lu���kQV�|D� a�>~����K�{D�V�� A��Ec�{�{֤��e+��Ay�    �n�D�,�n�I�B��Vt�	,yJQ7�*�#u�c�ѣudAF�'�Q� D���\�޷Q�f�� U),A��� A��_�F�X�Ǣ����ٽeR��G��^�|奉�O9t�!'�d(ԯ�JN�r&}A�չ1�@�K,1����8P��\�.�w
��qFv��A��ߝOu_)K���e*����GP������~�?z�H���������	��~��95ն(������Ww�[/}��9���!4G⾥8+�lq e�"��\nvCA�fA UTO �!�K��c���x��@xOď��4��	A94��V��p$5,����xp"I�x��T�-�sl��i_5��s�$e,?���h@6E���;at(�/�1p �`1�I>p,)����l���Ժ��*f������"�����~��P�볻޾����t*O8��X/*��*a\o�_!9_�)��Q:<��Y�I�fa ,A�By(6���\ 0�ŀ��i�B�:�$5eY�ŷ/��*cl �l`9�&V������#Y_��J��n*�`�Z���f�c�w�@�$EU��v;���
��רA�I���j��Iz�w�A*PXu�u'��|������a9�'V�L��f��T���_H�I�C�@ى�n�bsh�H
OX���ME\����#H���Cn[oO�ٟ�Z��n��4��H��_EI��a�萟F���[�J*6X�/.�&6��Ct[��;�J�5X�3�:��&ÌP�������]t=����u����+y�!�W#R�
%����P��A�5X�ނsU"�1��a9�&ք���*p �,�oEV^�PA��Z�h�F�#��`�f-|hM��>��xEh5�����u5�@VR`U���wYY�`%wY4ob��I���o�8�B~܆/���J���V���	
%"F�}��0���T�z$�%,w������R�D	��а�
�0W��/�H�L8W��o*�Kʁ֛�@���Crb93�m�X)8a�^���"P�1�~� ғ�:�Z�MT�"�,~��Z͝)���i����!@1����Fl��v�EJ7X��V�&g^J�F�X��XOP*;SE���>O��`U���Y���*�y��O5Z�����}���d��X>��®�1c�o�#�$H��i�u�q��Q�` %*,����UD(/{д�����Lݛ^���>] XWQ�z?jX��
�}0���iȒ
��ձ��TH�$I���v\�B�*������g�6H������L��5�Sd�5N���Ύ���葔/��w�����L^��N�[���X]ۼVe�/�E�O,�{W�bUh�w5@�~�n���+
GJ9�by��(�+/J�4u.pR�V��o��8�WJ-�JvO�Uo����am*w#X�L��s�o����2)� ���]7ݣ�XP� MSh�l :�V?]���JC�Y�<\��[�D&�A-��P@����lc�JV]g�v$9֩)&T�F۟�M;������ٓ#��$7�;�VN`/�cY����
�2P%y�5�4йV�x��Y�c�sm�r�%��%��xi����Kz�{��Rr�B��(ݿFA�� �C>a�dGI�ܘ�E�â�Q޸TB��(�@��9�����V���)�`y/Sa�]
����	�§SY˗�0�~�E�'s��D��>�M0��X�e�]�$�8�2
g�&��>���8þ�=BuBR��8#` ����'��7���0���Q��%��4��U����A*)X�'�7v���0�ʳй��*]v۶/Cg����E�a��m�K�pu����X1C���� V�^R�C���>��R
���j�$xVgy��~���re�6WOX�_�CU�]m�R���l���f^ }�@'�@z
k9*�\�B����	�˳��~X��Am���v���Z>�R+�H�D8�b��3=hHB��Aq��n�;d;��p$E$,R?0u�U��P��Gp鈕�W���YcY�t���II��L�����!1��妩�� e#,!Oj�d#��³���;��n��F�'�T���������e��M*��-�J�1����>�W�Q�%�C���t�"���8z$5$�2X5���*�� �kDs���h_�~%�#,�������Ś�\�������U�WR8�B\Re7p�*mdܮ��C4b7��ԅ����$/�z��R$���t�G.
���� �� a9=��	3���5� �C3b�M��Zt8��Y�`�|9�(�(�����}�)�ER2�ق�|���<Iu{���!1>�M��@JCXܞ���(Y��G��o�Cb7"�;�+�H�y,jշ��?��%�����Cb|�g�\|Q��� �-,o��w��-A��֠�9�0���򴤺Ύ)ka9.l�"�� 9ʨا��������Fa��G���y�ǜ�\~c���S�f�Hˍ(�DP�T�<�<T�!��2C^��<$鑔ް�a�'�6��$�6'Ρ30a���*Բ
#���8z��X�3H`/�"4���������}�V�"���8�e�	D~ W�ӄ������6*�b-�1)���F�����d^���A�[�����R|NEϳ��lR��E���WRmlޠ1:z�Z5�N��ڠHz�#��뵼��<�B�X��A�[oZS�M��#Iճ�H�vH��� �e�!9�z��cQ|QG��g�ư����p���"&o���E{p �x�]+!�ߋ!�C\s����ʾo�+ɹ������X��w2�V����Vl�se�$G�B�2_�O��� W�xƗH���jd�/M�:cM�Y��z["����]�	���7'���&�$�Y<i�H"��
By%�AA|��\����U����l,�������:Q�ӥ��A�zG��)��A�,�=K�4�U��)�;ipr��!v�Jc��U�Z��VS��"lE���`t�^DCݝT��X$)����w߿�z�4�}��	��еZ��m9��0I�����g��a���A�Z�A�Ǧ=OI��`�ۊ���<?�`�&lsע��^�蛓�H��C��L��0H���~�`9����aW
�J��R�x����2$�RW� \�ոn��$W��ԗk��U��c�����4S��B})��H���B���-)ڱ:��ꞈ��{ڙ-EU5�z$�[�Ci��Y�_%Q�Һ��愧q�붨��G��e-��K�r�W�%�>M"T������,���U$���+O]�2��C_����`B�#�w�«���8^��ZjBk4������������4�|.�����b?H0�e������=�$�˂,.���QP�BGq@s��U��c�I���?|���4~���椨]�MlK��HҢ,�Qb]OqܖZ�6� �� D�hUX�˗3|%�Q�5"����*�=UCd,[5B�g�/~�f���H�Ym˽{�5�*�D�����Z!}Q��rG�+e!�]�)~4�2����Z�VʝP���A򣜙�Jdgd_o�&E��D�qq�x̣�T�
�7bk,��d�&w.�����t3�	��y4�?4}��E1$�Ȃ%�&�-�NN,;��Pģ�f���JˎI=��o:D�ak�q:r�-qk;��Jt�2��_#YV�9���u�����q��9 �����*��-�R��y/!g��9������"������g��'��Q�:�0���p����?r�J�,V+�*%��dI��#�9����z[T��H�Iz����Q�gYӟ<KB(|�1p����Fn.� �T�n�6zD�A��c^4J���.~X��b�G��t��<�3��t��+d����(�J��LJe�r"�f�c�� �`�z5@*+Ϲj^�m�GJa�r%�.�{�9��X�D��-}8�(/X�#��| (�<�`�CЕX�7�o�z}Ɓ�E��{�����$�h�    p9���Y]Yp$������Q�~a�br(
��i��Q�[�Z}V{M�_�>�t�,�"� D������<��4�*��A������8���L���O�G�s�uiJ��>�ҡ�:�fc��x�_HYK�{K�f�ʋ���G �����PZ;�LRK�rb��z�4�г��ȁ������a2Hˇ�c��k����Z��R{b�r�ƁϚ�ݎ��*
<�� �!~���	H
4H��� zC�(1kB:WB�y\��� ���U"�l�r����J�0����sh",��
����H�!X��Ug"�I�G�xJ��X�a���Z��Ԋr;�������A�Y�����9$��8D�W���)/���0�K����l݄j.�0��Z�E	_IAu=�2�0�ň̡�0��۶y9W�I�͉M���$���XIo��PD��z�cU��"E�|�$xdm�WQ��P_�8At�#�'?_�B<�T�^+T���r�G���p.Q�3H0�����D�� �+&�3`9�Eo�~��_巎�C9aB�?4ö-�z$,��E�W&��Є�BPu��\>�F���Ä�W��=З;H�Cd�|a��ᗦ����#)+`y�Ǐ��@_���,Z��GX��䄫8����h�� � 
� ��8���w��r2Hyˁp!F������Ca͂�RyH]x[�R]A`c�
 :�V��|�r��#��E�CmsT
���#*��9D�v�n/�dgm��V��;B����UΊ
uhpu�ջR�]!Z=��ΡJ~��a�r�����]�;����H���Uܬa��*�PGg�����PTۡm-��p��X_)��3{�Q>��L�����J�,O��Z&)/`�E�=n<?�f���]z5P��^�����Q����N=0I�U����j|Q��(�l�f؉� E,/��MaZ�d����:DƥoUFҘY5Ydw�:*5��]N8V2M�B�_V!_C��A�X>dW*��,�$y�ި;ƯoE�"�~��e�MX�����ܘ2Y�gP�mg�9T&�u�/�sq�����O�d����^� �GpŁ�{^4��r_d�3X������K0� ���z��B��ɢ>z��*iUW3��w[d�<�rF�&�ف���{�i��X���Y\�@��^>֔��4LmlDڐc%O��"�cV���H���*��l��!"T�4m&y����#��?]�9�S�Ċ��4�����Bf�6WUX	�i�xpx���:6[�?��>��I�<��t&�j�h�x�ꠎ��1c�uUEc��l{��/��cU���{�,�ܾC�,���Gj��$׀V�܃�$�Y��e�}����iPs�؜=~P�{;�$��B����lXԪB`�آ�+!���z$)X�ݮJܱ��5����<6������+I��0�ޒw%Nr"�b� ��v�[�V%�5Y$��"b�`i,�SG���<El�(Z���mg,2���/B��~A��~K�~B���Mt�����B���"�b�CA�S�Fp�h&x��
����I��T/�2�+��"�O��t�U
`(7C]��Y�1μ(m;�Y:mN����z��e��1+�6�8�^��o�"Em&���J�,��G�1f��$ΰ�C��9���&p3J��4#���Ƒd�YP�M(V8J|��#:{j͋JFm<�$�J���%S:M��5gO��D[����A2�,��Å1�,�6�{�A�G~,�e?��C���9��ﾘ�cd�{�yY���`P�7�UT���8�<0�?�Nyw�����!�9�z�pi+p �_�`�$Pi�y�
4�4�N��Z���� �_t,���~�f����W��K���QT�F�$%̹E�؃�~I7L2�U����5�s$��W���Tn�H���}!�ߔ�����Ji�sV��2V�=�� YaV�{I+�l�d~]�W�r����}P��ǯ$�*��Kc�*�\/��W�� �
���4k��@ƹYЯ�VM�:�ˏ8��B7�tP�V�̢쎘�=�$%�r)�:���z�=|��9l=�}y�J��m�$�������sy�c�5\l��6����z$Y`V.p�_�j��-�>Lt~H��YSs��w�6�MődLY���!��ؙ=����98S���K�j5���"YSV�,�.Cڙ�EǓ@���B����ZŒ�����,�)e=���'��!�p'��6Tg�`:�1������ɛr�I<��tn砧i Y��	���#|.^�/duV=�X����fI�g>�
��uMU���ɝr&Gr��G`9�;�a��CU�$D!K ��Pm Ư�!G�%��JF�֫�$Z��C�`;��;��:�C�q�\aI��D�O�|�3ľ @���̇������GrWg	
��d���nx�N�̡+��b��X�B��S`i
�E�~ �C�.<�G�̑�o�t+���-�H	X�S[������7�4�!`G��Y�>6۶lp��9af/��F�TA�j�Y��3��;��@e����RX���*��Kb(Y�l��VN��b���5)�`����y1ox+�
4�|��1��P;�)�ed��GR��r��w�I�c'��r�Q���͹߫|>II9*�L;�G,�q��4ҹ>�zˊ�����ȃ�J��!dI�CH�9�)V�gݴ���GR���-�I�c�C5������\ų�,�oK�T�2���F��q囡UrH	
��CrO���A�g�g��P�X�r��+�>a�N�6��F<����ǡ:�����^(��6H�	K5sѣ�ԝ�
��Ɖ���"��p<U���6H�,�U�[����Q��5R�(�ⷆV��_�H�iX���ZBS4�f�$J ������*}�8��ۈ$ݍ>j��!�bȋ�&�����gۉV-� �4,���K5q�ˡ:�K�׽")p$u3,�=���o���&(2G���ƹmvC�GR2Â>\�ܗ�PF#>�v�r�2v��)�a�%���j<������X�Mq�K%B�հtY�u���:�<��Ai:w�<�߆V�ȅIIK�̳�oIj�궽"6�&�b%��s��h0���i|�4�X!���\,d��6�q�5�-Rm�r/�vo��6�eE&�s�}�>�:z$�7,o�Er�,�B�ʡ���c3�[U8�]~��UR/�X� j.���A>�b2H��ߝ�JɅT�u<���C.d��n�C#*=����#|����1���C4d�E��_J�GR{�r!4A�e����PVL B��ȸ��mS��۰܈\a�w�VOՄ	VQ�pW� T�~�.tS����GR}á��|q��`G*{��#4�z�ZV��F�[` �6�J�X��";{y�T(jO�ҡ2��P'�n�HJpX���iw�b��d냄�9DCTn����H��M�o��+PCah��Y�IڲZ�I)˃��8R��녱@p��YǦ�Ul��܈Iұޢ��j�@�N�H���(��T7��K�,�D���0���8"��|�bK�)�5ܹ��
/���:���AVd`yuݪ}�jM	�����V�>Ѯ�m�N�k�$˪wcߊ�Xݘ���(����t��H��X�7��rY�Ac�-Bs���Eۊu%��2Iiˋ,[~�U�#r��cvX��ۡ����,�k$�����0��6��9����}��ͩ�r:�$��6| �oS�#	�Eڈ�1;,�vS�w�{�r~�<JK��r+)V[L��Z'Ŧ�	�y�B��������aD$@r(�,������dՇ������f����ɡ�3q�����Џ��$��,�F(�_>VKy�	��9q|'>7r�둔��t~��/BL�ps� ;l�宱,RȒa�r/��D6b� :����u3<?�9o��'�B<����Hu'�� sH��?e[~Q{�6H�KL�O�omV��P����!;$�vq��)zխ�1�6    �D�E(� ��H�CX3�
��']�e���
<댑�c���Q5H��h%����p�NY����J>���o\��MK���*I�' 9w��i�[}g�J��j�����s�?�,��ǝ��A[��OM��{`�ԙ�s�G��θ�.�i@���}���8oD-�d�*S�y#��x� ��ٵ��S����q�4^�W�5/��p����������ƫ�O���i�7���K�
�e�\�lY���!��?�9�Ԅ���,�/$pV|��5]`%^E��s6(Psؙ�MTb�zt�H�g�5Q��d�s�Wq��t� ��v�;�R8R���MQ���җ
���$^%Q�@��W�;�)��[q60R>�*F�]�]�Jcy����yr
�}��I���6�=ba����3U�3�z�jގ�C}8�@�f�xQ����4�����a�n��k(O#��ŞF������c��kg��0��|�ثYnV���<�~"�{X�a7y�9��
|=l�W�Jy�ʊ��y��{����&�#>��$�u�m�g(�7���򻗼FrY��:� �a[р_�V��Z1t��!�4�Wr8N�v�p�Gjw�ڕ�'N�	��Z�^gb��X�+����[u�� �X����m�m�H��9��b�=Y�Y�Pw���[���εz(��a��P���,͠��+ ��-���F���t�#�v�Jy�0�I�^n�=y�������E�}h�cS�H]fX��5&
O^�ӕ<�$p�� �9~�i����_u�`�䕌�O��q���,R���!��zs�E����n�K�+,%i�J�;�B��C,Z�a��Gv	��S�-�ɠ�����uܖ�K��U)�Ӷ�ܑ�:*�*��U��3&��m^�2�_�#]�A�����9w�n�ҜNU�葬�	祁�:2�B"g�Nm�?5�����7�~�#c=Y%���-ɛ��(J�رE�O���ā�Ȓz�*uze��8 �9rK���e�E�mQ�ԜUF!��Gy"o@1���K�+�m��H�UO�^��G�=h�' ��E�c4���J���L�Ig��>�X"N#߃`�� ӭ0�x��c�4HB��DvU����%��a��	�m7�:�W�Q���"9wV����,�$��k�L���	��`,�ygM|<�̻�=�̻S3`ո������#I��(k��z$�U[$��������eQw{�LIV������]B����@�QCt0�Ƒ_�����H������E�!�y[D��͹�C����j��!��D��+��ړPF�����նhp iv֓�.��^Q�#�x+���ȃ,��u��5ϛ�ؖr�,��g��KW�hGV���9�v�ſ�U3�$��"�E��NU"�/��#�%�7C+}�H��:�$�"��*<���!��TC{��� ��;x�قpḑ�䖝@�������u2lT��[�O=[�`�?J9 ��$�h�V��66�^�6H� +����:9F� \6�!����lq �8��^�>	QR�۾�<�N�l�_+:��j�[6��R�g_�t��Sa�N�A�A����X�jEwj�^�����ac���Ry�Ƣ� ͡&�r$���4�I5��M���N�T�<��@�X�Z���/�XY-RB����t�e�9)H<8L'�ـu,l���d����(�CW�� �0� 1:�V�r�	�+) `��˯J���rرw#.���j!p�^(� �,r��ܖ$��P�N=��C7[ݏe'ߴr�E*
Xr,L�K~y�����j��9�ƃo�F�_�j2He�u��-���� ֣g�!������g4� ]`	ˮ�e��&HV�
�`��8����{�����E�#X�E��;9[�*�� V��С10����碭ũ0)����/o�[.%���c���	�Cn`k��V�GR4�Yb�w[7�ۻv�JT*Y!6����V�Xԛ�X�΀�D:�'�]HVi��c`vB9W�mBD��
�@*Xe����ִWO��t�Ta!(=�0������m*�q��Vs�����?r%9�v����>��|��v;� �E�i%�x]�Д޹��+/�t���TX)q��)��X�O���4s���HHU�|ڐ^a{V(�
�|R��<��`%"`�h�w]�JWA�B9�#�t(+.ҿ��(zc��rV\!�o��(�E�f�^���:�v!��r���G2J�z�0gJo�W}�)��<��{���U�z8v���&��Z�D/K�[�*S�_;�!��ȍ�u�6Ɓ�Vp�)i�z�nL�$�d���!N�Zʷ�KQ�,��"������-9��ո�P�T�G�v?Au�,�����R���@c30X������Ą��%�䟆Xrpf�Zk2�����"	s�I,�B�[޴�S(��2u���!}�`�HR�*3�Uefy�y��$�g������E�6��im�t�Up"w��q�D|�>�ou=/�WyO�#����4�.7a���+0��T���[��ͦ�v�t�R	���O�_������04<�n��QZ��H�%�T��9G+?�0��8�t��VkCѾ]/&�t��6cu^S}�V
A�
�X�W���9�t����-�8�T:˃�߄G�;̽�H�'�� H<���ߴ�8��I��O�8�,$��h��9��^��e�=g�q����ii�z�c���y���B����c�I���&X=j�&?Z��X�x$���A��F���T�I���@�݌��|"YF>0����^���E-�H�(X7��{z������2X#2�i��RT��$:YL�7\Ht�9�Kb��9�̦B<�|dI���OMr�e�c�@yy-�����֮������X$���'�κ��e�m��x3-<��+�	��5~W�Nͫ
%Oɇ�<��Ł�x�&�����A���w�t*�I:��B��Fī,�ʟ=�rЉ�*@�Z�$�"B	�!���D������T�F�e-REYF!z)���4�9�h��ִG��� D��w"��h� 
�yjT�h�2�~>��I#�u�.���B�SA*��AZʽ^���2d!y� �4�u���$�����s�I��g�ҝ:Y�Y���`�ЀWi������������a�E"P�g.��@�V�xL���;��(+=�\!˧$]�2e��x��������II8p$�A��T�|���"�6�C<p:�5����OXX&yg	+s+�s'͋b?���� ��;�}s<6n�H��,Z-�l��2��.���Y�Cj buPkv��S���OCUY&����tA��t�Z�$@�xj���Y�~x~*=���,�#�s}o��ҕ�+�@�i�sF�<�_�Sy-�A����{K���Z���56Ez
�:����v8�q��'d�ca������<�U�9C�"lӜ|%�BV����E�E!&��GH*���U��]��$Y-e��L	��p���<ȍ*1ԛ=d0�ER��j�y�4ș��4̧f�� ��t'E�tE�5I1��O�j�x�|��9&�|v�;GH~��]�^\��(���'ٵ!΍|'Ee,�Qby���p/h��8!Ov3uPKƟ�
��V�$�ʓ/[bLlE(%	$Z���M�<8o�b��<Y��'��Y3�ժ�4�k�~����۷��cinm��ˣ�xDߚ�U(�S)6wD\.ɜ�?�i�|�#�%����5�a����� {�m��Y�Ά����c���|�@�h�zyC(�� ι%���\D��+����y�
o�X̍☂0�h�@:&�8�R���2�h�k+GbcI��"S���m�u
,�����`,�4&Wmoό<�"x�	�#W�PK�j���U��d��Z��2��}/Ju�� ���ґ�i�Rݗe݌䦶�{ +y6�5cQN~�ep���9sy�je"r4�x	���������r�TSJ�j�@�YL��Ϣ:���d�]Šɂ����(vXӂ޴g���oc�T&ˁtA��X��j�A�-��������    ���T�Jb=Y$u�ؕl�҈:��b�@1�vB�`-�a囲�y�#�X������o�Jջ���+�յ��'�$,YDJ-���ȇ�uG��X�_�M�E>!Iƒ=��^�[t�N�29S�X������4����z$L�B$
���@�p�)4Ʃ����K)�*C��d���������T���9E�"���h���*Y��^~}�z�vR��<(�;!v��V�J��z,0�N�4ޕ���;�є�s�ݸF�J���o��f2HZ�s 	󋚠�drI R��F��h�??��l:H����u�<���5n�B&��BP��������+Iײ|����=�<����
g�$�/jTe�I̲���\�ʒ,
Q�R9+�Z��O�8�����*�{`�ٍr����3�:�r��g~*�eU�� o�C�%B����ӕ�{��5PQ{�D.�8�4-���n3W��w��@:�a������yI��E�>�.�X^�b���p����� �u���diq�:|7��8�b 0_4.�g��ڴ�؈~2�X	�1���Tny[����4����vw,�b2Ȃ�,ַ_*��`��L��Um!���4�|'^�a��A2�� �w�=�j����U�f~�:P��`	�J UY�+���gO�E����>��.]uqTS?s�:����#I���=M�i���t0������IE��Y�����Fߌ�zy�+gL �d�u^l�K)�k���+˕���x��k E����0��U{���OIrfI����Gr�BjaIS��ˠ�p?�wp�Vk�}ѝ�H�p����J6x� ���`�#�X�vEۭ��"8�?�<q=��T�3O������?ߌ�e=�T�LlY�^�^��,���9hD�f}l�u%��d��f�[�{;��O0�y�A:x��>��D�+&�d�X�O�yn݇��q6.�8���m����Ʋ�2�
��ЪtjAjm?!t�VVT�>��8�bR�3��P�ek���+^aa�:�+�w/[!�1$��l��6U��ū0Q���H��EթCݔ�d�t˟���fNa��l��9�,�G�;6m/Zc�|ˁD�7�˛�T�<�qB�஌#?�� ��^�܈'(īԏ��B�����Fʦ�+I\��_���ҊWYD�lGp˳V*E�_���by���,ᰂ(�8�ڡ
�����y]��� i,X���+5�S7F�,D��VCu�Cơ���CaY$��rɷ*M<����s8z�LhԐqꗦ+Zu��I�^8o^�dITy�������.�xc��be(��QQSP;v�9%d���-wz$I!���?�����2�H�#L!d�	䯓ˋ\�'�$�X���Ü�J�K�3�qB�`����1<�V�A�D,W������(m��9��⠥��p$�8�P�K�Y*_/��a9� Z�ϡ=�}[�"� V�;O�S��$�}���y�� ����:�]1$�
g3�ܲZx~�Ơ(�j�ȸ�s6���d��:I��zR���hŴ�@:�����V�}�M)�de��s1��B����4P�e͇�/�&�L�c�)ќOY���x.߃�Fcu�\ƣ��y�oy}1&�u�2uG�%<QE��J�A{��������N�$�Ŋ��% ����\A:8/�ɧs�2��`$/��->*rK�v�yK��)�5]֛}��$SXY�6�'_y:t� l�g��r/dRX~���}ԊVr��\\�H�#F���x�K�n'�t��\�����q�T�[�ZN���2���[U02����#����T��A�/�c(�Jlm�$X~��R��ȟ4��$���A��]F�~��cL� b������/�*�}{z���cJ�+:=�����-�~�؃��3sD~��}s��d̗����ɘ���ό��AX���}�+�Jt{c���sϬ���
P%&��ʰo�vL�đ$�X�un�C�V܋Kq��b&�"���%���e�z O��A<?-�J!��4+`s�o�8�x-�!�r�:T!;�x�x��q�"	���ߌR���˗�F��D�����X�u�Z��Wj���Z�t�o����N�@Ro��lS���Z(�v��Zm�c�5�Ǧ{-�~yh�+/˅4t��4����� ��Mx�]e|s(+��l�$�r,�t�� �Fa�8�'h��,X�rQ;�z$�7V�E�gʍ�+��<�FtrN�ć�P]�` i8��yU����m ����
�6�fh�Wc�,+c���U)�ȃ���p:x8���h�u�G��c����*������A�
��H��������?o�r�
fc����i�������+�Ջ����Xˬ�8�4����$7��$��"���+q�'�\� 3��0��q��e+�:�G�Wc��YUv��Pq�砖�!:85�b�䯀�d�X^�o�"�W�j� ���'~U[��d�Xn$�{%�5�Ka�~E�V��`�(rđd�X �>�ϪE��3������\uy��"�欻R��l��<9; �4!um�4���XcR$�Ƣ?�����r� ���w�A�Y!uQo�;!�d�7@�f1!4�p������0U�3P�$��hڢR�6H����!��p-E��*NG�A�Y��r��E1$��bp�9���f�'���٬��-��Ub��"վ��Ch��_�j2��H�ӄ�A����E[��#I���~�,,�(� Y�g��,RJ�k�Մ#I��^-o��z7
���$���$�t�ɴ����t�-�t��ekYO�<��_u�pNڵ����H���nF~���z~�;nΩY��rA�IF����*�*�s�btpj&J2k9�'�̶b�g
��n���o}��_&�Z�jSZ�E'?�� �A�3�Lj%E�%J�<����=3O�롮�j}��d���a�1Uʃ��Z�r�eV{H���?�����H�?ɗ��*�����	��~��O�]�G��c�O�����R9�P�#DCci��"Zh�5�$���&�o^o�N��U���1��N+��.�H�O��;.��B�+/�=h~�Fh��J�l�������j�h��W�|e�B�X��j1.�n/�ͫ��(���n�������	���1�����N��4X49�V�g�r�rhntF��Ƹ�n^TU�q 9�3��tq:��^�il���f5����^��I�,#{��kX����8����0������8����[xY{�h�<������G���/n��i�AR ��S��{,����i��:X��g���#$�����)Hq���8��E���3|%Y]���۬H:^��n�*2iɑn��T�� YV����@���A)z��\�U�U���1$�r�Z}����U�����X�1:��,��pādCX^��ؐ0N!���6Ě�}�+�ɅpfA��o�B�N���S!fe�wъ�z$�^��y��gt��!�z_���*��$�b��*�N1y��G�v�;����<�=��XI8͝�S�b9��:".�a��ډ�(j1�]��;fބ�>����㰞Ű��B^�Ar��y�)C�q�ɣ�`5�����^����������t�Y�0��Ű*��V.p��H޽YoTp󍺕'��X`�8,�q�罨��x��	`�oϞ�df~�PoQu�V�Ju�8��|�I���<��`�"�m���Ȭe����F�$!�
Z��c�&T���C�:b�V ����=�$XC���!�l�̇"�k����׽�Q�҃OJg�o���{�5I��T�	�#�n�S�uq�2���݊�ܭ]�� O�;����[eD��Ϫ=�e��u�'�̓���hl���Ӣ7(!v��Ϣ���Q�d���F��bq�0Z��C��@���KF�Z���c`$C�,/����h��	y��6��[�l���Z.b�E�����e��V���@���W��ZuǑT��x�h^% �	  ���#a��9��fZ|'bT/i�W��W:��݆�U�!�5ZG6�%�)v����E�t���d�Z�����	������Y7�޵�Ȅ�4q�n�i�<� �v�P:���_�B^�(�ژ$��r'�[�#^�#��#����)�Z���0Ir��ͱ�H�P�/y���x�	��װJ}�v�o��^$�������aV�d&�kxJ�D�>��3&�NIl���X�r�q��`.ω��m&x"#�E׷Ͷ�,��`y�9r�U6#\�'T����T呥�2l����ܳ�����*��,� >G��З�S��p ��,2��z�aK�xa��G�����H^w7��7~�J��%VX������	�#�n�g��������͕4	H�%���n���6��Ů�+��2��I��<��ՠ��*���*�����/�������E�YaD<OYQ��\?�"���
XU8���}	��N�ۍE��Y�Ի����[Bw���޵R[yI��XK���C^EX~Ev�g����G^���؆�G?�r;��Xd$��c�"2�N�Du��TG(��O���(��X�m�UB�c	9����vTG4�x��Y�3k����X0Kɋ�:�5��oߝ��B�`;�z�u�)�Z�7X&�c�%c+g�j�Y�snŕ"<LohG��8Us�z+�U�M��X�a۴�}�B	�g�#�g5 ?��m��c���3�U7J� M�T ��	&�o��<�I,�I�Xa�,\�S��Ƌ�0��?�"��MJ��#I{�y�p�S����������w�=�w���d�T*�^�]��v���,{���3��{��*�y�a���pXd�g �˳ݶ���*���XK��e˯�aaA����UҫmTݦn2�x�Tu��-��]Y�J��0���陇�k�+r�O�c��]��_��9K��K��:�|���χB�d���P|�Э�,����9�[A�a#ڱ�8�=��J�{��� ɰ�-�s�%-�y,��ޮ&�豴�a��-SuI�S�G��w	�ӳf���F2�Ǫ����ڱ�`��*d3	~V�*ڲ�Ej�Y��z?%|�4�����[��K�8[���5<��=Y�ܖP�}�#�j�cU��S���k��r����h� "�A8��Z�lۦ��|�8+�k�B%�Lv �b�*\;ug��(�I�����J'�<��hܸ�����m�>�}Qd�����&~����a}����&�7r� o��d��a���a�ʃ(I2�>���a�Y�Tl���QL���2o��E�^�'�x��58Gx�:����͡1f�/����]���8�Ld���9"�VU��z՘wyEb� �J(�Q`?N M���ɔ�=B^��|Q��L�%*�����o)d#+�w�yD�<���n_�
��2�h6�o��`@�K�MW�� %c�� tD���Ty(O�A�d��������0J�4�	�9B��Y��KQ���#�fE<|���M
!���g��L�f���<�X�Է�zT��H�v#0G��J�lE���F2����a1��ZR_�C�9�sD�-��x=	Ș2K������r� ��y ����t&�C/��BRU�ؖ2���}�"-8be�{Z�?6b�c��0v��WeF(\�Җ,9�[��[�4SDi2�=�ڲYn��W�0A�c��=�oZ�eȤ�����1��T%�q���T��g1Et""�7�@�U�p�a�����@c�Ss��~���I����Q��gL����5	M���|�������.�H���G}懲J0��5�S�z��G~��۹=�Q�L���ط/��\f�o�.���D�h�ƽ^�(���fR7�g+��R��6����X\��9^����t/��2fR?ԍE�J����f�	B���������.�P�L��'� �bZ-��<��*�6*]�OUW���fR7���j��f[�GGi��� ��o��m�|D13�w:��zCŨP��8 Q	��\m[���e���7:s��x�2�9r�Ǯ�L�J�I���-��P殆�!��iV���aH}q;�]��u5Q MX�]��.yH6�d$&�sXk=V��Q�:a�����P0wI�0^+�#�NM�>�����g�(�*�n���8/�@X�,G�E��a��#ʖI�}Պ�T/U�\�`JY&?�mԃ�i���"��)�s��-t�h����q�dˡ'���[��CE��Dg�y���Ӆ�r�C��]�J�9J��Д>�ku�E5���)3�@�{a	��Og7��BE�$(��[D0�VY���	X	�	���QZ��Q�R)�Zf��,2ܿ��I�=���������Z�.P������������[_�Ms�"�kI�0�� (�5������!c?4�#JGH�/<��H�=֞�U�A�c�& m�Ƈ��[�Z8LA<�r^��c�OT��v������?=.lI      Z   )   x�3�42�0�4�2�0�,8��-̀"�@��	����� ��      \   3  x�u�;N�@��z}
_ ��׾DGC�� ��Xr�/��(���p�)Y#p���H���8)����}��)4�W +�-�hB�|p��u|sΓC�M�DBm���P���#��i����~L�t�`��� ��
�Sڏ�m.�\
$�9�h2�Y*��F��o%�8���|��Þ)��b�qb�c�w����iH�k��������:r�H�I�,�:��ø .͓��F����-m���Qv^�7�BA�D��Sw"�Ȩٳ�w��:���YΒO6��(�|�N7M�����      ^      x������ � �      `      x��}�]�m��W�og�䌀b���nSݠ.�h�E�]��dXr���;s�����[�+��q���3���y���߽�t�����O_}����~�X~��o��������o~�ؾ~���_���۷����o?�~��׵J��������E�2#���U_�z���髮��w����A�iT��$�a���Oܩ�#�F]�<�
�i`ٯDqƝT\}w�1���nT��$�UQ�,y0�����6��0�Pϼ�DnU�@I��yQ���}��y`d�"ۓȾ�0ŷM}ے�m��?���kQo[�4���K ��������Mk[3آr��9{G�R�`[T���j*���n!�Q߶�9�i_�s����Y�S�ԛM��02��%��Nr���������g�f�����TY���yݿ4DV�L}�-����w·m�:�-?�}'��d9�:U-?U����h#S7F��v�U����ԍ���/��C3��H��H�6*ܑ3�P7U��H�2����J`-�"�>Q���	L�4�'��3'|��P����k�����P����kX�Xt�_B寞�ac����PY��Yd�W!�t�_�:�=�"cV��;�/�Rv�S��m|`X��H�ؘ�t�Ș��Gz���Z����q�9�`�����!�Q�T�3����֨�9������1�5*��<��K�a��֨S5�Suj���3��F��'�}[�#�C
���ȓ�n�¡�֨O{�S�q6��SX����S����?�֩�9��*q8T�)�S�s�)�l֝�)�S�S�Db�K^��SX�U�<w�sG�֩�y
��ZW��#�-�Sv�Ȏo[���y������'~aF}a3�<ʮ����𙝋�}a���,p���y�T&Yy���TȞ��|���B'c��-�<q
��,L�Y�(:�c9$�>;�>K�>�}���q+�N�ܒ�c�i,�/,��JI�ʱu� �Th�B�>������Ų�H��%�v��\�О��Zv��8���OmL��ՠZ�~2����T蕇k��(�����R�P�� ����M��jis�ť��d�S���4�~�y��LnR`pO�`-��㰦a]T=�Ӫ�JU��Z�ިB���}[3Aؿ���S�t�o;��DDCS0�Ьų�g]!4��5�\k��YsN_�B;��5��nl�ċ��/�R�_��R��Q|v�W��om)���.�Tw@�{���t$ie��ۣ�Յ��\���Rw������i�"S���d](���s����V|j�Ѝ��G:@�2�76d0M��F:r�������;���O�p/6vg�p�t��O�D^��t|�OM��}�_�t��c���m�d�>�|MS��5�C�E���f����
��&읢2���eW��X.j��!�,;kD��E��=�-gc�o�2�dů�鱞E�U,�6ד���t�3��2�;���T뱲+sw��'�f�z����s�6�<ڦQ�=?\k��õ��t$�	�w�WMa<-��;�>�\+3'�����^��Ǭ/!�kR纥�z�a�u���uK��*�#�#�̱�)�|��U�y�S�yZ'��_��y�>45����_eUYI􆡙������u��T�g�=145Q�nZd���/-J���Q��n��/�T^5G轺c�i2Q����ց��c��&*��ȫ���3S��V���R��`�S�����]�(����ZzIgV��1�ՂB����NeG�~c��v��I���#� LCS�TI��ӳ������_RJ������Zl;���HJ9���AC��,���V���`�
��F�����nQ��<[n@��4
L�9����oCS#Yy�1��
�Q�Ɠ-	�!�M$Y5T�M���R�A�j�Y5L�Ә����rDON'f�I��z*�;�^�8�n0��M�E����i�E���>v�t2�_w �d�ި�c��s+]�G����3]��,�[�E�`Wݰ$\����Њ�>�p�y-Jv��ie��K��l��7���wK4, ��BI�GJE9SW�<���)=�Ќ�W)�+TM8ґ�A�f��`d���$ڏ�`��14U���? Ӿ$��X��7�����(�^��PMfOYG`��g�0��n�|��O����| ����0uAF�x]S���0O�)8���[P���� L6[� �C�2z*�;��"e }sq�Q���e��"a
</
�L��ẎK��`h��h鹞��lX���p�H9���:� �B\�J�Ͳ�z�*�P� ������R�xi��T�y(�VK%[a�- h:2�s��s�J�Ф@ѥ`R纥�z������/v�צ���*j�$�y��8�a���A�v�����E�<�(b��%Zxh��t��ʒ&
��ДX�/��;�t�[��g͜j�<�t۷�^8R����0پ����̕���/��n��5,
;��]H迄���툺2���Kh����GD�R�jv���+a��K�e9�8[W�'8F��%��ȫ�9�F�P��VF�Tm�7QLJ\R��=v��-��04�(���A��1�I�Q�I�e��@u��r�8��89�����C�S�/��@�C�/�#t���T�s �5�� ��vJa-��y�C->����%�������]��)O��yq�"tr�01��8/�x2�Ȍ�$�@�{���vR�IK�F_���Pz;����=��u��p�n7�ҿ�Top$cmy�m=�z_+	}�x��� &MU�#�:[is�> &-e��[+�����ߚ������<g7k2�LS+�5�������)��JS����Q���`h�1�R��#�х�Y��gf)�ceIJ����bi�R�����̧Gj��E���B)(��#B/���S+(�U�tD�e��8�p��t-#��H�IG�14e�0R���YG{�>14E�)�h����aL�<�)w�˜rD� �a�I
)1���wf�!����j��>P�(RtOI��бg��� zQr̞����w�3���x�r��i�9�Ъ����eC�S�Y�lV�m��jR��=��b����UP�V-e��2��C��@o�I��Z�-5�i�hs!�H��-mqי��ͥ&5m�dt��~"҂[*&5Fi���*m�.��h�?�:����(���B��'U�������:P�<שe{��ҹ&�pY^���tt�c9����J[�is����F�E��թ/�Si�*��ր��S+�����#zZ+�G�>ǻ�A���rl��fCS��_���=S�����_)wDo-�4 '����d�/��I��ojp���^P):�R�XM�e�x;Jxd�L��th����E<#S��JKzY��73D��9c��u��GdԳŝ���w��<��ԳUK��l�a�h� ���(���*�Qv�7���Y��=-�ΊQl�;����tRRk��+�9�F�h�������Ln���⠈�Z��m�����&���g��{�ң���"��jA�,����LR�����˸J�D*�I�̴��&�5�@����-�j9YΗ8K�$�-�h�%���MCS�u{�[���QY��Ȋʣ=ͣZ֔`�l��i���c�)��2hK�;s<�m�}I��?��j��x��:s���Z-�t4R���1v͉��$p�^�{b��S�ְժ�&1M��lW
��r��c&�r uD�kUg���#+ki"�n�`Rj5Kϵ�>Pt{��d=����>>5@��%j>R��\�w0ӥ��#5�;X���<CS�?#���8+�쎡)��HQ/��΀}bh�#0R�����^�CS�BO�;x��`¦+���W�Ww�����J�ܟ`-���ާ�V�F/����K���T���>s� ��\��(㴞���E�Z ���´2��Zk+xD���S�z�{�"�� ���Z��h�KV�w��I�x�r��,	�BIU�-��V��,U���\S������p�V�<�    �5e��RC��?�na��:��=�ϳ�w;��`B
%�L������(�Н�0�Ԅf����(ç��G~��t�v���C�S &��C�OIV3	OMi�.R�]�u���G��A�$�;�dk!�:��:\��G��[/F�PR��_�ڿ���h �:u
|��sz�P*nj�Ԧ��e�����(��u�jZ&�2�z�0ڨtRS��(��@�Aڏ9��{�V=�Շ���}�;������R�"1J��i��z��"(���o��������r�G�$����2z5M]Ւ��2��m0��N��$e��r��A@e�v����v�Z��e���[�&�Jo��a#��N|��U-)�H�.�m��[�f�����˟V�:�XKh�f7��l��&��t����Nx#S?u{�S�a�*k��5��i=�֮�Yan�œ�WR-�ZP�PX��ܠ�PP|ۂ��R:�4��Q�/	��(���D+;����G��(�D���j����Jm��'(����p]14U	[ʕ�2���j�.�ٍ�,-R�z�����.�~ʞ��9?�2z��T�5���h�$,��aY$E�)��lmaӘah��j�U��1V�Zw�Д�z�f�^t7t��)?���(�H[ �B��"��tH�GSo�����*�>sHo�5�G��s2'$JO�,u��:a��M�j�ɚELg�K���۞������f����*���B�e��(ңJ���rpKl��[H����i�.��T&����&%m��/��e�A���դh�-�e�2�<5��C%�K���G��bhJ��R���E$SCS:Ԗ�Po����Z�>�r����:m�
r�@	��[��POmUn���u�Ɏ��Pz0cTM	==׫�q�	��º/�2=gC&�:ޙT�\�Ǣ����A'����~1��@���t�+!��\`�X�#�h~I�~�¯�!k����g�}Q)�1=���OM]\~�Z�cz}��t���䂵}����U�
~���1�]cӃ�Qs��:���8%&F͎j:��DY�M812������7Qv�
���5Mߣ��,/Asn��њ^Z��+q���SSxI'�G.��"�:�8RVor��a���(ꏴ:6_�2	�'�B����>Ե��@"k�����O�~���B�S�_I��Ǻ��boQ�_I'�ZD�-�ݜNu[�v[Zھ��?�Dq�ERO-}�ݳ�s:��SRN��1L!�1}RzД�Ew�u+��P*���F�lk_�������dc����u�(���=Y!8�A$�ytQy��yT˱m�+�P�FqpzJ<:J=�V��f ��igm�y���k�PFy�嬴kAX�p��P/|<y���9C}".���i6��m��YC�٢J3M���z0����$CS�
+>t�K����eiQxGW��o��m���P{��D;�r����M"8�D�	ԍ9�v�H����]1��i���aMMY�Ry�ԍ��YH���n�:Z#U1y9�N��^�F�jF���b�f�m�D�1R�����@0쀥@�Ts쇔�88CS,����XG�	�h�\�{�"|��_)��ܪ�T_>���?,DӢ(}==ֳ��nEq"V�Ծߞ��f�?�A��^�,����Yv�W�P4��x����:�-8���'5���n�X�� �utޤ�uK�gu�;�yG'e��ҌrV6A;����IQ�[�Y��s!*6�������UD�
rP\k�䡥�۵��*�
�ZT�#Oԉ�c��Hnn�W:F9�H�a�Ru;�dz�n��o�kB��
U)xJd\�C���+�wj߀_�}�~�`ԧh�Щ�~�1��[���?|��6T�������XX�Ru;�������ɬ>�?��(|+��0��3r9*rjw0��h�1QʚZeL�� ��g�(�5u�az�����3�<r���4�B��]L7H/4ւ��Fq�$�H�;ޗ<(�I�n��A"��)򦤫�n���Qt&q��#����iX9�b�H�@ �����8E�ttt �9����])�^�Yki�Y��x8� V��%z4�k�y�N�Kd�G	8r#�J��r#�'��r#&Eclig}0=�aۘ�����z~-�*��7�r��o��v��X�6�s���=]�t���6�n j��d�Z]S4@z�&Re<��3e�8��p���|SZ`�5��
��Ǔ>�D9(r#U�득v����bhj�����@z3XVtt���������j��8���-�0=	A\�U�A��+���
�Hķ(�K9�����z�N8�H2��f}`h�����_8R�:z�4��i��vA����o�5�H��^ƴ0���R(jZ�x�yZ.�v^�2���[����B�I��N��~��Iebd����6��|E��I�)+c��{0;�Ty�6\��.���D,G�C��c=K�EQfpˠ����G��15<�>�T�Nx���CP�{���t�s�� ����Z���,�-L�
&�e�t�Ñ��
H&NG'e&�R����֪CO�o�4���O���PCS#�����n�l��6[P/<��v��ĂQk
�j�p��_3���-%�n)�g�k��Ӯ�̌�y�V.GQw8��6��S�t~���83;� ʤ�z)�膢�A��~�Ҟ.Y���QTMi�=u_ �;U(��d����2
�[FI�k�8�`z���:��F��k���%�����r0�i�9�쐹��o��75�ߌ�v䀬�:&�
I����Հ�ah�-+i�5β��y8e'鲚QL]��H��[꾔�e���dA=�F�Q�؍^Z	��:Ex�'��z,�q� �ۜb�J:�9��|b{+3���B�Tt������-`L�5-�u��}��ZkjV')O@���8��M��:�-5��}��̰Ǜ[j�x���`9ڂ��Ȓ�e��u��
L8|+F���������,�"����:*�ɟz���ѮN(*�x�꬯f���٢Z�'��t_/-8`bh
Y�'����-(x��^�,�s��XCúJ����G6Wt�9N?��<���U��X�w'Ri�RZ�����CSv��	��vQ�ЃBT�����@Ϫ8��A�(�#��>Շ�CS���^־O�����04e3R����vB=�7J�S}�K�|(�"ܨ:����A[ZX90��w�ڒ�wCV�|((_۞.�M�kPo'm�o���_�@��I�K�t^6ˮ�-�PN|jj���9�,K��D$�L����v��j�V�[Lf���i
_��t�F� �D)�ZZ�]�.�CS��.�^��Ճ�&Z�:�RZJ�9B�_�^�hm�Sk���p��aE(���^��u�`,���S����� 2��[�
}��p����LM�~qs=� M��wS,J�`�?� Ì�p�u�"_�t<�D-8`��:�K�ܚPO+�2��
*�-�[������B��xG~'>� }"����HJ�����u�<XXI]�vA<�ZJ��"Vf��EMf55ߔ��U�G5��������0����Z�\�j�:>���po�.�^�A���|�F)Lj�����phe������F�014�Ȼ���qd5�L(��"FH�Y�2�jYk�)b�\��;�WW��02��-��c?�~[��}r!����F�(���9��%���Lg����vj-�\��,^CS�L�Tv�r�#���j�%m��fޛ�8ݩ;K�i����nm�W;����W�%s���R�'~�^gЗ�@m�*��D�9ۮ������H.�\�%�[(�hQ7u?�5	g��	<�yw��;G�6;z7C�u{�'
��f�t�0)]�H;z+c�S ��Dt
��'薪�Jx���r۬{���X14e������'�m�da��L��N�l�y�Zt�p�B�[�k�5x�<:�l����$p��*?��
�Y1�B�K+j���ۨ/|���^�i �t����i=�e���1-uŖ��Rh�7-uǍHg�~*����0450�    ����׃��@�m����^g��� ��ȜU��G�kE�VXE����h�]�
��8��<�v#��Ǝ.2��p��Z�)M`�>mbs=���(ˊ�rug�ja��@�ꤤ�=5y�ǰyGÐMHMpZz�gq��E��`�O�N�V��'
�,Oj*�RS�#�RE��Xa� Z�5�qd�`b����2<j���˯֎hbس@�-\�]~U�V���B�і���]~����ۊ�Ti�ʮ�3���݉3�2��JO��m�����U�v��C��ک%=���W9;z*Ǹc�S�~�&�ǻ����Д��/
�;p��P�`5��,GGz�s3`z���A~�E�C�;�J���������2A莴l������:�kQ�l�Tt����I�X'�K״�G�P�512E���g�(�g4����8���#��f�o�n-I���v������M�v���}�(痆���$CR��(���,0qՙP/���r�vσ%��U�S�cI��}Wk|���T�))�q�\0�	.r��VR��e�v���j�䉂Jm�ea��tP�Z����-�Q7�ި2�=��Ղ ��&����5���v[@&��P�h�i���7y7J����vIX'.�oH�l�S�4�_D�|�V$Jl�*��/�`����eԓ:�X��Hx:� ��Mg���.���7yWJ��O���.QZX8HO�R���,djo�ސ�M�֖*��$�~uMAk���A��_k0'���j��ǜp�d�dF�eGj����+��0�Q�����}��!4��6�>�'�Y9f�7��ި�z��C�Ҩ&�CS,ʞ:V�.Hw�DkH̠���T��eM]Dka)*EGI�Y��&��hP�(̞�c�a]��Ք�nO�Y�Y���B����T��û�6����乧f4����#S��nE���a�@h�f�2�iO�	��>}�O�2JKg³���ucahjd�R-�*�Lp��CS�GK���3v���I��Z��s�C%Cv�"1{R6�-EpW;��8Z3�:�-������[)����i��k�zj�Gh�������1�ڍ�x�ad����z��^kE2c�<0�b������
(SXvFak��;�c��1�
��(l킄	��qՂ�ys疝]T��GPC;� �����X�1">55������54(���t��Jp�D�ذ�딓�]H�*AY�DͰ���g,��J������B
Qԋ���D@J	�_j�߅��R�/���S>�~1��q���-uʗ�/�0w�z�W��%��Rʅ��ͦ��FW\�Xxp�fk�����U��G�b@z�fk�q,d3M�����г�SB6�cj{˅��#�͊�tC�P���e|h��C�Ȝ���bg�=��9��j�h.�����y��&�g��ڗл�2,�m}�P�|�/��	{Q�ą� ��R�%�BphV)3���|	���`[�CSݵ>��9:��#�B���(H�;��v�UJ `�?�n��X��\14u�,��Z�}���q�
+ [��1�w��DBM)-u�ie�Ȉ 8�'���RG�V�jfa�qRQ
��՗к�D��Y��(�f� ��>��Q{0%؄p*��+��*����ee���K�⡻��z�bTx/��[�̂��rG��e��^�H���z�6��Jx������уr2���>���_�"g�K�:�G%\9W���z��ウp��ŧ�!MA\v><*���}0Q`���S�6		Y��r�ԋ��BXw��i��9�)���l�-ԄheV)�aךO*a�*a�*�oijZ�+�}7����ʬR.�zA4���5�-��©�]𔿄^�k]ǍǕ�G�t��+��J��_8e�bB�{%l�Q�\*e[m�Y߮�稸�̓u�,R�JxI��H��'�R�ˮGkC®�����љ��<�Ba"MyQ�ّ�ֻn�A�"��{�y�6����7�N�G�2�+^\��wJ��) �+�c1������u����񨻇JAChn<��^go {�+L�(�*�(\���ZT�i��k��GHM�����r�zu��CS��^��L�Blp+��7�{e�v��BE��r3�T�+�]�`a��u�h�za�vQޘ\W��ҋ%s��p4��wM�2�
s�	�:c�	1�QuB���5�Z��plp+%*���Մ3���*�S.L;�C��;�������S��z���:��H�^6�a�����m�J�.
����CS��4m�vQ8��=Fc/�4�%���-�p��:\���]�y]��T�s�X�^��:��p��f��GyT'���)5͸��x�G+�A�E�k4��?�Q��bhJ_�)!e�G��	7WX=F�k�HO}���� ����^���2����@S�iH�z�\ah*�i�
��������(�XJ���ѼQޡH���@�ҁt;K�E��
CS�]x�݋�.S��,� miЎ�rGړ�#��5L}�?�pѐQБF(���-�����lV���H�֮��m["`��:\��v3H�>���0>�&W)5������"ahƍ�r�.������֓"e7��+�OM��va�� �jG���gQ�����ܬa�0��[��LS��A�V�CCScx�4��#��C}���zLS�Ů�f��=l4)}¤�B�������z���@�4q�}+u{���-����y�rq�t4�k�!����* X�z�ή�2t]jHi+ �5Jm-���)�%KG��F�(n�[S��י��,Pܐ�KHGzo���|2��kQJ*M��g��D\=ș(�Å@��=�-p��*�م���y��j��8�z؞�����F8(]���X�{/Qv�0����wz��r/Q�*2W�A���§�B9f!�����Z��(UH�q����E�d��uj��uBӳ��l������3�!;�0+u��I�?Ճ���B�Rks�b1�c�b-@.������.D��J�h��P��Ԇ$��m�ư@ȅ�>p����3�����(�*�.|
T�)5�	8����#���:���B��p=U��m޽P��,��(簼���$�'�����K�kk�(Hp3��(&��*�}m-�A[S��F�	5�����D&n�#���Ǿ�T,*�04��֔[�o-ow8b��b�iʭ�)�����c���R�Y;��<�ְ���������Xf&��k�����S�HK9����H��������҂��è�*�F:9:��k�(`h�,Ӵ,���Y����Fҩ��N��ς�0a���4%G��O��;hj�.��[h�04�'Ҵ�f@��D��������_ݖ��%�3�%��JEK���z<��z�v��f#�ի�*qM90+w�p[bhjj��㩆�$�FTj�b)���sz�ch
��9M^���Z=�vم��㶬a���Z=�L�-u�9M���rMm��O�Qy�ߙ��xQn0#��Dao�MM������1��������CS31)c��$�x�(U����sw�28�U�liz�nD���M�*E%�'Jߏ.k4�ԶM��ժdch:T)A�=��3�:����.�ْޭ�V+�tP��t)�1����؃�?��[�ҟ�c�@w��`R�K�	�ג0�^�lQ����oO����xV��PRMQ�}{��#\߲(Z������-�AJ�-P����cV��IةM��k*�8���BU���x�#�O��s���Z{��"��R=��=����>�<���������e�yȘ�c[J�nG�����"���e��n�� �S���Hl�o�+��dLu�#�n۱n��7���[M��v�F���pFO�e��;���?��o|����/�}����L��?��?��޽���?}���Ӈ�߽��������f��7����~*?}�#BԦ�1Z��lgUea��aG�����'�DG��/|�S������OP�Uo���&�3�������������/^��w����ؚK=�7�'����+�r\U?���͇>�������_Ͱ$̴���?�?}���/x{� �   ����ӛ�o����_��_����)��_~���{�髪g?c���v�v�_MN�g������_��O�_���㧿��߾��7������Q��f�������������|����������˾���w?�����^|��Oo~�͛wo߿y���W��ۏ����~�����;������	�U��(�N���-��W�������}��Ӈ�_�S�ꫯ��x��      b      x������ � �      d      x�=�[����D�+s�y���;�5c���Ke�K�P@�����:����g7�UFטe�ϸ��Ԡ�*�kԽw�l{�G���^�f��z�i��Ѓm�jq�ͪgi,���Õ�=<�h��ڬ��*� ��jt���>rc�A�X4c��֠ٱ��^���0y��4�UFנ���lj�liЌl�у�q�B��Qh���Jk\�Gch���������x�������{�hp�ڬ���'�v{��Ӽҽ�Q��6�^�����W�{�O㞣A�kw�٠��h�l�~�L���z�,���z� ��z�|�R�f��
=p��������As�A����̣��k�z������͸ҽR������AsJ�Ҡ٫A3z�d���=W�����Yx�F��v����4[4��»5�r4��8%�Ѩ+�i�=����OĠ�ԠY��;��1hV?���\��jV>��N�D�T�ӽB������7k��{s������o�NN�;�����ᳺËG����;�x��dᳺ��g����;�����X�ƃ_�c-�i�2�o�C�+S�{���c�W�f��y�x�{�W��~���wt�t�z �QF�`,�,�y5hF�͎�������J���ѽ���35�giЌl�m�у㕫QW��0�)ፇ�@���@����Og��Lg��N��NG�{�cM�����3���N>q:n�������O��(�j: x���h����,甥��U��Yc��<�1֯����jtggJ=�/�4�iG��y?^���k�����F&�Wv���Ճ�on����Ճ���/Ff���|/���^c�W�z��>��<`Ѓ�+5�{g�=�yڨ{����#�0j�v �5J����'�{��NO|�gT3}Ȭ���ey�0f��q�̅��5geU͍�=5�͂�#/�j�6?�� ��3��	�cՏ_'k�`}F����~�1�f�T��z�UA��9�F?_I����׬��7cY|���YΊ/?��޴>���
y'F>�Z�ߚ�{�U��w��#���q\�V?#/W�3���A��ؽ������zW�+~� +���B��Ad����32%�>#k�t�*�锯�:&8T��������!��ԕ��A�e�`8��k�t^?t�ip�g�����^���
��d9�q�gb}"�g\���� 9?�a�f�#�g�2 g�Ą��g��/���V����_5����~����F��^F��Y��3l61l�}T���+��'��Ԩ���Y��3z{������I�Zj���zǘi60�zІ�jZ���PCo�oA}.��o�|�����������h��o�F������|f���gՏ�� Y�sЃ�ߡ���32����|��	S�������Oy�Y=xV�g.�<z�y����/Z��_�j��?���,��H�7׃��^��9���07��ȏ���]#��#�)c�?����9x���f���x�Y�=����A_�x�|����� <���\��r�u�۞�8>#�e?e��z7������]�'��]�0��~AǕ��5O7i��x����#%��fd���O��]9#%,������Z5�E-S��N3"�Ϊ��9o�v�pXF�ޙySh��ý�Sh0�x���t.a+1���s�\���d`b�_���	��mF⩇md�:�F��Y� ����N��p���~K�+Ճ�|�[j^�7ކо� �������5;����#�*����x@\y�h��Q c; ��L#A���� �+����o��Q��$��zp�~NCXT=8�Vs,�A�S�p�
fM�C�@I(�3�N��/7�/���p�,��*�U�".`�w	UW��n=�O\{����r�:�&��y~.J�f�
�΃���Xb���.�2\���=��G�V�8k���0���:z�Wad�6=9�ňzt�W�aV��A��Q��3qU�+�z1ҷ���9��|��S�U��¯Ym�
#~Lq5�t��� \M8��_u�A�W�.r(ޫ�m��)XT� �UP�V"�	��!Jl�c�� R�_6cQZ���[ ���(���pX���D���Y��C��,�
�a�_"�Z������q��>�﹯���
�
5��SP'��e��B��ϙ�W�g�m�jv^�W�wO��g�
dUZ���3��A뢧�A6 &� 8Di �� �C>�UW��?G߄_���ѣfa��qMQZ��ax5#�~V�/Yc0�R�0D��XG\U k�G?�#��foW`*d���/V���R��U��IZ�A)Sa�'����&��f ���JU�A��(�9�>�-J;|���t�
_wqH��I�
	�����ķ2p5o^���g�����5��L�=�4z��r����M��cqU.���dՙ���i3\�o�q5)C�rv��Ue���6�U~zI�?\UW�����LT;~��^?5��Ue�>nc	��=/�34
u�.y�?L,B�yݻd�@�&��u��'�.&�Y@��Yc��,1�,N����} �=l�o(��f�B6�F�h��~?5����F>Öf�C*�>�-]K,����b�¯[ +�R�Il>\�$��Uu� 3�W���`�0� � [��1�yG�U�h_l��e��S�/'4��x���#1=��#\�ܷ\�R��G�s��dU�82���}����V"�㈸�8�M5��Y}Kk�1�_��+�U�%}����&��Nf{��\'���Ɍ�_�� �@:0IR��,A�@���_~��fѶY@�Z��&��&������G����Uv��W�qc�k��7*���� sV.4YGD��� :d�qn/	�
��+���N�:�gvW�*�K���,�V����&��+�I��t�����qJd�j��@�׎�å�U��9�J)P��\�������b��W���~�¯2j<RG0���"ƭW,��� :�"�Z��w����0��A�[�~a��-?7���Oj��QLI����jQ��:+$����T(M�&���`�<���g\���U�1�ª�İY�@m��%���ؖ
�+×�IG ȂM.��-0+�4�-��@|a��>랉�fK^�PI�x��25�Wf��^�������(���9|�u����p�ʙ�,�9�*�a|(*,��"�(*L����A���YA6�G�V����l�;],V���Y� �W`�ɳ$ɒ�	qO�P
"J��"��A�2��
^��y���(�ޓ|�$�o�$ɪ�W�d�����_���r\]X�dU�t� e�v��=rV`���L��1�'wt�8�:�����j�q��y$�e����i�sDi�W;���2%�'�V��L�^k`|��k���
�H��"����Q�N��ZEh��ZAcy��7z��$=�&�,�m��(��:<R��#5kz�H]��b]�
<���N�N�O��w`C�E[�=�Q��x�Ⱦ�ۣd������S��F}a{��@va[��oy�"�?�{j��v�-���:NNx�.�j�W�+�@9��pj�} ̩r�ܞ)����,�[}�u0o�Sdu, �1�(�S�>¯��M����B���"�v�y� kH2����ê/$������*��䴣$(q��n!�0R}�T��YŒne�V~
�e�&Ȫ@�˿U��B"�#�W5AW��f�2ţE���X�& K����T1�3���2�~M	/�C��E�Ѫb9�f�sʩ��Wo����pN��G�UO{1Y�~�Ů�,��=��W\Uo!S��-�U��t��J��.����[����#�U��~Օ{e�(>^�W&��c��_��G�Y��Z� �X�ߔ�_��#�kZ|�+w
�
�<S��`Q�a�����0ߵv9o9e/�B������$���>�5ڌ2��˅ �8�Ϩ��m�12T�TC��^��2�;�C�QxǸ�Y�C�EИ5��u@i    �Q��!
��Gt�n%�E3�TeF-�wY�Jd]9�J$��+��I-T�0��0&|ն`	"����=�賂R��̪|�`�X�����sЭ�N �t��'3��X�>+�@�ZF-. �Xy�B��U������b|ۂ��bͱ^���&U�qi .�rqb�ݒ�R��6�,y�b�l�\ڵ,Y�*E��dX�O�`K�QM6��
�#��o�`4��}]�;œ��z�����\�1�kY�T����D�<�*EP���}�b8 ���e��-ɷ^k����|���2�++EL�@�Go��|*��Z-�,��\�����S$X��G�c�\UF$�k���vWEud��CA�[	_���O:@F��-���2� ��vJ�
(�%��RW(U�q�|4�%�*��4Q�E>�>�~�
���Q<6F��|�Dվfqc�Ҥ��]�mA���2+]�:�����F@��3Y�\$*���a���
��QRU����%�ٽ�����0H�j_	Fz�b��u� �%�r�$�j�H�}Ӎ�x�.��G�D�Q0���H;n�<N�ʓ�965!h}�ឨ�-��2H�.�3]���x�k�{��!�i��xA�G�S��x���Ӥ��W5�&
|]}CV
��(���KCB~eٸ���hquB�{�<�&�F�&Q�C*o��!�WzR�R�q^!N�V���B��R��c�\x$> N�C��F��"M��hu�B�i��O�T�H*!�zD5u��e��!��yw��q��ͷkE��J����%M�ŭ&}ER5� 2M	 ��#�Q=G�oN�6 n���< ӕTՕ12���@��Qߞ�H����
�uZ�KS�4��R ��ȇ:�JFg2���?�e�ʠ��,fR���Cmw�h�uvg2�¯���0S�m����|�|m1���|bWl��+ ���#\�� ��� �L�.�#��8�� �W�[�Z�C8��PN��E �-B�+H,��N�Nw�7���&�T�TC�DT���v}퍢���,AI5CS���)�GO|�N��>�����
`r\��#��;��'-�P�vR����#%�;����t�F"��ƹ���~�:���w�H�zд<E���3H^�'�,�1����0u�I�T?�^� ������V��=5nLQ���;�`r�������	�swK�jԑ�ȋ�~�V���܆j�|[�01K逌�E��*Lrd�
st�0s�*���L�QlK�H��6�-��7��c���B�W]��iEC�_��.y0�W �.y0�WT���ZGl9)XJb.
�G��Z�q��bl�c�P�v���D��(��x�?]V��Jp��I�Q����d�u�I�,6,��źX��=d���ֻ:����
#�[W8�� p��
�W�" ��*��z��c\Y)��WV
`vfe�,(�{f����".8�d�u�p�*�|�	WR�}WR��U���קݥ"j*Â����g_�0�W./v}�ؕ��WI"�k����]1�ϫ��v������ᗄ8*xꀏ�,��GM(���BjB�	���Q�: 2,�)Jk�Ai�: E�
��0f#n[�h��-w4Xߧ�(d��ⱐ����v�l�kV�JD���B\Ճ֭���hg�Ű�H��N%U�	d�]K�+d�!�m[�+���Pa\>1���bs�ɪ,�G��,��]+SR�WJ� Ta+C5�9�򉑾R��p���,��dQ��aQ�d��JD�`�V���YHD�A�\�d��j+��}�Y�.�E&��\dJ�pR�q�_nVW�©
+���	$��${q�WT2fQM,�(ToT�~Ic��F5a�Rڟѝ����C軥$��咝An��j�J7�з�O��n%ةp�
CFҼ�ڽ"ԁ��a��QO�G&�Pz�Q�GY;Ŏ�2����q���Ǥ��k<%Ux%H�^5��W�N:�w4&MKE��I����"���F�k��S�y�u@P�� �-e@��M�jb$x$KK���HB�}��ي��,�{IY[Q
������-��%��NQ(���
��ғ11�Pj�d��Lʫ2�%��m�?��KЛH�|����)˟�Ⱐ�Ҿ�ہR[���V�R�����:�6+ J]9�L��d�}��P���W���JK������
�ŝЋ��a��x|�g��g�<�gLTx�Z��D���T��}�*�.�jJ��USI�W�q-IspW�J�D]��f���f�`aS��}v�z��-��y,��q5űp\��(��ʒL�K��5E@;w7D�Wz���J,�L�o!��Tr��=	W�=?~e�((^�!9�4������� ��R��I��\E�� !,�W�?��F��ܖ�- �~="�2�.��|�.�Sm���f=����V_��f�z�P�l�F��c�T�x��o�Qө�� 5ε<S�#�up\G�ǵ�Hȣ^1�W�:鈑(��QW�+F*�Ӯ	�cJk=�֩�=���J}fC>�Z�>�"j
�ʸSE��Ak-a����O`�u�*v�
	&;F��>���G���X�m��&E��D����S�\�7�wA�)R[k����d�����=�c�@�E75���Ӿh	�5��,j$y��^�Fy�F�h�FS���@/Ě��~��7���|����nd��������W�=�𚾰�����HAlG�����{9~Y�5�f�,��+�d�Ǖ�9"�舼�V�1����@|D�D�#�LP:����GK6z$�)lY�Fڨ���I�TZı��(���8Jw%wR\����{��_����8�RY�jJ���W^���#cVAi+�A����#l)D0۳�[�w�����O�<���p�ߌ��Cd��QZoKX����IVT/���N�Ȱ�B8���2�^Zp�3mu50�[��xTLOXP�[�P|f�,�{
?���&���V9�	%*�Q�)��aM�,�W��'Vl�X���t��x����	
PI��b�E@�-Z��T��WI�->Z�&���l)�o��R����"ɸ�q�g���>��F���7�5����RK:``6%��
�˒i�4]�k4���wԛ2�������ߔ���)G�=d�e~6;��o������;DM�%^�`6��Mv�^a8U����|Q���C�_�*WI"Gz\�w��]�`L�5å]��'W���]5f`�+E�u�!��סB�u�f!��Ea�@�Y�Zd�T-�����̐Г��� �V)c-�6T^Ax�W�jQ<��=pw{�]����e����KCzo^�@���\gj�u�B�FQ�Q^��[����Iw�œZߺ��o��LVWRJk�Prߧ����ڣ��pU�D"�z�l�ZW��u��(K^i�2�XV�Ěu�htc�`��o� ����ײ$��+oY��G��#-� ��݃�<�L�����[L�L���Իs!�/��bׅ��bꝅ��[b\�h*����Bt�O��ݩO@�+�T�u/�P�e`��: IV]�����F�*��?n�H@�r����R�)X.�4U��4u�X)v�j���0�X/�=2Y���� ����";�ܣ����x��*�*9 ,�m"�q�R�<*-r&�	n�<+CQ(��!�{���"q�|˚G��*:�꼓b��F�Λ��+�h�b�Dc�$W���T�%��lO"(m9$�[�-�[���"�%�Ѓ�Җ۠��:Q�ޞ��J����vիm0Bz��x5��(8�2ՆJ�N�`�Z�A)�bd|�����Jz���3Aߟ�c�*_�L����Rof�!����(�U%�����$_p��$_�L����I�|,v�{����d�`h�/v�?B)v��	-"��(-	'�O�ˌ_Y�>�엹��ܒġX���1��/#���1�����-��cղ_ƭ�/#M��ΞO���)ߌx�f�BМ#��blzh�f������f��!6L�o���[�+��޸�_�d�zc� �  "hyX�+5z����u ��� �/'�\7ϐQ^�p��뷀;�J����).��6��W]'{#�I
�����W��*�U�h�*��S�� �]}�C842=�����g��&K�Ճ]��Y�
T5C����g��`���#���#ƑK����(>n�b 3�}��XSJ���Oc�xXEC���a�t`c���>	�h�\6���,�!0+,60TΣA�,�N���^�Z�Gt�DZQ+�P2�2(����l˲Q��\��DNO��9��٦J2 �p"��&�dkRn(����Qd{�o�@�ˢ �˯�ض��mI�¿M���!�F%�C$lF����ùҝ��!�"69����&Ƿ�=ͅ���68�s�8>��\Ё�E&ayQ%�����ʲ�� ����٧1Y��>{e���^+ �����ok4�O�A�rHӁ�Ȯ�R�)C�1��Bs���E,gw�QR���(�y[)5JN ���u/u�;~0�2� ����������(���)��+>��S#�N�t� s���������-$���|��$ǫ>�%o�.1e{�%qh[7#\m*�mh�����"�n7�3O��s��v��C�;,a?��d��h�ԥ3�H�L)ڀ133����`|����~�|CP�3�Y���m��	�j�k"T�T�Z��#+�`�c��tT��� ��������ABSV�� ��n���o\a��H��<u���aW���lk��"�|���l]��uEܛmĊ��u��Ήz�l]�F��Qԙ<K4'��ֳsؕ�\Nu�Y�0��Yd�)ɥmrM�;zX�4�r��/��8l�w����$����^���z9%�K��k��1{���~M�ة|ݶA.x=��}��},L��sy];
��#��<�i����R�
���� 4�*�C�o��<��A{��c+j�@����gH*�-�(@�:�#��<���
PJ.��j4jS�2�){�(�X���B�\�}%9�0u�t��"��Gj
���w�]�Sw6Pv��!��������*O�$'e0P*Y�����Xg��ԕ񪕢(��P �^I%��G��H*���j��J]A	<�#����Mk��|��G+0ۿ�!%���
ls�bJ��!�̶B��l{T�b��|��GR,T{�\̶;�-�\l��Ŧ��c���:���as��O�1~
�=�
!�M���#���1�u�t�f�n�s�S����ZtN}N�9��}�P�*��WR�:�z��+[ut�BU��`
	d�]Į#�!\W"��"k;�bdmG̽G��q�u���f}q��"�8�^�8Y��c���~�x���wx���Y['D̿>�]l��9�^��!�>�"r�18u�1��1��%���Կ����z��y��R_8�i���}ܨ�}9�#��=<�7���	ʱ"@�{ܮL����nNU�4E%@�ٯ�P-2���zڏ��+�Qތu��zr��y	T��"���"�m�^qa$�\ąѼ��3�΢���38l9Xlq���F�E�ay/�#Î�;*��Q����ڎ$C+ǌg�W���w�¥ġ���ony�F^���Cő;#*�#wB�/��\�>=����z�4
2�@���=��?�cN�8��oյ��Z��ǒ¹��)+�WYe%��3�!=��vd	 A����q������F��"���4�섶�I�דsٖ��1_�+�$f�M��=T_����B�4�J�񻇓ǚ�Maͅ�A�a0���Ł#�d�PF���2B�-�> v%�rEÿ5�θ��?+�6D�
�}�$f-�^c�v8c�wQ �∧�*��i�!1W���/��5���q��q�"��1��9�Q�D�r�D�#5A ;���?�C|�ޅ��x��Q�E����x��u��T�����XoS��m�x���o[gWW�)G�8@!1kq��H��8R�%-���2ض�����\���8�!�Ȣ�:�&-�]�Ew¥-drm�� �K?
%���$�ǊR2_��1+���b-�f_���b������w��`d���1]��؃:\�<B�1�S�:�2���Kp�lS8*��z�Xaf�5qةcu}�q�����������j���eogj��=��0�!����#^A>�Q��������x�������;P�:H����l#/4 s4��FM"S�<����b�Ċ	��e��r�;o��8�A��Vv\}��+���Գ���v���m�c�(��	��j����H�ɎI
��ȶ���Bo�V�@3,��(n������� �?6F�~L")l7��g|�\�t�e[ƫu��܏��
�+$���j��݊���<^�t��������.���v]�,¡3������>ڡ"j�FF�aES}�_��W ���0e+�+F:���FT?�Bܞ�9P���Ҧ	�8t5$������l�P����x�5��c��ӱ|�-��l�ls���u��:s�9�lu�>�:|��6�u��T�qQ� �Qq�ՠk?0E(��e�`�1D�	��et}<g.Q4=H��P�Ր�l"��=��/������v��귈���m��m� �wq�9w2R�Ź���4ΝTKM��HDA�)*����*� �
ۦ���GZ"��f��`;Xy=9��)�|��D1�7�n��d��'��o��{MVA\M�A��v�Y�����^����짮	޺u �v�������` �v��
T�q��������ɛ��/�ѓ3��ϙ9mzr��u2��ϙ��IF�W���Q��,���T�LO6����c��݅Y;�?{4~�+K���r�{t��2�p�[��jp��kťug�6� �aF��>��B��%��:� ���eu�)~t8`�a����Sf��CKĘ�h�ˏ����-��VwW/%����^3.X��������W� O.$���ф�F�KP�5�%Te72AU
�8dw�9d���5�o�X|�G#�n���8�@�#�}\�
D�ϟ�?_�Z�v[�V��(�4�֧� ��0 ��Hp�{��u�D�����o;��q3�q�9���4�/�|���eػ<�C�_����^Jsxq(��u�^��F��|�������'�bx+��8�x,=1�t���5��W���N"X�v���y��"��o��]F���kM|��꿡�[5�������?	FHL      f      x�=�]��0
C��^̜��e�����T��E;�#@���}��<�_��q���~�ڕ�,�P�\�����p��%a�ake�럄c�+<~�k�	��]Ϲz�[�

�h�s�4�˷���ެ������'�aE��H�����=��O�ʗy�{E�ߐP�gIhY��r$�W´�>	=B�
7h%ae�[�
��fC�(ڤ�n�ehp#H�_�ݤ��/����?7(i��oA��[��i�VV�A�:�'�m^��� ���٥���JG������=̗u��2i ��GT��oh�� �ӯ.h��9����������^��󯯚��=�^��ֆ����µ��So��l������J��=^��A����9Q�D�z�!��l�A������|I��#Hm�n����n�������ۂ��rM	�@� aK��.��`Fэ'�I��4����[
h��Y��n�������������1�B!+=���ǳsf=�������n�A�)��]W,\+ޡX��֣�b�v�ALp��H�A�V,\��Ɋ^A���'(�=��X��������i�[��_6�b�E,|&�p,T� ��@�Z�"H���&V�=#t܀X(�Kb�^��4��Y���'+�+��m���i@ H��������"H�DB,$eJ�ge�f�}&���-��"���
Ϗ�D�koYD��"����i	�����7�N$�����4�,I�\&n�B,�VZ�p15���\%S(U����bP��e�����v*"lA	�"t	]B6G������	��K�4��䮨����"F�\C�i��©n�w<���p~��[��e��������wj�=���a;O�:wؓ���1�[���>[<�}[ĥ	0o�|�#�i���yW�.�=ݤ}��y���˝��,	�z��ϦB���Ӊ�H���~7�(0��.
L`|�~{W��w��;���]�۲���W��y�-���4���kJ�>��
8�	�w�1� �;�U���l�c}�Yf�D��M���,q���&ȻNr���n`n��s�[���E�i-����~ 0��R@�`H�����3ǧH"�\}���泴���?{�s�o���̮�ȃi�����/���`�� �2iЧ����	e����s�'���O�gl{���^Ʊ��.+����LZh}7�_��:T���oC��S��MF �>�K ���2Ͼ��@����wO4�����Q�~vO��Έ�*%�Id=��'e=�v�̆�-�=$|ׂ<�9�o=�N�KO�������u}ᡆ�W��z���O]�q�>��_�J2�����1�,�F�.�j��ߎW�.a8���ϴf��qٰ����x��0�ig�;��4�3�r�D��+p�6.n�͏}�ގ����%���K��zz���o�ʽ�p�����ڽ��$�3���ލ�>�S��MX�Sޛ��l}�V%�KPj#���|m�wt���1n�3h��@�]gս��=U �S7m��C�ge2��� ��@+;(Z`�<�H��t�F�n:o�n:7ޏ0��q�}=��6��aJq�?�:�o��R"��~ڗ'�t�[�l'�P�X��X[���p� �P�3Q@�!H?DȊN�/
H�QVY��LޗpB]��X�$$LWh�0�n=AA!�ssc�J�J2PWb��r�"?	2UR�v��/�P6;&rO%0	n���v��=ځ�㻍a*{��	"J~t�2�	�ea�l$H�CI	p6B"�!zT�!a:��!�I+��%18�&���<�)��E�rO��c|��>��=�6�N�s�!�%.| � ��!ë~=��e��2�\�A���ۨy���f��:��o��́v�"Q���r�:&
J/ ��z��:M�_�TD�D��'�B�ݮ��	��$��a�qxE�B'�fV�����
��ha�{���-���@��	ӹ�v��{��grvG��۹�0�&(5C1/D�F��Mn��7�A+��)��n�=C+����-��Z�Fh拊H�W�
>;�V%�m*g휹���T���1�(���W��c[	�@� \��V n���u��좝�Lo�n`C.zEb�Ϟ3����M		 ��� 2�4@��f��H�U��5b�r0@�p�� ���Q`�xx��a]�&'��ʥ�|�i��'�O��L�x
�w�WI@�Y��mv�fǥa���.n�SQ�D��tD�mvm�H),@;9��x�	IW'A��JO��>o���4,@P�A#C�!�Jq'p���x�5G����v��;��b[��\��>���k�������eh-l���j[)g�Dr-��^f{�fQ�>N�B٣q�X��R��~���0�RO�Nx�;+��x�l;��^�g ��4'Z� K9�R�Q�+N$��)tFh������y	=۴���K���iɦ��ť�;)�d��7� {�'��H�q��V�X�Iţ�/�q1�qg��t���q%��u`Ni�Q���HN�L��.g*@�e8�X�3�����T.�C���9ʍûzJ6��e�dۦ�\yu��+������N�ަ�&k�ź�6lޔi2ơ��g%N�*��[��n�8n�?���ܦ�^)��^Ӏ�t%�u��{Ÿ��~�L��QM�]1�o��c��M�q��!������ʶ'$LuRت(
�%@��s�+�ݕ�qw\�d��2NM��+��ll^����x�:�wB�#îvx�0�#��.�:� WDđ��:E|�]v��L���JO�m������"�I}��>�,p��ݶ�0����fP��,P&L0%��>Fi�O���T���s3	�s�4�r؍�5,�ʋJ3O_++<���Ǐ��˛Prӗ:^�4+���$��O�K`Vhax�a#۴�[�J�vFx�>�T��X :����R��9��N�e�J}���!���[��7p��9x�����_��\�-�.#���7����,Ӫ�����$�W�!�T������Q4@}7����jԉ�D�\�y�i��	��s�j�F�y�4h4~�pR�"ܬ���f5Zat�$���Q�x�\��7+�+/,=A|'+��]�'H�o[Q8������J�B�`H$�,�5l���<�tǝ��u�1|9cj���u,t�s�x�� ��k��m+(Zf�c��i�M�r��
Zw4p$�ò]��V��Md{�c�l�
7�P�!H�EG��v(�6�#$Pt���P�Hy�)$a���e�+l�Nt<��Ɏ��{Icp�O4v�,Gm(�G�.N����7��;z�S�����UtY`F������U<>h��-��+xEAi�Q͎p-��%T���`uO����p6��6�b�E���'¶�3颯�Z����j�pkE�����zʔ�@�B��9�`=hP���eǕ�W�/�6��e�`�}nE`���%�K��aRŌb3�|BQw23��-4�Т��9�%��X�N��N��ɟ*J���P���|{����%�>� ���Qgz#A��s��:hv�Vvq3�K�~�Q0Z�r=s���6xQ3���0�&�0����L� �hZ������ԭ�8S$֤��x�Ml��%B?A����QTs�ɤ���F�밭#��.߀7�P`�n=A��O-Uк؂�pѾ���$Op��p�k��wӠ���r�3�{z.W��j����dELKvW����.����Υ§y�����3`�=��ia�3�<�-��$w�Ji���<e��T}�a��L���Y'@��V}�.����px�lh�6%���b��T�D`vht��`J`��t?潵 6w05\cS�$&=�FSѥ=�`�*wV����q)MeA��s@J��g&m�k:��2��7t���>q�]��x0rn�����m|�cC����<]�zn�I3�[��	0��>z�A�^=�H[ P9�	af��b�w
���P�>L!8���Ϫ����i~�E8��Y&�..zG3�����Z�K-�N]��i�{2F���uG��8�è���=��N�,'�1��9���P��, �  ��/��� [}��h7s�@��%���}nM{��i7}�����񚞊�;�<�-Qo�+�izhPJ�Y���)0�����I����R���j^;�#�R�����B�Ø�a�,���́�;�����Y=&f���#<��\@��Gp$�ܩ�0�"	T�x��9Vख़�ӻ��J5����J����{����6�as����m6�S��X!a���P��j���>�	�}8�*��_�3��^��[�I�ō�5O(]�@�3>A9'����|}f���!�i09qC�m2l'j�I����u��e��M�g��m�
ҟ�#��Gf�s����k��$��y��@M�W1�ո�̾&��3���B���NP<������ٓ�{`L�E�Z�RjЅ����Y��������b���M����rN�I�`@����axӤ���y�C�N���(v�ׁz���U��$Q$�r�{ۢj��ϝ��L��!t�D �L���������-��1-h���\�:�^�#�Uީ���a���:ͧ1�[!�=�<��f1��h\�;���S�gW��$�ؿ+��cN���X����9p��ҝ9�M���L�1��xM&Dqr>��p˝�+�b�=���.��8���n�$�83m@�%՝�|��%���>}�͔V�;9S���������K��Y�H��e���;�i�h���F!B�k4�Hꕪd�5�*!�OR[Ks���7��S
�/e������W%4����ID38�7[B#��%u���Θb�t�=H�g8�<�[���+���ŏt���r�[R��RXQ����(<�D�ALy)H1 Mh�L�C'���$��e>�j&��eH����/����;����_p���G\���!�S\s�����J�;�O5N%HgQ�FŦN�����>�B�;$��9�V���z����m�	r��Ѹ��Mg�	e�u;Gu��Q�K�\w¬O;Vg�?��1ه;	iO��h�a	g����IX���g�F���[R-��><�����$dJ?}�.��p]�?�i���*c	��������fj��Iv���0�o�8���T��wN����� k
k�,�I��-����D�E�.b��(Lq.�5�F�"{)�@�`vKA}ʝ���x��pwrDPc�M-"�4�޸p'�$*2��ץ�q��s�l%�6`R�H/݉�q�Nk�������Nn%z��v�I��L�}�x~
���7b���O�?r|��[%��k�ɍIjs?bpx`�@R��u���}=锺Z�IP�ɿ��Mt�@��j $�M�c�=��c��i9��@�N��|$�H����%�g	��u�{�tA��PY̕Z��i�}�_�/!�P�?~���Y��	��>������ϬP8fR�ݬ�pLXtRӺ/�MZ�ũ��J�����)���T0)'(պi3���N��Z�zOm��f��CD��>ZeN3 ��P<�8�-���D��&!�����8���]�Ih�I��*\g�c�#��_�P~7x�|~�����8��e^�o�nX?-��|�g^�n��6�N
�}�ށ��N+�1Ԇ$L��:fupD��gqfu%ͳT �d�ks�ZԮ_� �s9�q:���M�l�9�:�����i'�s���%s
�l�r������r�i	!!����ґ��p'����+-"��nSw&!�W'֔���t�]�$-�kL�0A�R"oc�ꮛ����t�L�����Gn�l>�� )x��j�L�V�_i��S֛q�*��_pӁ�	?��y7~ԨS``M�Q]2ǿ�($L���
[�����m-Cr�����"��a��i2~�}�����#=~-M�m*�d�
������OWq�e���������bM	�      h   �   x�3�LL���s �6�_eb�#��Y� ar����~AiRNf�~AQ~ZfNj�>X�^zf�gEEq~QfjNE�Cznbf�^r~.g0Xb(��������i�id`h�kh�kd�`hbehae`�g```fjL��=... �:�      j      x������ � �     