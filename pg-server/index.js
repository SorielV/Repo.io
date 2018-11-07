import consola from 'consola'
import express from 'express'
import cors from 'cors'
import bodyParser from 'body-parser'
import { Nuxt, Builder } from 'nuxt'
import { UserApi, Catalog, Repository } from './web/router/api'
import LoginAPI from './web/router/login'

const host = process.env.HOST || '127.0.0.1'
const port = process.env.PORT || 3000

const app = express()

if (process.env.NUXT) {
  let config = require('../nuxt.config.js')
  config.dev = !(process.env.NODE_ENV === 'production')

  async function start() {
    const nuxt = new Nuxt(config)

    // Build only in dev mode
    if (config.dev) {
      const builder = new Builder(nuxt)
      await builder.build()
    }

    app.use(cors)
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

    app.use(nuxt.render)

    app.listen(port, () => {
      consola.success('Server Running in Port ' + port)
    })
  }
  start()
} else {
  async function start() {
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
  }
  start()
}
