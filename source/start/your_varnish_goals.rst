.. _your_varnish_goals:

What do you want to achieve with Varnish?
=========================================

Once Varnish is up and running, there is quite a lot of things that you can do.
The three most common features that Varnish is known for are caching, cache
invalidations and load balancing. There are a lot of other services that varnish
provides to enhance this experience for the clients and the service providers.

This section of our wiki is all about;

- The performance of your Varnish server,
- Fine tuning the performance of your website using Varnish
- Compressing your web content

You can read more in details about them on the `varnish-cache.org`_ site.

.. _achieve_high_hitrate:

Achieving a High Hit rate!
--------------------------
 To understand your varnish setup better and be able to deal wit it, there are
 quite a few tools varnish provides.

`varnishtop`_
.............

This tool reads the shared memory logs and continuously presents an updated list
of commonly occurring entries. This can help you identify requested documents,
clients, URLs, user agents etc whatever requests are hitting the backend the most.

To see the top requests sent to the backend use:

.. code-block:: c

  varnishtop -i BereqURL


To see which URLs the client is requesting:

.. code-block:: c

  varnishtop -i ReqURL


To see the most popular Accept-encoding header the client is sending:

.. code-block:: c

  varnishtop -I ReqHeader:Accept-Encoding


`varnishlog`_
..............

This tool can help you have an inside look at the  requests. The way the varnish
log works is amazing. It is designed to store its logs in a shared memory segment
called Varnish Shared Log (VSL). this memory sement size is fixed, so once the
segment is full, data is over written. So if you really want certain logs to be
stored you need to tell another program to that for you. If you forget to do that,
your data might get over written.

This has its advantage as it saves memory and only saves logs that you require.

Using the command, `varnishlog` gives raw logs.

To see running processes type:

.. code-block:: c

    varnishlog -g raw

It shows Varnish master process checking up on the caching process.

Go here to understand `Varnishlog in Human Language`_ .
Here is the source code for `vsltrans`_


HTTP Request
............

There are lots of tools out there that can execute HTTP requests and returns very
informative information. Some of the tools are GET, Seige, HTTPie,

Varnish only cares about the headers. A request sent like the one following will
return header information. Remember Varnish doesnot yet support HTTPS.

To see header information of a site try:

.. code-block:: bash

    http -i http://yourvarnishsite.com/

This will return information on the http header being passed.

To check whether a site sets cookies for a specific URL try:

.. code-block:: bash

    GET -Used http://yourvarnishsite.com/ | grep ^Set-Cookie


Managing your Cookies!
----------------------

As you have already seen above with each HTTP request there is a bunch of cookies
i.e. headers carrying meta data. One of the things varnish has to do is check these
headers to identify its appropriateness for caching. If you read about the
`ROLE of HTTP Headers` on the varnish cache site, then you probably have read,
"Please not that when Varnish considers these headers varnish actually considers
itself part of the actual webserver.

So the most important cookies that you should have a look at;

Cookies from the Client
........................

A piece of code like the one following will dis-regard cookies from login pages:

.. literalinclude:: /content/examples/vclex_excludeclient_cookies.vcl
  :language: c

-  Disregarding graphical files

This code is an example of how to disregard all cookies related to css files such
stylesheets and graphics.

.. literalinclude:: /content/examples/vclex_excludecss.vcl
  :language: c

Another great example of using Regualar expressions to check your cookies:

.. literalinclude:: /content/examples/vclex_somecookies.vcl

Cookies from the Backend
........................

if you have set a cookie using 'Set-Cookie' header as shown in the previous example,
Varnish will not cache the page when using the default configuration. Instead it
will create object, a `hit-for-pass` object.

In such a case if the backend server ends up caching un-necessary cookies, just
unset the Set-Cookie header as shown in example below.

.. code-block:: c

  vcl_recv {
    ...
    unset req.http.Set-Cookie
  }


The Age Header
..............

To understand how long an object can be kept in varnish-cache, there is an Age
header which is set through the default.vcl file and the value can be viewed by
collecting the Age header from the request header as shown below:

.. code-block:: c

  varnishlog -I ReqHrader:^Age

Pragma
......

Some web applications require request directives on how to process its input.
An example could be that the server sent a header such as `Pragma: nocache`,
then varnish will ignore this header. To support this header, a vcl snippet like
the one below could be added  to the vcl_backend_response o add support for that
header in the th VCL:

.. code-block:: python

  if (beresp.http.Pragma ~ "nocache") {
      set beresp.uncacheable = true;
      set beresp.ttl = 120s; # how long not to cache this url.
  }

Over-riding the TTL
....................

You will find there are multiple variables available in the `vcl_backend_response`.
The one we are concerned about here is the `beresp.ttl` which defines how long the
object is kept in cache. This `vcl_backened_fetch` function is the backend connection
to the varnish's frond end through the subroutine `vcl_recv`.

