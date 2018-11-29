import { Router } from 'express'
import Path from 'path'
import fileUpload from 'express-fileupload'
import Repository from './/repository.controller'
import { saveFile, slugify } from './../../../../utils'

// Model Controllers
import Model from './model'

// Comment Controller
import Comment from './comment/comment.controller'

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

    console.log(req.query)

    const {
      query: { full = false }
    } = req

    if (req.query.type) {
      const type = req.query.type
      const isTypeValid = Array.isArray(type)
        ? type.every(type => !isNaN(type))
        : !isNaN(type)

      if (!isTypeValid) {
        return res.status(400).json({ message: 'Parametro Type no valido' })
      }

      if (req.query.topic) {
        const topic = req.query.topic
        const isTopicValid = Array.isArray(topic)
          ? topic.every(topic => !isNaN(topic))
          : !isNaN(topic)

        if (!isTopicValid) {
          return res.status(400).json({ message: 'Parametro Topic no valido' })
        }

        const data = await Repository.getRepositoriesByTypesandTopics({
          ...req.query,
          api,
          full
        })

        return res.json(data)
      } else {
        const data = await Repository.getRepositoriesByTypes({
          ...req.query,
          api,
          full
        })

        return res.json(data)
      }
    } else if (req.query.topic) {
      const topic = req.query.topic
      const isValid = Array.isArray(topic)
        ? topic.every(topic => !isNaN(topic))
        : !isNaN(topic)

      if (isValid) {
        const data = await Repository.getRepositoriesByTopics({
          ...req.query,
          api,
          full
        })
        return res.json(data)
      } else {
        return res.status(400).json({ message: 'Parametro Topic no valido' })
      }
    }

    const data = await Repository.getRepositories({ ...req.query, api, full })
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

// API Comment

router.get(
  '/:idR/comment/',
  catchException(async (req, res, next) => {
    const {
      params: { idR: idRepository }
    } = req

    const results = await Comment.getComments(
      {
        idRepository
      },
      true
    )
    return res.json(results)
  })
)

router.get(
  '/:idR/score/',
  catchException(async (req, res, next) => {
    const {
      params: { idR: idRepository },
      query: { full = false }
    } = req

    const api =
      req.protocol + '://' + req.get('host') + req.originalUrl.split('?')[0]

    const results = await Model['score'].getScores(idRepository, {
      ...req.query,
      api,
      full
    })

    return res.json(results)
  })
)

