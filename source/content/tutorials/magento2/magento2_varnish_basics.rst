.. _magento2_varnish_basics:

Understanding Magento 2 and Varnish
===================================

This chapter is mainly written for web developers who want to get a clear idea
about the basics of varnish with magento.

Varnish as you may already know is designed for HTTP semantics and will soon be
available for HTTP/2.0. The new version of HTTP/2 has been released under `RFC 7540`_.
However one must know that HTTP/2.0 is an alternative to HTTP/1.1 and doesnot
outmode HTTP/1.0.

What this protocol allows for any given website is to sent multiple requests in
serial mode over a single connection so that when a single client wants to fetch
several resources in  parallel, it can just open several connections to fetch from
a single webserver.

Now imagine multiple customers trying to order several products in  parallel from
a single magento webserver. The overhead this may cause is quite vast.
Which is why varnish is here to save the day!

To learn more about the basics of HTTP visit `HTTP Basics`_ at the `Varnish Software website`.

You also need to be clear about what you want varnish to do for your website.
To read more analyzing and understanding your website, as yourself the following questions:

- What makes the pages on your magento website different from each other?
- Do differences apply to entire pages or just part of them?
- How shall i inform varnish of the differences?

TO answer all your questions, follow the link to our varnish book discussing
`Content Composition`_ .

As you will see, Varnish can help manage your magento website in more then one way.
Varnish can help your webservers with load balancing, firewalls, file compressions,
cookie management, etc.

A better in-site on some of these Varnish characteristics would be to get to know
our product Varnish Cache a little better. Varnish cache as the name suggests
allows caching of resources. This mechanism is enhanced to allow multiple
identical requests from different clients to have the
same effect on a single request called the idempotency. But do not worry!

Varnish cache if configured properly doesnot cache `everything`! Infact you can
decide what to cache, how to cache when to cache. To be able to better manage
the cache headers, one must understand the `cache related header fields of HTTP`.
Varnish uses these rfc7232 and these rfc7234 cache header fields to decide which
objects to cache.

If a matched cache is valid then varnish retrieves responses from the cache.
This reduces the load of the origin server further more (apart from varnishes
load balancing capacities) from managing similar responses multiple times.

So when does Varnish serve the cached objects?
----------------------------------------------

In simple terms, varnish serves cache contents based on three things:

1. Cache Matching
2. Allowance
3. Freshness of Data


1. Cache Matching
.................

The cached object is properly matched. In such a case it is called `cache-hit`.
A proper example of a cached object on a Magento site would be common product
descriptions, but not the price! Because price may vary over time.
A cache-hit object is served without contacting the origin server. However if the
object requested is not in cache then it's `cache-miss` and in this case varnish
forwards this request to the origin serer.


2. Allowance
............

As mentioned in the varnish book, Allowance is validating the `cache-hit`.
Varnish further has an option for a user to choose how long an object should be in
cache and when to serve from the cache and when not-to. If a cached object should
be reserved or not. This validation process is done by checking whether the
request contains the `no-cache` directive. In such a cache the HTTP cache-control
header is checked for the presence of `no-cache`.

Read more about the `cache-control header`_ on the varnish book.


3.Freshness of Data
...................

When deciding whether to use a cached object i.e whether to `allow`
it, checking the freshness of the data and evaluating whether to deliver an
expired object or not is the question.

There are two kinds of objects:

`fresh objects` - age has not exceeded the freshness lifetime
`stale objects` - age has exceeded the freshness lifetime i.e. it is now an
`expired object`.

To read more about how the freshness of an object is determined visit the
varnish book, `Freshness`_ section.

Now let's move on to understanding the `Caching system in Magento 2 <magento2_ce>`.

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

Varnish cache on a Magento 2 site caches all/if any static pages and also parts
of dynamic pages.

Remember that varnish has a lot of resources and but if you have any questions
please feel free to contact us.

.. _`HTTP Basics`: http://book.varnish-software.com/4.0/chapters/HTTP.html#resources-and-representations
.. _`cache related header fields of HTTP`: http://book.varnish-software.com/4.0/chapters/HTTP.html#cache-related-headers-fields
.. _`Freshness`: http://book.varnish-software.com/4.0/chapters/HTTP.html#freshness
.. _`cache-control header`: http://book.varnish-software.com/4.0/chapters/HTTP.html#cache-control
.. _`Content Composition`: http://book.varnish-software.com/4.0/chapters/Content_Composition.html
.. _`RFC 7540`: https://www.rfc-editor.org/rfc/rfc7540.txt
