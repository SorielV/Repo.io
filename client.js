import express from 'express'
// Nuxt Configuration
import consola from 'consola'
import { Nuxt, Builder } from 'nuxt'

const app = express()
const host = process.env.HOST || '127.0.0.1'
const port = process.env.PORT || 3000

app.set('port', port)

// Import and Set Nuxt.js options
let config = require('./nuxt.config.js')
config.dev = !(process.env.NODE_ENV === 'production')

async function start() {
  // Init Nuxt.js
  const nuxt = new Nuxt(config)

  // Build only in dev mode
  if (config.dev) {
    const builder = new Builder(nuxt)
    await builder.build()
  }
  app.use(nuxt.render)

  // Listen the server
  app.listen(port, host)
  consola.ready({
    message: `Client listening on http://${host}:${port}`,
    badge: true
  })

  consola.ready({
    message: `Server should listening on ${process.env.API_URL}`,
    badge: true
  })
}

start()