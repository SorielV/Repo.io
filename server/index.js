
import express from 'express'
import bodyParser from 'body-parser'
import UserRouter from './routes/api/User'
import RepoRouter from './routes/api/Repo'
import LoginRouter from './routes/api/Login'

// Nuxt Configuration
import consola from 'consola'
import { Nuxt, Builder } from 'nuxt'

const app = express()
const host = process.env.HOST || '127.0.0.1'
const port = process.env.PORT || 3000

app.set('port', port)

// Import and Set Nuxt.js options
let config = require('../nuxt.config.js')
config.dev = !(process.env.NODE_ENV === 'production')

async function start() {
  // Init Nuxt.js
  const nuxt = new Nuxt(config)

  // Build only in dev mode
  if (config.dev) {
    const builder = new Builder(nuxt)
    await builder.build()
  }

  // Give nuxt middleware to express
  // parse application/json
  app.use(bodyParser.json())
  // parse application/x-www-form-urlencoded
  app.use(bodyParser.urlencoded({ extended: false }))
  app.use(LoginRouter)
  app.use('/api/user', UserRouter)
  app.use('/api/user', UserRouter)
  app.use('/api/repo', RepoRouter)
  app.use(nuxt.render)
  
  // Listen the server
  app.listen(port, host)
  consola.ready({
    message: `Server listening on http://${host}:${port}`,
    badge: true
  })
}
start()
