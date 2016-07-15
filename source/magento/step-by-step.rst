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
	:linenothreshold: 1
	:tab-width: 50

5. Removing cookies

Varnish doesnot cache cookies or its headers. But some cookies are marked as safe
by the magento site and to remove or ignore these cookies, you can add the following
code by updating your default.vcl

Under the `vcl_recv` add the following code.

warning: Make sure to add the code below the default code given for `vcl_recv`

.. literalinclude:: files/snippet3_remove_cookies
  :language: c
  :linenothreshold: 1
  :tab-width: 50

6. Excluding certain URLs

Not all URLs should be cached. Especially not in sites that deal with personal
information such as credit card information.

.. literalinclude:: files/snippet4_exclude_url
  :language: c
  :linenothreshold: 1
  :tab-width: 50






.. _Magento-Site: http://devdocs.magento.com/guides/v2.1/install-gde/bk-install-guide.html


.. toctree::
	:hidden:

  install_varnish
  magento2_varnish
