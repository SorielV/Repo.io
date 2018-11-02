import { Router } from 'express'
import Repository from './/repository.controller'

const router = Router()

router.get('/', async (req, res) => {
  try {
    const results = await Repository.getRepositories()
    return res.json(results)
  } catch (err) {
    console.error(err)
    return res.status(500)
  }
})

export default router
