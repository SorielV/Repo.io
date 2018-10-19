<template lang="pug">
  section.header
    section.hero.is-black.is-medium.is-bold
      .hero-head
        nav.navbar.is-black.is-fixed-top
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
                .navbar-item.has-dropdown.is-hoverable.is-mega
                  .navbar-link
                    nuxt-link.has-text-white(to='/repo') Repositorios Digitales
                  #nav-repo.navbar-dropdown(data-style='width: 18rem;')
                    .container.is-fluid
                      .columns
                        .column
                          h1.title.is-6.is-mega-menu-title Sub Menu Title
                          a.navbar-item(href='/2017/08/03/list-of-tags/')
                            .navbar-content
                              p
                                small.has-text-info 03 Aug 2017
                              p New feature: list of tags
                          a.navbar-item(href='/2017/08/03/list-of-tags/')
                            .navbar-content
                              p
                                small.has-text-info 03 Aug 2017
                              p New feature: list of tags
                          a.navbar-item(href='/2017/08/03/list-of-tags/')
                            .navbar-content
                              p
                                small.has-text-info 03 Aug 2017
                              p New feature: list of tags
                        .column
                          h1.title.is-6.is-mega-menu-title Sub Menu Title
                          a.navbar-item(href='/2017/08/03/list-of-tags/')
                            .navbar-content
                              p
                                small.has-text-info 03 Aug 2017
                              p New feature: list of tags
                          a.navbar-item(href='/documentation/overview/start/')
                            | Overview
                          a.navbar-item(href='http://bulma.io/documentation/modifiers/syntax/')
                            | Modifiers
                          a.navbar-item(href='http://bulma.io/documentation/columns/basics/')
                            | Columns
                        .column
                          h1.title.is-6.is-mega-menu-title Sub Menu Title
                          a.navbar-item(href='/2017/08/03/list-of-tags/')
                            .navbar-content
                              p
                                small.has-text-info 03 Aug 2017
                              p New feature: list of tags
                          a.navbar-item(href='/2017/08/03/list-of-tags/')
                            .navbar-content
                              p
                                small.has-text-info 03 Aug 2017
                              p New feature: list of tags
                          a.navbar-item(href='/2017/08/03/list-of-tags/')
                            .navbar-content
                              p
                                small.has-text-info 03 Aug 2017
                              p New feature: list of tags
                        .column
                          h1.title.is-6.is-mega-menu-title Sub Menu Title
                          a.navbar-item(href='/documentation/overview/start/')
                            | Overview
                          a.navbar-item(href='http://bulma.io/documentation/modifiers/syntax/')
                            | Modifiers
                          a.navbar-item(href='http://bulma.io/documentation/columns/basics/')
                            | Columns
                          a.navbar-item(href='http://bulma.io/documentation/layout/container/')
                            | Layout
                    hr.navbar-divider
                    .navbar-item
                      .navbar-content
                        .level.is-mobile
                          .level-left
                            .level-item
                              strong Stay up to date!
                          .level-right
                            .level-item
                              a.button.bd-is-rss.is-small(href='http://bulma.io/atom.xml')
                                span.icon.is-small
                                  i.fa.fa-rss
                                span Subscribe
                .navbar-item
                  nuxt-link.has-text-white(to='/homework') Tareas
                .navbar-item
                  nuxt-link.has-text-white(to='/community') Comunidad
                .navbar-item
                  nuxt-link.has-text-white(to='/chat') Chat Room
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
      navigation: false
    }
  }
}
</script>

<style>
nav.navbar.is-black {
  background: #0a0a0a !important;
}
.nuxt-link-exact-active .nuxt-link-active {
  font-style: italic !important;
}
.is-purple {
  background-color: #4a4090;
  background-image: linear-gradient(to bottom, #4a4090, #372e6c);
}
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
</style>
