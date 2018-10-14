/**
  create table User
  (
    id            mediumint auto_increment,
    username      varchar(20)                        not null,
    email         varchar(45)                        not null,
    firstName     varchar(45)                        not null,
    lastName      varchar(45)                        not null,
    birthDate     date                               not null,
    profileImage  varchar(80)                        null,
    userType      smallint(2)                        not null,
    recoveryToken varchar(45)                        null,
    emailToken    varchar(45)                        null,
    createdAt     datetime default CURRENT_TIMESTAMP null,
    updatedAt     datetime default CURRENT_TIMESTAMP null
    primary key (id, username),
    constraint User_username_uindex
    unique (username)
  );
*/

module.exports = (sequelize, Type) => {
  return sequelize.define('User', {
    id: {
      type: Type.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    username: {
      type: Type.STRING,
      primaryKey: true,
      unique: true,
      length: 20
    },
    email: {
      type: Type.STRING,
      unique: true,
      length: 45,
      validate: {
        isEmail: true
      }
    },
    firstName: {
      type: Type.STRING,
      length: 45
    },
    lastName: {
      type: Type.STRING,
      length: 45
    },
    birthDate: {
      type: Type.DATE,
    },
    profileImage: {
      type: Type.STRING,
      allowNull: true,
      length: 80
    },
    userType: {
      type: Type.INTEGER
    },
    recoveryToken: {
      type: Type.STRING,
      length: 45,
      allowNull: true,
      defaultValue: null
    },
    emailToken: {
      type: Type.STRING,
      length: 45,
      allowNull: true,
      defaultValue: null
    },
    createdAt: {
      type: Type.DATE,
      allowNull: true
    },
    updatedAt: {
      type: Type.DATE,
      allowNull: true
    }
  }, 
  {
    tableName: 'User',
    timestamps: true
  }
)}