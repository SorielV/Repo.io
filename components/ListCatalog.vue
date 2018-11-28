<template lang="pug">
  .card.is-horizontal
    .card-image
      figure.image.is-256x246
        img(:src="catalog.image || '/public/empty.webp'")
    .card-stacked
      .card-content
        .media-content
          p.subtitle.is-6 {{ catalog.slug }}
          p.title(@click="redirectTo") {{ catalog[titleProp] }}
        .content
          p(v-text='catalog.description')
</template>

<script>
export default {
  props: {
    titleProp: {
      type: String,
      required: false,
      default: 'value'
    },
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

<style scoped>
.has-my-1rem {
  margin-top: 1rem;
  margin-bottom: 1rem;
}
.has-py-1rem {
  padding-top: 1rem;
  padding-bottom: 1rem;
}
.title {
  font-size: 1.5rem;
}

.card-title {
  margin-bottom: 0.75rem;
}

.card-subtitle {
  margin-top: -0.375rem;
  margin-bottom: 0;
}

.card-text:last-child {
  margin-bottom: 0;
}

.card-link:hover {
  text-decoration: none;
}

.card-link + .card-link {
  margin-left: 1.25rem;
}

.card-header {
  padding: 0.75rem 1.25rem;
  margin-bottom: 0;
  background-color: rgba(0, 0, 0, 0.03);
  border-bottom: 1px solid rgba(0, 0, 0, 0.125);
}

.card-header:first-child {
  border-radius: calc(0.25rem - 1px) calc(0.25rem - 1px) 0 0;
}

.card-header + .list-group .list-group-item:first-child {
  border-top: 0;
}

.card-footer {
  padding: 0.75rem 1.25rem;
  background-color: rgba(0, 0, 0, 0.03);
  border-top: 1px solid rgba(0, 0, 0, 0.125);
}

.card-footer:last-child {
  border-radius: 0 0 calc(0.25rem - 1px) calc(0.25rem - 1px);
}

.component-fade-enter,
.component-fade-leave-to
/* .component-fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}
.has-pt-1rem {
  margin-top: 1rem;
}
/* List */
@media only screen and (max-width: 768px) {
  .is-256x246 {
    height: 128px !important;
    width: 128px !important;
  }
}
.is-256x246 {
  height: 256px;
  width: 256px;
}
.card.is-horizontal {
  display: flex;
}
.card.is-horizontal .card-image {
  width: auto;
  height: 100%;
}
.card.is-horizontal .card-stacked {
  flex-direction: column;
  flex: 1 1 auto;
  display: flex;
  position: relative;
}
.card.is-horizontal .card-stacked .card-content {
  flex-grow: 1;
}
figure.image.is-256x246 img {
  height: 100%;
}
</style>
