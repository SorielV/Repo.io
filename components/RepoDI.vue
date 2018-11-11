<template lang="pug">
  section.block(style="padding: 1% 0% 1% 0%;")
    .columns
      .column.is-8
        iframe(:src="'https://docs.google.com/viewer?embedded=true&url=' + repository.resource.lenght !== 0 ? repository.resource[0].file : ''")
      .column.is-4
        .card
          .card-image(v-if="repository.image")
            figure.image
              img(:src='repository.image' :alt='repository.image' style="max-height:500px")
          .card-content
            .content
              p.title(v-text='repository.title')
              p(v-text='repository.description')
              time(datetime='2016-1-1') {{ repository.createdAt }}
            .tags
              span.tag.is-dark(v-for="(tag, key) in repository.tags.split(',')" :key="key" v-text="tag")
            footer.card-footer
              a.card-footer-item.has-text-info(v-if="repository.file" :href="repository.file" download)
                i.mdi.mdi-file-download
              a.card-footer-item.has-text-warning(v-if="repository.url" :href="repository.url" targer="_blank")
                i.mdi.mdi-open-in-new
              a.card-footer-item.has-text-danger(href="#")
                i.mdi.mdi-heart
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
