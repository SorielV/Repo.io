
import database from './../../../config/database'
import Schema from './../../../utils/Schema'

const AuthorSchema = {
  "table": "RepositoryAuthors",
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
    "idAuthor": {
      "type": Number,
      "required": true,
      "updatable": true
    }
  },
  "options": {
    "id": "id"
  }
}

const Author = new Schema(database, AuthorSchema)

export default Author
