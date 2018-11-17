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
          .column.is-3(v-for="(repo, index) in repositories" :key="index")
            CardRepository(:repo='repo')
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
        data: { data: catalog }
      } = await app.$axios.get('/api/catalog/type/' + id)

      console.log(id)
      return {
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
      filtered: [],
      repositories: [],
      catalog: {},
      err: false
    }
  },
  async created() {
    const { id: idtype } = this.catalog

    const {
      data: { data: repositories }
    } = await this.$axios.get('/api/repo?type=' + idtype)

    this.repositories = repositories
    this.filtered = repositories

    console.log(this.repositories)
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
