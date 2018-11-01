
import database from './../../config/database'
import Schema from './../../utils/Schema'

const BundleSchema = {
  "table": "Bundle",
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
    "oficial": {
      "type": Boolean,
      "required": true,
      "updatable": true,
      "default": "false"
    },
    "username": {
      "type": String,
      "required": false,
      "updatable": true,
      "length": 20
    },
    "createdAt": {
      "type": Date,
      "required": true,
      "updatable": true
    }
  },
  "options": {
    "id": "id"
  }
}

const Bundle = new Schema(database, BundleSchema)

export default Bundle
