import Sequelize from 'sequelize'

import ViewRepoCommentModel from './../models/Views/Repo/Comment'
import RepoAuthModel from './../models/Views/AuthorRepository'

import Tables from './../models/tables'
const {
  User: UserModel,
  CatTypes: CatTypesModel,
  CatTopics: CatTopicsModel,
  Author: AuthorModel,
  Repository: RepoModel,
  RepoComment: RepoCommentModel
} = Tables

const sequelize = new Sequelize('Repos', 'java', '', {
  dialect: 'mysql'
})

const User = UserModel(sequelize, Sequelize)
const Repo = RepoModel(sequelize, Sequelize)
const Author = AuthorModel
const RepoAuthor = RepoAuthModel(sequelize, Sequelize)
const RepoComment = RepoCommentModel(sequelize, Sequelize)
const ViewRepoComment = ViewRepoCommentModel(sequelize, Sequelize)
const CatTypes = CatTypesModel(sequelize, Sequelize)
const CatTopics = CatTopicsModel(sequelize, Sequelize)

Repo.hasMany(RepoAuthor, {
  foreignKey: 'idRepository',
  as: 'author',
  allowNull: false,
  default: null
})

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
