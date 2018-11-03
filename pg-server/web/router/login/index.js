import { Router } from 'express'
import { User } from './../../../models/user'
import jwt from 'jsonwebtoken'
import jwtConfig from './../../../config/jwt.json'
import {
  catchException,
  getAuth,
  isAuth,
  isAdmin
} from './../../../utils/handle'

const router = Router()

router.post(
  '/',
  catchException(async (req, res) => {
    const { username = 'Soriel', password = 'JS' } = req.body
    const user = await User.findOne({
      where: {
        username,
        password
      }
    })

    if (!user) {
      return res
        .status(400)
        .json({ message: 'Usuario y/o Password Incorrecto' })
        .end()
    }

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
          .json({ user, token })
          .end()
      }
    )
  })
)

router.use(isAuth)

router.get('/status', (req, res) => {
  const user = req.user
  return res
    .status(200)
    .json(user)
    .end()
})

export default router
