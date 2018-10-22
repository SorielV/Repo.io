export default function(sequelize, Type) {
  const model = sequelize.define(
    'RepositoryComment',
    {
      id: {
        type: Type.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      idRepository: {
        type: Type.INTEGER
      },
      username: {
        type: Type.STRING,
        length: 20,
        allowNull: false
      },
      idUser: {
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
}
