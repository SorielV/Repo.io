<template lang="pug">
  section(style="padding: 2%;")
    section.block
      .field.is-grouped.is-fullwidth(style="justify-content: center;")
        p.control.is-expanded
          input.input(type='text', placeholder='Lorem ...'  @keyup.enter="handleFilter" v-model="filter")
        p.control
          button.button.is-info(@click="handleFilter")
            | Buscar
    section
      section
        center
          b-dropdown
            button.button.is-primary(slot='trigger')
              | Tipos
              b-icon(icon='menu-down')
            section.columns.is-multiline(style="padding: 1rem; margin: auto;")
              .column.is-6(v-for="(catalog, key) in catalogs.types" :key="key" style="padding: 0")
                b-checkbox(v-model='catalog.isSelected' @input="handleFilterCatalog(catalog, 0)" type="is-danger")
                  | {{ catalog.value }}

          b-dropdown
            button.button.is-primary(slot='trigger')
              | Temas
              b-icon(icon='menu-down')
            section.columns.is-multiline(style="padding: 1rem; margin: auto;")
              .column.is-6(v-for="(catalog, key) in catalogs.topics" :key="key" style="padding: 0")
                b-checkbox(v-model='catalog.isSelected' @input="handleFilterCatalog(catalog, 1)" type="is-danger")
                  | {{ catalog.value }}

          b-dropdown(:disabled="true")
            button.button.is-primary(slot='trigger')
              | Editoriales
              b-icon(icon='menu-down')
            section.columns.is-multiline(style="padding: 1rem; margin: auto;")
              .column.is-6(v-for="(catalog, key) in catalogs.editorials" :key="key" style="padding: 0")
                b-checkbox(v-model='catalog.isSelected' type="is-danger")
                  | {{ catalog.value }}
      section.has-pt-1rem
        .columns.is-mobile
          .column.has-text-centered
            div(style="margin-top: 0.75rem;")
              span.small Mostrando {{ repositories.length }} [{{ (pagination.page - 1 || 1) * pagination.offset }} a {{ (pagination.page || 1) * pagination.offset }}] de {{ pagination.total }}
          .column.is-narrow
            .buttons
              .button.is-info(@click="view = 'list'")
                i.mdi.mdi-view-list
              .button.is-info(@click="view = 'grid'")
                i.mdi.mdi-view-grid
    hr
    section
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
      .container(v-else)
        .columns.is-multiline.is-centered(v-if="view === 'grid'")
          .column.is-3( v-for="(repo, index) in filtered" :key="index")
            transition-group(name="component-fade" tag="section")
              CardRepository(
                :repository='repo'
                @handleViewRepo="handleViewRepo"
                @handleViewType="handleViewType"
                :key="repo.id"
              )
        .columns.is-multiline.is-centered(v-else)
          .column.is-12(v-for="(repo, index) in filtered" :key="index")
            transition-group(name="component-fade" tag="section")
              ListRepository(:repository='repo' @handleViewRepo="handleViewRepo" :key="repo.id")
    hr
    b-pagination.is-centered(
      v-if="!filter || filter.length === 0"
      :total='pagination.total'
      :current.sync='pagination.page'
      :simple='false'
      :rounded='false'
      :per-page='pagination.offset'
      @change="onPageChanged"
    )
    hr
    pre {{ pagination }}
</template>

<script>
import CardRepository from './../../components/CardRepository.vue'
import ListRepository from './../../components/ListRepository.vue'

function slugify(text) {
  return text
    .toString()
    .toLowerCase()
    .replace(/\s+/g, '-') // Replace spaces with -
    .replace(/[^\w\-]+/g, '') // Remove all non-word chars
    .replace(/\-\-+/g, '-') // Replace multiple - with single -
    .replace(/^-+/, '') // Trim - from start of text
    .replace(/-+$/, '') // Trim - from end of text
}

function parseUrl() {
  return
}

