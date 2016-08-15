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


GRACE
-----




**ref to examples in vcl**



.. toctree::
  :hidden:

  /vcl/index
