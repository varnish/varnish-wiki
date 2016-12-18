.. _vcl_examples:

Cache invalidation with examples
================================

Here we will explain with examples how the different components of cache
invalidation work.

HTTP purge
----------

.. literalinclude:: /content/examples/vcl_purgeFromBackend.vcl
  :language: VCL


PURGE an article from the backend
.................................

.. literalinclude:: /content/examples/vcl_purgeFromBackend.vcl
  :language: VCL

Purge with restart
..................

This allows Varnish to re-run the VCL state machine with different variables.

.. literalinclude:: /content/examples/vcl_purgeWithRestart.vcl
  :language: VCL

Source: http://book.varnish-software.com/4.0/chapters/Cache_Invalidation.html?highlight=vcl_recv

Accessed: 17th August 2016

Softpurge
---------

- Reduces TTL to 0
- Allows Varnish to serve stale objects


.. literalinclude:: /content/examples/vclex_softPurge.vcl
  :language: VCL

source: https://github.com/varnish/varnish-modules/blob/master/docs/vmod_softpurge.rst

Accessed: 17th August 2016

Purge call
...........



Purge call to X-Headers
.......................


Banning
-------

Examples in the varnishadm command line interface:

.. code-block:: VCL

  ban req.url ~ /foo
  ban req.http.host ~ example.com && obj.http.content-type ~ text
  ban.list

Example in VCL:

.. code-block:: VCL

  ban("req.url ~ /foo");

Example of VCL code to act on HTTP BAN request method:

.. code-block:: VCL

  sub vcl_recv {
      if (req.method == "BAN") {
          ban("req.http.host == " + req.http.host +
              " && req.url == " + req.url);
          # Throw a synthetic page so the request won't go to the backend.
          return(synth(200, "Ban added"));
      }
  }

source: http://book.varnish-software.com/4.0/chapters/Cache_Invalidation.html

To inspect the current ban-list, issue the ban.list command in the CLI:

.. code-block:: VCL

  0xb75096d0 1318329475.377475    10      obj.http.x-url ~ test0
  0xb7509610 1318329470.785875    20C     obj.http.x-url ~ test1

Lurker-friendly bans
....................

The following snippet shows an example of how to preserve the context of a client request in the cached object:

.. code-block:: VCL

  sub vcl_backend_response {
     set beresp.http.x-url = bereq.url;
  }

  sub vcl_deliver {
     # The X-Url header is for internal use only
     unset resp.http.x-url;
  }

Now imagine that you just changed a blog post template that requires all blog
posts that have been cached. For this you can issue a ban such as:

.. code-block:: VCL

  $ varnishadm ban 'obj.http.x-url ~ ^/blog'

Since it uses a lurker-friendly ban expression, the ban inserted in the ban list
will be gradually evaluated against all cached objects until all blog posts are
invalidated. The snippet below shows how to insert the same expression into the
ban list in the vcl_recv subroutine:

.. code-block:: VCL

  sub vcl_recv {
     if (req.method == "BAN") {

     # Assumes the ``X-Ban`` header is a regex,
        # this might be a bit too simple.

        ban("obj.http.x-url ~ " + req.http.x-ban);
        return(synth(200, "Ban added"));
     }
  }


Purge and ban together example
..............................

.. code-block:: VCL

  sub vcl_recv {
    if (req.method == "PURGE") {
        return (purge);
    }

    if (req.method == "BAN") {
        ban("obj.http.x-url ~ " + req.http.x-ban-url +
            " && obj.http.x-host ~ " + req.http.x-ban-host);
        return (synth(200, "Ban added"));
    }

    if (req.method == "REFRESH") {
        set req.method = "GET";
        set req.hash_always_miss = true;
    }
  }

  sub vcl_backend_response {
    set beresp.http.x-url = bereq.url;
    set beresp.http.x-host = bereq.http.host;
  }

  sub vcl_deliver {
    # We remove resp.http.x-* HTTP header fields,
    # because the client does not neeed them
    unset resp.http.x-url;
    unset resp.http.x-host;
  }



Force cache miss
----------------

.. code-block:: VCL

  sub vc_recv {
    set req.hash_always_miss = true;
  }

Causes Varnish to look the object up in cache, but ignore any copy it finds
This is a useful way to do a controlled refresh of a specific object.
If the server is down, the cached object is left untouched.
Depending on the Varnish version, it might leave extra copies in the cache.
It is useful to refresh slowly generated content.

source: http://book.varnish-software.com/4.0/chapters/Appendix_G__Solutions.html#solution-write-a-vcl-program-using-purge-and-ban

Hashtwo
-------

The idea behind Hashtwo is that you can use any arbitrary string for cache invalidation.
You can then key your cached objects on, for example, product ID or article ID.
In this way, when you update the price of a certain product or a specific article,
you have a key to evict all those objects from the cache.

On Debian or Ubuntu:

.. code-block:: bash

  apt-get install libvmod-hashtwo

On Red Hat Enterprise Linux:

.. code-block:: bash

  yum install libvmod-hashtwo

Finally, you can use this VMOD by importing it into your VCL code:

.. code-block:: VCL

  import hashtwo;

VCL example code for hashtwo:

.. code-block:: VCL

  import hashtwo;

  sub vcl_recv {
    if (req.http.X-HashTwo-Purge) {
      if (hashtwo.purge(req.http.X-HashTwo-Purge) != 0) {
         return (purge);
      } else {
        return (synth(404, "Key not found"));
      }
    }
  }

Normally the backend is responsible for setting these headers.
If you were to do it in VCL, it would look something like this:

.. code-block:: VCL

  sub vcl_backend_response {
    set beresp.http.X-HashTwo = "secondary_hash_key";
  }

source: http://book.varnish-software.com/4.0/chapters/Cache_Invalidation.html
A complete Grace example
------------------------

.. literalinclude:: /content/examples/grace-v4.vcl
  :language: VCL

Source: https://info.varnish-software.com/blog/grace-varnish-4-stale-while-revalidate-semantics-varnish

Accessed: 17th August 2016

**ref to examples in vcl**

IDEA: https://info.varnish-software.com/blog/10-varnish-cache-mistakes-and-how-avoid-them
