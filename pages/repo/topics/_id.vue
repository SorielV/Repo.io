<template lang="pug">
  section
    .type-head
      figure.image(style="max-height: inherit;")
        img(:src="catalog.image || '/public/empty.webp'" style="max-height: inherit;")
        .is-overlay.is-vertical-center(style="background-color: rgba(10, 10, 10, 0.4);")
          .has-text-centered.is-fullwidth.has-text-white
            h1.title.has-text-white {{ catalog.value }}
            p.subtitle.has-text-white {{ catalog.description }}
    .type-boby
        section.container(style="padding: 1rem 1.5rem;")
          .columns
            .column.is-12
              .column.is-12
                // Filtros Comunes
                .columns.is-multiline
                  // Buscador
                  .column.is-12
                    .field.is-grouped.is-fullwidth(style="justify-content: center;")
                      p.control.is-expanded
                        input.input(type='text', placeholder='Titulos'  @keyup.enter="handleFilter" v-model="filter")
                      p.control
                        button.button.is-info(@click="handleFilter")
                          | Buscar
                  // Informacion Paginacion
                  .column.is-12
                    .columns.is-centered
                      .column.has-text-centered
                        div(style="margin-top: 0.75rem;")
                          span.small Mostrando {{ repositories.length }} [{{ (pagination.page - 1 || 1) * pagination.offset }} a {{ (pagination.page || 1) * pagination.offset }}] de {{ pagination.total }}
                      .column.is-narrow
                        .buttons
                          .button.is-info(@click="view = 'list'")
                            i.mdi.mdi-view-list
                          .button.is-info(@click="view = 'grid'")
                            i.mdi.mdi-view-grid
                          .button.is-info(@click="handleModalFilter")
                            i.mdi.mdi-filter
                  // Informacion Filtros Base
                  .column.is-12
                    p Filtros Base
                      span.tag.is-info(v-show="query.slug")
                        | titulo = {{ query.slug }}
                      // Types
                      span.tag.is-danger(
                        v-for="(idType, typeIndex) in query.types"
                        :key="typeIndex"
                      ) {{ getValueOfType(idType) || 'Otros' }}

                      // Topics
                      span.tag(
                        v-for="(idTopic, topicIndex) in query.topics"
                        :key="topicIndex + 't'"
                      ) {{ getValueOfTopic(idTopic) || 'Otro' }}

              .column.is-12
                template(v-if="filtered.length === 0")
                  section.hero.has-text-centered
                    .hero-body
                      section
                        h1.title
                          | Error
                        h2.subtitle
                          | Repositorios no encontrados
                        h2.subtitle(v-if="repositories.length !== 0")
                          | Busqueda: {{ filter }}
                        //img(src="https://i.gifer.com/7WOr.gif")
                template(v-else)
                  .columns.is-multiline(v-if="view === 'grid'")
                    .column(v-for="(repo, index) in filtered" :key="repo.id")
                      transition-group(name="component-fade" tag="section")
                        CardRepository(
                          :repository='repo'
                          @handleViewRepo="handleViewRepo"
                          @handleViewType="handleViewType"
                          :key="repo.id"
                        )
                  .columns.is-multiline.is-centered(v-else)
                    .column(v-for="(repo, index) in filtered" :key="index")
                      transition-group(name="component-fade" tag="section")
                        ListRepository(:repository='repo' @handleViewRepo="handleViewRepo" :key="repo.id")
        hr
        // Filters
        b-modal(:active.sync="modalFilter")
          nav.panel.has-background-white(style="border-radius: 6px")
              p.panel-heading.has-text-black
                | Filtros
              .panel-block
                p.control.has-icons-left
                  input.input(
                    type='text'
                    placeholder='Titulos'
                    v-model="filter"
                  )
                  span.icon.is-small.is-left
                    i.mdi.mdi-magnify(aria-hidden='true')
              p.panel-tabs
                // Catalogogs
                b-tabs(v-model='filterTab' expanded)
                  // Catalogo Recursos
                  b-tab-item(label='Recurso')
                    section.columns.is-multiline(style="padding: 1rem; margin: auto;")
                      .column.is-6(v-for="(catalog, key) in catalogs.types" :key="key" style="padding: 0")
                        b-checkbox(v-model='catalog.isSelected' @input="handleFilterCatalog(catalog, 0)" type="is-danger")
                          | {{ catalog.value }}

                  // Catalogo Tematicas
                  b-tab-item(label='Tematica' disabled)
                    //-section.columns.is-multiline(style="padding: 1rem; margin: auto;")
                      .column.is-6(v-for="(catalog, key) in catalogs.topics" :key="key" style="padding: 0")
                        b-checkbox(v-model='catalog.isSelected' @input="handleFilterCatalog(catalog, 1)" type="is-white")
                          | {{ catalog.value }}

                  // Catalogo Autor
                  b-tab-item(label='Autor' disabled)

                  // Catalogo Editorial
                  b-tab-item(label='Editorial' disabled)
              .panel-block
                .buttons
                  button.button
                    | Eliminar Filtros
                  button.button.is-info(@click="handleFilter")
                    | Filtrar
    .container
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
</template>

