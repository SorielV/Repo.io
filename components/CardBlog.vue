<template lang="pug">
  .card.article
    .card-content
      .media
        .media-center
          img.author-image(:src="blog.image || 'http://www.radfaces.com/images/avatars/daria-morgendorffer.jpg'", alt='Placeholder image')
        .media-content.has-text-centered
          p.title.article-title {{ blog.title }}
          p.subtitle.is-6.article-subtitle
            a(href='#') @ {{ blog.username }}
          .content
            | {{ blog.description }}
</template>

<script>
export default {
  props: {
    blog: {
      type: Object,
      required: true
    }
  }
}
</script>
