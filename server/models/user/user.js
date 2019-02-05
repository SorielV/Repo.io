import database from './../../config/database'
import Schema from './../../utils/Schema'

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
      required: false,
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
      required: false,
      updatable: true,
      length: 80
    },
    firstName: {
      type: String,
      required: false,
      updatable: true,
      length: 40
    },
    lastName: {
      type: String,
      required: false,
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

export default User
