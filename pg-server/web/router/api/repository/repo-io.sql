create table "Users"
(
  id             serial             not null
    constraint "Users_id_key"
    unique,
  email          varchar(80)        not null
    constraint "Users_email_key"
    unique,
  username       varchar(20)        not null
    constraint "Users_username_key"
    unique,
  password       varchar(80)        not null
    constraint "Users_password_key"
    unique,
  "firstName"    varchar(40)        not null,
  "lastName"     varchar(40)        not null,
  type           smallint default 0 not null,
  "createdAt"    timestamp default CURRENT_TIMESTAMP,
  "updatedAt"    timestamp,
  "profileImage" varchar(120)       not null,
  constraint "Users_pkey"
  primary key (id, username)
);


create table "Verification_Token"
(
  id          serial       not null
    constraint "Verification_Token_pkey"
    primary key,
  "idUser"    integer      not null
    constraint "Verification_Token_idUser_fkey"
    references "Users" (id),
  username    varchar(20)
    constraint "Verification_Token_username_fkey"
    references "Users" (username),
  token       varchar(120) not null,
  type        smallint     not null,
  "createdAt" timestamp default CURRENT_TIMESTAMP,
  "expiredAt" timestamp,
  column_8    boolean
);

create table "Repositories"
(
  id          serial       not null
    constraint "Repositories_pkey"
    primary key,
  "idUser"    integer      not null
    constraint "Repositories_idUser_fkey"
    references "Users" (id),
  username    varchar(20)  not null
    constraint "Repositories_username_fkey"
    references "Users" (username),
  title       varchar(80)  not null,
  description varchar(200) not null,
  url         varchar(100) not null,
  file        varchar(100) not null,
  image       varchar(100) not null,
  tags        varchar(120) not null,
  visibility  smallint  default 0,
  "createdAt" timestamp default CURRENT_TIMESTAMP,
  "updatedAt" timestamp
);

-- auto-generated definition
create table "CatalogAuthors"
(
  id          serial      not null
    constraint "CatalogAuthors_pkey"
    primary key,
  image       varchar(100),
  description varchar(200),
  "lastName"  varchar(40) not null,
  "firstName" varchar(40) not null,
  "createdAt" timestamp default CURRENT_TIMESTAMP
);

-- auto-generated definition
create table "CatalogEditorials"
(
  id          serial      not null
    constraint "CatalogEditorials_pkey"
    primary key,
  image       varchar(100),
  description varchar(200),
  name        varchar(80) not null
);

create unique index catalogeditorials_name_uindex
  on "CatalogEditorials" (name);

-- auto-generated definition
create table "CatalogTypes"
(
  id          serial      not null
    constraint "CatalogTypes_pkey"
    primary key,
  value       varchar(30) not null,
  description varchar(200) default '' :: character varying
);

create unique index catalogtypes_value_uindex
  on "CatalogTypes" (value);

-- auto-generated definition
create table "CatalogTopics"
(
  id          serial                                       not null
    constraint "CatalogTopics_pkey"
    primary key,
  value       varchar(30)                                  not null,
  description varchar(200) default '' :: character varying not null
);

create unique index catalogtopics_value_uindex
  on "CatalogTopics" (value);

create table "RepositoryTopics"
(
  id             serial not null
    constraint "RepositoryTopics_pkey"
    primary key,
  "idRepository" integer
    constraint "RepositoryTopics_idRepository_fkey"
    references "Repositories",
  "idCatalog"    integer
    constraint "RepositoryTopics_idCatalog_fkey"
    references "CatalogTopics"
);

create table "RepositoryEditorials"
(
  id             serial not null
    constraint "RepositoryEditorials_pkey"
    primary key,
  "idRepository" integer
    constraint "RepositoryEditorials_idRepository_fkey"
    references "Repositories",
  "idCatalog"    integer
    constraint "RepositoryEditorials_idCatalog_fkey"
    references "CatalogEditorials"
);

