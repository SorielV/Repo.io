<template lang="pug">
  section
    .home.hero.is-black.is-medium.is-bold
      .hero-body
          .container.has-text-centered
            h1.title
              | Una alternativa de consulta recuros digitales
            h2.subtitle.has-my-1rem
              | Encuentra recursos ahora
            center
              .container.search
                .field
                  p.control.has-icons-left
                    input.input.is-rounded(placeholder='Repositorios')
                    span.icon.is-small.is-left
                      i.mdi.mdi-magnify

      .box.cta
        p.has-text-centered
          span.tag.is-primary New
          |  Ut enim ad minim veniam,
</template>

<script>
export default {
  layout: 'default',
  name: 'HomePage',
  data() {
    return {}
  }
}
</script>

<style scoped>
.home {
  width: 100% !important;
  height: 100% !important;
  position: absolute !important;
}
.has-my-1rem {
  margin-top: 1rem;
  margin-bottom: 1rem;
}
.container.search {
  width: 70%;
}
</style>
