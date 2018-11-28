import { Router } from 'express'
import fileUpload from 'express-fileupload'
import { catchException, getAuth, isAdminAuth } from './../../../middleware'
import { saveFile } from './../../../../utils'

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
    return res.json(req.user).end()
  }
)

export default router
