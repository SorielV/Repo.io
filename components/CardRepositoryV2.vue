<template lang="pug">
  .post-module
    // Thumbnail
    .thumbnail
      .topics.has-text-centered
        template
          nuxt-link(
            v-for="(topic, topicIndex) in repository.topic"
            :key='topicIndex'
            :to="'/repo/topics/' + topic.id"
          )
            span.tag(
              v-text="topic.value"
            )
      img(:src='repository.image' @click="handleViewRepo")
    // Post Content
    .post-content
      .types(v-if="repository.type.length !== 0")
        nuxt-link.has-text-white(
          :to="'/repo/types/' + type.id"
          v-for='(type, typeIndex) in repository.type'
          :key='typeIndex'
        ) {{ type.value }}
      h1.title(@click="handleViewRepo" style="cursor: pointer;") {{ repository.title }}
      //h2.sub_title The city that never sleeps.
      p.description {{ repository.description }}
      .post-meta.has-text-centered
        span.timestamp
          i.mdi.mdi-clock
        span.starts
          | ★ {{ repository.score && repository.reviews ? repository.score : '-' }}
        span.comments
          i.mdi.mdi-comment
          a(@click="handleViewRepo") {{ repository.comments || 0 }}
</template>

<script>
export default {
  props: {
    repository: {
      type: Object,
      required: true
    }
  },
  mounted() {
    const elements = document.getElementsByClassName('post-module')
    Array.from(elements).forEach(el => {
      el.onmouseover = function(ev) {
        const [description] = this.getElementsByClassName('description')
        description.style.display = 'block'
      }
      el.onmouseleave = function(ev) {
        const [description] = this.getElementsByClassName('description')
        description.style.display = 'none'
      }
    })
  },
  methods: {
    handleViewRepo() {
      this.$emit('handleViewRepo', this.repository)
    },
    handleViewType(type) {
      this.$emit('handleViewType', type)
    }
  }
}
</script>

<style scoped>
.has-my-5px {
  margin-top: 8px;
}
.post-module {
  position: relative;
  z-index: 1;
  display: block;
  background: #ffffff;
  min-width: 270px;
  height: 470px;
  -webkit-box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.15);
  box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.15);
  -webkit-transition: all 0.3s linear 0s;
  -moz-transition: all 0.3s linear 0s;
  -ms-transition: all 0.3s linear 0s;
  -o-transition: all 0.3s linear 0s;
  transition: all 0.3s linear 0s;
}
.post-module:hover,
.hover {
  -webkit-box-shadow: 0px 1px 35px 0px rgba(0, 0, 0, 0.3);
  -moz-box-shadow: 0px 1px 35px 0px rgba(0, 0, 0, 0.3);
  box-shadow: 0px 1px 35px 0px rgba(0, 0, 0, 0.3);
}
.post-module:hover .thumbnail img,
.hover .thumbnail img {
  -webkit-transform: scale(1.1);
  -moz-transform: scale(1.1);
  transform: scale(1.1);
  opacity: 0.6;
}
.post-module .thumbnail {
  /*background: #000000;*/
  height: 400px;
  overflow: hidden;
}
.post-module .thumbnail .topics {
  color: white;
  position: absolute;
  /*background-color: rgba(10, 10, 10, 0.86) !important;*/
  background: none;
  width: 100%;
  z-index: 1;
}
.post-module .thumbnail .topics a {
  margin-right: 0.5rem;
}
.post-module .thumbnail .date {
  position: absolute;
  top: 20px;
  right: 20px;
  z-index: 1;
  background: #e74c3c;
  width: 100px;
  height: 55px;
  padding: 12.5px 0;
  -webkit-border-radius: 100%;
  -moz-border-radius: 100%;
  border-radius: 100%;
  color: #ffffff;
  font-weight: 700;
  text-align: center;
  -webkti-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
.post-module .thumbnail .date .day {
  font-size: 18px;
}
.post-module .thumbnail .date .month {
  font-size: 12px;
  text-transform: uppercase;
}
.post-module .thumbnail img {
  display: block;
  width: 120%;
  -webkit-transition: all 0.3s linear 0s;
  -moz-transition: all 0.3s linear 0s;
  -ms-transition: all 0.3s linear 0s;
  -o-transition: all 0.3s linear 0s;
  transition: all 0.3s linear 0s;
}
.post-module .post-content {
  position: absolute;
  bottom: 0;
  background: #ffffff;
  width: 100%;
  padding: 30px;
  -webkti-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
  -moz-transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
  -ms-transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
  -o-transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
  transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
}
.post-module .post-content .types {
  position: absolute;
  top: -34px;
  left: 0;
  background: #e74c3c;
  padding: 10px 15px;
  color: #ffffff;
  font-size: 14px;
  font-weight: 600;
  text-transform: uppercase;
}
.post-module .post-content .types a {
  margin-right: 0.5rem;
}
.post-module .post-content .title {
  margin: 0;
  padding: 0 0 10px;
  color: #333333;
  font-size: 26px;
  font-weight: 700;
}
.post-module .post-content .sub_title {
  margin: 0;
  padding: 0 0 20px;
  color: #e74c3c;
  font-size: 20px;
  font-weight: 400;
}
.post-module .post-content .description {
  display: none;
  color: #666666;
  font-size: 14px;
  line-height: 1.8em;
}
.post-module .post-content .post-meta {
  margin: 30px 0 0;
  color: #999999;
}
.post-module .post-content .post-meta .timestamp {
  margin: 0 16px 0 0;
}
.post-module .post-content .post-meta .starts {
  margin: 0 16px 0 0;
}
.post-module .post-content .post-meta a {
  color: #999999;
  text-decoration: none;
}
.hover .post-content .description {
  display: block !important;
  height: auto !important;
  opacity: 1 !important;
}
</style>
