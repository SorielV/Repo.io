import { Bundle } from './../../../../../models/bundle'
import { Pagination } from './../../../../../utils/pagination'

const groupBy = (arr, fn, id = 0) => {
  let currentId = arr[0][id]
  let pos = 0
  return arr
    .map(typeof fn === 'function' ? fn : val => val[fn])
    .reduce((acc, val, i) => {
      if (arr[i][id] === currentId) {
        acc[pos] = acc[pos] || []
        acc[pos].push(arr[i])
      } else {
        acc[++pos] = acc[pos] || []
        acc[pos].push(arr[i])
        currentId = arr[i][id]
      }

      return acc
    }, [])
}

function CreateObject(keys, values) {
  return keys.reduce((acc, key, i) => {
    acc[key] = values[i]
    return acc
  }, {})
}

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

const uniqueIntegers = arr => {
  const integes = new Set()
  if (Array.isArray(arr)) {
    arr.forEach(el => {
      if (!isNaN(el)) {
        integes.add(Number.parseInt(el))
      }
    })
  } else {
    if (!isNaN(arr)) {
      integes.add(Number.parseInt(arr))
    }
  }
  return Array.from(integes)
}

function getNestedData(fields, rows, offset = 0) {
  // Nested Positions
  const pos = []
  const fieldsCount = fields.length

  // Nested Keys
  const nested = {}
  const columnNames = (offset ? fields.slice(offset + 1) : fields).map(
    ({ name }) => name
  )
  columnNames.forEach((columm, i) => {
    const hasNested = columm.indexOf('.') !== -1
    if (hasNested) {
      const [obj, key] = columm.split('.')
      if (!nested.hasOwnProperty(obj)) {
        nested[obj] = [key]
        pos.push(i + offset + 1)
      } else {
        nested[obj].push(key)
      }
    }
  })
  pos.push(fieldsCount)

  console.log(pos)
  // Nestesd Columns (Arrays)
  const nestedColumns = Object.keys(nested)

  return groupBy(rows, row => row[offset + 1 || 0], offset + 1 || 0).map(
    ([head, ...tail]) => {
      const obj = CreateObject(
        columnNames.slice(0, pos[0] - offset - 1),
        head.slice(offset + 1)
      )

      console.log(columnNames.slice(0, pos[0] - offset))

      for (let i = 0; i < nestedColumns.length; i++) {
        obj[nestedColumns[i]] = []
        if (head[pos[i]] !== null) {
          obj[nestedColumns[i]].push(
            CreateObject(
              nested[nestedColumns[i]],
              head.slice(pos[i], pos[i + 1])
            )
          )
        }
      }

      if (tail.length > 0) {
        for (let row of tail) {
          for (let i = 0; i < nestedColumns.length; i++) {
            if (row[pos[i]] !== null && row[pos[i]] != undefined) {
              const isUnique =
                obj[nestedColumns[i]].length === 0
                  ? true
                  : obj[nestedColumns[i]].findIndex(
                      ({ id }) => id === row[pos[i]]
                    ) === -1
                    ? true
                    : false

              if (isUnique) {
                obj[nestedColumns[i]].push(
                  CreateObject(
                    nested[nestedColumns[i]],
                    row.slice(pos[i], pos[i + 1])
                  )
                )
              }
            }
          }
        }
      }
      return obj
    }
  )
}

Bundle.getBundles = async function(_options = {}) {
  const {
    pagination: { limit, offset, page, orderBy, orderDirection },
    options
  } = pageOptions(_options)

  const { where } = options

  const tableAs = 'R'
  const whereStament = Bundle.whereStament

  console.log('total')

  // Inside
  const whereConditions =
    where && Object.keys(where).length
      ? whereStament(where, true, false).join(` , `)
      : ''

  const countQuery = `
    select count(*) from "${Bundle._Table}" ${
    whereConditions ? 'where' : ''
  } ${whereConditions}
  `
  const baseQuery = `
    SELECT bundle.*, users."profileImage"
      from "${Bundle._Table}" as bundle
        inner join "Users" as users using("username")
        ${whereConditions ? 'where' : ''} ${whereConditions}
      ${options.all ? '' : ` limit ${limit} offset ${offset * (page - 1)} `};
  `

  const query = `${baseQuery}`

  const promises = [
    Bundle.query({
      text: countQuery,
      rowMode: 'array'
    }),
    Bundle.query({
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

Bundle.getBundleById = async function(id, full) {
  const whereStament = Bundle.whereStament
  const whereConditions = whereStament({ id }, true).join(` `)

  const baseOffset = 7

  const query = !full
    ? `
      SELECT bundle.*, users."profileImage"
        from "${Bundle._Table}" as bundle
          inner join "Users" as users using("username")
          ${whereConditions ? 'where bundle.' : ''} ${whereConditions};
    `
    : `
      SELECT
          Bundle.*,
          Repo.*,
          users."profileImage",
          Topic.id           as "topic.id",
          Topic.value        as "topic.value",
          Type.id            as "type.id",
          Type.value         as "type.value",
          Editorial.id       as "editorial.id",
          Editorial.name     as "editorial.name",
          Author.id          as "author.id",
          Author."firstName" as "author.firstName",
          Author."lastName"  as "author.lastName"
      from "Bundle" as Bundle
          inner join "Users" as users using ("username")
          left join "BundleRepository" RB on Bundle.id = RB."idBundle"
          left join "Repositories" Repo on RB."idRepository" = Repo.id
          left join "RepositoryTopics" as RET on Repo.id = RET."idRepository"
          left join "CatalogTopics" as Topic on RET."idCatalog" = Topic.id
          left join "RepositoryTypes" as RETy on Repo.id = RETy."idRepository"
          left join "CatalogTypes" as Type on RETy."idCatalog" = Type.id
          left join "RepositoryEditorials" as REE on Repo.id = REE."idRepository"
          left join "CatalogEditorials" as Editorial on REE."idCatalog" = Editorial.id
          left join "RepositoryAuthors" as REA on Repo.id = REA."idRepository"
          left join "CatalogAuthors" as Author on REA."idAuthor" = Author.id
      ${whereConditions ? 'where bundle.' : ''}${whereConditions};
    `

  const { rows, fields } = await Bundle.query({
    text: query,
    rowMode: full ? 'array' : 'object'
  })

  if (full) {
    const props = fields.map(({ name }) => name)
    console.log(props)

    const bundle = CreateObject(
      props.slice(0, baseOffset + 1),
      rows[0].slice(0, baseOffset + 1)
    )

    bundle.repository = getNestedData(fields, rows, baseOffset)

    return bundle
  }

  const [bundle = {}] = rows
  return bundle
}

export default Bundle
