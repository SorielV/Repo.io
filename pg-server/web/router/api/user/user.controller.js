import { User } from './../../../../models/user'

export async function getAll(req, res) {
  const items = await User.findAll()
  res.status(200).json({ data: items })
}
