<template lang="pug">
  section.header
    section.hero.is-black.is-medium.is-bold
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
                .tabs.is-right
                  ul
                    li
                      nuxt-link(to='/') Inicio
                    li
                      nuxt-link(to='/repo') Repositorios Digitales
                    li
                      nuxt-link(to='/homework') Tareas
                    li
                      nuxt-link(to='/community') Comunidad
                    li
                      nuxt-link(to='/chat') Chat Room
                  span.navbar-item
                    .buttons
                      nuxt-link(to="/login").button.is-info.is-outlined
                        span(title='Ingresa C:') Ingresa
                      nuxt-link(to="/singup").button.is-danger
                        span.icon
                          i.mdi.mdi-account
                        span(title='Registro C:') Registro
</template>

<style>
.nuxt-link-exact-active .nuxt-link-active {
  font-style: italic !important;
}

.is-purple {
  background-color: #4a4090;
  background-image: linear-gradient(to bottom, #4a4090, #372e6c);
}
</style>
