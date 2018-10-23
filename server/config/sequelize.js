import config from './database.json'
import Sequelize from 'sequelize'
import Tables from './../models/tables'
import Relations from './../models/relations'

function handleConnection({
  host,
  port,
  database,
  username,
  password,
  dialect = 'mysql'
}) {
  const sequelize = new Sequelize(database, username, password, {
    dialect,
    host,
    port
  })
  return sequelize
}

const { mysql, postgres } = config
console.log(postgres)
const sequelize = handleConnection(postgres)

const TControllers = {}
Object.keys(Tables).forEach(key => {
  TControllers[key] = Tables[key](sequelize, Sequelize)
})

const RControllers = {}
Object.keys(Relations).forEach(key => {
  RControllers[key] = Relations[key](sequelize, Sequelize)
})

/*RControllers.RepoAuthor.hasOne(TControllers.Author, {
  foreignKey: 'idAuthor',
  allowNull: false,
  default: null
})*/

TControllers.Repo.hasMany(RControllers.RepoAuthor, {
  foreignKey: 'idRepository',
  allowNull: false,
  default: null
})

RControllers.RepoAuthor.findAll({
  raw: true
}).then(console.log)

TControllers.Repo.findAll({
  include: [
    {
      model: RControllers.RepoAuthor,
      as: 'repoAuthorC'
    }
  ],
  limit: 2,
  raw: true
}).then(console.log)

console.table(Object.keys(TControllers))
console.table(Object.keys(RControllers))

module.exports = {
  ...TControllers,
  ...RControllers
}
