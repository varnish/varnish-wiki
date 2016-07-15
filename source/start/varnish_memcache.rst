.. _varnish_memcache:


Varnish and Memcache
====================

Author: Per Buer
Written date: May 22 2014

found `here`_

Memcache is a more or less a database. It's a database that doesn't persist data and only stores it in memory. It also doesn't really care if it throws data out. The natural use for Memcache is to cache things internally in your application. Memcache uses its own specific protocol to store and fetch content.

Varnish on the other hand stores rendered pages. It talks HTTP so it will typically talk directly to a HTTP client and deliver pages from it's cache whenever there is a cache hit. When there is a cache miss it will go and fetch the content from the web server, store it and deliver a copy to the user.

These are two pretty different pieces of software. The end goal of both pieces of software is the same, though and most sites would use both technologies in order to speed up delivery.
They will deploy Varnish do speed up delivery of it's cache hits, and when you have a cache miss the application server might have access to some data in Memcache will be available to the application faster than what the database is capable of.

The performance characteristics are pretty different. Varnish will start delivering a cache hit in a matter of microseconds whereas a PHP page that gets rendered content from Memcache will likely spend somewhere around 15-30 milliseconds doing so. The reason Varnish can do it faster is that Varnish has it's content in local memory whereas the PHP script needs to get on the network and fetch the content over a TCP connection. In addition, you'll have the overhead costs of the interpreter. It's not that Varnish is better, it's just that Varnish has a much easier job to do and it is faster because of it.

There are no good reason not to use both.




.. here: https://www.quora.com/What-is-the-difference-between-using-varnish-and-caching-HTML-pages-in-memcached
