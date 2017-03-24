
.. _varnish_versions:

Which version of Varnish to use?
================================

We recommend that you always choose to use the latest stable release.

**Varnish 3** - *end of life*

If you are still using **varnish 3**, it's time to let it go and move on to **varnish 4** and upwards.

The *most viral change* from **varnish 3 to 4** is how the complete thread model has changed;
In Varnish 3 - one thread served each client whether from the backend or the cache.
In Varnish 4 - there are two separate threads: one for client, one for backend.
This allows varnish to serve stale content to the client while refreshing
content in the background. 

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
