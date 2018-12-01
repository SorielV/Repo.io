<template lang="pug">
</template>

<script>
export default {
  layout: 'null',
  mounted() {
    const [hamburger, nav, masthead] = [
      document.getElementsByClassName('hamburger'),
      document.getElementById('site-nav'),
      document.getElementById('masthead')
    ]

    Array.from(hamburger).forEach(hamburger => {
      hamburger.addEventListener('click', function(ev) {
        this.classList.toggle('is-active')
        nav.classList.toggle('is-active')
        masthead.classList.toggle('is-active')
        return false
      })
    })
  }
}

/*
const [hamburger, nav, masthead] = [
  document.getElementsByClassName('hamburger'),
  document.getElementById('site-nav'),
  document.getElementById('masthead')
]

Array.from(hamburger).forEach(hamburger => {
  hamburger.addEventListener('click', function(ev) {
    this.classList.toggle('is-active')
    nav.classList.toggle('is-active')
    masthead.classList.toggle('is-active')
    return false
  })
})
*/
</script>

<style>
.card.is-shady .card-image {
  font-size: 8rem;
  padding-top: 2rem;
  padding-bottom: 2rem;
  color: #209cee;
}
</style>
