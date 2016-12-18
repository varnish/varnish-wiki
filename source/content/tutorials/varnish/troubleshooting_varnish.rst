.. _troubleshooting_varnish:


Troubleshooting Varnish
=======================

**Have you tried turning your Varnish off and on again?**

Reload Varnish
..............

.. code-block:: bash

  sudo systemctl reload varnish.service


Stop and start Varnish
......................

.. code-block:: bash

  sudo systemctl start varnish.service
  sudo systemctl stop varnish.service

Restart Varnish
...............

.. code-block:: bash

  sudo systemctl restart varnish.service


**Still NOT working???**

Try to start Varnish in debug mode!
-----------------------------------

For systemv users:

.. literalinclude:: /content/examples/vclex_startvarnish_debugmode.vcl
  :language: VCL

For systemd users:

.. literalinclude:: /content/examples/vclex_startvarnish_debugmode.vcl
  :language: VCL

Varnish is crashing?
--------------------

If your Varnish is crashing it might be due to a number of reasons.
Here are a few things you can try.

panics
......

You can inspect any panic messages by typing the following in the CLI:

.. code-block:: python

  panic.show


segfaults
.........

This is a Varnish segmentation error. When this happens with the child process
it is logged, the core is dumped and the child process starts up again.

If you need help solving your segfaults issue and can log onto our IRC channel
#varnish and get help or if have a subscription, please call us and we will help
you fix it.


Varnish gives me guru meditation
--------------------------------

To solve a issue like this, checkout varnishhlog.

You can set varnishlog to log all your 503 errors by issuing the following command:

.. code-block:: bash

  $ varnishlog -q 'RespStatus == 503' -g request

If the error happened just a short time ago the transaction might still be in
the shared memory log segment. To get varnishlog to process the whole shared
memory log just add the '-d' parameter:

.. code-block:: bash

  $ varnishlog -d -q 'RespStatus == 503' -g request


Varnish is not caching
----------------------

If your Varnish is not caching you can follow our simple steps to receive high hit rate or
follow the detailed `User Guide`_


For details on troubleshooting Varnish, look at the user guide
`Troubleshooting Varnish Section`_

.. _`User Guide`: https://www.varnish-cache.org/docs/4.1/users-guide/increasing-your-hitrate.html#users-guide-increasing-your-hitrate
.. _`Troubleshooting Varnish Section`: https://www.varnish-cache.org/docs/4.1/users-guide/troubleshooting.html#users-trouble
