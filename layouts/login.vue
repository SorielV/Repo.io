<template lang="pug">
  section.login
    section.hero.is-black.is-fullheight
      .hero-body
        .container.has-text-centered
          .column.is-4.is-offset-4
            h3.title.has-text-white Iniciar Sesión
            p.subtitle.has-text-white Logeate en Repo-io para Acceder
            .box
              figure.avatar
                img(src='https://placehold.it/128x128')
              form
                .field
                  .control
                    input.input.is-medium(type='email', placeholder='Your Email', autofocus='')
                .field
                  .control
                    input.input.is-medium(type='password', placeholder='Your Password')
                .field
                  label.checkbox
                    input(type='checkbox')
                    | Recuerdame
                button.button.is-block.is-warning.is-large.is-fullwidth Iniciar
            p.has-text-grey
              a(href='../') Registrate
              |   · 
              a(href='../') Olvidaste tu contraceña
              |   · 
              a(href='../') Ayuda?
    script(async='', type='text/javascript', src='../js/bulma.js')
              
</template>

<script>
import Vuex from 'vuex'

export default {
  head() {
    return {
      title: 'Login'
    }
  },
  data() {
    return {
      user: {
        username: '',
        password: ''
      }
    }
  },
  methods: {
    async handleSubmit() {
      try {
        await this.$store.dispatch('login', this.user)
        this.$router.push('/')
      } catch (error) {
        const {
          response: {
            data: { message = null }
          }
        } = error

        this.$snackbar.open({
          message: message || error.message,
          type: 'is-danger',
          position: 'is-top',
          actionText: 'Okay',
          indefinite: true
        })
        console.error(error)
      }
    }
  }
}
</script>

<style>
html,
body,
#__layout,
#__nuxt {
  height: 100%;
}

.login {
  background-color: white;
  background-image: -webkit-linear-gradient(top, #4a4090, #372e6c);
  background-image: linear-gradient(to bottom, #4a4090, #372e6c);
  width: 100%;
  height: 100%;
}

.login-from {
  border-radius: 0.25rem;
  padding: 1%;
  background-color: white;
  margin: auto;
  width: 450px;
}

.login-from-content {
  padding: 5%;
}

.something-semantic {
  height: 100%;
  display: table;
  width: 100%;
}
.something-else-semantic {
  display: table-cell;
  text-align: center;
  vertical-align: middle;
}
</style>
