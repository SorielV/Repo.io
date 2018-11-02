import jwt from 'jsonwebtoken'
import jwtConfig from './../config/jwt.json'

const ADMIN = 1

const getAuthUser = req => {
  return new Promise((resolve, reject) => {
    const header = req.headers.authorization
    if (!header) {
      return reject(new Error('Token no enviado'))
    } else {
      const token = header.substr(7).trim()
      jwt.verify(token, jwtConfig.secret, (error, user) => {
        if (error) return reject(error)
        return resolve(user)
      })
    }
  })
}

const getAuth = async (req, res, next) => {
  try {
    const user = await getAuthUser(req)
    req.user = user
    next()
  } catch (error) {
    console.log(error)
    req.user = null
    next()
  }
}

const isAuth = async (req, res, next) => {
  try {
    const user = await getAuthUser(req)
    req.user = user
    next()
  } catch (error) {
    console.log(error)
    return res
      .status(403)
      .json({ message: error.message })
      .end()
  }
}

const isAdminAuth = async (req, res, next) => {
  try {
    const user = await getAuth(req)
    if (user.type === ADMIN) {
      req.user = user
      next()
    } else {
      return res
        .status(403)
        .json({ message: 'No tienes los privilegios de administrador' })
        .end()
    }

    next()
  } catch (error) {
    return res
      .status(403)
      .json({ message: error.message })
      .end()
  }
}

const catchException = fn => (req, res, next) => {
  Promise.resolve(fn(req, res, next)).catch(err => {
    console.log(err)
    return res
      .status(500)
      .json({ message: err.message })
      .end()
  })
}

export { catchException, getAuth, isAuth, isAdminAuth }
