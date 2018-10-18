<template lang="pug">
  section.header
    section.hero.is-danger.is-medium.is-bold
      .hero-head
        nav.navbar
          .container
            .navbar-brand
              a.navbar-item(href='../')
                img(src='http://bulma.io/images/bulma-type-white.png', alt='Logo')
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
                .navbar-item
                  nuxt-link.has-text-white(to='/admin/authors') Autores
                .navbar-item
                  b-dropdown
                    button.button.is-danger(slot='trigger')
                      span Catalogos
                      b-icon(icon='menu-down')
                    b-dropdown-item
                      nuxt-link.has-text-black(to='/admin/catalog/types') Tipos De Repositorios
                    b-dropdown-item
                      nuxt-link.has-text-black(to='/admin/catalog/topics') Temas
                .navbar-item(v-if="$store.state.isAuth")
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

<style>
.nuxt-link-exact-active .nuxt-link-active {
  font-style: italic !important;
}
.is-purple {
  background-color: #4a4090;
  background-image: linear-gradient(to bottom, #4a4090, #372e6c);
}
</style>
