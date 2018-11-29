<template lang="pug">
  div.Site
    Header
    b-modal(:active.sync='isCardModalActive', :width='640', scroll='keep')
      .card
        .card-content
          .media
            .media-left
              figure.image.is-48x48
                img(src='/public/profiles/admin.gif', alt='Image')
            .media-content
              p.title.is-4 Admin
              p.subtitle.is-6 cvallejo0@ucol.mx
          .content
            p En desarrollo => reparacion bugs, vistas e interaccion
            br
            small

    button#scrollUp.button.is-black.is-outlined
      i.mdi.mdi-chevron-up
    section.Site-content
      nuxt
    Footer
</template>

<script>
import Vuex from 'vuex'
import Header from './../components/Header.vue'
import Footer from './../components/Footer.vue'

export default {
  components: {
    Header,
    Footer
  },
  head: {
    bodyAttrs: {
      class: 'has-navbar-fixed-top'
    }
  },
  data() {
    return {
      isCardModalActive: true,
      items: [
        { title: 'Home', icon: 'home', to: { name: 'index' } },
        { title: 'Inspire', icon: 'lightbulb', to: { name: 'inspire' } }
      ]
    }
  },
  mounted() {
    const $navbarBurgers = Array.prototype.slice.call(
      document.querySelectorAll('.navbar-burger'),
      0
    )

    if ($navbarBurgers.length > 0) {
      $navbarBurgers.forEach(el => {
        el.addEventListener('click', () => {
          const target = el.dataset.target
          const $target = document.getElementById(target)
          el.classList.toggle('is-active')
          $target.classList.toggle('is-active')
        })
      })
    }

    document.getElementById('scrollUp').onclick = () => {
      document.body.scrollTop = 0
      document.documentElement.scrollTop = 0
    }

    window.onscroll = () => {
      const scrollTop =
        document.body.scrollTop || document.documentElement.scrollTop
      const scrollUp = document.getElementById('scrollUp')

      scrollUp.style.display = scrollTop > 20 ? 'block' : 'none'

      const winScroll =
        document.body.scrollTop || document.documentElement.scrollTop

      const height =
        document.documentElement.scrollHeight -
        document.documentElement.clientHeight
      const scrolled = (winScroll / height) * 100
    }
  },
  created() {
    this.$store.dispatch('loadAuth')
  }
}
</script>

<style>
html,
body {
  height: 100%;
}
.Site {
  display: flex;
  min-height: 100vh;
  flex-direction: column;
}

.Site-content {
  flex: 1;
}
#scrollUp {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  cursor: pointer;
}
</style>
