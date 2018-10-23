export default function(sequelize, Type) {
  const model = sequelize.define(
    'RepoType',
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
      tableName: 'RepositoryTypes',
      timestamp: false
    }
  )
  return model
}
