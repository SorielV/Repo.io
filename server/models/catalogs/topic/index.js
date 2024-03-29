import database from './../../../config/database'
import Schema from './../../../utils/Schema'

const TopicSchema = {
  table: 'CatalogTopics',
  columns: {
    id: {
      type: Number,
      required: false,
      updatable: true
    },
    value: {
      type: String,
      required: false,
      updatable: true,
      length: 30
    },
    slug: {
      type: String,
      required: false,
      updatable: true,
      length: 30
    },
    description: {
      type: String,
      required: false,
      updatable: true,
      length: 200
    },
    image: {
      type: String,
      required: false,
      updatable: true,
      length: 100
    }
  },
  options: {
    id: 'id'
  }
}

const Topic = new Schema(database, TopicSchema)

export default Topic
