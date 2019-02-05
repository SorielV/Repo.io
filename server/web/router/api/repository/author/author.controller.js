import { RepositoryAuthor } from './../../../../../models/repository'
const {
  CatalogAuthor: { _Table: AuthorTable }
} = require('./../../../../../models/catalogs')

RepositoryAuthor.getAll = function(where, include = false) {
  if (!include) {
    return RepositoryAuthor.find({ where })
  }

  const whereStament = RepositoryAuthor.whereStament

  const tableAs = 'R'
  const base_query = `
    select * from "${
      RepositoryAuthor._Table
    }" as R inner join "${AuthorTable}" as Cat
    on R."idAuthor" = Cat.id
  `
  const whereConditions =
    where && Object.keys(where).length
      ? 'where R.' + whereStament(where, true).join(`, ${tableAs}.`)
      : ''

  return RepositoryAuthor.query(base_query + whereConditions)
}

export default RepositoryAuthor
