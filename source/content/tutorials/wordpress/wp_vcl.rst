.. _wp_vcl:

Some Sample VCL for WordPress
=============================

Ignoring AJAX requests
......................

.. code-block:: VCL

    if (req.http.X-Requested-With == "XMLHttpRequest") {
        return(pass);
    }

Post requests will not be cached
................................

.. code-block:: VCL

  if (req.http.Authorization || req.method == "POST") {
    return (pass);
  }

Only caching GET or HEAD requests
.................................

This makes sure the POST requests are always passed.

.. code-block:: VCL

  if (req.method != "GET" && req.method != "HEAD") {
    return (pass);
  }


Preventing post and edit pages from being cached
................................................

.. code-block:: VCL

    if (req.url ~ "(wp-admin|post\.php|edit\.php|wp-login)") {
        return(pass);
    }
    if (req.url ~ "/wp-cron.php" || req.url ~ "preview=true") {
        return (pass);
    }

Remove the "has_js" cookie
..........................

.. code-block:: VCL

    set req.http.Cookie = regsuball(req.http.Cookie, "has_js=[^;]+(; )?", "");


Remove the wp-settings-1 cookie
...............................

.. code-block:: VCL

  set req.http.Cookie = regsuball(req.http.Cookie, "wp-settings-1=[^;]+(; )?", "");


Remove the wp-settings-time-1 cookie
....................................

.. code-block:: VCL

    set req.http.Cookie = regsuball(req.http.Cookie, "wp-settings-time-1=[^;]+(; )?", "");


Remove the wp test cookie
.........................

.. code-block:: VCL

  set req.http.Cookie = regsuball(req.http.Cookie, "wordpress_test_cookie=[^;]+(; )?", "");


Remove the PHPSESSID in members area cookie
...........................................

.. code-block:: VCL

  set req.http.Cookie = regsuball(req.http.Cookie, "PHPSESSID=[^;]+(; )?", "");


source: http://www.psynapticmedia.com/varnish-4-example-with-apache-wordpress-woocommerce/
Collected: 16th August 2016
