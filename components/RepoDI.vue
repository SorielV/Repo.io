<template lang="pug">
  section.block(style="padding: 1% 0% 1% 0%;")
    .columns.is-gapless
      .column.is-auto
        .card.is-horizontal
          .card-image
            figure.image.is-256x246
              img(:src="repository.image || '/public/loading.gif'")
            //-.is-overlay
              .hearty
          .card-stacked(v-if="tabSelected === 1")
            .card-content
              .media-content
                .header.is-flex-desktop.is-inline-flex-mobile
                  p.title(v-text='repository.title')
                  fieldset.starability-basic(style="margin-left: auto;" @click="handleModalScore" v-if="score")
                    legend.small.has-text-centered(style="font-size: 0.7rem;" v-if="score.avg !== null ")
                      | {{ scoreText }}
                    input#rate0(type='radio', name='rating', :value='0' v-model="score.avgFixed" disabled="true")
                    input#rate1(type='radio', name='rating', :value='1' v-model="score.avgFixed" disabled="true")
                    label(for='rate1', ) 1 star
                    input#rate2(type='radio', name='rating', :value='2' v-model="score.avgFixed" disabled="true")
                    label(for='rate2', title='') 2 stars
                    input#rate3(type='radio', name='rating', :value='3' v-model="score.avgFixed" disabled="true")
                    label(for='rate3', title='') 3 stars
                    input#rate4(type='radio', name='rating', :value='4' v-model="score.avgFixed" disabled="true")
                    label(for='rate4', title='') 4 stars
                    input#rate5(type='radio', name='rating', :value='5' v-model="score.avgFixed" disabled="true")
                    label(for='rate5', title='') 5 stars

              .content
                .tags
                  span.small.tag(v-for="(topic, index) in repository.topic" :key='index')
                    | {{ topic.value }}
                p(v-text='repository.content')
                time(datetime='2016-1-1') {{ new Date(repository.updatedAt || repository.createdAt).toLocaleString() }}
          .card-stacked(v-if="tabSelected === 2")
            .card-content
              .media-content
                p.title Recursos
              .content
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
                          @click="selectResource(props.row)"
                        )
                          i.mdi.mdi-eye
                        button.button.is-danger.is-small(@click="downloadFile(props.row)")
                          i.mdi.mdi-download
                  template(slot="detail" slot-scope="props")
                    .block
                      .container.is-fluid
                        pre {{ props.row }}
      .column.is-narrow
        .is-flex
          div
            button.button(@click="tabSelected = 1")
              i.mdi.mdi-information-outline
          div(v-if="repository.resource.length !== 0")
            button.button(@click="tabSelected = 2")
              i.mdi.mdi-file-multiple
          div
            button.button.is-link(@click="shareOnFacebook")
              i.mdi.mdi-facebook
          div
            button.button.is-link(@click="shareOnTwitter")
              i.mdi.mdi-twitter
    //Modal Resources
    b-modal(:active.sync="isModalActive")
      .resource-content(v-if="isModalActive")
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
    // Submit Review
    b-modal(:active.sync="isModalScoreActive")
      form.box(v-on:submit.prevent="handleSubmitReview")
        .is-flex
          figure.image.is-48x48
            img(:src="$store.state.user.profileImage || 'https://bulma.io/images/placeholders/128x128.png'")
          fieldset.starability-basic(style="margin-left: auto;")
            legend.small.has-text-centered(style="font-size: 0.7rem;" v-if="score.avg !== null ")
              | {{ review.score }}
            input#rate1P(type='radio', name='ratingp', :value='1' v-model="review.score")
            label(for='rate1P', title='Terrible') 1 star
            input#rate2P(type='radio', name='ratingp', :value='2' v-model="review.score")
            label(for='rate2P', title='Not good') 2 stars
            input#rate3P(type='radio', name='ratingp', :value='3' v-model="review.score")
            label(for='rate3P', title='Average') 3 stars
            input#rate4P(type='radio', name='ratingp', :value='4' v-model="review.score")
            label(for='rate4P', title='Very good') 4 stars
            input#rate5P(type='radio', name='ratingp', :value='5' v-model="review.score")
            label(for='rate5P', title='Amazing') 5 stars
        .field(style="margin:0;")
          b-input#comment(
            maxlength="255"
            type="textarea"
            placeholder="Review"
            :required='true'
            v-model="review.comment"
          )
        .buttons.is-centered(style="margin-top: 0.5rem;")
          button#handle.button.is-info Resenar
</template>

<script>
export default {
  props: {
    repository: {
      type: Object,
      required: true
    },
    score: {
      type: Object,
      required: false,
      default: null
    }
  },
  data() {
    return {
      review: {
        score: 0,
        comment: ''
      },
      isModalScoreActive: false,
      isModalActive: false,
      tabSelected: 1,
      selected: 0,
      table: {
        defaultOpenedDetails: [],
        checkedRows: [],
        data: [],
        total: 0
      }
    }
  },
  computed: {
    scoreText() {
      return (
        Number(this.score.avg).toFixed(2) +
        '/5 de ' +
        this.score.count +
        ' Reviews'
      )
    }
  },
  methods: {
    handleModalScore() {
      this.isModalScoreActive = true
      this.review.score = 5
    },
    handleSubmitReview() {
      this.$emit('handleSubmitReview', this.review)
    },
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
      this.isModalActive = true
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
@media only screen and (max-width: 768px) {
  .is-256x246 {
    height: 128px !important;
    width: 128px !important;
  }
  .card.is-horizontal {
    display: block !important;
  }
}
.is-256x246 {
  height: 412px;
  width: 412px;
}
.is-256x246 img {
  max-height: 100%;
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
</style>
