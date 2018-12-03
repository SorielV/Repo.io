<template lang="pug">
  section
    section.hero.is-medium.is-dark
      .hero-body
        .container
          p.title {{ title }}
          p.subtitle {{ text }}
    section.container(style="padding: 1rem 1.5rem;")
      section.block
        .field.is-grouped.is-fullwidth(style="justify-content: center;")
          p.control.is-expanded
            input.input(type='text', placeholder='Tematicas' v-model="filter")
          p.control
            .buttons.is-right
              .button.is-info(@click="view = 'list'")
                i.mdi.mdi-view-list
              .button.is-info(@click="view = 'grid'")
                i.mdi.mdi-view-grid

      .container
        .columns.is-multiline(v-if="view === 'grid'")
          .column(v-for="(catalog, index) in filtered" :key='index')
            transition-group(name="component-fade" tag="section")
              CardCatalog(:catalog="catalog" @redirectTo="redirectTo" :key='index')
        .columns.is-multiline(v-else)
          .column.is-12(v-for="(catalog, index) in filtered")
            transition-group(name="component-fade" tag="section")
              ListCatalog(:catalog="catalog" @redirectTo="redirectTo" :key='index')
</template>

<script>
import CardCatalog from './CardCatalog.vue'
import ListCatalog from './ListCatalog.vue'

export default {
  components: {
    CardCatalog,
    ListCatalog
  },
  props: {
    catalogs: {
      type: Array,
      required: true
    },
    title: {
      type: String,
      require: false,
      default() {
        return 'Catalogo'
      }
    },
    text: {
      type: String,
      require: false,
      default() {
        return ''
      }
    }
  },
  data() {
    return {
      view: 'grid',
      filter: '',
      filtered: []
    }
  },
  watch: {
    filter(_filter, _oldFilter) {
      const oldFilter = _oldFilter.trim().toUpperCase()
      const filter = _filter.trim().toUpperCase()

      if (filter.length === 0) {
        this.filtered = this.catalogs
        return
      }

      const flag =
        this.filtered.length === 0 || filter.length < oldFilter.length

      this.filtered = Array.from(flag ? this.catalogs : this.filtered).filter(
        ({ value }) => value.toUpperCase().includes(filter)
      )
    },
    catalog(catalog) {
      thos.filtered = this.catalogs
    }
  },
  created() {
    this.filtered = this.catalogs
  },
  methods: {
    redirectTo(catalog) {
      this.$emit('redirectTo', catalog)
    }
  }
}
</script>

<style scoped>
</style>
