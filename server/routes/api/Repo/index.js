import { Router } from 'express'
import { Repo, RepoAuth, RepoComment as Comment } from './../../../config/sequelize'

const router = Router()

const cleanAuthors = (repos) => {
  let current = -1
  console.time('cleanAuthors')
  if (Array.isArray(repos)) {
    repos.forEach((repo, index) => {
      if (repo.id !== current) { // Nuevo Repo
        if (repo['author.idAuthor'] !== null) {
          repo.author = []
          repo.author.push({
            idAuthor: repo['author.idAuthor'],
            idRepository: repo['author.idRepository'],
            firstName: repo['author.firstName'],
            lastName: repo['author.lastName'],
            createdAt: repo['author.createdAt'],
          })
          delete repo['author.idAuthor']
          delete repo["author.idRepository"]
          delete repo["author.firstName"]
          delete repo["author.lastName"]
          delete repo["author.createdAt"]
          // repos.push(repo)
        } else {
          repo.author = []
          delete repo['author.idAuthor']
          delete repo["author.idRepository"]
          delete repo["author.firstName"]
          delete repo["author.lastName"]
          delete repo["author.createdAt"]
          // repos.push(repo)
        }
        current = index
      } else { // Repo Actual
        if (repo['author.idAuthor'] !== null) {
          repos[current].author.push({
            idAuthor: repo['author.idAuthor'],
            idRepository: repo['author.idRepository'],
            firstName: repo['author.firstName'],
            lastName: repo['author.lastName'],
            createdAt: repo['author.createdAt'],
          })
        }
      }
    })
  } else {
    repos.author = []
    if (repos['author.idAuthor'] !== null) {
      repos.author.push({
        idAuthor: repos['author.idAuthor'],
        idRepository: repos['author.idRepository'],
        firstName: repos['author.firstName'],
        lastName: repos['author.lastName'],
        createdAt: repos['author.createdAt'],
      })
    }
    delete repos['author.idAuthor']
    delete repos["author.idRepository"]
    delete repos["author.firstName"]
    delete repos["author.lastName"]
    delete repos["author.createdAt"]
  }
  console.timeEnd('cleanAuthors')
}

router.get('/', async (req, res) => {
  try {
    const { query: { all = false }, query: { page = 1 }, query: { limit = 5 } } = req
    const offset = (Number(page) - 1) * Number(limit);
    let data

    if (all) {
      data = await Repo.findAll({
        include: [{
          model: RepoAuth,
          as: 'author',
          required: false
        }],
        raw: true
      })
      cleanAuthors(data)

      return res.status(200).json({
        data
      })
    } else {
      const { count, rows } = await Repo.findAndCountAll({
        limit: Number(limit),
        offset,
        $sort: { id: 1 },
        include: [{
          model: RepoAuth,
          as: 'author',
          required: false
        }],
        raw: true
      })
      cleanAuthors(rows)

      return res.status(200).json({
        total: count,
        prevPage: page - 1 > 0 ? `http://localhost:4000/api/repo?page=${(Number(page) - 1)}&limit=${limit}` : null,
        nextPage: count > (offset + (Number(page) * Number(limit))) ? `http://localhost:4000/api/repo?page=${(Number(page) + 1)}&limit=${limit}`: null,
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

/* GET repo by ID. */
router.get('/:id', async (req, res) => {
  try {
    const id = Number(req.params.id)
    const repo = await Repo.findById(id, {
      include: [{
        model: RepoAuth,
        as: 'author',
        required: false
      }],
      raw: true
    })
    cleanAuthors(repo)
    return res.status(repo ? 200: 404).json({ data: repo })
  } catch (error) {
    console.error(error)
    return res.status(500).json({ message: error.message })
  }
})

router.post('/', async (req, res) => {
  try {
    const repo = (await Repo.create(req.body)).get({ plain: true })
    return res.status(repo ? 201 : 500).json({ data: repo });
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
    const repo = await (await Repo.findById(Number(id))).updateAttributes(req.body)
    return res.status(200).json({ data: repo })
  } catch (error) {
    console.error(error)
    return res.status(500).json({ message: error.message })
  }
})

router.delete('/:id', async (req, res) => {
  try {
    const { params: { id } } = req
    const result = await Repo.destroy({
      where: { id: Number(id) }
    })
    return res.status(result ? 204 : 400).end()
  } catch (error) {
    console.error(error)
    return res.status(500).json({ message: error.message })
  }
})

router.get('/:id/comment', async (req, res) => {
  try {
    const idRepository = Number(req.params.id)
    const { query: { all = false }, query: { page = 1 }, query: { limit = 5 } } = req
    const offset = (Number(page) - 1) * Number(limit);

    const { count, rows } = await Comment.findAndCountAll({
      where: [{
        idRepository
      }],
      limit: Number(limit),
      offset,
      $sort: { id: 1 },
      raw: true
    })
    
    return res.status(200).json({
      total: count,
      prevPage: page - 1 > 0 ? `http://localhost:4000/api/comment?page=${(Number(page) - 1)}&limit=${limit}` : null,
      nextPage: count > (offset + (Number(page) * Number(limit))) ? `http://localhost:4000/api/repo?page=${(Number(page) + 1)}&limit=${limit}`: null,
      params: {
        limit: Number(limit),
        page: Number(page)
      },
      data: rows
    })
  } catch (error) {
    console.error(error)
    return res.status(500).json({ message: error.message })
  }
})

export default router
