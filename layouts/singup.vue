<template lang="pug">
  section.login
    #flow
      span.flow-1
      span.flow-2
      span.flow-3
    section.hero.is-white.is-fullheight
      .hero-body
        .container.has-text-centered
          .column.is-4.is-offset-4
            h3.title.has-text-black Registrate
            p.subtitle.has-text-black Estas listo para el Conocimieto
            .box
              figure.avatar
                img(src='https://placehold.it/128x128' v-model="user.profileImage")
              form(v-on:submit.prevent="handleSubmit")
                .field
                  .control
                    input.input(type='text', placeholder='Usuario', autofocus='' v-model="user.username"
                    required='true'
                  )

                b-field
                  .control(style="margin-right: 0.5rem;")
                    input.input(type='text', placeholder='Nombre(s)' v-model="user.firstName"
                    required='true')
                  .control
                    input.input(type='text', placeholder='Apellidos' v-model="user.lastName"
                    required='true')

                //-.field
                  b-datepicker(
                    placeholder='Fecha de Nacimiento'
                    icon="calendar-today"
                    v-model="user.birthDate"
                    required='true')
                .field
                  .control
                    input.input(type='email', placeholder='Correo Electronico' v-model="user.email"
                    required='true')
                .field
                  .control
                    input.input(type='password', placeholder='Contraseña' v-model="user.password" required="true")
                button.button.is-block.is-danger.is-fullwidth(type="submit") Registrarme
            p.has-text-grey
              |Ya tienes cuenta?, 
              a(href='../') Inicia Sesión
              |   · 
              a(href='../') Necesitas Ayuda?
    script(async='', type='text/javascript', src='../js/bulma.js')
              
</template>

<script>
export default {
  head() {
    return {
      title: 'Registro'
    }
  },
  data() {
    return {
      user: {
        username: '',
        firstName: '',
        lastName: '',
        birthDate: null,
        email: '',
        profileImage: '',
        password: ''
      }
    }
  },
  methods: {
    handleSubmit() {
      const form = new FormData()
      for (const key in this.user) {
        form.append(key, this.user[key])
      }

      this.$axios
        .post('/api/user', form)
        .then(console.log)
        .catch(console.error)
    }
  }
}
</script>

<style>
#flow span {
  display: block;
  width: 200vw;
  height: 200vw;
  position: absolute;
  top: -180vw;
  left: -50vw;
  border-radius: 90vw;
  opacity: 0.6;
}
.flow-1 {
  background: #191717;
  -webkit-animation: rotating 20s linear infinite;
  -moz-animation: rotating 20s linear infinite;
  -ms-animation: rotating 20s linear infinite;
  -o-animation: rotating 20s linear infinite;
  animation: rotating 20s linear infinite;
}

.flow-2 {
  background: #0f91e2;
  position: absolute;
  -webkit-animation: rotating 15s linear infinite;
  -moz-animation: rotating 15s linear infinite;
  -ms-animation: rotating 15s linear infinite;
  -o-animation: rotating 15s linear infinite;
  animation: rotating 15s linear infinite;
}

.flow-3 {
  background: #a721dc;
  position: absolute;
  -webkit-animation: rotating 7s linear infinite;
  -moz-animation: rotating 7s linear infinite;
  -ms-animation: rotating 7s linear infinite;
  -o-animation: rotating 7s linear infinite;
  animation: rotating 7s linear infinite;
}

@-webkit-keyframes rotating {
  from {
    -ms-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
    -webkit-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    transform: rotate(0deg);
  }

  to {
    -ms-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
    -webkit-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}

@keyframes rotating {
  from {
    -ms-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
    -webkit-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    transform: rotate(0deg);
  }

  to {
    -ms-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
    -webkit-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}
.rotating {
  -webkit-animation: rotating 2s linear infinite;
  -moz-animation: rotating 2s linear infinite;
  -ms-animation: rotating 2s linear infinite;
  -o-animation: rotating 2s linear infinite;
  animation: rotating 2s linear infinite;
}

.login {
  background-color: #4a4090;
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
</style>
