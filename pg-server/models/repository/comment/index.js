import database from './../../../config/database'
import Schema from './../../../utils/Schema'

const CommentSchema = {
  table: 'RepositoryComment',
  columns: {
    id: {
      type: Number,
      required: false,
      updatable: true
    },
    idUser: {
      type: Number,
      required: false,
      updatable: true
    },
    username: {
      type: String,
      required: false,
      updatable: true,
      length: 20
    },
    idRepository: {
      type: Number,
      required: false,
      updatable: true
    },
    comment: {
      type: String,
      required: true,
      updatable: true,
      length: 255
    },
    createdAt: {
      type: Date,
      required: false,
      updatable: false
    },
    updatedAt: {
      type: Date,
      required: false,
      updatable: true
    }
  },
  options: {
    id: 'id'
  }
}

const Comment = new Schema(database, CommentSchema)

export default Comment
