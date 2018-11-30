<template lang="pug">
  section
    .type-head
      figure.image(style="max-height: inherit;")
        img(:src="catalog.image || '/public/empty.webp'" style="max-height: inherit;")
        .is-overlay.is-vertical-center(style="background-color: rgba(10, 10, 10, 0.4);")
          .has-text-centered.is-fullwidth.has-text-white
            h1.title.has-text-white {{ catalog.value }}
            p.subtitle.has-text-white {{ catalog.description }}
    .type-boby.has-my-1rem
      section.block(style='margin:1rem;')
        .field.is-grouped.is-fullwidth(style="justify-content: center;")
          p.control.is-expanded
            input.input(type='text', placeholder='Lorem ...'  @keyup.enter="handleFilter" v-model="filter")
          p.control
            button.button.is-info(@click="handleFilter" :disabled="isLoading" :class="[isLoading ? 'is-loading' : '']")
              | Buscar
      section
        section
          center
            //-b-dropdown
              button.button.is-primary(slot='trigger')
                | Tipos
                b-icon(icon='menu-down')
              section.columns.is-multiline(style="padding: 1rem; margin: auto;")
                .column.is-6(v-for="(catalog, key) in catalog.types" :key="key" style="padding: 0")
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
      section(v-if="isLoading")
        .columns.is-centered
          .column
            content-loader(:height='160', :width='400', :speed='2', primaryColor='#000000', secondaryColor='#ecebeb')
              rect(x='70', y='15', rx='4', ry='4', width='117', height='6.4')
                rect(x='70', y='35', rx='3', ry='3', width='85', height='6.4')
                  rect(x='0', y='80', rx='3', ry='3', width='350', height='6.4')
                    rect(x='0', y='100', rx='3', ry='3', width='380', height='6.4')
                      rect(x='0', y='120', rx='3', ry='3', width='201', height='6.4')
                        circle(cx='30', cy='30', r='30')
          .column
            content-loader(:height='160', :width='400', :speed='2', primaryColor='#000000', secondaryColor='#ecebeb')
              rect(x='70', y='15', rx='4', ry='4', width='117', height='6.4')
                rect(x='70', y='35', rx='3', ry='3', width='85', height='6.4')
                  rect(x='0', y='80', rx='3', ry='3', width='350', height='6.4')
                    rect(x='0', y='100', rx='3', ry='3', width='380', height='6.4')
                      rect(x='0', y='120', rx='3', ry='3', width='201', height='6.4')
                        circle(cx='30', cy='30', r='30')
          .column
            content-loader(:height='160', :width='400', :speed='2', primaryColor='#000000', secondaryColor='#ecebeb')
              rect(x='70', y='15', rx='4', ry='4', width='117', height='6.4')
                rect(x='70', y='35', rx='3', ry='3', width='85', height='6.4')
                  rect(x='0', y='80', rx='3', ry='3', width='350', height='6.4')
                    rect(x='0', y='100', rx='3', ry='3', width='380', height='6.4')
                      rect(x='0', y='120', rx='3', ry='3', width='201', height='6.4')
                        circle(cx='30', cy='30', r='30')
          .column
            content-loader(:height='160', :width='400', :speed='2', primaryColor='#000000', secondaryColor='#ecebeb')
              rect(x='70', y='15', rx='4', ry='4', width='117', height='6.4')
                rect(x='70', y='35', rx='3', ry='3', width='85', height='6.4')
                  rect(x='0', y='80', rx='3', ry='3', width='350', height='6.4')
                    rect(x='0', y='100', rx='3', ry='3', width='380', height='6.4')
                      rect(x='0', y='120', rx='3', ry='3', width='201', height='6.4')
                        circle(cx='30', cy='30', r='30')
      section(v-else)
        .columns.is-centered(v-if="filtered.length === 0")
          .column.is-12
            section.hero.has-text-centered
              .hero-body
                .container
                  h1.title
                    | Opps
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
                CardRepository(:repository='repo' @handleViewRepo="handleViewRepo" :key="repo.id")
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
      )
      hr
</template>

