.. _faq:

FAQ for Beginners
=================

**What is Varnish?**

Varnish Cache is a web application accelerator also known as a caching
HTTP reverse proxy. You install it in front of any server that speaks
HTTP and configure it to cache the contents. Varnish Cache is really,
really fast. It typically speeds up delivery with a factor of 300 -
1000x, depending on your architecture. A high level overview of what
Varnish does can be seen in `this video <https://www.youtube.com/watch?v=fGD14ChpcL4>`_.

Here is `THE BIG VARNISH PICTURE`_ if you want Word by Word details! :)

**What is Varnish's superpower?**

Highly Flexible !!

One of the key features of Varnish Cache, in addition to its
performance, is the flexibility of its configuration language, VCL.
VCL enables you to write policies on how incoming requests should be
handled. In such a policy you can decide what content you want to serve,
from where you want to get the content and how the request or response
should be altered. And, you can `extend Varnish with modules
(VMODs) <https://www.varnish-cache.org/vmods>`_. You can read more
about this in our `tutorial at varnish-cache.org`_.

`The Design Principle of Varnish`_

**Should I use Varnish for my site?**

If you are wondering why you are on our website reading about our product,
you are in the right section!
So you want to get Varnish for your website and wondering why?

Most probably because you need to handle a lot of traffic!
Caching is one of the best ways to maximize the output of your website!

The main idea behind making your website flying is to reduce the workload of your
webserver and it's network. Your frontend shouldn't have to make requests to the
backend too often for the same dynamic content every time a client requests it.

To save your resources placing a reverse-proxy, caching software like Varnish Cache
right in front of your web application can accelerate the responses to almost all
your HTTP requests and thus reducing server workload.

Congratulations! you are making a great choice!

Because Varnish does exactly that! and more!
Varnish works by managing client requests BEFORE they make it to your web
application server. Varnish not only reduces your webserver load but also has
other security services to make your webservers secure.

There is a good article describing `Varnish Cache on
Wikipedia <http://en.wikipedia.org/wiki/Varnish_(software)>`_.


.. _varnish_memcache:

**What is the relation between Varnish and Memcache?**

Memcache is a more or less a database. It's a database that doesn't persist data
and only stores it in memory. It also doesn't really care if it throws data out.
The natural use for Memcache is to cache things internally in your application.
Memcache uses its own specific protocol to store and fetch content.

Varnish on the other hand stores rendered pages. It talks HTTP so it will
typically talk directly to a HTTP client and deliver pages from it's cache
whenever there is a cache hit. When there is a cache miss it will go and fetch
the content from the web server, store it and deliver a copy to the user.

These are two pretty different pieces of software. The end goal of both pieces
of software is the same, though and most sites would use both technologies in
order to speed up delivery. They will deploy Varnish do speed up delivery of it's
cache hits, and when you have a cache miss the application server might have access
to some data in Memcache will be available to the application faster than what the
database is capable of.

The performance characteristics are pretty different. Varnish will start
delivering a cache hit in a matter of microseconds whereas a PHP page that gets
rendered content from Memcache will likely spend somewhere around 15-30 milliseconds
doing so. The reason Varnish can do it faster is that Varnish has it's content in
local memory whereas the PHP script needs to get on the network and fetch the
content over a TCP connection. In addition, you'll have the overhead costs of the
interpreter. It's not that Varnish is better, it's just that Varnish has a much
easier job to do and it is faster because of it.

There are no good reason not to use both.

Author: Per Buer
Written date: May 22, 2014
found `here`_

.. _`here`: https://www.quora.com/What-is-the-difference-between-using-varnish-and-caching-HTML-pages-in-memcached

**What is the difference in caching architecture between Varnish and Squid?**

The most fundamental difference between Squid and Varnish is that Squid is forward
proxy that can be a configured as a reverse proxy whereas Varnish is built from
the ground up to be a reverse proxy.

So, in principle Varnish is better suited than Squid to do reverse proxy HTTP.
However, Squid is a very mature product and has had time to accumulate a lot of
features that still are not available in Varnish. Both projects are used by huge
websites and both of them can do almost anything.

The main advantages of Squid over Varnish, as I see them, are:

Built in SSL support. Varnish needs stud, nginx or stunnel to do SSL.
Better support for Range and streaming delivery of objects.
Support for antivirus-plugins

On the other hand, Varnish has:
An absolutely amazing configuration system. VCL gives unmatched flexiblity to
run policies. Want to rewrite URLs coming from a certain user-agent requesting a
specific URL coming from a specific network? Easy. With Squid, that configuration
will be quite complex (if at all possible).
Better performance and scalability. Squid is a single process running on only one
CPU core, whereas Varnish is threaded. Artur Bergman reported having a Varnish server
serving 60K req/sec on real life traffic. That's more than most of us ever see and
I doubt that you'll be able to see Squid push those kind of numbers.
Better and more flexible invalidation support. With Varnish you can invalidate
content from cache based on more or less everything. I can elaborate on this.

Also, worth a mention is the module support in Varnish which makes it fairly easy
to extend Varnish and add new features. I've seen people writing modules in a
matter of hours. Very powerful stuff.

Author: Per Buer
Updated: Jan 28, 2013

More Reading ...
................

Read on about :ref:`Understand your Website <website_arch>`

`Is My Varnish Working?`_

This varnish checking website is hosted by `Acquia`_

.. _`Acquia`: https://dev.acquia.com/blog/explaining-varnish-beginners

If you want to help fix our bugs or want to know about bugs in the project:

https://scan.coverity.com/projects/varnish

.. _`Is My Varnish Working?`: http://www.ismyvarnishworking.com
.. _`The Design principle of Varnish`: http://book.varnish-software.com/4.0/chapters/Design_Principles.html
.. _`Tutorial at varnish-cache.org`: https://www.varnish-cache.org/docs/trunk/tutorial/
.. _`THE BIG VARNISH PICTURE`: https://www.varnish-cache.org/docs/4.1/users-guide/intro.html#users-intro
