import database from './../../../config/database'
import Schema from './../../../utils/Schema'

const TypeSchema = {
  table: 'RepositoryTypes',
  columns: {
    id: {
      type: Number,
      required: false,
      updatable: true
    },
    idRepository: {
      type: Number,
      required: true,
      updatable: true
    },
    idCatalog: {
      type: Number,
      required: true,
      updatable: true
    }
  },
  options: {
    id: 'id'
  }
}

const Type = new Schema(database, TypeSchema)

export default Type
