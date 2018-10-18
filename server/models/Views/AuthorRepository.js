module.exports = (sequelize, Type) => {
  const Model = sequelize.define('ViewRepoAuthor',{
    idAuthor: {
      type: Type.INTEGER
    },
    idRepository: {
      type: Type.INTEGER
    },
    firstName: {
      type: Type.STRING,
    },
    lastName: {
      type: Type.STRING,
    },
    createdAt: {
      type: Type.DATE,
    }
  },
  {
    timestamps: false,
    tableName: 'ViewRepoAuthor'
  })
  Model.removeAttribute('id')
  return Model
}