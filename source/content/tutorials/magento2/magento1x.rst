.. _magento1x:

Varnish with Magento 1.9 and older
==================================

Magento versions 1.9 and earlier didnot have support for varnish out of the box.

Uptil version 1.9.x Magento provides an extension named `Turpentine`_ which improves
Magento's compatibility with Varnish. Turpentine is a Magento extension that provides
pre-configured Varnish Configuration (VCL) files which can significantly improve
the cache hit rate.

There is a `Github Repo for Magento Turpentine` developed by `Nexcess.net`.

Quoting from the Magento Commerce site,

"Note that while this extension is now considered stable, it is strongly
recommended that it be tested on a development/staging site before deploying on
a production site due to the potential need to add custom ESI policies for
blocks added by other extensions."

.. _`Turpentine`: https://www.magentocommerce.com/magento-connect/turpentine-varnish-cache.html
.. _`Github Repo for Magento Turpentine`: https://github.com/nexcess/magento-turpentine

Magento 1.x Step by Step Guide
------------------------------

Please Note that Magento 2 at this time is the latest version.
If you choose to upgrade 2 magento 2 that is a humble choice.

However if you for whatever reason choose to continue to use Magento 1.x we
have to admit that magento 1.x with varnish is not supported out of the box but
there is are plugins that can help your varnish configurations with Magento 1.x.

Magento 1.9 and older Resources
-------------------------------

`Magento1.9 Official Docs`_

`Fastly with Magento`_

`Fastly's Magento 1 extension`_

`Section IO's Docs on Magento`_



.. _`Magento1.9 Official Docs`: http://devdocs.magento.com/guides/m1x/ce19-ee114-home.html

.. _`Fastly with Magento`: https://alankent.me/2016/04/26/fastly-and-magento/

.. _`Fastly's Magento 1 extension`: https://www.fastly.com/blog/introducing-fastlys-magento-1-extension

.. _`Section IO's Docs on Magento`: https://www.section.io/docs/magento/
