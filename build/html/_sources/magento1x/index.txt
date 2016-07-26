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


.. include:: m1x_resources.rst
