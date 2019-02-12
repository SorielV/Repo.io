#!/usr/bin/env nodejs
import consola from 'consola'
import path from 'path'
import express from 'express'
import { Server } from 'http'
import morgan from 'morgan'
import bodyParser from 'body-parser'
import { Nuxt, Builder } from 'nuxt'
import APIs from './web/router/api'
import LoginAPI from './web/router/login'

const host = process.env.HOST || '127.0.0.1'
const port = process.env.PORT || 3000

const app = express()
const server = Server(app)

async function start() {
  const client_env = process.env['client_env'] === 'true'
  let config = {},
    nuxt = {}

  if (client_env) {
    const config = require('./../nuxt.config.js')
    config.dev = !(process.env.NODE_ENV === 'production')
    nuxt = new Nuxt(config)

    if (config.dev) {
      const builder = new Builder(nuxt)
      await builder.build()
    }
  }

  app.use(morgan('tiny'))
  app.use(bodyParser.urlencoded({ extended: false }))
  app.use(bodyParser.json())

  // Client
  if (!client_env) app.use(express.static(path.join(__dirname + './../dist')))

  app.use('/api', APIs)
  app.use('/login', LoginAPI)

  // Nuxt Router
  if (client_env) app.use(nuxt.render)

  server.listen(port, () => {
    consola.success('Server Running in ' + host + ':' + port)
  })
}

start()
