import database from './../../../config/database'
import Schema from './../../../utils/Schema'

const ResourceSchema = {
  table: 'RepositoryResources',
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
    idRepository: {
      type: Number,
      required: false,
      updatable: true
    },
    name: {
      type: String,
      required: true,
      updatable: true,
      length: 60
    },
    description: {
      type: String,
      required: true,
      updatable: true,
      length: 120
    },
    file: {
      type: String,
      required: true,
      updatable: true,
      length: 255
    },
    type: {
      type: Number,
      required: false,
      updatable: false,
      default: 1 // Image
    },
    uploaded: {
      type: Boolean,
      required: false,
      updatable: false,
      default: false
    },
    createdAt: {
      type: Date,
      required: false,
      updatable: false
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

const Resource = new Schema(database, ResourceSchema)

export default Resource
