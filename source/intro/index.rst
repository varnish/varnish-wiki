What is Varnish?
================

The basics
----------

Varnish Cache is a web application accelerator also known as a caching
HTTP reverse proxy. You install it in front of any server that speaks
HTTP and configure it to cache the contents. Varnish Cache is really,
really fast. It typically speeds up delivery with a factor of 300 -
1000x, depending on your architecture. A high level overview of what
Varnish does can be seen in `this video <https://www.youtube.com/watch?v=fGD14ChpcL4>`_.


Flexibility
-----------

One of the key features of Varnish Cache, in addition to its
performance, is the flexibility of its configuration language, VCL.
VCL enables you to write policies on how incoming requests should be
handled. In such a policy you can decide what content you want to serve,
from where you want to get the content and how the request or response
should be altered. And, you can `extend Varnish with modules
(VMODs) <https://www.varnish-cache.org/vmods>`_. You can read more
about this in our
`tutorial <https://www.varnish-cache.org/docs/trunk/tutorial/>`_.



When to Use Varnish?
====================

If youa re wondering why you are on our website reading about our product,
you are in the right section!

So you are getting Varnish for your website and wondering why?

Most probably because you need to handle a lot of traffic!
Caching is one of the best ways to maximize the output of your website!

The main idea behind making your website flying is to reduce the workload of your
webserver and it's network. Your frontend shouldn't have to make requests to the
backend too often for the same dynamic content every time a client requests it.

To save your resources placing a reverse-proxy, caching software like Varnish Cache
right in front of your web application can accelerate the responses to allmost all
your HTTP requests and thus reducing server workload.

Congratulations! you are making a great choice!

Because Varnish does exactly that! and more!
Varnish works by managing client requests BEFORE they make it to your web
application server. Varnish not only reduces your webserver load but also has
other security services to make your webservers secure.
