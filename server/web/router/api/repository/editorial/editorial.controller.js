import { RepositoryEditorial } from './../../../../../models/repository'
const {
  CatalogEditorial: { _Table: EditorialTable }
} = require('./../../../../../models/catalogs')

RepositoryEditorial.getAll = function(where, include = false) {
  if (!include) {
    return RepositoryEditorial.find({ where })
  }
  const whereStament = RepositoryEditorial.whereStament

  const tableAs = 'R'
  const base_query = `
    select * from "${
      RepositoryEditorial._Table
    }" as R inner join "${EditorialTable}" as Cat
    on R."idCatalog" = Cat.id
  `
  const whereConditions =
    where && Object.keys(where).length
      ? 'where R.' + whereStament(where, true).join(`, ${tableAs}.`)
      : ''

  return RepositoryEditorial.query(base_query + whereConditions)
}

export default RepositoryEditorial
