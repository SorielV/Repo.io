const Sequelize = require('sequelize')
const UserModel = require('./../models/User')
const RepoModel = require('./../models/Repo')
const AuthorModel = require('./../models/Author')
const RepoCommentModel = require('./../models/Repo/Comment')
const ViewRepoCommentModel = require('./../models/Views/Repo/Comment')
const RepoAuthModel = require('./../models/Views/AuthorRepository')

const sequelize = new Sequelize('Repos', 'java', '', {
  dialect: 'mysql'
})

const User = UserModel(sequelize, Sequelize)
const Repo = RepoModel(sequelize, Sequelize)
const Author = AuthorModel(sequelize, Sequelize)
const RepoAuth = RepoAuthModel(sequelize, Sequelize)
const RepoComment = RepoCommentModel(sequelize, Sequelize)
const ViewRepoComment = ViewRepoCommentModel(sequelize, Sequelize)

Repo.hasMany(RepoAuth, {foreignKey: 'idRepository', as: 'author', allowNull: false, default: null })

module.exports = {
  User,
  Repo,
  Author,
  RepoAuth,
  RepoComment,
  ViewRepoComment
}
