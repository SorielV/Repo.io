<template lang="pug">
  div
    .something-semantic
      .something-else-semantic
        figure.image.is-5by4
          img.loading-image(src="http://www.nyan.cat/cats/original.gif")
</template>

<script>
export default {}
</script>

<style scoped>
.something-semantic {
  height: 100% !important;
  display: table;
  width: 100% !important;
}
.something-else-semantic {
  display: table-cell;
  text-align: center;
  vertical-align: middle;
}
.loading-image {
  height: 500px !important;
  width: 500px !important;
}
</style>
