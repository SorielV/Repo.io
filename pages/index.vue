<template lang="pug">
  section
    .home.hero.is-white.is-medium.is-bold
      .hero-body
        .container.has-text-centered.has-mb-5
          h1.title
            | Una alternativa de consulta recuros digitales
          h2.subtitle.has-my-1rem
            | Encuentra recursos ahora
          center
            .container.search
              .field.has-addons
                p.control.is-expanded.has-icons-left
                  input.input.is-rounded(placeholder='Busca repositorios ' @keyup.enter="search" v-model="filter")
                  span.icon.is-small.is-left
                    i.mdi.mdi-magnify
                .control
                  button.button.is-info(@click="search") Buscar

        .container.has-text-centered.has-my-5
          h1.title.has-text-black Ultimos Agregados
          .columns.is-centered
            .column.is-3(v-for="(repo, index) in repositories" :key="index")
              transition-group(name="component-fade" tag="section")
                CardRepository.has-text-black(:repository='repo' @handleViewRepo="" :key="repo.id")
          .buttons.is-centered
            nuxt-link.button.is-info(to="/repo" style="width: 25%;") Ver Mas
      .box.cta.has-background-black
        p.has-text-centered.has-text-white
          span.tag.is-primary New
          a(href="https://github.com/SorielV")
            | @SorielV
</template>

<script>
import CardRepository from './../components/CardRepository.vue'

export default {
  layout: 'default',
  name: 'HomePage',
  components: {
    CardRepository
  },
  data() {
    return {
      repositories: [],
      filter: ''
    }
  },
  async created() {
    const {
      data: { data: repositories }
    } = await this.$axios.get('/api/repo?limit=4')
    this.repositories = repositories
  },
  methods: {
    search() {
      if (this.filter.trim()) {
        this.$router.push('/repo?slug=' + this.filter.toLowerCase())
      } else {
        this.$router.push('/repo')
      }
    }
  }
}
</script>

<style scoped>
.has-mb-5 {
  margin-bottom: 5%;
}
.has-my-10 {
  margin: 5%;
}
.home {
  width: 100% !important;
  height: 100% !important;
  /*
  position: absolute !important;
  */
}
.has-my-1rem {
  margin-top: 1rem;
  margin-bottom: 1rem;
}
.container.search {
  width: 70%;
}
</style>
