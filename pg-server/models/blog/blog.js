import database from './../../config/database'
import Schema from './../../utils/Schema'

const BlogSchema = {
  table: 'Blog',
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
    title: {
      type: String,
      required: false,
      updatable: true,
      length: 80
    },
    slug: {
      type: String,
      required: false,
      updatable: true,
      length: 80
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
      length: 140
    },
    content: {
      type: String,
      required: true,
      updatable: true
    },
    tags: {
      type: String,
      required: false,
      updatable: true,
      length: 255
    },
    createdAt: {
      type: Date,
      required: false,
      updatable: true
    }
  },
  options: {
    id: 'id'
  }
}

const Blog = new Schema(database, BlogSchema)

export default Blog
