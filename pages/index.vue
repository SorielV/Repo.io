<template lang="pug">
  section
    section.hero.is-medium.is-dark
      .hero-body
        .container
          .content.has-text-centered
            h1.title
              | Una alternativa de consulta recursos dígitales
            h4.subtitle
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
    section.hero.is-medium.is-white
      .hero-body
        .container.has-text-centered.has-my-5(v-if="isLoading")
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
        .container.has-text-centered.has-my-5(v-else)
          .columns.is-centered
            .column(v-for="(repo, index) in repositories" :key="index")
              transition-group(name="component-fade" tag="section")
                CardRepository.has-text-black(:repository='repo' @handleViewRepo="handleViewRepo" :key="repo.id")
          .buttons.is-centered
            nuxt-link.button.is-info(to="/repo" style="width: 25%;") Ver Mas
</template>

<script>
import { ContentLoader } from 'vue-content-loader'
import CardRepository from './../components/CardRepositoryV2.vue'

export default {
  layout: 'default',
  name: 'HomePage',
  components: {
    CardRepository,
    ContentLoader
  },
  data() {
    return {
      isLoading: true,
      repositories: [],
      filter: ''
    }
  },
  async created() {
    try {
      const {
        data: { data: repositories }
      } = await this.$axios.get('/api/repo?limit=5')
      this.repositories = repositories
      this.isLoading = false
    } catch (err) {
      console.log(err)
    }
  },
  methods: {
    handleViewRepo(repo) {
      this.$router.push('/repo/' + repo.id)
    },
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
.has-mb-2 {
  margin-bottom: 2%;
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
section.hero.is-dark {
  background: #0a0a0a !important;
}
</style>
