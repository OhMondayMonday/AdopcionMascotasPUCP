self.addEventListener('install', event => {
    event.waitUntil(
        caches.open('offline-cache').then(cache => {
            return cache.addAll([
                '/',
                '/offline.html',
                '/styles.css', // Agrega aquí otros archivos que quieras cachear
                '/imagen-error.png'
            ]);
        })
    );
});

self.addEventListener('fetch', event => {
    event.respondWith(
        fetch(event.request).catch(() => {
            return caches.match(event.request).then(response => {
                return response || caches.match('/offline.html');
            });
        })
    );
});