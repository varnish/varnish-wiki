.. _expressionEngine:


ExpressionEngine and Varnish
=============================

ExpressionEngine is another powerful digital content delivery platform from the
creator of CodeIgniter (agile, open-source framework).


Resources
.........

Overview on Varnish 4 with Expression Engine: https://rye.agency/blog/using-varnish-with-expressionengine

Making ExpressionEngine Sites Fly with Varnish: https://ellislab.com/blog/entry/making-sites-fly-with-varnish
(This post is for Varnish 3 configuration; other than that, it's a great explanation to move forward.)

Controlling the cache using ESI: https://www.smashingmagazine.com/2015/02/using-edge-side-includes-in-varnish/

Server security issues: https://ellislab.com/blog/entry/http-host-and-server-name-security-issues


A sample default VCL for ExpressionEngine
..........................................

.. literalinclude:: /content/templates/vcl_defaultEE_andrew.vcl
  :language: VCL



Source: https://gist.github.com/andrewfairlie/72f42dcdaacc8faaf1da

Collected: 16th August 2016
