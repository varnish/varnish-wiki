.. _wordpress:

**********************
WORDPRESS with VARNISH
**********************

if you have a wordpress site and want to implement a caching solution.
Depending on the amount if rtaafic on your and the complexity of your
WOrdPress theme, performance maybe lagging. Varnish Cache is your recommended
solution.

More over you are not the firs to want to do this. There are million of wordpress
websites using varnish and some of the reknown Cache plugins written by other
varnish-wordpress users.


Implementing Wordpress with Varnish
===================================

Varnish is easy to set up and use. Since we have an open source project you are
always welcome to try our community edition and contribute your fare share
of new libraries, plug-ins and features.

So where in wordpress will you be integrating Varnish?

Installation
------------

 If you are ready and just want to get started with the installation go to:

:ref:`Step by step Installation guide to make your website fly! <wp_step_by_step>`

Please note that Drupal 8 supports;

`varnish 3` and `varnish 4` out-of-the-box.

Each new upgrade includes a section about the changes that have been made.

**We strictly recommend that you upgrade to varnish 4 as we no longer provide support for varnish 3.**

To make your life easier, there is a Script:

VCL Migrator, which can help you upgrade from Varnish 3 to Varnish 4.


Integration
-----------

Log in to your WordPress administration page at http://yourdomain.com/wp-admin
using the username and password you configured.

- Select Plugins
- Add New from the left sidebar menu
- Search for Varnish Plugins
- Choose plugin
- Click on Add Plugin
- After the plugin is added, Activate plugin


Our recommended Plugins for wordpress
=====================================

If you search in the wordpress.org for plugins like this:

.. code-block:: c

  https://wordpress.org/plugins/search.php?q=varnish+plugins


You will be presented with a lot of plugins containing the tag varnish. But donot
get lost. We have looked through the plugins and below you will find the most
popular ones with a little description collected from their page.

The most recommended ones by us are:

- `Varnish HTTP Purge`_

Varnish HTTP Purge sends a PURGE request to the URL of a page or post every time
it it modified. This occurs when editing, publishing, commenting or deleting an
item, and when changing themes. Not all pages are purged every time, depending
on your Varnish configuration. Read more on the link.

- `W3 Total Cache`_

W3 Total Cache improves the user experience of your site by increasing server
performance, reducing the download times and providing transparent content
delivery network (CDN) integration. Read more on the plugins page.

- `WPBase Cache`_

Plugin is developed to optimize wordpress deployment on
varnish + nginx + php-fpm + php-apc server stack using three type of caches full
page cache, db cache and opcode cache. They also support varnish cache management
with given default.vcl. Read more on the plugins page.


:ref:`Wordpress Resources <wp_resources>`

.. _`W3 Total Cache`: https://wordpress.org/plugins/w3-total-cache/
.. _`Varnish HTTP Purge`: https://wordpress.org/plugins/varnish-http-purge/
.. _`WPBase Cache`: https://wordpress.org/plugins/wpbase-cache/

.. toctree::

  wp_resources
  wp_step_by_step
