.. _magento2_vcl:

Some sample VCL for Magento2
============================

Purging Magento2 pages
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

Cache only successful responses
...............................

.. literalinclude:: /content/templates/vcl_defaultMagento2_hummer.vcl
  :language: VCL
  :lines: 15,63-71,44

Setting debug mode for cache cache-control
..........................................

.. literalinclude:: /content/templates/vcl_defaultMagento2_hummer.vcl
  :language: VCL
  :lines: 15,73-75,44

Remove unused cookies
......................

.. literalinclude:: /content/templates/vcl_defaultMagento2_hummer.vcl
  :language: VCL
  :lines: 15,77-87,44
