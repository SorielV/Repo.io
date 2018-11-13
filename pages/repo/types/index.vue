<template lang="pug">
  section(style="padding: 2%;")
    div.container
      h1.title Explora Diferentes Recursos
      hr
      .container
        .columns.is-multiline.is-centered
          .column(v-for="(catalog, index) in catalog" :key='index')
            pre {{ catalog }}
</template>

<script>
export default {
  data() {
    return {
      catalog: []
    }
  },
  created() {
    for (let i = 0; i < 25; i++) {
      this.catalog.push({
        id: i,
        value: String.fromCharCode(i * 11),
        image: '',
        description: String.fromCharCode(i * 10)
      })
    }
  }
}
</script>
