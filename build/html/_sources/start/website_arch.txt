.. _website_arch:

Understanding a Typical Website Architecture
============================================

Regardless of the Web application you use to manage your website, most websites
follow a similar pattern.

Each website has a few distinguishable sections:

- A front page
- Articles or sub pages
- A login-box
- Static Elements like CSS, JavaScript, graphics, etc


Easy Advice on Caching your website?
....................................

- For static websites, Cache contents for user not logged in.
- For dynamic websites,
    * First you have to be able to isolate each component.
    * Then choose which component to cache.
    * Decide for how long to cache.

That is where varnish can really help you. Varnish assigns every single object a
TTL value. Here we discuss how each of the component can be managed separately yet
displayed together on a web page.

Cookies
.......

By default varnish does not cache a page if it has header fields from clients or
servers. The main reason for that is to avoid delivering cookie based content to
the wrong client and also to avoid bestrewing the cache with copies of the same
content.

Most importantly, when dealing with cookies to cache, it is discouraged to cache
anything rather then caching personal client information that could jeopardize a
client or your company if delivered to the wrong client.

one of our recommended VMODs for handling cookies would be `libvmod-cookie`_ which
is available in the varnish modules repository on `github`_ or you can download
the whole module from the `varnish website`. The module also contains a `vmod-header`
which can be used for manipulation of duplicated HTTP headers, such as multiple
Set-Cookie headers!


Edge Side Includes
..................

Edge Side Includes (ESI) helps Varnish deliver various objects together.
On a magento website, a good example of a use of ESI would be to display emerging
of new products on a top banner on a client home page or the cart.
While most of the client home page contents can be cached, the top banner and
the cart will have smaller TTL values.
Let's say the TTL value of the banner would be about 5 minutes, the cart about
1 hour while the user page content such as name, purchased products, watching,
history would be cached for a day.


AJAX Requests on Magento
........................

AJAX is of course a cool technology and developers love it.
If you are a long term magento user you probably added them to your magento site
to avoid page reloads or parts of page reloads. Of course you have already read
about ESI's and they can do a similar task for you.

But if you already have AJAX on your magento site, you should know that there are
browser restrictions that does not allow AJAX to send requests across another domain.
What you can do to solve this issue, is masquerade all AJAX requests. To be able
to do that you will need to add a  regular expression to masquerade the request url
in the VCL code in the `vcl_recv` subroutine.

.. literalinclude:: /content/examples/snippet6_masq
  :language: VCL

.. _`libvmod-cookie`: https://download.varnish-software.com/varnish-modules/varnish4.0/libvmod-cookie-20151013.git7e453b4.tar.gz
.. _`github`: https://github.com/varnish/varnish-modules
.. _`varnish website`:  https://download.varnish-software.com/varnish-modules/
