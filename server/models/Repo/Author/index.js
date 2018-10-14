/**
  create table RepositoryAuthor 
  (
    id int auto_increment primary key,
    idAuthor int,
    idRepository int,
    createdAt datetime default CURRENT_TIMESTAMP null,
    constraint fk_RepositoryAuthor_Author
        foreign key (idAuthor) references Author (id),
    constraint fk_RepositoryAuthor_Repository
        foreign key (idRepository) references Repository (id)
  )
*/

module.exports = (sequelize, Type) => {
  return sequelize.define('RepositoryAuthor', {
    id: {
      type: Type.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    idAuthor: {
      type: Type.INTEGER
    },
    idRepository: {
      type: Type.INTEGER
    },
    createdAt: {
      type: Type.DATE,
      allowNull: true
    },
  },
  {
    timestamp: false
  }
)}
