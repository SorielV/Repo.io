import { Router } from 'express'
import fileUpload from 'express-fileupload'
import { catchException, getAuth, isAdminAuth } from './../../../../middleware'
import { saveFile } from './../../../../../utils'

const hasImage = ['editorial', 'topic', 'type']

export default function(model) {
  const router = Router()
  const { [model]: Item } = require('../../../../../models/catalogs')

  router.get(
    '/',
    catchException(async (req, res) => {
      const {
        query: { full = false }
      } = req

      const params = full
        ? {}
        : {
            exclude: ['description']
          }

      const items = await Item.find(params)
      return res.json({ data: items }).end()
    })
  )

  router.get(
    '/:id',
    catchException(async (req, res) => {
      const {
        params: { id }
      } = req
      const item = await Item.findById(id)
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
      const {
        params: { model }
      } = req

      let obj = new Item({
        ...req.body,
        idRepository,
        username,
        idUser
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

      console.log(obj)

      const results = await obj.save()

      return res
        .status(201)
        .json({ data: results })
        .end()
    })
  )

  router.put(
    '/:model/:id',
    catchException(async (req, res, next) => {
      const { username, id: idUser } = req.user
      const {
        params: { idR: idRepository, id, model }
      } = req

      const obj = await Item.findOne(
        {
          id,
          idRepository
        },
        false
      )

      obj.merge(
        {
          ...req.body,
          id,
          idRepository,
          username,
          idUser
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
        obj.setImage(fileName ? client + '/' + fileName : null)
      }

      const results = await obj.update()

      return res
        .status(201)
        .json({ data: results })
        .end()
    })
  )

  router.delete(
    '/:id',
    catchException(async (req, res) => {
      const {
        params: { id }
      } = req

      const result = await new Item.delete({ id })
      console.log(result)

      return res.status(204).end()
    })
  )

  return router
}
