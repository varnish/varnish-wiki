

3. How to place Magento 2 behind Varnish
========================================

Here we discuss how to configure your Magento2 behind Varnish.

The Magento2 Admin states that built-in Application cache is not recommended for production use, but that doesnot mean that varnish is configured. Varnish needs to be installed and the configuration file suitably configured and deployed.

We assume that you have Magento2 installed and running on your backend servers and that your server is a Debian based Linux Server.

Configuring Magento
...................

1. Visit the Magento 2 Admin page and go to:

 	-> Stores

	-> Advanced

	-> System

	-> Full Page Cache

Here switch caching application to **Varnish**

This is what the Magento 2 Admin page should look like

.. image:: /image/config_varnish_admin.png
  :alt: Sphinx Neo-Hittite
  :align: center
  :width: 500px

Image courtesy: `Magento Site`_

2. Configuring for Varnish

- Under the Additional section, find a button for exporting the ready-made configuration file for varnish 3 or 4. We recommned you used varnish 4.0 now.

Therefore click on::
	-> Export VCL for Varnish 4
	this is usually named varnish.vcl

Place the file in a varnish folder for configuration (any safe place for you).

- Next to add varnish repository follow the instructions over at :ref:`Install Varnish <varnish>`

3.  Testing your set up

Now to check if your services are up and running::

``$ ps -e | grep 'apache2|varnish'``

If you recieve outputs like the ones below::

 1143 ?        00:00:03 varnishd
 1148 ?        00:00:17 varnishd
 1366 ?        00:02:02 varnishlog
 1591 ?        00:00:01 apache2
 11743 ?       00:00:10 apache2
 11744 ?       00:00:10 apache2

Congratulations! You have your services running on the backend.

Now we need to check the Magento2 frontend::
As you may have already noticed above, there is a ``varnishlog`` process running as well.


If you are interested in trying out an installation try downloading Marko's
Vagrant Box `marko_magento2github`_.
His installation used niginx with varnish and magento.You can also read more
about that at Marko's blogpost about Placing Magento2 behind Varnish `marko_magento2post`_.


.. _marko_magento2github: https://github.com/Marko-M/magento2-vagrant-nux

.. _marko_magento2post: http://www.techytalk.info/magento-2-behind-varnish-reverse-proxy/

.. _`Magento Site`: http://devdocs.magento.com/guides/v2.0/config-guide/varnish/config-varnish-magento.html

.. toctree::
  :hidden:

  /start/varnish
