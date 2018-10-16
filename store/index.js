import Vuex from 'vuex'
import axios from 'axios'

/*
const isValidUser = (userStr) => {
  try {
    const user =  JSON.parse(userStr)
    return user
  } catch (error) {
    console.log(error)
    return null
  }
}
*/

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
        axios.defaults.headers.common['x-access-token'] = state.token
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
      loadAuth: async context => {
        if (process.browser) {
          try {
            const token = window.sessionStorage.getItem('token') || null
            if (!token) {
              console.log('loadAuth::Fail')
              return
            }
            axios.defaults.headers.common['x-access-token'] = token
            let { data: user } = await axios.get('/login/status')
            context.commit('login', { token, user })
          } catch (error) {
            if (error.response) {
              const {
                response: { data }
              } = error
              if (data.code && data.code === 400) {
                context.commit('clearAuth')
                $nuxt.$router.push('/login')
              }
            }
            console.log(error, Object.keys(error))
          }
        }
      },
      logout: async context => {
        try {
          await axios.post('/logout')
          context.commit('logout')
        } catch (error) {
          console.log(error)
        }
      },
      login: (context, { username, password }) => {
        return new Promise(async (resolve, reject) => {
          try {
            const { data } = await axios.post('/login', { username, password })
            context.commit('login', data)
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
