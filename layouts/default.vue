<template lang="pug">
  div.Site
    Header
    section.Site-content
      nuxt
    Footer
</template>

<script>
import Vuex from 'vuex'
import Header from './../components/Header.vue'
import Footer from './../components/Footer.vue'

export default {
  components: {
    Header,
    Footer
  },
  head: {
    bodyAttrs: {
      class: 'has-navbar-fixed-top'
    }
  },
  data() {
    return {
      items: [
        { title: 'Home', icon: 'home', to: { name: 'index' } },
        { title: 'Inspire', icon: 'lightbulb', to: { name: 'inspire' } }
      ]
    }
  },
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
  created() {
    this.$store.dispatch('loadAuth')
  }
}
</script>

<style>
html,
body {
  height: 100%;
}
.Site {
  display: flex;
  min-height: 100vh;
  flex-direction: column;
}

.Site-content {
  flex: 1;
}
</style>
