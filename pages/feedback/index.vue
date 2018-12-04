<template lang="pug">
  section
    section.hero.is-fullheight
      .hero-body
        .container
          p.title Sugerencias
          p.subtitle Solucion de errores bugs, funcionalidad, etc
          form(v-on:submit.prevent="handleSubmitFeedback")
            b-field(
              label="Titulo"
            )
              b-input(
                type="text"
                v-model="feedback.title"
                value=""
                maxlength="45"
                :required="true"
              )

            b-field(
              label="Descripcion"
            )
              b-input(
                type="textarea"
                v-model="feedback.description"
                value=""
                maxlength="1200"
                :required="true"
              )

            b-field(
              label="Propuesta"
            )
              b-input(
                v-model="feedback.solution"
                placeholder="No requerido"
                maxlength="1200"
                :required="false"
              )

            b-field(
              label="Enlace"
            )
              b-input(
                v-model="feedback.url"
                placeholder="Enlace"
                maxlength="255"
                :required="false"
              )
          
            b-field(
              label="Prioridad"
            )
              .select
                select
                  option(value="1") Baja
                  option(value="2") Media
                  option(value="3") Alta
                  option(value="4") Muy Alta
            .buttons.is-left
              button.button.is-danger
                | Enviar
    //section.hero.is-dark.is-fullheight
      .hero-body
        .container
          p.title Pendientes
</template>

<script>
export default {
  data() {
    return {
      feedback: {}
    }
  },
  methods: {
    handleSubmitFeedback() {
      try {
        const { data: feedback } = this.$axios.post(
          '/api/feedback',
          this.feedback
        )

        this.$toast.open({
          message: 'Feedback enviado correctamente C:',
          type: 'is-success'
        })

        this.feedback = {}
      } catch (error) {
        console.log(error)
        this.$toast.open({
          message: 'Error al enviar feedback',
          type: 'is-danger'
        })
      }
    }
  }
}
</script>
