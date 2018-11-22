import database from './../../../config/database'
import Schema from './../../../utils/Schema'

const AuthorSchema = {
  table: 'CatalogAuthors',
  columns: {
    id: {
      type: Number,
      required: false,
      updatable: true
    },
    image: {
      type: String,
      required: false,
      updatable: true
    },
    description: {
      type: String,
      required: true,
      updatable: true,
      length: 200
    },
    lastName: {
      type: String,
      required: false,
      updatable: true,
      length: 40
    },
    firstName: {
      type: String,
      required: false,
      updatable: true,
      length: 40
    },
    createdAt: {
      type: Date,
      required: false,
      updatable: true
    }
  },
  options: {
    id: 'id'
  }
}

const Author = new Schema(database, AuthorSchema)

export default Author
