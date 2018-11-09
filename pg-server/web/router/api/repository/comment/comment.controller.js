import { RepositoryComment as Comment } from './../../../../../models/repository'

Comment.getComments = function() {
  const query = `
  SELECT
    "Comment".id,
    "Comment".username,
    "User"."profileImage",
    "Comment".comment,
    "Comment"."createdAt",
    "Comment"."updatedAt"
  from
    "RepositoryComment" as "Comment"
    join "Users" as "User" using(username)
  where "idRepository" = 5;`

  return
}

export default Comment
