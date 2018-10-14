import Vuex from 'vuex'
import axios from 'axios'

const store = () => {
  return new Vuex.Store({
    state: () => ({
      isAuth: false,
      token: null,
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
      login: (state, { user, token }) => {
        state.isAuth = true
        state.user = user
        state.token = token
      },
      logout: state => {
        state.isAuth = false
        state.user = {}
      }
    },
    actions: {
      logout: async context => {
        try {
          await axios.post('/logout')
          context.commit('logout')
        } catch (error) {
          console.log(error)
        }
      },
      login: async (context, { username, password }) => {
        try {
          const { data } = await axios.post('/login', { username, password })
          context.commit('login', data)
        } catch (error) {
          console.log(error)
        }
      }
    }
  })
}

export default store
