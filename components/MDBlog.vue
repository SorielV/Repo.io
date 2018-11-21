<template lang="pug">
  .card.article
    .card-content
      .media
        .media-center
          img.author-image(:src="blog.profileImage || 'http://www.radfaces.com/images/avatars/daria-morgendorffer.jpg'", alt='Placeholder image')
        .media-content.has-text-centered
          p.title.article-title {{ blog.title }}
          p.subtitle.is-6.article-subtitle
            a(href='#') @{{ blog.username }}
            |  {{ blog.createdAt }}
      .content.article-body(v-html="markdown(blog.content)")
</template>

<script>
import { markdown } from 'markdown'

export default {
  props: {
    blog: {
      type: Object,
      required: true
    }
  },
  methods: {
    markdown(md) {
      return markdown.toHTML(md)
    }
  }
}
</script>
