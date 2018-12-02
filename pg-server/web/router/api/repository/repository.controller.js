'use strict'

import { Repository } from './../../../../models/repository'
import { Pagination } from './../../../../utils/pagination'
import { slugify } from './../../../../utils/index'

const groupBy = (arr, fn) => {
  let currentId = arr[0][0]
  console.log(currentId)
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
        console.log(currentId)
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
  const {
    limit = 50,
    offset = 50,
    page = 1,
    format = 'simple',
    all = false, // All records
    orderBy = null,
    orderDirection = null,
    api,
    ...where
  } = options

  return {
    options: {
      api,
      all,
      format,
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

function getNestedData(fields, rows) {
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
  const groupedS = groupBy(rows, ([id]) => id)

  console.log(groupedS.length)

  return groupedS.map(([head, ...tail]) => {
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
}

function getQuery(baseQuery, format, orderBy = '') {
  if (format === 'user') {
    return `
      SELECT
        Repo."id",
        Repo."idUser",
        Repo."username",
        Repo."title",
        Repo."description",
        Repo."image",
        Repo."tags",
        Repo."visibility",
        RI.comments,
        RI.reviews,
        RI.review_score as "score",
        Repo."createdAt",
        Repo."updatedAt",
        Repo."slug",
        Topic.id as "topic.id", Topic.value as "topic.value",
        Type.id as "type.id", Type.value as "type.value"
      from (${baseQuery}) as Repo
        left join "RepositoriesInformation" as RI on Repo.id = RI.idRepository
        left join "RepositoryTopics" as RET on Repo.id = RET."idRepository"
          left join "CatalogTopics" as Topic on RET."idCatalog" = Topic.id
        left join "RepositoryTypes" as RETy on Repo.id = RETy."idRepository"
          left join "CatalogTypes" as Type on RETy."idCatalog" = Type.id
      ${orderBy};
    `
  } else if (format === 'full' || format === 'full-user') {
    const isFull = format === 'full'

    return `
    SELECT
      Repo."id",
      Repo."idUser",
      Repo."username",
      Repo."title",
      Repo."content",
      Repo."description",
      Repo."image",
      Repo."tags",
      Repo."visibility",
      ${
        !isFull
          ? `
            RI.comments,
            RI.reviews,
            RI.review_score as "score",
            `
          : ''
      }
      Repo."createdAt",
      Repo."updatedAt",
      Repo."slug",
      RS.id as "resource.id", RS.name as "resource.name", RS.description as "resource.description",
      RS.file as "resource.file", RS.type as "resource.type", RS.uploaded as "resource.uploaded",
      RET.id as "topic.id", Topic.id as "topic.idCatalog", Topic.value as "topic.value",
      RETy.id as "type.id", Type.id as "type.idCatalog", Type.value as "type.value",
      REE.id as "editorial.id", Editorial.id as "editorial.idCatalog", Editorial.name as "editorial.name",
      REA.id as "author.id", Author.id as "author.idAuthor", Author.image as "author.image", Author."name" as "author.name"
    from (${baseQuery}) as Repo
      ${
        !isFull
          ? 'left join "RepositoriesInformation" as RI on Repo.id = RI.idRepository'
          : ''
      }
      left join "RepositoryResources" as RS on Repo.id = RS."idRepository"
      left join "RepositoryTopics" as RET on Repo.id = RET."idRepository"
        left join "CatalogTopics" as Topic on RET."idCatalog" = Topic.id
      left join "RepositoryTypes" as RETy on Repo.id = RETy."idRepository"
        left join "CatalogTypes" as Type on RETy."idCatalog" = Type.id
      left join "RepositoryEditorials" as REE on Repo.id = REE."idRepository"
        left join "CatalogEditorials" as Editorial on REE."idCatalog" = Editorial.id
      left join "RepositoryAuthors" as REA on Repo.id = REA."idRepository"
        left join "CatalogAuthors" as Author on REA."idAuthor" = Author.id
      ${orderBy};
    `
  } else {
    return `
      select
        Repo."id",
        Repo."idUser",
        Repo."username",
        Repo."title",
        Repo."content",
        Repo."description",
        Repo."image",
        Repo."tags",
        Repo."visibility",
        Repo."createdAt",
        Repo."updatedAt",
        Repo."slug"
      from (${baseQuery}) as Repo
      ${orderBy};
    `
  }
}

Repository.getRepositoriesByTypesandTopics = async function(_options) {
  const { api } = _options
  if (!_options.hasOwnProperty('type') || !_options.hasOwnProperty('topic')) {
    return new Error('Type no enviado API' + api)
  }

  const {
    pagination: { limit, offset, page, orderBy, orderDirection },
    options
  } = pageOptions(_options)

  console.log(options.where.type)
  const types = uniqueIntegers(options.where.type)
  const topics = uniqueIntegers(options.where.topic)
  const slug = options.where.slug ? slugify(options.where.slug) : null
  console.log(types, topics)

  const tableAs = 'R'
  const whereConditions = ''

  const countQuery = `
    select count(*) from (
      select RT."idRepository"
      from public."RepositoryTopics" as RT
        where RT."idCatalog" in (${topics.join(',')})
        and RT."idRepository" in (select RT."idRepository" as "match"
                                  from public."RepositoryTypes" as RT
                                  where RT."idCatalog" in (${types.join(',')})
                                  ${
                                    slug
                                      ? `and RT."idRepository" in (
                                          select id from "Repositories" where slug like '%${slug}%'
                                        )`
                                      : ``
                                  }
                                  group by RT."idRepository"
                                  having count(RT."idRepository") = ${
                                    types.length
                                  })
    group by RT."idRepository"
    having count(RT."idRepository") = ${topics.length}
    ) as count
  `

  const baseQuery = `
    select RT."idRepository"
      from public."RepositoryTopics" as RT
      where RT."idCatalog" in (${topics.join(',')})
        and RT."idRepository" in (select RT."idRepository" as "match"
                                  from public."RepositoryTypes" as RT
                                  where RT."idCatalog" in (${types.join(',')})
                                  ${
                                    slug
                                      ? `and RT."idRepository" in (
                                          select id from "Repositories" where slug like '%${slug}%'
                                        )`
                                      : ``
                                  }
                                  group by RT."idRepository"
                                  having count(RT."idRepository") = ${
                                    types.length
                                  })
      group by RT."idRepository"
      having count(RT."idRepository") = ${topics.length}
      order by RT."idRepository" desc
      ${options.all ? '' : ` limit ${limit} offset ${offset * (page - 1)} `}
  `

  const { format } = options

  const query = getQuery(
    `
      select *
        from "Repositories" as Repo
          inner join (
            ${baseQuery}
          ) as match
        on Repo.id = match."idRepository"
    `,
    format,
    'order by Repo.id'
  )

  const promises = [
    Repository.query({
      text: countQuery,
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

  return Number.parseInt(total) === 0 || rows.length === 0
    ? new Pagination(options.api, [], {
        limit,
        offset,
        page,
        orderBy,
        orderDirection,
        total: Number(total)
      })
    : new Pagination(options.api, getNestedData(fields, rows), {
        limit,
        offset,
        page,
        orderBy,
        orderDirection,
        total: Number(total)
      })
}

Repository.getRepositoriesByTypes = async function(_options) {
  const { api } = _options
  if (!_options.hasOwnProperty('type')) {
    return new Error('Type no enviado API' + api)
  }

  const {
    pagination: { limit, offset, page, orderBy, orderDirection },
    options
  } = pageOptions(_options)

  const slug = options.where.slug ? slugify(options.where.slug) : null

  console.log(options.where.type)
  const types = uniqueIntegers(options.where.type)

  const tableAs = 'R'
  const whereConditions = ''

  const countQuery = `
    select count(*) from (select RT."idRepository" as "match"
      from public."RepositoryTypes" as RT
      where RT."idCatalog" in (${types.join(',')}) 
      ${
        slug
          ? `and RT."idRepository" in (
                select id from "Repositories" where slug like '%${slug}%'
              )`
          : ``
      }
      group by RT."idRepository" having count(RT."idRepository") = 1
   ) as count
  `

  const baseQuery = `
    select RT."idRepository", count(RT."idRepository") as "match"
      from public."RepositoryTypes" as RT
      where RT."idCatalog" in (${types.join(',')})
      ${
        slug
          ? `and RT."idRepository" in (
                select id from "Repositories" where slug like '%${slug}%'
              )`
          : ``
      }
      group by RT."idRepository" having count(RT."idRepository") = ${
        types.length
      }
      ${options.all ? '' : ` limit ${limit} offset ${offset * (page - 1)} `}
  `
  const { format } = options

  const query = getQuery(
    `
    select *
      from "Repositories" as Repo
        inner join (
          ${baseQuery}
        ) as match
      on Repo.id = match."idRepository"`,
    format,
    'order by Repo.id;'
  )

  const promises = [
    Repository.query({
      text: countQuery,
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

  return Number.parseInt(total) === 0 || rows.length === 0
    ? new Pagination(options.api, [], {
        limit,
        offset,
        page,
        orderBy,
        orderDirection,
        total: Number(total)
      })
    : new Pagination(options.api, getNestedData(fields, rows), {
        limit,
        offset,
        page,
        orderBy,
        orderDirection,
        total: Number(total)
      })
}

Repository.getRepositoriesByTopics = async function(_options = {}) {
  const { api } = _options
  if (!_options.hasOwnProperty('topic')) {
    return new Error('Topic no enviado API' + api)
  }

  const {
    pagination: { limit, offset, page, orderBy, orderDirection },
    options
  } = pageOptions(_options)

  const slug = options.where.slug ? slugify(options.where.slug) : null
  const topics = uniqueIntegers(options.where.topic)

  const tableAs = 'R'
  const whereConditions = ''

  const countQuery = `
    select count(*) from (select RT."idRepository" as "match"
      from public."RepositoryTopics" as RT
      where RT."idCatalog" in (${topics.join(',')})
      ${
        slug
          ? `and RT."idRepository" in (
                select id from "Repositories" where slug like '%${slug}%'
              )`
          : ``
      }
      group by RT."idRepository" having count(RT."idRepository") = 1
   ) as count
  `

  const baseQuery = `
    select RT."idRepository", count(RT."idRepository") as "match"
      from public."RepositoryTopics" as RT
      where RT."idCatalog" in (${topics.join(',')})
      ${
        slug
          ? `and RT."idRepository" in (
                select id from "Repositories" where slug like '%${slug}%'
              )`
          : ``
      }
      group by RT."idRepository" having count(RT."idRepository") = ${
        topics.length
      }
      ${options.all ? '' : ` limit ${limit} offset ${offset * (page - 1)} `}
  `

  const { format } = options

  const query = getQuery(
    `
    select *
      from "Repositories" as Repo
        inner join (
          ${baseQuery}
        ) as match
      on Repo.id = match."idRepository"
      order by id
  `,
    format,
    'order by Repo."id"'
  )

  const promises = [
    Repository.query({
      text: countQuery,
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

  return Number.parseInt(total) === 0 || rows.length === 0
    ? new Pagination(options.api, [], {
        limit,
        offset,
        page,
        orderBy,
        orderDirection,
        total: Number(total)
      })
    : new Pagination(options.api, getNestedData(fields, rows), {
        limit,
        offset,
        page,
        orderBy,
        orderDirection,
        total: Number(total)
      })
}

Repository.getRepositories = async function(_options = {}) {
  const {
    pagination: { limit, offset, page, orderBy, orderDirection },
    options
  } = pageOptions(_options)

  const { where } = options

  const tableAs = 'R'
  const whereStament = Repository.whereStament

  console.log('total')

  // Inside
  const whereConditions =
    where && Object.keys(where).length
      ? whereStament(where, true, false).join(` , `)
      : ''

  const countQuery = `
    select count(*) from "Repositories" ${
      whereConditions ? 'where' : ''
    } ${whereConditions}
  `
  const baseQuery = `
    select * from "Repositories" ${
      whereConditions ? 'where' : ''
    } ${whereConditions}
    order by id desc ${
      options.all ? '' : ` limit ${limit} offset ${offset * (page - 1)} `
    }
  `

  const { format } = options
  const query = getQuery(baseQuery, format, 'order by Repo."id"')

  const promises = [
    Repository.query({
      text: countQuery,
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

  return Number.parseInt(total) === 0 || rows.length === 0
    ? new Pagination(options.api, [], {
        limit,
        offset,
        page,
        orderBy,
        orderDirection,
        total: Number(total)
      })
    : new Pagination(options.api, getNestedData(fields, rows), {
        limit,
        offset,
        page,
        orderBy,
        orderDirection,
        total: Number(total)
      })
}

Repository.getRepositoryById = async function(id, format = 'simple') {
  console.log(id)
  const whereStament = Repository.whereStament
  const whereConditions = 'where ' + whereStament({ id }, true).join(` , `)
  const baseQuery = `select * from "Repositories" ${whereConditions}`
  const query = getQuery(baseQuery, format, 'order by Repo."id"')

  const { rows, fields } = await Repository.query({
    text: query,
    rowMode: format !== 'simple' ? 'array' : null
  })

  if (rows) {
    const [repository = {}] =
      format === 'simple' ? rows : getNestedData(fields, rows)
    return repository
  } else {
    return {}
  }
}

export default Repository

/*
select RT."idRepository", count(RT."idRepository") as "match"
      from public."RepositoryTopics" as RT
      where RT."idCatalog" in (26) and RT."idRepository" in (
          select RT."idRepository" as "match"
              from public."RepositoryTypes" as RT
              where RT."idCatalog" in (19)
          group by RT."idRepository" having count(RT."idRepository") = 1
        )
      group by RT."idRepository" having count(RT."idRepository") = 1
*/
