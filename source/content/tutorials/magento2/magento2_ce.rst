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
