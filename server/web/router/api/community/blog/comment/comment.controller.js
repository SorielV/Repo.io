import { BlogComment } from './../../../../../../models/bundle'
import { Pagination } from './../../../../../../utils/pagination'

console.log(BlogComment)

const Id = BlogComment._Options.id

BlogComment.getComments = async function({ idRepository, ...options }) {
  const { limit = 100, offset = 100, page = 0, all = false, api = '' } = options

  if (isNaN(idRepository)) {
    return new Pagination(api, [], {
      total: 0,
      limit,
      offset,
      page
    })
  }

  const where = `where "idRepository" = ${Number(idRepository)}`
  const order = `order by "${Id}" desc`

  const query = `
    SELECT
      "Comment".id,
      "Comment".username,
      "User"."profileImage",
      "Comment".comment,
      "Comment"."createdAt",
      "Comment"."updatedAt"
    from
      "${BlogComment._Table}" as "Comment"
      join "Users" as "User" using(username)
    ${where}
    ${order};
  `

  const promises = [
    BlogComment.query({
      text: `select count(*) from "${BlogComment._Table}" ${where}`,
      rowMode: 'array'
    }),
    BlogComment.query({
      text: query
    })
  ]

  const [
    {
      rows: [[total]]
    },
    { rows: comments }
  ] = await Promise.all(promises)

  return new Pagination(api, comments, {
    total: 0,
    limit,
    offset,
    page
  })
}

export default BlogComment
