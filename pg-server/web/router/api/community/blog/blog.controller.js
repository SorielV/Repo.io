import { Blog } from './../../../../../models/blog'
import { Pagination } from './../../../../../utils/pagination'

const pageOptions = options => {
  let {
    limit = 50,
    offset = 50,
    page = 1,
    all = false, // All records
    full = false, // All information
    orderBy = null,
    orderDirection = null,
    api,
    ...where
  } = options

  return {
    options: {
      api,
      all,
      full,
      where: {
        ...where
      }
    },
    pagination: {
      limit: isNaN(limit) ? 100 : Number.parseInt(limit),
      offset: isNaN(offset) ? 100 : Number.parseInt(offset),
      page: isNaN(page) ? 1 : page < 1 ? 1 : Number.parseInt(page),
      orderBy,
      orderDirection
    }
  }
}

Blog.getBlogs = async function(_options = {}) {
  const {
    pagination: { limit, offset, page, orderBy, orderDirection },
    options
  } = pageOptions(_options)

  const { where } = options

  const tableAs = 'R'
  const whereStament = Blog.whereStament

  console.log('total')

  // Inside
  const whereConditions =
    where && Object.keys(where).length
      ? whereStament(where, true, false).join(` , `)
      : ''

  const countQuery = `
    select count(*) from "${Blog._Table}" ${
    whereConditions ? 'where' : ''
  } ${whereConditions}
  `
  const baseQuery = `
    SELECT blog.*, users."profileImage"
      from "${Blog._Table}" as blog
        inner join "Users" as users using("username")
        ${whereConditions ? 'where' : ''} ${whereConditions}
      ${options.all ? '' : ` limit ${limit} offset ${offset * (page - 1)} `};
  `

  const query = `${baseQuery}`

  const promises = [
    Blog.query({
      text: countQuery,
      rowMode: 'array'
    }),
    Blog.query({
      text: query
    })
  ]

  const [
    {
      rows: [[total]]
    },
    { rows, fields }
  ] = await Promise.all(promises)

  return Number.parseInt(total) === 0 || rows.length === 0
    ? new Pagination(options.api, [], {
        limit,
        offset,
        page,
        orderBy,
        orderDirection,
        total: Number(total)
      })
    : new Pagination(options.api, rows, {
        limit,
        offset,
        page,
        orderBy,
        orderDirection,
        total: Number(total)
      })
}

Blog.getBlogById = async function(id) {
  const whereStament = Blog.whereStament
  const whereConditions = whereStament({ id }, true).join(` `)

  const baseOffset = 7

  const query = `
    SELECT blog.*, users."profileImage"
      from "${Blog._Table}" as blog
        inner join "Users" as users using("username")
        ${whereConditions ? 'where blog.' : ''} ${whereConditions};
  `

  const { rows, fields } = await Blog.query({
    text: query
  })

  const [blog = {}] = rows
  return blog
}

export default Blog
