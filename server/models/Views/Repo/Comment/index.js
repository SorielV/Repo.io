module.exports = (sequelize, Type) => {
  return sequelize.define('ViewRepositoryComment', {
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
    profileImage: {
      type: Type.STRING,
      alllowNull: true
    },
    comment: {
      type: Type.STRING,
      length: 255,
      allowNull: false
    },
    createdAt: {
      type: Type.DATE,
      allowNull: true
    },
    updatedAt: {
      type: Type.DATE,
      allowNull: true
    }
  },
  {
    tableName: 'ViewRepositoryComment',
    timestamp: true
  }
)}
