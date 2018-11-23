<template lang="pug">
  section.container(style="padding:2%;")
    h1.title Administrar
    hr
    .columns.is-multiline
      .column.is-4
        section.hero
          .hero-body
            nuxt-link.container(to='/admin/users')
              h1.title
                | Usuarios
              h2.subtitle
                | Administra Usuarios

      .column.is-4
        section.hero
          .hero-body
            nuxt-link(to='/admin/repos')
              h1.title
                | Repositorios
              h2.subtitle
                | Administra Repositorios

      .column.is-4
        section.hero
          .hero-body
            nuxt-link(to='/admin/catalog')
              h1.title
                | Catalogos
              h2.subtitle
                | Administra Catalogos

      .column.is-4
        section.hero
          .hero-body
            nuxt-link(to='/admin/community')
              h1.title
                | Comunidad
              h2.subtitle
                | Administra Comunidad
</template>

<script>
export default {
  layout: 'admin'
}
</script>
