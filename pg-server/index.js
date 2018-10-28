import express from 'express'
import bodyParser from 'body-parser'
const port = process.env.PORT || 3000

import { UserApi } from './web/router/api'

const app = express()

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

app.use('/api/user', UserApi)

app.listen(port, () => {
  console.log('Server Running in Port ' + port)
})
