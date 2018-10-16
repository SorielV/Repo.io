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
    primary key (id, username),
    constraint User_username_uindex
    unique (username)
    );
*/

module.exports = (sequelize, Type) => {
    return sequelize.define('Author', {
      id: {
        type: Type.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      firstName: {
        type: Type.STRING,
        length: 45
      },
      lastName: {
        type: Type.STRING,
        length: 45
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
      tableName: 'Author',
      timestamps: true
    }
  )}