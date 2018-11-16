import Vuex from 'vuex'

const store = () => {
  return new Vuex.Store({
    state: () => ({
      isAuth: false,
      token: process.browser ? sessionStorage.getItem('token') : null,
      user: {}
    }),
    getters: {
      user: state => {
        return state.user
      },
      isAuth: state => {
        return state.isAuth
      }
    },
    mutations: {
      clearAuth: state => {
        state.token = null
        state.user = {}
        state.isAuth = false
        if (process.browser) {
          window.sessionStorage.removeItem('token')
          window.sessionStorage.removeItem('user')
        }
      },
      setAuth: (state, token, user) => {
        state.token = token
        state.user = user
        state.isAuth = true
      },
      login: (state, { user, token }) => {
        state.isAuth = true
        state.user = user
        state.token = token
        if (process.browser) {
          window.sessionStorage.setItem('token', state.token)
          window.sessionStorage.setItem('user', JSON.stringify(state.user))
        }
      },
      logout: state => {
        state.isAuth = false
        state.user = {}
      }
    },
    actions: {
      loadAuth({ commit, state }) {
        return new Promise(async (resolve, reject) => {
          if (!process.browser) return reject()

          try {
            const currentToken = window.sessionStorage.getItem('token') || null
            if (!currentToken) {
              console.log('loadAuth::Fail')
              return
            }

            this.$axios.defaults.headers.common[
              'Authorization'
            ] = `Bearer ${currentToken}`

            const {
              data: { user = {}, token = null }
            } = await this.$axios.get('/login/status')

            this.$axios.defaults.headers.common[
              'Authorization'
            ] = `Bearer ${token}`

            commit('login', { token, user })
          } catch (error) {
            if (error.response) {
              const {
                response: { data }
              } = error

              if (data.code && data.code === 400) {
                commit('clearAuth')
                $nuxt.$router.push('/login')
                return resolve()
              }

              return resolve()
            }
          }
        })
      },
      async logout({ commit }) {
        try {
          await this.$axios.post('/logout')
          commit('logout')
        } catch (error) {
          console.log(error)
        }
      },
      login({ commit }, { username, password }) {
        return new Promise(async (resolve, reject) => {
          try {
            const {
              data: { user, token }
            } = await this.$axios.post('/login', { username, password })

            this.$axios.defaults.headers.common[
              'Authorization'
            ] = `Bearer ${token}`

            commit('login', { user, token })
            return resolve()
          } catch (error) {
            return reject(error)
          }
        })
      }
    }
  })
}

export default store
