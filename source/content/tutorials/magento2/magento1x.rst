.. _magento1x:

Varnish with Magento 1.9 and older
==================================

Magento versions 1.9 and earlier did not include built-in support for Varnish.

Until version 1.9.x Magento provided an extension named `Turpentine`_, which improved
Magento's compatibility with Varnish. Turpentine is a Magento extension that provides
pre-configured Varnish Configuration (VCL) files that can significantly improve
the cache-hit rate.

There is a `Github Repo for Magento Turpentine` developed by `Nexcess.net`.

Quoting from the Magento commerce site:

"Note that while this extension is now considered stable, it is strongly
recommended that it be tested on a development/staging site before deploying on
a production site due to the potential need to add custom ESI policies for
blocks added by other extensions."

.. _`Turpentine`: https://www.magentocommerce.com/magento-connect/turpentine-varnish-cache.html
.. _`Github Repo for Magento Turpentine`: https://github.com/nexcess/magento-turpentine

Magento 1.x step-by-step guide
------------------------------

Please note that at this time, Magento2 is the latest version.
Upgrading to the latest version of Magento2 is recommended.

However if for whatever reason you choose to continue to use Magento 1.x, bear in
mind that Magento 1.x does not offer out-of-the-box Varnish support, but
there are plugins that can help your Varnish configurations with Magento 1.x.

Magento 1.9 and older resources
-------------------------------

`Magento1.9 Official Docs`_

`Fastly with Magento`_

`Fastly's Magento 1 extension`_

`Section IO's Docs on Magento`_



.. _`Magento1.9 Official Docs`: http://devdocs.magento.com/guides/m1x/ce19-ee114-home.html

.. _`Fastly with Magento`: https://alankent.me/2016/04/26/fastly-and-magento/

.. _`Fastly's Magento 1 extension`: https://www.fastly.com/blog/introducing-fastlys-magento-1-extension

.. _`Section IO's Docs on Magento`: https://www.section.io/docs/magento/
