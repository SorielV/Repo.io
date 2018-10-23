export default function(sequelize, Type) {
  const model = sequelize.define(
    'Editorials',
    {
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
      tableName: 'CatEditorials',
      timestamps: false
    }
  )
  return model
}
