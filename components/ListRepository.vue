<template lang="pug">
  .card.is-horizontal
    .card-image
      figure.image.is-256x246
        img(:src="repository.image || '/public/loading.gif'")
    .card-stacked
      .card-content
        .media-content
          p.subtitle.is-6 
            span.small.tag(v-for="(type, index) in repository.type" :key='index')
              | {{ '#' + type.value }}
          p.title(v-text='repository.title' @click="handleViewRepo")
        .content
          .tags
            span.small.tag(v-for="(topic, index) in repository.topic" :key='index')
              | {{ topic.value }}
          p(v-text='repository.description')
          time(datetime='2016-1-1') {{ new Date(repository.updatedAt || repository.createdAt).toLocaleString() }}
</template>

<script>
export default {
  props: {
    repository: {
      type: Object,
      required: true
    }
  },
  methods: {
    handleViewRepo() {
      this.$emit('handleViewRepo', this.repository)
    }
  }
}
</script>

<style scoped>
</style>
