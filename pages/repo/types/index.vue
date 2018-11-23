<template lang="pug">
  section(style="padding: 2%;")
    .container
      h1.title Explora Tematicas de Interes
      hr
      section.block
        .field.is-grouped.is-fullwidth(style="justify-content: center;")
          p.control.is-expanded
            input.input(type='text', placeholder='Tematicas' v-model="filter")
      .container
        .columns.is-multiline.is-centered
          .column.is-3(v-for="(catalog, index) in filtered" :key='index')
            CardCatalog(:catalog="catalog" @redirectTo="redirectToType")

</template>

<script>
import CardCatalog from './../../../components/CardCatalog.vue'

export default {
  components: {
    CardCatalog
  },
  async asyncData({ app }) {
    const { data: catalog } = await app.$axios.get('/public/catalog/types.json')

    return {
      catalog,
      filtered: catalog
    }
  },
  data() {
    return {
      filter: '',
      filtered: [],
      catalog: []
    }
  },
  watch: {
    filter(_filter, _oldFilter) {
      const oldFilter = _oldFilter.trim().toUpperCase()
      const filter = _filter.trim().toUpperCase()

      if (filter.length === 0) {
        this.filtered = this.catalog
        return
      }

      const flag =
        this.filtered.length === 0 || filter.length < oldFilter.length

      this.filtered = Array.from(flag ? this.catalog : this.filtered).filter(
        ({ value }) => value.toUpperCase().includes(filter)
      )
    }
  },
  methods: {
    redirectToType({ idCatalog }) {
      this.$router.push('/repo/types/' + idCatalog)
    }
  }
}
</script>

<style scoped>
.card.is-catalog {
  height: 450;
}
</style>
