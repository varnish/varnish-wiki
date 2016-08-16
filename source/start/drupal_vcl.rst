.. _drupal_vcl:

Some Sample VCL for Drupal 7 and 8
==================================

Varnish Frontend Config
-----------------------

Backend Definition
..................

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 64-74,63


Access Control Lists (ACL)
..........................

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 78-88,77

Check for Varnish Special Requests
..................................

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 136,124,141-147,414

Purging
.......

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 124,148-156,414

Ban logic
.........

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 124,157-175,414

Custom Client redirection
.........................

Call subroutine, call ``perm_redirections_recv``


Add Proxy IPs manually in the exclude list from Client Ip
..........................................................

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 124,195-209,414

Websocket Support
.................

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 124,243-247,414

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 421-427

Access control for some URLs by ACL
...................................

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 124,251-260,414

Custom URL exceptions
.....................

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 124,262-280,414

Streaming
.........

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 124,282-289,414

Grace
.....

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 124,291-298,414

Compression
...........

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 124,301-313,414

Request manipulation
....................

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 124,317-325,414

Stripping Anchors
.................

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 124,326-329,414

Stripping Trailing `?` if they exist
....................................

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 124,330-,414

Normalizing Query String arguments
..................................

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 124,333,334,414

Removing cookies
................

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 124,338-378,414

Session and Special cookies
...........................

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 124,380-391,414

ESI support
...........

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 124,399-402,414

ByPassing Cache for Debug purposes
..................................

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 124,405-408,414

Bypassing Builtin logic
.......................

**Warning: NOT RECOMMENDED**

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 124,413,414

This returns unconditionally. Use this only if you are confident and have tested
your default.vcl

PIPE mode
.........

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 428-435

Hash Cookie Data
................

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 455-458

Hashing Custom headers
......................

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 462-466

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 467-473

Serving State Object
....................

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 498,503-528

Ban Lurker Friendly-ban support
...............................

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 541,543-545

Purge Head Cleanup
..................

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 541,548-549,621

Debugging Headers
.................

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 541,552-576,621

Restarting counter
..................

When the backend has a problem and a restart is issued, it is recorded for
debugging purposes.

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 541,548-549,621

Setting Varnish Server Hostname
...............................

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 541,586-596,621


Vary Header Manipulation
........................

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 541,602-606,621

Faking Server Headers
.....................

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 541,611-617,621

Dealing with Failed Request
...........................

When there is a falure or error in request, vcl_synth is called to deliver a
synthetic object to the client. Set common headers for synthetic responses.
We can add some configuration here such as restarting request, loading synthetic
response from disk, redirecting to different page etc.

Restarting Request:

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 633,639-645,699

Load synthetic responses from disk:

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 633,655-662,699

Redirection:

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 633,674-676,699


Varnish Backend fetch
---------------------

Lurker-Friendly Support
.......................

.. literalinclude:: /vcl/vcl_defaultDrupal_niteman.vcl
  :language: c
  :lines: 714,715-718,860

**Incomplete**


















Source: https://github.com/NITEMAN/varnish-bites/blob/master/varnish4/drupal-base.vcl
Collected: 16th August 2016
