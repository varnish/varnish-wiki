.. _magento2:

Magento2 with Varnish
=====================

.. toctree::
  :hidden:

  magento2_varnish_basics
  m2_step_by_step
  magento1x
  magento2_vcl


Magento is a powerful e-commerce platform  for marketing, catalog management
and search engine optimization. Magento provides online merchants with a flexible
shopping cart system, a control over a user friendly WUI with contents and various
functionality for online users.

Magento sites have been using varnish because it makes the websites super fast.
Varnish is one of the most cost effective alternatives for web accelaration with
powerful return on investments. We believe with a proper setup of varnish,
maintenance costs can be reduced by 85%.

Magento 2 with all its excellent features can be very demanding of resources and
thus is predicted to give poor performance as clients increase. With the latest
realease of Magento 2, varnish has been included as a requirement as it will
help the site fly with significant advantages!

- Varnish can detect devices and thus provide device friendly services.

- It allows modifying of cache control headers

- Write caching based on your own caching policies such as stripping cookies,
  over ride caching time, set which pages to cache and not and much more.

To read more about installing `Magento 2`_

Implementing Magento 2 with Varnish
-----------------------------------

Magento by itself had a caching mechanism, but it does not cache pages.
But Magento 2 supports varnish cache out of the shelf.
So in order to run Varnish on your Magento 2 implementation all you need to do
is install Varnish and deploy the Varnish configuration file (A Varnish VCL file)
into your Varnish implementation. Then your website can fly!

To read more on the basics of how varnish works with magento2 go to

:ref:`Magento 2 and Varnish Basics <magento2_varnish_basics>`

If you are ready and just want to get started with the installation go to:

:ref:`Step by step Installation guide to make your website fly! <m2_step_by_step>`

Please note that Magento 2 supports;

`varnish 3` and `varnish 4` out-of-the-box.

Each new upgrade includes a section about the changes that have been made.

**We strictly recommend that you upgrade to varnish 4 as we no longer provide support for varnish 3.**

To make your life easier, there is a Script:

VCL Migrator, which can help you upgrade from Varnish 3 to Varnish 4.


Our recommneded Plugins for Magento 2
--------------------------------------

1. Fastly-Magento

Fastly’s Magento Plugin lets you directly manage the Magento Control panel.
It takes less than 30 minutes to install and configure.
Features include:

- Instant Purge
- Soft Purge
- ESI (dynamic website acceleration)
- geoIP / location detection

and more ...

This plugin provides great performance with the combined power of Fastly's Varnish
Extension and Magento's e-commerce platform.

The github repository cane be found here:

  https://github.com/fastly/fastly-magento2

.. _magento2_resources:

Magento 2 Resources
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
