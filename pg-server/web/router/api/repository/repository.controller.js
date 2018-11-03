import { Repository } from './../../../../models/repository'

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

function Make(keys, values) {
  return keys.reduce((acc, key, i) => {
    acc[key] = values[i]
    return acc
  }, {})
}

Repository.getRepositories = async function() {
  /**
   El campo nested debera tener el formato '{key}.{subkey}
   */
  const query = `
    SELECT Repo.*,
      Topic.id as "topic.id", Topic.value as "topic.value",
      Type.id as "type.id", Type.value as "type.value",
      Editorial.id as "editorial.id", Editorial.name as "editorial.name",
      Author.id as "author.id ", Author."firstName" as "author.firstName", Author."lastName" as "author.lastName"
    from (select * from "Repositories" limit 100) as Repo
      left join "RepositoryTopics" as RET on Repo.id = RET."idRepository"
        left join "CatalogTopics" as Topic on RET."idCatalog" = Topic.id
      left join "RepositoryTypes" as RETy on Repo.id = RETy."idRepository"
        left join "CatalogTypes" as Type on RETy."idCatalog" = Type.id
      left join "RepositoryEditorials" as REE on Repo.id = REE."idRepository"
        left join "CatalogEditorials" as Editorial on REE."idCatalog" = Editorial.id
      left join "RepositoryAuthors" as REA on Repo.id = REA."idRepository"
        left join "CatalogAuthors" as Author on REA."idAuthor" = Author.id;
  `

  const { rows, fields } = await Repository._database.query({
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
    const obj = Make(columnNames.slice(0, pos[0]), head)
    for (let i = 0; i < nestedColumns.length; i++) {
      obj[nestedColumns[i]] = []
      if (head[pos[i]] !== null) {
        obj[nestedColumns[i]].push(
          Make(nested[nestedColumns[i]], head.slice(pos[i], pos[i + 1]))
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
                Make(nested[nestedColumns[i]], row.slice(pos[i], pos[i + 1]))
              )
            }
          }
        }
      }
    }
    return obj
  })

  return groups
}

export default Repository

