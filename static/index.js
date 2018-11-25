const CKEDITOR_BASEPATH = '/public/js/ckeditor'

window.addEventListener('beforeinstallprompt', function(e) {
  // beforeinstallprompt Event fired
  // e.userChoice will return a Promise.
  // For more details read: https://developers.google.com/web/fundamentals/getting-started/primers/promises
  e.userChoice.then(function(choiceResult) {
    console.log(choiceResult.outcome)
    if (choiceResult.outcome == 'dismissed') {
      console.log('User cancelled home screen install')
    } else {
      console.log('User added to home screen')
    }
  })
})

/*
const config = {
  apiKey: 'AIzaSyDAvPpHAOBcwoBKfpgP9pMtyS47otTy8OU',
  authDomain: 'pi2018-cb3d2.firebaseapp.com',
  databaseURL: 'https://pi2018-cb3d2.firebaseio.com',
  projectId: 'pi2018-cb3d2',
  storageBucket: 'pi2018-cb3d2.appspot.com',
  messagingSenderId: '883690092936'
}
*/

/*
const FIREBASE = window.firebase.initializeApp(config)
const FIREBASE_MESSAGING = FIREBASE.messaging()
let USER_TOKEN // Save Local Storage
*/

if ('serviceWorker' in navigator) {
  navigator.serviceWorker
    .register('/sw.js')
    .then(sw => {
      console.log(sw)
      // FIREBASE_MESSAGING.useServiceWorker(sw)
      // return FIREBASE_MESSAGING.requestPermission()
      return
    })
    .then(() => {
      console.log('Notificaciones Aceptadas')
      // return FIREBASE_MESSAGING.getToken()
    })
    /*
    .then(token => {
      console.log('Fire Base: ', token)
      USER_TOKEN = token
    })
    */
    .catch(err => {
      console.log('Error Al Montar SW: ', err)
    })
}
