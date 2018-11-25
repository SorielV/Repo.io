export default async function({ store, redirect }) {
  await store.dispatch('loadAuth')
  if (!store.state.isAuth) {
    return redirect('/login')
  } else {
    const user = store.state.user
    if (user.type !== 1) {
      return redirect('/')
    }
  }
}
