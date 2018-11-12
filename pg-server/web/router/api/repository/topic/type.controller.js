import { RepositoryType } from './../../../../../models/repository'
const {
  CatalogType: { _Table: TypeTable }
} = require('./../../../../../models/catalogs')

RepositoryType.getAll = function(where, include = false) {
  if (!include) {
    return RepositoryType.find({ where })
  }

  const whereStament = RepositoryType.whereStament

  const tableAs = 'R'
  const base_query = `
    select R.*, Cat.value, Cat.description from "${
      RepositoryType._Table
    }" as R inner join "${TypeTable}" as Cat
    on R."idCatalog" = Cat.id
  `
  const whereConditions =
    where && Object.keys(where).length
      ? 'where R.' + whereStament(where, true).join(`, ${tableAs}.`)
      : ''

  return RepositoryType.query(base_query + whereConditions)
}

export default RepositoryType
