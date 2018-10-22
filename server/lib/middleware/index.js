import jwt from 'jsonwebtoken'
import jwtConfig from './../../config/jwt.json'

export function isAuth(req, res, next) {
  try {
    const token = req.headers['x-access-token']
    if (!token) {
      return res
        .status(403)
        .json({ auth: false, message: 'Token no enviado' })
        .end()
    } else {
      jwt.verify(token, jwtConfig.secret, (error, user) => {
        if (error) {
          consola.error(error)
          return res
            .status(500)
            .json({ message: 'Opps' })
            .end()
        } else {
          req.user = user
          next()
        }
      })
    }
  } catch (error) {
    console.error(error)
    return res
      .status(403)
      .json({ isAuth: false, message: 'Peticion no autentificada' })
      .end()
  }
}
