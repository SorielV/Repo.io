import { Router } from 'express'
import { Comment } from './../../../config/sequelize'

const router = Router()

const updateParams = (data) => {
  if (data.id)
    delete data.id
  return data
}

router.put('/:id', async (req, res) => {
  try {
    delete req.body.id
    const { params: { id } } = req
    const comment = await (await Comment.findById(Number(id))).updateAttributes(req.body)
    return res.status(200).json({ data: comment })
  } catch (error) {
    console.error(error)
    return res.status(500).json({ message: error.message })
  }
})

router.delete('/:id', async (req, res) => {
  try {
    const { params: { id } } = req
    const result = await Comment.destroy({
      where: { id: Number(id) }
    })
    return res.status(result ? 204 : 400).end()
  } catch (error) {
    console.error(error)
    return res.status(500).json({ message: error.message })
  }
})

export default router
