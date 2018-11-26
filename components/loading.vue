<template>
  <div 
    v-if="loading"
    class="z">
    <div
      class="something-semantic">
      <div class="something-else-semantic">
        <figure
          class="image">
          <img
            class="nyan-cat"
            src="/public/loading.gif">
        </figure>
      </div>
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
.z {
  background: rgba(0, 0, 0, 0.85);
  color: rgb(232, 232, 232);
  line-height: 1.2;
  white-space: pre;
  font-family: Menlo, Consolas, monospace;
  font-size: 13px;
  position: fixed;
  z-index: 9999;
  padding: 10px;
  left: 0px;
  right: 0px;
  top: 0px;
  bottom: 0px;
  overflow: auto;
  text-align: left;
}
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
.nyan-cat {
  width: 25%;
  margin: auto;
}
</style>
