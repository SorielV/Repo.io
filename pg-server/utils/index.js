import Path from 'path'

const saveFile = (file, name, path) => {
  const extension = file.name.split('.').pop()
  const fileName = (name || Date.now()) + '.' + extension
  const fullFileName = Path.join(path, fileName)

  console.log(fullFileName)

  return new Promise((resolve, reject) => {
    file.mv(fullFileName, err => {
      if (err) {
        console.log(err)
        return resolve(null)
      } else {
        return resolve(fileName)
      }
    })
  })
}

export { saveFile }
