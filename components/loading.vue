<template>
  <div
    v-if="loading"
    class="something-semantic">
    <div class="something-else-semantic">
      <figure
        class="image">
        <img
          src="http://www.nyan.cat/cats/original.gif">
      </figure>
    </div>
  </div>
</template>

<script>
export default {
  data: () => ({
    loading: false
  }),
  methods: {
    start() {
      this.loading = true
    },
    finish() {
      this.loading = false
    }
  }
}
</script>

<style scoped>
.something-semantic {
  height: 100%;
  display: table;
  width: 100%;
}
.something-else-semantic {
  display: table-cell;
  text-align: center;
  vertical-align: middle;
}
</style>
