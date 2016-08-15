.. _sample_vcl:

Sample VCLs
***********

Configuring Varnish
===================

Backend Definition
..................

.. literalinclude:: /vcl/vcl_defaultSample_mattias.vcl
  :language: c
  :lines: 7-30

ACL Purge
.........

.. literalinclude:: /vcl/vcl_defaultSample_mattias.vcl
  :language: c
  :lines: 32-37

Normalizing header
..................

.. literalinclude:: /vcl/vcl_defaultSample_mattias.vcl
  :language: c
  :lines: 58,66-67,193

Removing Proxy header
.....................

.. literalinclude:: /vcl/vcl_defaultSample_mattias.vcl
  :language: c
  :lines: 58,69-70,193

Normalizing query arguments
...........................

.. literalinclude:: /vcl/vcl_defaultSample_mattias.vcl
  :language: c
  :lines: 58,72-73,193

Allowing Purging
................

.. literalinclude:: /vcl/vcl_defaultSample_mattias.vcl
  :language: c
  :lines: 58,75-83,193

Dealing with Selective Header Types
...................................

.. literalinclude:: /vcl/vcl_defaultSample_mattias.vcl
  :language: c
  :lines: 58,86-96,193

Implementing Web Socket Support Example
........................................

.. literalinclude:: /vcl/vcl_defaultSample_mattias.vcl
  :language: c
  :lines: 58, 98-101,193,195, 212-217

Sending traffic to vdir
.......................

When using external VMODs you need this.

.. literalinclude:: /vcl/vcl_defaultSample_mattias.vcl
  :language: c
  :lines: 58,64,193

URL Manipulation
----------------

Making sure the POST Requests are always Passed
...............................................

.. literalinclude:: /vcl/vcl_defaultSample_mattias.vcl
  :language: c
  :lines: 58,103-106,193

Removing Google Analytics added parameters
..........................................

.. literalinclude:: /vcl/vcl_defaultSample_mattias.vcl
  :language: c
  :lines: 58,110-115,193

Example of Stripping from URL
.............................

The example below strips ``#`` from URL, because server has no use for it.

.. literalinclude:: /vcl/vcl_defaultSample_mattias.vcl
  :language: c
  :lines: 58,117-120,193

The example below strips trailing ``?`` from URL.

.. literalinclude:: /vcl/vcl_defaultSample_mattias.vcl
  :language: c
  :lines: 58,122-125,193

Cookie Manipulation
-------------------

Removing Google Analytic cookies
................................

.. literalinclude:: /vcl/vcl_defaultSample_mattias.vcl
  :language: c
  :lines: 58,131-137,193

Removing DoubleClick Offensive Cookies
......................................

These cookies are used to improve advertising. Basically doubleClick avoids a
user from seeing the same advertise twice. It sends a cookie when a user clicks
on a ad. These cookies are not relevant for caching.

.. literalinclude:: /vcl/vcl_defaultSample_mattias.vcl
  :language: c
  :lines: 58,139-140,193

Removing Quant Capital cookies
..............................

.. literalinclude:: /vcl/vcl_defaultSample_mattias.vcl
  :language: c
  :lines: 58,142-143,193

Removing ADDThis cookies
........................

.. literalinclude:: /vcl/vcl_defaultSample_mattias.vcl
  :language: c
  :lines: 58,145-146,193

Removing ';' prefix from cookies
................................

.. literalinclude:: /vcl/vcl_defaultSample_mattias.vcl
  :language: c
  :lines: 58,148-149,193

Checking for empty or spaced cookies
....................................

.. literalinclude:: /vcl/vcl_defaultSample_mattias.vcl
  :language: c
  :lines: 58,151-165,193


Turn On Varnish Support for Streaming
.....................................

.. literalinclude:: /vcl/vcl_defaultSample_mattias.vcl
  :language: c
  :lines: 58,167-173,193

Removing Cookies for Static Files
.................................

.. literalinclude:: /vcl/vcl_defaultSample_mattias.vcl
  :language: c
  :lines: 58,175-182,193

ESI Support
-----------

.. literalinclude:: /vcl/vcl_defaultSample_mattias.vcl
  :language: c
  :lines: 58,184-190,193

Hashing cookies
---------------

.. literalinclude:: /vcl/vcl_defaultSample_mattias.vcl
  :language: c
  :lines: 228,240-244

Serving Queued Requests with Grace
..................................

.. literalinclude:: /vcl/vcl_defaultSample_mattias.vcl
  :language: c
  :lines: 246, 254-256, 264-287

Passing Real IP to backend
--------------------------

.. code-block:: c

  sub vcl_recv {
      if (req.restarts == 0) {
          if (req.http.X-Forwarded-For) {
             set req.http.X-Forwarded-For = req.http.X-Forwarded-For + ", " + client.ip;
         } else {
          set req.http.X-Forwarded-For = client.ip;
         }
      }
  }


Handling Request from backend
=============================
 ** in prgoress**
