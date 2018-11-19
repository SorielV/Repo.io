<template lang="pug">
  .card
    .card-image-top(@click="handleViewRepo")
      figure.image.is-4by3
        img(:src="repository.image || 'http://www.nyan.cat/cats/original.gif'")
    .card-body
      .content
        p.title(v-text='repository.title' @click="handleViewRepo")
        .tags
          span.tag(v-for="(type, index) in repository.type" :key='index')
            | {{ type.value }}
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

<style>
.card-body {
  -webkit-box-flex: 1;
  -ms-flex: 1 1 auto;
  flex: 1 1 auto;
  padding: 1.25rem;
}
</style>
