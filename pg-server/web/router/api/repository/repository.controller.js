import { Repository } from './../../../../models/repository'
import { Pagination } from './../../../../utils/pagination'

const groupBy = (arr, fn) => {
  let currentId = arr[0][0]
  let pos = 0
  return arr
    .map(typeof fn === 'function' ? fn : val => val[fn])
    .reduce((acc, val, i) => {
      if (arr[i][0] === currentId) {
        acc[pos] = acc[pos] || []
        acc[pos].push(arr[i])
      } else {
        acc[++pos] = acc[pos] || []
        acc[pos].push(arr[i])
        currentId = arr[i][0]
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

Repository.getRepositories = async function(options = {}) {
  console.log(options)
  let {
    limit = 100,
    offset = 100,
    page = 0,
    all = false,
    api = '',
    ...where
  } = options

  // Validaciones Rango, etc ...
  if (!all) {
    limit = Number(limit) || 100
    page = Number(page) || 0
    page = page > 0 ? page - 1 : 0
    offset = Number(offset) || 100
  }

  /**
   El campo nested debera tener el formato '{key}.{subkey}
   */
  const tableAs = 'R'
  const whereStament = Repository.whereStament

  // Inside
  const whereConditions =
    where && Object.keys(where).length
      ? 'where ' + whereStament(where, true).join(` , `)
      : ''

  /* Out
  const whereConditions =
    where && Object.keys(where).length
      ? 'where R.' + whereStament(where, true).join(`, ${tableAs}.`)
      : ''
  */

  const limitStament = all ? '' : ` limit ${limit} offset ${offset * page} `

  const query = `
    SELECT Repo.*,
      Topic.id as "topic.id", Topic.value as "topic.value",
      Type.id as "type.id", Type.value as "type.value",
      Editorial.id as "editorial.id", Editorial.name as "editorial.name",
      Author.id as "author.id ", Author."firstName" as "author.firstName", Author."lastName" as "author.lastName"
    from (select * from "Repositories" ${whereConditions} ${limitStament} ) as Repo
      left join "RepositoryTopics" as RET on Repo.id = RET."idRepository"
        left join "CatalogTopics" as Topic on RET."idCatalog" = Topic.id
      left join "RepositoryTypes" as RETy on Repo.id = RETy."idRepository"
        left join "CatalogTypes" as Type on RETy."idCatalog" = Type.id
      left join "RepositoryEditorials" as REE on Repo.id = REE."idRepository"
        left join "CatalogEditorials" as Editorial on REE."idCatalog" = Editorial.id
      left join "RepositoryAuthors" as REA on Repo.id = REA."idRepository"
        left join "CatalogAuthors" as Author on REA."idAuthor" = Author.id;
  `

  const promises = [
    Repository.query({
      text: `select count(*) from "${Repository._Table}"`,
      rowMode: 'array'
    }),
    Repository.query({
      text: query,
      rowMode: 'array'
    })
  ]

  const [
    {
      rows: [[total]]
    },
    { rows, fields }
  ] = await Promise.all(promises)

  // Nested Positions
  const pos = []

  // Nested Keys
  const nested = {}
  const columnNames = fields.map(({ name }) => name)
  columnNames.forEach((columm, i) => {
    const hasNested = columm.indexOf('.') !== -1
    if (hasNested) {
      const [obj, key] = columm.split('.')
      if (!nested.hasOwnProperty(obj)) {
        nested[obj] = [key]
        pos.push(i)
      } else {
        nested[obj].push(key)
      }
    }
  })
  pos.push(fields.length)

  // Nestesd Columns (Arrays)
  const nestedColumns = Object.keys(nested)

  const groups = groupBy(rows, ([id]) => id).map(([head, ...tail]) => {
    const obj = CreateObject(columnNames.slice(0, pos[0]), head)
    for (let i = 0; i < nestedColumns.length; i++) {
      obj[nestedColumns[i]] = []
      if (head[pos[i]] !== null) {
        obj[nestedColumns[i]].push(
          CreateObject(nested[nestedColumns[i]], head.slice(pos[i], pos[i + 1]))
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
  })

  return new Pagination(api, groups, {
    total: Number(total),
    limit,
    offset,
    page,
    where
  })
}

Repository.getRepositoryById = async function(id) {
  const whereStament = Repository.whereStament
  const whereConditions = 'where ' + whereStament({ id }, true).join(` , `)

  const query = `
  SELECT Repo.*,
    Topic.id as "topic.id", Topic.value as "topic.value",
    Type.id as "type.id", Type.value as "type.value",
    Editorial.id as "editorial.id", Editorial.name as "editorial.name",
    Author.id as "author.id ", Author."firstName" as "author.firstName", Author."lastName" as "author.lastName"
  from (select * from "Repositories" ${whereConditions}) as Repo
    left join "RepositoryTopics" as RET on Repo.id = RET."idRepository"
      left join "CatalogTopics" as Topic on RET."idCatalog" = Topic.id
    left join "RepositoryTypes" as RETy on Repo.id = RETy."idRepository"
      left join "CatalogTypes" as Type on RETy."idCatalog" = Type.id
    left join "RepositoryEditorials" as REE on Repo.id = REE."idRepository"
      left join "CatalogEditorials" as Editorial on REE."idCatalog" = Editorial.id
    left join "RepositoryAuthors" as REA on Repo.id = REA."idRepository"
      left join "CatalogAuthors" as Author on REA."idAuthor" = Author.id;
  `

  const { rows, fields } = await Repository.query({
    text: query,
    rowMode: 'array'
  })

  // Nested Positions
  const pos = []

  // Nested Keys
  const nested = {}
  const columnNames = fields.map(({ name }) => name)
  columnNames.forEach((columm, i) => {
    const hasNested = columm.indexOf('.') !== -1
    if (hasNested) {
      const [obj, key] = columm.split('.')
      if (!nested.hasOwnProperty(obj)) {
        nested[obj] = [key]
        pos.push(i)
      } else {
        nested[obj].push(key)
      }
    }
  })
  pos.push(fields.length)

  // Nestesd Columns (Arrays)
  const nestedColumns = Object.keys(nested)

  const groups = groupBy(rows, ([id]) => id).map(([head, ...tail]) => {
    const obj = CreateObject(columnNames.slice(0, pos[0]), head)
    for (let i = 0; i < nestedColumns.length; i++) {
      obj[nestedColumns[i]] = []
      if (head[pos[i]] !== null) {
        obj[nestedColumns[i]].push(
          CreateObject(nested[nestedColumns[i]], head.slice(pos[i], pos[i + 1]))
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
  })

  return groups[0] || {}
}

export default Repository
