.. _troubleshooting_varnish:


Troubleshooting Varnish
=======================

For details on troubleshooting varnish,
look at the user guide `Troubleshooting Varnish Section`_


**Have you tried turning your varnish off and on again?**


Reload varnish
..............



Stop and Start Varnish
......................


Restart Varnish
...............



**Still NOT working???**

Try to start Varnish in debug mode!
===================================

For systemv users:

.. literalinclude:: /vcl/vclex_varnishstart_debugmode.vcl
  :language: c

For systemd users:

.. literalinclude:: /vcl/vclex_varnishstart_debugmode.vcl
  :language: c


Varnish is crashing?
====================

panics
------



segfaults
---------


Varnish gives me Guru Meditation
================================



Varnish is not Caching
======================

If your varnish is not caching you can follow our simple steps to receive high hit-rate or
follow the detailed `User Guide`_

.. _`User Guide`: https://www.varnish-cache.org/docs/4.1/users-guide/increasing-your-hitrate.html#users-guide-increasing-your-hitrate



.. _`Troubleshooting Varnish Section`: https://www.varnish-cache.org/docs/4.1/users-guide/troubleshooting.html#users-trouble
