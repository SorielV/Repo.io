import database from './../../../config/database'
import Schema from './../../../utils/Schema'

const CommentSchema = {
  table: 'BundleComment',
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
    idBundle: {
      type: Number,
      required: false,
      updatable: true
    },
    comment: {
      type: String,
      required: false,
      updatable: true,
      length: 255
    },
    createdAt: {
      type: Date,
      required: true,
      updatable: true,
      default: 'CURRENT_TIMESTAMP'
    },
    updatedAt: {
      type: Date,
      required: true,
      updatable: true
    }
  },
  options: {
    id: 'id'
  }
}

const Comment = new Schema(database, CommentSchema)

export default Comment
