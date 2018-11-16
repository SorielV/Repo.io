const pkg = require('./package')

module.exports = {
  mode: 'spa',
  /*
  ** Headers of the page
  */
  head: {
    title: pkg.name,
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: pkg.description }
    ],
    link: [{ rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }],
    /*
    htmlAttrs: {
      class: 'has-navbar-fixed-top'
    },
    */
    script: [{ src: '/public/navbar.js' }]
  },

  /*
  ** Customize the progress-bar color
  */
  // loading: { color: '#fff' },
  loading: '~/components/loading.vue',

  /*
  ** Global CSS
  */
  css: [],

  /*
  ** Plugins to load before mounting the App
  */
  /*
  ** Nuxt.js modules
  */
  modules: [
    // Doc: https://github.com/nuxt-community/axios-module#usage
    '@nuxtjs/axios',
    // Doc: https://buefy.github.io/#/documentation
    'nuxt-buefy'
  ],
  /*
  ** Axios module configuration
  */
  axios: {
    proxyHeaders: true,
    credentials: true,
    baseURL: process.env.API_URL || 'http://localhost:3000',
    init(axios, context) {
      axios.defaults.baseURL = context.env.API_URL || 'http://localhost:3000'
    }
    // See https://github.com/nuxt-community/axios-module#options
  },

  /*
  ** Build configuration
  */
  build: {
    /*
    ** You can extend webpack config here
    */
    extend(config, ctx) {
      // Run ESLint on save
      if (ctx.isDev && ctx.isClient) {
        config.module.rules.push({
          enforce: 'pre',
          test: /\.(js|vue)$/,
          loader: 'eslint-loader',
          exclude: /(node_modules)/
        })
      }
    }
  }
}
