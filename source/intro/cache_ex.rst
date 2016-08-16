.. _cache_ex:


Cache Invalidation with Examples
================================

Here we will explain with example how the different components of Cache
Invalidation works,

---------------------
Connect to Varnishadm
---------------------


HTTP Purge
----------

PURGE an article from the Backend
.................................

.. literalinclude:: /vcl/vcl_purgeFromBackend.vcl
  :language: c


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

.. toctree::
  :hidden:

  /vcl/index
