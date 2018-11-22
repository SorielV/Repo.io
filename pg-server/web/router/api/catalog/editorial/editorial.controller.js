import { CatalogEditorial } from '../../../../../models/catalogs'

export default CatalogEditorial

/*
import { Router } from 'express'
import { CatalogEditorial as Item } from '../../../../../models/catalogs'
import {
  catchException,
  getAuth,
  isAdminAuth
} from '../../../../../utils/handle'

const router = Router()

router.get(
  '/',
  catchException(async (req, res) => {
    const items = await Item.find()
    return res.json(items).end()
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

export default router
*/
