module.exports = (sequelize, Type) => {
  return sequelize.define('Types', {
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
    tableName: 'CatTypes',
    timestamps: false
  }
)}