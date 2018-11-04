<template lang="pug">
  section(style="padding: 2%;")
    section.block
      .field.is-grouped.is-fullwidth(style="justify-content: center;")
        p.control.is-expanded
          input.input(type='text', placeholder='Lorem ...' v-model="filter")
        p.control
          a.button.is-info
            | Buscar
    section.block
      .tabs.is-centered
        ul
          li(v-for="(type, key) in catalog.types" :key="key")
            a(@click='handleSelectType($event, type.value)' v-text="type.text")
    section
      .columns.is-multiline.is-centered
        .column.is-12(v-if="filtered.length === 0")
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
        .columns.is-12(v-else)
          .container(style="padding: 1%")
            .card-columns
              .b-card(v-for="(repo, index) in filtered" :key="index")
                .card-image-top(v-if="repo.image")
                  figure.image.is-4by3
                    img(:src='repo.image' :alt='repo.image')
                .card-body
                  .content
                    p.title(v-text='repo.title' @click="handleViewRepo(repo)")
                    .tags
                      span.tag(v-text="getType(repo.type)" :class="'is-' + getType(repo.type)")
                    p(v-text='repo.description')
                    time(datetime='2016-1-1') 11:09 PM - 1 Jan 2016
</template>

<script>
export default {
  async asyncData({ app, params }) {
    try {
      if (Object.keys(params).length) {
        const {
          data: { data: repositories = [] }
        } = await app.$axios.get(`/api/repo/?search=${params}`)
        return {
          params,
          repositories,
          filtered: repositories,
          filter: ''
        }
      } else {
        const {
          data: { data: repositories = [] }
        } = await app.$axios.get('/api/repo')
        return {
          params,
          repositories,
          filtered: repositories
        }
      }
    } catch (error) {
      console.error(error)
    }
  },
  data() {
    return {
      catalog: {
        types: [
          { text: 'Papers', value: 1 },
          { text: 'Books', value: 2 },
          { text: 'Cursos', value: 3 },
          { text: 'Videos', value: 4 },
          { text: 'Portales Blogs', value: 5 },
          { text: 'Tools Software', value: 6 },
          { text: 'PPTs SlideShare', value: 7 },
          { text: 'Infografias y Memes', value: 8 },
          { text: 'People To Follow', value: 9 },
          { text: 'Comunidades', value: 10 },
          { text: 'APIs', value: 11 },
          { text: 'DataSets', value: 12 }
        ]
      },
      filter: '',
      types: [],
      filtered: [],
      repositories: []
    }
  },
  watch: {
    types(types) {
      console.log(types)
      if (types.length === 0) {
        this.filtered = this.repositories
      } else {
        this.filtered = Array.from(this.repositories).filter(
          ({ type }) => types.indexOf(type) !== -1
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
  methods: {
    getType(type) {
      const { text = 'Otro' } = Array.apply(null, this.catalog.types).find(
        ({ value }) => value === type
      )
      return text
    },
    handleSelectType(event, type) {
      const indexOfType = this.types.indexOf(type)
      const parent =
        event.target.nodeName == 'A' ? event.target.parentNode : event.target

      if (indexOfType === -1) {
        this.types.push(type)
        parent.classList.add('is-active')
      } else {
        this.types.splice(indexOfType)
        parent.classList.remove('is-active')
      }
    },
    handleViewRepo(repo) {
      console.log(repo)
      this.$router.push('/repo/' + repo.id)
    }
  }
}
</script>

<style scoped>
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
</style>
