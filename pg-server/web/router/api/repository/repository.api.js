import { Router } from 'express'
import Repository from './/repository.controller'

// Model Controllers
import Model from './model'

import {
  catchException,
  getAuth,
  isAdminAuth
} from './../../../../utils/handle'

const router = Router()

router.get(
  '/',
  catchException(async (req, res, next) => {
    try {
      const results = await Repository.getRepositories()
      return res.json(results)
    } catch (err) {
      console.error(err)
      return res.status(500)
    }
  })
)

/**
 * @param {:id} => IdRepository
 * @param {:model} => Model [comment, type, topic, author, editorial, score, ...]
 */

router.param(':model', (req, res, next) => {
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
  '/:id/:model/',
  catchException(async (req, res, next) => {
    const results = await Repository.getRepositories()
    return res.json(results)
  })
)

router.use(isAdminAuth)

router.post(
  '/',
  catchException(async (req, res, next) => {
    const { username, id: idUser } = req.user
    const repository = await new Repository({
      ...req.body,
      username,
      idUser
    }).save()

    return res
      .status(201)
      .json(repository)
      .end()
  })
)

router.put(
  '/:id',
  catchException(async (req, res, next) => {
    const {
      param: { id }
    } = req

    // if is required
    const { username, id: idUser } = req.user

    const repository = await Repository.findOneAndUpdate(
      {
        id
      },
      req.body
    )

    return res
      .status(201)
      .json(repository)
      .end()
  })
)

router.delete(
  '/:id',
  catchException(async (req, res, next) => {
    const {
      param: { id }
    } = req

    // if is required
    const { username, id: idUser } = req.user

    const repository = await Repository.delete({
      id
    })

    return res
      .status(201)
      .json(repository)
      .end()
  })
)

export default router
