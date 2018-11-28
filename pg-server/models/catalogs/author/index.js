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
    name: {
      type: String,
      required: true,
      updatable: true,
      length: 120
    },
    slug: {
      type: String,
      required: false,
      updatable: true,
      length: 120
    },
    description: {
      type: String,
      required: true,
      updatable: true,
      length: 200
    },
    image: {
      type: String,
      required: false,
      updatable: true
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
