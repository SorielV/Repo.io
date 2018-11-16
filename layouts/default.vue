<template lang="pug">
  div.Site
    Header
    section.Site-content
      nuxt
</template>

<script>
import Vuex from 'vuex'
import Header from './../components/Header.vue'

export default {
  components: {
    Header
  },
  data() {
    return {
      items: [
        { title: 'Home', icon: 'home', to: { name: 'index' } },
        { title: 'Inspire', icon: 'lightbulb', to: { name: 'inspire' } }
      ]
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