create table "RepositoryAuthors"
(
  id             serial not null
    constraint "RepositoryAuthors_pkey"
    primary key,
  "idRepository" integer
    constraint "RepositoryAuthors_idRepository_fkey"
    references "Repositories",
  "idAuthor"     integer
    constraint "RepositoryAuthors_idAuthor_fkey"
    references "CatalogAuthors"
);

create table "RepositoryComment"
(
  id             serial       not null
    constraint "RepositoryComment_pkey"
    primary key,
  "idUser"       integer      not null
    constraint "RepositoryComment_idUser_fkey"
    references "Users" (id),
  username       varchar(20)  not null
    constraint "RepositoryComment_username_fkey"
    references "Users" (username),
  "idRepository" integer      not null
    constraint "RepositoryComment_idRepositoty_fkey"
    references "Repositories",
  comment        varchar(255) not null,
  "createdAt"    timestamp default CURRENT_TIMESTAMP,
  "updatedAt"    timestamp
);

create table "RepositoryScore"
(
  id          serial      not null
    constraint "RepositoryScore_pkey"
    primary key,
  "idUser"    integer     not null
    constraint "RepositoryScore_idUser_fkey"
    references "Users" (id),
  username    varchar(20) not null
    constraint "RepositoryScore_username_fkey"
    references "Users" (username),
  score       smallint    not null,
  comment     varchar(255),
  "createdAt" timestamp default CURRENT_TIMESTAMP,
  "updatedAt" timestamp
);

create table "RepositoryTypes"
(
  id             serial not null
    constraint "RepositoryTypes_pkey"
    primary key,
  "idRepository" integer
    constraint "RepositoryTypes_idRepository_fkey"
    references "Repositories",
  "idCatalog"    integer
    constraint "RepositoryTypes_idCatalog_fkey"
    references "CatalogTypes"
);

create table "MyList"
(
  id             serial      not null
    constraint "MyList_pkey"
    primary key,
  "idUser"       integer     not null
    constraint "MyList_idUser_fkey"
    references "Users" (id),
  username       varchar(20) not null
    constraint "MyList_username_fkey"
    references "Users" (username),
  "idRepository" integer     not null
    constraint "MyList_idRepository_fkey"
    references "Repositories",
  type           smallint  default 0,
  "createdAt"    timestamp default CURRENT_TIMESTAMP
);

create table "Files"
(
  id          serial      not null
    constraint "Files_pkey"
    primary key,
  type        smallint    not null,
  path        varchar(80) not null,
  url         varchar(80) not null
    constraint "Files_url_key"
    unique,
  "createdAt" timestamp   not null
);

create table "Bundle"
(
  id          serial       not null
    constraint "Bundle_pkey"
    primary key,
  "idUser"    integer      not null
    constraint "Bundle_idUser_fkey"
    references "Users" (id),
  title       varchar(80)  not null,
  description varchar(200) not null,
  oficial     boolean default false,
  username    varchar(20)  not null
    constraint "Bundle_username_fkey"
    references "Users" (username),
  "createdAt" timestamp
);

create table "BundleRepository"
(
  id             serial  not null
    constraint "BundleRepository_pkey"
    primary key,
  "idBundle"     integer not null
    constraint "BundleRepository_idBundle_fkey"
    references "Bundle",
  "idRepository" integer not null
    constraint "BundleRepository_idRepository_fkey"
    references "Repositories",
  "createdAt"    timestamp default CURRENT_TIMESTAMP
);

create table "BundleComment"
(
  id          serial       not null
    constraint "BundleComment_pkey"
    primary key,
  "idUser"    integer      not null
    constraint "BundleComment_idUser_fkey"
    references "Users" (id),
  username    varchar(20)  not null
    constraint "BundleComment_username_fkey"
    references "Users" (username),
  "idBundle"  integer      not null
    constraint "BundleComment_idBundle_fkey"
    references "Bundle",
  comment     varchar(255) not null,
  "createdAt" timestamp default CURRENT_TIMESTAMP,
  "updatedAt" timestamp
);
