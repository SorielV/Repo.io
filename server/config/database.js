const env = process.env.DB || 'development'
const { [env]: database } = require('./../database.json')

import { Pool } from 'pg'

// TODO: Connection without URI
const connectionString = `postgresql://${database.user}:${
  database.password
}@postgres/${database.database}`
const connection = new Pool({ connectionString })

export default connection
