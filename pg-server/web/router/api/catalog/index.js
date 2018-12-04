import { Router } from 'express'
import Path from 'path'
import fileUpload from 'express-fileupload'
import { catchException, getAuth, isAdminAuth } from './../../../middleware'
import { saveFile, slugify } from './../../../../utils'
import Model from './model'
import { readFileSync, writeFileSync } from 'fs'

const hasImage = ['editorial', 'topic', 'type', 'author']
const router = Router()

router.param('model', (req, res, next) => {
  const {
    params: { model }
  } = req

  if (Model.hasOwnProperty(model)) {
    req.model = model
    return next()
  } else {
    // Maybe Redirect to 404 screen
    return res.status(404).end()
  }
})

router.get(
  '/:model',
  catchException(async (req, res) => {
    const {
      query: { full = false }
    } = req

    const params = full
      ? {}
      : {
          exclude: ['description']
        }

    const items = await Model[req.model].find(params)
    return res.json({ data: items }).end()
  })
)

router.get(
  '/:model/:id',
  catchException(async (req, res) => {
    const {
      params: { id }
    } = req
    const item = await Model[req.model].findById(id)
    return res.json({ data: item }).end()
  })
)

router.use(isAdminAuth)
router.use(
  fileUpload({
    limits: { fileSize: 50 * 1024 * 1024 }
  })
)

router.post(
  '/:model/',
  catchException(async (req, res, next) => {
    const { username, id: idUser } = req.user
    const slugProperty =
      req.model === 'author' || req.model === 'editorial' ? 'name' : 'value'

    console.log(slugProperty)

    const {
      params: { model },
      body: { [slugProperty]: slugFlied = null }
    } = req

    console.log(slugFlied)
    delete req.body.id

    const slug = slugify(slugFlied || '')

    if (!slug) {
      return res
        .status(400)
        .json({ message: slugProperty + ' faltante' })
        .end()
    }

    let obj = new Model[req.model]({
      ...req.body,
      slug
    })

    if (hasImage.indexOf(model) !== -1 && req.files && req.files.image) {
      const {
        files: { image }
      } = req

      const client = '/public/repositories/' + model
      console.log(process.env.CLIENT_PATH, client)
      console.log(Path.join(process.env.CLIENT_PATH, client))

      const path = Path.join(process.env.CLIENT_PATH, client)
      const fileName = await saveFile(image, null, path)
      obj.setImage(fileName ? client + '/' + fileName : null)
    }

    const results = await obj.save()

    res
      .status(201)
      .json({ data: results })
      .end()

    if (results) {
      const catalogPath = Path.join(
        process.env.CLIENT_PATH,
        '/public/catalog',
        req.model + 's.json'
      )

      const catalog = JSON.parse(readFileSync(catalogPath) || [])

      const item = results
      item.idCatalog = item.id

      if (req.model === 'author' || req.model === 'editorial') {
        item.value = item.name
        delete item.value
      }
      delete item.id

      catalog.push(item)

      writeFileSync(catalogPath, JSON.stringify(catalog))
      console.log(`Catalogo ${req.model} [JSON] Actualizado`)
    }
    return
  })
)

router.put(
  '/:model/:id',
  catchException(async (req, res, next) => {
    const slugProperty =
      req.model === 'author' || req.model === 'editorial' ? 'name' : 'value'

    const { username, id: idUser } = req.user
    const {
      params: { id, model },
      body: { [slugProperty]: slugFlied = null }
    } = req

    delete req.body.id
    if (slugProperty.trim()) {
      req.body.slug = slugify(slugFlied)
    }

    const obj = await Model[req.model].findOne(
      {
        id
      },
      false
    )

    console.log(id, obj)

    obj.merge(
      {
        ...req.body
      },
      false
    )

    console.log(obj)
    console.log(hasImage.indexOf(model))

    if (hasImage.indexOf(model) !== -1 && (req.files && req.files.image)) {
      const {
        files: { image }
      } = req

      const client = '/public/repositories/' + model
      console.log(process.env.CLIENT_PATH, client)
      console.log(Path.join(process.env.CLIENT_PATH, client))

      const path = Path.join(process.env.CLIENT_PATH, client)
      const fileName = await saveFile(image, null, path)
      obj.updateData.image = fileName ? client + '/' + fileName : null
    }

    const results = await obj.update()

    return res
      .status(201)
      .json({ data: results })
      .end()
  })
)

router.delete(
  '/:model/:id',
  catchException(async (req, res) => {
    const {
      params: { id }
    } = req

    const result = await new Model[req.model].delete({ id })
    console.log(result)

    return res.status(204).end()
  })
)

export default router
