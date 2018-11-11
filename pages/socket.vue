<template lang="pug">
  div.container(style="margin-top: 150px;")
    .field
      label.label
        | Room
      .control
      input.input(type='text' v-model='room')
    .buttons
      button.button.is-danger(@click="join") Join in to Room
      button.button.is-info(readonly="true") {{ socket.connected ? 'Connected' : 'Disconnected' }}
</template>

<script>
import io from 'socket.io-client'

export default {
  data() {
    return {
      room: '/repository/1',
      socket: null
    }
  },
  created() {
    this.socket = io.connect('localhost:3000')
  },
  methods: {
    join() {
      this.socket.emit('repository', this.room)
    },
    getStatus() {}
  }
}
</script>
