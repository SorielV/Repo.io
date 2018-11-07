<template lang="pug">
  div.container(style="padding: 1% 0% 1% 0%;")
    template(v-if="repository.image")
      repoDI(:repository="repository")
    template(v-else)
      repoD(:repository="repository")
    article.media(v-for="(comment, index) in comments" :key="index")
      figure.media-left
        p.image.is-64x64
          img(:src="comment.profileImage || 'https://bulma.io/images/placeholders/128x128.png'")
      .media-content
        .content
          p
            strong {{ comment.username }}
            br
            |         {{ comment.comment }}
            br
            small
              | {{ new Date(comment.createdAt).toDateString() }}
    article.media
      figure.media-left
        p.image.is-64x64
          img(src='https://bulma.io/images/placeholders/128x128.png')
      .media-content
        form(v-on:submit.prevent="handleSubmit($event)")
          .field
            p.control
              textarea#comment.textarea(placeholder='Add a comment...')
          .field
            p.control
              button#handle.button Post comment

    pre {{ repository }}
</template>

<script>
import axios from 'axios'
import RepoD from './../../components/RepoD.vue'
import RepoDI from './../../components/RepoDI.vue'

export default {
  components: {
    RepoD,
    RepoDI
  },
  async asyncData({ app, params }) {
    const { id } = params
    try {
      const {
        data: { data }
      } = await app.$axios.get(`/api/repo/${id}`)
      return {
        repository: data
      }
    } catch (error) {
      console.log(error)
      return {
        comments: [],
        repository: []
      }
    }
  },
  data() {
    return {
      comments: [],
      repository: {}
    }
  },
  async created() {
    if (this.repository) {
      try {
        const {
          data: { data }
        } = await axios.get(`/api/repo/${this.repository.id}/comment`)
        this.comments = data
      } catch (error) {
        console.log(error)
      }
    }
  },
  methods: {
    async handleSubmit({ target }) {
      const handle = target.querySelector('#handle')
      const content = target.querySelector('#comment')
      handle.enable = false
      content.enable = false

      try {
        const { value: comment } = content
        const { id: idRepository } = this.repository
        const {
          data: { data }
        } = await axios.post(`/api/repo/${this.repository.id}/comment`, {
          idRepository,
          comment
        })
        this.comments.push(data)
      } catch (error) {
        console.log(error)
      }
      handle.enable = true
      comment.enable = true
    }
  }
}
</script>
