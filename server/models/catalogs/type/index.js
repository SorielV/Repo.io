import database from './../../../config/database'
import Schema from './../../../utils/Schema'

const TypeSchema = {
  table: 'CatalogTypes',
  columns: {
    id: {
      type: Number,
      required: false,
      updatable: true
    },
    value: {
      type: String,
      required: false,
      updatable: true,
      length: 30
    },
    slug: {
      type: String,
      required: false,
      updatable: true,
      length: 30
    },
    description: {
      type: String,
      required: true,
      updatable: true,
      length: 200,
      default: ''
    },
    image: {
      type: String,
      required: false,
      updatable: true,
      length: 100
    }
  },
  options: {
    id: 'id'
  }
}

const Type = new Schema(database, TypeSchema)

export default Type
