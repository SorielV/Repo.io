import { RepositoryTopic } from './../../../../../models/repository'
const {
  CatalogTopic: { _Table: TopicTable }
} = require('./../../../../../models/catalogs')

RepositoryTopic.getAll = function(where, include = false) {
  if (!include) {
    return RepositoryTopic.find({ where })
  }

  const whereStament = RepositoryTopic.whereStament

  const tableAs = 'R'
  const base_query = `
    select R.*, Cat.value, Cat.description from "${
      RepositoryTopic._Table
    }" as R inner join "${TopicTable}" as Cat
    on R."idCatalog" = Cat.id
  `
  const whereConditions =
    where && Object.keys(where).length
      ? 'where R.' + whereStament(where, true).join(`, ${tableAs}.`)
      : ''

  return RepositoryTopic.query(base_query + whereConditions)
}

export default RepositoryTopic
