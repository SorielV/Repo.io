import express from 'express'

// Nuxt Config
import consola from 'consola'
import { Nuxt, Builder } from 'nuxt'
let config = require('./../nuxt.config.js')

const host = process.env.HOST || '127.0.0.1'
const port = process.env.PORT || 4000
const app = express()

// Inciar servidor 
async function start() {
  // Init Nuxt.js
  const nuxt = new Nuxt(config)

  // Build only in dev mode
  if (config.dev) {
    const builder = new Builder(nuxt)
    await builder.build()
  }
  console.log(nuxt.render)

  // Give nuxt middleware to express
  app.use(nuxt.render)

  // Listen the server
  app.listen(port, host)
  consola.ready({
    message: `Server listening on http://${host}:${port}`,
    badge: true
  })
}
start()

/**
import express from 'express'
import jwt from 'jsonwebtoken'
import jwtConfig from './config/jwt.json'
import bodyParser from 'body-parser'
import cors from 'cors'
import UserRouter from './routes/api/User'
import RepoRouter from './routes/api/Repo'

// Nuxt Config
import consola from 'consola'
import { Nuxt, Builder } from 'nuxt'
let config = require('../nuxt.config.js')

const host = process.env.HOST || '127.0.0.1'
const port = process.env.PORT || 3000
const app = express()

// Allow Cross Origin
app.use(cors())
// parse application/json
app.use(bodyParser.json())
// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

app.use('/api/user', UserRouter)
app.use('/api/repo', RepoRouter)

app.get('/token', (req, res) => {
  const token = jwt.sign({ id: 1, name: 'Nyan Cat', username:'NyanCat' }, jwtConfig.secret, { expiresIn: jwtConfig.tokenLife})
  return res.status(200).json({ token })
})

// Inciar servidor 
async function start() {
  // Init Nuxt.js
  const nuxt = new Nuxt(config)

  // Build only in dev mode
  if (config.dev) {
    const builder = new Builder(nuxt)
    await builder.build()
  }

  // Give nuxt middleware to express
  app.use(nuxt.render)

  // Listen the server
  app.listen(port, host)
  consola.ready({
    message: `Server listening on http://${host}:${port}`,
    badge: true
  })
}
start()

 */