<template lang="pug">
  section
    CatalogView(
      :catalogs="catalog"
      title="Explora Diferentes Recursos"
      @redirectTo="redirectTo"
    )
</template>

<script>
import CatalogView from './../../../components/CatalogView.vue'

export default {
  components: {
    CatalogView
  },
  async asyncData({ app }) {
    const { data: catalog } = await app.$axios.get(
      '/public/catalog/authors.json'
    )

    return {
      catalog,
      filtered: catalog
    }
  },
  data() {
    return {
      view: 'grid',
      catalog: []
    }
  },
  methods: {
    redirectTo({ idCatalog }) {
      this.$router.push('/repo/authors/' + idCatalog)
    }
  }
}
</script>
