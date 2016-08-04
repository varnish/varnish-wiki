.. _wp_step_by_step:

*****************************************************
STEP BY STEP GUIDE TO MAKING YOUR wordpress SITE FLY
*****************************************************

STEP-BY-STEP: SPEED UP WORDPRESS WITH VARNISH SOFTWARE

This article was originally written by Web Designer Magazine - http://www.webdesignermag.co.uk/

Also Published on www.varnish-software.com by Federico G. Schwindt

**Important Note**

The installation included in the original article was for systemv.
Now that ssytemd is everywhere, we replaced the installation section with a link
to systemd varnish installations.

Increase the performance of Wordpress using Varnish, and optimize your
content-heavy sites Nobody like to wait ages for a page to load. If your site is
slow, people will go somewhere else before they can read that great article you
wrote. Page speed is still an issue for many sites and recent studies show that
40 percent of users will abandon your site if it takes more than three seconds
to load. this is where Varnish comes in. Varnish is an HTTP accelerator or caching
HTTP HTTP reverse proxy. It receives requests from clients and tries to answer
them from the cache. If it cannot answer from the cache it will forward it to the
origin server, fetch the response, store it in cache and deliver it to the client.
When Varnish has a cached response ready, it is typically delivered in a matter
of microseconds: two orders of magnitude faster than the average origin server,
so make sure that Varnish answers as much as possible from the cache.

In this tutorial, we will go through some of the common steps required to install
and configure Varnish and integrate it with WordPress to take your site to the
next level. Let’s get started.


1. :ref:`Install Varnish <tut_varnish>`

2. Add the plugin

After installing Varnish we need to instruct WordPress to purge the cached content
whenever it is modified. There are several plugins to achieve this.

In this tutorial we will use `Varnish HTTP Purge Plugin`_ . Go to the WordPress dashboard,
click on Plugins Add New and search for ‘Varnish HTTP Purge Plugin’__ . Click on ‘Install Now’
and confirm. Finally, activate it.

3. Enable custom permalinks

For the Varnish HTTP Purge plugin to work correctly we need to enable mod_rewrite
and use a custom URL structure for permalinks and archives. In the WordPress
dashboard click on Settings Permalinks and select ‘Custom Structure’.

Then type /%year%/%monthnum%/%post_id% and click on ‘Save Changes’.
To finalize, open a command prompt and run the following as root.

`a2enmod rewrite`

4. Move Apache

Before we configure Varnish to handle all the web traffic to our WordPress site,
we will need to move Apache to a different port. Let’s then change all occurrences
of port 80 with a text editor in /etc/apache2/ports.conf and any files under
/etc/apache2/sites-enabled/ to 8080.


5. Serve from Varnish (new changes included in the `Varnish Tutorial <tut_varnish>`)


6. Set the backend

Varnish uses the concept of backend or origin server to define where it should
retrieve the content from if it’s not persistent in its cache. In this case we will
be using the Apache location that we defined in Step 4.
Edit /etc/varnish/default.vcl with a text editor and ensure the following is present.

.. literalinclude:: /snippets/default_vcl
  :language: bash

7. Make it effective

Now that all the preparations are complete we are ready to start Varnish and
restart Apache. Once this is done, all traffic to our WordPress site will pass
through Varnish before it hits the Apache server. Open the command prompt again
and run the following as root.

.. literalinclude:: /snippets/snippet2_restart_systemd
  :language: c

8. Ignore cookies

By default. Varnish will not cache content for requests including the Cookie or
header or responses including the Set-Cookie header. WordPress sets many cookies
that are safe to ignore during normal browsing so let’s update /etc/varnish/default.vcl
and add the following inside vcl_recv to remove them.

.. literalinclude:: /snippets/wordpress_cookies.vcl
  :language: c

9. Exclude URLs

In most web applications there are some URLs that shouldn’t be cached no matter
what and WordPress is no exception. We will be excluding any admin or login
related pages from hitting the cache. Once again open /etc/varnish/default.vcl
and add the following before we remove the cookies from the previous step.

.. literalinclude:: /snippets/wp_exclude_url.vcl
  :language: c

10. Extend caching

Varnish uses the max-age parameter in the Cache-Control HTTP header to establish
how long the content is considered fresh before contacting the backend again.
Varnish will use 120 seconds by default if this value is missing or is equal to
zero. To extend this period to one hour we could update /etc/varnish/default.vcl.

.. literalinclude:: /snippets/extend_caching.vcl
  :language: c

11. Handling purge requests

Whenever existing content in WordPress is updated the `Varnish HTTP Purge Plugin`__
will ask Varnish to remove it from the cache. The next time it’s requested,
the most up-to-date version will be retrieved from the backend.
But in order to do this we will need to add the following codes at the top of
vcl_recv in /etc/varnish/default.vcl.

The first bit of code is to allow which IP addresses can access the config files.

.. literalinclude:: /snippets/allow_purging.vcl
  :language: c

This next one is for when purge requests are handled and how to handle them:

.. literalinclude:: /snippets/handle_purging.vcl
  :language: c



12. Secure purge

In the previous step we added the necessary code to handle purge requests but we
have left it open for anyone to do just that. Let’s add some code to restrict it.
Edit /etc/varnish/default.vcl and after the backend add the acl below using your
server IP address or hostname. Then modify the code in the previous step to use it.

.. literalinclude:: /snippets/secure_purge.vcl
  :language: c

13. Reload the configuration

Before our changes to etc/varnish/default.vcl take effect, Varnish needs to be
told to reread its configuration. To avoid any potential downtime, Varnish can
be instructed to reload the configuration while it keeps serving requests.
Open the command prompt again and type the following as root.

.. literalinclude:: /snippets/varnish_reload.sh
  :language: shell

14. Empty the cache

Chances are that as we worked our way through the configuration,
some content found its way into the cache even if it wasn’t supposed to.
In this situation we can use the `Varnish HTTP Purge Plugin`__ to empty the cache
and then we can start afresh. Go to the WordPress dashboard and click on Purge
Varnish at the very top.

15. Examine the traffic

Everything is working; browse some pages, login, logout, pages are loading fast.
Or are they? Varnish comes with a set of tools that will help you understand what’s
going on behind the scenes and debug any potential problems. To see the requests as
they are passing through Varnish run the following on a command prompt: `varnishlog`

16. Volume matcher/measure

Varnish is very powerful but can be daunting at first. Luckily for us there are
many resources online and has an active community behind ready to help. If you
are stuck or want to know more you can visit the `varnish cache website`_
*or search in our wiki for a solution* .

17. Go further

If you are interested in Varnish, you can always give Varnish Plus a go.
There’s a free trial available. You can capture real-time traffic statistics,
create a paywall for premium content, simultaneously work on administration
across all Varnish servers, record relationships between web pages for easy
content maintenance, detect devices used for browsing, and accelerate APIs.

Check out the links below to take Varnish even further.

.. _`varnish cache website`: https://varnish-cache.org
.. _`Varnish HTTP Purge Plugin`: https://wordpress.org/plugins/varnish-http-purge/

.. toctree::
  :hidden:

  /start/tut_varnish
