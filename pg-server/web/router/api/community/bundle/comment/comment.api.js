import { Router } from 'express'

// TODO: API Comment
// import Comment from './comment.controller'
const Comment = {}

// Model Controllers
import Model from './../model'

import {
  catchException,
  getAuth,
  isAdminAuth,
  isAuth
} from './../../../middleware'

const router = Router()

router.get(
  '/',
  catchException(async (req, res, next) => {
    const api =
      req.protocol + '://' + req.get('host') + req.originalUrl.split('?')[0]
    const data = await Comment.getComments({ ...req.query, api })
    return res.json(data)
  })
)

router.get(
  '/:id',
  catchException(async (req, res, next) => {
    const {
      params: { id }
    } = req
    const data = await Comment.getRepositoryById(id)
    return res.json({ data })
  })
)

router.use(isAuth)

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
