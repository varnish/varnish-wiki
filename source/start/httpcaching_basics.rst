.. _http_caching:

Basic HTTP Caching
==================

The need to understand HTTP caching is a necessity because in today's world,
installing and configuring Varnish doesn't solve all your caching problems.
So this involves a little understanding on Web Caching.

Every Web service has it's own requirements on what to cache and what not to cache.
Further down, you will find a checklist for varnish caching.

As you get to know varnish better you will see that as a web caching system Varnish
serves as a **proxy cache** as well as a **reverse proxy cache**.

Two main reasons why you might be considering using caching:
- To reduce network traffic load on servers
- To reduce response time to users (making your service look fast)

Caching Terminologies
---------------------

**Caching Manager:** It is the integration resource that manages the caching
components.

**Origin Server:** That is where the *original* content lies. It serves like a
*backup* for the cache as in, it serves content when the cache doesn't have the
relevant content and requests the origin server for the content.

**Cache hit ratio:** This is a measurement of the ratio of requests that were met
through the cache against the total number of requests.

So a *high cache hit ratio* means most of the contents were fetched from the cache.
And a *cache miss* means the content could not be fetched from cache.

**Freshness of data:** Freshness of data is used to judge whether an object in
cache is still fresh enough to serve a client.

**Stale Content:** Stale Content is judged based on how old the data is. In
general all objects in cache have a time to leave value and once that expires,
it is stale content.

**Validation:** Validation is checking whether the *stale data* in the cache is
"fresh" in comparison with the origin server content. If it is the same, then
the ttl value of the stale or almost expired object is increased.

**Invalidation:** Invalidation of objects as the name suggests just the opposite
of Validating objects. It does the same check and deletes objects that are *stale*

What is Web Caching?
--------------------

Caching on the web is based on HTTP protocol. The goal of web caching is to
provide a balance between web traffic and web performance by caching relevant
data based on client demands.

**Common Caching Steps**

1. A request is sent with a header to the server.
2. The response’s header tells whether to cache or not.
3. If the request is authenticated or secure, it won’t be cached by shared caches.
4. An object is considered fresh if:
    - it has a ttl value that is valid OR
    - it is an object which is infrequently changed
5. If the object is stale:
    - the origin server will be asked to validate it OR
    - the origin server will have to inform cache whether the copy is fresh enough.
6. When the network is down, the cache can serve stale responses without checking
    with the origin server.

**Pros of Caching**

Caching is found on almost every level of a packet's journey from one host to the
other. The most re-known advantage of caching is known to be high performance via
use of proxy servers.

- A quality analysis of web access helps improves client demands and caching
- Caching offers significantly high speed on web
- Reduces overhead costs on servers and use of bandwidth
- Fast access to cached (most visited) resources, by faster reloads and delivery
- Proxy servers help improve protocol translation (different browsers and devices)

**Cons of Caching**

Caching can lead to consequences if not properly considered.

- Confusing and displaying wrong user information (very risky! eg. subscription emails displaying all client emails)
- Delivering Stale objects (eg. old news even when there is an update in the database)
- Slow performance if object not in cache
- Caching logs contain user specific information (user privacy violated)

Therefore when making cache decisions please take all your company policies in
consideration.


Defining Cache-control Policy
-----------------------------

To define an optimal Cache control policy, there are somethings to consider.

Is the *response* from the server *reusable* ?

If it is *reusable*, Can it be *revalidated* ?
If it is not *re-usable*, **Do not store it!**

If it can be *revalidated*, **Do not cache it!**
If it *cannot be revalidated* , can it be *cached by immediate caches* ?

If it can be *cached immediately*, it can either be *public info* or *user private private data*.

Decide which private and public info should be cached.
Next things to decide is:

- maximum cache lifetime
- maximum age
- Add Etag header

Cache Related Headers
---------------------

HTTP has a whole list of headers dedicated to Cache Invalidation and Page Caching.
The ones that need the most attention are:
- Expires
- Cache Control
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
- Usually a time frame of 1 year is enough.
- In this time frame the resource can be updated.

