<template lang="pug">
  section.block(style="padding: 1% 0% 1% 0%;")
    .columns.is-multiline
      .column.is-12
        .card
          .card-content
            .content
              p.title(v-text="repository.title")
              p(v-text="repository.description")
              time(datetime="2016-1-1") {{ repository.createdAt }}
            footer.card-footer
              a.card-footer-item.has-text-info(v-if="repository.file" :href="repository.file" download)
                i.mdi.mdi-file-download
              a.card-footer-item.has-text-warning(v-if="repository.url" :href="repository.url" targer="_blank")
                i.mdi.mdi-open-in-new
              a.card-footer-item.has-text-danger(href="#")
                i.mdi.mdi-heart
      .column.is-12(v-if="repository.file")
        iframe(:src="'https://docs.google.com/viewer?embedded=true&url=' + repository.file")
</template>

<script>
export default {
  props: {
    repository: {
      type: Object,
      required: true
    }
  }
}
</script>

<style scoped>
iframe {
  height: auto;
  width: 100%;
  height: 100%;
  min-height: 500px;
}
</style>
