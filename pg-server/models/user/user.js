import database from './../../config/database'
import Schema from './../../utils/Schema'

const UserSchema = {
  table: 'Repositories',
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
      length: 80,
      validate: function() {
        return this.email
      }
    },
    username: {
      type: String,
      required: true,
      updatable: true,
      length: 20,
      validate: function() {
        return this.username.length > 8
      }
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
      required: true,
      updatable: true,
      default: 1
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
    id: 'id',
    create_timestamp: true,
    update_timestamp: true
  },
  debug: true
}

const User = new Schema(database, UserSchema)

export default User
