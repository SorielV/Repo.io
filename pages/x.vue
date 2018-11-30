<template lang="pug">
  section
    .home.hero.is-medium
      .hero-body
        .container.has-text-centered.has-mb-2
          h1.title
            | Una alternativa de consulta recursos dígitales
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
          h1.title.has-text-black Ultimos Agregados
          .columns.is-centered
            .column.is-4(v-for="(repo, index) in repositories" :key="index")
              // Post
              .post-module
                // Thumbnail
                .thumbnail
                  .topics #1111111
                  img(:src='repo.image')
                // Post Content
                .post-content
                  .types(v-if="repo.type.length !== 0")
                    nuxt-link.has-text-white(
                      :to="'/repo/types/' + type.id"
                      v-for='(type, typeIndex) in repo.type'
                      :key='typeIndex'
                    ) {{ type.value }}
                  h1.title {{ repo.title }}
                  //h2.sub_title The city that never sleeps.
                  p.description {{ repo.description }}
                  .post-meta
                    span.timestamp
                      i.fa.fa-clock- o
                      |  6 mins ago
                    span.comments
                      i.fa.fa-comments
                      a(href='#')  39 comments
</template>

<script>
import { ContentLoader } from 'vue-content-loader'
import CardRepository from './../components/CardRepository.vue'

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
      } = await this.$axios.get('/api/repo?limit=4')
      this.repositories = repositories
      this.isLoading = false
    } catch (err) {
      console.log(err)
    }
  },
  mounted() {
    const elements = document.getElementsByClassName('post-module')
    Array.from(elements).forEach(el => {
      el.onmouseover = function(ev) {
        const [description] = this.getElementsByClassName('description')
        description.style.display = 'block'
      }
      el.onmouseleave = function(ev) {
        const [description] = this.getElementsByClassName('description')
        description.style.display = 'none'
      }
    })
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
body {
  background: #f2f2f2;
  font-family: 'proxima-nova-soft', sans-serif;
  font-size: 14px;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
.post-module {
  position: relative;
  z-index: 1;
  display: block;
  background: #ffffff;
  min-width: 270px;
  height: 470px;
  -webkit-box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.15);
  box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.15);
  -webkit-transition: all 0.3s linear 0s;
  -moz-transition: all 0.3s linear 0s;
  -ms-transition: all 0.3s linear 0s;
  -o-transition: all 0.3s linear 0s;
  transition: all 0.3s linear 0s;
}
.post-module:hover,
.hover {
  -webkit-box-shadow: 0px 1px 35px 0px rgba(0, 0, 0, 0.3);
  -moz-box-shadow: 0px 1px 35px 0px rgba(0, 0, 0, 0.3);
  box-shadow: 0px 1px 35px 0px rgba(0, 0, 0, 0.3);
}
.post-module:hover .thumbnail img,
.hover .thumbnail img {
  -webkit-transform: scale(1.1);
  -moz-transform: scale(1.1);
  transform: scale(1.1);
  opacity: 0.6;
}
.post-module .thumbnail {
  background: #000000;
  height: 400px;
  overflow: hidden;
}
.post-module .thumbnail .topics {
  color: white;
  position: absolute;
  /*background-color: rgba(10, 10, 10, 0.86) !important;*/
  background: none;
  width: 100%;
  z-index: 1;
}
.post-module .thumbnail .date {
  position: absolute;
  top: 20px;
  right: 20px;
  z-index: 1;
  background: #e74c3c;
  width: 100px;
  height: 55px;
  padding: 12.5px 0;
  -webkit-border-radius: 100%;
  -moz-border-radius: 100%;
  border-radius: 100%;
  color: #ffffff;
  font-weight: 700;
  text-align: center;
  -webkti-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
.post-module .thumbnail .date .day {
  font-size: 18px;
}
.post-module .thumbnail .date .month {
  font-size: 12px;
  text-transform: uppercase;
}
.post-module .thumbnail img {
  display: block;
  width: 120%;
  -webkit-transition: all 0.3s linear 0s;
  -moz-transition: all 0.3s linear 0s;
  -ms-transition: all 0.3s linear 0s;
  -o-transition: all 0.3s linear 0s;
  transition: all 0.3s linear 0s;
}
.post-module .post-content {
  position: absolute;
  bottom: 0;
  background: #ffffff;
  width: 100%;
  padding: 30px;
  -webkti-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
  -moz-transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
  -ms-transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
  -o-transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
  transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
}
.post-module .post-content .types {
  position: absolute;
  top: -34px;
  left: 0;
  background: #e74c3c;
  padding: 10px 15px;
  color: #ffffff;
  font-size: 14px;
  font-weight: 600;
  text-transform: uppercase;
}
.post-module .post-content .title {
  margin: 0;
  padding: 0 0 10px;
  color: #333333;
  font-size: 26px;
  font-weight: 700;
}
.post-module .post-content .sub_title {
  margin: 0;
  padding: 0 0 20px;
  color: #e74c3c;
  font-size: 20px;
  font-weight: 400;
}
.post-module .post-content .description {
  display: none;
  color: #666666;
  font-size: 14px;
  line-height: 1.8em;
}
.post-module .post-content .post-meta {
  margin: 30px 0 0;
  color: #999999;
}
.post-module .post-content .post-meta .timestamp {
  margin: 0 16px 0 0;
}
.post-module .post-content .post-meta a {
  color: #999999;
  text-decoration: none;
}
.hover .post-content .description {
  display: block !important;
  height: auto !important;
  opacity: 1 !important;
}
/*
.container {
  max-width: 800px;
  min-width: 640px;
  margin: 0 auto;
}
.container:before,
.container:after {
  content: '';
  display: block;
  clear: both;
}
.container .column {
  width: 50%;
  padding: 0 25px;
  -webkti-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  float: left;
}
.container .column .demo-title {
  margin: 0 0 15px;
  color: #666666;
  font-size: 18px;
  font-weight: bold;
  text-transform: uppercase;
}
.container .info {
  width: 300px;
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 24px;
  font-weight: bold;
  color: #333333;
}
.container .info span {
  color: #666666;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #e74c3c;
}
*/
</style>
