const env = process.env.NODE_ENV || 'dev'
const { [env]: database } = require('./../database.json')

import { Pool } from 'pg'
const connection = new Pool(database)

export default connection
