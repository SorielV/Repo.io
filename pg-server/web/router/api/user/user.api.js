import { Router } from 'express'
import fileUpload from 'express-fileupload'
import { catchException, getAuth, isAdminAuth } from './../../../middleware'
import { saveFile } from './../../../../utils'
import jwt from 'jsonwebtoken'
import jwtConfig from './../../../../config/jwt.json'

const router = Router()
const { User } = require('./../../../../models/user')

router.get(
  '/',
  isAdminAuth,
  catchException(async (req, res) => {
    const {
      query: { full = false }
    } = req

    const items = await User.findAll()
    return res.json({ data: items }).end()
  })
)

router.get(
  '/:id',
  isAdminAuth,
  catchException(async (req, res) => {
    const {
      params: { id }
    } = req
    const item = await User.findById(id)
    return res.json({ data: item }).end()
  })
)

router.post(
  '/',
  fileUpload({
    limits: { fileSize: 50 * 1024 * 1024 }
  }),
  catchException(async (req, res, next) => {
    let obj = new User({
      ...req.body
    })

    if (req.files && req.files.ProfileImage) {
      const {
        files: { ProfileImage }
      } = req

      const client = '/public/users/profileImages/'
      console.log(Path.join(process.env.CLIENT_PATH, client))
      const path = Path.join(process.env.CLIENT_PATH, client)
      const fileName = await saveFile(ProfileImage, null, path)
      obj.setProfileImage(fileName ? client + '/' + fileName : null)
    }

    const results = await obj.save()

    req.user = results
    return next()
  }),
  (req, res) => {
    const { user } = req
    delete user.password

    jwt.sign(
      user,
      jwtConfig.secret,
      { expiresIn: jwtConfig.tokenLife },
      (error, token) => {
        if (error) {
          console.error(error)
          return res
            .status(400)
            .json({
              message: error.message
            })
            .end()
        }

        return res
          .status(200)
          .json({ data: { user, token } })
          .end()
      }
    )
  }
)

export default router
