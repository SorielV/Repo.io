export default function(sequelize, Type) {
  const model = sequelize.define(
    'Repository',
    {
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
      image: {
        type: Type.STRING,
        allowNull: true,
        default: null
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
  )
  return model
}
