
import database from './../../../config/database'
import Schema from './../../../utils/Schema'

const EditoriaSchema = {
  "table": "RepositoryEditorials",
  "columns": {
    "id": {
      "type": Number,
      "required": false,
      "updatable": true
    },
    "idRepository": {
      "type": Number,
      "required": true,
      "updatable": true
    },
    "idCatalog": {
      "type": Number,
      "required": true,
      "updatable": true
    }
  },
  "options": {
    "id": "id"
  }
}

const Editoria = new Schema(database, EditoriaSchema)

export default Editoria
