import { Router } from 'express'
import { User } from './../../../config/sequelize'

const router = Router()

router.get('/', async (req, res) => {
  try {
    const { query: { all = false }, query: { page = 1 }, query: { limit = 5 } } = req
    const offset = (Number(page) - 1) * Number(limit);
    let data

    if (all) {
      data = await User.findAll()
      return res.status(200).json({
        data
      })
    } else {
      const { count, rows } = await User.findAndCountAll({
        limit: Number(limit),
        offset,
        $sort: { id: 1 }
      })

      return res.status(200).json({
        total: count,
        prevPage: page - 1 > 0 ? `http://localhost:4000/api/user?page=${(Number(page) - 1)}&limit=${limit}` : null,
        nextPage: count > (offset + (Number(page) * Number(limit))) ? `http://localhost:4000/api/user?page=${(Number(page) + 1)}&limit=${limit}`: null,
        params: {
          limit: Number(limit),
          page: Number(page)
        },
        data: rows
      })
    }
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: error.message })
  }
})

/* GET user by ID. */
router.get('/:id', async (req, res) => {
  try {
    const id = Number(req.params.id)
    const user = await User.findById(id)
    return res.status(user ? 200: 404).json({ data: user })
  } catch (error) {
    console.error(error)
    return res.status(500).json({ message: error.message })
  }
})

router.post('/', async (req, res) => {
  try {
    const user = (await User.create(req.body)).get({ plain: true })
    return res.status(user ? 201 : 500).json({ data: user });
  } catch (error) {
    console.error(error)
    return res.status(500).json({ message: error.message })
  }
})

const updateParams = (data) => {
  if (data.id)
    delete data.id
  return data
}

router.put('/:id', async (req, res) => {
  try {
    const { params: { id } } = req
    const user = await (await User.findById(Number(id))).updateAttributes(req.body)
    return res.status(200).json({ data: user })
  } catch (error) {
    console.error(error)
    return res.status(500).json({ message: error.message })
  }
})

router.delete('/:id', async (req, res) => {
  try {
    const { params: { id } } = req
    const result = await User.destroy({
      where: { id: Number(id) }
    })
    return res.status(result ? 204 : 400).end()
  } catch (error) {
    console.error(error)
    return res.status(500).json({ message: error.message })
  }
})

export default router
