.. _drupal_step_by_step:

*****************************************************
STEP BY STEP GUIDE TO MAKING YOUR drupal SITE FLY
*****************************************************

go through some of the common steps required to install and configure Varnish
and integrate it with drupal to take your site to the next level.

1. Installing Drupal 8 from the `Drupal-Site`_
===============================================

2. :ref:`Installing Varnish <tut_varnish>`
==========================================

3. How to place Drupal 8 behind Varnish
=======================================

So now that you have setup Varnish in-front of your Drupal 8 installation, you
need to know how to configure Drupal to listen to your varnish.
So that varnish can serve your clients.










4. Restart services after making changes
========================================

.. literalinclude:: /snippets/snippet2_restart_systemd
  :language: c







.. _`Drupal-Site`: https://www.drupal.org/8

.. toctree::
  :hidden:

  /start/tut_varnish
