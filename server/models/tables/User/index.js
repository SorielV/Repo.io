export default function(sequelize, Type) {
  const model = sequelize.define(
    'User',
    {
      id: {
        type: Type.MEDIUMINT,
        primaryKey: true,
        autoIncrement: true
      },
      username: {
        type: Type.STRING,
        primaryKey: true,
        unique: true,
        length: 20
      },
      email: {
        type: Type.STRING,
        unique: true,
        length: 45,
        validate: {
          isEmail: true
        }
      },
      firstName: {
        type: Type.STRING,
        length: 45
      },
      lastName: {
        type: Type.STRING,
        length: 45
      },
      birthDate: {
        type: Type.DATE
      },
      profileImage: {
        type: Type.STRING,
        allowNull: true,
        length: 80
      },
      userType: {
        type: Type.SMALLINT
      },
      recoveryToken: {
        type: Type.STRING,
        length: 45,
        allowNull: true,
        defaultValue: null
      },
      emailToken: {
        type: Type.STRING,
        length: 45,
        allowNull: true,
        defaultValue: null
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
      tableName: 'User',
      timestamps: true
    }
  )
  return model
}
