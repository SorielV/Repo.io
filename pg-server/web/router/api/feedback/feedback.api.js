import { Router } from 'express'
import { catchException } from './../../../middleware/handle'
import Item from './feedback.controller'

const router = Router()

router.get(
  '/',
  catchException(async (req, res) => {
    const {
      query: { full = false }
    } = req

    const items = await Item.find()
    return res.json({ data: items }).end()
  })
)

router.post(
  '/',
  catchException(async (req, res, next) => {
    const {
      params: { model }
    } = req

    delete req.body.id
    const item = new Item({
      ...req.body
    }).save()

    return res
      .status(201)
      .json({ data: item })
      .end()
  })
)

export default router
