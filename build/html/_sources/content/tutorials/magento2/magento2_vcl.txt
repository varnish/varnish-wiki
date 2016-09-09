.. _magento2_vcl:

Some Sample VCL for Magento2
============================

Purging Magento2 Pages
......................

.. literalinclude:: /content/templates/vcl_defaultMagento2_hummer.vcl
  :language: VCL
  :lines: 15,16-25,44


Dealing with Magento-Vary header
................................

.. literalinclude:: /content/templates/vcl_defaultMagento2_hummer.vcl
  :language: VCL
  :lines: 46-51

Managing HIT and MISS
......................

.. literalinclude:: /content/templates/vcl_defaultMagento2_hummer.vcl
  :language: VCL
  :lines: 91-109

ESI
...

.. literalinclude:: /content/templates/vcl_defaultMagento2_hummer.vcl
  :language: VCL
  :lines: 53,54-56,89

GZIP
....

.. literalinclude:: /content/templates/vcl_defaultMagento2_hummer.vcl
  :language: VCL
  :lines: 15,58-60,44

Cache only Successful Responses
...............................

.. literalinclude:: /content/templates/vcl_defaultMagento2_hummer.vcl
  :language: VCL
  :lines: 15,63-71,44

Setting Debug Mode for Cache Cache-Control
..........................................

.. literalinclude:: /content/templates/vcl_defaultMagento2_hummer.vcl
  :language: VCL
  :lines: 15,73-75,44

Remove un-used Cookies
......................

.. literalinclude:: /content/templates/vcl_defaultMagento2_hummer.vcl
  :language: VCL
  :lines: 15,77-87,44
