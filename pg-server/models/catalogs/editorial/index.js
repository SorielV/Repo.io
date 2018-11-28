import database from './../../../config/database'
import Schema from './../../../utils/Schema'

const EditorialSchema = {
  table: 'CatalogEditorials',
  columns: {
    id: {
      type: Number,
      required: false,
      updatable: true
    },
    name: {
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
      required: true,
      updatable: true,
      length: 200
    },
    image: {
      type: String,
      required: false,
      updatable: true,
      length: 120
    }
  },
  options: {
    id: 'id'
  }
}

const Editorial = new Schema(database, EditorialSchema)

export default Editorial
