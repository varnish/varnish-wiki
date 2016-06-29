.. _magento:


Varnish in Magento
==================

Magento is a powerful ecommerce platform  for marketing, catalog management and search engine optimization. Magenoto provides online merchants with a flexible shopping cart system, a control over a user friendly WUI with contents and  various functionality for online users.

Magento sites have been using varnish because it makes the websites super fast. Varnish is one of the most cost effective alternatives for web accelaration with powerful return on investments. With a proper setup of varnish, maintenance costs can be reduced by 85%. 

Magento 2 with all its excellent features can be very demanding of resources and thus is predicted to give poor performance as clients increase. With the latest realease of Magento 2, varnish has been included as a requirement as it will help the site fly with significant advantages.

- Varnish can detect devices and thus provide device friendly services. 

- It allows modifying of cache control headers

- Write caching based on your own caching policies such as stripping cookies, over ride caching time, set which pages and much more.
 


Implementing Magento 2 with Varnish
-----------------------------------

Magento by itself had a caching mechanism, but it does not cache pages. However now, Magento 2 supports varnish cache out of the shelf. So in order to run Varnish on your Magento 2 implementation all you need to do is install Varnish and deploy the Varnish configuration file (A Varnish VCL file) into your Varnish implementation. Then your website can fly.

:ref:`Installing Varnish with Magento <install_varnish>`

Please note that Magento 2 supports 

:ref: `varnish 3 <varnish3>` and 
:ref: `varnish 4 <varnish4>` out-of-the-box.

Each new upgrade includes a section about the changes that have been made.

**We strictly recommend that you upgrade to varnish 4 as we no longer provide support for varnish 3.**

To make your life easier, there is a :ref: `VCL Migrator <varnish3to4>`, which can help you upgrade from Varnish 3 to Varnish 4.

.. toctree::
	:hidden:

	install_varnish
	/intro/varnish3
	/intro/varnish4
	/intro/varnish3to4
