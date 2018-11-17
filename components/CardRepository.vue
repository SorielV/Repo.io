<template lang="pug">
  .card
    .card-image-top(@click="handleViewRepo(repo)")
      figure.image.is-4by3
        img(:src="repo.image || 'http://www.nyan.cat/cats/original.gif'")
    .card-body
      .content
        p.title(v-text='repo.title' @click="handleViewRepo(repo)")
        .tags
          span.tag(v-for="(type, index) in repo.type" :key='index')
            | {{ type.value }}
          // span.tag(v-text="getType()" :class="'is-' + getType(repo.type)")
        p(v-text='repo.description')
        time(datetime='2016-1-1') 11:09 PM - 1 Jan 2016
</template>

<script>
export default {
  props: {
    repo: {
      type: Object,
      required: true
    }
  },
  methods: {
    getType(type) {
      return text
    }
  }
}
</script>
