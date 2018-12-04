import { Router } from 'express'
import UserAPI from './user'
import RepoAPI from './repository'
import CatalogsAPI from './catalog'
import CommunityAPI from './community'
import FeedbackAPI from './feedback'

const router = Router()

router.use('/user', UserAPI)
router.use('/repo', RepoAPI)
router.use('/community', CommunityAPI)
router.use('/catalog/', CatalogsAPI)
router.use('/feedback', FeedbackAPI)

export default router
