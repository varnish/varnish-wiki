.. _drupal_step_by_step:

**************************************************
STEP BY STEP GUIDE TO MAKING YOUR drupal SITE FLY
**************************************************

go through some of the common steps required to install and configure Varnish
and integrate it with drupal to take your site to the next level.

1. Installing Drupal 8 from the `Drupal-Site`_
-----------------------------------------------

2. :ref:`Installing Varnish <varnish>`
------------------------------------------

3. How to place Drupal 8 behind Varnish
---------------------------------------

So now that you have setup Varnish in-front of your Drupal 8 installation, and
have apache2 configured, you need to know how to configure Drupal to purge cached
contents. By default the caching mechanism is disabled so all requests pass through
varnish and goes to the backend.

To enable caching in Drupal, log in as an administrator on your Drupal site.

- Go to the Configuration Menu
- Click on Performance
- Locate Caching and Check both the boxes
    x Cache pages for anonymous users
    x Cache blocks
- Set the Minimum cache lifetime; ~ 60min
- Set Expiration of cached pages; ~ 60min

Always choose caching time considering in mind a better site performance and yet
cache is not stale for too long. This value will soley depend on teh type of site
you have so good luck making that coice!

- Lastly Save the configuration and test that varnish is working.
- Then move on to more advanced stuff; personalized caching is a recommendation.

4. Caching
----------

Varnish caches everything, so you need to write a rule to exclude what you do not
want to cache.

Varnish by default caches to tyeps of requests: GET and HEAD.
Other requests like DELETE, POST and PUT are never cached. That means you donot
have to worry about requests that make changes to data, because they are allowed
to get to the application.

Excluding URLS
--------------

Pages protected using HTTP Authorization is never
cached. So for your application specific mechanisms, you need to add a rule like
the following to ensure that login pages aren't cached.

.. literalinclude:: /snippets/drupal_exclude_url.vcl

if we did end up caching login pages, we could end up serving the same content
to all the users. That takes us to our next topic, Cookies!

Cookies
-------

Cookies are everywhere these days! And we need some of them.
But they are also one of the most important things in the caching decision.
Making a choice between which cookies to cache or include is very important for
a web application.

Examples such as your site statistics analysis or your website indexing requires
cookies too. But these are not used by your drupal site at all but if they didn't
exist on your site, your web contents wouldn't be indexed for searches. Either way
these cookies makes your sites content uncacheable and therefore you as the developer
has to make caching choices very carefully.

On the other hand, cookies related to page designs and other static contents need
to be allowed to cache. Below is an example of caching cookies for your drupal site:

.. literalinclude:: /vcl/vclex_drupal_cachecookies.vcl


Drupal Caching Headers
----------------------

Drupal sends its own caching information in response headers just like many other
web applciations. These headers are obviously important to your web application
and if you configure your varnish to never cache any response, this could destabilize
your web application. So you need add some configurations to your vcl code that
will cache your drupal header responses but not cache other headers.

.. literalinclude:: /snippets/drupal_cacheheaders.vcl

Purging
-------

This bit of code is to allow which IP addresses can access the config files.

.. literalinclude:: /snippets/allow_purging.vcl
  :language: c


4. Restart services after making changes
----------------------------------------

Don't forget to restart after making changes:

.. literalinclude:: /snippets/snippet2_restart_systemd
  :language: c



.. _`Drupal-Site`: https://www.drupal.org/8

.. toctree::
  :hidden:

  /start/varnish
