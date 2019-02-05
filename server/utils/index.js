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

/**
 * https://gist.github.com/mathewbyrne/1280286
 * @Author {mathewbyrne}
 */
function slugify(text) {
  return text
    .toString()
    .toLowerCase()
    .replace(/\s+/g, '-') // Replace spaces with -
    .replace(/[^\w\-]+/g, '') // Remove all non-word chars
    .replace(/\-\-+/g, '-') // Replace multiple - with single -
    .replace(/^-+/, '') // Trim - from start of text
    .replace(/-+$/, '') // Trim - from end of text
}

export { saveFile, slugify }
