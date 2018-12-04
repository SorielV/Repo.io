<template lang="pug">
  div.container(style="padding: 1% 0% 1% 0%;")
    RepoDI(
      :repository="repository"
      :score="score"
      :isReviewModalActive="isReviewModalActive"
      @handleSubmitReview="handleSubmitReview"
    )

    b-tabs.block(position="is-centered")
      // Comentarios
      b-tab-item(label="Comentarios")
        article.media(v-for="(comment, index) in comments" :key="index")
          figure.media-left
            p.image.is-64x64
              img(:src="comment.profileImage || 'https://bulma.io/images/placeholders/128x128.png'")
          .media-content
            .content
              p
                strong {{ comment.username }}
                br
                | {{ comment.comment }}
                br
                small
                  | {{ new Date(comment.createdAt).toDateString() }}
        // Nuevo Comentario
        article.media(v-if='$store.state.isAuth')
          figure.media-left
            p.image.is-64x64
              img(:src="$store.state.user.profileImage || 'https://bulma.io/images/placeholders/128x128.png'")
          .media-content
            form(v-on:submit.prevent="handleSubmit($event)")
              .field(style="margin:0;")
                b-input#comment(maxlength="255" type="textarea" v-model="comment.comment")
              .field
                p.control
                  button#handle.button.is-info(type='submit' :class="[isSendingComment ? 'is-loading' : '']") Comentar
        section(v-else)
          .buttons.is-centered
            nuxt-link(to="/login").button.is-info
              span(title='Ingresa C:') Ingresa
            nuxt-link(to="/singup").button.is-danger
              span.icon
                i.mdi.mdi-account
              span(title='Registro C:') Registro
      // Reviews
      b-tab-item(label="Reviews")
        article.media(v-for="(comment, index) in reviews" :key="index")
          figure.media-left
            p.image.is-64x64
              img(:src="comment.profileImage || 'https://bulma.io/images/placeholders/128x128.png'")
          .media-content
            .content
              p
                strong {{ comment.username }} 
                  i {{ '★'.repeat(comment.score) }}
                br
                | {{ comment.comment }}
                br
                small
                  | {{ new Date(comment.createdAt).toDateString() }}
        // Nuevo Reviews
        article.media(v-if='$store.state.isAuth')
          figure.media-left
            p.image.is-64x64
              img(:src="$store.state.user.profileImage || 'https://bulma.io/images/placeholders/128x128.png'")
          .media-content
            form(v-on:submit.prevent="handleSubmit($event)")
              //-.field(style="margin:0;")
                b-input#comment(maxlength="255" type="textarea" v-model="comment.comment")
              .field
                p.control
                  button#handle.button.is-info(:class="[isSendingReview ? 'is-loading' : '']" @click="isReviewModalActive = true") Nueva Resenia
        section(v-else)
          .buttons.is-centered
            nuxt-link(to="/login").button.is-info
              span(title='Ingresa C:') Ingresa
            nuxt-link(to="/singup").button.is-danger
              span.icon
                i.mdi.mdi-account
              span(title='Registro C:') Registro
</template>

<script>
import RepoDI from './../../components/RepoDI.vue'

export default {
  components: {
    RepoDI
  },
  async asyncData({ app, params: { id } }) {
    try {
      const {
        data: { data }
      } = await app.$axios.get(`/api/repo/${id}?format=full`)
      return {
        repository: data
      }
    } catch (error) {
      console.log(error.message)
      return {
        comments: [],
        repository: []
      }
    }
  },
  data() {
    return {
      isReviewModalActive: false,
      score: {
        count: 0,
        avg: 0
      },
      comment: {
        comment: ''
      },
      isSendingComment: false,
      isSendingReview: false,
      reviews: [],
      comments: [],
      repository: {}
    }
  },
  async created() {
    if (this.repository) {
      try {
        const {
          data: { data }
        } = await this.$axios.get(`/api/repo/${this.repository.id}/comment`)
        this.comments = data
      } catch (error) {
        console.log(error.message)
      }

      try {
        const {
          data: { data, avg, total }
        } = await this.$axios.get(
          `/api/repo/${this.repository.id}/score?full=true`
        )

        this.score.avg = avg || 0
        this.score.avgFixed = Math.round(avg || 0)
        this.score.count = total
        this.reviews = data
      } catch (error) {
        console.log(error.message)
      }
    }
  },
  methods: {
    async handleSubmitReview({ score, comment }) {
      const {
        user: { profileImage }
      } = this.$store.state

      const { id: idRepository } = this.repository
      const index = Array.from(this.reviews).findIndex(
        ({ id }) => id === idRepository
      )
      const {
        data: { data: review }
      } = await this.$axios.post(`/api/repo/${idRepository}/score`, {
        score,
        comment
      })

      if (index !== -1) {
        this.reviews.splice(index, 1, review)
      } else {
        this.reviews.push({ ...review, profileImage })
      }
    },
    async handleSubmit({ target }) {
      try {
        const { id: idRepository } = this.repository
        const { comment } = this.comment
        this.isSendingComment = true

        const {
          data: { data }
        } = await this.$axios.post(`/api/repo/${idRepository}/comment`, {
          idRepository,
          comment
        })

        this.comments.push(data)
        this.comment.comment = ''
        this.isSendingComment = false
      } catch (error) {
        console.log(error.message)
      }
    }
  }
}
</script>
