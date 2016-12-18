.. _wordpress:

WordPress with Varnish
======================

.. toctree::
  :hidden:

  wp_step_by_step
  wp_vcl


WordPress is a one of the most well-known open source content management systems
(CMS) existing today. If you have a WordPress site and want to implement a caching solution,
Varnish may be right for you. Depending on the amount of traffic and the complexity of your WordPress
theme, performance maybe lagging. Varnish Cache is your recommended solution.

Moreover you are not the first to want to do this. There are millions of WordPress
websites using Varnish and some of the popular cache plugins written by other
Varnish-WordPress users.

Implementing WordPress with Varnish
-----------------------------------

Varnish is easy to set up and use. Since we have an open source project you are
always welcome to try our community edition and contribute your fair share
of new libraries, plugins and features.

So where in WordPress will you be integrating Varnish?

Installation
------------

If you are ready and just want to get started with the installation go to:

:ref:`Step by step Installation guide to make your website fly! <wp_step_by_step>`

Please note that WordPress supports:

`varnish 3` and `varnish 4`.

Each new upgrade includes a section about the changes that have been made.

**We strongly recommend that you upgrade to Varnish 4 as we no longer provide support for Varnish 3.**

To make your life easier, there is a script:

VCL Migrator, which can help you upgrade from Varnish 3 to Varnish 4.

Integration
-----------

Log in to your WordPress administration page at http://yourdomain.com/wp-admin
using the username and password you configured.

- Select Pplugins
- Add new from the left sidebar menu
- Search for Varnish plugins
- Choose plugin
- Click on add plugin
- After the plugin is added, activate plugin


Our recommended plugins for WordPress
-------------------------------------

If you search at WordPress.org for plugins like this:

.. code-block:: bash

  https://WordPress.org/plugins/search.php?q=varnish+plugins


you will be presented with a lot of plugins containing the tag Varnish. But do not
get lost. We have looked through the plugins and below you will find the most
popular ones with a short description.

The most recommended plugins include:

- `Varnish HTTP Purge`_

Varnish HTTP purge sends a PURGE request to the URL of a page or post every time
it it modified. This occurs when editing, publishing, commenting or deleting an
item, and when changing themes. Not all pages are purged every time, depending
on your Varnish configuration. Read more on the link.

- `W3 Total Cache`_

W3 total cache improves the user experience of your site by increasing server
performance, reducing the download times and providing transparent content
delivery network (CDN) integration. Read more on the plugins page.

- `WPBase Cache`_

The plugin was developed to optimize the WordPress deployment on
varnish + nginx + php-fpm + php-apc server stack using three type of caches full
page cache, db cache and opcode cache. They also support Varnish cache management
with given default.vcl. Read more on the plugins page.

.. _wp_resources:

WordPress resources
-------------------

`How to Purge Varnish`_

`Optimizing WordPress with Varnish and W3 Total Cache`_

.. _`How to Purge Varnish`: http://www.dimitri.eu/how-to-purge-varnish-cache/
.. _`Optimizing WordPress with Varnish and W3 Total Cache`: http://code.tutsplus.com/tutorials/optimizing-WordPress-with-varnish-and-w3-total-cache--cms-21136
.. _`W3 Total Cache`: https://WordPress.org/plugins/w3-total-cache/
.. _`Varnish HTTP Purge`: https://WordPress.org/plugins/varnish-http-purge/
.. _`WPBase Cache`: https://WordPress.org/plugins/wpbase-cache/
