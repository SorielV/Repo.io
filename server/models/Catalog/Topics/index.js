module.exports = (sequelize, Type) => {
  return sequelize.define('Topics', {
    id: {
      type: Type.TINYINT,
      primaryKey: true,
      autoIncrement: true
    },
    text: {
      type: Type.STRING,
      length: 25
    },
    description: {
      type: Type.STRING,
      length: 200
    }
  },
  {
    tableName: 'CatTopics',
    timestamps: false
  }
)}