.. _http_caching:

Basic HTTP caching
==================

Understanding HTTP caching is a necessity because in today's world,
installing and configuring Varnish doesn't solve all your caching problems.
So this involves a little understanding of web caching in general.

Every web service has its own requirements as to what to cache and what not to cache.
Further down, you will find a checklist for Varnish caching.

As you get to know Varnish better you will see that as a web caching system Varnish
serves as a **proxy cache** as well as a **reverse proxy cache**.

Two main reasons why you might be considering using caching:
- To reduce network traffic load on servers
- To reduce response time to users (making your service look fast)

Caching terminology
--------------------

**Caching manager:** The integration resource that manages the caching
components.

**Origin server:** Where the *original* content lies. It serves as a
*backup* for the cache; that is, it serves content when the cache doesn't have the
relevant content and asks the origin server for the content.

**Cache hit ratio:** This is a measurement of the ratio of requests that were met
through the cache against the total number of requests.

So a *high cache hit ratio* means most of the content was fetched from the cache.
And a *cache miss* means the content could not be fetched from cache.

**Freshness of data:** Freshness of data is used to judge whether an object in
cache is still fresh enough to serve a client.

**Stale content:** Stale content is judged based on how old the data is. In
general all objects in cache have a time to live (TTL) value and once that expires,
it is stale content.

**Validation:** Validation is checking whether the *stale data* in the cache is
"fresh" in comparison with the origin server content. If it is the same, then
the TTL value of the stale or almost expired object is increased.

**Invalidation:** Invalidation of objects as the name suggests is just the opposite
of validating objects. It does the same check and deletes objects that are *stale*.

What is web caching?
--------------------

Caching on the web is based on the HTTP protocol. The goal of web caching is to
provide a balance between web traffic and web performance by caching relevant
data based on client demands.

**Common caching steps**

1. A request is sent with a header to the server.
2. The response’s header tells whether to cache or not.
3. If the request is authenticated or secure, it won’t be cached by shared caches.
4. An object is considered fresh if:
    - it has a TTL value that is valid OR
    - it is an object which is infrequently changed
5. If the object is stale:
    - the origin server will be asked to validate it OR
    - the origin server will have to inform cache whether the copy is fresh enough.
6. When the network is down, the cache can serve stale responses without checking
    with the origin server.

**Pros of caching**

Caching is found on almost every level of a packet's journey from one host to the
other. The best-known advantages of caching is high performance via the
use of proxy servers.

- A quality analysis of web access helps improves client demands and caching
- Caching offers significantly higher speed on the web
- Reduces overhead costs on servers and use of bandwidth
- Fast access to cached (most visited) resources, by faster reloads and delivery
- Proxy servers help improve protocol translation (different browsers and devices)

**Cons of caching**

Caching can lead to adverse consequences if not properly considered.

- Confusing and displaying wrong user information (very risky! e.g. subscription emails displaying all client emails)
- Delivering stale objects (e.g. old news even when there is an update in the database)
- Slow performance if object is not in cache
- Caching logs contain user-specific information (user privacy violated)

Therefore when making cache decisions please take all of your company policies into
consideration.


Defining cache-control policy
-----------------------------

To define an optimal cache-control policy, there are some things to consider.

Is the *response* from the server *reusable* ?

If it is *reusable*, can it be *revalidated* ?
If it is not *re-usable*, **do not store it!**

If it can be *revalidated*, **do not cache it!**
If it *cannot be revalidated*, can it be *cached by immediate caches* ?

If it can be *cached immediately*, it can either be *public info* or *user private private data*.

Decide which private and public info should be cached.
The next things to decide include:

- maximum cache lifetime
- maximum age
- Add Etag header

Cache-related headers
---------------------

HTTP has a whole list of headers dedicated to cache invalidation and page caching.
The ones that need the most attention are:
- Expires
- Cache-Control
- Etag
- Last-Modified
- If-Modified-Since
- If.None.Match
- Vary
- Age

.. csv-table:: **HTTP Header Availability**
   :name: cache_arg
   :delim: ,
   :header-rows: 1
   :widths: 40, 30, 30
   :file: ../tables/http_headers.csv

**Expires**

The syntax for this header is:

  Expires: GMT formatted date

- It sets a time for when the object will expire.
- After this time it is considered stale.
- Usually a timeframe of 1 year is enough.
- In this timeframe the resource can be updated.

**Cache-Control**

Example of a Cache-Control header:

  Cache-Control: public, must-revalidate, max-age=2592000

