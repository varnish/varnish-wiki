
.. _varnish_versions:

Which version of Varnish to use?
================================

We recommend that you always choose to use the latest stable release.


**Varnish 3** - *end of life*


`What is new in Varnish 4?`_

.. _`What is new in Varnish 4?`: http://book.varnish-software.com/4.0/chapters/Introduction.html#what-is-new-in-varnish-4

`Upgrading to Varnish 4`_

.. _`Upgrading to Varnish 4`: https://www.varnish-cache.org/docs/trunk/whats-new/upgrading.html

**Migrating to Varnish 4?**

We advise that you should use the **VCL Migrator** at your risk.

VCL Migrator
............

The **VCL Migrator** is a script named varnish3to4, which will help you migrate
from Varnish 3 to 4. There have been numerous syntactical changes in the
VCL codes from Varnish 3 to 4. It is not quite intensive, but using the script
to migrate can help save you time and will also make the new changes visible for you.
This aim is to make your future VCL configuration work easier.

You can download the `varnish3to4 script here`_

.. _`varnish3to4 script here`: https://github.com/fgsch/varnish3to4

All details and updates are included in the link. You assume full responsibility for your use.
