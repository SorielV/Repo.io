
import database from './../../../config/database'
import Schema from './../../../utils/Schema'

const TokenSchema = {
  "table": "Verification_Token",
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
      "required": true,
      "updatable": true,
      "length": 20
    },
    "token": {
      "type": String,
      "required": false,
      "updatable": true,
      "length": 120
    },
    "type": {
      "type": Number,
      "required": false,
      "updatable": true
    },
    "createdAt": {
      "type": Date,
      "required": true,
      "updatable": true,
      "default": "CURRENT_TIMESTAMP"
    },
    "expiredAt": {
      "type": Date,
      "required": true,
      "updatable": true
    },
    "column_8": {
      "type": Boolean,
      "required": true,
      "updatable": true
    }
  },
  "options": {
    "id": "id"
  }
}

const Token = new Schema(database, TokenSchema)

export default Token
