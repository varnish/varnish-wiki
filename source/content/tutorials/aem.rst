.. _aem:

Adobe Experience Manager and Varnish
====================================

Adobe Experience Manager (AEM) is an enterprise web content management system
that facilitates organizing, managing, and delivering creative assets. It has
ready-made templates that users can use to create content and store them securely
on the cloud.

Primarily, Adode recommends using the **Adobe Dispatcher** for caching pages. But,
as well you may know, it is not flexible enough for the cache invalidation techniques
needed today.

The Adobe Dispatcher
--------------------

It is relatively straight forward.
It has built-in rules for invalidation.
These specified rules are not flexible enough.

Dispatcher Limitations
......................

- Caches documents as delivered in the AEM Instance
- **Does NOT cache** HTTP headers (which provide info on handling that content)

- Holds onto the document
- **Does NOT** hold onto the accompanying HTTP response

This is where **VARNISH CACHE PLUS** can help in managing the complex rules
needed for your site's cache invalidation.


Varnish Cache Plus
------------------

- Cache HTTP headers (requests and responses)
- Configurable to cache any kind of HTTP request using queries
- Cache re-directed responses thus reducing load on the machine
- Querying of requests for content-heavy pages
- ESI
- Customization in flushing

Vanish Cache is great if you run, for example, a social media, news, banking, or resource data site, among others. Of course, not all the features mentioned above are included in the Varnish community version – that's why we have Varnish Cache Plus.

With Varnish Cache Plus, enhanced Cache Invalidation techniques you might get are:
- Users to purge content using key-based relationships
- Scalable cache invalidation (increases cache hit-rate)
- Exclude certain headers from cache
- Invalidate page using *smart bans*


Replacing Adobe Dispatcher with Varnish Cache Plus
--------------------------------------------------

Know  this requires a user to have great understanding of Varnish and its
language (VCL), AEM and HTTP. As challengin as it may be it is also rewarding
to see your website fly.

1. First rule of replacing Dispatcher with Varnish is to ensure that the VCL
configuration file mimics the behavior of the dispatcher (an Apache module
making use of CQ-handle headers to invalidate)

2. Any more site specific knowledge of the website layout can be used to limit
the trees of invalidation more aggressively.
More added value included read here `AEM - Cache Invalidation Part 2`_

3. Doing Bans
Your setup Preference:

- you can have Apache, Varnish and AEM on the same machine

- you can have them on different machines and use the Varnish built-in
  SSL/TLS capabilities for handling both the request from the client
  and the backend.


An example of Excluding backend responses from cache-control

.. literalinclude:: /content/examples/vcl_excludeFromCache.vcl
  :language: VCL


Example of sending all traffic to vdir directory

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :language: VCL
  :lines: 64


AEM Resources
-------------

.. _`AEM - Cache Invalidation Part 1`: https://info.varnish-software.com/blog/advanced-cache-invalidation-applied-replacing-adobe-aem-cq5-dispatcher-with-varnish-plus-part-1

.. _`AEM - Cache Invalidation Part 2`: https://info.varnish-software.com/blog/advanced-cache-invalidation-part2
