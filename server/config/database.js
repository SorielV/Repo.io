const env = process.env.DB || 'development'
const { [env]: database } = require('./../database.json')

import { Pool } from 'pg'
const connection = new Pool(database)

export default connection
