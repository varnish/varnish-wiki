.. _step_by_step:


STEP BY STEP GUIDE TO MAKING YOUR MAGENTO SITE FLY
--------------------------------------------------

Ofcourse you want to get started with increasing the performance of your website!
So Lets get Started!

1. Do you already have Magento? If you don't have Magento yet, follow the guide over at the `Magento-Site`_

2. In the link below you will find how to install and configure varnish for Magento 2.

:ref:`Installing Varnish with Magento <install_varnish>`

3. After installing varnish, you need to configure magento behind varnish.
In order to do that, follow this link:

:ref: `Magento2 behind varnish <magento2_varnish>`

4. After completing both installations, make sure to restart both varnish and apache2.

.. literalinclude:: files/snippet2_restart
  :language: c

5. Removing cookies

Varnish doesnot cache cookies or its headers. But some cookies are marked as safe
by the magento site and to remove or ignore these cookies, you can add the following
code by updating your default.vcl

Under the `vcl_recv` add the following code.

warning: Make sure to add the code below the default code given for `vcl_recv`

.. literalinclude:: files/snippet3_remove_cookies
  :language: c

6. Excluding certain URLs

Not all URLs should be cached. Especially not in sites that deal with personal
information such as credit card information.

.. literalinclude:: files/snippet4_exclude_url
  :language: c

7.  Extend Caching

There is a subroutine called *vcl_fetch* which is by default set to 120 seconds as can be seen.
You can extend this caching value

``sub vcl_fetch {``

	``set beresp.ttl = 5s;``

``}``

This sets the ttl to 5 seconds, thus varnish picks up WordPress changes every 5sec.
Add this subroutine right below the *backend default*.

However, it is known that the most effective way of increasing a websites hit ratio is to increase the time-to-live (ttl) of the objects. But today we are moving fast and large amount of changes are continuosly made to websites. Therefore the caching process is much more complex.





.. _Magento-Site: http://devdocs.magento.com/guides/v2.1/install-gde/bk-install-guide.html


.. toctree::
  :hidden:

  install_varnish
  magento2_varnish
