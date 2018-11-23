<template lang="pug">
  section.container(style="padding:2%;")
    h1.title Administrar Comunidad
    hr
    .columns.is-multiline
      .column.is-4
        section.hero
          .hero-body
            nuxt-link(to='/admin/community/blog')
              h1.title
                | Blog
              h2.subtitle
                | Administra Blogs de La Comunidad

      .column.is-4
        section.hero
          .hero-body
            nuxt-link(to='/admin/community/bundle`')
              h1.title
                | Bundle
              h2.subtitle
                | Administra Bundle de La Comunidad

      .column.is-4
        section.hero
          .hero-body
            nuxt-link(to='/admin/community/communities')
              h1.title
                | Comunidades
              h2.subtitle
                | Administra las Comunidades

      .column.is-4
        section.hero
          .hero-body
            nuxt-link(to='/admin/community/`')
              h1.title
                | Tareas
              h2.subtitle
                | Administra las Tareas de Comunidad

</template>

<script>
export default {
  layout: 'admin'
}
</script>
