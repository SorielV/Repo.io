const CACHE_NAME = 'repo-io-v8'
const PRECACHE_URLS = ['/public/favicon.ico']

self.addEventListener('install', function(event) {
  console.log('install')
  event.waitUntil(
    caches
      .open(CACHE_NAME)
      .then(cache => cache.addAll(PRECACHE_URLS))
      .then(self.skipWaiting())
  )
})

/*
  self.addEventListener('activate', event => {
    console.log('active')
    const currentCaches = [CACHE_NAME, 'runtime']
    event.waitUntil(
      caches.keys().then(cacheNames => {
        return cacheNames.filter(cacheName => !currentCaches.includes(cacheName))
      })
        .then(cachesToDelete => {
          return Promise.all(cachesToDelete.map(cacheToDelete => {
            return caches.delete(cacheToDelete)
          }))
        })
        .then(() => self.clients.claim())
    )
  })
*/

self.addEventListener('fetch', function(event) {
  event.respondWith(
    caches.match(event.request).then(function(response) {
      if (response) {
        return response
      }
      return fetch(event.request)
    })
  )
})

/*
self.addEventListener('fetch', event => {
  if (
    event.request.url.startsWith(self.location.origin) &&
    event.request.method === 'GET' &&
    event.request.url
      .split('/')
      .pop()
      .includes('.')
  ) {
    event.respondWith(
      caches.match(event.request).then(cachedResponse => {
        if (cachedResponse) {
          console.log('From Cache')
          return cachedResponse
        }
        return caches.open('runtime').then(cache => {
          return fetch(event.request).then(response => {
            // Put a copy of the response in the runtime cache.
            console.log('Cloning in to Cache')
            return cache.put(event.request, response.clone()).then(() => {
              return response
            })
          })
        })
      })
    )
  } else {
    console.log('No fetch')
  }
})
*/

self.addEventListener('push', function(event) {
  const data = event.data.json().notification
  const promiseChain = self.registration.showNotification(data.title, {
    body: data.body,
    icon: data.icon,
    actions: data.action
  })
  event.waitUntil(promiseChain)
})
