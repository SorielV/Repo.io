
import database from './../../../config/database'
import Schema from './../../../utils/Schema'

const TopicSchema = {
  "table": "RepositoryTopics",
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

const Topic = new Schema(database, TopicSchema)

export default Topic
