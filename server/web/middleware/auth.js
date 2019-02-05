import jwt from 'jsonwebtoken'
import jwtConfig from './../../config/jwt.json'

const ADMIN = 1

/*if (process.env.NODE_ENV === 'development') {
    return {
      id: 1,
      username: 'admin',
      email: 'admin@repo.io',
      firstName: 'Admin',
      lastName: 'God',
      profileImage: 'http://www.nyan.cat/cats/original.gif',
      type: 1
    }
  }*/

const getAuthUser = req => {
  return new Promise((resolve, reject) => {
    const header = req.headers.authorization
    if (!header) {
      return reject(new Error('Token no enviado'))
    } else if (header.lenght < 30) {
      return reject(new Error('Token no Valido'))
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

// Required

// Basic
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

// Admin
const isAdminAuth = async (req, res, next) => {
  try {
    const user = await getAuthUser(req)
    if (user.type === ADMIN) {
      req.user = user
      return next()
    } else {
      return res
        .status(403)
        .json({ message: 'No tienes los privilegios de administrador' })
        .end()
    }

    return next()
  } catch (error) {
    return res
      .status(403)
      .json({ message: error.message })
      .end()
  }
}

export { getAuth, isAuth, isAdminAuth }
