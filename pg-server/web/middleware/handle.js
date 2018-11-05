const catchException = fn => (req, res, next) => {
  Promise.resolve(fn(req, res, next)).catch(err => {
    return res
      .status(500)
      .json({ message: err.message })
      .end()
  })
}

export { catchException }