<script>
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

function integerValues(arr) {
  return arr.reduce((arr, val) => {
    if (!isNaN(val)) {
      arr.push(Number.parseInt(val))
    }
    return arr
  }, [])
}

export default {
  components: {
    CardRepository,
    ListRepository
  },
  async asyncData({ app, query, params: { id: idCatalog } }) {
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
      types: integerValues(types),
      /*topics: integerValues(topics)*/
      topics: integerValues([idCatalog])
    }

    try {
      const {
        data: { data: catalog }
      } = await app.$axios.get('/api/catalog/topic/' + idCatalog)

      return {
        baseRouter: '/repo/topics/' + idCatalog,
        catalog,
        query: queryParams
      }
    } catch (error) {
      return {
        catalog: {}
      }
    }
  },
  data() {
    return {
      baseRouter: '/repo',
      filterTab: 0,
      modalFilter: false,
      isOpen: false,
      view: 'grid',
      // Catalogo Base
      catalog: {},
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
    const { types, topics, slug } = this.query
    const hasSlug = Boolean(slug)
    const hasType = Boolean(types.length)
    const hasTopic = Boolean(topics.length)

    const params = [
      slug ? 'slug=' + slug : null,
      hasType ? types.map(id => 'type[]=' + id).join('&') : null,
      hasTopic ? topics.map(id => 'topic[]=' + id).join('&') : null
    ]

    const queryParam = params
      .reduce((arr, param) => {
        if (param) {
          arr.push(param)
        }

        return arr
      }, [])
      .join('&')

    try {
      if (hasSlug || hasTopic || hasType) {
        const {
          data: { data: repositories = [], ...pagination }
        } = await this.$axios.get('/api/repo?format=user&' + queryParam)

        if (pagination.total !== 0) {
          this.pagination = pagination
        }
        this.repositories = repositories
        this.filtered = repositories
      } else {
        const {
          data: { data: repositories = [], ...pagination }
        } = await this.$axios.get('/api/repo?format=user&limit=32')

        if (pagination.total !== 0) {
          this.pagination = pagination
        }
        this.repositories = repositories
        this.filtered = repositories
      }
    } catch (error) {
      console.error(error.message)
      const repositories = []

      this.pagination = {}
      this.repositories = []
      this.filtered = []
    }
    // fetch
    /// console.log(this.$route.matched)
    const promises = [
      /*this.$axios.get('/public/catalog/topics.json'),*/
      this.$axios.get('/public/catalog/types.json')
    ]

    try {
      /*const [{ data: topics }, { data: types }] = await Promise.all(promises)*/
      const [{ data: types }] = await Promise.all(promises)
      const topics = [this.catalog].reduce((arr, { id: idCatalog, value }) => {
        arr.push({ idCatalog, value })
        return arr
      }, [])

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

      console.log(topics)
    } catch (error) {
      console.error(error)
    }
  },
  methods: {
    getValueOfTopic(id) {
      const { value = null } =
        this.catalogs.topics.find(({ idCatalog }) => idCatalog === id) || {}
      return value
    },
    getValueOfType(id) {
      const { value = null } =
        this.catalogs.types.find(({ idCatalog }) => idCatalog === id) || {}
      return value
    },
    getValueOfEditorial(id) {
      const { value = null } =
        this.catalogs.editorials.find(({ idCatalog }) => idCatalog === id) || {}
      return value
    },
    getValueOfAuthor(id) {
      const { value = null } =
        this.catalogs.authors.find(({ idCatalog }) => idCatalog === id) || {}
      return value
    },
    async onPageChanged(page) {
      const { limit, offset } = this.pagination
      const options = `page=${page}&limt=${limit}&offset=${offset}`
      const queryParams = this.getQueryParam()
      const url = '/api/repo?format=user&' + options + '&' + queryParams

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
    handleModalFilter() {
      this.modalFilter = true
    },
    // Reciclable
    getQueryParam() {
      const baseSlug = this.query.slug
      const slug = slugify(this.filter.trim())

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

      const hasSlug = Boolean(slug)
      const hasType = Boolean(types.length)
      const hasTopic = Boolean(topics.length)

      const queryParam = [
        hasSlug ? 'slug=' + slug : null,
        hasType ? types.join('&') : null,
        hasTopic ? topics.join('&') : null
      ]
        .reduce((arr, param) => {
          if (param) {
            arr.push(param)
          }
          return arr
        }, [])
        .join('&')

      return queryParam
    },
    async handleFilter() {
      if (this.modalFilter) {
        this.modalFilter = false
      }

      const baseSlug = this.query.slug
      const slug = slugify(this.filter.trim())

      const [queyTypes, types] = this.catalogs.types.reduce(
        (acc, { idCatalog, isSelected }) => {
          if (isSelected) {
            acc[0].push(`type[]=${idCatalog}`)
            acc[1].push(idCatalog)
          }
          return acc
        },
        [[], []]
      )
      types.sort()

      const hasNewType = this.query.types.every(
        item => types.indexOf(item) !== 1
      )

      const [queyTopics, topics] = this.catalogs.topics.reduce(
        (acc, { idCatalog, isSelected }) => {
          if (isSelected) {
            acc[0].push(`topic[]=${idCatalog}`)
            acc[1].push(idCatalog)
          }
          return acc
        },
        [[], []]
      )
      topics.sort()

      const hasNewTopic = this.query.topics.every(
        item => topics.indexOf(item) !== 1
      )

      const hasSlug = Boolean(slug)
      const hasType = Boolean(types.length)
      const hasTopic = Boolean(topics.length)

      const queryParam = [
        hasSlug ? 'slug=' + slug : null,
        hasType ? queyTypes.join('&') : null,
        hasTopic ? queyTopics.join('&') : null
      ]
        .reduce((arr, param) => {
          if (param) {
            arr.push(param)
          }
          return arr
        }, [])
        .join('&')

      // Added
      const windowParam = [
        hasSlug ? 'slug=' + slug : null,
        hasType ? queyTypes.join('&') : null
        /*hasTopic ? queyTopics.join('&') : null*/
      ]
        .reduce((arr, param) => {
          if (param) {
            arr.push(param)
          }
          return arr
        }, [])
        .join('&')

      const hasNewFilter = slug !== baseSlug || hasNewTopic || hasNewType

      // Cambio Visual [Compartir Link de Contenido]
      if (hasNewFilter) {
        const {
          data: { data: repositories = [], ...pagination }
        } = await this.$axios.get('/api/repo?format=user&' + queryParam)

        this.query.slug = slug
        this.query.topics = topics
        this.query.types = types
        this.repositories = repositories
        this.pagination = pagination
        this.filtered = repositories

        const windowUrl =
          this.baseRouter + `?page=${pagination.page}&` + windowParam
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
.has-mb-1 {
  margin-bottom: 1rem;
}

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
</style>