export default {
  components: {
    CardRepository,
    ListRepository
  },
  async asyncData({ app, query }) {
    const params = new URLSearchParams(window.location.search)

    const slug = slugify(query['slug'] || '')
    const types = query['type[]']
      ? Array.isArray(query['type[]'])
        ? query['type[]']
        : [query['type[]']]
      : []

    const topics = query['topic[]']
      ? Array.isArray(query['topic[]'])
        ? query['topic[]']
        : [query['topic[]']]
      : []

    const queryParams = {
      slug,
      types,
      topics
    }

    const queryParam =
      '?' +
      (slug ? 'slug=' + slug : '') +
      (types.length ? '&' + types.map(id => 'type=' + id).join('&') : '') +
      (topics.length ? '&' + topics.map(id => 'topic=' + id).join('&') : '')

    try {
      if (query['slug']) {
        const {
          data: { data: repositories = [], ...pagination }
        } = await app.$axios.get('/api/repo' + queryParam)
        return {
          pagination,
          query: queryParams,
          filter: query['slug'] || '',
          repositories,
          filtered: repositories,
          filter: ''
        }
      } else {
        const {
          data: { data: repositories = [], ...pagination }
        } = await app.$axios.get('/api/repo')
        return {
          pagination,
          query: queryParams,
          repositories,
          filtered: repositories
        }
      }
    } catch (error) {
      console.error(error.message)
      const repositories = []

      return {
        query: queryParams,
        params,
        repositories,
        filtered: repositories
      }
    }
  },
  data() {
    return {
      view: 'grid',
      query: {
        slug: '',
        types: [],
        topics: []
      },
      pagination: {},
      catalogs: {
        types: [],
        topics: [],
        editorials: []
      },
      search: {
        types: [],
        topics: [],
        editorials: []
      },
      filter: '',
      types: [],
      filtered: [],
      repositories: []
    }
  },
  watch: {
    async 'pagination.page'(current, old) {
      if (current === old) {
        return
      }
    },
    types(types) {
      if (types.length === 0) {
        this.filtered = this.repositories
      } else {
        this.filtered = Array.from(this.repositories).filter(({ type }) =>
          type.find(({ id }) => types.indexOf(id) !== -1)
        )
      }
    },
    filter(_filter, _oldFilter) {
      this.setFiltered()
    }
  },
  async created() {
    // fetch
    console.log(this.$route.matched)

    const promises = [
      this.$axios.get('/public/catalog/topics.json'),
      this.$axios.get('/public/catalog/types.json')
    ]

    try {
      const [{ data: topics }, { data: types }] = await Promise.all(promises)

      topics.forEach(topic => {
        topic.isSelected = false
      })

      for (const id of this.query.topics) {
        const index = topics.findIndex(
          ({ idCatalog }) => idCatalog === Number(id)
        )
        if (index !== -1) {
          topics[index].isSelected = true
        }
      }

      types.forEach(type => {
        type.isSelected = false
      })

      for (const id of this.query.types) {
        const index = types.findIndex(
          ({ idCatalog }) => idCatalog === Number(id)
        )
        console.log(index)
        if (index !== -1) {
          console.log(index)
          types[index].isSelected = true
        }
      }

      this.catalogs.types = types
      this.catalogs.topics = topics
    } catch (error) {
      console.error(error)
    }
  },
  methods: {
    async onPageChanged(page) {
      const { limit, offset } = this.pagination
      const options = `page=${current}&limt=${limit}&offset=${offset}`
      const queryParams = this.getQueryParam()
      const url = '/api/repo?' + options + '&' + queryParams

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
    },
    getQueryParam() {
      const baseSlug = (this.query.slug || '').trim().toLowerCase()
      const slug = this.filter.trim().toLowerCase()

      console.log(this.catalogs.types)

      const types = this.catalogs.types.reduce(
        (acc, { idCatalog, isSelected }) => {
          if (isSelected) {
            acc.push(`type[]=${idCatalog}`)
          }
          return acc
        },
        []
      )

      const topics = this.catalogs.topics.reduce(
        (acc, { idCatalog, isSelected }) => {
          if (isSelected) {
            acc.push(`topic[]=${idCatalog}`)
          }
          return acc
        },
        []
      )

      const queryParam =
        '' +
        (slug ? 'slug=' + slug + '&' : '') +
        (types.length ? types.join('&') + '&' : '') +
        (topics.length ? topics.join('&') + '&' : '')

      return queryParam
    },
    setFiltered() {
      const data = this.repositories
      const filter = slugify(this.filter || '')

      const types = this.catalogs.types.reduce(
        (acc, { idCatalog, isSelected }) => {
          if (isSelected) {
            acc.push(idCatalog)
          }
          return acc
        },
        []
      )

      const topics = this.catalogs.topics.reduce(
        (acc, { idCatalog, isSelected }) => {
          if (isSelected) {
            acc.push(idCatalog)
          }
          return acc
        },
        []
      )

      this.filtered = data.filter(({ slug, type, topic }) => {
        if (filter.length > 0 && (slug || '').length > 0) {
          if (!slug.includes(filter)) {
            return false
          }
        }

        if (types.length > 0) {
          if (type.length > 0) {
            for (const idCatalog of types) {
              if (!type.find(({ id }) => idCatalog === id)) {
                console.warn('Exit Type')
                return false
              }
            }
          } else {
            return false
          }
        }

        if (topics.length > 0) {
          if (topic.length > 0) {
            for (const idCatalog of topics) {
              if (!topic.find(({ id }) => idCatalog === id)) {
                console.warn('Exit Topic')
                return false
              }
            }
          } else {
            return false
          }
        }

        return true
      })
    },
    async handleFilterCatalog({ isSelected, idCatalog }, catalog) {
      if (isSelected) {
        const key = catalog ? 'topic' : 'type'
        this.filtered = Array.from(this.filtered).filter(
          ({ [key]: catalog }) => {
            console.log(catalog)
            return catalog.findIndex(({ id }) => id === idCatalog) !== -1
          }
        )
      } else {
        this.setFiltered()
      }
    },
    // Reciclable
    async handleFilter() {
      const baseSlug = this.query.slug
      const slug = slugify(this.filter || '')

      const topics = this.catalogs.topics.reduce(
        (acc, { idCatalog, isSelected }) => {
          if (isSelected) {
            acc.push(idCatalog)
          }
          return acc
        },
        []
      )
      topics.sort()

      const newTopics = this.query.topics.every(
        item => topics.indexOf(item) !== 1
      )

      const types = this.catalogs.types.reduce(
        (acc, { idCatalog, isSelected }) => {
          if (isSelected) {
            acc.push(idCatalog)
          }
          return acc
        },
        []
      )
      types.sort()

      const newTypes = this.query.topics.every(
        item => topics.indexOf(item) !== 1
      )

      const qTypes = types.map(idCatalog => `type[]=${idCatalog}`)
      const qTopics = topics.map(idCatalog => `topic[]=${idCatalog}`)

      // Cambio Visual [Compartir Link de Contenido]
      if (slug !== baseSlug || newTopics || newTypes) {
        const [topicParam, typeParam] = [
          topics.length ? qTopics.join('&') : '',
          types.length ? qTypes.join('&') : ''
        ]

        console.log(topicParam, typeParam)
        const slugParam = slug ? 'slug=' + slug : ''

        const url =
          slugParam + topicParam ||
          '&' + topicParam + typeParam ||
          '&' + typeParam

        const windowUrl = `/repo?` + url

        const {
          data: { data: repositories = [], ...pagination }
        } = await this.$axios.get('/api/repo?' + url)

        this.query.slug = slug
        this.query.topics = topics
        this.query.types = types
        this.repositories = repositories
        this.pagination = pagination
        this.filtered = repositories
        window.history.pushState(undefined, 'Repo', windowUrl)
        window.scrollTo(0, 0)
      }
    },
    handleViewRepo({ id }) {
      this.$router.push('/repo/' + id)
    },
    handleViewType({ id }) {
      this.$router.push('/repo/types/' + id)
    }
  }
}
</script>

