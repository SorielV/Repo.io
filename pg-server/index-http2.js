#!/usr/bin/env nodejs

// Uitls
import path from 'path'

// Server
import express from 'express'
// import http2 from 'spdy'
// import SocketIO from 'socket.io'
const host = process.env.HOST || '127.0.0.1'
const port = process.env.PORT || 3000
const app = express()

// Server addons
import cors from 'cors'
import bodyParser from 'body-parser'

// Logger Logs
import consola from 'consola'
import morgan from 'morgan'

// Nuxt [Client]
import { Nuxt, Builder } from 'nuxt'

// Routes, APIs
import { UserApi, Catalog, Repository } from './web/router/api'
import LoginAPI from './web/router/login'

app.use(morgan('tiny'))

/*
const io = SocketIO(server)
require('./socket.io/rooms/repository/repository.room')(io)
*/

const start =
  process.env.SSR === 'true'
    ? async () => {
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

          app.use('/api/user', UserApi)

          for (let catalog in Catalog) {
            app.use(`/api/catalog/${catalog}`, Catalog[catalog])
          }

          app.use('/login', LoginAPI)
          app.use('/api/repo', Repository)
          app.use(nuxt.render)

          app.listen(port, () => {
            consola.success('Server Running in Port ' + port)
          })
        }
      }
    : async () => {
        console.log('HTTP2')

        const fs = require('fs')
        const http2 = require('spdy')

        const ssl_options = {
          key: fs.readFileSync(path.join(__dirname + '/config/https/key.pem')),
          cert: fs.readFileSync(
            path.join(__dirname + '/config/https/certificate.pem')
          )
        }

        // Client Files
        app.use(express.static(path.join(__dirname + './../dist')))

        // Parser
        app.use(bodyParser.urlencoded({ extended: false }))
        app.use(bodyParser.json())

        // Routes
        app.use('/login', LoginAPI)

        // APIs
        app.use('/api/user', UserApi)
        app.use('/api/repo', Repository)
        for (let catalog in Catalog) {
          app.use(`/api/catalog/${catalog}`, Catalog[catalog])
        }

        http2.createServer(ssl_options, app).listen(port, () => {
          consola.success('Server Running in Port ' + port)
        })
      }

start()
