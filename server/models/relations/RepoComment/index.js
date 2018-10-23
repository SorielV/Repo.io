export default function(sequelize, Type) {
  const model = sequelize.define(
    'RepoComment',
    {
      id: {
        type: Type.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      idUser: {
        type: Type.INTEGER
      },
      username: {
        type: Type.STRING,
        length: 20,
        allowNull: false
      },
      idRepository: {
        type: Type.INTEGER
      },
      comment: {
        type: Type.STRING,
        length: 255,
        allowNull: false
      },
      createdAt: {
        type: Type.DATE,
        allowNull: true
      }
    },
    {
      tableName: 'RepositoryComment',
      timestamp: true
    }
  )
  return model
}
