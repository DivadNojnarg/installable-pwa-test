// Import Workbox (https://developers.google.com/web/tools/workbox/)
importScripts('https://storage.googleapis.com/workbox-cdn/releases/3.6.3/workbox-sw.js');

/*
  Precache Manifest
  Change revision as soon as file content changed
*/
self.__precacheManifest = [
  {
    revision: '1',
    url: 'framework7-5.7.14/css/framework7.bundle.min.css'
  },
  {
    revision: '1',
    url: 'framework7-5.7.14/js/framework7.bundle.min.js'
  },
];

/*
  Enable precaching
  It is better to comment next line during development
*/

// Ensure your build step is configured to include /offline.html as part of your precache manifest.
workbox.precaching.precacheAndRoute(self.__precacheManifest || []);


// Catch routing errors, like if the user is offline
workbox.routing.setCatchHandler(async ({ event }) => {
  // Return the precached offline page if a document is being requested
  if (event.request.destination === 'document') {
    return workbox.precaching.matchPrecache('/offline.html');
  }

  return Response.error();
});
