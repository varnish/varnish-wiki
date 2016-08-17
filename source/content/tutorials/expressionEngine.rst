.. _expressionEngine:

*****************************
Expression Engine and Varnish
*****************************

Expression Engine is another powerful Digital Content Delivery Platform from the
creator of CodeIgniter (agile, open-source framework).


Resources
.........

Overview on Varnish 4 with Expression Engine: https://rye.agency/blog/using-varnish-with-expressionengine

Making Expressions Engine Sites Fly with varnish: https://ellislab.com/blog/entry/making-sites-fly-with-varnish
(this post is for varnish 3 configuration, other then that it's a great explanation to move forward)

Controlling the cache Using ESI: https://www.smashingmagazine.com/2015/02/using-edge-side-includes-in-varnish/

Server Security Issues: https://ellislab.com/blog/entry/http-host-and-server-name-security-issues




A sample default VCL for Expression Engine
..........................................

.. literalinclude:: /content/templates/vcl_defaultEE_andrew.vcl
  :language: c




source: https://gist.github.com/andrewfairlie/72f42dcdaacc8faaf1da

Collected: 16th August 2016
