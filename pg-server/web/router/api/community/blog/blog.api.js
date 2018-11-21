import { Router } from 'express'
import Blog from './blog.controller'

// import Comment from './comment/comment.controller'
const Comment = {}

import {
  catchException,
  getAuth,
  isAdminAuth,
  isAuth
} from './../../../../middleware'

const router = Router()

router.get(
  '/',
  catchException(async (req, res, next) => {
    const api =
      req.protocol + '://' + req.get('host') + req.originalUrl.split('?')[0]

    console.log(req.query)

    const {
      query: { full = false }
    } = req

    const data = await Blog.getBlogs({ ...req.query, api, full })
    return res.json(data)
  })
)

router.get(
  '/:id',
  catchException(async (req, res, next) => {
    const {
      params: { id },
      query: { full = false }
    } = req

    const data = await Blog.getBlogById(id, full)
    return res.json({ data })
  })
)

// API Comment

router.get(
  '/:idR/comment/',
  catchException(async (req, res, next) => {
    const {
      params: { idR: idBlog }
    } = req

    const results = await Comment.getComments(
      {
        idBlog
      },
      true
    )
    return res.json(results)
  })
)

router.get(
  '/:idR/comment/:id',
  catchException(async (req, res, next) => {
    const {
      params: { idR: idBlog, id }
    } = req

    const results = await Comment.find({
      where: {
        id,
        idBlog
      }
    })
    return res
      .status(200)
      .json(results)
      .end()
  })
)

router.use(isAuth)

router.post(
  '/:idR/comment/',
  catchException(async (req, res, next) => {
    console.log(req.user)
    const { username, id: idUser, profileImage } = req.user
    const {
      params: { idR: idBlog }
    } = req

    const result = await new Comment({
      ...req.body,
      idBlog,
      username,
      idUser
    }).save()

    return res
      .status(201)
      .json({ data: { ...result, profileImage } })
      .end()
  })
)

router.put(
  '/:idR/comment/:id',
  catchException(async (req, res, next) => {
    const { username, id: idUser } = req.user
    const {
      params: { idR: idBlog, id }
    } = req

    const results = await Comment.findOneAndUpdate(
      {
        id,
        idBlog,
        username,
        idUser
      },
      {
        ...req.body,
        id,
        idBlog,
        username,
        idUser
      }
    ).save()

    return res
      .status(201)
      .json(results)
      .end()
  })
)

router.delete(
  '/:idR/comment/:id',
  catchException(async (req, res, next) => {
    // Logger
    const { username, id: idUser } = req.user
    const {
      params: { idR: idBlog, id }
    } = req

    const results = await Comment.delete({
      id,
      idBlog,
      username,
      idUser
    })

    return res.status(204).end()
  })
)

router.use(isAdminAuth)

// Repository API

router.post(
  '/',
  catchException(async (req, res, next) => {
    delete req.body.id
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

    const repository = await Blog.findOneAndUpdate(
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

    const repository = await Blog.delete({
      id
    })

    return res
      .status(201)
      .json(repository)
      .end()
  })
)

// Commnet API

export default router
