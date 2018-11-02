import { Repository } from './../../../../models/repository'

const groupBy = (arr, fn) =>
  arr
    .map(typeof fn === 'function' ? fn : val => val[fn])
    .reduce((acc, val, i) => {
      acc[val] = (acc[val] || []).concat(arr[i])
      return acc
    }, {})

Repository.getRepositories = async function() {
  const query = `
    SELECT Repo.*,
      Topic.id as "Topic.id", Topic.value as "Topic.value",
      Type.id as "Type.id", Type.value as "Type.value",
      Editorial.id as "Editorial.value", Editorial.value as "Editorial.value",
      Author.id as "Author.id ", Author."firstName" as "Author.firstName", Author."lastName" as "Author.lastName"
    from (select * from "Repositories" limit 10) as Repo
      left join "RepositoryTopics" as RET on Repo.id = RET."idRepository"
        left join "CatalogTopics" as Topic on RET."idCatalog" = Topic.id
      left join "RepositoryTypes" as RETy on Repo.id = RETy."idRepository"
        left join "CatalogTypes" as Type on RETy."idCatalog" = Type.id
      left join "RepositoryEditorials" as REE on Repo.id = REE."idRepository"
        left join "CatalogTypes" as Editorial on REE."idCatalog" = Editorial.id
      left join "RepositoryAuthors" as REA on Repo.id = REA."idRepository"
        left join "CatalogAuthors" as Author on REA."idAuthor" = Author.id;
  `

  const results = await Repository._database.query({
    text: query
    //rowMode: 'array'
  })
  // const groups = groupBy(results, 'id')

  /*const nested = {}
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
  console.log(nested)

  for (let group of groups) {
    const [head, ...tail] = group
    for (let columm in head) {
    }
  }*/

  return results
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
