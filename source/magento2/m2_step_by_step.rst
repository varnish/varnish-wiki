.. _m2_step_by_step:

***************************************************
STEP BY STEP GUIDE TO MAKING YOUR MAGENTO SITE FLY
***************************************************

Ofcourse you want to get started with increasing the performance of your website!
So Lets get Started!

1. Installing Magento from the `Magento-Site`_
==============================================

.. include:: install_varnish.rst

.. include:: magento2_varnish_configure.rst

4. Restart services after making changes
========================================

.. literalinclude:: /snippets/snippet2_restart
  :language: c

5. Basic Caching
================

Varnish doesnot cache cookies or its headers. But some cookies are marked as safe
by the magento site. Therefore it is recommended to remove or ignore these cookies
so that varnish can cache anything.

An example like the following will help to unset/remove unwanted cookies.

Update your `default.vcl` with this code or a similar code of your choice.

Under the `vcl_recv` add the following code.

warning: Make sure to add the code below the default code given for `vcl_recv`

.. literalinclude:: /snippets/snippet3_remove_cookies
  :language: c

6. Excluding certain URLs
=========================

Not all URLs should be cached. Especially not in sites that deal with personal
information such as credit card information.

.. literalinclude:: /snippets/snippet4_exclude_url
  :language: c


7. Extended Caching
===================

There is a subroutine called *vcl_fetch* which is by default set to 120 seconds as can be seen.
You can extend this caching value

``sub vcl_fetch {``

	``set beresp.ttl = 5s;``

``}``

This sets the ttl to 5 seconds, thus varnish picks up changes every 5sec.
Add this subroutine right below the *backend default*.

However, there is a downside to short TTL values that is they increase the load
not only in the backend servers but also the front end servers. Of course this
gives you a better control over your cache, but it also increases overheads such
as network traffic, response times becomes slower thus diminishing the whole
purpose of varnish.

So decreasing TTL values is not a good solution for high traffic based servers.
Varnish has a better solution for that.

Read more about caching at :ref:`Caching with Magento 2 <magento2_ce>`


8. Specific TTL Based Caching
=============================
Varnish creates a TTL value for every object in the cache. A most effective way
of increasing a websites hit ratio is to increase the time-to-live (ttl) of the
objects.


.. _`Magento-Site`: http://devdocs.magento.com/guides/v2.1/install-gde/bk-install-guide.html

.. toctree::

  magento2_ce
