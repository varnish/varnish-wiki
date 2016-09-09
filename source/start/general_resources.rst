.. _general_resources:

Resources
=========

Varnish
-------

Architect notes: https://www.varnish-cache.org/docs/trunk/phk/notes.html


Do you VCL?
-----------

Try VCL: http://www.vclfiddle.net/160719-347454b/0


VCL Trans on Canvas
--------------------

http://vsltrans.varnish.jp/ on github https://github.com/xcir/vsltrans

`Xcir presentation on Varnish`_

.. _`Xcir presentation on Varnish`: http://www.slideshare.net/xcir/varnish-user-group-meeting-7final-ver


Migrating Varnish 3to4
----------------------

https://github.com/fgsch/varnish3to4/


Varnish 4.0 Configuration Templates
-----------------------------------

https://github.com/mattiasgeniar/varnish-4.0-configuration-templates

Tools to parse varnishlog
-------------------------

https://github.com/cosimo/vlogdump

.. _vcl_resources:


Examples for VCL
----------------

-  https://github.com/espebra/varnish-vcl-snippets
-  https://github.com/fgsch/vcl-snippets
-  https://www.varnish-cache.org/trac/wiki/VCLExamples (mostly outdated)
-  https://github.com/metabrainz/3scale-vcl.git
-  https://github.com/mattiasgeniar/varnish-3.0-configuration-templates.git
-  https://github.com/mattiasgeniar/varnish-4.0-configuration-templates.git
-  https://github.com/NITEMAN/varnish-bites
-  `Introduction to Varnish VCL`_

.. _Introduction to Varnish VCL: http://www.slideshare.net/paxdickinson/introduction-to-varnish-vcl

HowTo Modules
-------------

