.. _faq:

Varnish Web Developer's FAQ
===========================

**What is Varnish?**

Varnish Cache is a web application accelerator also known as a caching
HTTP reverse proxy. You install it in front of any HTTP server and
configure it to cache the contents. Varnish Cache is really,really fast.
It typically speeds up delivery with a factor of 300 - 1000x, depending
on your architecture. A high level overview of what Varnish does can be
seen in `this video <https://www.youtube.com/watch?v=fGD14ChpcL4>`_.

You can read a general overview of `The Big Varnish Picture`_ in the
official Varnish documentation! :)

**What is Varnish's superpower?**

Highly Flexible !!

One of the key features of Varnish Cache, in addition to its
performance, is the flexibility of its configuration language, VCL.
VCL enables you to write policies on how incoming requests should be
handled. In such a policy you can decide what content you want to serve,
from where you want to fetch said content and whether and how the request
or response should be altered. You can `extend Varnish's VCL with modules
(VMODs) <https://www.varnish-cache.org/vmods>`_. You can read more
about this in the official documentation `tutorial at varnish-cache.org`_.

Varnish is designed with security, performance and flexibility in mind.
For an in-depth look at this you can read `The Design Principle of Varnish`_
chapter in the Varnish Book.

**Should I use Varnish for my site?**

If you are wondering why you are on our website reading about our product,
you are in the right section. We'll help you answer the why Varnish question.

Most probably you need to handle a lot of traffic. For that caching is one
of the best ways to maximize the output of your website!

The main idea behind making your website fly is to reduce the workload of
your web infrastructure: webserver, database, application; and to optimally
use your network capacity. Basically: Your frontend shouldn't have to make
requests to the backend too often for the same dynamic content every time
a client requests it.

To save your resources placing a reverse-proxy, caching software such as
Varnish Cache right in front of your web application can accelerate the
responses to almost all your HTTP requests and thus reduce server workload.

So congratulations! You are making a great choice because Varnish does
exactly that. And more! Varnish works by managing client requests BEFORE they
make it to your web application server. Varnish not only reduces your
webserver load but by being fast it offers DDoS protection to your webservers,
making them more resilient and secure.

There is a good article describing `Varnish Cache on
Wikipedia <http://en.wikipedia.org/wiki/Varnish_(software)>`_.


.. _varnish_memcache:

**What is the relation between Varnish and Memcache?**

Memcache is a Key Value store, more or less a rather simple database. It doesn't
persist data and only stores it in memory. It also doesn't really care if it
throws data out. The natural use for Memcache is to cache things internally
in your application or between your application and your database. Memcache
uses its own specific protocol to store and fetch content.

Varnish on the other hand stores rendered pages. It talks HTTP so it will
typically talk directly to a HTTP client and deliver pages from it's cache
whenever said page is stored in the cache, what is commonly called a a cache hit.
When an object, any kind of content i.e. an image or a page, is not stored in the
cache, then we have what is commonly known as a a cache miss, in which case Varnish
will go and fetch the content from the web server, store it and deliver a copy to
the user.

These are two pretty different pieces of software. The end goal of both pieces
of software is the same, though and most sites would likely use both technologies
in order to speed up delivery. They will deploy Varnish to speed up delivery of its
cache hits, and when you have a cache miss the application server might have access
to some data in Memcache, which will be available to the application faster than what the
database is capable of delivering.

The performance characteristics are pretty different. Varnish will start
delivering a cache hit in a matter of microseconds whereas a PHP page that gets
rendered content from Memcache will likely spend somewhere around 15-30 milliseconds
doing so. The reason Varnish can do it faster is that Varnish has it's content in
local memory whereas the PHP script needs to get on the network and fetch the
content over a TCP connection. In addition, you'll have the overhead costs of the
interpreter. It's not only that Varnish is better, it's just that Varnish has a much
easier job to do and it is faster because of it.

There are no good reason not to use both.

**What is the difference in caching architecture between Varnish and Squid?**

The most fundamental difference between Squid and Varnish is that Squid is a
forward proxy that can be a configured as a reverse proxy whereas Varnish is built
from the ground up to be a reverse proxy.

So, in principle Varnish is better suited than Squid to do reverse proxy HTTP.
However, Squid is a very mature product and has had time to accumulate a lot of
features that still are not available in Varnish. Both projects are used by huge
websites and both of them can do almost anything.

The main advantages of Squid over Varnish, as I see them, are:

- Built in TLS/SSL support. Varnish needs hitch, nginx or stunnel to do TLS.
- Better support for Range and streaming delivery of objects.
- Support for antivirus-plugins

On the other hand, Varnish has:

- VCL, an absolutely amazing configuration system. VCL gives unmatched flexibility to run policies. Want to rewrite URLs coming from a certain user-agent requesting a specific URL coming from a specific network? Easy. With Squid, that configuration will be quite complex (if at all possible).
- Better performance and scalability. Squid is a single process running on only one CPU core, whereas Varnish is threaded. A single Varnish server is reported to serving 60K req/sec on real life traffic. Squid has never been reported to push those kind of numbers.
- Better and more flexible invalidation support. With Varnish you can invalidate content from cache based on more or less everything. Literally.
- VMODs, Varnish modules which can easily extend Varnish's VCL capabilities and add new features. Such modules can be written in a matter of hours. Which makes VCL very powerful.

**What is the difference between Caching and Memoization?**

Memoization is a way of caching results of a function to avoid recalculating the
the next time the same function is called. The technique is that the function is executed, the result gets added to an
object holding the calculated results. When the function is called again, the
result object is checked to see if it contains the result.

Caching on the other hand, is about storing reusable web traffic responses in
order to make subsequent requests faster.

More Reading ...
................

In this wiki you can find other resources. Read on about :ref:`Understand your Website <website_arch>`

External resources that might be useful:

- `Is My Varnish Working?`_
- This varnish checking website is hosted by `Acquia`_

If you want to help fix our bugs or want to know about bugs in the project check:

- https://scan.coverity.com/projects/varnish

.. _`Is My Varnish Working?`: http://www.ismyvarnishworking.com
.. _`The Design principle of Varnish`: http://book.varnish-software.com/4.0/chapters/Design_Principles.html
.. _`Tutorial at varnish-cache.org`: https://www.varnish-cache.org/docs/trunk/tutorial/
.. _`The Big Varnish Picture`: https://www.varnish-cache.org/docs/4.1/users-guide/intro.html#users-intro
.. _`Acquia`: https://dev.acquia.com/blog/explaining-varnish-beginners
