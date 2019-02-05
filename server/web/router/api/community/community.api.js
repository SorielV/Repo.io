import { Router } from 'express'
import BlogAPI from './blog'
import BundleAPI from './bundle'

const router = Router()

router.use('/blog', BlogAPI)
router.use('/bundle', BundleAPI)

export default router
