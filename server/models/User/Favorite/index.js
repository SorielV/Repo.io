/**
create table Favorite
(
    id           int auto_increment primary key,
    idRepository int                                not null,
    type         tinyint                            not null,
    createdAt    datetime default CURRENT_TIMESTAMP null,
    username     varchar(20)                        not null,
    userId       mediumint                          not null,
    constraint `fk_Favorite_Repository`
        foreign key (idRepository) references Repository (id),
    constraint `fk_Favorite_User`
        foreign key (userId, username) references User (id, username)
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
      length: 20
    },
    idUser: {
      type: Type.INTEGER
    },
    idRepository: {
      type: Type.INTEGER
    },
    type: {
      type: Type.INTEGER
    },
    createdAt: {
      type: Type.DATE,
      allowNull: true
    },
    updatedAt: {
      type: Type.DATE
    }
  }
)}