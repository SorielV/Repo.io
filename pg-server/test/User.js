const env = process.env.NODE_ENV || 'development'
const { [env]: config } = require('./../database.json')

const { Pool } = require('pg')
const database = new Pool(config)

const Schema = require('./../utils/Schema')

const UserSchema = {
  table: 'Users',
  columns: {
    id: {
      type: Number,
      required: false,
      updatable: true
    },
    email: {
      type: String,
      required: true,
      updatable: true,
      length: 80
    },
    username: {
      type: String,
      required: true,
      updatable: true,
      length: 20
    },
    password: {
      type: String,
      required: true,
      updatable: true,
      length: 80
    },
    firstName: {
      type: String,
      required: true,
      updatable: true,
      length: 40
    },
    lastName: {
      type: String,
      required: true,
      updatable: true,
      length: 40
    },
    type: {
      type: Number,
      required: false,
      updatable: true
    },
    createdAt: {
      type: Date,
      required: false,
      updatable: true
    },
    updatedAt: {
      type: Date,
      required: false,
      updatable: true
    },
    profileImage: {
      type: String,
      required: false,
      updatable: true,
      length: 120
    }
  },
  options: {
    id: ['id', 'username']
  }
}

const User = new Schema(database, UserSchema)

console.log(User ? 'Instanciado' : 'No Instanciado')

User.findOneAndUpadate({ id: 2 }, { firstName: 'Actualizado' })
  .then(data => {
    console.log(data)
  })
  .catch(console.log)

const user = new User({
  email: 'xxsorielxx2@gmail.com',
  username: 'Soriel2',
  password: 'JS34141',
  firstName: 'Clemente Soriel',
  lastName: 'Vallejo Mejia',
  type: 1,
  createdAt: '2018-10-23T17:26:14.383Z',
  updatedAt: null,
  profileImage:
    'https://raw.githubusercontent.com/voodootikigod/logo.js/master/js.png'
})

user
  .save()
  .then(console.log)
  .catch(error => {
    console.log(error.code, error.message)
  })
