.. _magento2:

*********************
Magento2 with Varnish
*********************

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
===================================

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

:Ref:`Visit Magento 2 Resources <magento2_resources>`

.. _`Magento 2`: http://devdocs.magento.com/guides/v2.1/install-gde/bk-install-guide.html

Need Magento 1? ref:`follow here <magento1x>`

.. toctree::
  :hidden:
  :maxdepth: 1

  magento2_varnish_basics
  m2_step_by_step
  magento1x
  top5_magento_plugins
  magento2_resources
