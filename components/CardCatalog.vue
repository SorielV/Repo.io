<template lang="pug">
    .card.is-catalog
      header.card-header
        p.card-header-title(@click="redirectTo")
          | {{ catalog.value }}
        a.card-header-icon(href='#', aria-label='more options')
          span.icon
            i.mdi.mdi-facebook(aria-hidden='true')
      .card-content
        figure.image.is-4by3(@click="redirectTo")
          img(:src="catalog.image || '/public/empty.webp'")
      footer.card-footer
</template>

<script>
export default {
  props: {
    catalog: {
      type: Object,
      required: true
    }
  },
  methods: {
    redirectTo() {
      this.$emit('redirectTo', this.catalog)
    }
  }
}
</script>
