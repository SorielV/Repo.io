const fs = require('fs')
const Path = require('path')
const consola = require('consola')
const { promisify } = require('util')

const PATH = Path.join(__dirname, '../models/')

const folderStructure = [
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

function mkdir(path) {
  return new Promise((resolve, reject) => {
    fs.mkdir(path, error => (error ? reject({ error, path }) : resolve(path)))
  })
}

function createDir(path) {
  if (!fs.existsSync(path)) {
    return mkdir(path)
  } else {
    consola.info(`${path} existe [Omitido]`)
    return Promise.resolve(`${path} [Omitido]`)
  }
}

function dirStructur(structure, base_path) {
  const folders = []
  if (typeof structure === 'object') {
    if (Array.isArray(structure)) {
      folders.push(...structure.map(path => Path.join(base_path, path)))
    } else {
      const rootFolders = Object.keys(structure)
      folders.push(...rootFolders.map(path => Path.join(base_path, path)))
      folders.push(
        ...rootFolders
          .map(key => {
            return dirStructur(structure[key], Path.join(base_path, key))
          })
          .reduce((a, b) => {
            return a.concat(b)
          }, [])
      )
    }
  } else {
    folders.push(Path.join(base_path, structure))
  }
  return folders
}

function createFolderStructur(base_path, folderStructure) {
  consola.start('Creacion Iniciada')
  const folders = []
  for (let structure of folderStructure) {
    folders.push(...dirStructur(structure, base_path))
  }

  const promises = Promise.all(
    folders.map(folder => {
      return createDir(folder)
    })
  )
    .then(console.table)
    .then(() => consola.success('Creacion Iniciada'))
    .catch(consola.error)
}

createFolderStructur(PATH, folderStructure)