<style>
.dropdown-menu {
  min-width: 450px !important;
}
</style>

<style scoped>
.has-my-1rem {
  margin-top: 1rem;
  margin-bottom: 1rem;
}
.has-py-1rem {
  padding-top: 1rem;
  padding-bottom: 1rem;
}
.title {
  font-size: 1.5rem;
}

.card-title {
  margin-bottom: 0.75rem;
}

.card-subtitle {
  margin-top: -0.375rem;
  margin-bottom: 0;
}

.card-text:last-child {
  margin-bottom: 0;
}

.card-link:hover {
  text-decoration: none;
}

.card-link + .card-link {
  margin-left: 1.25rem;
}

.card-header {
  padding: 0.75rem 1.25rem;
  margin-bottom: 0;
  background-color: rgba(0, 0, 0, 0.03);
  border-bottom: 1px solid rgba(0, 0, 0, 0.125);
}

.card-header:first-child {
  border-radius: calc(0.25rem - 1px) calc(0.25rem - 1px) 0 0;
}

.card-header + .list-group .list-group-item:first-child {
  border-top: 0;
}

.card-footer {
  padding: 0.75rem 1.25rem;
  background-color: rgba(0, 0, 0, 0.03);
  border-top: 1px solid rgba(0, 0, 0, 0.125);
}

.card-footer:last-child {
  border-radius: 0 0 calc(0.25rem - 1px) calc(0.25rem - 1px);
}

.component-fade-enter,
.component-fade-leave-to
/* .component-fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}
.has-pt-1rem {
  margin-top: 1rem;
}
/* List */
@media only screen and (max-width: 768px) {
  .is-256x246 {
    height: 128px !important;
    width: 128px !important;
  }
}
.is-256x246 {
  height: 256px;
  width: 256px;
}
.card.is-horizontal {
  display: flex;
}
.card.is-horizontal .card-image {
  width: auto;
  height: 100%;
}
.card.is-horizontal .card-stacked {
  flex-direction: column;
  flex: 1 1 auto;
  display: flex;
  position: relative;
}
.card.is-horizontal .card-stacked .card-content {
  flex-grow: 1;
}
</style>
