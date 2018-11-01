
import database from './../../../config/database'
import Schema from './../../../utils/Schema'

const ScoreSchema = {
  "table": "RepositoryScore",
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
    "score": {
      "type": Number,
      "required": false,
      "updatable": true
    },
    "comment": {
      "type": String,
      "required": true,
      "updatable": true,
      "length": 255
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

const Score = new Schema(database, ScoreSchema)

export default Score
