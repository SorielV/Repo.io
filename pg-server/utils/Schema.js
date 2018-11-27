import consola from 'consola'

Date.prototype.formatDate = function() {
  return (
    this.getFullYear() +
    '-' +
    this.getMonth() +
    '-' +
    this.getDay() +
    ' ' +
    this.getHours() +
    ':' +
    this.getMinutes() +
    ':' +
    this.getSeconds()
  )
}

module.exports = function Schema(
  database,
  { table, columns: Schema, options, debug = false }
) {
  // Validacion de Schema
  if (!Schema || !Object.keys(Schema).length) {
    throw new Error('Schema Invalido')
  }

  // Generar Schema
  class Model {
    static get Table() {
      return this instanceof Model ? this.constructor._Table : this._Table
    }

    static get Schema() {
      return this instanceof Model ? this.constructor._Schema : this._Schema
    }

    static get Options() {
      return this instanceof Model ? this.constructor._Options : this._Options
    }

    static get allowedOperators() {
      return {
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
    }

    /**
     * @param value => Valor
     * @param type => Tipo de dato
     * @param validate => function
     * @return propiedad validada y convertida
     */
    static formatValue(value, type, sql = false) {
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
    static formatValueToSql(value, type) {
      if (type === String) {
        return `'${value.replace("'", "''")}'`
      } else if (type === Date) {
        /*
        if (value instanceof Date) {
          if (isNaN(value.getTime())) {
            return 'null'
          }
        }
        */
        return `'${new Date(value).formatDate()}'`
      } else {
        return value
      }
    }

    static validation(data) {
      const Schema = Model._Schema
      const Options = Model._Options
      const primaryKeys = Options || 'id'
      const formatValue = Model.formatValue

      const model = {}

      // Set Properties
      for (let key in Schema) {
        if (!Schema[key].required) {
          model[key] =
            data.hasOwnProperty(key) && data[key] !== null
              ? formatValue(data[key], Schema[key].type)
              : Schema[key].default === undefined // 0 null undefined => false
                ? null
                : Schema[key].default
          if (
            Schema[key].type === String &&
            model[key] &&
            model[key].length > Schema[key].length
          ) {
            throw new Error(`${key} Length > ${Schema[key].length}`)
          }
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

      // Handle Validation
      for (let key in Schema) {
        if (Schema[key].validate) {
          if (!Schema[key].validate.apply(model)) {
            throw new Error(`${key} Validacion Fallida`)
          }
        }
      }

      return model
    }

    /**
     * Insert Element
     * @return Prommise(Element)
     */
    async save() {
      const Table = this.constructor.Table
      const Schema = this.constructor.Schema
      const formatValueToSql = this.constructor.formatValueToSql

      const model = this.data
      const columnNames = [],
        columnValues = []

      for (let key in model) {
        columnNames.push(`"${key}"`)
        columnValues.push(
          model[key] !== null
            ? formatValueToSql(model[key], Schema[key].type)
            : 'default'
        )
      }

      const query = `insert into "${Table}"(${columnNames.join(
        ' , '
      )}) values (${columnValues.join(' , ')}) RETURNING *;`

      const {
        rows: [row]
      } = await Model.query(query)

      return row
    }

    async merge(_values, strict = true) {
      const Schema = Model._Schema
      const Options = Model._Options
      const primaryKeys = Array.isArray(Options.id) ? Options.id : [Options.id]
      const formatValue = Model.formatValue
      const current = this.data

      let changes = 0

      // FIX: Loop Innecesario

      for (const key in Schema) {
        if (_values.hasOwnProperty(key)) {
          if (_values[key] !== current[key]) {
            if (primaryKeys.indexOf(key) === -1) {
              this.updateData[key] = formatValue(_values[key], Schema[key].type)
              changes++
            }
          }
        }
      }

      console.log('isStrict: ' + strict)

      if (changes /*- primaryKeys.length*/ <= 0) {
        if (strict) {
          throw new Error('Datos no validos informacion duplicada')
        } else {
          console.log('Merge sin cambios')
        }
      }

      console.log(this.updateData)
    }

    async update() {
      const Schema = Model._Schema
      const Options = Model._Options
      const formatValueToSql = Model.formatValueToSql
      const primaryKeys = Options.id
      const model = this.updateData

      console.log(model)

      const columnNames = Object.keys(model).map(column => {
        // Produce "column_name" = 'value'
        return `"${column}" = ${
          model[column] !== null
            ? formatValueToSql(model[column], Schema[column].type)
            : 'null'
        }
        `
      })

      const statement = `update "${Model._Table}" set ${columnNames.join(
        ' , '
      )}`

      const whereStatement = []

      if (Array.isArray(primaryKeys)) {
        for (const primaryKey of primaryKeys) {
          whereStatement.push(`
            "${primaryKey}" = ${formatValueToSql(
            this.data[primaryKey],
            Schema[primaryKey].type
          )}
          `)
        }
      } else {
        whereStatement.push(`
            "${primaryKeys}" = ${formatValueToSql(
          this.data[primaryKeys],
          Schema[primaryKeys].type
        )}
        `)
      }

      const {
        rows: [result]
      } = await Model.query(
        statement + ' where ' + whereStatement.join(' and ') + ' RETURNING *;'
      )
      return result
    }

    /*async update() {
      const Schema = this.constructor.Schema
      const Options = this.constructor.Options
      const formatValueToSql = this.constructor.formatValueToSql
      const primaryKeys = Options.id || 'id'
      const model = this.data

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
    }*/

    /**
     *
     * @param {String} column Columna
     * @param {Object} params
     */
    static formatWhereOperator(column, params, type) {
      const formatValue = Model.formatValue
      const allowedOperators = Model.allowedOperators
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

    static whereStament(where, array = false, strict = true) {
      console.log(where)
      const Schema = Model._Schema
      const formatWhereOperator = Model.formatWhereOperator
      const whereStament = Model.whereStament

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
            if (strict) {
              const value = Model.formatValue(
                where[whereKey],
                Schema[whereKey].type,
                true
              )
              whereStaments.push(`"${whereKey}" = ${value}`)
            } else {
              const value = Model.formatValue(
                where[whereKey],
                Schema[whereKey].type,
                false
              )
              whereStaments.push(
                `"${whereKey}"  like '%${value.replace("'", "''")}%'`
              )
            }
          }
        } else {
          // Basura
          delete where[whereKey]
        }
      }
      return array ? whereStaments : whereStaments.join(' and ')
    }

    static excludeColumnStament(exclude) {
      if (!Array.isArray(exclude) || exclude.length === 0) {
        return '*'
      }

      const Schema = Model.Schema
      const columns = []
      const column = Object.keys(Model.Schema).map(column => {
        if (exclude.indexOf(column) === -1) {
          columns.push(`"${column}"`)
        }
      })

      return columns.join(' , ')
    }

    static columnStament(columns) {
      const Schema = Model.Schema

      if (columns.length === 0) {
        return '*'
      }

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
          }
          columnStaments.push(`"${column}"`)
        }
      }

      return columnStaments.join(' , ')
    }

    static async findById(id, raw = true) {
      const columId = Array.isArray(Model.Options.id)
        ? Model.Options.id.find(primaryKey => {
            return !Model.Schema[primaryKey].required
          })
        : Model.Options.id

      const query = `select * from "${
        Model.Table
      }" where "${columId}" = ${Model.formatValue(
        id,
        Model.Schema[columId].type,
        true
      )}`

      const {
        rows: [result]
      } = await Model.query(query)
      return raw ? result : new Model(result, false)
    }

    /**
     * @return Items
     */
    static async findAll() {
      const table = Model.Table
      const query = `SELECT * from "${table}"`
      const { rows } = await Model.query(query)
      return rows
    }

    static async findOne(options, raw = true) {
      options.limit = 1
      const [result = null] = await Model.find({ where: options })
      return result ? (raw ? result : new Model(result, false)) : null
    }

    static query(query) {
      consola.info(query.text || query)
      return Model._database.query(query)
    }

    static async find(_options = {}) {
      const { where = [], columns = [], options = {}, exclude = [] } = _options
      const { limit = null, offset = null, page = 0, raw = true } = options

      const hasExclude = Array.isArray(exclude) && exclude.length > 0
      const hasColumns = Array.isArray(where) && where.length > 0

      if (hasExclude && hasColumns) {
        throw new Error('Invalid columns & exclude')
      }

      const table = Model._Table
      const Schema = Model._Schema
      const whereStament = Model.whereStament
      const columnStament = Model.columnStament
      const excludeColumnStament = Model.excludeColumnStament

      const selectedColumns = hasColumns
        ? columnStament(columns)
        : hasExclude
          ? excludeColumnStament(exclude)
          : '*'

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

      const { rows } = await Model.query(query)
      return raw ? rows : rows.map(item => new Model(item, false))
    }

    /**
     * Update Element
     * @return Promise(Element)
     */
    static async findOneAndUpadate(where, _values) {
      const primaryKeys = []
      const Schema = Model._Schema
      const Options = Model._Options
      const formatValueToSql = Model.formatValueToSql
      const options = { limit: 1, raw: true }
      // Model Object
      const [current = null] = await Model.find({ where, options })

      if (current) {
        const values = {}
        const updateColumn = []
        const primaryKeys = Array.isArray(Options.id)
          ? Options.id
          : [Options.id]
        const whereStatement = []

        console.log(current)

        if (Object.keys(_values).length <= 0) {
          throw new Error('Datos no validos sin criterios de actulizacion')
        }

        if (Array.isArray(primaryKeys)) {
          for (let primaryKey of primaryKeys) {
            // Produce "id" = "1" and "username" = "foo"
            whereStatement.push(`
              "${primaryKey}" = ${formatValueToSql(
              current[primaryKey],
              Schema[primaryKey].type
            )}
            `)
          }
        } else {
          whereStatement.push(`
            "${primaryKeys}" = ${formatValueToSql(
            current[primaryKeys],
            Schema[primaryKeys].type
          )}
          `)
        }

        for (let key in _values) {
          if (Schema.hasOwnProperty(key)) {
            if (_values[key] !== current[key]) {
              if (primaryKeys.indexOf(key) === -1) {
                values[key] = _values[key]
                updateColumn.push(key)
              }
            }
          }
        }

        if (Object.keys(values).length <= 0) {
          throw new Error('Datos no validos informacion duplicada')
        }

        // Validation methods should need other properterty of the data
        Model.validation({
          ...current,
          ...values
        })

        const columnNames = updateColumn.map(column => {
          // Produce "column_name" = 'value'
          return `"${column}" = ${
            values[column] !== null
              ? formatValueToSql(values[column], Schema[column].type)
              : 'default'
          }
          `
        })

        const query = `update "${Model._Table}" set ${columnNames.join(
          ' , '
        )} where ${whereStatement.join(' and ')} RETURNING *;`

        const {
          rows: [result]
        } = await Model.query(query)
        return result
      } else {
        return null
      }
    }

    /**
     * Delete Element
     * @return Promise
     */
    async delete() {
      const Table = this.constructor.Table
      const Schema = this.constructor.Schema
      const primaryKeys = this.constructor.Options.id || 'id'
      const whereStatement = []

      if (Array.isArray(primaryKeys)) {
        for (let primaryKey of primaryKeys) {
          // Produce "id" = "1" and "username" = "foo"
          whereStatement.push(`
            "${primaryKey}" = ${formatValueToSql(
            model[primaryKey],
            Schema[primaryKey].type
          )}
          `)
        }
      } else {
        whereStatement.push(`
          "${primaryKeys}" = ${formatValueToSql(
          model[primaryKeys],
          Schema[primaryKeys].type
        )}
        `)
      }

      let statement = `delete from "${Model._Table}" ${whereStatement.join(
        ' and '
      )};`
      return true
    }

    static async delete(where) {
      const Table = Model._Table
      const Schema = Model._Schema
      const primaryKeys = Model._Options.id || 'id'
      const formatValueToSql = Model.formatValueToSql
      const whereStatement = []

      const model = where

      if (Array.isArray(primaryKeys)) {
        for (let primaryKey of primaryKeys) {
          // Produce "id" = "1" and "username" = "foo"
          whereStatement.push(`
            "${primaryKey}" = ${formatValueToSql(
            model[primaryKey],
            Schema[primaryKey].type
          )}
          `)
        }
      } else {
        whereStatement.push(`
          "${primaryKeys}" = ${formatValueToSql(
          model[primaryKeys],
          Schema[primaryKeys].type
        )}
        `)
      }

      const query = `delete from "${Table}" where ${whereStatement.join(
        ' and '
      )};`
      const { rowCount } = await Model.query(query)
      return rowCount
    }

    constructor(data = {}, validate = true) {
      if (typeof data !== 'object' || Array.isArray(data)) {
        throw new Error('Data no valida')
      }

      const Schema = this.constructor._Schema
      const Options = this.constructor._Options
      const primaryKeys = Options.id || 'id'

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

      this.data = {}
      this.updateData = {}

      for (let column in Schema) {
        const type = Schema[column].type
        const validate = Schema[column].validate || null
        this.data[column] = model[column]
        const property = column.charAt(0).toLocaleUpperCase() + column.substr(1)
        this[`set${property}`] = function(value) {
          // Call static method
          this.data[column] = this.constructor.formatValue(
            value,
            type,
            validate
          )
        }
        this[`get${property}`] = function() {
          return this.data[column]
        }
      }
      // Return validated model
    }
  }

  Model._Table = table
  Model._Schema = Schema
  Model._Options = options
  Model._database = database

  return Model
}
