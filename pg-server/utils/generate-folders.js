const fs = require('fs')
const Path = require('path')
const consola = require('consola')
const { promisify } = require('util')

const path = Path.join(__dirname, '../models/')

const _mkdirSync = promisify(fs.mkdirSync)
const _writeFile = promisify(fs.writeFileSync)

const structure = [
  {
    user: ['v-token']
  },
  {
    catalogs: ['author', 'editorial', 'type', 'topic']
  },
  {
    bundle: ['comment']
  },
  {
    repository: ['comment', 'score', 'type', 'topic', 'author', 'editorial']
  },
  'file'
]

async function mkdirSync(path, index) {
  if (!fs.existsSync(path)) {
    try {
      await _mkdirSync(path)
      if (index) {
        await _writeFile(path + '/index.js', '')
      }
    } catch (error) {
      consola.error(error)
    }
  } else {
    if (index) {
      await _writeFile(path + '/index.js', '')
    }
  }
  return path
}

async function createDir(structure, path = '/', index = false) {
  const results = []
  if (typeof structure === 'object') {
    if (Array.isArray(structure)) {
      const promises = []
      for (let folder of structure) {
        promises.push(mkdirSync(path + folder, index))
      }
      try {
        results.push(await Promise.all(promises))
      } catch (error) {
        consola.error(error)
        return
      }
    } else {
      for (let sub_structure in structure) {
        try {
          results.push(await mkdirSync(path + sub_structure, index))
          results.push(
            await createDir(
              structure[sub_structure],
              path + sub_structure + '/'
            )
          )
        } catch (error) {
          consola.error(error)
          return
        }
      }
    }
  } else {
    try {
      results.push(await mkdirSync(path + structure, index))
    } catch (error) {
      consola.error(error)
      return
    }
  }
  return results
}

async function createFolders(structure, path) {
  consola.start('Generando Estructuras')
  const promises = []
  for (let sub_structure of structure) {
    promises.push(createDir(sub_structure, path))
  }
  const result = await Promise.all(promises)
  console.table(result)
  return
}

createFolders(structure, path)
  .then(() => consola.success('Generadas'))
  .catch(consola.error)
