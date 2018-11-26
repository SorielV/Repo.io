<template lang="pug">
  div.Site
    AdminHeader
    section.Site-content
      nuxt
    Footer
</template>

<script>
import Vuex from 'vuex'
import AdminHeader from './../components/AdminHeader.vue'
import Footer from './../components/Footer.vue'

export default {
  components: {
    AdminHeader,
    Footer
  },
  middleware: 'adminAuth',
  mounted() {
    const $navbarBurgers = Array.prototype.slice.call(
      document.querySelectorAll('.navbar-burger'),
      0
    )

    if ($navbarBurgers.length > 0) {
      $navbarBurgers.forEach(el => {
        el.addEventListener('click', () => {
          const target = el.dataset.target
          const $target = document.getElementById(target)
          el.classList.toggle('is-active')
          $target.classList.toggle('is-active')
        })
      })
    }
  },
  head: {
    bodyAttrs: {
      class: 'has-navbar-fixed-top'
    }
  }
}
</script>

<style>
.Site {
  display: flex;
  min-height: 100vh;
  flex-direction: column;
}

.Site-content {
  flex: 1;
}
</style>
