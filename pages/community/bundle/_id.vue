<template lang="pug">
  section
    .bundle-head
      figure.image(style="max-height: inherit;")
        img(:src="bundle.image || '/public/empty.webp'" style="max-height: inherit;")
        .is-overlay.is-vertical-center(style="background-color: rgba(10, 10, 10, 0.4);")
          .has-text-centered.is-fullwidth.has-text-white
            h1.title.has-text-white {{ bundle.title }}
            p.subtitle.has-text-white {{ bundle.description }}
    .bundle-body
      section(style="padding: 2%;")
        .container
          section.block
            .field.is-grouped.is-fullwidth(style="justify-content: center;")
              p.control.is-expanded
                input.input(type='text', placeholder='Lorem ...' v-model="filter")
              p.control
                a.button.is-info
                  | Buscar
      .container
        .columns.is-multiline.is-centered
          .column.is-3(v-for="(repository, index) in filtered" :key="index")
            CardRepository(:repository="repository" @handleViewRepo="handleViewRepo")
</template>
<script>
import CardRepository from './../../../components/CardRepository.vue'

export default {
  components: {
    CardRepository
  },
  async asyncData({ app, params }) {
    const { id } = params
    if (isNaN(id)) {
      return {
        bundle: {}
      }
    }

    const {
      data: { data: bundle = {} }
    } = await app.$axios.get('/api/community/bundle/' + id + '?full=true')

    return {
      filtered: bundle.repository,
      bundle
    }
  },
  data() {
    return {
      filter: '',
      filtered: [],
      err: false,
      bundle: {}
    }
  },
  watch: {
    filter(_filter, _oldFilter) {
      const oldFilter = _oldFilter.trim().toUpperCase()
      const filter = _filter.trim().toUpperCase()

      if (filter.length === 0) {
        this.filtered = this.bundle.repository
        return
      }

      const flag =
        this.filtered.length === 0 || filter.length < oldFilter.length

      this.filtered = Array.from(
        flag ? this.bundle.repository : this.filtered
      ).filter(({ title }) => title.toUpperCase().includes(filter))
    }
  },
  methods: {
    handleViewRepo({ id }) {
      this.$router.push('/repo/' + id)
    }
  }
}
</script>

<style scoped>
.bundle-head .title {
  font-size: 3.3rem;
}
.bundle-head .subtitle {
  font-size: 1.1rem;
}
.bundle-head {
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