The Cache-Control header is where the caching policy is defined.
It is both a *request and a *response* header.
This policy specifies which responses go to cache and which are not based
on the conditions in its policy. It accepts a number of arguments
as listed below:

- **public:** response can be cached by any cache
- **No-store:** response must not be stored by any cache mechanism
- **No-cache:** response is authorized to be stored but may not be reused without validation
- **max-age:** time in seconds when the object in cache is fresh
- **s-maxage:** like *max-age* but only used in public caches
- **must-revalidate:** indicates that the object maybe stale and should be revalidated first

Below is a table from the Varnish Book showing the arguments used by the Cache-Control
header:

.. csv-table:: **Cache Control header Arguments**
   :name: cache_control
   :delim: ,
   :header-rows: 1
   :widths: 40, 30, 30
   :file: ../tables/cachecontrol_arg.csv

**Etag**

Example of an Etag header:

  Etag: "1edec-3e3073913b100"

The Etag response header provides the current value of the entity tag for the
requested variant. It provides a unique value for a resource's content.


**Last-Modified**

Example of a Last-Modified header:

  Last-Modified: Wed, 01 Sep 2004 13:24:52 GMT

This **response header** indicates the date and time at which the origin server believes the
variant was last modified.

used in conjunction with:
- If-Modified-Since
- If-None-Match

**If-Modified-Since**

Example of an If-Modified-Since header:

  If-Modified-Since: Wed, 01 Sep 2004 13:24:52 GMT

This **request header** is used with a method to make it conditional:

- **if** the requested variant has not been modified since the time specified in this field, an entity will not be returned from the server
- **instead**, a 304 (not modified) response will be returned without any message body.


**If-None-Match**

Example of an If-None-Match header:

  If-None-Match: "1edec-3e3073913b100"

The If-None-Match **request header** field is used with a method to make it
conditional. The purpose of this feature is to allow efficient updates of cached
information with a minimum amount of transaction overhead.


**Vary**

The Vary response header indicates the response returned by the origin server
- may vary depending on headers received in the request.
- The most common usage of vary is to use

    Vary: Accept-Encoding

    which tells the cache (Varnish included) that the content might look different
    depending on the accept-encoding-header the client sends.


**Age**

- A cache server can send an additional response header, Age, to indicate the age of the response.
- Varnish (and other caches) does this.
- Browsers (and Varnish) will use the Age header to determine how long to cache content.
- For example, for a max-age-based equation: cache duration = max-age - Age
- If you allow Varnish to cache for a long time, the age-header could effectively disallow client-side caches.


Cache hits and misses
.....................

**Cache hit**

There is a cache hit when Varnish returns a page from its cache instead of
forwarding the request to the origin server.

.. image:: ../image/httpcachehit.png
  :alt: Sphinx Neo-Hittite
  :align: center
  :width: 400px

**Cache miss**

There is a cache miss when Varnish has to forward the request to the origin
server so the page can be served.

.. image:: ../image/httpcachemiss.png
  :alt: Sphinx Neo-Hittite
  :align: center
  :width: 400px

Impact of cache-related headers on caching
------------------------------------------

How cache-related headers impact the caching policy.

**no-cache:**
Any cached content must be revalidated on each request before being served

**No-store**
This instruction indicates that the content cannot be cached in any way

**public**
Public marks content as public, which means that it can be cached by the browser and
any intermediate caches.

**private**
- This marks the content as private.
- Private content may be stored by the user's browser, but must not be cached
by any intermediate parties. Only used for specific data.

**max-age**
Sets the maximum age at which the content may be cached before it
must be revalidated from the origin server.

**s-maxage**
This is very similar to the max-age setting; it indicates the time that content can
be cached.

**must-revalidate**
Stale contents should not served to a user unless the server is down.
This indicates that the values set in max-age, s-maxage or expires is how
long the object will be fresh, and after the expiration it must be revalidated.

**proxy-revalidate**
this is the same as *must-validate* but applies only to intermediate proxies.

**no-transform**
This informs the cache that this header should not be modified at all.

Your caching checklist
----------------------

What to cache and what not to cache?

**Cache-friendly content**

Content that does not change frequently.

- Style Sheets, CSS, some unchanged HTML theme codes
- AJAX and JavaScript files
- Media files and downloaded content
- Specific branding, logos, images that don't change

**Cache-unfriendly content**

Content that should **never** be cached!

- Any kind of personal information, such as logins, authentications, etc.
- Any kind of sensitive data
- Any user-specific content


**Cache or not**

Content that needs analysis before deciding on caching

- Cookies
- Frequently changing stylings, such as images, JavaScript and CSS
