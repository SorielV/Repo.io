export default async function({ store, redirect }) {
  await store.dispatch('loadAuth')
  if (!store.state.isAuth) {
    return redirect('/login')
  }
}
