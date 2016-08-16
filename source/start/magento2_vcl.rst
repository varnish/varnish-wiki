.. _magento2_vcl:

Some Sample VCL for Magento2
============================

Purging Magento2 Pages
......................

.. literalinclude:: /vcl/vcl_defaultMagento2_hummer.vcl
  :language: c
  :lines: 15,16-25,44


Dealing with Magento-Vary header
................................

.. literalinclude:: /vcl/vcl_defaultMagento2_hummer.vcl
  :language: c
  :lines: 46-51

Managing HIT and MISS
......................

.. literalinclude:: /vcl/vcl_defaultMagento2_hummer.vcl
  :language: c
  :lines: 91-109

ESI
...

.. literalinclude:: /vcl/vcl_defaultMagento2_hummer.vcl
  :language: c
  :lines: 53,54-56,89

GZIP
....

.. literalinclude:: /vcl/vcl_defaultMagento2_hummer.vcl
  :language: c
  :lines: 15,58-60,44

Cache only Successful Responses
...............................

.. literalinclude:: /vcl/vcl_defaultMagento2_hummer.vcl
  :language: c
  :lines: 15,63-71,44

Setting Debug Mode for Cache Cache-Control
..........................................

.. literalinclude:: /vcl/vcl_defaultMagento2_hummer.vcl
  :language: c
  :lines: 15,73-75,44

Remove un-used Cookies
......................

.. literalinclude:: /vcl/vcl_defaultMagento2_hummer.vcl
  :language: c
  :lines: 15,77-87,44
