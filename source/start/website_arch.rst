.. _website_arch:

Understanding a typical website architecture
============================================

Regardless of the web application you use to manage your website, most websites
follow a similar pattern.

Each website has a few distinguishable sections:

- A front page
- Articles or sub pages
- A login box
- Static elements like CSS, JavaScript, graphics, etc.


Easy advice on caching your website?
....................................

- For static websites, cache contents for user not logged in.
- For dynamic websites:
    * First you have to be able to isolate each component.
    * Then choose which component to cache.
    * Decide for how long to cache.

This is where Varnish can really help you. Varnish assigns every single object a
TTL value. Here we discuss how each of the components can be managed separately yet
displayed together on a web page.

Cookies
.......

By default Varnish does not cache a page if it has header fields from clients or
servers. The main reason for this is to avoid delivering cookie-based content to
the wrong client and also to avoid clogging the cache with copies of the same
content.

Most importantly, when dealing with caching cookies, caching anything including  
personal client information is discouraged, as it can jeopardize a
client or your company if delivered to the wrong client.

One of our recommended VMODs for handling cookies is `libvmod-cookie`_ which
is available in the Varnish module repository on `github`_ or you can download
the whole module from the `varnish website`. The module also contains a `vmod-header`
which can be used for manipulation of duplicated HTTP headers, such as multiple
set-cookie headers!


Edge Side Includes
..................

Edge Side Includes (ESI) helps Varnish deliver various objects together.
On a Magento website, for example, a good use of ESI would be to display new products on a top banner on a client home page or cart.
While most of the client home page content can be cached, the top banner and
the cart will have smaller TTL values.
Let's say the TTL value of the banner would be about 5 minutes, the cart about
1 hour while the user-page content, such as name, purchased products, watching or
history would be cached for a day.


AJAX requests on Magento
........................

AJAX is of course a cool technology and developers love it.
If you are a long-term Magento user you probably added them to your Magento site
to avoid page reloads or partial page reloads. Of course you have already read
about ESIs and how they can do a similar task for you.

But if you already have AJAX on your Magento site, you should know that there are
browser restrictions that do not allow AJAX to send requests across another domain.
What you can do to solve this issue is to masquerade all AJAX requests. To be able
to do that you will need to add a regular expression to masquerade the request URL
in the VCL code in the `vcl_recv` subroutine.

.. literalinclude:: /content/examples/snippet6_masq
  :language: VCL

.. _`libvmod-cookie`: https://download.varnish-software.com/varnish-modules/varnish4.0/libvmod-cookie-20151013.git7e453b4.tar.gz
.. _`github`: https://github.com/varnish/varnish-modules
.. _`varnish website`:  https://download.varnish-software.com/varnish-modules/
