.. _m2_step_by_step:

Step-by-step guide to making your Magento2 website fly
=======================================================

Magento2 is a PHP-based e-commerce platform.
There are two editions:

- Community edition (CE)

- Enterprise edition (EE)

Whichever works best for you, you do of course want to get started with a performance increase for 
your website right away!

Let's get started!

This article assumes that you have a running instance of Magento2 and that you
have administrator rights for said instance, both at the OS and application level.
We have tested this using Ubuntu LTS 16.04, Varnish Cache 4.1 and Magento2.

If you need guidance on the installation of Magento, please visit the `Magento-Site`_


1. Installing Varnish
---------------------

In case you also do not have Varnish, you will need to follow the instructional
section on how to :doc:`Install Varnish </content/tutorials/varnish/varnish_ubuntu>`
before we can continue.

2. How to place Magento2 behind Varnish
-----------------------------------------

Here we discuss how to configure your Magento2 behind Varnish. The Magento2 admin
states that the built-in application cache is not recommended for production use,
but that does not mean that Varnish is already configured. Varnish needs to be installed
and the configuration file suitably configured and deployed.

We assume that you have Magento2 installed and running on your backend servers
and that your server is a Debian-based Linux server.

Configuring Magento
...................

1. Visit the Magento2 admin page and go to:

- > Stores
- > Advanced
- > System
- > Full Page Cache

Here switch caching application to **Varnish**

This is what the Magento2 mdmin page should look like:

.. image:: /image/config_varnish_admin.png
  :alt: Sphinx Neo-Hittite
  :align: center
  :width: 500px

Image courtesy: `Magento Site`_

2. Configuring for Varnish

- Under the Additional section, find a button for exporting the ready-made configuration file for Varnish 3 or 4. We recommend you use  Varnish 4, as earlier versions are no longer supported.

Click on::
	-> Export VCL for Varnish 4
	This is usually named varnish.vcl

Place the file in a Varnish folder for configuration (any place that is safe for you).

- Next, to add Varnish repository, follow the instructions at :ref:`Install Varnish <varnish_ubuntu>`

3.  Testing your setup

Now check if your services are up and running:

``$ ps -e | grep 'apache2|varnish'``

If you receive outputs like the ones below::

 1143 ?        00:00:03 varnishd
 1148 ?        00:00:17 varnishd
 1366 ?        00:02:02 varnishlog
 1591 ?        00:00:01 apache2
 11743 ?       00:00:10 apache2
 11744 ?       00:00:10 apache2

Congratulations! You have your services running on the backend.

Now we need to check the Magento2 frontend:
As you may have already noticed above, there is a ``varnishlog`` process running as well.

3. Restarting services after making changes
--------------------------------------------

.. literalinclude:: /content/examples/snippet2_restart_systemd
  :language: VCL

4. Basic caching
----------------

Varnish does not cache cookies or their headers. But some cookies are marked as safe
by the Magento site. Therefore it is recommended to remove or ignore these cookies
so that Varnish can cache anything.

An example, such as the following, will help to unset/remove unwanted cookies.

Update your `default.vcl` with this code or a similar code of your choice.

Under the `vcl_recv` add the following code.

Warning: Make sure to add the code below the default code given for `vcl_recv`

.. literalinclude:: /content/examples/snippet3_remove_cookies
  :language: VCL

5. Excluding certain URLs
-------------------------

Not all URLs should be cached. Especially not in sites that deal with personal
information such as credit cards or financial details.

.. literalinclude:: /content/examples/m2_exclude_url.vcl
  :language: VCL

6. Extended caching
-------------------

There is a subroutine called *vcl_fetch* which is by default set to 120 seconds
as can be seen. You can extend this caching value by:

.. literalinclude:: /content/examples/vcl_fetch.vcl
  :language: VCL

This sets the TTL to 5 seconds, making Varnish pick up changes every 5 seconds.
Add this subroutine right below the *backend default*.

However, there is a downside to short TTL values in that they increase the load
not only on the backend servers but also on frontend servers. Of course this
gives you a better control over your cache, but it also increases overheads, such
as network traffic, slower response times, which diminish the whole
purpose of Varnish.

Decreasing TTL values is not a good solution for high-traffic servers.
Varnish has a better solution for that.

7. Specific TTL-based caching
-----------------------------

Varnish creates a TTL value for every object in the cache. The most effective way
of increasing a website's hit ratio is to increase the time-to-live (TTL) of the
objects.

8. Go further
--------------

If you are interested in Varnish, you can always give Varnish Plus a go with a free trial.
You can capture real-time traffic statistics,
create a paywall for premium content, simultaneously work on administration
across all Varnish servers, record relationships between web pages for easy
content maintenance, detect devices used for browsing, accelerate APIs and more.

Check out the links below to take your Varnish-Magento site to new performance heights.

9. For more guidance
---------------------

You can always refer to the `Configure and Use Varnish <http://devdocs.magento.com/guides/v2.0/config~guide/varnish/config~varnish.html>`_
at the Magento site.

To see the guide on installing and configuring Magento with Varnish on web servers,
please look at `here <http://devdocs.magento.com/guides/v2.0/config~guide/varnish/config~varnish~configure.html>`_.

If you are interested in trying out an installation try downloading Marko's
Vagrant Box `marko_magento2github`_.
His installation used nginx with Varnish and Magento. You can also read more
about in Marko's blog post about placing Magento2 behind Varnish `marko_magento2post`_.


.. _marko_magento2github: https://github.com/Marko-M/magento2-vagrant-nux

.. _marko_magento2post: http://www.techytalk.info/magento-2-behind-varnish-reverse-proxy/

.. _`Magento Site`: https://devdocs.magento.com/guides/v2.0/config-guide/varnish/config-varnish.html

.. _`Magento-Site`: http://devdocs.magento.com/guides/v2.1/install-gde/bk-install-guide.html
