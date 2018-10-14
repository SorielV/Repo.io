/*
  create table Likes
  (
      id  int auto_increment primary key,
      type smallint default 1,
      idRepository  int                                not null,
      username      varchar(20)                        not null,
      userId        mediumint                          not null,
      createdAt     datetime default CURRENT_TIMESTAMP null,
      constraint `fk_Starts_Repository`
          foreign key (idRepository) references Repository (id),
      constraint `fk_Starts_User`
          foreign key (userId, username) references User (id, username)
  );
*/

module.exports = (sequelize, Type) => {
  return sequelize.define('RepositoryAuthor', {
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
    timestamp: false
  }
)}