**Cache-Control**

Example of a Cache-Control header:

  Cache-Control: public, must-revalidate, max-age=2592000

The Cache-Control header is where the caching policy is defined.
it is both a *request and a *response* header.
This policy directs which responses to cache and which not based
on the conditions in its policy. It accepts a number of arguments
as listed below:

- **public:** response can be cached by any cache
- **No-store:** response must not be stored by any cache mechanism
- **No-cache:** response is authorized to be stored but may not be reused without validation
- **max-age:** time in seconds when the object in cache is fresh
- **s-maxage:** like *max-age* but only used in public caches
- **must-revalidate:** indicates that the object maybe stale and should be revalidated first

Below is a table from the Varnish Book showing the arguments used by the Cache-control
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
requested variant. It provides a unique value for a resource's cotnent


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

- **if** the requested variant has not been modified since the time specified in this field, an entity will not be returned from the server;
- **instead**, a 304 (not modified) response will be returned without any message-body.


**If-None-Match**

Example of an If-None-Match header :

  If-None-Match: "1edec-3e3073913b100"

The If-None-Match **request header** field is used with a method to make it
conditional. The purpose of this feature is to allow efficient updates of cached
information with a minimum amount of transaction overhead.


**Vary**

The Vary response header indicates the response returned by the origin server
- may vary depending on headers received in the request.
- The most common usage of Vary is to use

    Vary: Accept-Encoding

    which tells cache (Varnish included) that the content might look different
    depending on the Accept-Encoding-header the client sends.


**Age**

- A cache server can send an additional response header, Age, to indicate the age of the response.
- Varnish (and other caches) does this.
- Browsers (and Varnish) will use the Age-header to determine how long to cache.
- E.g: for a max-age-based equation: cache duration = max-age - Age
- If you allow Varnish to cache for a long time, the Age-header could effectively disallow client-side caches.


Cache-hit and misses
....................

**Cache-hit**

There is a cache-hit when Varnish returns a page from its cache instead of
forwarding the request to the origin server.

.. image:: image/httpcachehit.png
  :alt: Sphinx Neo-Hittite
  :align: center
  :width: 400px

**Cache-miss**

There is a cache-miss when Varnish has to forward the request to the origin
server so the page can be serviced.

.. image:: image/httpcachemiss.png
  :alt: Sphinx Neo-Hittite
  :align: center
  :width: 400px

Impact of Cache Related headers on Caching
------------------------------------------

How cache related headers impact the caching policy.

**no-cache:**
Any cached content must be re-validated on each request before being served

**No-store**
This instruction indicates that the content cannot be cached in anyway

**public**
marks eh content public, which means that it can be cached by the browser and
any intermediate caches.

**private**
- This marks the content as private.
- Private content may be stored by the user's browser, but must not be cached
by any intermediate parties. Only used for specific data.

**max-age**
Sets the maximum age that the content may be cached before it
must be revalidate from the origin server.

**s-maxage**
This is very similar to the max-age setting, indicates the time that content can
be cached.

**must-revaldiate**
Stale contents shouldnot served to user unless the server is down.
This indicates that the values set in max-age, s-maxage or the Expires is how
long the obejct will be fresh and after the expiration it should be revalidated
at all costs.

**proxy-revalidate**
this is the same as *must-validate* but applies only to intermediate proxies.

**no-transform**
This informs the cache that this header should not be modified at all.

Your Caching Checklist
----------------------

What to cache and what not?

**Cache Friendly Contents**

Contents that do not change frequently.

- Style Sheets, CSS, Some unchanged HTML theme codes
- AJAX and JavaScript files
- Media Files and download contents
- Specific Brandings, Logos, Images that don't change

**Cache Unfriendly Contents**

Contents that should **never** be cached!

- Any kind of personal Information, such as logins, authentications etc.
- Any kind of sensitive data
- Any user specific contents


**Cache or Not**

Contents that need analyzing before deciding on Caching

- Cookies
- Frequently changing stylings such as images, JavaScripts and CSS
