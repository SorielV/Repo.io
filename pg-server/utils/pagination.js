export class Pagination {
  constructor(api, data, { total, limit, offset, page, ...params }) {
    console.log(api)
    this.total = total
    this.limit = limit
    this.offset = offset
    this.page = page + 1
    this.params = params
    this.prevPage =
      page > 0 ? `${api}?page=${page}&limit=${limit}&offset=${offset}` : null
    this.nextPage =
      (page + 1) * offset < total
        ? `${api}?page=${page + 2}&limit=${limit}&offset=${offset}`
        : null
    this.data = data
  }
}
