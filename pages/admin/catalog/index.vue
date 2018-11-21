<template lang="pug">
  section.container
    | Admin Catalogos
    ul
      li
        nuxt-link(to='/admin/catalog/authors') Autores
      li
        nuxt-link(to='/admin/catalog/types') Tipos
      li
        nuxt-link(to='/admin/catalog/topics') Tematicas
      li
        nuxt-link(to='/admin/catalog/editorials') Editoriales
</template>

<script>
export default {
  layout: 'admin'
}
</script>
