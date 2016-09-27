.. _drupal:


Drupal with Varnish
===================

Drupal is an open source Content Managenment System (CMS) written in PHP.

Varnish will help provide a smoother user interface for all the potentially million
users who access the site everyday. VArnish will not only accelerate your websites
performance but will also protect all your drupal websites against hackers and bots.

The Drupal CMS is by default served simple and plain and is mostly marketed to
technical developers who use there share of CSS magic to make their website standout.

Drupal features aswesome responsive themses, blog themse, e-commerce themes etc.

Drupal is also seo friendly and accounts for about 3% of the websites all over
the internet, of which many are quite high profile clients.

Drupal is used by multi-organizations, e-commerce sites, technological companies,
scientists, celebrities, musicians, etc

Drupal even has its own caching mechanism and stores data from multiple page
levels. But yet with all the traffic from potential clients and reckless hackers,
Varnish can boost your sites performance!

Is your Drupal website slow? We think that with a little help in your configurations,
your Drupal site can fly!

Get Varnish!

.. toctree::
  :hidden:

  drupal_step_by_step
  drupal_vcl


Implementing Drupal 8 with Varnish
----------------------------------

Varnish is easy to set up and use. Since we have an open source project you are
always welcome to try our community edition and contribute your fare share
of new libraries, plug-ins and features.

So where in Drupal will you be using Varnish?

Drupal being a Content Management System,
- Stores its contents in a database (mostly a separate independent database with its own mind)
- All data in a CMS are usually normalized cross databases and servers.
- The design is completely separate from all its contents.

Drupal provides, advanced URL Control, custom content types (e-commerce, blogs, tutorials, newspaper etc),
revision control (same various version of the same page), user management (community, )
This makes a content management system usable by non technical and technical users.
It also makes the websites highly scalable!

To make a highly scalable website more manageable and provide better performance to end users,
varnish provides a number of services.

Installation
------------

If you are ready and just want to get started with the installation go to:

:ref:`Step by step Installation guide to make your website fly! <drupal_step_by_step>`

Please note that Drupal 8 supports;

`varnish 3` and `varnish 4`.

Each new upgrade includes a section about the changes that have been made.

**We strictly recommend that you upgrade to varnish 4 as we no longer provide support for varnish 3.**

To make your life easier, there is a Script:

VCL Migrator, which can help you upgrade from Varnish 3 to Varnish 4.


Integration
-----------

Once you have your varnish installed and configured, you will want to integrate
it with your Drupal 8 installation.

For Drupal's Performance settings go to `/admin/config/development/performance`.

In Drupal 8, anonymous page caching is enabled by default.

To disable caching, set the "Page cache maximum age" to no caching.

See :ref:`How to place Drupal 8 behind Varnish <drupal_integration>`

Drupal 8 removed the "Cache Blocks" and "Minimum Cache Lifetime" settings.

Block caching is now set through each individual block's configuration.
The master listing of blocks is found at /admin/structure/block.


Our most Recommended `Drupal Modules` for Varnish
-------------------------------------------------

1. `Generic HTTP Purger`_


2. `Purge`_

Purge automatically sets the http.response.debug_cacheability_headers property
to true via it's purge.services.yml

Drupal Resources
----------------

`Whole new Drupal-Varnish Configuration`_

`Jeff Geerling's Post on Drupal 8 and Varnish`_

`Caching Overview from Drupal`_

`Drupal 8 Cache`_

`Managing Project with Varnish`_

`Varnish for beginners`_

`Caching with Varnish and Drupal 7`_

`Configuring Varnish 3 for Drupal 7`_


.. _`Jeff Geerling's Post on Drupal 8 and Varnish`: http://www.jeffgeerling.com/blog/2016/use-drupal-8-cache-tags-varnish-and-purge

.. _`Caching Overview from Drupal`: https://www.drupal.org/docs/7/managing-site-performance-and-scalability/caching-to-improve-performance/caching-overview

.. _`Caching with Varnish and Drupal 7`: http://www.wunderkraut.com/blog/caching-with-varnish-drupal-7-and-cache-actions/2012-01-31

.. _`Whole new Drupal-Varnish Configuration`: https://www.drupal.org/docs/7/caching-to-improve-performance/varnish-cache

.. _`Varnish for beginners`: https://dev.acquia.com/blog/explaining-varnish-beginners

.. _`Managing Project with Varnish`: https://www.drupal.org/project/varnish

.. _`Configuring Varnish 3 for Drupal 7`: https://fourkitchens.atlassian.net/wiki/display/TECH/Configure+Varnish+3+for+Drupal+7

.. _`Drupal 8 Cache`: https://pantheon.io/docs/drupal-8-cache/

.. _`Purge`: https://www.drupal.org/project/purge

.. _`Generic HTTP Purger`: https://www.drupal.org/project/purge_purger_http
