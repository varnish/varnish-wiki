.. _cache_invalidation:

Cache Invalidation
------------------

Firstly to cache or not to cache. But once you decide to cache, cache invalidation
becomes an important part of your cache policy. the good news is Varnish automatically
invalidates expired objects for you. But you also have the advantage of taking charge
of invalidating your websites cached objects.

The easiest but not recommended way to invalidate cache is to assign small TTL
values to cached objects. This would simply expire cached contents quickly.

Just changing the ttl value in the `vcl_fetch` would speed up invalidation and
return more fresh contents such as the code below::

``sub vcl_fetch {``

	``set beresp.ttl = 5s;``

``}``

This sets the ttl to 5seconds, thus varnish picks up Magento changes every 5sec.

However, it is known that the most effective way of increasing a websites hit
ratio is to increase the time-to-live (ttl) of the objects. Therefore there is
more to the caching process then just the ttl value.

Another alternative could be to validate cached contents per request.

These alternatives can cause issues, as this creates higher load on the application
server.

However with Varnish, there are four mechanisms to invalidate caches.

1. HTTP Purge
.............

HTTP Purging is very straight forward. With the use of Varnish VCL subroutine
`vcl_purge`, Varnish will discard the object from the cache and free up memory.
A restart would immediately update the purged object.

2. Banning
...........

Bans can be implemented for objects that are known to frequently change.
In such a case, certain contents are banned to be retrieved from the cache based
on the meta data. The ban is quite a reliable method, as it only works for
objects in the cache but doesnot interfere with new content being cached or
served.

3. Forcing a Cache Miss
.......................

This mechanism is similar to flusing the entire cache,
as in it follows the procedure that when an object is not found in the cache
it is served from the backend. But it also very much like Bans.

However *cache miss* is more reliable as it this is forced and very much like
refreshing a page. This method refreshes an object by forcing a cache miss for a
request. Thus enabling a force fetch from the backend and overriding the current
one. But the old object does remain in the cache until its ttl expires.

4. Hashtwo / Xkey
.................

The hashtwo or xkey is for websites requiring large scale caching.


.. include:: /intro/more_caching.rst
