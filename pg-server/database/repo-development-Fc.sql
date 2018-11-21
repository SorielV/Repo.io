PGDMP         (            
    v            repo-development    11.1    11.1 �    n           0    0    ENCODING    ENCODING     #   SET client_encoding = 'SQL_ASCII';
                       false            o           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            p           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            q           1262    16641    repo-development    DATABASE     u   CREATE DATABASE "repo-development" WITH TEMPLATE = template0 ENCODING = 'SQL_ASCII' LC_COLLATE = 'C' LC_CTYPE = 'C';
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
       public       postgres    false    237            r           0    0    Blog_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Blog_id_seq" OWNED BY public."Blog".id;
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
       public       postgres    false    197            s           0    0    BundleComment_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."BundleComment_id_seq" OWNED BY public."BundleComment".id;
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
       public       postgres    false    199            t           0    0    BundleRepository_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."BundleRepository_id_seq" OWNED BY public."BundleRepository".id;
            public       postgres    false    200            �            1259    33283    Bundle_id_seq    SEQUENCE     x   CREATE SEQUENCE public."Bundle_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Bundle_id_seq";
       public       postgres    false    196            u           0    0    Bundle_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Bundle_id_seq" OWNED BY public."Bundle".id;
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
       public       postgres    false    202            v           0    0    CatalogAuthors_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."CatalogAuthors_id_seq" OWNED BY public."CatalogAuthors".id;
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
       public       postgres    false    204            w           0    0    CatalogEditorials_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."CatalogEditorials_id_seq" OWNED BY public."CatalogEditorials".id;
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
       public       postgres    false    206            x           0    0    CatalogTopics_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."CatalogTopics_id_seq" OWNED BY public."CatalogTopics".id;
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
       public       postgres    false    208            y           0    0    CatalogTypes_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."CatalogTypes_id_seq" OWNED BY public."CatalogTypes".id;
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
       public       postgres    false    210            z           0    0    Files_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Files_id_seq" OWNED BY public."Files".id;
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
       public       postgres    false    212            {           0    0    MyList_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."MyList_id_seq" OWNED BY public."MyList".id;
            public       postgres    false    213            �            1259    33320    Repositories    TABLE     �  CREATE TABLE public."Repositories" (
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
 "   DROP TABLE public."Repositories";
       public         postgres    false            �            1259    33325    Repositories_id_seq    SEQUENCE     ~   CREATE SEQUENCE public."Repositories_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Repositories_id_seq";
       public       postgres    false    214            |           0    0    Repositories_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Repositories_id_seq" OWNED BY public."Repositories".id;
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
       public       postgres    false    216            }           0    0    RepositoryAuthors_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."RepositoryAuthors_id_seq" OWNED BY public."RepositoryAuthors".id;
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
       public       postgres    false    218            ~           0    0    RepositoryComment_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."RepositoryComment_id_seq" OWNED BY public."RepositoryComment".id;
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
       public       postgres    false    220                       0    0    RepositoryEditorials_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public."RepositoryEditorials_id_seq" OWNED BY public."RepositoryEditorials".id;
            public       postgres    false    221            �            1259    33343    RepositoryResources    TABLE     �  CREATE TABLE public."RepositoryResources" (
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
            public       postgres    false    235            r           2604    33613    Blog id    DEFAULT     f   ALTER TABLE ONLY public."Blog" ALTER COLUMN id SET DEFAULT nextval('public."Blog_id_seq"'::regclass);
 8   ALTER TABLE public."Blog" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    237    236    237            N           2604    16660 	   Bundle id    DEFAULT     j   ALTER TABLE ONLY public."Bundle" ALTER COLUMN id SET DEFAULT nextval('public."Bundle_id_seq"'::regclass);
 :   ALTER TABLE public."Bundle" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    196            P           2604    16661    BundleComment id    DEFAULT     x   ALTER TABLE ONLY public."BundleComment" ALTER COLUMN id SET DEFAULT nextval('public."BundleComment_id_seq"'::regclass);
 A   ALTER TABLE public."BundleComment" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    197            R           2604    16662    BundleRepository id    DEFAULT     ~   ALTER TABLE ONLY public."BundleRepository" ALTER COLUMN id SET DEFAULT nextval('public."BundleRepository_id_seq"'::regclass);
 D   ALTER TABLE public."BundleRepository" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    199            T           2604    16663    CatalogAuthors id    DEFAULT     z   ALTER TABLE ONLY public."CatalogAuthors" ALTER COLUMN id SET DEFAULT nextval('public."CatalogAuthors_id_seq"'::regclass);
 B   ALTER TABLE public."CatalogAuthors" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    202            U           2604    16664    CatalogEditorials id    DEFAULT     �   ALTER TABLE ONLY public."CatalogEditorials" ALTER COLUMN id SET DEFAULT nextval('public."CatalogEditorials_id_seq"'::regclass);
 E   ALTER TABLE public."CatalogEditorials" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204            W           2604    16665    CatalogTopics id    DEFAULT     v   ALTER TABLE ONLY public."CatalogTopics" ALTER COLUMN id SET DEFAULT nextval('public.catalogtopics_id_seq'::regclass);
 A   ALTER TABLE public."CatalogTopics" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    234    206            Y           2604    16666    CatalogTypes id    DEFAULT     t   ALTER TABLE ONLY public."CatalogTypes" ALTER COLUMN id SET DEFAULT nextval('public.catalogtypes_id_seq'::regclass);
 @   ALTER TABLE public."CatalogTypes" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    235    208            Z           2604    16667    Files id    DEFAULT     h   ALTER TABLE ONLY public."Files" ALTER COLUMN id SET DEFAULT nextval('public."Files_id_seq"'::regclass);
 9   ALTER TABLE public."Files" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    211    210            ]           2604    16668 	   MyList id    DEFAULT     j   ALTER TABLE ONLY public."MyList" ALTER COLUMN id SET DEFAULT nextval('public."MyList_id_seq"'::regclass);
 :   ALTER TABLE public."MyList" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    213    212            `           2604    16669    Repositories id    DEFAULT     v   ALTER TABLE ONLY public."Repositories" ALTER COLUMN id SET DEFAULT nextval('public."Repositories_id_seq"'::regclass);
 @   ALTER TABLE public."Repositories" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    215    214            a           2604    16670    RepositoryAuthors id    DEFAULT     �   ALTER TABLE ONLY public."RepositoryAuthors" ALTER COLUMN id SET DEFAULT nextval('public."RepositoryAuthors_id_seq"'::regclass);
 E   ALTER TABLE public."RepositoryAuthors" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    217    216            c           2604    16671    RepositoryComment id    DEFAULT     �   ALTER TABLE ONLY public."RepositoryComment" ALTER COLUMN id SET DEFAULT nextval('public."RepositoryComment_id_seq"'::regclass);
 E   ALTER TABLE public."RepositoryComment" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    219    218            d           2604    16672    RepositoryEditorials id    DEFAULT     �   ALTER TABLE ONLY public."RepositoryEditorials" ALTER COLUMN id SET DEFAULT nextval('public."RepositoryEditorials_id_seq"'::regclass);
 H   ALTER TABLE public."RepositoryEditorials" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    221    220            h           2604    16673    RepositoryResources id    DEFAULT     �   ALTER TABLE ONLY public."RepositoryResources" ALTER COLUMN id SET DEFAULT nextval('public."RepositoryResources_id_seq"'::regclass);
 G   ALTER TABLE public."RepositoryResources" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    223    222            j           2604    16674    RepositoryScore id    DEFAULT     |   ALTER TABLE ONLY public."RepositoryScore" ALTER COLUMN id SET DEFAULT nextval('public."RepositoryScore_id_seq"'::regclass);
 C   ALTER TABLE public."RepositoryScore" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    225    224            k           2604    16675    RepositoryTopics id    DEFAULT     ~   ALTER TABLE ONLY public."RepositoryTopics" ALTER COLUMN id SET DEFAULT nextval('public."RepositoryTopics_id_seq"'::regclass);
 D   ALTER TABLE public."RepositoryTopics" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    227    226            l           2604    16676    RepositoryTypes id    DEFAULT     |   ALTER TABLE ONLY public."RepositoryTypes" ALTER COLUMN id SET DEFAULT nextval('public."RepositoryTypes_id_seq"'::regclass);
 C   ALTER TABLE public."RepositoryTypes" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    229    228            o           2604    16677    Users id    DEFAULT     h   ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);
 9   ALTER TABLE public."Users" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    231    230            q           2604    16678    Verification_Token id    DEFAULT     �   ALTER TABLE ONLY public."Verification_Token" ALTER COLUMN id SET DEFAULT nextval('public."Verification_Token_id_seq"'::regclass);
 F   ALTER TABLE public."Verification_Token" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    233    232            k          0    33610    Blog 
   TABLE DATA               u   COPY public."Blog" (id, "idUser", username, title, slug, description, image, content, tags, "createdAt") FROM stdin;
    public       postgres    false    237   6�       B          0    33267    Bundle 
   TABLE DATA               k   COPY public."Bundle" (id, "idUser", title, description, oficial, username, "createdAt", image) FROM stdin;
    public       postgres    false    196   �       C          0    33271    BundleComment 
   TABLE DATA               p   COPY public."BundleComment" (id, "idUser", username, "idBundle", comment, "createdAt", "updatedAt") FROM stdin;
    public       postgres    false    197   ��       E          0    33277    BundleRepository 
   TABLE DATA               Y   COPY public."BundleRepository" (id, "idBundle", "idRepository", "createdAt") FROM stdin;
    public       postgres    false    199   ��       H          0    33285    CatalogAuthors 
   TABLE DATA               h   COPY public."CatalogAuthors" (id, image, description, "lastName", "firstName", "createdAt") FROM stdin;
    public       postgres    false    202   �       J          0    33291    CatalogEditorials 
   TABLE DATA               K   COPY public."CatalogEditorials" (id, image, description, name) FROM stdin;
    public       postgres    false    204   ��       L          0    33296    CatalogTopics 
   TABLE DATA               H   COPY public."CatalogTopics" (id, value, description, image) FROM stdin;
    public       postgres    false    206   ��       N          0    33302    CatalogTypes 
   TABLE DATA               G   COPY public."CatalogTypes" (id, value, description, image) FROM stdin;
    public       postgres    false    208   ��       P          0    33308    Files 
   TABLE DATA               C   COPY public."Files" (id, type, path, url, "createdAt") FROM stdin;
    public       postgres    false    210   `�       R          0    33313    MyList 
   TABLE DATA               ]   COPY public."MyList" (id, "idUser", username, "idRepository", type, "createdAt") FROM stdin;
    public       postgres    false    212   }�       T          0    33320    Repositories 
   TABLE DATA               �   COPY public."Repositories" (id, "idUser", username, title, description, image, tags, visibility, "createdAt", "updatedAt") FROM stdin;
    public       postgres    false    214   ��       V          0    33327    RepositoryAuthors 
   TABLE DATA               M   COPY public."RepositoryAuthors" (id, "idRepository", "idAuthor") FROM stdin;
    public       postgres    false    216   mN      X          0    33332    RepositoryComment 
   TABLE DATA               x   COPY public."RepositoryComment" (id, "idUser", username, "idRepository", comment, "createdAt", "updatedAt") FROM stdin;
    public       postgres    false    218   �N      Z          0    33338    RepositoryEditorials 
   TABLE DATA               Q   COPY public."RepositoryEditorials" (id, "idRepository", "idCatalog") FROM stdin;
    public       postgres    false    220   	O      \          0    33343    RepositoryResources 
   TABLE DATA               �   COPY public."RepositoryResources" (id, "idUser", username, "idRepository", file, type, uploaded, "createdAt", "updatedAt") FROM stdin;
    public       postgres    false    222   &O      ^          0    33351    RepositoryScore 
   TABLE DATA               m   COPY public."RepositoryScore" (id, "idUser", username, score, comment, "createdAt", "updatedAt") FROM stdin;
    public       postgres    false    224   �~      `          0    33357    RepositoryTopics 
   TABLE DATA               M   COPY public."RepositoryTopics" (id, "idRepository", "idCatalog") FROM stdin;
    public       postgres    false    226   �~      b          0    33362    RepositoryTypes 
   TABLE DATA               L   COPY public."RepositoryTypes" (id, "idRepository", "idCatalog") FROM stdin;
    public       postgres    false    228   ��      d          0    33367    Users 
   TABLE DATA               �   COPY public."Users" (id, email, username, password, "firstName", "lastName", type, "createdAt", "updatedAt", "profileImage") FROM stdin;
    public       postgres    false    230   a�      f          0    33374    Verification_Token 
   TABLE DATA               w   COPY public."Verification_Token" (id, "idUser", username, token, type, "createdAt", "expiredAt", column_8) FROM stdin;
    public       postgres    false    232   4�      �           0    0    Blog_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."Blog_id_seq"', 2, true);
            public       postgres    false    236            �           0    0    BundleComment_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."BundleComment_id_seq"', 1, false);
            public       postgres    false    198            �           0    0    BundleRepository_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."BundleRepository_id_seq"', 2, true);
            public       postgres    false    200            �           0    0    Bundle_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Bundle_id_seq"', 1, false);
            public       postgres    false    201            �           0    0    CatalogAuthors_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."CatalogAuthors_id_seq"', 1, true);
            public       postgres    false    203            �           0    0    CatalogEditorials_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."CatalogEditorials_id_seq"', 1, false);
            public       postgres    false    205            �           0    0    CatalogTopics_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."CatalogTopics_id_seq"', 3, true);
            public       postgres    false    207            �           0    0    CatalogTypes_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."CatalogTypes_id_seq"', 4, true);
            public       postgres    false    209            �           0    0    Files_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Files_id_seq"', 1, false);
            public       postgres    false    211            �           0    0    MyList_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."MyList_id_seq"', 1, false);
            public       postgres    false    213            �           0    0    Repositories_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Repositories_id_seq"', 3391, true);
            public       postgres    false    215            �           0    0    RepositoryAuthors_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."RepositoryAuthors_id_seq"', 7, true);
            public       postgres    false    217            �           0    0    RepositoryComment_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."RepositoryComment_id_seq"', 14, true);
            public       postgres    false    219            �           0    0    RepositoryEditorials_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."RepositoryEditorials_id_seq"', 2, true);
            public       postgres    false    221            �           0    0    RepositoryResources_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."RepositoryResources_id_seq"', 811, true);
            public       postgres    false    223            �           0    0    RepositoryScore_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."RepositoryScore_id_seq"', 1, false);
            public       postgres    false    225            �           0    0    RepositoryTopics_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."RepositoryTopics_id_seq"', 5292, true);
            public       postgres    false    227            �           0    0    RepositoryTypes_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."RepositoryTypes_id_seq"', 2691, true);
            public       postgres    false    229            �           0    0    Users_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Users_id_seq"', 2, true);
            public       postgres    false    231            �           0    0    Verification_Token_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."Verification_Token_id_seq"', 1, false);
            public       postgres    false    233            �           0    0    catalogtopics_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.catalogtopics_id_seq', 42, true);
            public       postgres    false    234            �           0    0    catalogtypes_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.catalogtypes_id_seq', 35, true);
            public       postgres    false    235            �           2606    33621    Blog Blog_id_key 
   CONSTRAINT     M   ALTER TABLE ONLY public."Blog"
    ADD CONSTRAINT "Blog_id_key" UNIQUE (id);
 >   ALTER TABLE ONLY public."Blog" DROP CONSTRAINT "Blog_id_key";
       public         postgres    false    237            y           2606    16679     BundleComment BundleComment_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."BundleComment"
    ADD CONSTRAINT "BundleComment_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."BundleComment" DROP CONSTRAINT "BundleComment_pkey";
       public         postgres    false    197            {           2606    16680 &   BundleRepository BundleRepository_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."BundleRepository"
    ADD CONSTRAINT "BundleRepository_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public."BundleRepository" DROP CONSTRAINT "BundleRepository_pkey";
       public         postgres    false    199            w           2606    16681    Bundle Bundle_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Bundle"
    ADD CONSTRAINT "Bundle_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Bundle" DROP CONSTRAINT "Bundle_pkey";
       public         postgres    false    196            }           2606    16682 "   CatalogAuthors CatalogAuthors_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."CatalogAuthors"
    ADD CONSTRAINT "CatalogAuthors_pkey" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public."CatalogAuthors" DROP CONSTRAINT "CatalogAuthors_pkey";
       public         postgres    false    202                       2606    16683 (   CatalogEditorials CatalogEditorials_pkey 
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
       public       postgres    false    237    230    2976            �           2606    33627    Blog Blog_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Blog"
    ADD CONSTRAINT "Blog_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);
 E   ALTER TABLE ONLY public."Blog" DROP CONSTRAINT "Blog_username_fkey";
       public       postgres    false    237    230    2980            �           2606    16703 )   BundleComment BundleComment_idBundle_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."BundleComment"
    ADD CONSTRAINT "BundleComment_idBundle_fkey" FOREIGN KEY ("idBundle") REFERENCES public."Bundle"(id);
 W   ALTER TABLE ONLY public."BundleComment" DROP CONSTRAINT "BundleComment_idBundle_fkey";
       public       postgres    false    2935    197    196            �           2606    16708 '   BundleComment BundleComment_idUser_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."BundleComment"
    ADD CONSTRAINT "BundleComment_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);
 U   ALTER TABLE ONLY public."BundleComment" DROP CONSTRAINT "BundleComment_idUser_fkey";
       public       postgres    false    230    197    2976            �           2606    16713 )   BundleComment BundleComment_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."BundleComment"
    ADD CONSTRAINT "BundleComment_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);
 W   ALTER TABLE ONLY public."BundleComment" DROP CONSTRAINT "BundleComment_username_fkey";
       public       postgres    false    230    197    2980            �           2606    16718 /   BundleRepository BundleRepository_idBundle_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."BundleRepository"
    ADD CONSTRAINT "BundleRepository_idBundle_fkey" FOREIGN KEY ("idBundle") REFERENCES public."Bundle"(id);
 ]   ALTER TABLE ONLY public."BundleRepository" DROP CONSTRAINT "BundleRepository_idBundle_fkey";
       public       postgres    false    196    2935    199            �           2606    16723 3   BundleRepository BundleRepository_idRepository_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."BundleRepository"
    ADD CONSTRAINT "BundleRepository_idRepository_fkey" FOREIGN KEY ("idRepository") REFERENCES public."Repositories"(id);
 a   ALTER TABLE ONLY public."BundleRepository" DROP CONSTRAINT "BundleRepository_idRepository_fkey";
       public       postgres    false    2958    199    214            �           2606    16728    Bundle Bundle_idUser_fkey    FK CONSTRAINT        ALTER TABLE ONLY public."Bundle"
    ADD CONSTRAINT "Bundle_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);
 G   ALTER TABLE ONLY public."Bundle" DROP CONSTRAINT "Bundle_idUser_fkey";
       public       postgres    false    230    2976    196            �           2606    16733    Bundle Bundle_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Bundle"
    ADD CONSTRAINT "Bundle_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);
 I   ALTER TABLE ONLY public."Bundle" DROP CONSTRAINT "Bundle_username_fkey";
       public       postgres    false    2980    230    196            �           2606    16738    MyList MyList_idRepository_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."MyList"
    ADD CONSTRAINT "MyList_idRepository_fkey" FOREIGN KEY ("idRepository") REFERENCES public."Repositories"(id);
 M   ALTER TABLE ONLY public."MyList" DROP CONSTRAINT "MyList_idRepository_fkey";
       public       postgres    false    212    214    2958            �           2606    16743    MyList MyList_idUser_fkey    FK CONSTRAINT        ALTER TABLE ONLY public."MyList"
    ADD CONSTRAINT "MyList_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);
 G   ALTER TABLE ONLY public."MyList" DROP CONSTRAINT "MyList_idUser_fkey";
       public       postgres    false    2976    212    230            �           2606    16748    MyList MyList_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."MyList"
    ADD CONSTRAINT "MyList_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);
 I   ALTER TABLE ONLY public."MyList" DROP CONSTRAINT "MyList_username_fkey";
       public       postgres    false    212    230    2980            �           2606    16753 %   Repositories Repositories_idUser_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Repositories"
    ADD CONSTRAINT "Repositories_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);
 S   ALTER TABLE ONLY public."Repositories" DROP CONSTRAINT "Repositories_idUser_fkey";
       public       postgres    false    214    230    2976            �           2606    16758 '   Repositories Repositories_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Repositories"
    ADD CONSTRAINT "Repositories_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);
 U   ALTER TABLE ONLY public."Repositories" DROP CONSTRAINT "Repositories_username_fkey";
       public       postgres    false    230    2980    214            �           2606    16763 1   RepositoryAuthors RepositoryAuthors_idAuthor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryAuthors"
    ADD CONSTRAINT "RepositoryAuthors_idAuthor_fkey" FOREIGN KEY ("idAuthor") REFERENCES public."CatalogAuthors"(id);
 _   ALTER TABLE ONLY public."RepositoryAuthors" DROP CONSTRAINT "RepositoryAuthors_idAuthor_fkey";
       public       postgres    false    216    2941    202            �           2606    16768 5   RepositoryAuthors RepositoryAuthors_idRepository_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryAuthors"
    ADD CONSTRAINT "RepositoryAuthors_idRepository_fkey" FOREIGN KEY ("idRepository") REFERENCES public."Repositories"(id);
 c   ALTER TABLE ONLY public."RepositoryAuthors" DROP CONSTRAINT "RepositoryAuthors_idRepository_fkey";
       public       postgres    false    216    2958    214            �           2606    16773 5   RepositoryComment RepositoryComment_idRepositoty_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryComment"
    ADD CONSTRAINT "RepositoryComment_idRepositoty_fkey" FOREIGN KEY ("idRepository") REFERENCES public."Repositories"(id);
 c   ALTER TABLE ONLY public."RepositoryComment" DROP CONSTRAINT "RepositoryComment_idRepositoty_fkey";
       public       postgres    false    218    2958    214            �           2606    16778 /   RepositoryComment RepositoryComment_idUser_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryComment"
    ADD CONSTRAINT "RepositoryComment_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);
 ]   ALTER TABLE ONLY public."RepositoryComment" DROP CONSTRAINT "RepositoryComment_idUser_fkey";
       public       postgres    false    218    2976    230            �           2606    16783 1   RepositoryComment RepositoryComment_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryComment"
    ADD CONSTRAINT "RepositoryComment_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);
 _   ALTER TABLE ONLY public."RepositoryComment" DROP CONSTRAINT "RepositoryComment_username_fkey";
       public       postgres    false    2980    230    218            �           2606    16788 8   RepositoryEditorials RepositoryEditorials_idCatalog_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryEditorials"
    ADD CONSTRAINT "RepositoryEditorials_idCatalog_fkey" FOREIGN KEY ("idCatalog") REFERENCES public."CatalogEditorials"(id);
 f   ALTER TABLE ONLY public."RepositoryEditorials" DROP CONSTRAINT "RepositoryEditorials_idCatalog_fkey";
       public       postgres    false    220    2943    204            �           2606    16793 ;   RepositoryEditorials RepositoryEditorials_idRepository_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryEditorials"
    ADD CONSTRAINT "RepositoryEditorials_idRepository_fkey" FOREIGN KEY ("idRepository") REFERENCES public."Repositories"(id);
 i   ALTER TABLE ONLY public."RepositoryEditorials" DROP CONSTRAINT "RepositoryEditorials_idRepository_fkey";
       public       postgres    false    214    2958    220            �           2606    16798 9   RepositoryResources RepositoryResources_idRepository_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryResources"
    ADD CONSTRAINT "RepositoryResources_idRepository_fkey" FOREIGN KEY ("idRepository") REFERENCES public."Repositories"(id);
 g   ALTER TABLE ONLY public."RepositoryResources" DROP CONSTRAINT "RepositoryResources_idRepository_fkey";
       public       postgres    false    214    2958    222            �           2606    16803 3   RepositoryResources RepositoryResources_idUser_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryResources"
    ADD CONSTRAINT "RepositoryResources_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);
 a   ALTER TABLE ONLY public."RepositoryResources" DROP CONSTRAINT "RepositoryResources_idUser_fkey";
       public       postgres    false    230    2976    222            �           2606    16808 5   RepositoryResources RepositoryResources_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryResources"
    ADD CONSTRAINT "RepositoryResources_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);
 c   ALTER TABLE ONLY public."RepositoryResources" DROP CONSTRAINT "RepositoryResources_username_fkey";
       public       postgres    false    230    2980    222            �           2606    16813 +   RepositoryScore RepositoryScore_idUser_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryScore"
    ADD CONSTRAINT "RepositoryScore_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);
 Y   ALTER TABLE ONLY public."RepositoryScore" DROP CONSTRAINT "RepositoryScore_idUser_fkey";
       public       postgres    false    230    2976    224            �           2606    16818 -   RepositoryScore RepositoryScore_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryScore"
    ADD CONSTRAINT "RepositoryScore_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);
 [   ALTER TABLE ONLY public."RepositoryScore" DROP CONSTRAINT "RepositoryScore_username_fkey";
       public       postgres    false    2980    224    230            �           2606    16823 0   RepositoryTopics RepositoryTopics_idCatalog_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryTopics"
    ADD CONSTRAINT "RepositoryTopics_idCatalog_fkey" FOREIGN KEY ("idCatalog") REFERENCES public."CatalogTopics"(id);
 ^   ALTER TABLE ONLY public."RepositoryTopics" DROP CONSTRAINT "RepositoryTopics_idCatalog_fkey";
       public       postgres    false    226    2946    206            �           2606    16828 3   RepositoryTopics RepositoryTopics_idRepository_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryTopics"
    ADD CONSTRAINT "RepositoryTopics_idRepository_fkey" FOREIGN KEY ("idRepository") REFERENCES public."Repositories"(id);
 a   ALTER TABLE ONLY public."RepositoryTopics" DROP CONSTRAINT "RepositoryTopics_idRepository_fkey";
       public       postgres    false    226    214    2958            �           2606    16833 .   RepositoryTypes RepositoryTypes_idCatalog_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryTypes"
    ADD CONSTRAINT "RepositoryTypes_idCatalog_fkey" FOREIGN KEY ("idCatalog") REFERENCES public."CatalogTypes"(id);
 \   ALTER TABLE ONLY public."RepositoryTypes" DROP CONSTRAINT "RepositoryTypes_idCatalog_fkey";
       public       postgres    false    2949    228    208            �           2606    16838 1   RepositoryTypes RepositoryTypes_idRepository_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RepositoryTypes"
    ADD CONSTRAINT "RepositoryTypes_idRepository_fkey" FOREIGN KEY ("idRepository") REFERENCES public."Repositories"(id);
 _   ALTER TABLE ONLY public."RepositoryTypes" DROP CONSTRAINT "RepositoryTypes_idRepository_fkey";
       public       postgres    false    228    2958    214            �           2606    16843 1   Verification_Token Verification_Token_idUser_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Verification_Token"
    ADD CONSTRAINT "Verification_Token_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."Users"(id);
 _   ALTER TABLE ONLY public."Verification_Token" DROP CONSTRAINT "Verification_Token_idUser_fkey";
       public       postgres    false    232    230    2976            �           2606    16848 3   Verification_Token Verification_Token_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Verification_Token"
    ADD CONSTRAINT "Verification_Token_username_fkey" FOREIGN KEY (username) REFERENCES public."Users"(username);
 a   ALTER TABLE ONLY public."Verification_Token" DROP CONSTRAINT "Verification_Token_username_fkey";
       public       postgres    false    232    230    2980            k   �  x�mV]oG|�E~�jiъ#�0%J�>�>]�%����r����ǚ����U/�N/���t�TWU��lu��wvg{[�ѿ�p8�Noqz{s����])C�Y.��"w�g��^:�ML�R�}[��}yYvշ��r�]>���o\�c��~��ٳ�p��5C�Ϟ�χ��8�1Q�}�LR��d���8W�xĔ�x���Sz�dP�E�E����0�ƞ���u���=�}?�7⚪_нMlǙLM�.������`Hr��]}D�4 �|��S�9s�%6t�93%�0�O��d3ev	���@����ݬ���f�vg(�"Rwd$�Qj
5/ EC��1t�iD��$=��U$��|�8�q��*�S�2}b�y>'�㹠�R����k�]�X���G�$��F�9� Rd��P6xD��5�	U\�����©-t�p�� ?�(宲{�5Xc���u�=i:���.�Q�|�!��8p�%u��s�������K�,�&.6�&w�M��6�M6�n��0��~y������
o�cLe�&���S�C���У��9@	&v���k���NkL��o��ܘc+	(r)��B�4$AS�}�,��
��u��ۤ�S��-�!Cm�5�.o��T��j���0р?X4@	�=ز�ֆ�-��f~���BPP-�y�������g��yrC��� J�F� �ϙ*���'l=�{��BЅ�ͮxw��t��{��)T�@!W��H��Z�B�SF��]'8�A-l(�X҈S��T�;O��KN��z��kj!�qb(00U�i�]聝8���h �S�����hs��8#$/�*#S�h��%����Z&�Zڢe�J����
�w*!Ř�G���(�N�+�CE(n��%�^��ἡ�b���1,jT���Vդ(������*���m۩���"�c���b��M· Ed뫞�q�<��Ct ?@���,�-u�j��pmձ������]J���f(~�{�q`�ލ�]R(2��7���;���_�|q7���)7�
y8?��|��yf��"��'N�F���1�Þ�{M^036;�|y\���ð�xfJ�9%kv��f?�/��7� d�{+ƨN���B�[�����&�W>�<��?X��9]|�����o������[W���;�h�з:�wI>>�fS��	ޅ��xb�E��FU1&O�>��?L���gN���@����,�=.���K�0�3�VlC<��PJ4;�GC?9?��i���W:�Jr��U��oH:�@
!�h����tz�����K��ګ�D=����Ll��\�S1Mv5Ɍ�}C�t���5�+�C����os�P8�h:��AX��
�t������9�<*T2��h9�J��:͉���d@��q�/�_� Saڃ¶x�v�@��@s2e���v6�#p�h����<)�R��P�t���P��X]P��38�J�:OqvPFj�ۀ��=�stn��T,R�z5"��a�'��a`0�_�[+�o�i�9ᆔ:�F�X&� �dn�@٠z�y4.���r$=���N�5����Y����k����VJ���0
@�T�6\��e_�C'/�;������m!�6��ӧ���G�>�[a�3҉	V��ދ�v�[�B��^.��8�ճ���ˋ�3Z=��|ys�j^^�~x�d�<y��̏]      B   �   x�m̽� F��� �H��6��.D^-�� z��C�&g<y���Cc��*�8rAe����� �Ğ��mfc����zI$M'�2�3RW�٫��ZG8oU�+lD��u�S�mpz>e�}e�~�z��?����4�      C      x������ � �      E   A   x�Mʱ�0��L��I�	�Y��)�����P�����.f�n�^�8e����q�K��=nf/r�      H   �   x�3��())���///�˫L��KN,��b�����̼����4N�b�D��N���420��54�54P02�25�2�Գ4424��2�mhnjE&Xn�/P$91l8��f�������!��q��qqq �6      J      x�3������+I�K��̃2�b���� ~G      L   �   x�E��n�0�ϓ��	*�@(�*���B+q�b9&�����>~�8��5�y=;2C�+L�)�C�QϦ��e�Bt�[�$��d�8�F�gT-��x��ܤ7�G�e}�3j����ة�\P�![��Aw����aH�z^�r�WVσ*Iv��R���[x�t�b/�U[�xS�Ymۉ�%>�X������G8�<�QIK�s:���܄��ӗ2dQumC���V���L�[@
��Gy??dY�ut2      N     x�m��n�0E��W��@^Ͳ�C�R���qa nc�F)���5���9��Rx�����}MVp�YG�bo�ĩ�@N�K�N4��p"�N��Wiq�;��S`:�|<��[xn+����t�/� ?d9R�_�H<��tq��{j�V����4���yZg� �<����Ҡ��5�.S����h����6Ԋ����*F�)ec-�F�Ü�[(��̝���C�Q;w��V��Xx�����a3UD��Ԗ���+��ZA%��#��uȨ>{�ֱ������sl����,�����39~��̭�c�2gk�#F�oģ�ZB�������>�� ��������ЪX�������"��4X'�7I��qk,a      P      x������ � �      R      x������ � �      T      x���]��8�.�\��<g�%[E� �-~2"�2"+:=:�+�}�K�픨���P<�3��%�:f'��Di��I�ۭN�u�v��)0�g��̋�/�/~��6��WW������e�öy(���M�.�����e��ow��׿�ݮ��f�0�7k���:_��_�����oQ~������k���v��KY��}[�\��'���߅�wa~���ȋ�?3��������d^��߾v�k�%@JHy��j��ԇj�����?nw�����hm&���7+�V�}�=�aA6G�m3�qx��~_�\Q� nqw~A�]p��/ۦ�,~<�Wfjx�n���o��q��`�-nX�2w���������H�x��ͥ	K��,Fȵ��jW�ٱ �n�U R9 ���t�g��b�T/z�N���k�7���G� �Y��m�����#��#۪j�f�"{�#`�6�#���~ٶY$Ke�d��Kv�ΩԠa�嗶,�K�egB>s6�-c
�ԅM��C폲\�=�h(̬�M<}��E����5B7j�ζ���� �N4���.D� ��/���x0\�� ����{�&O�O�bY�PpY�0��D�z/�,��$��8�}�RV� ���\9@*ϑ�ѣвraoC뎻m�v<�~��jΆ���r�!��\��z% jb[5���{�,�0Y��p� *����k[��yL�z���K���m-s+ ��w=�wq��,)oÙ����xL���7���B�:������@P�ˀ q<�^���C�IAd��R� ц� th#z��U�,��utJ|$ѩ6������zCac<�L��
��T�is��ݪ-G����å������\
���H���S�ᚷ=
+�t��-XE��?b<m~�M�7������K�em��M}ree:w�>[�X.9�ݔu4����
��� �WW�ȣ��� %0Tt���t�S@'�ӥ�!���:����	�mz��|)4�Ce�J�S)/tnҮZ� }�Lr(���I�,c���0S�������|A.��'�~O��˲�q�T�fCAuYa�̗���.���=�u��|:La�"���}��'���:^��3��]���z[}CAd��ޔC3΄[��?��r��R)?�Y�����fB�I|dm¯����Q���k3]88`�xn�o�{�C=P�֯���Lȕ�l��xd��E��O
-�|�����6��(x_7ͺ��в�4u=�n�̆k<_��XT!����u��p V����[�h?����H6�\MIHa��f����?(������>��\5�=ЅGIR��o��r���+k�R�5�U�����Ͳe@mC�aSmF�b,Y{Vq����*p3���$�ϭ�UYב�J���,�M%�LI�+8`�1^�%�iu�	��Ɋ��d����;_H�W��s�����c���8���b���~{>�9ϳ\�֢���M�+=�R�ā�<��ɚp��fQ.(�Ok߂!�4ʓdе��ͬ�����w����
�$�Ɖ����Ss��p6��Q+G|���ف!�':ݣ���?�l6}Y��S#�7��������#=�|r�����Z=��P.�I�����%��ԙ�����2}n��C2O,�v���Q���:5ヽ��c�,��#=�"?	���)=�K�"<�\ |;��4�6�LoH>�]���������ǔE�`���oހ!�<8�=�/���u�Qܭ��C,Z�-ɚq�?	������]��@����T���1<��#�3�PJq�Z��_���;kRYM��ßB��=�!�4�!/|�0E��Mn��\�Ǫ���C�$���ŕK��̔�ςBiI��?V�'ɤq����A�8�2&�
S�n�o���#sB���W�(1ӑ_�/RE>f���ݼiK��U��雔8&�!1.�(��Yvu�,I��ڳ��0����(,ʤV˦m���!	@΢���X�$�TE1b|��;Vr�%I?BWLL�̅��G�X.�p�[��qp*(K�eyL�P���VβECE���{�~�����c������A!�IDu	�P.�E�o����*ܡ�$�X���G�2�'�����>��`I�TϤ�&��r�l�q���S�e�զi��1�%�@N�"��� K�bn��;��
�Y*	�8�����3~�	�wBm%t�r9.Ywa���
�8Al�)���H �Ya����9vW��]������JSs(M=~�?��7�PNB������,��mj�\
0��*����[ٸ���D�pa��}�ա����]tm�,I�VTL��j��V�E̡����چ_=8^�?��\&����)�;>a��r�_ڦyhU�?�.��������%��a�7�O=�v�������M��/�j��K�,�&¦?P��B U.<�G��	��<��/ɡP����^c���s�J�Cp]n� d���U����
L!=���B�7���,�xY,b>�C�ea�}U��=��ɡELH�N`�,S6�ՀQDlw뿖�DJ�&�������p~\��@G��0�z3��,����HEY_�ʲ�LB�Bw;&�~��&v`)��Eغ~@!�e�6��9<P��ӷr��w�r�H��R�L��]�5��/E�=��d��[� �muX4ɐ�����lBT!�#���쇏U؏�C�z�? ��}�n�ͬȌu�덫�߆G �d�8�G�Ί{�.�^�B��eL��ݾ�����X��x��q�J�N
��B��1�C2,���t��,���d����/�����!�r�"�V����A)-J��j+	_�$E�IL�g�W��Nژ���ů~�?Hf�U8a�xz�v؆/�Uy�i`*Q���n�S��H��E�����w�\�ƨ6tJ��o־�$�I�-"�n��"w��e�4����_��]��\����v�b,�
�-����Ǫ���Cr�,�J��p�d��.3�TA��A˹o�����YT�8�9$.�t.�)�ڄ~��&V�&��[Y��i��ӪED<64��N���|�`H���X��L��h�T�t����j���#IV�OY�c~�*���8���
to~]���C9:$��9I�O�P4'��eZ6&� 6���Pm�fS&Kr������PD�o��~��]Y.�=��dm�v�~oȿ�p�0��� �]�{��ɒ�'sqVA|�K�B�v����j���dI���MȢ�Y�+�c:�?�ǘQ��|r�)��sqs9��H�����/�>Y��dA|F���Vf��r����,�v?8$���*O����3a��x�	�s���M98$�ɹ�+uN�%N�;�E*92�#���������=��d�z�3^�p��N�U��C`��)�T�|Z�>0��B|�4�2����J�dh9'�v����"r���]��m��FoHz��!f�H̚"-]t>�~YI�rn.�0"~���/�g��2��8�c�j��.�%�Yf)��2\ l%�@5���>�`I����[X�k�`r�b���/�X�����+sM(�K!�i�xX-����n���!i,����3IH�o�&���7���=~R;�Z�'O7>R�/�p��{��Ҹ-f�P���0�4��3'\��E�0�|�l�P!����eyd�{�	�5��ރ�HBV׹���܅�̚�"�[$"�?(>��4����yU��܎ ����?(�Ŵ:>Ӫ3��Q�����=�7$'���f�y�T���(�sϠ����,��'K�,�P�u�}�'�T�!��4��~�|;~�d��'�[h�8ƅc�!E���Z�-v��o�6v�%�$�X��s�}��3:^${��t��n�m��!�>R��&���:�E�S�z�X.���փCi,������dze�~m���N�$�X��䂌�MS!B ������d�Xd�������� �ܲ��ݮY�ɠ�j��f3�먈��hHձaW;X�Jc��N�sn�b��1�צy�O�?cqS��z8t�D�E��w��{ӂ!�(�J��K    �e"ˀO/����c���������L
��?%��.%�T��O��X�A�.����,������EY��~y�?I扅PgS�(���=	�*���}X5�!I�;d�;��K�G^�;����ۺ�`H�����z��E2��=N4��~�%i�W�*�_kD-�uP�Shx����a�b�kj�=������o���G� ,�"��~˴V6�#�?�/X��ޒ���!�^�$;�P�����20$��B	�f\�WwN97@� A�*^��������X9�J]k�F6�Hj�5����KӮ�$18��'�o�YT���(�+�m�V1�HIap�?�_�k7� 6�Љ�s�.�Xt�[���`Γ��C���� ��j]m������raPV�J\�����w����᚟,�[pRW9hb����(���[��?�ۦ.�%)t�O}�j&��:NQ��ݼ��v��#��gZq&���p�4\8�Gn��q�O���%���ty\�T�辘De������y��ynQ\� �۵T�	U���7�Ux�ɒe,^֎i���oy�e}~Ee���=,���GaeU��V�����
5�%��G���e]�sg�=
4��(w��%_��i�Y#���a���Bb����!p��U"a)��5�H#m��f�Ї�$�l|j�u������C�Q���9i��C��:��m��`���6��C��˰'�F���m��#�C�,����H$�$ac��^�-õc�,E'��@q6�hzsS�l�Q�۶y�^��R#�ufzש:�Kth�|�!Y�Mdi�e����&�u���O��m�~��KG��YpE~�*�3�y.˅f��W���G.�&�p^]e@E�Es ���H�%9C�b��M��pR�D����޷�.Y�4dA�7̰y�Q��gW���O�dY`���:���y7B�P.�xoH���<�T�J�*	ņ�!����8$9$��jl��ac=/�9΀3B��MwuؒC�[���lʀ�����M�{Ӵ�([�d�X얔/��E��w
T���l�� ��X���v����v�M`x]W��rH���X@����*��@��������W`��$-s��|�� HG:��5�?C�]���!��Xd�A՜@�K���q{����70$8�`��i%1�m�r,ʌ~*�j���C2�,���������&I|2x8��sA,�ŵ!�=/��%^��kv�6.��D"�{��F�p�;,�:k��=�ZdQ8��Q��%`t�U�n��m%��!iEB1/���� ��* ~���9�%Gt�����!8y�8���䐍J,�Q_�b#�7��D���X��x�Ky�>�|�+g�P.��zD���V���$�8y*�SU��P��r$o�o�}��[8x$u�A�gTy�,6Υ>�����˾�C2w,�H@�jW�)j��{l�8},�ܱpJb ���v&�:{�R]�ͪ�$	;buKF����=k�GZ�����%;X��d��ǎ�m��il��X��[��bu��r��'�L�$HV�K֟M�����ó��3�ׄ)��2�G������T�ۍ��s���M��,����_�>V�'K��&	#^���Y&s��*CR�o��o�`(����QW�_�L�"f��ؐlퟏeU7�O���<�≈�՘J��ݷ�@�ԡY��nU�~=8p�����I��L�UF[��a0�\n�M1�-ð�#}�fW�#
�:��@�W��o����l2�FtSӲ=����A���a�ۆ_�G.�Xp�I\�u�̚,�A5�i����bY�틲�=��x@�"���GZ�C�e\�0�W�@E^��_4w���v����Ȣ>��o����A3'>T�j߅_2x$���zS�I�j�B��Q�8��Kr�,��, �<K0w&Iy�r�j��Z0$s��Ok5.0ܶ�R&�!���c�$��B���uuh-�XT���G��$u�Bu/p�c��ώ׬$��qm�vU7���.���擛�{�Pk��|tN�i���ސ�!��3��]v�l��R%�q���(��ߗd;Y�=T��D���t),!�s��V[0d�!k%@�KƢ0�R�V߻��&P?�O�m̻��$fY��Ċ����%VU��kڶ��;�l,�@Cf��{L6�*�{Q��ݦ�����[�ǐ����ǡ������y����-��j�Cr�,��;J�i�#�J��=?����2K�.<�L� [�1�j������1����d��%�?�e9h�%yc����?Z����I���|j���Pn�葌,��6▼��i#u�8�"������$YX����}��h�4-s�P����$YX�"����fq�0�#�_�����C�$���=��(1Qw�ơ�����}l�L�ò:ղI�F��N�^���>�ݮ.��,,���*9�r�����bSg(�$���'�h`�D�0R��C��ݣ��;0d�$K}N�i"r�L��#���]o`H:���gg�4'�"ə�D���������'K��,�0{�J��bm\R�ă���j_&K�Ŝ�������4�J��.��"M�O]��rHژžd�SU�4Ơ]�$�?�~�.�G<��e�[���W�5'
b�F����/���$fYp$xV��"����2=?�ˍ�W���dhY��Z>�l�"�N��F迴�C�����ۗ��3�`Cň��~��ސ3��3�.��W���4����|,�vB�N�g3�B��&\zCvP��M�����B5��@�je��n�{$��X�=[�}�kR�Cc������M�d����#�.7 !�άL���>h�Ǻگ��#��-=s�1��8�+��W��K1�,����7�f��a �'�$�u�I��>9�u^<��Щ�r<����K�����r)"�5U�|�õ���Z�7aP�{���0���2�n�~��#оʸY��GR�,����=2�7� ]r[VM;X�Od���tsg��l=V���v]�ɒD#�<�����7Τ0T&�������䐴#'�*�r��cfu|��g�!�GH�������"ѥ���Ha��{�H�,�j{�R�Q�hrtn�����t)k>��O3�НE��w�j����|)��3OI�ISM:(,�F��Y��.,I���<k�?Ӯ'u��"�ױ�@�؏:�xy�!KO��$�4�P�.	����n�nZ?8$iʒ�u/��ͭ�E"P�~_�[����K��L?�Nj�6uc;\��7Ǧ��D*%�Ni��S��~D�Mwu�\{0$F�L;1�V��0L�@�M�4î��e��g�&�5�4�F�Jw�H�u��!�]jU��:��{%��%Y\<���%Y_֜@m9!fO
��A��i��?X�f��+;7TО_���?����4�#�`�n&� �"�����ݢ�7u38$̢�-:/&��&�SSa�U�]�_�MI���'��pìH���tP��L����0-�?�{���\�*�bhȝ���C�,���Au�Rɂ���C�yզ�O�fAFl�C7	,���~�����Y��iB��h�<��
,J;ߔI �hj�"����,Q��D>d����l0���\WE���w
ޕ�߁!Q������RN�H�C��W��qvoH��s"�)�V�lBcU�7fnߖ��~��yYlC��@Q��Щ����i��B�$���oNwۀB����!ѻ��|)��F�䐤4�y��5RZ�f��1�{8��hH6��SM(G:r�V�&f|H>>?Hl�BP���Y9��C����-�>x$K�B��K�j�c�]���Q��cydIz�%�}�izUXV�F�F55�.�V˺�Vo��E�������o��ѧ��WU[��̢��=Ө�:�pI��p���bt)���?/w,��2�u#�rS�ci��Q�s�����s��iDժo�氋�(9{ǂ����t��%T�6�zߴ�ɒ��.���<�*lh�e�=~`I
��҃��i�m@ɠR�H�    :0$Eǂ7q
I�	�婣��U�}��l+���U��D\nҀ_��^?�j䒼'�Q|�%�S;�%��㭪���B�G�\,�/k��f"s)-a���4�U�gpHʋEŘ[ʗ��p�� ���rY�/_F��X#A�
�e
��kѝ ���\Ip�h���u{fˉa�c�up�r�ޒC2[,d<c����N������6�����#),��?}���l��,Ch�@�XT]��G�C,�b��eY�����|�n��������O$ډ�J1˄ԩu�d�\�ÿl�lG���XP�-�q=���-*���-+���K-n�7�-������[<T[0$��"ڦ�d��Ύ-5=�2.�ץ��U�~F��{X+�2^����08A�+����dI
���V1W���
t^�n˺�cs{K�?��N�$kv�Ҙ��Y�����>t�?�!	!~gn�+����6:�^-�(��`Ug�Y��i�Uβ,�@�����}WoCRC,��D&�r'��&&;�;���Q�,I�p�ɚr�k����kE���T���y*c]�V�*l�`Iڅ�St���z��A�06�P��,�ݦ�z�?I��j��$'-f
f�:�����W�2Y2�ɚ��]����R'���~��E�$�B(&��p�Y�4P�q����cpH��5��OZt�c���î�o�b�H�_�+�/5BaQ��M��7����`����u�@��H-V^���>�>�C�,��E�4A��\ h�����>���!� Y�f��H�ڬoS�����=A�b��m-&����v�UzB�:���ac���`Yd]1�uF��P�%�~�}���'E�2�&�3�'5�ݕ9Ns�͢����.���4M�L��4�lW�%JqL�G�uN�䐑K�֡�.�ۜ��գ_&K>h�8�V��b�R�*w��,���>\s�K1�,�6{�t�0�y�Z�P�%P��&Y�Ud�-��+�mU��5���x�c���в�n�&�=����1�c`�K���`(��v�n������H����%�`I������6�
cR��Δ0#��4#G�ƣ1����+�րS(d-��n�d>YH�H��XА�r|m����X���?Y8�{�:3��O�8�����c��l���"�Wγ�i�l�ic�f�9��l},�ڷ�%�Dډ�U�yZ��zT�fUm¥��Cd����⤼8�%Or��j�a
���Z����l�e6<E��}�Pm�9��'��d�_ }��JEH������y�`I�����N�����Q�ʂ�E�R�⭷��,I{�8�3�nh���.�b=����2��q����#�;G>��I u�v8Ft׾��;��XpH��SJ �����:��]���˪�$IE8�ojɒ!~N�}y�6_u�,�%���|ԕ�MRԨ8�g?�G�1~GI��#yEV����b��s���y��}�K�%Y�Ld-({���("���'��<M�D����Յ���%�F�R���!�QE�Z9��>4ݢ-ɒ#���W�:(��o�I�d9�zuF(\?&D�|s���f����%yE\�ߖ,�	�,O#�а����7`Hv��t����R9���F��Ͳ	OtpH~��TM╔_|� E˴�cT��Wd��9�Ʀ�V&z���o�7��dɌ!��[��T�c����3zNqm��[�c�WrHV�����g.��(D�?�E4��ov�o�%�EN�~���1E/��-)�kΟ��.���G�,��^�>uQN��Н�M�y(�E׶�%yD�	��hvzUlN�?���2�6�r��"��O��c`p�����R ����Э}X�!iE�\߰x�L)!%�{�����7��I'�����WO/�rZ@.G��c1���~�H�QV�ϊ�!#���
뼗a��_��]d!-�*P��;�r6.�
V4�ݽ���p�j�\R��E�;D�_XͅE/���1o��\��\I�q@��L_.������q�C���	�6ŬЙRGxG6����Q��Ҝu�$�^��
i1s6sI��П���ϛ�=�ld��<�4���Q�����¿��=ļ�G�N����*՞��)`��U�Q��hH��'vR�g��� te���gߵ��>�R�r�,C�L����A�����e�$��B����/��j��������v��V<��D��cpvQg2c*�L">?lm�[�~b餚	��xi��x�~��k;X��a!��~v��QR&��������,��ر�r/p�<E�hYC��m��?I����eS���89�$,�h�c_bX��G7��r&�拲��at���l�<웻�#��X�Mqrm<��c*���d�?������c�G�L,�R��2Y�˄��ҷ˺�ebi�MIɉ���%[ �����w�2Y�jb!��ܤ^0�̐4FKo��}�{(�GrM�N��$�:�.k�H�UH�����Q�,I4�@�l��@��ܹ4i5�_{���4)�&L�Iڤ����zW��X�	�$�X�uŵ��Зf4�E�r�a{�mu�k?8$k���n�a-�"Ͱ*܈�c���G�pH��7����u�c_JwgY����}�����8��|�1ͺD �SI�CG,�r��iNA��C�����m�CRF,�����	���Mjn ���U����I�$�8w+���A�=M&���I���'loI���j��V�آ�0�1��f�n;8$���	N�]�Mj*���D���⬧�'I"��̄���j1D�	$4ò9�_��d�<�[�l�Bv�a�Ԗ�Č�j����F�$�X�Ҵ&��qyB;�CS]�XU�]5�������ެ��i!��s`�Э`����,�!�ڑ򳱋��u��S&���u-�ٴM\D`I&��+ۛX����<=Zt���o�~���#���i�&�W��!�I�ý`مw`�H
���ݙ���jf�>�`HR����<@�x$#��l2�̓�ܽf�L�����շ���AJ4���@?�2/�_�
aa%�kM���ސ�g�����+���	��zĨ��mYm����˚}l`���W��I�9���Um�C�fU�:8>���0�*D�]��3|�]��%�8�8-���r�F��+q�_���'K>V��'%={&NŮ%h�CR!e��e�sȂiqE�K�x������8��h�&@N�.+�ٙ�M�E��f��f�[0T �C����:3�Я�J쿕�e�o��#yY�b�NW�ӑ�J�{�V�/�|wړ�+ɒT->T�]!A�I$٢w��~;-zKҴ,�P@wc�w����hK�2Z�ײ�?IޖYMz��1.�5��m���ߒ%�YB=	a�FJ�,*�y�uY~I��^d!|Y_H�C-@�ϢҘw])�ސ2K��L�n�͢d$�-��T�W]�I��,t�ꘖ,V��w�O�j�]�X���9f����9��+�z�x,��{���Q>69$BVIC�P�zS�b��M�2��wm�S�%IoV�y[��D�ظh���5������C��,�H����\��9��;��v����%���Y ń�|k5PV5��c�,�p��8yF�]��L�D����C�,�2Y��f�T7K/�?C�"n>���㜾�\7�f�1
<��<�ݼ���,��8��!?o��liC�D(��ѵa�-�%�oV��y��u���\��z��]U_�Q��$��j���.K��K���Oh�f5����YFq�gL\#G,�m�El[7�"Y�*gav��d��P:5X���Q��Rs%�?}{s��Zx����ou݅��g���P,~LmA�Rv2y���u�$C�B*ois�3�D�4F�u�U��'K�,�jLN+����3��t�~����ES'K��,���|܏��:��L+�� ;���7~�:$Kr�T�v�Ud�,ױB8}�a��I���Y� �w�6������*�?B�P�[�.�%)shqZ={��Ն ��X��j�|-��@Y���յ�z��9 E� o۪���dI��U�j!c    CK��I�AA� w�_,b��#��~M(��M\:��PH�,8�p�7�c��[�.g1��x���G�\�Ե���jYՇ�jp�L���pSk@"�d�!u��}�h��!q�V��&9R�GI��:M��]���N`I��qf��>Ѣ�$���ŷ����n�\�6���(��f�1�i�9vm�ۇ�,�ұ��ɳ"s��	KuD�����f�r�����kI��V��y��@��wM����!�.��\�v�q���<���M��`�5�BY��Kk���%��������Y9��� . ��YN3�?��?�ڌ.Y.ê<��$U���=����k�,Y �*<��d�T�/pu�E�l�G�ɰʎ`��$�z&�֩��5^7ݗ/����G���j\�*iu��������߫������
��t���;ca`Q8�q_7�>� ���9��.N��F�gv{��/�o�M��?8F֑j�H=>���`�\��۷�(���O�X�	���J`̓P`J���#������FA��P�Y突su<S/<V`��J���m����0��n�4t�hx��c�צ��뽡*�XYD+�ɱ߿���`�-$�&����a�7�wY�ŉ,42���yv̳��؃i�:� ޡ�{���ѣ�ʬ��,ߕϤ�I�G��̪�C���s,
]���(��U?~O����~������A<W��ۯ�VI$ΪA4��G-b�N����s��W.,�,WE�i	�=��1�B�Jeh�\#@��፣C�|ftn��fJ�����o�i��R�Y�<:�Z>��l���舽ۆ�k߬�G���~�a���GXD�(x�����608����� �u�ߕ$���Z�����ౘ$-'(��Y�򢟸�$:Mc��q�V4>����ۅoM��M����ݢ|�?)Ȭ@�=�[���j/4������E�|C1^�s2�����F�5������iC�����0�NO�
���yn�[Տ1W�b1�e՟�Gf�!P��Um�'�p:v#��C�uQ��ɒh9G����C3��Ұ �����w{0H֜e&�'&Ω-z�^�u�	i8��R������������+DU�iv�\'K��,��c<�gg�x7p%U����,ï\��C.�s����g���ֆ�_(HZ(DZ����e'���*޲P�u幆xNA�Gi,����e;8FAh� �3�zɤ�i)-��
}�����8{bt)̬�DV����lgyU��X
K67�m]5ɒz�������8MX��*4��m�7�p�K�,XO*�ďW����jm��U�і_*0^V����npb����P����?V��q�&��V9V��S��3!�Nd ���dH"�%Ya�,�[�@�Џ���Q�ڗu�2�$�oo��ͭYj�G�@������!	A��L��v��b�����Wu����葌!K�=��M҆y�����?p���葤!�̓0�$�5HC�J�����(X�$iȢ��4ܑ4��`f?V�f������ߒ'��>K���F��ߺ/_�r�,���_P�1s(��K�!�i�}k�!E X��*n�h#UhTR�G�1����l��4!���S��3�Hp\Jo�֙��;i��m�~'YI!���v�ƥg�� -�:���F��!IC�������%� �%�`��VU�$sȂm'Q�Qv���0wݵ��Ř�9�\��w�A=G��t�@������![�s�f7���CĨ�7D�I�����
�!yC��Q��Fr���D���?���Y�!/�낱�]t#Qh`B ӱ��ڮ|��O&�8k��pT��zᕘU��^I]�H�@�Ϗ�n�V�dI�EvA7�D1����*u�j7o�dI�Eٱt�n�����o��/�ܔߛc7+x$wȂi0�v�^G��&�(A�b�7m���apH��v�\=���F�P)Ѭ���}�=�O�6dA�jz��3�*��F�����Az��$"�5��$�1��
���Ea��˪ۍ�$�*���jn>��5@t��t���ￗ���|"���G���}����VU���!���1�ێ��O���wn�ǽ��w>��f?z$����Od��雙rB�}ʌ���6_�v��葼'gg?}z����nfy&`��H�}�qU�%�PΞ~]d.�]ff�U�
���������#iEX�d����ifqh���a�a_�+noHz���i����{����\Di d#6�v�:6q$��͒�W �u�u�r�F$������n����d#�`HE�{�I!ԕK��eJ�^��P|���wզ=
:�����"�p���/O���Q��BX��&e��N&r���Ljk��Q'����cY�G����n����q�fIQ��P;�4n��N�oɒ7`�Ҁ��th��U�8�pH;���5�}�ޭ�f78$�⥧�U���o��@��ߚ�c�hHƔs*[)/-���8�м(���-���ح2xd憵�e�S`�ǝ��R�q�Z*�S����v�ѐ�$+g���^�oAC�t\\X�.�\:2�ӁR�n5z$��2\(�\�kVeS߭���^�:Y�Cc��;�N>]�:~����m{�&�]6���=�VPܚv�HyhV\�׏dI֏���pK+�G�>��d ��2�8���2���!9Ana�_�t�B�bP��~�j�!�=��b���^p����i��D2t��e�n������@pm�ʹT?�g���?@��`9tm�CRm,���I�+���Ztl̀�L�:޵���dI��<7���$�f"H�E�k^oH~������Ԧ���0��<��ۇ�39$���A�aZc�=J��$Ү�6~^�ɒgQ\�D_|SZ iaND&�~�%���@~���8%a����e���$yPL��y������۳���
+mi�2�T��%d��TX��Y�ݦy=�ha�6(.�������F3��T�#Q����v�<�������ȳ��|fMX �z��v[mɒ���0�6�v����_�7Y�ua�Մ���́V����pU�u�̃%֖ ��s��edfG�a��GӮ�¯��2XT�PW�;��R�- �1��o�?�!	�]���L�,;���e��� ��/X�_w��Q3�V�����e���CR,���zp�Y^�
���c���OK�W�f:�Su든��D33."� ��#1\�ɒ���ӷ�Bf�:�l\���fYb�$Y�����H��G�"� Z��߄?���x�!"��ȡ��B�L碟�����Y��o�%�
PhL����^�ZD^8i_�ѷ���kW��%�V��N�%agQ��@��Ӿ�w_�tu�d�+ϛ�H��vΓ+($��[X�m,LIV�V(۾L����p�I�jP��v���?I[�օ�7v��J�"�|!M������d/X=�򼧒J�k5��H���˦I�$*X5�JL���p@���w���o��=��`)�995�dgΪAMŸ����,�G��Y��U*G.��N�PL�S�<�k0d��U��*��s�
�Ufp��	�ףG&�YPE��y^���Y��*���Q9?�~�n�d�,3��G�J���7&�s�aіG=��#Ѳ�/p�/Cim��u�J�7���br�9�q��x�=Y�D��{��U�-Y2΂���	[$w1��RM�@�����/�i��%S�,�Ms�=���R�Q⩯�����IqV��}�T���P	r�d��r�bM���2E�:� �;�%r8�~Q���e]5u�{=��e���"���S�N1Կ7��o�:��##/V���C�&�xdV�,��!ժUUm�H�y�`�����T�(�"qQ�D|yٗI�C^�YOn�B�>�s�6=NHIU�����ʃ!i��܇'��L�A�al�C���s�H℅�NP����n�j1��*\��X]8x$M�BiX��{�DJ�����&�S`Iv��͕��y�|f�:H�v#Ώ��&��GXH����ؕ��MM#��m��X�a!T�U��+7�ؤb3    `�����l���,I�pH^-��O4���V$�;�W��ސ$	�(��p��K�P��o~��4��#�VM��c��R�QQ<K�*�ظ��m|ʽ%��x��x��o��a�8��*ͱG�����ʝ5�Ҫ"��b��b?�}������y(��`�K] Fg�N������I@,� -X���C��e�D��J0$��j]2��Ĉ��Р5�j������F�lg�\'��LO�T���=��#a�_�UU��fp�@�s���݄{)&���Y��ArW����-I���� �|�es5�+ޔ�VH"?��u�G�~�nB�yq��[�}�$��j�Z��.�1�G^�XlD~�:8M8O��,��)�kS��dOX�mXj��\y�x��sӶ~���C��Y�@�r�6��A�BW��e�\W�rpH�<�
hN7x�S��9n�=�3b��?��|��$~X��l����v�������L����<��$���6�O�IR��H�Puq�x��>Y�^aU�f��x�b]�A�Q��KL�%��ZX��)l��S~�+R�n�*a_��k��2J���B,�nK׵�$hUf�$�sԬ~����#��*6�����	�����Y�F^!Q�7�r�-�l�z?��0'eݵ�ΥB��Z.�vw=��`�6ٳ+��bU^d��l̈��q&S�,�o�C%���f*�M=3���Mw_�E98$���Y������¤1���Cp������`Ѵp�N���]�8��!F����n�7�ydǺ�(uÖ�r=L	�n�o�3,Y�Ū������ 7�|&�m�(P������E��C��Co�Y�3��T%���MS��C�,����b\�2�Q�����v�H����$!�)���Y��<Q#�]�<v��C�,����|f��U�@��USw�'I�0�*s^�Y�)m%3�-D� ��䐤�z��=�4�:�$�������zpHڀEsH$�2.�aO�P��*yI$#�{���Օ�#	r�z^o���9�DG�oͮlcD�2E�Z$��n�)tB(���pQ�?�C�Lѳ*��-��q���Ҥ8Dq�$�v�X-�%3�,��8<����؛Q�r�Cï]� ��g��؛��ؒaal�t�k����2K�l&sͱ'C�b����!�݃%�28�y��Sb�؃a� �4f���k�}[��G��Y	BgP�@��M����������ծ2��ʰOJc�i����@�*�D�>w5Qw��<+?�jo�g�L�NW��~��v�C��Y���
�IZQZh!����9���U~������~�3���3�"��M����m�!�=2]2;�j���LIy�3�d��lï���d�$=뾌�NoH҇K�JI��ݡ��`�=���&�|b6>�	�.h)��WM�,�,fޞt�N��φ���7
[[86���b^��On_��,�J�N4��?n*�.�D�*�>��yu���E�a��Ɍƍ_��NpȪ|VRM�"���.Lf�ly��]U�~�=2�͂�?���Ƕ�H��3,_\��:f�G��d���q~���Z�r'D��'z����%K��YP��fJ
[�Y��W�(_�1��߭F�Lb��h9LNb�T� ��ܫ�=���%3�,:��m�q�c�	�8e2h����P��e2d0�jA���`�R�~��H���h,����Y�1�F�7��3�r�%9����u���c�A��Ċ���'��䳸�48�.U�^z0dޝ�29^'����Q~��f�Xg2�G&�YX�z�d�/ܵ��|�K���#��:|�K��Y��)|����>�>�waS�Vɒ�w���sg3,�ۄ�s�q�oV>j���L³���DM#� H��l櫇�y=2�*�~�zcT9�,[�T�ެʶ���%3�,��E�bQ󨰩�C�-�]�O2���eO5�/��t�$JJ|�UM�I&�Y�<���N;�%��:�Z�����9uVb��Կ�Y�} ����߫և$Y2��B\����9��9��P�!f�ï��Qg��/@k�e"�,���_��hɄ:��׃�6���Y�����~s��Kf�Ys% Wy=���
MA�6�&D3~�Ȉ������ea�&}4t��a�Ŏ�C&�Y)Uh���e�E|l�cH�7��҇of����(�E1�=��T�uوG�شe١��v�������7��)�I��Yߗ����vV�W?��NN��p�E���Om��m�A<�Ћu�TX�s���E���(�w�nJ�K�̳��9a�eybn]Z�Ʊ���o�c9X2��Z��v�	3������o�ۂ!S<��Jw�{�6\�YmR����e�.�ɒ� K \<]{Q��f�e(��{����!Y2��ʞIw�(V�KӴ24��k�6aS<����\��*�_R����0��)�/7�.�كC��'�Ǧ*�nb��ф�n�)��������]ρ����hB���������?�Gf�Y(�����q�Hu�9�r�,�%��,�5�L��viڔШ1 ��u��L��P��e�r�<\��Ծ�VMX�ɒ�sV	{�A�|��<Kc�@�7��Ky C�������Vn���3��$��ѷ��_4��G�%s��QP~K�\#�D��<�ͺ�$��,�'��T��dQB��7>��ͺ\�d�3#�[���a��t����6�ײC&�Y�s��q �,O� R��(��m�!]2��K4�"�� (b�/e�ǻ��f��`�<4K�D��ܦ!��PWdP2)����2'͒���h�p�5�l��j��K�2�B��<�6i����m���d���U���r��o}�	w����C&�Y�=w67����J�$�Y������~p��4)H��2�����4bP�zѭ���iX��ɹi�[�7ID��mW�����i֤c�.��2ӹ5)3=n��oZ�,�p.�Ef��[�:U��4j��6��`�|4+���8'����p�'��2S��]�d�#�n�d,ؘ;ȒX:�>�|[�?8d0��|����u��(T ��[�>\ђC�YI��نm*՜yR�GS����~�d����T7���,��M*L5>�6lߒ%���u /����umjTv�i�7�n�2q�z�2����UQ�����Q5w���]2��*�u�<½����P�V�Ǫ�|i�d��-+"�m]��6:Y��8U����d��-K�X�	O��օ �e�?�t�Xs��t(K�Z?��D�t��v~Wn6�rȔ(�J>�U�t�3�`�@ꨟ}�l�ĩl�%��,��	�+SG��HI��'����:Y2I��
 ���`ҳ��J���~��:�`��(m11}��ZK�-#�̍O�4x��a�<�{dE	"{��g.��I�!�}�*�d�Y)\�T�N���67)?:.ڟ��?X$�,�`��,���̕J�����C���n�ȚbV�{1IBY�,I�
����m�m����e��� �b�K;W��������U_#�6�d���\���g!��\QO��n�M9zdB�����I77�뇈>͇�����o�&D��!��,�h�������I�5�f��c3���9\V~$�&M%v!�I#H���{�۷M��;xdʖ�U�\"����J�.!��!4h�L%r�2�2�R]�1�\�BXԞU���Id-��o�6qgc2�oDL��b�p�\���㜾�<G�N�-�Nei�/b�^��$�HY���z~��3vB�4 qP��{�2��i�(2q���rw�-���b���!|5�GF7��(w�|M�L��5�/u����b��|#+ص��'��Š`Z�BA����j?8d"�%�c�S틒�"I�(����w�����<��B��'�qC����C�B�t'&���oy[ΫEW��#�jh%�9�fL�6y?�p�t���v��#/w,=�B=�p.������χ(J�v��#�~�R=��W��N˕t`&EJVdh���m|~rɄ+i��6��U�:�/�0t�M:����j�����o�I	7䈲L��n��w�P-2CĂj�v�M$�Rơ� �  }�h��j�uÿ�d����+��lQ�I�sx
�"�6�%i��^�L/��允���2�������������"��^�J�̸V	�v�����'��S2+RR�����2����G�XFE1�r�$h%�e�]�Dщ���9 R ��(Q��Z�X쟲�h:��fY>��}p�$�!$د�ұί�  -3|C��e�db��;?�}��<n:�Dw�n��c{�ђ� L}Vw�>��
iR)Rz�X������L�����2U]�M��
Z۔���%SA,�Qi��_G��,=OT��)��ծ=�^��RL(Љ4,����q�M��<��D3N	��Ŋ��vTj��v�Ȅ~��[E[e����f.��!n,��$�M��j�0.R/�����~��آ�C�G�B��]�5����γ䐙A����`�Ȇѓ�Y�c�fp�| i>9�13'u�2��2���m������@N�Ȟ���z�L9�x+�fb��=2ȊjA�����D��"eQ[hU�u}2�f��gDd�O�&���5�
�VrȬ�j+/^��˒�B7�?�ݪz���dƏ�։������,A�I�|(@��m��,yGd���-�Cvf��н��T�~-뽯�%�x�� ��/�L�v
�����7����iV�dq&JJ��T<�8�׭����%�s�"P�\�%bk��P=Ѷ|�z0d�U�g�'��UpF��;�ĳ�7˦m�%sp,�)�1Y�OϬ��$H,FW��q��ђ�7V���{�t��(���G�t��<,}�(�%�}�1 ��&�N�,�����8~��u/+���b������P�6)�N��]ݍ�����7��H#3��H+����ý1Y2;�*t�h�\K�Rݓ�(S������c���):�ӭ(��9�e&��^��?�W�G&�Xx����
�%����|��=�?���c5)���^L{Y���M��� �ސ):X����b���\�y�秮��� ��α4	��~e�%Z�@�T���l�j�,��c�hJ��V����^�ݾ:����c��<v�~��mW���D�������w��d⎵��$*þ����C«�����]�j�tjzJ&GYJעj�_Ͳ-���9��T C7	e��e0�U"����"�dR��(f4��R�͍NB�h��ݦi��>Y2�y��/I�Ƞ�X!M�_��oB`P����Evzv�Np%�5a׵EjT����n�,���#��x�HHg��
I�Ye���l��i/Vj���~5\��K-3	��	+hS�ɒ=��j�t���s���)�O�pJ����!�_��L��MsN�B��1Q��.�ӛ]�d���QzJ"�ha�:@Rs�6�ײ,y�e�E��h�4�Ș
z]x��]���uk�����1�J�YQX�+{��ٿ�ۿ���Љ      V      x�3�42�0�4�2�1b���� +\      X   d   x�E�1
�0�9=E/В��6-����E�"�"x|qѷ?�m[v�$B��m�@�P8$�\��(>AK���Y���g���EW#� �5F-o��1��*      Z      x������ � �      \      x��}M�-�m����l jQ��Ed�����Ҷ�� ˏTb���xO�G��eW�E����B���Ͽ��o�4���������?���~��/��������/���o�?����ѯ�����׿��_�������_�������k�T���Z���*�%�W���G��^�Y�/��o�r(�}	9�u����
�y��u�9�S
�Ґ�^�3FPD��;�I5����_bj%�bR��HL�y��j��l1&A�9��lU�cB=���9�����br�iPL�Ӧ�oH⻅�[ʿ�ƶ��b�4�wKyBh<خD!	�o����Mj�'f�Bʵ���s�(�	e>ʯ�&$��n�#A�-�y�I��:����	]����&�t\1[�	�[�o��Z���cb�6�}M��y�cBv�s|��~�+�Ę�w��ﶯĿ[�1������W�i�]�y:+-?+]�N�o#Ƅr|��m�Y���cB9���J_�Ў�CR�2B�3B�����z�B�*-�}и|�I��$�򋬯s"�1c",!�I���w}�=� ��^�s��Bvǌ9���������{�A堞� V�{�1c"(�<�*3��=��Ξ��\�=� �Rm�S-��t}B�P�Bϓ����3&�e��'!��O{�15�x�YH�:�'�#AWJϳ���:*�P�2�iHt�����i�A)��4$F��h8�����ʮ���=cjP��<������󑆠��y�[�������r��V/�z}��P��-�iHy
_���4ԡ��yZ�
�uT$���>�Ӑ*��$���>�S��*4��Vb��Q�Sߊ9��Mb�P�<�jM�u}j���sj�n��{Ŵ�nJ��ǜ����O�oH�ohd1��
m��������̾!.�t�8�x>�f��1��	uLDи���?��ݣ�8�2h6D�l����8��~�~R�~�:��|��M�J\J�M^g�蔸/�.4J/4^���C�2T���N�5;�����H�
E
�����C�b������]?>����$^Y�'��gR����
:�<�Q��x��ʷ���u8C��&�uii�$Ũ��iuA����A�#�v&��2$�SHR��jg��b�PE���HK��<i(�{���>����T��Mf
=)�k]����Ǡ��5MZ�X��	��d�㕚}HZx�q���ņ���^I����1�%����ФS4��u���k*�o�)EB�`�Ӕ��M�:�#��@N��|���	���|��RW%��=Ƅ���k���M{u���7�A����I%mP����
��h���Ơа��a�Yi��e�b�������z��Az�)Ŋiv�t�'��>�w���~����ɼ}��*BgV/!(D��M�F�S��w��?UY������X�?; ̱,�Ш���ֱz�!��LN�)�6
�z�v��a�1!�FO��("��b�cs:�)GO��쎭d��\yT���b�L��'��"O���i�1z��,؆BA-?2s
����I��Z:���������'Z:Z�e��}̃��a�-�Ng���E"�g@紥�t�zW�}��iK��,b��)��#�#�t���Yt8�(��H�d�>�z��L]E�B�HK�Yf��8��90�Ri�k]��Ju�v��B]��ӠDc��;CP(�K�pm��x^oD����J�
[5;�Fhʻ5mc6���\��.�bZs6�Sf����ĵ�l���P�A0�̡�U{�[j�)��p�<��K)��CR:���C�|E9�����ڹȔM��p�� R�Aܸ�vq�)��ٔR�6�n��T���AJ	w2��Ơ���ݸ���2����#A)[60�뵈�@U6}�.�ƅ:łL!�k�P�����D3�F4�<��r &A��s-�e�&�C�iQ75 �ZKI]u�>�i1	E�*���Q'�g6�b�p��"��:�q�-�7Va�����c�Ɂ-��:F�l.�^���-��ޠʞS���NuKD/ (�0�T�lY�ղ�o:]i�Eل>^I[Zd���z#hB�-I�5-��n�l�!!��B�F���j�\G�� )0�Ԇ��t9B��1(�pdɰw+����.qpUe�r6.2n�B�	�{N筶y��
�A���Ӛw�"�BsX$�z�)zi���#��D� j�z�Vٰ��\�H8��&�.r���A!-{�o��"]�E�Shp/9D�hЙYqT6M�i��q�e�� ��J�6.B^8p$�M�ZI������q��R�r56r%C
��-=����<U/Tj���Qf�v�c<#����o:K��I8D�B	����,�>4�!
H�RI��EF��}�F�9m�9����#�����9m�9���I���k��:�E�&��"��=�@p���l\d����x�@����a#�H�>�M-r�2�y. �K���E6�x~����R�<(u]���"�g���K���Etݜ���X�� �����}52��X�u�Cz�
�Ay����]���ů���P��x#��%;0uZ���E#���9�5�����bL��_-�9���F�bL�i�¥J뇿1#���k�ty]��\��B�j�ڹm�i�TDqު���������1Mi*(-6�캣�'3Ȅ�R�:����d5k��(6�4� ��)L)U{�:�d���!�+Y]��AE"��
�r!7�t��#Hԕr�7�twM482R����A�n>X���-�lT���EI������R���:���1!u`O�[�Ӧ�.��I� чg>�'[1�A��Sŧ�6��F/X$%����$QW1�:���bC�2�"�]D��tc$#Iꌣ��6���F�
d�#)H���P�:Š��]S�-��CW�H�B�����G�|�:A>��^+u|�8��`95�B�2O��>Ds ��ɬ�m�p�T��Ae�c2+�V"8GFcPH[��hn�NJ���-����J�7�����BLN��[�s.�>#�+=e�Y��T��b�]�)�ne���d^�r�������ˑ�>!�kO	�c�j�k��uB�zJ��Wuf�ͳ&���ӎm�*n�mk&d�Sc�Qd����b�(g@��=,���x8����YNKYˣ��g���ѹf@Ü�:׌2����͈tA�bKŹ'�PD�M[:���9+���7��nn�ƫc;��hS=����tkqց9s��;�Z����=(��$_4�k_t12�8S�\��Ҏt*8�U�v~��"HOkis:���=`�D2P��^K���nRu�O*����A���S�H�Ho�=�:�Ai��'��X�|P'�y��F�41�z_
��4�q� �����/��;�4����.4α3�����^��GTS�Q/�6{�z��8��(�����s�1��kMI�}u��{c<bBϙ6��*��}aN1&ě�������)�w�<)]�Å����).|P��N)���j���(��t�R���E��Q}#K
��(���Uc�1O���jА��q��`�;�B��\CQ���Pt؃ 
�Q�CZO��v���Tڿ {Rty2�yD)�]J_�ڽ
&B]PB�4!IY=����m$�tJ&eWFͽ�b���Z*g��J'a��B�i�򛮗ۏ��=9P�i�25��aZM�^HV|m�p�������.�����\d�CkK��.fOsݍ���@dN	2Z�W�w�FHzw� ����O9 �bS��7�����ŗ=��+��_-Xu���(7bS92�U�L޲����fR izNm��N��=Ƅ SNoS+�hT�L9�"А�S���WM���0���Zm��?�2��;�Hרg�Z��q:C��.6��#�iNg�Vlo�q߹��{j�n�S���h�
���[��,`��#��AH��&�� �`Z���ne�N4:�B=[O{��j��̚�b�	Y.�t��(REꊃ{�,K+�Q��6ݣ�:AUo���u��=C�V��Z�sc�K��KqNPO���ϲ1��e�>՟-��f�s/�9    Acs
�sZ:Ι�O$��E%6��EOK-z��x����Ȑ���t�,�u�*�`�H���,�/��O�~�qB�	�-�Ęe�����'�&+��!�EV�vlN�[��:��>��<,�m��b�Ht}�rP'���V/�#��B��.>�C_�0F��z{
5��R�~��ͻw��ك�^{Q�AW�����*�߯�7:����uh!Yj"�W�]}ݥ:/5�zcԃ�9�B٨�L.�NgpD���u���K���&����M���;��v\�w�ҝ&\xv_�@Q�l��fJ76s��/�oY��]P�O��	��£��)u��2������q�(�&r�A��h$�@�7���j�>=�:H���� �4Vv��_/t�Rʏ��.j=D+�JH���2������I��cHz��p�G֏l�Ō4 ش��6�ص��bL�'m_~����Q�	iBS��f���J� O��+�7�eeUu�U{� P�)w�󍣄lqA�(�i�-��P�AH��<-+3���Y2��EM��4�1��z+��E���F�S:s��B���$L-c}3G��).<��M��{��Oa��	�������>ӆ�cP����:�r'���bp�X��ժ���2��.�ՃO׷v�A!}+�~˶��{��G
�Sp:��i8`L�( �gO�s���۹k4�����c]�Mv�.����^$=/�T�ynpn�XvJ��(�7t��]4���˞e���O�)?�3B�Ez�]d�����v�.�lX�%G�H���D���lS�(*4�Δ�0g@Z��2����o^�Ӝ1z[��e�����
��)�fo��]�+�t�-�o���I\�= �`K���ȗ�J��li�9wC<]���C޼-�)6�u���[�����h���.p�B�KK��,��N|%�c;f=��wf�ś�y�P񳑇�x�ˈA!���������h��a/��P������/�E���j�P�5.J$,������x:���d��������jt(��Vg�\y�N�B�8�C�4��i�����ŊBӜ�ZL�b�;�
�Uj:��l�Ne1&�դ���<��F���l5M��:����DїW�B���u})j|Rh�L�ly+����Q��@�SJ��⩛�v���B-0�&�������7x���8b@��2��Z^�t��#���9�����ٲ�i�]������N?��Ac(��3�������֥�K��Q�AF�EH��$�+���QJ�¬�gt�5�\/�ߥ�
�jNտ�#A���;
�,8��}YLf��=Ǵ=�" uL��;k�n۵]1N(�4J٪�{�SA<��V��ʄ}�S\��ٜv��+́��O���J�{�Ss�r�{[	z�����^teqo+A�I����YH*�$)t�1b�b�B}��*-�2�f�bP�Ѵ,�.���(B������n�z�vً��#M��K�5\�;p�^㴍�ʮ[��+ �
���VVD��9�rj�leo�8#�wW7��p*S��}k8�5HG�)sĊ�����0�]��)S�6/ǚo�z,-�`�T�i�3T��B|���ݰ� �`$��Y���jtc��Q��0��2�B����YQ�2!�WO��(m�1��,V��"ʞʀFY���ɢ8��{����R�_l7�h_l�C~ ���Ԋc?<�9dOe@�9�]i��:�-�D�m]fGG�q(8 ��憽������8͵�<�Y�ֆ+c��Z�3���NW�E�y���-�B�UgWr4��u�EN���$Ҟێ����ͪ�ǉD�5l��1sۅ7�G�DL��pK�ls��{DF��م�˂�?���a��2��d�%���[���V���u��W�9��F"f�2��8�~4l�ƽ�*�N���.�i�=�GP���j�NC�#�Ed����W`�N���)>'D���	҅;�����К�.$�ҫ����"�b�v�Ɣ�5�B\J�*v�vn5z��!+J5��4�EV1(D٣t��;��F��x#��r.�I|�Q\5go�Rc�;Us��hPn��ұʆ�;���@z��3��Z���~��7hc!��d���lS��4��O#ʝ�1����)E�7�D�x���������t�NT}-=:
���*����h���EwKl_�����:�E��	Y��t��;���Ə�P��e�P���a��uA���蝶P�4��9r����ݏ�3�Z$'�z����F�p.��*���z'Y_Z��Y1(ԃK��߰�p�}�NJK��/���=:qT���tTv�N�"����B�^MwQn��t9Y�c ���<���������	�R�R��x9u���*y;$��?Tjs�k���Uw���n�?�m+<�ǟ��!\/���ح�A�bP�Z�)�ctV��tFhZ�̩���Zr[�	՟=����.��8 �+E�G����w�C�+i#3
�����RpB��==����j�#b{��!|����(������^
����ʮ�˳$��AC��9��.v�kĀ0�4�?GQk>Y�HFP��RC�-���[�
Ȓ������Y�	w�(	��9G�V�D<ŠА���ڹ��cX����M�5���4RW�E��cZ:-���WqZ�[�$pm)yd�FfN_����	\Ws��z�c������#��n�ə!I�'ݡ�k)c���|� �ӺCcWKw}^��ݸ^
iM-��o\o���Ř�n/��Xo}�v�dw��1�>ލ;����q�����{�d� E_+�Nkگ�f m��ƀB�U��QS��b:w�(T4P�?�˪�E�A!F$�M�mh���H�7�b���\T���
=�3B���\l����"�TP:���:ݣ��Qd��@�n�߳@+Ҟ�aR:��˖l�&��c�4%����}����zi�+뜮��ڣ��BS+JQiY�T�k\�6�s�R�Y紉��=�BfK�.�pK��0��"��H�9���c�0<&��v��-��7�K�iy���|���VPFbʟteY��֊ 1��gS�1�	iB[T��6 ��c� #1(���I{w}A$�W�--_�J����V�;��h�ۉc��E��e�^I�D��]P��m�!�{�bPȄ���1m�e�A�(փ�~�;�)f=��B��9p�:���{0��pz��:��?��Š�A�H��cj悧H�l�n���Z�&=���"��A7xOK��47������=��#����ci��pș��;0��vuu��1:F�H��KI1����Z`@�5-����[u����7�t�0ʤɮ��z[�z�j�f�M��th䚦޹[6;�2��@���+s��Sح�bPH��ҽ�s[6�;�EsJ��CKi[4��s�AB�����ղU=Sy���e�6�s[6��Vp[6�7��>W1�á�(q%hۼ������F)F
�]�r��x�)�|#.ބt��#����	��U���b,��h�y���Ա_��Ve���#iQ��iY����k��GE�����q��q�l�؉���E������������r�R��;�F�}B�HI�����㵠F>��*$y���}��5�@�OOM�x��%N�R�����D���V!�M����"���'�r�Zմ�6<���.�6��th�[�л{ޅ2[!��Δ��j!�A�;����T�;Ř�O.��{.���.��wы�=�֏��"�ʠ�K餌�T���Ԡ�+�c^)��n7l�JG����=2a�bP�1��1ݞw�}��>^��J;p)�N��8�b_j�����ꖽ8f���=ZD�=�œ��p�{�����}Ѱ��*�c��65P.'���јH�o3u��2 ���ehG#��[4�qmOP��/:�ކ;�Y�� 5���溯��b��/h��
��\xҽ�����l{^�G�1($�t���:��z�(_$�Ĥ3+]��g-O������ڪy��}��x� (��/��^*Y�)�9�­4��z#�0��rj
l��8͠�n�A,LNkA �  +lS};Y��l#�ӯ�����p�h��0�=��ھ�� ��B��:��RݍN8���{���^)�Ę����}�s���j����*��JE����Q�ҳZ�\���d.��� ~bOA�Q��q�S���		�{��E���V����!{j�8���᫰FV4�h�)�T�)����P�t�3�m5��vs@sȖoq���B�|xwC�iZ7lW6q$y�E@+-���[�j��z��C�}K�9{�T%ߵ�p���`K���V)g��3`�Ti:˪O�H�X��iǶe*�K�I�1(�Ƥ�t�!�Ny/��ء��N�g�;)�/���9�ڋ~�_�~x8��BB{��?��T=tt����� �AW�4w�Z�a/܆��2���E�܎���j? �n�ȁ�"����e��0m�=�i��0rbj*��e}�v��W��i�۷��ÿ1!
GM�\�T��^�	��5�pl�Sg�DQܪ�C霗�����.#w�������	y�ԢA��S��䲊�*nz�@ˤ����VGqJ^��ԗ����u���z���A��D6�%/�lDq�Aޔ��b�m@����ŠPC_t*��>�m@�X r�i�y):�ފ������O�QՅ�-no��HZ�J�m5��<�XC�����X�7�v��[$b�iͫ�(��n��נ'�4#m�4��i��>�,o��In�E�S!�"u�"l�"�9����9-��֣��q{k��]�e��������RT(�j�����N��q�=A���������B ���rh�׫t����p�.���և��HLH�$�S�Z+�&Ońu��*0m�j4Z66�Z��y��Qr���!n�uʩӉ�b��o��O�A��z��*W��B��C�z�L�2�Lu!�c�DoH��Q���]��\�zzd�q��R4~��B��=EG�{m�	ʑj ��'�]����S������lq�/��1!�tKw~�busL�'�x�}q+�F�=����-��2��[�A�RK�z�TU:}����-],5��ӥ��RǴt��,�pt�w�����M��Wr8CWy�k�c�R"��-����T;ē鑙E��*�YŠ�@��!�\-�p�@cLȣ���t����9��lr����R�b}Eӱ��jz8|`
]�z���jz�LdV��cT��Z�c�y^����|�F�4a�L˃��I�EZ|Rh�a/����Q�h�СY���>:���`�ۧ��e0��Y�t�%��A$/}a!}tV{�(P�Ax���e?:�K�~%��Z,��2�I�7�āN�G�e�4�>��h��!�{!U|�ӱ^���E��Prx!�2�0=�>:X�}1�d���U�q��!gA{~2Ҝ{ye�2���;�mdWFz�0�-/��4�k�rDp�o���&���QX�H��퓑�����i���&/��G���ȴ>(�Ї$/H�tCzJP�f��Q�6������=d�X;]�HE�n�A"U�C^�w��������N�V��Ù����BŠ��p*c%�sL-J�*D�֗%�'h+�x��dq�{�N���L+����*,�e�15]�����<�^�;8��i�R�ʺ7�T��
���4u�h�gS�=��
�2x���Ae�qlG}Bʑ�Q�to�=��AKL�G�U9��Zc'Y!Y��W�B���#(T���>�X�
�m�|�,5oX�Uo���9���yا�\]�Q ��������z���ɺcI����SV;����)�t���O�!nw�B������O����@$EIlv���!2#'��'/ޟ�SV�<o�FnO���$^��We�
�B��U�}�?U�ן���P#��ժ?�mr���*�t*/D�O)X�c=�^hȡ/��;�l�m1-n¬������?����o*��B�"W�ԟ�w)A�
�jj�����l"��:2���V�9��[�UT�M���`Ղ�:��'*G^ho�\�#O'4���6]�gq�=l�0�"������46ĄM]��ʪ���/��wH�k�P{UH�*�\��Bש�x�~Ƃf�w�<�bc�<�ܫ��Ph����>e��G��	U��Vګ*�ֻ��ŠP�-)�F[�T�WH1(�������h��b�X!�����}*����£��BmI�s�BZ%�)�"pZ!Ҵ��>}t[&s��V����H����������T��x����bP�n�Tɶ�2Q���<�-C�i��\UY=���m"T������zpi�:���?wU����#�^�`@_,�>UY[}�	�e�q��U�u"�,��.I�Ȭ��yt�0�I$�7�!����id4N�;td,M�Xٓ+gU<�B=��J�O��zS�A��z!���P�~��:�Ǵ�C���/?�ʼ�ӇJR7H꽼��F7��B�I	�ZY=��2�u9��ipW+ӥ���2~�R��Za��xb
�ڒ�#�\���yN
e$I��\Y���!ւd�)�kU+�"+_�C
�]5�������[$UT�O�g�O��i�É���]5-��v;�(c�c��Zɟ���sC�� ȫW_6���Ar>�Q��tb8=1�Z�׮�O�A�##�i�U��ٴG21����{����c���Vr��*?��������:��=�9��I��T_�����5�rL�i��i�ˮ�����&�͑���ѧY��dƠЀY^�#�jŨw�V"h �ˑ�
���ѥ:��6�9B���V-��oj-�$t��o��>�=�oZ����u�O�d^��Zңk:�\u��,�
�5-���c��Bz�1�����W�P[��bP��E�a�H�9�)��P#�i#���;r�S$cB�AN�=���F�	��^ER��r��H�?�#%�EV��Y��9+"&(���g[N�9��-��/���G�}��@P�חu���a���C��v
�]�߈O٠ZGq�P6@��ZF�ؠ���яsBˏ%Օ�v��'F]Y���I� ]7x�����cs
�r�/�1���hW�##_*�!�ޘueZ�/��~�4���
��E���÷��\�1&��C{~�6fN��
��U�/�>ܚ�F�
BK1�ŷ쇾��o���xb�rJ�_7x���]Wx����W^��>W�j�]�)�
�hH_��U	: ��:��5/�W2r��c�<�ʋ���Z[�ʡ[�s�<t���u�M�%�V#�
��I:�[�iw{6{�MA�w�6�V�[��B�ZI9^�V�6�s�E\�B�'I9^�*��w�Q
�y5e>�}H̓�c�
6F�s�ծ9��b̧k�ϵ�v�s��W��4��[�n��x�?1�Q�v����1(�J2N��nLMn�=�J2IK�u��E��s
�u��|�j��
����yȭGR����hp/����ָ7o�bPH5"i���5ǜHTJZ�;�>w�;�9�bw�بK��U5tjP��)X]�p�\�-U�e��2862ld~�Š�k��z�ݩ��80��+4�Д����1̧�1(��h���V���Rm��{ʟ;��>���2W�ԋc�j֧#�1(�?�S7����c:2���	�bp:�����MG
!�����*��cPh� �^�\��X�T������y��J�N��'�"���̢�J�hl�so��2��*�K!�Lz�0�\�U*$��/2������u8�0X����]��07�͛.8���mN�a��њ��;��餜�5h��)�{���4k�T
�[q��Q#�"�K�F�|/��1quh��v�{v4e�`�a�U�/��?��S3<6�B�Ғ���7���Ð��_�lE���� �Q|�B�~�#ǪB=��=�qg�4D�jJ5mJW�����t`)D�Ք�۶�K�Ha1(DY֗M˟������Xn�H+�j�Nz��P��i�ض��6ϻ1(�#J�#��{烬�{����Is      ^      x������ � �      `      x�=�[�媮D�w6��2З��v\k�\�UCe�K�P@�����:����g7�UFטe�ϸ��Ԡ�*�kԽw�l{�G���^�f��z�i��Ѓm�jq�ͪgi,���Õ�=<�h��ڬ��*� ��jt���>rc�A�X4c��֠ٱ��^���0y��4�UFנ���lj�liЌl�у�q�B��Qh���Jk\�Gch���������x�������{�hp�ڬ���'�v{��Ӽҽ�Q��6�^�����W�{�O㞣A�kw�٠��h�l�~�L���z�,���z� ��z�|�R�f��
=p��������As�A����̣��k�z������͸ҽR������AsJ�Ҡ٫A3z�d���=W�����Yx�F��v����4[4��»5�r4��8%�Ѩ+�i�=����OĠ�ԠY��;��1hV?���\��jV>��N�D�T�ӽB������7k��{s������o�NN�;�����ᳺËG����;�x��dᳺ��g����;�����X�ƃ_�c-�i�2�o�C�+S�{���c�W�f��y�x�{�W��~���wt�t�z �QF�`,�,�y5hF�͎�������J���ѽ���35�giЌl�m�у㕫QW��0�)ፇ�@���@����Og��Lg��N��NG�{�cM�����3�N'�87|�t����q�'NG_5<���|��{�~�s�R^y�ƪzӬ1�o����f���d5��3%�Ռ�z�扴����\�\��w|��#�ի;�a����77z��v����vQ�#3�ˋm����U�1�+W=Xy�AV0��땚��3���<mԽ�d�ǋ�W5J;�i���|@y��=f}�'��3��>dֿ��tֲ<~�f�B��Ȉ�������𞚅�f�΋��[5A��Qc@�����ǯ��j0��>�zp�{�����*�\�ت q���~�����Z��kV����,�r��,gŗ���?oZ��gd��#�f��o��=�*���������8�Z��������]�� hc�^F`����u����?|��^�|!�� 2T�k���Z���s:C�t�W]
�{j�z�
c��� S���� ���2�0��5c:�:�4��3F~�FX�f�f�jn����ɳ�>�3.�zVL����0X�B���3F��|b�Sݳ�xW��G+��x�sʈ����`D�O�f��l#�Z/#��,��6�6�>����ד�jTZV�,��=���=����}��Y-�����c�4��^=h�f5-�z~���7Ʒ�>�r�7q>u�b�i��}FFt4��·�?#v~N�{t>��a�ܳ�GgfaЃ��9����Ѓ�|����`dt�������B�iz�����Ϭ<+�3F=_����@�-���/A����|Ys��I$�����l�V������k`�G��ȏ����Y���ݔ��l�����Ib3_�N��,Ԟ�WF����[<_���Vj�y �ρ_��\9�:�m��[��岟2Nz�F~tw���u���YIp� ������bn<�������~32S��'�k������Cp|FM~���"���fc�pgUA�7c�B8,�~�̼)4���^rͩ4�M����a:��������9a��M���
01ѯ�X�[���6#���6�C�j#Q��W�UF�`'�N��Ic������N>�-5��oCh_[�U��J������A�V�d�AV�g< �<`4pU�(����������_��{�yQ@s�Ɋ7ێ�(W}�o�Y=8�N?'�!,�S�9���Y8f�&�ġ| ��$�b�v'K̗����[�@h�j�m�*O0ʻ���+�{����'��^Ճkz�j\��<��}��M�x��xYe,1���xpU.�wb��V�#~�U�5S��e���Z=��02T���bD=:�̇��0+�� \ڨ�������~����e���j>��)�*X�L�W��6�_�� ?&���k:vʉ_] �&�S���� �+_9������,�u �*(U+������1�~)�/���(����-���i��H8,�@J��WŬЁ�!�ef�Ű�/W���]\�z��¸�[�����W�UP�y�_�F�)��U�聁��_�|��L��P���6�m5;�����`ѳ�_��-ktV��UF��u�S��� ��� ����� ��!��+�򉟣o¯SW��Q�0c`��&�(���0���P?+�,�1�^�Y"��c�#�*����WU����
0�{|���U@)���*L�$-�����0�O��LWU3�]����� ge���
���z��]���E���8��٤}��
_w{]�V�[��7�P��3l�b�wޚ�n&�Q=�y�MNVȦG��1�����ՈGw��L���4���7ݸ��!f9���2�XN��?�����+b�C��&���S��[�2^���Y�������:N���ß&�ȁ��]�_ V\��H��x��, ���1^A���W�����>�U�����{S3r\!h#~4x~?���mh�#�aK3�!V�Ζ�%o�h1^��-��a��$6�j�W઺���+�X@0YG�U�-I���#�*g���6��2��c�	����x	���������	�|�[.B�z�#�9_I�*j���>C`v~+ąqD\e馚���������/Z�֪Ԓ�N�Jb��Ir'��jt��UU�dF��W�U�	 �$)���  U�Nٯ?]z�h�, h�^F~u�H�Wem��e��*;��+r͸���5S���eqc��+������i�E�8���W����E�'q��3���p�t�aL+pFWz����ޤ~M���W@�8%��_5��o��kG��R�*�U������
~qE.z�
���j	�T�g��}`�^�W���
��p
~��+^��_�]��g�;C^�b��ߎ �-y��0�򖟛M�[�'5��(�$���b�(Rf�����ŎX*�&����u0yR�Y��3�Xl�Ū٘Ra�lbجh�6Dv�H�^lK������uҤ# d�&�������UE ���Bd�u��X�%/V�$e��v��+�P}/VP�i�bezj�>�:�et`��Y�LO���P��0>���|Y��&_EV� V~j�� �#d��	��A���.��~�,|���+0��Y�d�̈́���G(%�I`� [C�/uT�Pae@�I�g��7S�dUx\ի�2�y�oe��~v9�.,J�*Y�A��R�X�9+0�_�~Ș��;:p�����qi�V�8��I�C��z(e�D��Q����� �F��I��e)��_��Z���"R,��D�"�Cԭ���V=�V�X���� IϷI>�c��7�u���?�H͚<R���X׽�d�S�z��n���m�tOd'%�o����!�?��!��1�Q_���*�]��|�[��H����m,���x��a���޲����U��
1P�!0��!�D s*��5�g���{=K�V��q���TY��zL+
����zr$>ąa���*A���{�%���̀��gF����Fi�F��
m=9�(	J� �[H,�T-U�jV��[Y���Bb�	�����o�*������UM��դ���L�hѩ)$V�	��At�>U���&�L}�_Sz��~Qb��XN����r����k�|m�8���~��^A�~�_`�+��ax��W�G�T�k�~�&7#�� ��K�`��f���f��~U�s�_u�^�/��W�U��x�X!�W�E�h�d����2�s��7e�״����ʝ¯?ϔ�*XԦ�Gد)���*�w�B��[�F�˸� �B�"3??-Iv0��j�6�L��r! #�3j�u�u�U9�Pa��W*��N<�쐲C��1nw��~Q4f��AP�    dT=x�F}���[�q�L(U�Q��E��YWN�	��J�dR9L���	_�-X�����p�?���T�?�j��X!V�&+$9� t��.� �Ɍ>,֥�
=���Q˅�.V^��q"~"/��߶`��Xs�+���I\�K�B�Xj�$��%��(K^�X5[G,�v-KV�J��q��S8ؒdF���$�B�2D�4�$~_��N�$���t}9t<�t��Z��(�~%F42�+O�JT�enߩ�c`aټzK��ZA>k�%�諷A��JS,P$��[� �
�V�0m8W�"q��	����X!W��I�ڲ8���UQAY��PG�F�V��뵷œ�Q��<m�'��퀌E%Ȫ������Ju�+��J�a\�"�M|ɾʽ�.MTv��Ϲ����x�ͅ|0�+E���Y\���4)�t�r[Pa"����JעΤ*l!��.�L,ɃJ�|�b���#��nz�TB�8���fɦDv/e}�D�9���EB��ީ���E]!��lI�\.I��<�F�t�6�n�=Qo�mj,Ҏ�*�Ӹ��$j�M�EZm�'�}K�Ry���L�*65���^�`H�k��tF ^����#�)��4�&�UM��_W_����B�%JC�~�Ґ�_Y6�.$Z\���+���I�у�I��[*{H啞��T�oA�W�Sƻ�� q�����;I��S��t�Qb�H�(1Zk�Psڢ�S��<�JH�QM]!fY�hH�t��k��q��Z����)-�hI�fq�I_�Ty$�L�G�<�HeTƑ{���ee��'��t%Uue�5�)��fԷ�<p���m���T7�bq�H%�!򡎸�љ|x��l٢2��*���v�P۝>i�ݙL��k2�?L��+E[�kc�_+_[L�*���[�����~�W�$3e�)@(Ӥ��,�?����V�N�"�S�le�P�
�b����ӝ�M�)ǵ�54�u�>y$�]_{���5;KPR�Д��:hJ������8�#'D�����Hb��N��I�#�ſ�T�&��H��ߎ5q�=��u��q�Ǽ��1��ߢλ���F�4-O-��҃��I4�f�y�"L]t�%�����"@� � #$��$:�FB�S/7��1�\}?�"�#e>D�-B��������uda�b������<��)�V-L��R: �mm�
�����*�}�
s@�0�r�ے)҃m���m=������e��UFWyEyZ��D����K^̺���K^̺�B�>��[N
������QlE��v\�jiǅ���"T��_�j����"
�4�O��*��.mR{�2�u*�u]{FR��K`�.+cY�������r�,��H��N��+ܠA���U��<�
����WV�������Y�)���Y��=���A*�u�"��(_Ge�eÕ�E�p�0���iw)Â��ʰ �0�v���9��KË]_/v�ny�U�HA�Z%��uW�y���WՔ<:��GO�Q�����=�X�BMH7�~�?"�YD��1Ei�: (�Y�(X9�l�m�������4��YcQ<���߮��v��J]�( �#U��zк5�����6�)S�遠�j:�l�k��v�l�#d�mKep*��'��WXln5Y����ߖ��2�keJ��J��*le�f�!�R>1�W�}C�T�%v�,��=,���~]�(��̡��J� s�<��"Ș��lޢVmeu�O��� Kݥ��$����LBi�N�4�����JR8UaE�v7��З�d/��jB�,��%�j��jB�/i��ب&�XJ�3�sB��y}���u�\�3��QM\�&��	�׭;Ua�H���_�W�:��9�p5��)��J�?���(+c�ؑ1C�~��AX<<��#�{���
�� Iޫ����Ig��Ƥ�a���!ɷ^�[dq��(tm`sy
t"���@����v�	}QC��di	�bI��o�7[�7��v/)�c+Jaַ4����\��@��)
�0TQ!�Rz2&�J�,�Ԑ�ByU��7���G�~	z��o:��S8E"`�sR4V�y;Pj�q���9B����S�f@�+�U��|������s
==��ʠ�ԼBiIqҢ��UQA��z�a8?l��Oc�r�l��g󌉀��Pk3�(r6 �j�c�\���UMI�j*����*8�%i��Z)ܓ�H�+�l�2y�l�,lj9��S���Ի��<�>8��8���;��TY��it)S㽦h����Jo2�W�%���m#��A�J�ա�'᪶�ǯ��+4$��F�����WW��W
�!2�z}��0$�%9��B�����a����b��үG�^������t��B�� ٬g5����+�B֬[o�����X|l�����M;j:52��ƹ�g�u`�c��눑ึ	y�+FB��[#1ź�<���s�H�w�#�qaLi�G�:����\]��l�'V���PDMaQw����Z�"h�%,�>���	,B�._ŎQ!�d��ڇ�|�h4sk����ۤh��(�Z�\p�r�����.�5Ejb�X� ֜�����x,ȶ�f;�u�-�{"�f�E���$o��K��"O�(M�h���Q�X3_��/�&su�o2WYݍ�^"��`׾���*�'^��v]�si ������t/�/��F�,�%��c������:�A�7Ҫ#<&;<~h���u$�	JG� �y�h�F��4ŀ��#��H���7i�J�8w%��GC�n��N�+��_}/��k~�bC�Y*k�@M	Ґ�ʋQ7{d�*(m�<(U�Bx�-��f{��t��!�n�����i���an��Q�ݖb���=j@�m	kP�T�T;i"�*��r��IVU籶[�K.x����~K�����	jqk~��,���rO�G�a�$q3��*g7�D%:�=ew!2�)��*ò�d��-VU��/��=V"A*�Y�ȲE���J��*ɸ�G+�D�6�-e��[#^J"�X$��7.��q�Gv����ƺfv߸\jI�̦�W]�qY2�㒦��r��qY��zS�r���7�b���r��@6�(��l����fg�B��!Yz�6\|���ċ]���U��n�+��|]�T��#���t(��@e�*I�H���.�������c���a��
4�����wţ���>��:T(����!�Z�(L�V U�lу���Г�zR���ݒU�*e�ن�+���T-�ǒ\��no�+��=�ѐ�[ciH���hݾ��L���P���(j4ʫ�U�u�<9�"�΢�xR�[w^������J�@i���@B���|��Y{�T�ꏕH$U��Z�
٠���e�+�UFk��؀X�n6 �nLl��m�X�a��Z���z�-~�#��0x��Dw�{��[���WS?�z����W}��z7b.Dw����B\캐\\L����zK��]M�S"�Z����4�;�)�~E�j��E*�� �l�U$ɪ�?�T��HS���ǭ)�[nz����@�7E ˅��
����+E��P������%��G&�c5dw5@vWd�{T�0��b�]EZ%���M$<.X
�G�E�1�M�ge(
�;�r�0";]$n�oY3�h�WEG�W�wR,S��yS���Ul�h̠B���2�J�� R��IC�-���xˡ��uˡ�[Dc��zPU�rT��R'��ۓ�X)[�z�n��z�FH������R���A)�)�oT�3(e�C��oX�2[I/;��u&���~�W�b�	�QuT���;~Q������|�מ�n�����I� R;i�/�Ůr/���������G(�9�E��}�%�����~��+K���'��2W�[҃8�9:�#�e9:FT�EQ@x�Z�˸� �e�����)��9��"ЌB�sd<_,�M-�쯿V"[C��w7Ć)�M�?w�q�_����l[o,X �  m"K^we �F�� p��@������夙��2�+N�z�p�W����9Ņ^�8���do�5I��y}9~��Sż��_�pj������}�F��ҟ>�A�l��d��zР�W=�W��fHv�^��b,�X|D"�X|�8riT"�\�ǭ^`ƱB6kJi���i,�hh�=8��A�ll>����'!�����A���>f����y4�e�)��۫S�ȃΞH+j�J&Y��S�mY6*������T"��x �TIdnB�٤܀lM�%�#~�=J�l���@HuY$}�����-iT��)~CV6�ߨDr��ͨU��r8W�39?�S�&Ƿy��������8z���{N��'?�:P��$�!/��V�URY�Td4W�8�4&���g��>4�kE d����>�m-���	?�Qi:�]ٕABJ4e?��^h.SU�����5J
��%0o+E�F�	@�7t�n⥮u��Qf�D�`U!�U��B%3?�<�Q~�`Dߩ #�Nd�_Qu��Ut�ᗷ�D֝���O���x5���m�%�lO�$m�f��m CE�m��^���f{�i�����b�v�%��6b@�l5?헺�c�i��)E0f��c&����=�~�|��o���aj~&B=�V�-37�Q�tM��j�jSK�~`�c��t����*��ྜ�z~���`ws Hh�J�D6��a���+��2�g�.V�4�"�
W"�m�0T�O�P��+�B���{��X���8�9QO���+�(�5�:�gɂ���zv�C�˩n4&�"��6e"��M�i�|G+��fP�w����-�n_�dp�W���^W/��]uiavM�8f�za߯i;���6��g�������I�~� �kG��rDx��Ǣ`=��RRB�@A;]���ZExH��B�<h�=��A{lE�!�{"�!��IžE�P|2`�GU]J�4b�R�Fm�Rf�6e�%9K#�X_h���O�$����N6��P�S�HM�T5��N��u����3�v𵑶�}X���J%˟���;�L� ��2^�R_
��+�DQ��I%�RW�;Z�+(�Gz$��!���b������hf�W;��;Z�mS�B	�=���V��m��X̶�oQ�H��j�ݒ��v��b�Ŗ�́�����Pq�_3T�?1l���i9�O���#[!D�i�4{yDv9:Ʊ������Atr��9X^������}2�9�O���Z%��J
PGW�ute����u@���oL�!����u�;���J$Bu\dmG^������(���:�7�����Ϣ ?@D����'�x̳��ۯ/�=�/���>k너�����8?��kz>��SĠB�9�.7& �9f��1y����7��^��7o����B��:-r�㾏5�/GwD���G�F��^"A9VHp�ەɔ���ͩ�f���7�5�E�#WYO��Wu%5ʛ��\O�@Q5�!�
�]$�#�^$�-��".�$���0�W�u��YT��}�-�-�����<� �rd�QvG�`�2�w�wRۑdh��L��q��NW��8���4��-���q��p�8rgDe�r�N(�E�A��ӧ��v\O�F�Bf�q�9��1�G��i�G��ͣ���Q�A��XR8�W2e%�*���Z|�9����!؎, �X���9n��~v_���\�е�����ж�!;I�zr.�r�=�u%��L=��ݼ����� "�Y(�F��B�4~�p�Xs��)���8�1����|�8p`$�,�H1u�PFH�B����[�h���W��# �g؆�Z����ĬE�k,�gL��� 
@_�4R�Y9�<$��ּ���ּ&>��=n���=n\$Y9F@��16"'9��\�Ѓu�&dGp��b�/ջ��OÂW<ʽ(�#  zo���z��pvS5�m*z`�MO��m���Js!�"}($f-�IRG����V�A]�6�]��9���^��9�Y�YGҤ����N���L�-�t�G��DWv���XQJ�k\9� `a%�t\Q����+QZ,4s#��B37B�.����B37��{P�​!�G(=qJY�R&��`	�9�m�G%Y�q+�̱&;u�.�8nA�y<�����UmS�����AM���PF3��CWr�+ȧ�!jq�x\b5Y�O���A��~�U�6�ќm�d�ݨId
=�`�GwQ�V�X1�#B���̰\.x���0G7A����΃�A��x�ջ�z����:�q��xL2a�Z��2�i0�1I��V6~C��ߊh�ű�-wߐ�������H܏I$���F���O�˖nb�l�x�r����P!t��/�]�B��[�B���+����U{�\�R��R�Ӯ뀘E8t���� >ڡ�G;tBD����(�"�h���v�
d��=�l�~�HG�Qӈj��P���8J��P��#���W ss4����T�F�}�cP|:�o�\�������m��0���_g.:'�����' @��VЦA��5b��?.
d� *n��b���x���6�h2!y��ﱌ�����!��Ƀ���m`Ad~��<��??�����6_��P���W� b�.N0�NF
�8w���ƹ�j����(��#E�vT�C��Pa�9��HKD��ll+�'�9%��bߞ(���m��,��d��-�o��*��	=( 5�;뚾P�+S�57�����5�[��N0t�9A��Np]��:<Cv���"��>� <yӓ�?zr��93�MOΜ>�N�t�93??�(~��s �>�Q��2��j��p}"0�q������0kg�g��/se���SN|�rQf�v˶[��z������҆�=�(�a��Gu�S�٣��3]�����n<ŏg�?�5��x�,�}�a�S�w�q5�������c�~r��Ë`��^���~�X�J�Ʌ�;�0��H^c	
�沄��F&�J���:��ױf���o�h`������{�!���XC����S�竀RKP��n�Ԋ��o~��F��� �� �	�s�ߺ.Õ�q3��S�mG<�8nf<�5G�6�����/pb��{�Gw���U�5:�ËCi/��c����>��蔐o���cV���[o�V����� f����F��ʟ���IDKW�.�� ��S�x������1���������$PD0      b      x�=�]��0
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
����������?����      d   �   x�5��
�0���S����Y
b=z)�� !�i$M��6��i���|3,3�n��^�Ơ�0�+�\�m��0M��x�g���l�a6O)�f
	y�	���W��bdR!nFpY�-��W�T�0 	�eLi���f-+�#BH���^�y:�E��XB��*�:�%7���X��Ϋ��1�#���/Ң�Ȯ�Y
[!���P      f      x������ � �     