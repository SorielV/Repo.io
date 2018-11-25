#!/usr/bin/env nodejs

import consola from 'consola'
import path from 'path'
import express from 'express'
import { Server } from 'http'
// import https from 'https'
// import SocketIO from 'socket.io'
import morgan from 'morgan'

import cors from 'cors'
import bodyParser from 'body-parser'
import { Nuxt, Builder } from 'nuxt'
import APIs from './web/router/api'
import LoginAPI from './web/router/login'

const host = process.env.HOST || '127.0.0.1'
const port = process.env.PORT || 3000

const corsOptions = {
  origin: 'http://localhost:8080',
  optionsSuccessStatus: 200
}

const app = express()
/// const ssl_options = {}

app.use(morgan('tiny'))
app.use('*', cors(corsOptions))

const httpServer = Server(app)
// const httpsServer = https.createServer(ssl_options, app)

if (process.env.NUXT === 'true') {
  const config = require('../nuxt.config')
  config.dev = !(process.env.NODE_ENV === 'production')

  async function start() {
    const nuxt = new Nuxt(config)

    // Build only in dev mode
    if (config.dev) {
      const builder = new Builder(nuxt)
      await builder.build()
    }

    // app.use(cors)
    // parse application/x-www-form-urlencoded
    app.use(bodyParser.urlencoded({ extended: false }))

    // parse application/json
    app.use(bodyParser.json())

    app.use('/api', APIs)
    app.use('/login', LoginAPI)
    app.use(nuxt.render)

    httpServer.listen(8081, () => {
      consola.success('Server HTTP Running in Port ' + 8081)
    })
  }

  start()
} else {
  async function start() {
    console.log('Server Only')

    app.use(express.static(path.join(__dirname + './../dist')))
    console.log(path.join(__dirname + './../dist'))

    // parse application/x-www-form-urlencoded
    app.use(bodyParser.urlencoded({ extended: false }))

    // parse application/json
    app.use(bodyParser.json())

    app.use('/api', APIs)
    app.use('/login', LoginAPI)

    httpServer.listen(8081, () => {
      consola.success('Server HTTP Running in Port ' + 8081)
    })
  }
  start()
}
