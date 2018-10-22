export default function(sequelize, Type) {
  const model = sequelize.define(
    'Author',
    {
      id: {
        type: Type.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      firstName: {
        type: Type.STRING,
        length: 45
      },
      lastName: {
        type: Type.STRING,
        length: 45
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
      tableName: 'Author',
      timestamps: true
    }
  )
  return model
}
