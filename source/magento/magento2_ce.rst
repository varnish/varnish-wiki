.. _magento2_ce:


Caching in Magento 2
--------------------

Magento 2 with its great abilities is the next generation open source digital
commerce platform. A large number of websites use magento and with magento 2
the server performance has boosted to a new level.

So why does Magento 2 require varnish caching?
..............................................

Magento websites are expected to have large amount of traffic. For the website
to fly varnish cache provides a caching mechanism that not only helps with
caching but also provides other services that enables magento webservers to
provide excellent services to clients.

Cache Extensions
----------------

Magento has two Cache extensions;
- The internal cache (filesystem)
- The external cache (varnish!)

Here we will mainly talk about Varnish, the external cache.

As you may already know Magento 2 supports varnish out of the box.
The varnish cache is installed as an independent component. It serves as an
intermediate between the webservers running magento and the backened memory.

Varnish cache on a magento 2 site caches all/if any static pages and also parts
of dynamic pages.

Cookies
.......

By default varnish does not cache a page if it has header fields from clients or
servers. The main reason for that is to avoid delivering cookie based content to
the wrong client and also to avoid bestrewing the cache with copies of the same
content.

Most importantly, when dealing with cookies to cache, it is discouraged to cache
anything rather then caching personal client information that could jeopardize a
client or your company if delivered to the wrong client.

one of our recommended VMODs for handling cookies would be `libvmod-cookie`_ which
is available in the varnish modules repository on `github`_ or you can download
the whole module from the `varnish website` . The module also contains a `vmod-header`
which can be used for manipulation of duplicated HTTP headers, such as multiple
Set-Cookie headers!


Edge Side Includes
..................

Edge Side Includes (ESI) helps Varnish deliver various objects together.
On a magento website, a good example of a use of ESI would be to display emerging
of new products on a top banner on a client home page or the cart.
While most of the client home page contents can be cached, the top banner and
the cart will have smaller TTL values.
Let's say the TTL value of the banner would be about 5 minutues, the cart about
1 hour while the user page content such as name, purchased products, watching,
history would be cached for a day.


AJAX Requests on Magento
........................

AJAX is of course a cool technology and developers love it.
If you are a long term magento user you probably added them to your magento site
to avoid page reloads or parts of page reloads. Of course you have already read
about ESI's and they can do a similar task for you.

But if you already have AJAX on your magento site, you should know that there are
browser restrictions that doesnot allow AJAX to send requests across another doamin.
What you can do to solve this issue, is masquerade all AJAX requests. To be able
to do that you will need to add a  regular expression to masquerade the request url
in the VCL code in the `vcl_recv` subroutine.

.. literalinclude:: files/snippet6_masq
  :language: c


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


To get a better and more indepth overview of our cache invalidation process,
a recommended read is the article by `Per Buer on Cache Invalidation at Smash Magazine`_

There is also a great comparison table in The Varnish Book - `Cache Invalidation`_

More about `Advanced Cache Invalidation Techniques`_


.. _`Cache Invalidation`: http://book.varnish-software.com/4.0/chapters/Cache_Invalidation.html
.. _`Per Buer on Cache Invalidation at Smash Magazine`: https://www.smashingmagazine.com/2014/04/cache-invalidation-strategies-with-varnish-cache/
.. _`libvmod-cookie`: https://download.varnish-software.com/varnish-modules/varnish4.0/libvmod-cookie-20151013.git7e453b4.tar.gz
.. _`github`: https://github.com/varnish/varnish-modules
.. _`varnish website`:  https://download.varnish-software.com/varnish-modules/
.. _`Advanced Cache Invalidation Techniques`: https://info.varnish-software.com/blog/advanced-cache-invalidation-strategies
