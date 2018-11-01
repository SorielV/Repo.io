
import database from './../../config/database'
import Schema from './../../utils/Schema'

const RepositoySchema = {
  "table": "Repositories",
  "columns": {
    "id": {
      "type": Number,
      "required": false,
      "updatable": true
    },
    "idUser": {
      "type": Number,
      "required": false,
      "updatable": true
    },
    "username": {
      "type": String,
      "required": false,
      "updatable": true,
      "length": 20
    },
    "title": {
      "type": String,
      "required": false,
      "updatable": true,
      "length": 80
    },
    "description": {
      "type": String,
      "required": false,
      "updatable": true,
      "length": 200
    },
    "url": {
      "type": String,
      "required": false,
      "updatable": true,
      "length": 100
    },
    "file": {
      "type": String,
      "required": false,
      "updatable": true,
      "length": 100
    },
    "image": {
      "type": String,
      "required": false,
      "updatable": true,
      "length": 100
    },
    "tags": {
      "type": String,
      "required": false,
      "updatable": true,
      "length": 120
    },
    "visibility": {
      "type": Number,
      "required": true,
      "updatable": true,
      "default": "0"
    },
    "createdAt": {
      "type": Date,
      "required": true,
      "updatable": true,
      "default": "CURRENT_TIMESTAMP"
    },
    "updatedAt": {
      "type": Date,
      "required": true,
      "updatable": true
    }
  },
  "options": {
    "id": "id"
  }
}

const Repositoy = new Schema(database, RepositoySchema)

export default Repositoy
