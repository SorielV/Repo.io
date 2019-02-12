DB_HOST='127.0.0.1'
DB_PORT='6666'
DB_USER='postgres'
DB_PASSWORD='postgres'
DB_DATABASE='repo'

if [ -z "$DUMP" ]
then
  echo '$DUMP is required'
  exit 0
fi

function database()
{
  echo "Database"
  DOCKER_DB_ID=`docker-compose ps -q db`
  if [ -z "${DOCKER_DB_ID}" ]
  then
    docker-compose up -d db
    DBD=true
    DOCKER_DB_ID=`docker-compose ps -q db`
  else
    DBD=false
  fi
}

database

docker exec -i "${DOCKER_DB_ID}" pg_restore -C --clean --no-acl --no-owner -d postgres://"${DB_USER}":"${DB_PASSWORD}"@"${DB_HOST}":"${DB_PORT}"/"${DB_DATABASE}" "${DUMP}"