
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

You recommend you use the **VCL Migrator** at your own liability.

VCL Migrator
............

The **VCL Migrator** is a script named varnish3to4 which will help you migrate
from varnish 3 to 4. There has been quite a lot of syntactical changes in the
VCL codes from Varnish 3 to 4. It is not quite intensive, but using the script
to migrate can help save you time and will also point out to you the new changes.
This amis to make your future vcl configuring easier.

You can download the `varnish3to4 script here`_

.. _`varnish3to4 script here`: https://github.com/fgsch/varnish3to4

All details and updates are included in the link. So you may use it at your own responsibility.
