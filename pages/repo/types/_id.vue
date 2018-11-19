<template lang="pug">
  section()
    .type-head
      figure.image(style="max-height: inherit;")
        img(:src="catalog.image || '/public/empty.webp'" style="max-height: inherit;")
        .is-overlay.is-vertical-center(style="background-color: rgba(10, 10, 10, 0.4);")
          .has-text-centered.is-fullwidth.has-text-white
            h1.title.has-text-white {{ catalog.value }}
            p.subtitle.has-text-white {{ catalog.description }}
    .type-boby
      section(style="padding: 2%;")
        .container
          section.block
            .field.is-grouped.is-fullwidth(style="justify-content: center;")
              p.control.is-expanded
                input.input(type='text', placeholder='Lorem ...' v-model="filter")
              p.control
                a.button.is-info
                  | Buscar
          section.has-my-1rem
            .container
              center
                b-dropdown
                  button.button.is-primary(slot='trigger')
                    | Tipos
                    b-icon(icon='menu-down')
                  section.columns.is-multiline(style="padding: 1rem; margin: auto;")
                    .column.is-6(v-for="(catalog, key) in catalog.types" :key="key" style="padding: 0")
                      b-checkbox(:value='catalog.selected' @click='handleSelectType($event, catalog.value)' type="is-danger")
                        | {{ catalog.value }}

                b-dropdown
                  button.button.is-primary(slot='trigger')
                    | Tipos
                    b-icon(icon='menu-down')
                  section.columns.is-multiline(style="padding: 1rem; margin: auto;")
                    .column.is-6(v-for="(catalog, key) in catalog.topics" :key="key" style="padding: 0")
                      b-checkbox(:value='catalog.selected' @click='handleSelectType($event, catalog.value)' type="is-danger")
                        | {{ catalog.value }}

                b-dropdown
                  button.button.is-primary(slot='trigger')
                    | Editoriales
                    b-icon(icon='menu-down')
                  section.columns.is-multiline(style="padding: 1rem; margin: auto;")
                    .column.is-6(v-for="(catalog, key) in catalog.editorials" :key="key" style="padding: 0")
                      b-checkbox(:value='catalog.selected' @click='handleSelectType($event, catalog.value)' type="is-danger")
                        | {{ catalog.value }}
      hr
      .container
        .columns.is-centered(v-if="filtered.length === 0")
          .column.is-12
            section.hero.has-text-centered
              .hero-body
                .container
                  h1.title
                    | Error
                  h2.subtitle
                    | Repositorios no encontrados
                  h2.subtitle(v-if="repositories.length !== 0")
                    | Busqueda: {{ filter }}
                  iframe.container(src="http://wayou.github.io/t-rex-runner/" style="height: 150px")
                  //img(src="https://i.gifer.com/7WOr.gif")
        .columns.is-centered.is-multiline(v-else)
          .column.is-3(v-for="(repo, index) in filtered" :key="index")
            CardRepository(:repository='repo')
      hr
      b-pagination.is-centered(
        v-if="!filter || filter.length === 0"
        :total='pagination.total'
        :current.sync='pagination.page'
        :simple='false'
        :rounded='false'
        :per-page='pagination.offset'
      )
      hr
      pre {{ pagination }}
</template>

<script>
import CardRepository from './../../../components/CardRepository.vue'
export default {
  components: {
    CardRepository
  },
  async asyncData({ app, params: { id } }) {
    try {
      const {
        data: { data: catalog = [] }
      } = await app.$axios.get('/api/catalog/type/' + id)

      return {
        query: {
          type: id
        },
        filtered: [],
        repositories: [],
        catalog
      }
    } catch (err) {
      return {
        err: true
      }
    }
  },
  data() {
    return {
      filter: '',
      pagination: {},
      filtered: [],
      repositories: [],
      catalog: {},
      err: false
    }
  },
  watch: {
    filter(_filter, _oldFilter) {
      const oldFilter = _oldFilter.trim().toUpperCase()
      const filter = _filter.trim().toUpperCase()

      if (filter.length === 0) {
        this.filtered = this.repositories
        return
      }

      const flag =
        this.filtered.length === 0 || filter.length < oldFilter.length

      this.filtered = Array.from(
        flag ? this.repositories : this.filtered
      ).filter(({ title }) => title.toUpperCase().includes(filter))
    },
    async 'pagination.page'(current, old) {
      if (old === undefined || current === undefined) {
        return
      }

      console.log(current, old)
      if (current === old) {
        return
      }

      const query = Object.keys(this.query || {})
        .map(prop => {
          return prop + '=' + this.query[prop]
        })
        .join('&')

      const { limit, offset } = this.pagination
      const url = `/api/repo?page=${current}&limt=${limit}&offset=${offset}&${query}`

      try {
        const {
          data: { data: repositories = [], ...pagination }
        } = await this.$axios.get(url)
        this.repositories = repositories
        this.pagination = pagination
        this.filtered = repositories
        window.scrollTo(0, 0)
      } catch (error) {
        console.error(error)
      }
    }
  },
  async created() {
    const { id: idtype } = this.catalog

    const {
      data: { data: repositories = [], ...pagination }
    } = await this.$axios.get('/api/repo?type=' + idtype)

    this.pagination = pagination
    this.repositories = repositories
    this.filtered = repositories
  }
}
</script>

<style>
.type-head .title {
  font-size: 4.5rem;
}
.type-head .subtitle {
  font-size: 1.4rem;
}
.type-head {
  min-height: 250px;
  max-height: 350px;
}
.is-vertical-center {
  display: flex;
  align-items: center;
}
.is-vertical-center > .is-fullwidth {
  width: 100%;
}
</style>
