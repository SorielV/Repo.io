<template lang="pug">
  div.Site
    AdminHeader
    section.Site-content
      nuxt
</template>

<script>
import Vuex from 'vuex'
import AdminHeader from './../components/AdminHeader.vue'

export default {
  components: {
    AdminHeader
  },
  created() {
    this.$store.dispatch('loadAuth')
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
