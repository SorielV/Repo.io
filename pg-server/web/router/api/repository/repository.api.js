import { Router } from 'express'
import Repository from './/repository.controller'

// Model Controllers
import Model from './model'

import { catchException, getAuth, isAdminAuth } from './../../../middleware'

const router = Router()

router.get(
  '/',
  catchException(async (req, res, next) => {
    const api =
      req.protocol + '://' + req.get('host') + req.originalUrl.split('?')[0]
    const data = await Repository.getRepositories({ ...req.query, api })
    return res.json(data)
  })
)

router.get(
  '/:id',
  catchException(async (req, res, next) => {
    const {
      params: { id }
    } = req
    const data = await Repository.getRepositoryById(id)
    return res.json({ data })
  })
)

/**
 * @param {:id} => IdRepository
 * @param {:model} => Model [comment, type, topic, author, editorial, score, ...]
 */

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
  '/:idR/:model/',
  catchException(async (req, res, next) => {
    const {
      params: { idR: idRepository }
    } = req

    const results = await Model[req.model].getAll(
      {
        idRepository
      },
      true
    )
    return res.json(results)
  })
)

router.get(
  '/:idR/:model/:id',
  catchException(async (req, res, next) => {
    const {
      params: { idR: idRepository, id }
    } = req

    const results = await Model[req.model].find({
      where: {
        id,
        idRepository
      }
    })
    return res
      .status(200)
      .json(results)
      .end()
  })
)

router.use(isAdminAuth)

router.post(
  '/:idR/:model/',
  catchException(async (req, res, next) => {
    const { username, id: idUser } = req.user
    const {
      params: { idR: idRepository }
    } = req

    const results = await new Model[req.model]({
      ...req.body,
      idRepository,
      username,
      idUser
    }).save()

    return res
      .status(201)
      .json(results)
      .end()
  })
)

router.put(
  '/:idR/:model/:id',
  catchException(async (req, res, next) => {
    const { username, id: idUser } = req.user
    const {
      params: { idR: idRepository, id }
    } = req

    const results = await Model[req.model]
      .findOneAndUpdate(
        {
          id,
          idRepository
        },
        {
          ...req.body,
          id,
          idRepository,
          username,
          idUser
        }
      )
      .save()

    return res
      .status(201)
      .json(results)
      .end()
  })
)

router.delete(
  '/:idR/:model/:id',
  catchException(async (req, res, next) => {
    // Logger
    const { username, id: idUser } = req.user
    const {
      params: { idR: idRepository, id }
    } = req

    const results = await Model[req.model].delete({
      id,
      idRepository
    })

    return res.status(204).end()
  })
)

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
