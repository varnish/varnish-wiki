.. _vcl_examples:

Cache Invalidation with Examples
================================

Here we will explain with example how the different components of Cache
Invalidation works,

HTTP Purge
----------

.. literalinclude:: /content/examples/vcl_purgeFromBackend.vcl
  :language: c


PURGE an article from the Backend
.................................

.. literalinclude:: /content/examples/vcl_purgeFromBackend.vcl
  :language: c

Purge with Restart
..................

This allows Varnish to re-run the VCL state machine with different variables.

.. literalinclude:: /content/examples/vcl_purgeWithRestart.vcl
  :language: c

Source: http://book.varnish-software.com/4.0/chapters/Cache_Invalidation.html?highlight=vcl_recv

Collected: 17th August 2016

Softpurge
---------

- Reduces TTL to 0
- Allows varnish to serve stale objects


.. literalinclude:: /content/examples/vclex_softPurge.vcl
  :language: c

source: https://github.com/varnish/varnish-modules/blob/master/docs/vmod_softpurge.rst

Collected: 17th August 2016

Purge call
...........



Purge call to X-Headers
.......................


BANNING
-------

Lurker Friendly Bans
....................


Purge and Ban Together Example
..............................


FORCE CACHE MISS
----------------


HASHTWO
-------


A complete GRACE example
------------------------

Source: https://info.varnish-software.com/blog/grace-varnish-4-stale-while-revalidate-semantics-varnish

https://gist.github.com/perbu/93803707dbcdbc345da0


**ref to examples in vcl**

IDEA: https://info.varnish-software.com/blog/10-varnish-cache-mistakes-and-how-avoid-them

Collect vcl for this post!!!
