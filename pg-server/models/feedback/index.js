import database from './../../config/database'
import Schema from './../../utils/Schema'

const FeedbackSchema = {
  table: 'Feedback',
  columns: {
    id: {
      type: Number,
      required: false,
      updatable: true
    },
    title: {
      type: String,
      required: true,
      updatable: true,
      length: 120
    },
    description: {
      type: String,
      required: true,
      updatable: true,
      length: 1200
    },
    solution: {
      type: String,
      required: false,
      updatable: true,
      length: 1200
    },
    priority: {
      type: Number,
      required: false,
      updatable: true
    },
    url: {
      type: String,
      required: false,
      updatable: true,
      length: 255
    },
    status: {
      type: Number,
      required: false,
      updatable: true
    },
    createdat: {
      type: Date,
      required: false,
      updatable: true
    }
  },
  options: {
    id: 'id'
  }
}

const Feedback = new Schema(database, FeedbackSchema)

export default Feedback
