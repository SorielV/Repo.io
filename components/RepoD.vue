<template lang="pug">
  section.block(style="padding: 1% 0% 1% 0%;")
    .columns.is-centered
      .column.is-8(v-if="repository.resource.length !== 0")
        .resource-content
          .img(v-if="repository.resource[selected].type === 1")
            img(:src="repository.resource[selected].file")
          .video(v-else-if="repository.resource[selected].type === 3")
            iframe(
              width="auto"
              height="auto"
              :src="'https://www.youtube.com/embed/' + repository.resource[selected].file.split('v=').pop()"
            )
          .video(v-else-if="repository.resource[selected].type === 4")
            iframe(
              width="auto"
              height="auto"
              :src="'https://www.youtube.com/embed/videoseries?list=' + repository.resource[selected].file.split('&list=').pop()"
            )
          .doc(v-else)
            iframe(:src="'https://docs.google.com/viewer?embedded=true&url=' + fileURL(repository.resource[selected].file)")
      .column.is-narrow
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
              //-a.card-footer-item.has-text-info(v-if="repository.file" :href="repository.file" download)
                i.mdi.mdi-file-download
              //-a.card-footer-item.has-text-warning(v-if="repository.url" :href="repository.url" targer="_blank")
                i.mdi.mdi-open-in-new
              a.card-footer-item.has-text-danger(href="#")
                i.mdi.mdi-heart
              a.card-footer-item.has-text-link(@click="shareOnFacebook")
                i.mdi.mdi-facebook
              a.card-footer-item.has-text-info(@click="shareOnTwitter")
                i.mdi.mdi-twitter
        .card(
          v-if="repository.resource.length !== 0"
          style="margin-top: 1.5rem;"
        )
          b-table(
            v-cloak
            :data="repository.resource"
            mobile-cards
            :total="table.total"
          )
            template(slot-scope="props")
              b-table-column(
                field="name"
                label="Nombre"
                :visible="true"
                sortable
              ) {{ props.row['name'] }}
                  

              b-table-column(
                field="description"
                label="Descripcion"
                :visible="true"
                sortable
              ) {{ props.row['description'] }}

              
              b-table-column(
                field="id"
                label=""
              )
                .buttons.block
                  button.button.is-info.is-small(
                    v-show="props.index !== selected"
                    @click="selectResource(props.row)"
                  )
                    i.mdi.mdi-eye
                  button.button.is-danger.is-small(@click="downloadFile(props.row)")
                    i.mdi.mdi-download
            template(slot="detail" slot-scope="props")
              .block
                .container.is-fluid
                  pre {{ props.row }}
</template>

<script>
export default {
  props: {
    repository: {
      type: Object,
      required: true
    }
  },
  data() {
    return {
      selected: 0,
      table: {
        defaultOpenedDetails: [],
        checkedRows: [],
        data: [],
        total: 0
      }
    }
  },
  methods: {
    shareOnTwitter() {
      alert('Coming Soon')
    },
    shareOnFacebook() {
      window.open(
        `https://www.facebook.com/sharer/sharer.php?u=${window.location.href}`,
        'pop',
        'width=600, height=400, scrollbars=no'
      )
    },
    downloadFile() {
      return
    },
    selectResource(resource) {
      const index = this.repository.resource.indexOf(resource)
      if (this.selected !== index) {
        this.selected = index
      }
      return
    },
    fileURL(file) {
      return file[0] === '/' ? window.location.origin + file : file
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
.resource-content {
  background: rgba(0, 0, 0, 0.85);
  width: 100%;
  height: 100%;
}
.resource-content div.img {
  display: block;
  margin: auto auto;
}
.resource-content div.doc {
  height: 100%;
}
</style>
