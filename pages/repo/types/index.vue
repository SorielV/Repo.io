<template lang="pug">
  section(style="padding: 2%;")
    div.container
      h1.title Explora Tematicas de Interes
      hr
      .container
        .columns.is-multiline.is-centered
          .column.is-4(v-for="(catalog, index) in catalog" :key='index')
            .card
              header.card-header
                p.card-header-title
                  | {{ catalog.value }}
                a.card-header-icon(href='#', aria-label='more options')
                  span.icon
                    i.mdi.mdi-facebook(aria-hidden='true')
              .card-content
                figure.image(@click="redirectToType(catalog)")
                  img(:src="catalog.image || '/public/empty.webp'")
              footer.card-footer

</template>

<script>
export default {
  async asyncData({ app }) {
    const { data: catalog } = await app.$axios.get(
      '/public/catalog/topics.json'
    )

    return {
      catalog
    }
  },
  data() {
    return {
      catalog: []
    }
  },
  methods: {
    redirectToType({ idCatalog }) {
      this.$router.push('/repo/types/' + idCatalog)
    }
  }
}
</script>
