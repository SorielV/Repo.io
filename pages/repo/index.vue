<template lang="pug">
  section(style="padding: 2%;")
    section.block
      .field.is-grouped.is-fullwidth(style="justify-content: center;")
        p.control.is-expanded
          input.input(type='text', placeholder='Lorem ...'  @keyup.enter="handleFilter" v-model="filter")
        p.control
          button.button.is-info(@click="handleFilter")
            | Buscar
    section.has-py-1rem
      .container
        center
          b-dropdown
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
              .column.is-6(v-for="(catalog, key) in catalog.topics" :key="key" style="padding: 0")
                b-checkbox(v-model='catalog.isSelected' @input="handleFilterCatalog(catalog, 1)" type="is-danger")
                  | {{ catalog.value }}

          b-dropdown(:disabled="true")
            button.button.is-primary(slot='trigger')
              | Editoriales
              b-icon(icon='menu-down')
            section.columns.is-multiline(style="padding: 1rem; margin: auto;")
              .column.is-6(v-for="(catalog, key) in catalog.editorials" :key="key" style="padding: 0")
                b-checkbox(v-model='catalog.isSelected' type="is-danger")
                  | {{ catalog.value }}
    .content.has-text-centered
      span.small Mostrando {{ repositories.length }} [{{ (pagination.page - 1 || 1) * pagination.offset }} a {{ (pagination.page || 1) * pagination.offset }}] de {{ pagination.total }}
      div
        span.small Base
        pre {{ JSON.stringify(query) }}
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
        .columns.is-multiline.is-centered
          .column.is-3(v-for="(repo, index) in filtered" :key="index")
            transition-group(name="component-fade" tag="section")
              CardRepository(:repository='repo' @handleViewRepo="handleViewRepo" :key="repo.id")
              // -pre(:key="index") {{ repo }}
              //CardRepository(@repository="repo" )
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
import CardRepository from './../../components/CardRepository.vue'

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
    CardRepository
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

    console.log(queryParam)

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
          repositories,
          filtered: repositories
        }
      }
    } catch (error) {
      console.error(error.message)
      const repositories = []

      return {
        params,
        repositories,
        filtered: repositories
      }
    }
  },
  data() {
    return {
      query: {},
      pagination: {},
      catalog: {
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

      const query = Object.keys(this.query)
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
      const oldFilter = _oldFilter.trim().toUpperCase()
      const filter = _filter.trim().toUpperCase()

      if (filter.length === 0) {
        this.filtered =
          this.types.length > 0
            ? Array.apply(null, this.repositories).filter(
                ({ type }) => this.types.indexOf(type) !== -1
              )
            : this.repositories
      } else {
        const flag =
          this.filtered.length === 0 || filter.length < oldFilter.length
        this.filtered = Array.apply(
          null,
          flag ? this.repositories : this.filtered
        ).filter(repository => {
          return repository.title.toUpperCase().includes(filter)
        })
      }
    }
  },
  async created() {
    // fetch
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
        console.log(id)
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

      // console.log(types)
      console.log(types.find(({ idCatalog }) => idCatalog === 17))

      this.catalog.types = types
      this.catalog.topics = topics
    } catch (error) {
      console.log(error)
    }
  },
  methods: {
    setFiltered() {
      const data = this.repositories
      const filter = slugify(this.filter)

      const types = this.catalog.types.reduce(
        (acc, { idCatalog, isSelected }) => {
          if (isSelected) {
            acc.push(idCatalog)
          }
          return acc
        },
        []
      )

      const topics = this.catalog.topics.reduce(
        (acc, { idCatalog, isSelected }) => {
          if (isSelected) {
            acc.push(idCatalog)
          }
          return acc
        },
        []
      )

      this.filtered = data.filter(({ slug, type, topic }) => {
        if (filter) {
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
      const baseSlug = (this.query.slug || '').trim().toLowerCase()
      const slug = this.filter.trim().toLowerCase()

      const types = this.catalog.types.reduce(
        (acc, { idCatalog, isSelected }) => {
          if (isSelected) {
            acc.push(`type[]=${idCatalog}`)
          }
          return acc
        },
        []
      )

      const topics = this.catalog.topics.reduce(
        (acc, { idCatalog, isSelected }) => {
          if (isSelected) {
            acc.push(`topic[]=${idCatalog}`)
          }
          return acc
        },
        []
      )

      // Cambio Visual [Compartir Link de Contenido]
      if (slug.length > 0 && slug !== baseSlug) {
        const url =
          '/repo?slug=' +
          slug +
          (types.length ? '&' + types.join('&') : '') +
          (topics.length ? '&' + topics.join('&') : '')

        const {
          data: { data: repositories = [], ...pagination }
        } = await this.$axios.get('/api' + url)

        this.repositories = repositories
        this.pagination = pagination
        this.filtered = repositories
        window.history.pushState(undefined, 'Repo', url)
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
.is-Papers {
  background-color: #303f9f;
  color: white;
}
.is-Books {
  background-color: red;
  color: white;
}
.is-Cursos {
  background-color: #c5cae9;
}
.is-Videos {
  background-color: #3f51b5;
  color: white;
}
.is-Portales .Blogs {
  background-color: #ffffff;
}
.is-Tools .Software {
  background-color: #448aff;
}
.is-PPTs .SlideShare {
  background-color: #212121;
  color: white;
}
.is-Infografias .Memes {
  background-color: #757575;
}
.is-People .Follow {
  background-color: #bdbdbd;
}
.is-Comunidades {
  background-color: #007bff;
  color: white;
}
.is-APIs {
  background-color: #007bff;
  color: white;
}
.is-DataSets {
  background-color: #007bff;
  color: white;
}

.b-card {
  position: relative;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
  min-width: 0;
  word-wrap: break-word;
  background-color: #fff;
  background-clip: border-box;
  border: 1px solid rgba(0, 0, 0, 0.125);
  border-radius: 0.25rem;
}

.b-card > hr {
  margin-right: 0;
  margin-left: 0;
}

.b-card > .list-group:first-child .list-group-item:first-child {
  border-top-left-radius: 0.25rem;
  border-top-right-radius: 0.25rem;
}

.b-card > .list-group:last-child .list-group-item:last-child {
  border-bottom-right-radius: 0.25rem;
  border-bottom-left-radius: 0.25rem;
}

.card-body {
  -webkit-box-flex: 1;
  -ms-flex: 1 1 auto;
  flex: 1 1 auto;
  padding: 1.25rem;
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

.card-header-tabs {
  margin-right: -0.625rem;
  margin-bottom: -0.75rem;
  margin-left: -0.625rem;
  border-bottom: 0;
}

.card-header-pills {
  margin-right: -0.625rem;
  margin-left: -0.625rem;
}

.card-img-overlay {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  padding: 1.25rem;
}

.card-img {
  width: 100%;
  border-radius: calc(0.25rem - 1px);
}

.card-img-top {
  width: 100%;
  border-top-left-radius: calc(0.25rem - 1px);
  border-top-right-radius: calc(0.25rem - 1px);
}

.card-img-bottom {
  width: 100%;
  border-bottom-right-radius: calc(0.25rem - 1px);
  border-bottom-left-radius: calc(0.25rem - 1px);
}

.card-deck {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
}

.card-deck .b-card {
  margin-bottom: 15px;
}

@media (min-width: 576px) {
  .card-deck {
    -webkit-box-orient: horizontal;
    -webkit-box-direction: normal;
    -ms-flex-flow: row wrap;
    flex-flow: row wrap;
    margin-right: -15px;
    margin-left: -15px;
  }
  .card-deck .b-card {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-flex: 1;
    -ms-flex: 1 0 0%;
    flex: 1 0 0%;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    margin-right: 15px;
    margin-bottom: 0;
    margin-left: 15px;
  }
}

.card-group {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
}

.card-group > .b-card {
  margin-bottom: 15px;
}

@media (min-width: 576px) {
  .card-group {
    -webkit-box-orient: horizontal;
    -webkit-box-direction: normal;
    -ms-flex-flow: row wrap;
    flex-flow: row wrap;
  }
  .card-group > .b-card {
    -webkit-box-flex: 1;
    -ms-flex: 1 0 0%;
    flex: 1 0 0%;
    margin-bottom: 0;
  }
  .card-group > .b-card + .b-card {
    margin-left: 0;
    border-left: 0;
  }
  .card-group > .card:first-child {
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
  }
  .card-group > .card:first-child .card-img-top,
  .card-group > .card:first-child .card-header {
    border-top-right-radius: 0;
  }
  .card-group > .card:first-child .card-img-bottom,
  .card-group > .card:first-child .card-footer {
    border-bottom-right-radius: 0;
  }
  .card-group > .card:last-child {
    border-top-left-radius: 0;
    border-bottom-left-radius: 0;
  }
  .card-group > .card:last-child .card-img-top,
  .card-group > .card:last-child .card-header {
    border-top-left-radius: 0;
  }
  .card-group > .card:last-child .card-img-bottom,
  .card-group > .card:last-child .card-footer {
    border-bottom-left-radius: 0;
  }
  .card-group > .card:only-child {
    border-radius: 0.25rem;
  }
  .card-group > .card:only-child .card-img-top,
  .card-group > .card:only-child .card-header {
    border-top-left-radius: 0.25rem;
    border-top-right-radius: 0.25rem;
  }
  .card-group > .card:only-child .card-img-bottom,
  .card-group > .card:only-child .card-footer {
    border-bottom-right-radius: 0.25rem;
    border-bottom-left-radius: 0.25rem;
  }
  .card-group > .card:not(:first-child):not(:last-child):not(:only-child) {
    border-radius: 0;
  }
  .card-group
    > .card:not(:first-child):not(:last-child):not(:only-child)
    .card-img-top,
  .card-group
    > .card:not(:first-child):not(:last-child):not(:only-child)
    .card-img-bottom,
  .card-group
    > .card:not(:first-child):not(:last-child):not(:only-child)
    .card-header,
  .card-group
    > .card:not(:first-child):not(:last-child):not(:only-child)
    .card-footer {
    border-radius: 0;
  }
}

.card-columns .b-card {
  margin-bottom: 0.75rem;
}

@media (min-width: 576px) {
  .card-columns {
    -webkit-column-count: 3;
    -moz-column-count: 3;
    column-count: 3;
    -webkit-column-gap: 1.25rem;
    -moz-column-gap: 1.25rem;
    column-gap: 1.25rem;
  }
  .card-columns .b-card {
    display: inline-block;
    width: 100%;
  }
}
.border-type-1 {
  border-top: 10px solid #007bff !important;
}

.border-type-2 {
  border-top: 10px solid #e83e8c !important;
}

.border-type-3 {
  border-top: 10px solid #6f42c1 !important;
}

.border-type-4 {
  border-top: 10px solid #6610f2 !important;
}

.border-type-5 {
  border-top: 10px solid #28a745 !important;
}

.option-type-1 {
  color: #007bff !important;
}

.option-type-2 {
  color: #e83e8c !important;
}

.option-type-3 {
  color: #6f42c1 !important;
}

.option-type-4 {
  color: #6610f2 !important;
}

.option-type-5 {
  color: #28a745 !important;
}

.option-type-1.active {
  border-bottom: 3px solid #007bff !important;
}

.option-type-2.active {
  border-bottom: 3px solid #e83e8c !important;
}

.option-type-3.active {
  border-bottom: 3px solid #6f42c1 !important;
}

.option-type-4.active {
  border-bottom: 3px solid #6610f2 !important;
}
.option-type-5.active {
  border-bottom: 3px solid #28a745 !important;
}
.component-fade-enter-active,
.component-fade-leave-active {
  transition: opacity 0.3s ease;
}
.component-fade-enter,
.component-fade-leave-to
/* .component-fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}
</style>
