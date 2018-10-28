import consola from 'consola'

export default function Schema(
  database,
  { table, columns: Schema, options, debug = false }
) {
  // Validacion de Schema
  if (!Schema || !Object.keys(Schema).length) throw new Error('Schema Invalido')

  // Generar Schema
  function Model(data) {
    this.data = this.initState(data)

    for (let key in this.Schema) {
      const type = this.Schema[key].type
      const validate = this.Schema[key].validate || null
      const property = key.charAt(0).toLocaleUpperCase() + key.substr(1)

      this[`set${property}`] = function(value) {
        // Call static method
        this.data[key] = this.constructor.formatType(value, type, validate)
      }
      this[`get${property}`] = function() {
        return this.data[key]
      }
    }
  }

  Model.prototype.Schema = Schema
  Model.prototype.Table = table
  Model.prototype.Options = options

  Model.prototype.initState = function(data) {
    const id = this.Options.id || 'id'
    const Schema = this.Schema
    // Static Method
    const validate = this.constructor.formatType
    const model = {}

    for (let key in Schema) {
      if (!Schema[key].required) {
        if (data[key]) {
          model[key] = data[key] ? validate(data[key], Schema[key].type) : null
        } else {
          model[key] = Schema[key].default || null
        }
      } else {
        if (!data.hasOwnProperty(key)) {
          if (Schema[key].default) {
            model[key] = Schema[key].default
          } else {
            throw new Error(`${key} Faltante`)
          }
        } else if (!data.hasOwnProperty(key) && Schema[key].type === String) {
          throw new Error(`${key} Formato no Valido Value ${data[key]}`)
        } else {
          model[key] =
            data[key] !== null ? validate(data[key], Schema[key].type) : null
        }
      }
    }
    model[id] = null
    return model
  }

  /**
   * Insert Element
   * @return Prommise(Element)
   */
  Model.prototype.save = async function() {
    const model = this.data
    const formatTypeStr = this.constructor.formatTypeStr

    const columnValues = [],
      insertedValues = []
    for (let key in model) {
      columnValues.push(`"${key}"`)
      insertedValues.push(
        model[key] !== null
          ? formatTypeStr(model[key], this.Schema[key].type)
          : 'default'
      )
    }
    const query = `insert into "${this.Table}"(${columnValues.join(
      ' , '
    )}) values (${insertedValues.join(' , ')}) RETURNING *;`
    const {
      rows: [row]
    } = await database.query(query)
    return row
  }

  /**
   * Update Elment
   * @return Promise(Element)
   */

  Model.prototype.update = async function() {
    const model = this.data
    const sets = []
    for (let key in model) {
      sets.push(
        `"${key}" = ${model[key] !== null ? `'${model[key]}'` : 'default'}`
      )
    }
    const id = this.options.id || 'id'
    let statement = `update "${this.table}" set ${sets.join(
      ' , '
    )} where "${id}" = ${model[id]};`
    return statement
  }

  /**
   * Delete Element
   * @return Promise
   */
  Model.prototype.delete = async function() {
    let statement = `delete from "${this.table}" where "id" = ${model.id};`
    return true
  }

  Model.formatTypeStr = function(value, type) {
    if (type === String || type === Date) {
      return `'${value}'`
    } else {
      return value
    }
  }

  // Validar Prop
  /**
   * @param value => Valor
   * @param type => Tipo de dato
   * @param validate => function
   * @return propiedad validada y convertida
   */
  Model.formatType = function(value, type, format = false) {
    switch (type) {
      case String:
        return format ? `'${String(value).replace("'", "''")}'` : String(value)
      case Date:
        return format ? `'${String(value).replace("'", "''")}'` : String(value)
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

  // Validar Model
  Model.valitation = function(data) {
    const instance = this === Model
    const id = this.options.id || 'id'
    const Schema = instance ? this.Schema : Model.Schema

    const validate = instance ? this.formatType : Model.formatType

    const model = {}

    for (let key in Schema) {
      if (!Schema[key].required) {
        if (data[key])
          model[key] = data[key] ? validate(data[key], Schema[key].type) : null
        else model[key] = Schema[key].default || null
      } else {
        if (data[key] === undefined) throw new Error(`${key} Faltante`)
        else if (!data[key] && Schema[key].type === String)
          throw new Error(`${key} Formato no Valido Value ${data[key]}`)
        else
          model[key] =
            data[key] !== null ? validate(data[key], Schema[key].type) : null
      }
    }
    model[id] = null
    return model
  }

  Model.findAll = async function() {
    const table = Model.prototype.Table
    const query = `SELECT * from "${table}"`
    console.log(query)
    const { rows } = await database.query(query)
    return rows
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

  // Select [static]
  Model.find = async function({ where = null, columns = [] }) {
    const table = Model.prototype.Table
    const Schema = Model.prototype.Schema
    const whereStament = Model.whereStament
    const columnStament = Model.columnStament

    const selectedColumns = columns.length !== 0 ? columnStament(columns) : '*'

    const whereConditions =
      where && Object.keys(where).length ? 'where ' + whereStament(where) : ''

    const query = `select ${selectedColumns} from "${table}" ${whereConditions}`
    console.log(query)
    const { rows } = await database.query(query)
    return rows
  }

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
   * where: {
   *  name: {
   *    or: ['A','B']
   *   },
   *   id: {
   *     betwenn: [1, 10]
   *  }
   * whwere name = 'A' or nombre = 'B and id between 1 and 10
   */

  /**
   *
   * @param {String} column Columna
   * @param {Object} params
   */
  Model.formatWhereOperator = function(column, params, type) {
    const formatType = this === Model ? this.formatType : Model.formatType // Static

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
          formatType(el, type, true)
        )
        if (min === null || max === null) {
          throw new Error(`Parametros No Valididos`)
        } else {
          return `"${column}" between ${min} and ${max}`
        }
      } else {
        const value = formatType(param, type, true)
        return `"${column}" ${operator} ${value}`
      }
    } else {
      return
    }
  }

  Model.formatTypeStament = function(value, onNull = 'null') {
    if (value !== null) {
      return onNull
    } else {
      return typeof value === 'string' ? `'${value}'` : value
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
          const value = Model.formatType(
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

  // Select By Id  [static]
  Model.findById = async function(id) {
    const idKey = this.options.id || 'id'
    const query = `SELECT * from "${
      this === Model ? this.table : this.prototype.Table
    }" where"${idKey}" = ${idKey};`
    const { rows } = await database.query(query)
    return rows
  }

  Model.Schema = Schema
  Model.table = table
  Model.options = options

  return Model
}