When a request is passed with `pass` from vcl_recv, the object doesnot go to
the backend without typically being altered by the `vcl_backened_fetch`. If this
subroutine

even if a cache time is defined, but the `vcl_backened_response`
logic is still executed.

So if you read the VCL Basics chapter in the `Varnish Book`_ you will learn that
if the request was not passed before reaching the `vcl_backend_response`, the
`beresp.ttl` is still used even when you perform a hit_for_pass in
`vcl_backend_response`. When you perform a pass in vcl_fetch you cache the decision
you made. In other words: If beresp.ttl is set to 7 days as shown in the example
and you issue a pass, the object will be recorded into the cache and remain there
for 5 days, telling Varnish not to cache.

Therefore sometimes overriding the default ttl value can really help resolve
backened problems.

A simple example would be to directly set the beresp.ttl in vcl_backend_response
to a sensible value.

.. code-block:: bash

  sub vcl_backend_response {
            set beresp.ttl = 7 d; # 7 days
  }


The example below shows the beresp-ttl value set to 5days, that means the url
will be stored in cache for 7days and varnish will not cache it for 7 days.

.. code-block:: c

  sub vcl_backend_response {
        if (bereq.url ~ "^/legacy_broken_cms/") {
            set beresp.ttl = 7 d;
        }
  }


HTTP Vary
---------

The HTTP Vary header is the most insane and not understood header on the internet.
But this header, HTTP vary is used for caching, so in order to cache it is advised
to understand this. It is also capable of doing many other wonderful things.

**Warning**

Varnish does not necessarily understand the semantics of a header, or
what part triggers different variants of a response. In other words, an
inappropriate use of Vary might create a very large number of cached objects,
and reduce the efficiency of your cache server. Therefore, you must be extremely
cautious when using Vary.

In varnish the vary response header can used to store responses that are based
on the value of cookies.

Refer to `Header Field Definitions, section 14.44 to understand Vary` better.

As you may already know, the URL can be used as a parameter by varnish for caching
purposes. Also it is possible to add custom header values to hash in the `vcl_hash`
subroutine. So in this context if you want your cache to be based on headers, you
can set the Vary header to various types; cookies, Accept-Encoding, X-Varnish, User-Agent,
Accept-Language etc.

This way, different values of your custom header will have different hash values
for each cached resource. But remember that, variations containing the vary response
header share the same hash value.

An example would be when servers issue a `Vary: Accept-Encoding` (it is the most
common usage of Vary) it tells Varnish that it needs to cache a separate version
for every different Accept-Encoding that is coming from the different clients.

This could lower your servers performance but it enhances user experience.

But this could also lead to varnish caching a whole bunch of different types of
headers and reduce efficiency and performance as a whole. Normalizing the
accept-encoding header ensures this problem is solved by storing as less variants
as possible.

The following VCL code shows how to normalize the Accept-Encoding headers:

.. literalinclude:: /content/examples/vclex_normalize_AcceptEncoding.vcl
  :language: c

Another example to normalize `Accept-Language` header:

.. literalinclude:: /content/examples/vclex_normalize_AcceptLanguage.vcl
  :language: c

One of the best ways to take advantage of vary would be to build the response
header based on cached and non-cached objects. This brings us to the next topic,
Compression!

Note: Some application servers send vary with User-Agent. This as you can tell,
orders varnish to cache a separate copy for every variant client/user-Agent there
is. This could be a disaster depending on the number of variation of cients you
serve on a reqular basis.


Compression!
------------

Does varnish Compress objects? As of varnish 4.0 the default is set to compression
"ON". You can always turn it off. Have a look at the `Reference Guide`_


The Default Compression Behaviour
.................................

Compression is on when you see:

The `http_gzip_support = on`
And beresp.do_gzip and beresp.do_gunzip are NOT used in VCL.

*Unless* while returning from `vcl_recv` with `pipe` or `pass`, Varnish modifies
`req-http-Encoding` that is say, the `req.http.Accept-Encoding` is set to "gzip"
that means this client supports compressed content.

*Also note* that if `http_gzip_support` parameter is set to `off`, Varnish will
not alter any headers and if there is a `Vary: Accept-Encoding` set it will deal
with it normally just as explained under HTTP_Vary.


Compressing Contents if backends Don't
......................................

If the backend is not compressing contents, you can tell Varnish to compress the
content before storing it in cache by appending `beresp.do_gzip = true` in the
`vcl_backend_response` as shown below.

.. literalinclude:: /content/examples/vclex_compressContent.vcl
  :language: c

This code will make the following changes to the object header before inserting
in cache;

- set `object.http.Content-Encoding` to `gzip`
- add `Accept-Encoding` to `obj.http.Vary`
- Weaken `Etag`

Note: Don't try to compress contents that are uncompressable.


Uncompressing Content before sending to Cache
.............................................

