.. _drupal_step_by_step:


Step-by-step guide to making your Drupal website fly
====================================================

Let's go through some of the common steps required to install and configure Varnish
and integrate it with Drupal to take your site to the next level.

This article assumes that you have a running instance of Magento2 and that you
have administrator rights for said instance, both at the OS and application level.
We have tested this using Ubuntu LTS 16.04, Varnish Cache 4.1 and Drupal 8.

If you still need help Installing Drupal 8 visit the `Drupal-Site`_

1. Installing Varnish
---------------------

In case you also do not have Varnish, you will need to follow the instructional
section on how to :doc:`Install Varnish </content/tutorials/varnish/varnish_ubuntu>`
before we can continue.

.. _drupal_integration:

2. How to place Drupal 8 behind Varnish
---------------------------------------

Now that you have set up Varnish in-front of your Drupal 8 installation, and
have apache2 configured, you need to know how to configure Drupal to purge cached
content. By default anonymous page caching is enabled.

To configure caching in Drupal, log in as an administrator on your Drupal site.

- Go to the Configuration Menu
- Click on Performance
- Locate Caching and check both the boxes
    x Cache pages for anonymous users (checked by default)
    x Cache blocks
- Set the Minimum cache lifetime; ~ 60min
- Set Expiration of cached pages; ~ 60min

For Drupal's Performance settings go to `/admin/config/development/performance`.

Set the value for 'Page cache maximum age' as shown below:

.. image:: /image/1-set-page-cache-max-age.png
  :alt: Sphinx Neo-Hittite
  :align: center
  :width: 500px

Always choose caching time keeping in mind both better site performance and the need
to ensure that the cache is not stale for too long. This value will solely depend on the type of site
you have, its content and what it purpose it serves. 

Drupal does two things:

a. It sends the Purge-Cache-Tags header with every request,
    containing a space-separated list of all the page's cache tags.
b. It also sends a BAN request with the appropriate cache tags whenever content
    or configuration is updated that should expire pages with the associated
    cache tags.

Both of these can be achieved quickly and easily by enabling and configuring the
`Purge` and `Generic HTTP Purger` modules. Read about the suggested plugins on
on our main page.

Next you need to add a 'purger' that will send the appropriate BAN requests
using purge_purger_http: visit the Purge configuration page,
`admin/config/development/performance/purge`,

Then follow the steps below as in the image:

i. Add a new purger

.. image:: /image/2-add-purger.png
  :alt: Sphinx Neo-Hittite
  :align: center
  :width: 500px


ii. Choose 'HTTP Purger' and click 'Add':

.. image:: /image/3-http-purger.png
  :alt: Sphinx Neo-Hittite
  :align: center
  :width: 500px


iii. Configure the Purger's name ("Varnish Purger"), Type ("Tag"), and Request
settings (defaults for Drupal VM are hostname 127.0.0.1, port 81, path /,
method BAN, and scheme http):

.. image:: /image/4-http-purger-request.png
  :alt: Sphinx Neo-Hittite
  :align: center
  :width: 500px

iv. Configure the Purger's headers (add one header Purge-Cache-Tags with the
value [invalidation:expression]):

.. image:: /image/5-http-purger-header-cache-tags.png
  :alt: Sphinx Neo-Hittite
  :align: center
  :width: 500px

Note from the Original Author: **Don't use the header in the screenshot—use Purge-Cache-Tags!**

Images and textual courtesy: `Jeff Geerling's Post on Drupal 8 and Varnish`

- Lastly Save the configuration and test that Varnish is working.
- Then move on to more advanced stuff; personalized caching is a recommendation.

This is a basic configuration for Varnish and Drupal; to go into more depth, use VCL
to write your own customized code. This wiki contains some templates and examples.

3. Caching
----------

Varnish caches everything, so you need to write a rule to exclude what you do not
want to cache.

By default, Varnish caches two types of requests: GET and HEAD.
Other requests like DELETE, POST and PUT are never cached. That means you do not
have to worry about requests that make changes to data because they are allowed
to get to the application.

4. Excluding URLS
-----------------

Pages protected using HTTP Authorization are never cached.
For your application-specific mechanisms, you need to add a rule such as
the following to ensure that login pages aren't cached.

.. literalinclude:: /content/examples/drupal_exclude_url.vcl
  :language: VCL

If we did end up caching login pages, we could end up serving the same content
to all users, which brings us to our next topic: Cookies!

5. Cookies
----------

Cookies are everywhere these days! And we need some of them.
But they are also one of the most important things in the caching decision.
Making a choice between which cookies to cache or include is very important for
a web application.

Examples such as your site statistics analysis or your website indexing require
cookies too. But these are not used by your Drupal site at all but if they didn't
exist on your site, your web content wouldn't be indexed for searches. Either way
these cookies make your site's content uncacheable and therefore you as the developer
have to make caching choices very carefully.

On the other hand, cookies related to page designs and other static content need
to be allowed to cache. Below is an example of caching cookies for your Drupal site:

.. literalinclude:: /content/examples/vclex_drupal_cachecookies.vcl
  :language: VCL

6. Drupal Caching Headers
-------------------------

Drupal sends its own caching information in response headers just like many other
web applciations. These headers are obviously important to your web application
and if you configure your Varnish to never cache any response, this could destabilize
your web application. So you need add some configurations to your VCL code that
will cache your Drupal header responses but not cache other headers.

7. Purging
----------

This bit of code is to govern which IP addresses can access the config files.

.. literalinclude:: /content/examples/allow_purging.vcl
  :language: VCL

8. Restart services after making changes
----------------------------------------

Don't forget to restart after making changes:

.. literalinclude:: /content/examples/snippet2_restart_systemd
  :language: VCL

9. Go further
-------------

If you are interested in Varnish, you can always give Varnish Plus a go with a
free trial. You can capture real-time traffic statistics,
create a paywall for premium content, simultaneously work on administration
across all Varnish servers, record relationships between web pages for easy
content maintenance, detect devices used for browsing, accelerate APIs and more.

.. _`Drupal-Site`: https://www.drupal.org/8

.. _`Jeff Geerling's Post on Drupal 8 and Varnish`: http://www.jeffgeerling.com/blog/2016/use-drupal-8-cache-tags-varnish-and-purge
