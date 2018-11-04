export class Pagination {
  constructor(api, data, { total, limit, offset, page, ...params }) {
    console.log(api)
    this.total = total
    this.limit = limit
    this.offset = offset
    this.page = page + 1
    this.params = params
    this.nextPage = `${api}?page=${page}limit=${limit}&offset=${offset}`
    this.prevPage = `${api}?page=${page + 2}limit=${limit}&offset=${offset}`
    this.data = data
  }
}
