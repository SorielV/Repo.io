<template lang="pug">
  section.header
    section
      nav.navbar.is-black.is-fixed-top
        .container
          .navbar-brand
            a.navbar-item(href='/')
              img(src='/public/logo.png', alt='Logo')
            span.navbar-burger.burger(data-target='navbarMenu')
              span
              span
              span
          #navbarMenu.navbar-menu
            .navbar-end
              nuxt-link.navbar-item(to='/')
                | Inicio
              nuxt-link.navbar-item(
                to='/admin'
                v-if="$store.state.isAuth && $store.state.isAdmin"
              ) Dashboard
              nuxt-link.navbar-item(to='/repo')
                | Repositorio
              .navbar-item.has-dropdown.is-hoverable.is-mega
                nuxt-link.navbar-link(to='/repo/topics') Tematicas
                #nav-repo.navbar-dropdown(data-style='width: 18rem;')
                  .container.is-fluid
                    .columns
                      .column
                        nuxt-link.navbar-item(to='/repo/topics/cultura')
                          .navbar-content
                            p Cultura
                        nuxt-link.navbar-item(to='/repo/topics/videojuegos')
                          .navbar-content
                            p Videojuegos
                        nuxt-link.navbar-item(to='/repo/topics/sotfware')
                          .navbar-content
                            p Sotfware

                      .column
                        nuxt-link.navbar-item(to='/repo/topics/javascript')
                          .navbar-content
                            p Javascript
                        nuxt-link.navbar-item(to='/repo/topics/machine')
                          .navbar-content
                            p Machine
                        nuxt-link.navbar-item(to='/repo/topics/programing')
                          .navbar-content
                            p Programing
                        nuxt-link.navbar-item(to='/repo/topics/programing')
                          .navbar-content
                            p Todas

                  hr.navbar-divider
                  .buttons.is-centered
                    button.button.is-info.is-small Ver Todos

              .navbar-item.has-dropdown.is-hoverable.is-mega
                nuxt-link.navbar-link(to='/repo/types') Tipos
                #nav-repo.navbar-dropdown(data-style='width: 18rem;')
                  .container.is-fluid
                    .columns
                      .column
                        nuxt-link.navbar-item(to='/repo/types/cursos')
                          .navbar-content
                            p Cursos
                        nuxt-link.navbar-item(to='/repo/types/videos')
                          .navbar-content
                            p Videos
                        nuxt-link.navbar-item(to='/repo/types/comunidades')
                          .navbar-content
                            p Comunidades

                      .column
                        nuxt-link.navbar-item(to='/repo/types/datasets')
                          .navbar-content
                            p DataSets
                        nuxt-link.navbar-item(to='/repo/types/papers')
                          .navbar-content
                            p Papers
                        nuxt-link.navbar-item(to='/repo/types/books')
                          .navbar-content
                            p Books
                        nuxt-link.navbar-item(to='/repo/types/todos')
                          .navbar-content
                            p.tag.is-danger Todos

                  hr.navbar-divider
                  .buttons.is-centered
                    button.button.is-info.is-small Ver Todos
              
              nuxt-link.navbar-item(to='/repo/authors')
                | Autores
              .navbar-item.has-dropdown.is-hoverable
                nuxt-link.navbar-link(to='/community') Comunidad
                .navbar-dropdown
                  nuxt-link.navbar-item(to='/community/bundle') Bundles
                    span.tag.is-danger.beta-feacture Beta
                  nuxt-link.navbar-item(to='/community/blog') Blog
                    span.tag.is-danger.beta-feacture Beta
                  nuxt-link.navbar-item(to='/community') Cominidades
                    span.tag.is-danger.beta-feacture Beta
                  nuxt-link.navbar-item(to='/community/homework') Tareas
                    span.tag.is-danger.beta-feacture Beta
                  nuxt-link.navbar-item(to='/community/chat') Chat Room
                    span.tag.is-danger.beta-feacture Beta
                  hr.navbar-divider
                  a.navbar-item Pedir Nueva Feacture
              .navbar-item
                input.input.is-rounded(
                  placeholder='Busca repositorios'
                  @keyup.enter="search"
                  v-model="filter"
                )
              .navbar-item
                span.navbar-item(v-if="$store.state.isAuth")
                  b-dropdown(v-model='navigation', position='is-bottom-left')
                    img(:src="$store.state.user.profileImage || 'https://bulma.io/images/placeholders/128x128.png'" width="48" height="48" slot='trigger')
                    b-dropdown-item(custom='')
                      b {{ $store.state.user.username }}
                    hr.dropdown-divider
                    b-dropdown-item(value='settings')
                      b-icon(icon='settings')
                      |                          Settings
                    b-dropdown-item(value='logout')
                      b-icon(icon='logout')
                      |                          Logout
                span.navbar-item(v-else)
                  .buttons
                    nuxt-link(to="/login").button.is-info.is-outlined
                      span(title='Ingresa C:') Ingresa
                    nuxt-link(to="/singup").button.is-danger
                      span.icon
                        i.mdi.mdi-account
                      span(title='Registro C:') Registro
</template>

<script>
export default {
  data() {
    return {
      filter: '',
      navigation: false
    }
  },
  methods: {
    search() {
      if (this.filter.trim()) {
        this.$router.push('/repo?slug=' + this.filter.toLowerCase())
      } else {
        this.$router.push('/repo')
      }
    }
  }
}
</script>

<style scoped>
.beta-feacture {
  margin-right: 1rem;
  margin-left: 1rem;
}
/*
nav.navbar.is-black {
  background: #0a0a0a !important;
}
.nuxt-link-exact-active .nuxt-link-active {
  font-style: italic !important;
}
*/
.is-purple {
  background-color: #4a4090;
  background-image: linear-gradient(to bottom, #4a4090, #372e6c);
}
.navbar-item.is-mega {
  position: static;
}
.navbar-item.is-mega .is-mega-menu-title {
  margin-bottom: 0;
  padding: 0.375rem 1rem;
}
.is-mega > a {
  color: black;
}
/*
#nav-repo {
  background: black;
}

#nav-repo a.navbar-item {
  color: white;
}
.navbar-item.is-mega {
  position: static;
}
.navbar-item.is-mega .is-mega-menu-title {
  margin-bottom: 0;
  padding: 0.375rem 1rem;
}
#background-navbar {
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  display: flex;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  justify-content: center;
  overflow: hidden;
  position: fixed;
  background: rgba(10, 10, 10, 0.86);
}
*/
</style>
