import { Router } from 'express'
import { getAll } from './user.controller'

const router = Router()

router.get('/', getAll).post('/', getAll)

export default router
