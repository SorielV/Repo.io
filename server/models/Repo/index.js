/**
  create table Repository
  (
    id                int auto_increment primary key,
    title             varchar(45)                        not null,
    url               varchar(80)                        not null,
    topic             smallint(6)                        not null,
    type              smallint(6)                        not null,
    createdAt         datetime default CURRENT_TIMESTAMP null,
    tags              varchar(200)                        null,
    username          varchar(20)                        not null,
    userId            mediumint                          not null,
    visibility        tinyint                            not null,
    constraint fk_Repository_User
        foreign key (userId, username) references User (id, username)
  );
*/

module.exports = (sequelize, Type) => {
  return sequelize.define('Repository', {
    id: {
      type: Type.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    username: {
      type: Type.STRING,
      length: 20
    },
    idUser: {
      type: Type.INTEGER
    },
    title: {
      type: Type.STRING,
      length: 45
    },
    url: {
      type: Type.STRING,
      length: 80
    },
    topic: {
      type: Type.INTEGER,
      allowNull: true,
      default: 1
    },
    type: {
      type: Type.INTEGER
    },
    tags: {
      type: Type.STRING,
      length: 200,
      allowNull: true,
      default: null
    },
    visibility: {
      type: Type.INTEGER
    },
    createdAt: {
      type: Type.DATE,
      allowNull: true
    },
    updatedAt: {
      type: Type.DATE
    }
  },
  {
    tableName: 'Repository'
  }
)}