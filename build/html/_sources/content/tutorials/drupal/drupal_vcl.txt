.. _drupal_vcl:

Some Sample VCL for Drupal 7 and 8
==================================


Access Control Lists (ACL)
..........................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 78-88,77

Backend Definition
..................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 63-74

Check for Varnish Special Requests
..................................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 136,124,141-147,414

Purging
.......

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 124,148-156,414

Ban logic
.........

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 124,157-175,414

Custom Client redirection
.........................

Call subroutine, call ``perm_redirections_recv``


Add Proxy IPs manually in the exclude list from Client Ip
..........................................................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 124,195-209,414

Websocket Support
.................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 124,243-247,414

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 421-427

Access control for some URLs by ACL
...................................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 124,251-260,414

Custom URL exceptions
.....................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 124,262-280,414

Streaming
.........

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 124,282-289,414

Grace
.....

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 124,291-298,414

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 714,748-750,860

Compression
...........

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 124,301-313,414

Request manipulation
....................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 124,317-325,414

Stripping Anchors
.................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 124,326-329,414

Stripping Trailing `?` if they exist
....................................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 124,330-332,414

Normalizing Query String arguments
..................................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 124,334,335,414

Removing cookies
................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 124,338-378,414

Session and Special cookies
...........................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 124,380-391,414

ESI support
...........

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 124,399-402,414

ByPassing Cache for Debug purposes
..................................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 124,405-408,414

Bypassing Builtin logic
.......................

**Warning: NOT RECOMMENDED**

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 124,413,414

This returns unconditionally. Use this only if you are confident and have tested
your default.vcl

PIPE mode
.........

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 428-435

Hash Cookie Data
................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 455-458

Hashing Custom headers
......................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 462-466

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 467-473

Serving State Object
....................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 498,503-528

Ban Lurker Friendly-ban support
...............................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 541,543-545,621

Purge Head Cleanup
..................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 541,548-549,621

Debugging Headers
.................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 541,552-576,621

Restarting counter
..................

When the backend has a problem and a restart is issued, it is recorded for
debugging purposes.

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 541,548-549,621

Setting Varnish Server Hostname
...............................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 541,586-596,621


Vary Header Manipulation
........................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 541,602-606,621

Faking Server Headers
.....................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 541,611-617,621

Dealing with Failed Request
...........................

When there is a falure or error in request, vcl_synth is called to deliver a
synthetic object to the client. Set common headers for synthetic responses.
We can add some configuration here such as restarting request, loading synthetic
response from disk, redirecting to different page etc.

Restarting Request:

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 633,639-645,699

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 864,868-871,903

Load synthetic responses from disk:

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 633,655-662,699

Redirection:

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 633,674-676,699


Lurker-Friendly Support
.......................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 714,715-718,860


Caching Exceptions
..................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 714,721-737,860

Retrieving Request
..................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 714,740-745,860

Stripping Cookies from Static file types
........................................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 714,754-757,860

Processing ESI response
.......................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 714,765-770,860


GZIP response
.............

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 714,774-786,860

Drupal 8's Pipe Support
.......................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 714,788-794,860

Debugging header
................

.. literalinclude:: /content/templates/vcl_defaultDrupal_niteman.vcl
  :language: VCL
  :lines: 714,797-830,834-841,860,864,874-879,903


Source: https://github.com/NITEMAN/varnish-bites/blob/master/varnish4/drupal-base.vcl

Collected: 16th August 2016
