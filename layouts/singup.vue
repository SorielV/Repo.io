<template lang="pug">
  section.login
    .something-semantic
      .something-else-semantic
        section.login-from
          section.login-from-content
            form(
              v-on:submit.prevent="handleSubmit"
            )
              h1.title Registrese
              div(
                style="display: block; text-align: -webkit-center; margin: 1rem"
              )
                figure.image.is-128x128
                  img(src="http://cdn.onlinewebfonts.com/svg/img_210318.png")
                  nuxt-link(to='/') selecciona
              .field
                .control
                <br>
                  input.input(
                    type="text"
                    placeholder="Usuario"
                    v-model="user.username"
                  )
              .field
                .control
                  b-input(
                    type="password"
                    placeholder="Password"
                    password-reveal
                    v-model="user.password"
                  )
              .field
                .control
                  input.input(
                    type="email"
                    placeholder="Email"
                    v-model="user.email"
                  )
              .field
                .control
                  input.input(
                    type="text"
                    placeholder="Nombre"
                    v-model="user.firstName"
                  )
              .field
                .control
                  input.input(
                    type="text"
                    placeholder="Apellido"
                    v-model="user.lastName"
                  )
              .field
                .control
                  b-datepicker(
                    placeholder="Fecha Nacimiento"
                    icon="calendar-today"
                    v-model="user.birthDate"
                    position="is-top-right"
                  )
              button.button.is-danger.is-outlined.is-rounded Registrarse
              section.login-others
              <br>
                a(href='') 
                  img(src="https://i0.wp.com/umap.org/wp-content/uploads/2017/06/Universidad-de-Colima.png?fit=1069%2C1065" width='50px')
                a(href='')
                  img(src="http://www.stickpng.com/assets/images/5a951939c4ffc33e8c148af2.png" width='50px')
              section.has-text-left
                nuxt-link(to='/') Inicio
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
      alert('Proximamente :D')
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