/**
results = [{
      "id": 3,
      "idUser": 2,
      "username": "Soriel",
      "title": "1",
      "description": "1",
      "url": "1",
      "file": "11",
      "image": "111",
      "tags": "1,2,3",
      "visibility": 1,
      "createdAt": "2018-10-23T17:26:50.489Z",
      "updatedAt": null,
      "Topic.id": null,
      "Topic.value": null,
      "Type.id": null,
      "Type.value": null,
      "Editorial.value": null,
      "Author.id ": 1,
      "Author.firstName": "q",
      "Author.lastName": "q"
    }]

const groups = {"3":[{"id":3,"idUser":2,"username":"Soriel","title":"1","description":"1","url":"1","file":"11","image":"111","tags":"1,2,3","visibility":1,"createdAt":"2018-10-23T17:26:50.489Z","updatedAt":null,"Topic.id":null,"Topic.value":null,"Type.id":null,"Type.value":null,"Editorial.value":null,"Author.id ":1,"Author.firstName":"q","Author.lastName":"q"},{"id":3,"idUser":2,"username":"Soriel","title":"1","description":"1","url":"1","file":"11","image":"111","tags":"1,2,3","visibility":1,"createdAt":"2018-10-23T17:26:50.489Z","updatedAt":null,"Topic.id":null,"Topic.value":null,"Type.id":null,"Type.value":null,"Editorial.value":null,"Author.id ":2,"Author.firstName":"q","Author.lastName":"q"}],"4":[{"id":4,"idUser":2,"username":"Soriel","title":"1","description":"1","url":"1","file":"11","image":"111","tags":"1,2,3","visibility":1,"createdAt":"2018-10-23T17:26:50.489Z","updatedAt":null,"Topic.id":null,"Topic.value":null,"Type.id":null,"Type.value":null,"Editorial.value":null,"Author.id ":null,"Author.firstName":null,"Author.lastName":null}],"5":[{"id":5,"idUser":2,"username":"Soriel","title":"1","description":"1","url":"1","file":"11","image":"111","tags":"1,2,3","visibility":1,"createdAt":"2018-10-23T17:26:50.489Z","updatedAt":null,"Topic.id":null,"Topic.value":null,"Type.id":null,"Type.value":null,"Editorial.value":null,"Author.id ":null,"Author.firstName":null,"Author.lastName":null}],"6":[{"id":6,"idUser":2,"username":"Soriel","title":"1","description":"1","url":"1","file":"11","image":"111","tags":"1,2,3","visibility":1,"createdAt":"2018-10-23T17:26:50.489Z","updatedAt":null,"Topic.id":null,"Topic.value":null,"Type.id":null,"Type.value":null,"Editorial.value":null,"Author.id ":null,"Author.firstName":null,"Author.lastName":null}],"7":[{"id":7,"idUser":2,"username":"Soriel","title":"1","description":"1","url":"1","file":"11","image":"111","tags":"1,2,3","visibility":1,"createdAt":"2018-10-23T17:26:50.489Z","updatedAt":null,"Topic.id":null,"Topic.value":null,"Type.id":null,"Type.value":null,"Editorial.value":null,"Author.id ":null,"Author.firstName":null,"Author.lastName":null}],"8":[{"id":8,"idUser":2,"username":"Soriel","title":"1","description":"1","url":"1","file":"11","image":"111","tags":"1,2,3","visibility":1,"createdAt":"2018-10-23T17:26:50.489Z","updatedAt":null,"Topic.id":null,"Topic.value":null,"Type.id":null,"Type.value":null,"Editorial.value":null,"Author.id ":null,"Author.firstName":null,"Author.lastName":null}],"9":[{"id":9,"idUser":2,"username":"Soriel","title":"1","description":"1","url":"1","file":"11","image":"111","tags":"1,2,3","visibility":1,"createdAt":"2018-10-23T17:26:50.489Z","updatedAt":null,"Topic.id":null,"Topic.value":null,"Type.id":null,"Type.value":null,"Editorial.value":null,"Author.id ":null,"Author.firstName":null,"Author.lastName":null}],"10":[{"id":10,"idUser":2,"username":"Soriel","title":"1","description":"1","url":"1","file":"11","image":"111","tags":"1,2,3","visibility":1,"createdAt":"2018-10-23T17:26:50.489Z","updatedAt":null,"Topic.id":null,"Topic.value":null,"Type.id":null,"Type.value":null,"Editorial.value":null,"Author.id ":null,"Author.firstName":null,"Author.lastName":null}],"11":[{"id":11,"idUser":2,"username":"Soriel","title":"1","description":"1","url":"1","file":"11","image":"111","tags":"1,2,3","visibility":1,"createdAt":"2018-10-23T17:26:50.489Z","updatedAt":null,"Topic.id":null,"Topic.value":null,"Type.id":null,"Type.value":null,"Editorial.value":null,"Author.id ":null,"Author.firstName":null,"Author.lastName":null}],"12":[{"id":12,"idUser":2,"username":"Soriel","title":"1","description":"1","url":"1","file":"11","image":"111","tags":"1,2,3","visibility":1,"createdAt":"2018-10-23T17:26:50.489Z","updatedAt":null,"Topic.id":null,"Topic.value":null,"Type.id":null,"Type.value":null,"Editorial.value":null,"Author.id ":null,"Author.firstName":null,"Author.lastName":null}]}


const nested = {}

Object.keys(results[0]).forEach(columm => {
  console.log(columm)
  let hasNested = columm.indexOf('.') !== -1
  if (hasNested) {
    const [obj, key] = columm.split('.')
    if (!nested.hasOwnProperty(obj)) {
      nested[obj] = [key]
    } else {
      nested[obj].push(key)
    }
  }
})

const nestedGrops = Object.keys(nested)

const nestedData = []
for(let id in groups) {
  const rows = groups[id]
  for (let nestedGroup of nestedGrops) {
    rows[0][nestedGroup] = []
  }

  const head = rows[0]
  const parse = {}

  for (let row of rows) {
    
  }
}
  

 */

/*
const groupBy = (arr, fn) => {
  let currentId = arr[0].id
  let pos = 0
  return arr
    .map(typeof fn === 'function' ? fn : val => val[fn])
    .reduce((acc, val, i) => {
      if (arr[i].id === currentId) {
        acc[pos] = (acc[pos] || []).concat(arr[i])
      } else {
        acc[++pos] = (acc[pos] || []).concat(arr[i])
        currentId = arr[i].id
      }
      return acc
    }, [])
}
*/
