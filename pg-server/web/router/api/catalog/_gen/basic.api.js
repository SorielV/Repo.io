import { Router } from 'express'
import { catchException, getAuth, isAdminAuth } from './../../../../middleware'

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
      return res.json(items).end()
    })
  )

  router.get(
    '/:id',
    catchException(async (req, res) => {
      const {
        params: { id }
      } = req
      const item = await Item.findById(id)
      return res.json(item).end()
    })
  )

  router.use(isAdminAuth)

  router.post(
    '/',
    catchException(async (req, res) => {
      const newItem = await new Item(req.body).save()
      return res
        .status(201)
        .json(newItem)
        .end()
    })
  )

  router.put(
    '/:id',
    catchException(async (req, res) => {
      const {
        params: { id }
      } = req

      console.log(id)

      const item = await new Item.findOneAndUpadate(
        {
          id
        },
        req.body
      )

      return res.json(item).end()
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
