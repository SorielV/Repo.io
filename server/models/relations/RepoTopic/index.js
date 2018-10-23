export default function(sequelize, Type) {
  const model = sequelize.define(
    'RepoTopic',
    {
      id: {
        type: Type.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      idRepository: {
        type: Type.INTEGER
      },
      idCatalog: {
        type: Type.INTEGER
      }
    },
    {
      tableName: 'RepositoryTopics',
      timestamp: false
    }
  )
  return model
}
