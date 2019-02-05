import { RepositoryScore } from './../../../../../models/repository'
import { Pagination } from './../../../../../utils/pagination'

const pageOptions = options => {
  const {
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

RepositoryScore.getScores = async function(idRepository, _options = {}) {
  const {
    pagination: { limit, offset, page, orderBy, orderDirection },
    options
  } = pageOptions(_options)

  const { where } = options

  const whereStament = RepositoryScore.whereStament

  // Inside
  const whereConditions =
    where && Object.keys(where).length
      ? whereStament(where, true, false).join(` , `)
      : ''

  const countQuery = `
    select count(*), avg(score) from "${RepositoryScore._Table}"
    where "idRepository" = ${Number(idRepository)} ${
    whereConditions ? 'and' + whereConditions : ''
  }
  `
  const query = `
    select "${RepositoryScore._Table}".* ${options.full ? ',Users."profileImage"' : ''}
    from "${RepositoryScore._Table}"
    ${options.full ? 'inner join "Users" as Users on "idUser" = Users.id' : ''}
    where "idRepository" = ${Number(idRepository)} ${
    whereConditions ? 'and' + whereConditions : ''
  }
    order by "${RepositoryScore._Table}".id desc ${
    options.all ? '' : ` limit ${limit} offset ${offset * (page - 1)} `
  }
  `

  const promises = [
    RepositoryScore.query({
      text: countQuery,
      rowMode: 'array'
    }),
    RepositoryScore.query({
      text: query
    })
  ]

  const [
    {
      rows: [[total, avg]]
    },
    { rows, fields }
  ] = await Promise.all(promises)

  if (Number.parseInt(total) === 0 || rows.length === 0) {
    return new Pagination(options.api, [], {
      limit,
      offset,
      page,
      orderBy,
      orderDirection,
      total: Number(total)
    })
  } else {
    const pagination = new Pagination(options.api, rows, {
      limit,
      offset,
      page,
      orderBy,
      orderDirection,
      total: Number(total)
    })
    pagination.avg = avg
    return pagination
  }
}

export default RepositoryScore
