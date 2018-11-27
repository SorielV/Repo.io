<template lang="pug">
  .card
    .card-image-top(@click="handleViewRepo")
      figure.image.is-4by3
        img(:src="repository.image || 'http://www.nyan.cat/cats/original.gif'")
    .card-body.card-repo
      .content
        .title(v-text='repository.title' @click="handleViewRepo")
        .tags(v-if="repository.type.length > 0")
          a
            span.tag(
              v-for="(type, index) in repository.type"
              :key='index'
              v-text="type.value"
              @click="handleViewType(type)"
            )
        .tags(v-else)
          span.tag Desconocido
        .description(v-text='repository.description')
        .date.has-my-5px.has-text-centered
          p.small {{ new Date(repository.updatedAt || repository.createdAt).toDateString() }}
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
    },
    handleViewType(type) {
      this.$emit('handleViewType', type)
    }
  }
}
</script>

<style scoped>
.has-my-5px {
  margin-top: 8px;
}
</style>
