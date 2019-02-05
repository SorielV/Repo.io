import { EventEmitter } from 'events'
import url from 'url'

const ev = new EventEmitter()
const rooms = []

const router = {
  repository: /repository\/(\d+)/
}

module.exports = io => {
  console.log('Socket Listening')
  io.sockets.on('connection', socket => {
    socket.on('repository', room => {
      if (room.match(router['repository'])) {
        socket.join(room)
        if (rooms.indexOf(room) === -1) {
          rooms.push(room)
          console.log('Room Created: ' + room)
        }
      }
    })

    socket.on('newComment', data => {})
  })
}

// Dinamic Namespace
/*
import { EventEmitter } from 'events'
import url from 'url'

const ev = new EventEmitter()
const namespaces = {}

const router = {
  repository: /repository\/(\d+)/
}

module.exports = io => {
  console.log('Socket Listening')
  io.sockets.on('connection', socket => {
    console.log(socket.handshake.url)
    const { ns: nsroom = '' } = url.parse(socket.handshake.url, true).query

    if (nsroom.match(router['repository'])) {
      if (!namespaces.hasOwnProperty(nsroom)) {
        console.log(nsroom, namespaces)
        io.of(nsroom).on('connection', socket => {
          console.log(socket)
          ev.emit('socket.repository.connection', nsroom, socket)
        })
      }
    } else {
      socket.disconnect()
      console.log('Room no match')
    }
  })
}

ev.on('socket.repository.connection', (room, socket) => {
  console.log('Connection established room: ' + room)
  console.warn(socket)
})
*/
