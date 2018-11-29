<template lang="pug">
  section.container(style="padding:2%;")
    h1.title Administrar Catálogos
    hr
    .columns.is-multiline
      .column.is-4
        section.hero
          .hero-body
            nuxt-link(to='/admin/catalog/authors')
              h1.title
                | Autores
              h2.subtitle
                | Administra Catálogo de Autores

      .column.is-4
        section.hero
          .hero-body
            nuxt-link(to='/admin/catalog/types')
              h1.title
                | Tipos
              h2.subtitle
                | Administra Catálogo de Tipos

      .column.is-4
        section.hero
          .hero-body
            nuxt-link(to='/admin/catalog/topics')
              h1.title
                | Tematicas
              h2.subtitle
                | Administra Catálogo de Temas

      .column.is-4
        section.hero
          .hero-body
            nuxt-link(to='/admin/catalog/editorials')
              h1.title
                | Editoriales
              h2.subtitle
                | Administra Catálogo de Editoriales

</template>

<script>
export default {
  layout: 'admin',
  middleware: 'adminAuth'
}
</script>
