import consola from 'consola'

/**
 * Model.prototype.initState = function(data) {
 * Model.prototype.save = async function() {
 * Model.prototype.update = async function() {
 * Model.prototype.delete = async function() {
 *
 * Model.findById = async function(id, raw = true) {
 * Model.findAll = async function() {
 * Model.findOne = async function(options) {
 * Model.find = async function(options = {}) {
 * Model.findOneAndUpadate = async function(where, values) {
 */

module.exports = function Schema(
  database,
  { table, columns: Schema, options, debug = false }
) {
  // Validacion de Schema
  if (!Schema || !Object.keys(Schema).length) {
    throw new Error('Schema Invalido')
  }

  // Generar Schema
  function Model(data, validate = true) {
    this.data = validate ? this.initState(data) : data

    for (let key in this.Schema) {
      const type = this.Schema[key].type
      const validate = this.Schema[key].validate || null
      const property = key.charAt(0).toLocaleUpperCase() + key.substr(1)
      this[`set${property}`] = function(value) {
        // Call static method
        this.data[key] = this.constructor.formatValue(value, type, validate)
      }
      this[`get${property}`] = function() {
        return this.data[key]
      }
    }
  }

  // Instanced
  Model.prototype.Schema = Schema
  Model.prototype.Table = table
  Model.prototype.Options = options

  // Static
  Model.Schema = Schema
  Model.Table = table
  Model.Options = options

  Model.allowedOperators = {
    '=': true,
    '<>': true,
    '>': true,
    '<': true,
    '>=': true,
    '=<': true,
    '%': true,
    or: true,
    like: true,
    between: true
  }

  /**
   * @param value => Valor
   * @param type => Tipo de dato
   * @param validate => function
   * @return propiedad validada y convertida
   */
  Model.formatValue = function(value, type, sql = false) {
    switch (type) {
      case String:
        return sql ? `'${String(value).replace("'", "''")}'` : String(value)
      case Date:
        return sql ? `'${new Date(value)}'` : new Date(value)
      case Number:
        if (isNaN(value)) {
          throw new Error(`${value} expected ${type} value`)
        }
        return Number(value)
      case Boolean:
        return Boolean(value)
      default:
        return
    }
  }

  /**
   * Return a value with valid sql format
   * @param {*} value
   * @param {*} type
   */
  Model.formatValueToSql = function(value, type) {
    if (type === String || type === Date) {
      return `'${value}'`
    } else {
      return value
    }
  }

  /**
   * Return a model validated
   * @param {*} data
   * @return Model
   */
  Model.validation = function(data) {
    const primaryKeys = this.Options.id || 'id'
    const Schema = Model.Schema
    const formatValue = Model.formatValue

    const model = {}

    for (let key in Schema) {
      if (!Schema[key].required) {
        model[key] =
          data.hasOwnProperty(key) && data[key] !== null
            ? formatValue(data[key], Schema[key].type)
            : Schema[key].default === undefined // 0 null undefined => false
              ? null
              : Schema[key].default
      } else {
        if (!data.hasOwnProperty(key) && !Schema[key].default) {
          throw new Error(`${key} Faltante`)
        }

        // null as ''
        model[key] =
          data[key] === null
            ? Schema[key].type === String
              ? ''
              : Schema[key].default
            : formatValue(data[key], Schema[key].type)
      }
    }

    return model
  }

  Model.prototype.initState = function(data) {
    const primaryKeys = this.Options.id || 'id'
    const Schema = this.Schema

    // Static Method
    const model = this.constructor.validation(data)

    // Remove autogenerate primaryKey
    if (Array.isArray(primaryKeys)) {
      for (let primaryKey of primaryKeys) {
        if (!Schema[primaryKey].required) {
          model[primaryKey] = null
        }
      }
    }
    // Return validated model
    return model
  }

  /**
   * Insert Element
   * @return Prommise(Element)
   */
  Model.prototype.save = async function() {
    const model = this.data
    const columnNames = []
    const columnValues = []

    const formatValueToSql = this.constructor.formatValueToSql

    for (let key in model) {
      columnNames.push(`"${key}"`)
      columnValues.push(
        model[key] !== null
          ? formatValueToSql(model[key], this.Schema[key].type)
          : 'default'
      )
    }

    const query = `insert into "${this.Table}"(${columnNames.join(
      ' , '
    )}) values (${columnValues.join(' , ')}) RETURNING *;`

    const {
      rows: [row]
    } = await database.query(query)
    return row
  }

  /**
   *
   * @param {String} column Columna
   * @param {Object} params
   */
  Model.formatWhereOperator = function(column, params, type) {
    const formatValue = this === Model ? this.formatValue : Model.formatValue // Static

    const allowedOperators =
      this === Model ? this.allowedOperators : Model.allowedOperators

    const operator = Object.keys(params)[0]

    if (allowedOperators[operator]) {
      const param = params[operator]
      if (operator === '%' || operator === 'like') {
        if (param === null || typeof param === 'object')
          throw new Error('Solo se espera un String')
        else return `"${column}" like '${param.replace("'", "''")}'`
      } else if (operator === 'between') {
        if (param.length !== 2) {
          throw new Error(`Se esperan 2 parametros ${params.join(' ')}`)
        }
        const [min = null, max = null] = param.map(el =>
          formatValue(el, type, true)
        )
        if (min === null || max === null) {
          throw new Error(`Parametros No Valididos`)
        } else {
          return `"${column}" between ${min} and ${max}`
        }
      } else {
        const value = formatValue(param, type, true)
        return `"${column}" ${operator} ${value}`
      }
    } else {
      return
    }
  }

  Model.whereStament = function(where) {
    const Schema = this === Model ? this.Schema : Model.prototype.Schema

    const formatWhereOperator =
      this === Model ? this.formatWhereOperator : Model.formatWhereOperator

    const whereStament = this === Model ? this.whereStament : Model.whereStament

    const whereStaments = []
    for (let whereKey in where) {
      if (whereKey === 'or' || whereKey === 'and') {
        // Llamada recurida
        whereStaments.push(whereStament(where[whereKey]))
      } else if (Schema[whereKey]) {
        if (where[whereKey] !== null && typeof where[whereKey] === 'object') {
          whereStaments.push(
            formatWhereOperator(
              whereKey,
              where[whereKey],
              Schema[whereKey].type
            )
          )
        } else {
          const value = Model.formatValue(
            where[whereKey],
            Schema[whereKey].type,
            true
          )
          whereStaments.push(`"${whereKey}" = ${value}`)
        }
      } else {
        // Basura
        delete where[whereKey]
      }
    }
    return whereStaments.join(' and ')
  }

  Model.columnStament = function(columns) {
    const Schema = this === Model ? this.Schema : Model.prototype.Schema

    const columnStaments = []
    for (let column of columns) {
      if (Array.isArray(column)) {
        if (column.length !== 2) {
          throw new Error('Columns as espera 2 paramatros [A, B] => A as B')
        } else if (!Schema.hasOwnProperty(column[0])) {
          throw new Error(`Columna ${column[0]} no definida en Schema`)
        } else {
          columnStaments.push(
            `"${column[0]}" as "${column[1].replace("'", "''")}"`
          )
        }
      } else {
        if (!Schema.hasOwnProperty(column)) {
          throw new Error(`Columna ${column} no definida en Schema`)
        } else {
          columnStaments.push(`"${column}"`)
        }
      }
    }
    return columnStaments.join(' , ')
  }

  Model.findById = async function(id, raw = true) {
    console.log(Model.Options.id)
    const columId = Array.isArray(Model.Options.id)
      ? Model.Options.id.find(primaryKey => {
          return !Model.Schema[primaryKey].required
        })
      : Model.Options.id

    const query = `select * from "${
      Model.prototype.Table
    }" where "${columId}" = ${Model.formatValueToSql(
      id,
      Model.prototype.Schema[columId].type
    )}`

    const {
      rows: [result]
    } = await database.query(query)
    console.log(query)
    return raw ? result : new Model(result, false)
  }

  /**
   * @return Items
   */
  Model.findAll = async function() {
    const table = Model.prototype.Table
    const query = `SELECT * from "${table}"`
    console.log(query)
    const { rows } = await database.query(query)
    return rows
  }

  Model.findOne = async function(options) {
    options.limit = 1
    const [result = null] = await Model.find(options)
    return result
  }

  // Select [static]
  Model.find = async function(options = {}) {
    const {
      where = null,
      columns = [],
      limit = null,
      offset = null,
      page = 0,
      raw = true
    } = options

    const table = Model.Table
    const Schema = Model.Schema
    const whereStament = Model.whereStament
    const columnStament = Model.columnStament

    const selectedColumns = columns.length !== 0 ? columnStament(columns) : '*'
    const whereConditions =
      where && Object.keys(where).length ? 'where ' + whereStament(where) : ''

    let query = `select ${selectedColumns} from "${table}" ${whereConditions}`

    if (limit || offset) {
      if (limit) {
        query += ` offset ${Number(offset) || 0}`
      }
      if (limit) {
        query += ` limit ${Number(limit) || 'all'}`
      }
    }
    console.log(query)
    const { rows } = await database.query(query)
    return raw ? rows : rows.map(item => new Model(item, false))
  }

  Model.prototype.update = async function() {
    const primaryKeys = this.Options.id || 'id'
    const model = this.data
    const formatValueToSql = this.constructor.formatValueToSql

    const columnNames = Object.keys(model).map(column => {
      // Produce "column_name" = 'value'
      return `"${column}" = ${
        model[column] !== null
          ? formatValueToSql(model[column], this.Schema[column].type)
          : 'default'
      }
      `
    })

    const statement = `update "${this.Table}" set ${columnNames.join(' , ')}`
    const whereStatement = []
    if (Array.isArray(primaryKeys)) {
      for (let primaryKey of primaryKeys) {
        // Produce "id" = "1" and "username" = "foo"
        whereStatement.push(`
          "${primaryKey}" = ${formatValueToSql(
          model[primaryKey],
          this.Schema[primaryKey].type
        )}
        `)
      }
    }

    return (
      statement + ' where ' + whereStatement.join(' and ') + ' RETURNING *;'
    )
  }

  /**
   * Update Element
   * @return Promise(Element)
   */
  Model.findOneAndUpadate = async function(where, values) {
    const options = { limit: 1 }
    // Model Object
    const [result = null] = await Model.find({ where, options }, false)
    if (result) {
      if (Array.isArray(this.Options.id)) {
        for (let primaryKey of this.Options.id) {
          delete values[primaryKey]
        }
      } else {
        delete values[this.Options.id]
      }
      console.log(result.data)
      result.data = result.constructor.validation({ ...result.data, ...values })
      return result.data
    } else {
      return null
    }
  }

  /**
   * Delete Element
   * @return Promise
   */
  Model.prototype.delete = async function() {
    const primaryKeys = this.Options.id || 'id'
    const whereStatement = []

    if (Array.isArray(primaryKeys)) {
      for (let primaryKey of primaryKeys) {
        // Produce "id" = "1" and "username" = "foo"
        whereStatement.push(`
          "${primaryKey}" = ${formatValueToSql(
          model[primaryKey],
          this.Schema[primaryKey].type
        )}
        `)
      }
    } else {
      whereStatement.push(`
        "${primaryKeys}" = ${formatValueToSql(
        model[primaryKeys],
        this.Schema[primaryKeys].type
      )}
      `)
    }

    let statement = `delete from "${this.Table}" ${whereStatement.join(
      ' and '
    )}`
    return true
  }

  return Model
}

/*
Model.formatValueStament = function(value, onNull = 'null') {
  if (value !== null) {
    return onNull
  } else {
    return typeof value === 'string' ? `'${value}'` : value
  }
}
*/