<script>
import { ContentLoader } from 'vue-content-loader'
import CardRepository from './../../../components/CardRepositoryV2.vue'
import ListRepository from './../../../components/ListRepository.vue'

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
    ContentLoader,
    CardRepository,
    ListRepository
  },
  async asyncData({ app, query, params: { id: idType } }) {
    console.log(query)
    const slug = slugify(query['slug'] || '')

    const topics = query['topic[]']
      ? Array.isArray(query['topic[]'])
        ? query['topic[]']
        : [query['topic[]']]
      : []

    topics.sort()

    const queryParams = {
      slug,
      types: [Number(idType)],
      topics
    }

    try {
      const {
        data: { data: catalog }
      } = await app.$axios.get('/api/catalog/type/' + idType)

      return {
        catalog,
        query: queryParams,
        filter: query['slug'] || ''
      }
    } catch (error) {
      console.error(error.message)
      return {
        catalog: {},
        query: queryParams,
        repositories: [],
        filtered: []
      }
    }
  },
  data() {
    return {
      isLoading: true,
      view: 'grid',
      query: {
        slug: '',
        types: [],
        topics: []
      },
      pagination: {
        page: 1
      },
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
    const { slug, types: _types, topics: _topics } = this.query
    const queryParam =
      '?' +
      (slug ? 'slug=' + slug + '&' : '') +
      (_types.length ? _types.map(id => 'type=' + id).join('&') + '&' : '') +
      (_topics.length ? _topics.map(id => 'topic=' + id).join('&') + '&' : '')

    console.log(queryParam)

    try {
      const {
        data: { data: repositories = [], ...pagination }
      } = await this.$axios.get('/api/repo' + queryParam + 'limit=32')

      this.pagination = pagination
      this.repositories = repositories
      this.filtered = repositories
      this.isLoading = false
    } catch (error) {
      console.error(error.message)
      const repositories = []

      this.pagination = {}
      this.repositories = []
      this.filtered = []
    }

    const promises = [this.$axios.get('/public/catalog/topics.json')]

    try {
      const types = [{ idCatalog: _types[0], isSelected: true }]
      const [{ data: topics }] = await Promise.all(promises)

      console.log(topics)

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

      this.catalogs.types = types
      this.catalogs.topics = topics
    } catch (error) {
      console.error(error)
    }
  },
  methods: {
    async onPageChange(page) {
      const { limit, offset } = this.pagination
      const options = `page=${page}&limt=${limit}&offset=${offset}`
      const queryParams = this.getQueryParam()
      const url = '/api/repo?' + options + '&' + queryParams

      try {
        this.isLoading = true
        const {
          data: { data: repositories = [], ...pagination }
        } = await this.$axios.get(url)
        this.repositories = repositories
        this.pagination = pagination
        this.filtered = repositories
        window.scrollTo(0, 0)
        this.isLoading = false
      } catch (error) {
        this.isLoading = false
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

      console.log(topics, types)

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
      const slug = slugify((this.filter || '').toLowerCase())

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

      const qTypes = types.map(idCatalog => `type[]=${idCatalog}`)
      const qTopics = topics.map(idCatalog => `topic[]=${idCatalog}`)

      // Cambio Visual [Compartir Link de Contenido]
      if (slug !== baseSlug || newTopics) {
        const { id: idType } = this.catalog

        const [topicParam, typeParam] = [
          topics.length ? qTopics.join('&') : '',
          types.length ? qTypes.join('&') : ''
        ]
        const slugParam = slug ? 'slug=' + slug : ''

        const url =
          slugParam + topicParam
            ? '&' + topicParam
            : '' + typeParam
              ? '&' + typeParam
              : ''

        const windowUrl =
          `/repo/types/${idType}?` + slugParam + '&' + topicParam || ''

        // alert(`/repo/types/${idType}?` + slug + '&' + topicParam || '')

        const {
          data: { data: repositories = [], ...pagination }
        } = await this.$axios.get('/api/repo' + url)

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
    handleViewRepo(repo) {
      this.$router.push('/repo/' + repo.id)
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
