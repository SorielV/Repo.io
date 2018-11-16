const token = `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBhZG1pbiIsInVzZXJuYW1lIjoiYWRtaW4iLCJmaXJzdE5hbWUiOiJBZG1pbiIsImxhc3ROYW1lIjoiSXMgQWRtaW4iLCJ0eXBlIjoxLCJjcmVhdGVkQXQiOm51bGwsInVwZGF0ZWRBdCI6bnVsbCwicHJvZmlsZUltYWdlIjoiaHR0cDovL3d3dy5ueWFuLmNhdC9jYXRzL29yaWdpbmFsLmdpZiIsImlhdCI6MTU0MjMxNzc4MSwiZXhwIjoxNTQyMzI2NzgxfQ.8oEBWnGSnrMIkKQZEZunStHklICA-QTsYwSERpb7rcE`

const axios = require('axios')
axios.defaults.baseURL = 'http://localhost:3000'
axios.defaults.headers.common['Authorization'] = `Bearer ${token}`

axios
  .get('/login/status')
  .then(({ data }) => console.log('Loged'))
  .then(console.log)
  .catch(err => {
    console.error(err.message)
  })

const Pokedex = require('./pokedex.json')

const CatalogTypes = [
  {
    id: 2,
    value: 'grass',
    description: 'Tipo de pokemon {grass}'
  },
  {
    id: 15,
    value: 'water',
    description: 'Tipo de pokemon {water}'
  },
  {
    id: 16,
    value: 'fire',
    description: 'Tipo de pokemon {fire}'
  },
  {
    id: 17,
    value: 'normal',
    description: 'Tipo de pokemon {normal}'
  },
  {
    id: 18,
    value: 'dark',
    description: 'Tipo de pokemon {dark}'
  },
  {
    id: 19,
    value: 'poison',
    description: 'Tipo de pokemon {poison}'
  },
  {
    id: 20,
    value: 'electric',
    description: 'Tipo de pokemon {electric}'
  },
  {
    id: 21,
    value: 'ice',
    description: 'Tipo de pokemon {ice}'
  },
  {
    id: 22,
    value: 'ground',
    description: 'Tipo de pokemon {ground}'
  },
  {
    id: 23,
    value: 'fairy',
    description: 'Tipo de pokemon {fairy}'
  },
  {
    id: 24,
    value: 'fighting',
    description: 'Tipo de pokemon {fighting}'
  },
  {
    id: 25,
    value: 'psychic',
    description: 'Tipo de pokemon {psychic}'
  },
  {
    id: 26,
    value: 'rock',
    description: 'Tipo de pokemon {rock}'
  },
  {
    id: 27,
    value: 'ghost',
    description: 'Tipo de pokemon {ghost}'
  },
  {
    id: 28,
    value: 'dragon',
    description: 'Tipo de pokemon {dragon}'
  },
  {
    id: 29,
    value: 'steel',
    description: 'Tipo de pokemon {steel}'
  },
  {
    id: 30,
    value: 'flying',
    description: 'Tipo de pokemon {flying}'
  },
  {
    id: 32,
    value: 'bug',
    description: 'Tipo de pokemon {bug}'
  }
]

const Topics = [
  {
    id: 24,
    value: 'pokemon'
  },
  {
    id: 25,
    value: 'anime'
  },
  {
    id: 26,
    value: 'cartoons'
  }
]

function Repositoty({
  name: title,
  ThumbnailImage: image,
  weakness: tags,
  id: _no,
  type: _type
}) {
  const no = _no
  const types = _type
  this.id = null
  this.title = title
  this.image = image
  this.tags = tags.join(',').toLowerCase()
  this.description = `${title} es el pokemon numero #${no}`

  this.save = function() {
    return new Promise(async (resolve, reject) => {
      try {
        const { data } = await axios.post('/api/repo', this)
        this.id = data.id
        return resolve(this)
      } catch (err) {
        console.log(err.message, no)
        console.log(err.response.data)
        return resolve(null)
      }
    })
  }

  this.saveTypes = function() {
    return new Promise(async (resolve, reject) => {
      const indexCatalog = types.map(type => {
        return CatalogTypes.findIndex(({ value }) => value === type)
      })

      const promises = indexCatalog.map(index => {
        const { id: idCatalog } = CatalogTypes[index]
        return axios.post(`/api/repo/${this.id}/type`, { idCatalog })
      })

      try {
        await Promise.all(promises)

        return resolve(this)
      } catch (err) {
        console.log(err.message, no)
        console.log(err.response.data)
        return resolve(null)
      }
    })
  }

  this.saveTopics = function() {
    return new Promise(async (resolve, reject) => {
      try {
        const promises = Topics.map(({ id: idCatalog }) => {
          return axios.post(`/api/repo/${this.id}/topic`, { idCatalog })
        })
        await Promise.all(promises)

        return resolve(this)
      } catch (err) {
        console.log(err.message, no)
        console.log(err.response.data)
        return resolve(null)
      }
    })
  }

  this.saveResources = function() {
    return new Promise(async (resolve, reject) => {
      try {
        const resource = {
          file: this.image,
          uploaded: false,
          type: 1
        }
        await axios.post(`/api/repo/${this.id}/resource`, resource)
        return resolve(this)
      } catch (err) {
        console.log(err.message, no)
        console.log(err.response.data)
        return resolve(null)
      }
    })
  }

  this.saveEditorials = function() {
    return new Promise(async (resolve, reject) => {
      try {
        await axios.post(`/api/repo/${this.id}/editorial`, { idCatalog: 1 })
        return resolve(this)
      } catch (err) {
        console.log(err.message, no)
        console.log(err.response.data)
        return resolve(null)
      }
    })
  }
}

const Pokemons = Pokedex.map(pokemon => new Repositoty(pokemon))
const pokePromise = Pokemons.map(pokemon => pokemon.save())

Promise.all(pokePromise)
  .then(pokemons => {
    const promises = []
    console.log('Pokemons Saved ' + pokemons.length)
    pokemons.forEach(pokemon => {
      if (pokemon) {
        promises.push(pokemon.saveTypes())
      }
    })

    return Promise.all(promises)
  })
  .then(pokemons => {
    console.log('Types of Pokemons Saved ' + pokemons.length)
    const promises = []
    pokemons.forEach(pokemon => {
      if (pokemon) {
        promises.push(pokemon.saveTopics())
      }
    })
    return Promise.all(promises)
  })
  .then(pokemons => {
    console.log('Topics of Pokemons Saved ' + pokemons.length)
    const promises = []
    pokemons.forEach(pokemon => {
      if (pokemon) {
        promises.push(pokemon)
      }
    })
    return Promise.all(promises)
  })
  .then(pokemons => {
    console.log('Editorials of Pokemons Saved ' + pokemons.length)
    const promises = []
    pokemons.forEach(pokemon => {
      if (pokemon) {
        promises.push(pokemon.saveResources())
      }
    })
    return Promise.all(promises)
  })
  .then(pokemons => {
    console.log('Resources of Pokemons Saved ' + pokemons.length)
    return pokemons
  })
  .then(console.table)
  .catch(err => {
    console.error(err.message)
    console.error(err.response.data)
  })
