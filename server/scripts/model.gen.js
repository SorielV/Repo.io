const { Pool } = require('pg')
const fs = require('fs')
const { promisify } = require('util')
const Path = require('path')

const env = process.env.NODE_ENV || 'development'
const { [env]: config } = require('./../database.json')

const mkdir = promisify(fs.mkdir)
const writeFile = promisify(fs.writeFile)

const database = new Pool(config)

const files = {
  CatalogAuthors: {
    folder: '/catalogs/author',
    file: 'index.js',
    model: 'Author'
  },
  CatalogEditorials: {
    folder: '/catalogs/editorial',
    file: 'index.js',
    model: 'Editorial'
  },
  CatalogTopics: {
    folder: '/catalogs/topic',
    file: 'index.js',
    model: 'Topic'
  },
  CatalogTypes: {
    folder: '/catalogs/type',
    file: 'index.js',
    model: 'Type'
  },
  Repositories: {
    folder: '/repository',
    file: 'repository.js',
    model: 'Repositoy',
    deep: 2
  },
  RepositoryAuthors: {
    folder: '/repository/author',
    file: 'index.js',
    model: 'Author'
  },
  RepositoryComment: {
    folder: '/repository/comment',
    file: 'index.js',
    model: 'Comment'
  },
  RepositoryEditorials: {
    folder: '/repository/editorial',
    file: 'index.js',
    model: 'Editoria'
  },
  RepositoryScore: {
    folder: '/repository/score',
    file: 'index.js',
    model: 'Score'
  },
  RepositoryTopics: {
    folder: '/repository/topic',
    file: 'index.js',
    model: 'Topic'
  },
  RepositoryTypes: {
    folder: '/repository/type',
    file: 'index.js',
    model: 'Type'
  },
  Verification_Token: {
    folder: '/user/v-token',
    file: 'index.js',
    model: 'Token'
  },
  Bundle: {
    folder: '/bundle',
    file: 'bundle.js',
    model: 'Bundle',
    deep: 2
  },
  BundleRepository: {
    folder: '/bundle/repository',
    file: 'index.js',
    model: 'Repositoy'
  },
  BundleComment: {
    folder: '/bundle/comment',
    file: 'index.js',
    model: 'Comment'
  },
  Files: {
    folder: '/files',
    file: 'index.js',
    model: 'Files',
    deep: 2
  },
  MyList: {
    folder: '/user/mylist',
    file: 'index.js',
    model: 'MyList'
  },
  Users: {
    folder: '/user',
    file: 'user.js',
    model: 'User',
    deep: 2
  }
}

const baseModel = (schema, { model, folder, file }, deep = 3) => {
  const modelSchema = `${model}Schema`
  return `
import database from './${'../'.repeat(deep)}config/database'
import Schema from './${'../'.repeat(deep)}utils/Schema'

const ${modelSchema} = ${JSON.stringify(schema, undefined, 2).replace(
    /(~")|("~)/g,
    ''
  )}

const ${model} = new Schema(database, ${modelSchema})

export default ${model}
`
}

const infoTable = (table, schema = 'public') => {
  return `
    SELECT
      I.column_name as name,
      I.data_type as type,
      I.is_nullable as required,
      I.is_updatable as updatable,
      I.column_default as default,
      I.character_maximum_length as length
    FROM information_schema.columns as I
      WHERE 
    (table_schema, table_name) = ('${schema}', '${table}')
  `
}

const infoKeyTable = (table, schema) => {
  return `
    SELECT
      c.column_name
    FROM
      information_schema.table_constraints tc
      JOIN information_schema.constraint_column_usage AS ccu USING (constraint_schema, constraint_name)
      JOIN information_schema.columns AS c 
        ON c.table_schema = tc.constraint_schema AND 
          tc.table_name = c.table_name AND
          ccu.column_name = c.column_name
    where constraint_type = 'PRIMARY KEY' and tc.table_name = '${table}';
   `
}

const formatType = sqlType => {
  if (sqlType.includes('character')) return '~String~'
  else if (sqlType.includes('timestamp')) return '~Date~'
  else if (sqlType.includes('int')) return '~Number~'
  else if (sqlType.includes('boolean')) return '~Boolean~'
  else return null
}

async function parseInfo(table, columns) {
  const Schema = {
    table,
    columns: {},
    options: {
      id: []
    }
  }

  const { rows: keys } = await database.query(infoKeyTable(table))
  if (keys.length === 1) Schema.options.id = keys[0].column_name
  else Schema.options.id = keys.map(({ column_name }) => column_name)

  for (let {
    name,
    type,
    required,
    updatable,
    default: _default,
    length
  } of columns) {
    Schema.columns[name] = {
      type: formatType(type),
      required: required === 'YES',
      updatable: updatable === 'YES'
    }
    if (Schema.columns[name].type === '~String~')
      Schema.columns[name].length = length
    if (Schema.columns[name].required && _default)
      Schema.columns[name].default = _default
  }
  return Schema
}

async function genereateSchemas(schema) {
  const selectTables = `
    select
      tablename
      from "pg_catalog"."pg_tables" as S
      where S.schemaname = '${schema}';
  `

  const { rows } = await database.query(selectTables)
  const tables = rows.map(({ tablename: table }) => table)

  const promises = tables.map(async table => {
    const { rows: info_table } = await database.query(infoTable(table, schema))
    return parseInfo(table, info_table)
  })

  const table_schemas = await Promise.all(promises)
  return table_schemas
}

const path = Path.join(__dirname, '../models')
console.log(path)

genereateSchemas('public')
  .then(schemas => {
    for (let schema of schemas) {
      const { table } = schema
      const folderPath = Path.join(path, files[table].folder)
      const filePath = Path.join(path, files[table].folder, files[table].file)
      writeFile(
        filePath,
        baseModel(schema, files[table], files[table].deep || 3),
        'utf8'
      )
        .then(_ => console.log(table, filePath))
        .catch(console.error)
    }
  })
  .catch(console.log)
