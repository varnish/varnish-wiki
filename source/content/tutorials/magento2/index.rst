.. _magento2:

Magento2 with Varnish
=====================

.. toctree::
  :hidden:

  magento2_varnish_basics
  m2_step_by_step
  magento1x
  magento2_vcl


Magento is a powerful e-commerce platform for marketing, catalog management
and search engine optimization. Magento provides online merchants with a flexible
shopping cart system, control over a user-friendly WUI with content and various
functionality for online users.

Magento sites often use Varnish because it adds significant speed to websites.
Varnish is one of the most cost-effective alternatives for web accelaration, offering
a powerful return on investment. With a proper setup of Varnish,
maintenance costs can be reduced by 85%.

Magento2, with all its useful features, can be very demanding with resources and
thus will likely deliver poor performance as clients increase. With the latest
release of Magento2, Varnish has been included as a requirement, as it will
help the site fly with significant speed advantages!

- Varnish can detect devices and thus provide device-specific services.

- It allows modification of cache control headers

- Write caching based on your own caching policies, such as stripping cookies,
  overriding caching time, setting which pages to cache or not, and much more.

To read more about installing `Magento 2`_

Implementing Magento 2 with Varnish
-----------------------------------

Magento itself has a caching mechanism, but it does not cache pages.
But Magento2 supports Varnish Cache out of the box.
In order to run Varnish on your Magento2 implementation all you need to do
is install Varnish and deploy the Varnish configuration file (A Varnish VCL file)
in your Varnish implementation. 

To read more on the basics of how Varnish works with Magento2, go to

:ref:`Magento 2 and Varnish Basics <magento2_varnish_basics>`

If you are ready and just want to get started with the installation go to:

:ref:`Step by step Installation guide to make your website fly! <m2_step_by_step>`

Please note that Magento2 supports:

`varnish 3` and `varnish 4` out of the box.

Each new upgrade includes a section about the changes that have been made.

**We strongly recommend that you upgrade to Varnish 4 as we no longer provide support for Varnish 3.**

To make your life easier, there is a script:

VCL Migrator, which can help you upgrade from Varnish 3 to Varnish 4.


Our recommended plugins for Magento2
-------------------------------------

1. Fastly-Magento

Fastly’s Magento plugin lets you directly manage the Magento control panel.
It takes less than 30 minutes to install and configure.
Features include:

- Instant purge
- Soft purge
- ESI (dynamic website acceleration)
- geoIP / location detection

and more ...

This plugin provides great performance with the combined power of Fastly's Varnish
Extension and Magento's e-commerce platform.

The github repository can be found here:

  https://github.com/fastly/fastly-magento2

.. _magento2_resources:

Magento 2 resources
-------------------

`Magento Installation`_

`Quick Install Magento2`_

`Configuring and Use Varnish with Magento`

`Magento and Cache Clearning`_

`How Varnish Caching works`_

`Magento, Varnish and Turpentine`_

`A Magento-Varnish Repo`_

`Magento Stackexchage`_

.. _`Magento 2`: http://devdocs.magento.com/guides/v2.1/install-gde/bk-install-guide.html
.. _`Magento Installation`: http://devdocs.magento.com/guides/v2.1/install-gde/bk-install-guide.html
.. _`Configuring and Use Varnish with Magento`: http://devdocs.magento.com/guides/v2.0/config-guide/varnish/config-varnish.html
.. _`Magento and Cache Clearning`: http://devdocs.magento.com/guides/v2.0/config-guide/varnish/use-varnish-cache.html
.. _`How Varnish Caching works`: http://devdocs.magento.com/guides/v2.0/config-guide/varnish/use-varnish-cache-how.html
.. _`Magento, Varnish and Turpentine`: https://www.magentocommerce.com/magento-connect/turpentine-varnish-cache.html
.. _`A Magento-Varnish Repo`: https://github.com/huguesalary/Magento-Varnish
.. _`Quick Install Magento2`: http://devdocs.magento.com/guides/v2.1/install-gde/install-quick-ref.html
.. _`Magento Stackexchage`: http://magento.stackexchange.com/questions/91087/magento-2-admin-url-not-working-and-loaded-frontend-is-all-messy
.. _`Introducing Fastlys Magento 1 extension`: https://www.fastly.com/blog/introducing-fastlys-magento-1-extension
