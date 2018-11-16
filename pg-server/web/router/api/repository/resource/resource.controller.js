import { RepositoryResource } from './../../../../../models/repository'
const {
  CatalogEditorial: { _Table: EditorialTable }
} = require('./../../../../../models/catalogs')

RepositoryResource.getAll = function(where, include = false) {
  if (!include) {
    return RepositoryResource.find({ where })
  }
  const whereStament = RepositoryResource.whereStament

  const tableAs = 'R'
  const base_query = `
    select * from "${RepositoryResource._Table}" as ${tableAs} 
  `

  const whereConditions =
    where && Object.keys(where).length
      ? 'where R.' + whereStament(where, true).join(`, ${tableAs}.`)
      : ''

  return RepositoryResource.query(base_query + whereConditions)
}

export default RepositoryResource
