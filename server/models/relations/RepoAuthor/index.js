export default function(sequelize, Type) {
  const model = sequelize.define(
    'RepoAuthor',
    {
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
      }
    },
    {
      tableName: 'RepositoryAuthors',
      timestamp: true
    }
  )
  return model
}
