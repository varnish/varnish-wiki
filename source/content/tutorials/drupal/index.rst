.. _drupal:


Drupal with Varnish
===================

Drupal is an open source content managenment system (CMS) written in PHP.

Varnish will help provide a smoother user interface for the potentially millions of
users who access the site every day. Varnish will not only accelerate your website's
performance but will also protect all of your Drupal websites against hackers and bots.

The Drupal CMS is by default served simply and plainly and is mostly marketed to
technical developers who use their share of CSS magic to make their website stand out.

Drupal features awesome responsive themes, blog themes, e-commerce themes and more. 

Drupal is also SEO friendly and accounts for about 3% of all websites on
the internet, of which many belong to high-profile, well-known clients.

Drupal is used by multi-organizations, e-commerce sites, technology companies,
scientists, celebrities, musicians, and everyone in between.

Although Drupal has its own caching mechanism and stores data from multiple page
levels, yet with all the traffic from potential clients and reckless hackers,
Varnish can add an extra boost to your site's performance!

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
always welcome to try our community edition and contribute your fair share
of new libraries, plugins and features.

So where in Drupal will you be using Varnish?

Drupal as a content management system:
- Stores its contents in a database (mostly a separate independent database with its own mind)
- All data in a CMS is usually normalized across databases and servers.
- The design is completely separate from all its contents.

Drupal provides, advanced URL control, custom content types (e-commerce, blogs, tutorials, newspapers, etc.),
revision control (various versions of the same page) and user management (community).
This makes a content management system usable for non-technical and technical users alike.
It also makes the websites highly scalable.

To make a highly scalable website more manageable and provide better performance to end users,
Varnish provides a number of services.

Installation
------------

If you are ready and just want to get started with the installation, go to:

:ref:`Step by step Installation guide to make your website fly! <drupal_step_by_step>`

Please note that Drupal 8 supports;

`varnish 3` and `varnish 4`.

Each new upgrade includes a section about the changes that have been made.

**We strongly recommend that you upgrade to Varnish 4 as we no longer provide support for Varnish 3.**

To make your life easier, there is a script:

VCL Migrator, which can help you upgrade from Varnish 3 to Varnish 4.


Integration
-----------

Once you have your Varnish installed and configured, you will want to integrate
it with your Drupal 8 installation.

For Drupal's Performance settings go to `/admin/config/development/performance`.

In Drupal 8, anonymous page caching is enabled by default.

To disable caching, set the "Page cache maximum age" to no caching.

See :ref:`How to place Drupal 8 behind Varnish <drupal_integration>`

Drupal 8 removed the "Cache Blocks" and "Minimum Cache Lifetime" settings.

Block caching is now set through each individual block's configuration.
The master listing of blocks is found at /admin/structure/block.


Our most recommended `Drupal Modules` for Varnish
-------------------------------------------------

1. `Generic HTTP Purger`_


2. `Purge`_

Purge automatically sets the http.response.debug_cacheability_headers property
to true via it's purge.services.yml

Drupal resources
----------------

`Whole new Drupal-Varnish Configuration`_

`Jeff Geerling's Post on Drupal 8 and Varnish`_

`Caching Overview from Drupal`_

`Drupal 8 Cache`_

`Managing Project with Varnish`_

`Varnish for beginners`_

`Configuring Varnish 3 for Drupal 7`_


.. _`Jeff Geerling's Post on Drupal 8 and Varnish`: http://www.jeffgeerling.com/blog/2016/use-drupal-8-cache-tags-varnish-and-purge

.. _`Caching Overview from Drupal`: https://www.drupal.org/docs/7/managing-site-performance-and-scalability/caching-to-improve-performance/caching-overview

.. _`Whole new Drupal-Varnish Configuration`: https://www.drupal.org/docs/7/caching-to-improve-performance/varnish-cache

.. _`Varnish for beginners`: https://dev.acquia.com/blog/explaining-varnish-beginners

.. _`Managing Project with Varnish`: https://www.drupal.org/project/varnish

.. _`Configuring Varnish 3 for Drupal 7`: https://fourkitchens.atlassian.net/wiki/display/TECH/Configure+Varnish+3+for+Drupal+7

.. _`Drupal 8 Cache`: https://pantheon.io/docs/drupal-8-cache/

.. _`Purge`: https://www.drupal.org/project/purge

.. _`Generic HTTP Purger`: https://www.drupal.org/project/purge_purger_http
