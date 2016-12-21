.. _magento2_varnish_basics:

Understanding Magento2 and Varnish
===================================

This chapter is mainly written for web developers who want to get a clear idea
about the basics of using Varnish with Magento.

Varnish, as you may already know, is designed for HTTP semantics and will soon be
available for HTTP/2. The new version of HTTP/2 has been released under `RFC 7540`_.
However one must know that HTTP/2 is an alternative to HTTP/1.1 and does not
outmode HTTP/1.0.

This protocol allows for any given website to send multiple requests in
serial mode over a single connection so that when a single client wants to fetch
several resources in parallel, it can just open several connections to fetch from
a single web server.

Now imagine multiple customers trying to order several products in parallel from
a single Magento web server. The overhead this may cause is vast and potentially crippling,
which is why adding Varnish to the mix can save the day!

To learn more about the basics of HTTP visit `HTTP Basics`_ at the `Varnish Software website`.

You also need to be clear about what you want Varnish to do for your website.
While analyzing and learning to understand your website, ask yourself the following questions:

- What makes the pages on your Magento website different from each other?
- Do differences apply to entire pages or just parts of them?
- How should I inform Varnish about the differences?

To answer all your questions, follow the link to our Varnish book discussing
`Content Composition`_ .

As you will see, Varnish can help manage your Magento website in more ways than one.
Varnish can help your web servers with load balancing, firewalls, file compressions,
cookie management, etc.

Better insight on some of these Varnish features would be to get to know
our product, Varnish Cache, a little better. Varnish Cache, as the name suggests,
allows caching of resources. This mechanism is enhanced to allow multiple
identical requests from different clients to have the
same effect on a single request called the idempotency. But do not worry!

Varnish Cache, if configured properly, does not cache `everything`! In fact you can
decide what, how and when to cache. To be able to better manage
the cache headers, one must understand the `cache related header fields of HTTP`.
Varnish uses these rfc7232 and these rfc7234 cache header fields to decide which
objects to cache.

If a matched cache is valid then Varnish retrieves responses from the cache.
This reduces the load on the origin server further (apart from Varnish's
load-balancing capacities) from managing similar responses multiple times.

When does Varnish serve the cached objects?
-------------------------------------------

In simple terms, Varnish serves cached content based on three things:

1. Cache matching
2. Allowance
3. Freshness of data


1. Cache matching
.................

The cached object is properly matched, which is called a `cache-hit`.
An example of a cached object on a Magento site would be common product
descriptions, but the price is not cached because price may vary over time.
A cache-hit object is served without contacting the origin server. However if the
object requested is not in cache then it's a `cache-miss` and in this case Varnish
forwards this request to the origin serer.


2. Allowance
............

As mentioned in the Varnish book, allowance is the validation of the `cache-hit`.
Varnish also offers the option for users to choose how long an object should be in
cache and when to serve from the cache and when not to as well as whether a cached object should
be reserved or not. This validation process is done by checking whether the
request contains the `no-cache` directive. In such a cache the HTTP Cache-Control
header is checked for the presence of `no-cache`.

Read more about the `Cache-Control header`_ in the Varnish book.


3.Freshness of data
...................

When deciding whether to use a cached object, i.e whether to `allow`
it, checking the freshness of the data and evaluating whether to deliver an
expired object or not is the question.

There are two kinds of objects:

`fresh objects` - age has not exceeded hthe freshness lifetime
`stale objects` - age has exceeded the freshness lifetime, i.e. it is now an
`expired object`.

To read more about how the freshness of an object is determined, visit the
Varnish book, `Freshness`_ section.

Now let's move on to understanding the `Caching system in Magento 2 <magento2_ce>`.

.. _magento2_ce:

Caching in Magento2
--------------------

Magento2 is the next-generation open source digital
commerce platform. A large number of websites use Magento and with Magento2
the server performance is boosted to a new level.

Why does Magento2 require Varnish caching?
..............................................

Magento websites are expected to have large amount of traffic. For the website
to fly, Varnish Cache provides a caching mechanism that not only helps with
caching but also provides other services that enable Magento web servers to
provide excellent services to clients.

Cache extensions
----------------

Magento has two cache extensions:

- The internal cache (filesystem)

- The external cache (varnish!)

Here we will mainly talk about Varnish, the external cache.

As you may already know Magento2 supports Varnish out of the box.
Varnish Cache is installed as an independent component. It serves as an
intermediary between the web servers running Magento and the backened memory.

Varnish Cache on a Magento2 site caches all/if any static pages and also parts
of dynamic pages.

Remember that Varnish has a lot of resources and but if you have any questions
please feel free to contact us.

.. _`HTTP Basics`: http://book.varnish-software.com/4.0/chapters/HTTP.html#resources-and-representations
.. _`cache related header fields of HTTP`: http://book.varnish-software.com/4.0/chapters/HTTP.html#cache-related-headers-fields
.. _`Freshness`: http://book.varnish-software.com/4.0/chapters/HTTP.html#freshness
.. _`Cache-Control header`: http://book.varnish-software.com/4.0/chapters/HTTP.html#cache-control
.. _`Content Composition`: http://book.varnish-software.com/4.0/chapters/Content_Composition.html
.. _`RFC 7540`: https://www.rfc-editor.org/rfc/rfc7540.txt
