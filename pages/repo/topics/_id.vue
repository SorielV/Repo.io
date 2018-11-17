<template lang="pug">
  section(style="padding: 1%;")
    .type-head
      figure.image(style="max-height: inherit;")
        img(:src="catalog.image || '/public/empty.webp'" style="max-height: inherit;")
        .is-overlay.is-vertical-center
          .has-text-centered.is-fullwidth
            h1 {{ catalog.value }}
            p {{ catalog.description }}
    .type-boby
      .container
        .columns.is-multiline
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
      repositories: [],
      catalog: {},
      err: false
    }
  },
  async created() {
    const {
      data: { data: repositories }
    } = await this.$axios.get('/api/repo')
    this.repositories = repositories

    console.log(this.repositories)
  }
}
</script>

<style>
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
