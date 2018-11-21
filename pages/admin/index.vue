<template lang="pug">
  section.container
    p Administrador Index [En Progreso]
    ul
      li
        nuxt-link(to='/admin') Dashboard
      li
        nuxt-link(to='/admin/users') Usuarios
      li
        nuxt-link(to='/admin/repos') Repositorios
      li.has-dropdown.is-hoverable
      li
        nuxt-link(to='/admin/catalog') Catalogos
</template>

<script>
export default {
  layout: 'admin'
}
</script>
