<template lang="pug">
  .flip.flip-vertical
    .front(:style="{ backgroundImage: 'url(' + catalog.image + ')' }")
      h1.text-shadow
        | {{ catalog.value }}
    .back(@click="redirectTo" style="cursor: pointer;")
      | {{ catalog.value }}
      p
        | {{ catalog.description }}
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

<style>
h1 {
  font-size: 2.2em;
}

.flip {
  position: relative;
}
.flip > .front,
.flip > .back {
  display: block;
  transition-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1.275);
  transition-duration: 0.5s;
  transition-property: transform, opacity;
}
.flip > .front {
  transform: rotateY(0deg);
}
.flip > .back {
  position: absolute;
  opacity: 0;
  top: 0px;
  left: 0px;
  width: 100%;
  height: 100%;
  transform: rotateY(-180deg);
}
.flip:hover > .front {
  transform: rotateY(180deg);
}
.flip:hover > .back {
  opacity: 1;
  transform: rotateY(0deg);
}
.flip.flip-vertical > .back {
  transform: rotateX(-180deg);
}
.flip.flip-vertical:hover > .front {
  transform: rotateX(180deg);
}
.flip.flip-vertical:hover > .back {
  transform: rotateX(0deg);
}

.flip {
  position: relative;
  display: inline-block;
  margin-right: 2px;
  margin-bottom: 1em;
  width: 400px;
}
.flip > .front,
.flip > .back {
  display: block;
  color: white;
  width: inherit;
  background-size: cover !important;
  background-position: center !important;
  height: 220px;
  padding: 1em 2em;
  background: #313131;
  border-radius: 3px;
}
.flip > .front p,
.flip > .back p {
  font-size: 0.9125rem;
  line-height: 160%;
  color: #999;
}
</style>
