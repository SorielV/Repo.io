<template lang="pug">
  section.header
    section
      nav.navbar.is-black.is-fixed-top
        .container
          .navbar-brand
            a.navbar-item(href='../')
              img(src='/public/logo.png', alt='Logo')
            span.navbar-burger.burger(data-target='navbarMenu')
              span
              span
              span
          #navbarMenu.navbar-menu
            .navbar-end
              .navbar-item
                nuxt-link.has-text-white(to='/') Inicio
              .navbar-item
                nuxt-link.has-text-white(to='/admin') Dashboard
              .navbar-item
                nuxt-link.has-text-white(to='/admin/users') Usuarios
              .navbar-item
                nuxt-link.has-text-white(to='/admin/repos') Repositorios
              .navbar-item.has-dropdown.is-hoverable
                  a.navbar-link
                    nuxt-link.has-text-white(to='/admin/catalog') Catalogos
                  .navbar-dropdown
                    nuxt-link.navbar-item(to='/admin/catalog/authors') Autores
                    nuxt-link.navbar-item(to='/admin/catalog/types') Tipos
                    nuxt-link.navbar-item(to='/admin/catalog/topics') Tematicas
                    nuxt-link.navbar-item(to='/admin/catalog/editorials') Editoriales

              .navbar-item
                span.navbar-item(v-if="$store.state.isAuth")
                  b-dropdown(v-model='navigation', position='is-bottom-left')
                    img(:src="$store.state.user.profileImage || 'https://bulma.io/images/placeholders/128x128.png'" width="48" height="48" slot='trigger')
                    b-dropdown-item(custom='')
                      | Logged as 
                      b Rafael Beraldo
                    hr.dropdown-divider
                    b-dropdown-item(value='settings')
                      b-icon(icon='settings')
                      |                         Settings
                    b-dropdown-item(value='logout')
                      b-icon(icon='logout')
                      |                         Logout
</template>

<script>
export default {
  data() {
    return {
      navigation: false
    }
  }
}
</script>

<style lang="css" scoped>
/*
.navbar.is-danger {
  background-color: #000 !important;
}
.nuxt-link-exact-active .nuxt-link-active {
  font-style: italic !important;
}
*/
.is-purple {
  background-color: #4a4090;
  background-image: linear-gradient(to bottom, #4a4090, #372e6c);
}
</style>
