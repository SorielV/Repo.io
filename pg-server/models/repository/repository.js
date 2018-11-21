import database from './../../config/database'
import Schema from './../../utils/Schema'

const RepositoySchema = {
  table: 'Repositories',
  columns: {
    id: {
      type: Number,
      required: false,
      updatable: true
    },
    idUser: {
      type: Number,
      required: false,
      updatable: true
    },
    username: {
      type: String,
      required: false,
      updatable: true,
      length: 20
    },
    title: {
      type: String,
      required: false,
      updatable: true,
      length: 80
    },
    slug: {
      type: String,
      required: false,
      updatable: true,
      length: 80
    },
    description: {
      type: String,
      required: false,
      updatable: true,
      length: 200
    },
    image: {
      type: String,
      required: false,
      updatable: true,
      length: 100
    },
    tags: {
      type: String,
      required: false,
      updatable: true,
      length: 120
    },
    visibility: {
      type: Number,
      required: false,
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
    }
  },
  options: {
    id: 'id'
  }
}

const Repositoy = new Schema(database, RepositoySchema)

export default Repositoy
