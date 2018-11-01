
import database from './../../../config/database'
import Schema from './../../../utils/Schema'

const RepositoySchema = {
  "table": "BundleRepository",
  "columns": {
    "id": {
      "type": Number,
      "required": false,
      "updatable": true
    },
    "idBundle": {
      "type": Number,
      "required": false,
      "updatable": true
    },
    "idRepository": {
      "type": Number,
      "required": false,
      "updatable": true
    },
    "createdAt": {
      "type": Date,
      "required": true,
      "updatable": true,
      "default": "CURRENT_TIMESTAMP"
    }
  },
  "options": {
    "id": "id"
  }
}

const Repositoy = new Schema(database, RepositoySchema)

export default Repositoy