router.get(
  '/:idR/comment/:id',
  catchException(async (req, res, next) => {
    const {
      params: { idR: idRepository, id }
    } = req

    const results = await Comment.find({
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

// API Catalogs

/**
 * @param {:id} => IdRepository
 * @param {:model} => Model [comment, type, topic, author, editorial, score, ...]
 */

router.param('model', (req, res, next) => {
  const {
    params: { model }
  } = req

  if (model === 'comment' || Model.hasOwnProperty(model)) {
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

    const results = await Model[req.model].find(
      {
        where: { idRepository }
      },
      true
    )
    return res.json({ data: results })
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

router.use(isAuth)
router.use(
  fileUpload({
    limits: { fileSize: 50 * 1024 * 1024 }
  })
)

router.post(
  '/:idR/resource/',
  isAdminAuth,
  catchException(async (req, res, next) => {
    console.log(req.user)
    const { username, id: idUser, profileImage } = req.user
    const {
      params: { idR: idRepository }
    } = req

    delete req.body.id

    if (!req.body.file) {
      req.body.file = ''
    }

    const obj = new Model['resource']({
      ...req.body,
      idRepository,
      username,
      idUser
    })

    if (req.files && req.files.file) {
      const {
        files: { file }
      } = req

      const client = '/public/repositories/' + 'resources'
      console.log(process.env.CLIENT_PATH, client)
      console.log(Path.join(process.env.CLIENT_PATH, client))
      const path = Path.join(process.env.CLIENT_PATH, client)
      const fileName = await saveFile(file, null, path)
      obj.setFile(fileName ? client + '/' + fileName : null)
      obj.setUploaded(true)
    }

    //const results = await obj.save()
    const result = await obj.save()

    return res
      .status(201)
      .json({ data: result })
      .end()
  })
)

router.post(
  '/:idR/score/',
  catchException(async (req, res, next) => {
    const { username, id: idUser, profileImage } = req.user
    const {
      params: { idR: idRepository }
    } = req

    console.log(req.body)

    const {
      body: { score, comment }
    } = req

    console.log({ score, comment })

    if (!score && isNaN(score)) {
      return res
        .status(400)
        .json({ message: 'Score faltante' })
        .end()
    }

    delete req.body.id
    let result = {}

    const repoScore = await Model['score'].findOne(
      {
        idRepository,
        username,
        idUser
      },
      false
    )

    if (repoScore) {
      const merge = {}
      const isEqualScore = repoScore.data.score === Number(score)
      const isSameCommnet = repoScore.data.comment === comment

      if (isEqualScore & isSameCommnet) {
        return res
          .status(200)
          .json({ data: repoScore.data })
          .end()
      }

      if (!isEqualScore) merge['score'] = Number(score)
      if (!isSameCommnet) merge['comment'] = comment
      repoScore.merge(merge)
      result = await repoScore.update()
    } else {
      result = await new Model['score']({
        ...req.body,
        idRepository,
        username,
        idUser
      }).save()
    }

    return res
      .status(201)
      .json({ data: result })
      .end()
  })
)

router.post(
  '/:idR/comment/',
  catchException(async (req, res, next) => {
    console.log(req.user)
    const { username, id: idUser, profileImage } = req.user
    const {
      params: { idR: idRepository }
    } = req

    const result = await new Comment({
      ...req.body,
      idRepository,
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
      params: { idR: idRepository, id }
    } = req

    const results = await Comment.findOneAndUpadate(
      {
        id,
        idRepository,
        username,
        idUser
      },
      {
        ...req.body,
        id,
        idRepository,
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
      params: { idR: idRepository, id }
    } = req

    const results = await Comment.delete({
      id,
      idRepository,
      username,
      idUser
    })

    return res.status(204).end()
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
      .json({ data: results })
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
      .findOneAndUpadate(
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
      .json({ data: results })
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
    delete req.body.id
    const { username, id: idUser } = req.user

    const {
      body: { title = null }
    } = req

    if (!title) {
      return res.status(400).json({ message: 'Titulo no enviado' })
    }

    const slug = slugify(title)

    let repository = new Repository({
      ...req.body,
      slug,
      username,
      idUser
    })

    if (req.files && req.files.image) {
      const {
        files: { image }
      } = req

      const client = '/public/repositories/images'

      console.log(process.env.CLIENT_PATH, client)
      console.log(Path.join(process.env.CLIENT_PATH, client))
      const path = Path.join(process.env.CLIENT_PATH, client)
      const fileName = await saveFile(image, null, path)
      repository.setImage(fileName ? client + '/' + fileName : null)
    }

    repository = await repository.save()

    return res
      .status(201)
      .json({ data: repository })
      .end()
  })
)

router.put(
  '/:id',
  catchException(async (req, res, next) => {
    // if is required
    const { username, id: idUser } = req.user
    const {
      params: { id, model },
      body: { title = null }
    } = req

    if (title) {
      req.body.slug = slugify(title)
    }

    const obj = await Repository.findOne(
      {
        id
      },
      false
    )

    obj.merge(
      {
        ...req.body
      },
      false
    )

    if (req.files && req.files.image) {
      const {
        files: { image }
      } = req

      const client = '/public/repositories/images/'
      console.log(process.env.CLIENT_PATH, client)
      console.log(Path.join(process.env.CLIENT_PATH, client))

      const path = Path.join(process.env.CLIENT_PATH, client)
      const fileName = await saveFile(image, null, path)
      obj.updateData.image = fileName ? client + '/' + fileName : null
    }

    const results = await obj.update()

    /*
    const repository = await Repository.findOneAndUpadate(
      { 
        id
      },
      req.body
    )
    */

    return res
      .status(201)
      .json({ data: results })
      .end()
  })
)

router.delete(
  '/:id',
  catchException(async (req, res, next) => {
    const {
      params: { id }
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

// Commnet API

export default router
