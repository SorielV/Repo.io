import consola from 'console'
import { Router } from 'express'
import jwt from 'jsonwebtoken'
import jwtConfig from './../../../config/jwt.json'
import { User } from './../../../config/sequelize'

const router = Router()

router.post('/login', async (req, res) => {
  try {
    const { username = 'Soriel', password = 'Hacks' } = req.body
    const user = await User.find({
      where: {
        username,
        password
      },
      raw: true
    })

    consola.info(user)

    if (!user) {
      return res.status(400)
    }
    
    jwt.sign(user, jwtConfig.secret, { expiresIn: jwtConfig.tokenLife }, (error, token) => {
      if (error) consola.error(error)
      return res.status(error ? 500 : 200)
        .json(error
          ? { auth: false, message: error.message }
          : { user, token }
        )
    })
  } catch(error) {
    consola.error(error)
    return res.status(500).json({ message: error.message })
  }
})

router.get('/login/status', (req, res) => {
  const token = req.headers['x-access-token']
  if (!token) {
    return res.status(403).json({ auth: false, message: '!Token'})
  } else {
    jwt.verify(token, jwtConfig.secret, (error, user) => {
      if (error) consola.error(error)
      return res.status(err ? 500 : 200)
        .json(err
          ? { auth: false, message: 'Token no valido' }
          : user
        )
    })
  }
})

export default router
