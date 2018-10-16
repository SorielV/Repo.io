import { Router } from 'express'
import { Author } from './../../../config/sequelize'
import { isAuth } from './../../../lib/middleware'

const router = Router()

router.get('/', async (req, res) => {
  try {
    const { query: { all = false }, query: { page = 1 }, query: { limit = 100 } } = req
    const offset = (Number(page) - 1) * Number(limit);
    let data

    if (all) {
      data = await Author.findAll({ raw: true })
      return res.status(200).json({ data })
    } else {
      const { count, rows } = await Author.findAndCountAll({
        limit: Number(limit),
        offset,
        $sort: { id: 1 },
        raw: true
      })

      return res.status(200).json({
        total: count,
        prevPage: page - 1 > 0 ? `http://localhost:4000/api/author?page=${(Number(page) - 1)}&limit=${limit}` : null,
        nextPage: count > (offset + (Number(page) * Number(limit))) ? `http://localhost:4000/api/author?page=${(Number(page) + 1)}&limit=${limit}`: null,
        params: {
          limit: Number(limit),
          page: Number(page)
        },
        data: rows
      })
    }
  } catch (error) {
    console.error(error)
    return res.status(500).json({ message: error.message })
  }
})

/* GET Author by ID. */
router.get('/:id', async (req, res) => {
  try {
    const id = Number(req.params.id)
    const author = await Author.findById(id, { raw: true })
    return res.status(author ? 200: 404).json({ data: author })
  } catch (error) {
    console.error(error)
    return res.status(500).json({ message: error.message })
  }
})

// Only Auth Users
router.use(isAuth)

router.post('/', async (req, res) => {
  try {
    const author = (await Author.create(req.body)).get({ plain: true })
    return res.status(author ? 201 : 500).json({ data: author });
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
    delete req.body.id
    const { params: { id } } = req
    const author = await (await Author.findById(Number(id))).updateAttributes(req.body)
    return res.status(200).json({ data: author })
  } catch (error) {
    console.error(error)
    return res.status(500).json({ message: error.message })
  }
})

router.delete('/:id', async (req, res) => {
  try {
    const { params: { id } } = req
    const result = await Author.destroy({
      where: { id: Number(id) }
    })
    return res.status(result ? 204 : 400).end()
  } catch (error) {
    console.error(error)
    return res.status(500).json({ message: error.message })
  }
})

export default router
