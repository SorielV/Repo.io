insert into "RepositoriesInformation" select
       Repo.id,
       count(RC.comment) as comments,
       count(RS.score) as reviews,
       avg(RS.score) as review_score
from (
  select "idRepository" as id  from "RepositoryComment"
    union
  select "idRepository" as id  from "RepositoryScore"
) as Repo
  left join "RepositoryComment" as RC on Repo.id = RC."idRepository"
  left join "RepositoryScore" as RS on Repo.id = RS."idRepository"
group by Repo.id;