import consola from 'consola'
import express from 'express'
import bodyParser from 'body-parser'
const port = process.env.PORT || 3000

import { UserApi, Catalog, Repository } from './web/router/api'
import LoginAPI from './web/router/login'

const app = express()

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

app.use('/api/user', UserApi)
for (let catalog in Catalog) {
  app.use(`/api/catalog/${catalog}`, Catalog[catalog])
}
// app.use('/api/type', CatalogTypeApi)
app.use('/login', LoginAPI)
app.use('/api/repo', Repository)

app.listen(port, () => {
  consola.success('Server Running in Port ' + port)
})
