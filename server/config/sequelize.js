const Sequelize = require('sequelize')
const UserModel = require('./../models/User')
const RepoModel = require('./../models/Repo')
const AuthorModel = require('./../models/Author')
const RepoCommentModel = require('./../models/Repo/Comment')
const ViewRepoCommentModel = require('./../models/Views/Repo/Comment')
const RepoAuthModel = require('./../models/Views/AuthorRepository')

const CatTypesModel = require('./../models/Catalog/Types')
const CatTopicsModel = require('./../models/Catalog/Topics')

const sequelize = new Sequelize('Repos', 'java', '', {
  dialect: 'mysql'
})

const User = UserModel(sequelize, Sequelize)
const Repo = RepoModel(sequelize, Sequelize)
const Author = AuthorModel(sequelize, Sequelize)
const RepoAuthor = RepoAuthModel(sequelize, Sequelize)
const RepoComment = RepoCommentModel(sequelize, Sequelize)
const ViewRepoComment = ViewRepoCommentModel(sequelize, Sequelize)
const CatTypes = CatTypesModel(sequelize, Sequelize)
const CatTopics = CatTopicsModel(sequelize, Sequelize)


Repo.hasMany(RepoAuthor, {foreignKey: 'idRepository', as: 'author', allowNull: false, default: null })

module.exports = {
  User,
  Repo,
  Author,
  RepoAuthor,
  RepoComment,
  ViewRepoComment,
  CatTypes,
  CatTopics
}