-  `Testing VMODs with Travis.CI, 2013.09`_
-  `The essential vmods all Varnish users should know about, 2013.07`_
-  `Building a Varnish VMOD on Debian, 2013.07`_
-  [Setting client.ip in Varnish VCL with libvmod-ipcast,
   2013.07](http://lassekarstensen.wordpress.com/2013/07/22/setting-client-ip-in-varnish-vcl-with-libvmod-ipcast$
-  `Creating a Varnish 4 module, 2013.07`_

.. _Testing VMODs with Travis.CI, 2013.09: http://lassekarstensen.wordpress.com/2013/09/10/testing-vmods-with-travis-travis-ci-org/
.. _The essential vmods all Varnish users should know about, 2013.07: https://www.varnish-software.com/blog/essential-vmods-all-varnish-users-should-know-about
.. _Building a Varnish VMOD on Debian, 2013.07: http://lassekarstensen.wordpress.com/2013/07/29/building-a-varnish-vmod-on-debian/
.. _Creating a Varnish 4 module, 2013.07: http://blog.zenika.com/index.php?post/2013/07/31/Creating-a-Varnish-4-module



-  `Creating Deb Package with all the popular VMODS, 2013.09`_

-  `Scaling Django to 8 Billion Page Views, 2013.09 (disqus)`_
-  `Global Varnish Cluster with GeoDNS`_

-  [How to build your own CDN using BIND, GeoIP, Nginx, and Varnish,
   2010.07](http://blog.unixy.net/2010/07/how-to-build-your-own-cdn-using-bind-geoip-nginx-and-varnis$

-  `Ultra-Performant Dynamic Websites with Varnish - Lidl.de, 2012.01`_
-  `Realtime stats from Varnish, 2013.02`_
-  `Context-aware HTTP caching, 2012.09`_
-  `Simple scales faster and better in the real world - Video`_
-  `Setup Varnish as an API Proxy`_
-  `Varnish in Five Acts, 2013.05`_
-  `Packaging Varnish VMODs, 2013.06`_
-  `Varnish trick: Serve stale content while refetching, 2012.10`_
-  `Varnishncsa and std.log()`_
-  `Using Varnish For Paywalls: Moving Logic To The Edge`_
-  `Withstanding DDOS attacks with Varnish and COTS hardware, 2013.04`_

Invalidation/Purging
--------------------

-  `Tagged Cache Invalidation, 2012.09`_
-  `Varnish in Five Acts, 2013.05`_

.. _`Tagged Cache Invalidation, 2012.09`: http://blog.kevburnsjr.com/tagged-cache-invalidation
.. _`Varnish in Five Acts, 2013.05`: http://dev.theladders.com/2013/05/varnish-in-five-acts/

Slides
------

-  `Varnish @ Angrybirds - Overview for a High Performance Shop,
   2013.09`_
-  `Caching is Hard: Varnish @ Disqus, 2013.05`_
-  `Lost in Translation:varnishlog, varnishtest(VUG7), 2013.05`_
-  `How Varnish & MongoDB Scale Business Insider, 2013.05`_
-  `Varnish at the BBC, 2012.10`_
-  `Varnish @ VGnet`_
-  `Varnish @ Holiday-extras.com`_
-  `Varnish @ Opera`_
-  `dClass and Varnish`_
-  `Wetter.com case study, 2012.06`_
-  `Loadbalancing 101`_
-  `Varnish @ Lanyrd, 2013.03`_
-  `Varnish @ Kiveda, 2013.05`_
-  `Varnish Paywall (commercial product), 2013.03`_

.. _Creating Deb Package with all the popular VMODS, 2013.09: https://github.com/mindreframer/vagrant-varnish-vmods-builder
.. _Scaling Django to 8 Billion Page Views, 2013.09 (disqus): http://blog.disqus.com/post/62187806135/scaling-django-to-8-billion-page-views
.. _Global Varnish Cluster with GeoDNS: http://www.slideshare.net/kimlindholm/globalvarnish-cluster-with-geodns
.. _Ultra-Performant Dynamic Websites with Varnish - Lidl.de, 2012.01: http://blog.mgm-tp.com/2012/01/varnish-web-cache/
.. _Realtime stats from Varnish, 2013.02: http://jiboumans.wordpress.com/2013/02/27/realtime-stats-from-varnish/
.. _Context-aware HTTP caching, 2012.09: http://asm89.github.io/2012/09/26/context-aware-http-caching.html
.. _Simple scales faster and better in the real world - Video: http://vimeo.com/album/2525252/video/74388108
.. _Setup Varnish as an API Proxy: https://support.3scale.net/howtos/api-configuration/varnish
.. _Varnish in Five Acts, 2013.05: http://dev.theladders.com/2013/05/varnish-in-five-acts/
.. _Packaging Varnish VMODs, 2013.06: http://www.kreuzwerker.de/en/blog/packaging-varnish-vmods/
.. _`Varnish trick: Serve stale content while refetching, 2012.10`: http://lassekarstensen.wordpress.com/2012/10/11/varnish-trick-serve-stale-content-while-refetching/
.. _Varnishncsa and std.log(): http://lassekarstensen.wordpress.com/2012/06/15/varnishncsa-and-std-log/
.. _`Using Varnish For Paywalls: Moving Logic To The Edge`: http://highscalability.com/blog/2012/9/12/using-varnish-for-paywalls-moving-logic-to-the-edge.html
.. _Withstanding DDOS attacks with Varnish and COTS hardware, 2013.04: https://www.varnish-software.com/blog/withstanding-ddos-attacks-varnish-and-cots-hardware

.. _Varnish @ Angrybirds - Overview for a High Performance Shop, 2013.09: http://www.slideshare.net/aoepeople/angrybirds-overview-for-a-high-performance-shop-stockholm
.. _`Caching is Hard: Varnish @ Disqus, 2013.05`: https://speakerdeck.com/mattrobenolt/caching-is-hard-varnish-at-disqus
.. _`Lost in Translation:varnishlog, varnishtest(VUG7), 2013.05`: http://www.slideshare.net/xcir/varnish-user-group-meeting-7final-ver
.. _How Varnish & MongoDB Scale Business Insider, 2013.05: http://www.slideshare.net/paxdickinson/scaling-business-insider
.. _Varnish at the BBC, 2012.10: http://www.slideshare.net/grahamlyons/varnish-at-the-bbc
.. _Varnish @ VGnet: http://www.vg.no/presentations/slides/VUG2012.html

.. _Varnish @ Holiday-extras.com: https://www.varnish-cache.org/sites/default/files/10_Varnish_Presentation_Holidays-Extras.pdf
.. _Varnish @ Opera: http://www.slideshare.net/cstrep/vug5-varnish-at-opera-software/
.. _dClass and Varnish: http://www.slideshare.net/rezanaghibi/dclass
.. _Wetter.com case study, 2012.06: https://speakerdeck.com/gaylord/wettercom-case-study-on-symfony_live-2012-paris
.. _Loadbalancing 101: https://speakerdeck.com/bradwhittington/load-balancing-101
.. _Varnish @ Lanyrd, 2013.03: https://speakerdeck.com/andrewgodwin/inside-lanyrds-architecture
.. _Varnish @ Kiveda, 2013.05: https://speakerdeck.com/dzuelke/surviving-a-prime-time-tv-commercial-sfliveportland2013-2013-05-23
.. _Varnish Paywall (commercial product), 2013.03: http://lassekarstensen.files.wordpress.com/2013/03/rl-paywall-2013-03.pdf

Misc
-----

-  `Varnish Utilities`_
-  [The Varnish Agent is a REST interface to the Varnish CLI and shmlog,
   adding a bit of persistence to allow remote control of
   Varnish](https://github.com/varnish/vag$
-  `Test framework written in Ruby to test varnish-cache routing and
   caching logic`_
-  [Varnish Bans Manager (VBM) is a simple server and web UI designed to
   ease management of bans in complex Varnish
   deployments](https://github.com/dot2code/varnish-ba$
-  `Varnish Security Firewall`_
-  `Re-format tool for vsl(varnishlog)`_
-  `Learn Varnish + Django simple docs`_
-  `Balancer in general`_


..  _`Balancer in general`: https://github.com/observing/balancerbattle
.. _Varnish Utilities: https://www.varnish-cache.org/utilities
.. _Test framework written in Ruby to test varnish-cache routing and caching logic: https://github.com/TV4/Urushiol.git
.. _Varnish Security Firewall: https://github.com/comotion/VSF.git
.. _Re-format tool for vsl(varnishlog): https://github.com/xcir/vsltrans.git
.. _Learn Varnish + Django simple docs: https://github.com/nychng/learn-varnish

- `A story about IP-based access control`_
- `Five step Varnish Installation Guide`_
- `Monitoring Health in Varnish Cache`_
- `Using Systemctl to Manage Systemd Services and Units`_

.. _`A story about IP-based access control`: https://info.varnish-software.com/blog/failure-to-purge-a-story-about-client.ip-and-proxies
.. _`Five step Varnish Installation Guide`:  https://info.varnish-software.com/blog/install-and-test-varnish-in-5-steps
.. _`Monitoring Health in Varnish Cache`: https://info.varnish-software.com/blog/blog-sysadmin-monitoring-health-varnish-cache
.. _`Using Systemctl to Manage Systemd Services and Units`: https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units



Books
-----

-  `Varnish System Administration`_
-  `Varnish Cache inline-C/VMOD guide book`_

.. _Varnish System Administration: https://www.varnish-software.com/static/pdfs/varnish-book-4.2-dirty.pdf
.. _Varnish Cache inline-C/VMOD guide book: https://github.com/xcir/C81-VarnishCache-inline-C-VMOD-guidebook
