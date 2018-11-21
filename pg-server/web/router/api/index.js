import { Router } from 'express'
import UserAPI from './user'
import RepoAPI from './repository'
import Catalogs from './catalog'
import CommunityAPI from './community'

const router = Router()

router.use('/user', UserAPI)
router.use('/repo', RepoAPI)
router.use('/community', CommunityAPI)

for (const catalogAPI in Catalogs) {
  router.use('/catalog/' + catalogAPI, Catalogs[catalogAPI])
}

export default router
