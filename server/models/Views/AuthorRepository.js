module.exports = (sequelize, Type) => {
  const Model = sequelize.define('ViewAuthor', {
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
      tableName: 'ViewAuthor'
    }
  )
  Model.removeAttribute('id')
  return Model
}