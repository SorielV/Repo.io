<template lang="pug">
  .card.large
    .card-image
      figure.image
        img(
          :src="bundle.image || 'https://images.unsplash.com/photo-1475778057357-d35f37fa89dd?dpr=1&auto=compress,format&fit=crop&w=1920&h=&q=80&cs=tinysrgb&crop='"
          alt='Image'
          @click="handle"
        )
    .card-content
      .media
        .media-left
          figure.image.is-96x96
            img(:src="bundle.profileImage || 'https://i.imgsafe.org/a4/a4bb9acc5e.jpeg'", alt='Image')
        .media-content
          p.title.is-4.no-padding(@click="handle") {{ bundle.title }}
          p 
            span.title.is-6
              a(href='http://twitter.com/#') @ {{ bundle.username }}
          // p.subtitle.is-6 Lead Developer
      .content
        p {{ bundle.description }}
</template>

<script>
export default {
  props: {
    bundle: {
      type: Object,
      required: true
    }
  },
  methods: {
    handle() {
      this.$emit('handle', this.bundle)
    }
  }
}
</script>
