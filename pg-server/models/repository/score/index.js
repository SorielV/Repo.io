import database from './../../../config/database'
import Schema from './../../../utils/Schema'

const ScoreSchema = {
  table: 'RepositoryScore',
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
    idRepository: {
      type: Number,
      required: true,
      updatable: true
    },
    username: {
      type: String,
      required: false,
      updatable: true,
      length: 20
    },
    score: {
      type: Number,
      required: true,
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
      updatable: true
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

const Score = new Schema(database, ScoreSchema)

export default Score
