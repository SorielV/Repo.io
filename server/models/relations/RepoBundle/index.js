export default function(sequelize, Type) {
  const model = sequelize.define(
    'RepoBundle',
    {
      id: {
        type: Type.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      idBundle: {
        type: Type.INTEGER
      },
      idRepository: {
        type: Type.INTEGER
      },
      createdAt: {
        type: Type.DATE,
        allowNull: true
      }
    },
    {
      tableName: 'RepositoryAuthors',
      timestamp: false
    }
  )
  return model
}
