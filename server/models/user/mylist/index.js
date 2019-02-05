
import database from './../../../config/database'
import Schema from './../../../utils/Schema'

const MyListSchema = {
  "table": "MyList",
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
    "idRepository": {
      "type": Number,
      "required": false,
      "updatable": true
    },
    "type": {
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
    }
  },
  "options": {
    "id": "id"
  }
}

const MyList = new Schema(database, MyListSchema)

export default MyList
