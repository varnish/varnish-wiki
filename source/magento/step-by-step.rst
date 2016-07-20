.. _step-by-step:

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

.. literalinclude:: files/snippet2_restart
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

.. literalinclude:: files/snippet3_remove_cookies
  :language: c

6. Excluding certain URLs
=========================

Not all URLs should be cached. Especially not in sites that deal with personal
information such as credit card information.

.. literalinclude:: files/snippet4_exclude_url
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

However, it is known that the most effective way of increasing a websites hit ratio is to increase the time-to-live (ttl) of the objects. But today we are moving fast and large amount of changes are continuosly made to websites. Therefore the caching process is much more complex.

8. Specific TTL Based Caching
=============================



9. CAche Flush (BAN All)
========================





10. Per Object Cache Invalidation
=================================



.. _Magento-Site: http://devdocs.magento.com/guides/v2.1/install-gde/bk-install-guide.html