To uncompress contents before entering cache, you can tell Varnish to uncompress
the content before sending it into cache by appending `beresp.do_gunzip = true`
in the `vcl_backend_response` as shown below.

.. literalinclude:: /content/examples/vclex_unCompressContent.vcl
  :language: c

This makes the following changes to the object header before inserting in cache;

- removes `obj.http.Content-Encoding`
- weaken any Etag (by prepending "W/")

GZIP and ESI
............

If you intend to or are using Edge Side Includes (ESI) you must be aware that ESI
and GZIP work together very well. Varnish will do the decompression of content
for you and recompress it for efficient storage and delivery.

You can read more about `GZIP+ESI`_ with Varnish on the varnish-cache site.

A FAQ on Compression: https://varnish-cache.org/docs/2.1/faq/http.html


Purging and Banning!
--------------------

One of the most widely used methods of increasing hit-ratio (which is metioned
many times on this website) is by increasing the time-to-live (ttl) of the object.

But as you know, in this era surving outdated content aka stale data is like
serving rotten food that no one will eat.

The solution to this problem is by having a mechanism that will notify varnish
whenever there is fresh-content. There are three mechanisms to achieve this;

- HTTP Purging
- BANS
- Forcing a cache-miss

HTTP Purging
............

A HTTP Purge is very much like a HTTP request except it does something dfferent.

Purging is when an object is requested from cache and then it is discarded. that
means everytime there is fresh data for an object, that object is requested and
`purged`. The simplest way to achieve this is by using the code given below:

.. literalinclude:: /content/examples/vcl_purgeFromBackend.vcl
  :language: c


Bans
....

Bans can be implemented for objects that are known to frequently change.
In such a case, certain contents are banned to be retrieved from the cache based
on the meta data. The ban is quite a reliable method, as it only works for objects
in the cache but doesnot interfere with new content being cached or served.

Support for bans is built-in to varnish and it is available from the CLI.

For example to ban every jpeg and png object from baching, you can try the
following example;

.. literalinclude:: /content/examples/vclex_banningImages.vcl

Another example of a BAN:

.. literalinclude:: /content/examples/vclex_banningURL.vcl


Forcing a Cache Miss
....................

This mechanism is similar to flushing the entire cache, as in it follows the
procedure that when an object is not found in the cache it is served from the
backened. But it also very much like Bans. However cache miss is more reliable as
it this is forced and very much like refreshing a page. This method refreshes an
object by forcing a cache miss for a request. Thus enabling a force fetch from the
backend and overriding the current one. But the old object does remain in the cache
until its ttl expires. The above mentioned methods have their subroutines pre-written
in the ``/etc/varnish/default.vcl`` i.e.`req.hash_always_miss` in `vcl_recv` and
can be configured and used as required.


Per Object Cache Invalidation
-----------------------------

Per object cache invalidation is something you want to use if you want to specify
individual objects for caching. This requires a great understanding of objects
and cache invalidation.

Say for example, If you want to invalidate selected objects but, you can determine
which objects viewers have requested and invalidate only those objects.


Flushing the Entire Cache
-------------------------

One of the ways maybe people prefer to do cache invalidation is by flushing the
entire cache thus forcing varnish to fetch from the backend. Which helps in re-filling
the cache with fresh contents. This could be scripted to take place several times
an hour based on the amount of changes made on the website. Keeping that in mind,
if a huge amount of change is made in a short time, this mechanism could slow down
the response rate as varnish will be visiting the backend more often.

This is obviously not a recommended method for everyday use. But flushing the whole
cache sometimes wouldn't hurt.

Varnishtest
...........

Last but not the least, use varnishtest to test your policies
before running them in production. Use the `vtctrans`_ if you need help reading the
verbose output.

Useful links on this topic
--------------------------

`Varnish Tips and Tricks`_
.. _`Varnishlog in Human Language`: http://vsltrans.varnish.jp/
.. _`vsltrans`: https://github.com/xcir/vsltrans
.. _`Varnish Tips and Tricks`: https://ffwagency.com/blog/varnish-tips-and-tricks
.. _`Reference Guide`: https://www.varnish-cache.org/docs/4.1/reference/varnishd.html#varnishd-1
.. _`varnish-cache.org`: https://www.varnish-cache.org/docs/4.1/users-guide/performance.html#users-performance
.. _`varnishtop`: https://www.varnish-cache.org/docs/4.1/reference/varnishtop.html#varnishtop-1
.. _`varnishlog`: https://www.varnish-cache.org/docs/4.1/reference/varnishlog.html#varnishlog-1
.. _`Varnish Book`: https://book.varnish-software.com
.. _`Header Field Definitions, section 14.44 to understand Vary`: https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html
.. _`GZIP+ESI`: https://www.varnish-cache.org/docs/trunk/phk/gzip.html#phk-gzip
.. _`vtctrans`: https://github.com/xcir/vtctrans
