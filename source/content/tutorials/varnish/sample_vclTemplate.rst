.. _sample_vclTemplate:

Sample VCLs
===========

Based on the fantastic work of Mattias Geniar: https://github.com/mattiasgeniar/varnish-4.0-configuration-templates/

Configuring Varnish
-------------------

ACL purge
.........

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :language: VCL
  :lines: 32-37

Backend definition
..................

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :language: VCL
  :lines: 7-30

Normalizing header
..................

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :language: VCL
  :lines: 58,66-67,193

Removing proxy header
.....................

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :language: VCL
  :lines: 58,69-70,193

Normalizing query arguments
...........................

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :language: VCL
  :lines: 58,72-73,193

Allowing purging
................

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :language: VCL
  :lines: 58,75-83,193

Dealing with selective header types
...................................

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 58,86-96,193

Implementing web socket support example
........................................

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 58, 98-101,193,195, 212-217

Sending traffic to vdir
.......................

When using external VMODs you need this.

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 58,64,193

URL manipulation
----------------

Making sure the POST requests are always passed
...............................................

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 58,103-106,193

Removing Google Analytics added parameters
..........................................

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 58,110-115,193

Example of stripping from URL
.............................

The example below strips ``#`` from URL, because server has no use for it.

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 58,117-120,193

The example below strips trailing ``?`` from URL.

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 58,122-125,193

Cookie manipulation
-------------------

Removing Google Analytics cookies
.................................

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 58,131-137,193

Removing doubleClick offensive cookies
......................................

These cookies are used to improve advertising. Basically doubleClick ensures that
users do not see the same advertisement twice. It sends a cookie when a user clicks
on a ad. These cookies are not relevant for caching.

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 58,139-140,193

Removing Quant Capital cookies
..............................

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 58,142-143,193

Removing ADDThis cookies
........................

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 58,145-146,193

Removing ';' prefix from cookies
................................

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 58,148-149,193

Checking for empty or spaced cookies
....................................

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 58,151-165,193


Turn on Varnish support for streaming
.....................................

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 58,167-173,193

Removing cookies for static files
.................................

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 58,175-182,193

ESI support
-----------

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 58,184-190,193

Hashing cookies
---------------

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 228,240-244

Serving queued requests with Grace
..................................

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 246, 254-256, 264-287

Passing real IP to backend
--------------------------

.. code-block:: VCL

  sub vcl_recv {
      if (req.restarts == 0) {
          if (req.http.X-Forwarded-For) {
             set req.http.X-Forwarded-For = req.http.X-Forwarded-For + ", " + client.ip;
         } else {
          set req.http.X-Forwarded-For = client.ip;
         }
      }
  }


Handling request from backend
-----------------------------

How Varnish handles the HTTP request coming from our backends relies on the VCL
we write in our backend subroutines.

The vcl_backend_response subroutine is called after the response headers are
successfully retrieved from the backend.

Pausing ESI request
...................

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 298,301-305,348-349


Enabling cache for static files
...............................

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 298,310-312,349,348-349

Streaming
.........

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 298,316-320,348-349

Redirecting
...........

Sometimes, a 301 or 302 redirect formed via Apache's mod_rewrite can mess with the HTTP port that is being passed along.
This often happens with simple rewrite rules in a scenario where Varnish runs on :80 and Apache on :8080 on the same box.
A redirect can then often redirect the end-user to a URL on :8080, where it should be :80.
This may need fine-tuning on your setup.

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 298,327-330,348-349

Setting cache for static files if unset
.......................................

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 298,332-337,348-349

Example of excluding from cache
...............................

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 298,339-342,348-349

Setting Grace mode
..................

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 298,344-346,349


Adding debug headers
....................

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 353,356-360,378-379

Handling HTTP purge
...................

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 381-388


vcl_synth
.........

.. literalinclude:: /content/templates/vcl_defaultSample_mattias.vcl
  :lines: 390-406
