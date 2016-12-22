.. _varnish:

Use Varnish on your Website
===========================

.. toctree::
  :hidden:

  builtin_vcl
  multiple_varnishes
  run_varnish
  sample_vclTemplate
  troubleshooting_varnish
  varnish_ubuntu
  varnish_test
  varnishCacheVersions
  vcl
  vcl_examples

Varnish can cache any web based content, meaning any CMS, intranet, ReST/Web API, 
or Streaming media content can literally gain performance increases in the range 
of 300-1000x times compared to what standard web servers can provide.

But, before you get to Varnish, You want to **get Varnish**. You have two choices:

- Install **binary packages**
- Compile it yourself from **source code**

We have packages for a number of operating systems, and we have the open source
project available on Github.

If you plan to subscribe to Varnish Plus, check out `products at our website`_


**Installing Varnish with binary packages**
-------------------------------------------

To just get started with installation on your machine:

Requirements
............

Your choice of operating system, preferably UNIX.
Below we have some helpful commands to get you started with your choice of OS.

Choosing OS
-----------

FreeBSD
.......

Binary package:

.. code-block: bash

  pkg_add -r varnish

From source:

.. code-block: bash

  cd /usr/ports/varnish && make install clean


Red Hat / CentOS
................

The latest version is available as prebuilt RPMs (el5 and el6) on `repo.varnish-cache.org`_ .

See the online Red Hat installation instructions for more information.

Varnish is included in the EPEL repository, however due to incompatible syntax
changes in newer versions of Varnish, only older versions are available.

We therefore recommend that you install the latest version directly from our
repository, as described above.

Debian/Ubuntu
.............

Varnish is distributed with both Debian and Ubuntu.

Try

.. code-block: bash

  sudo apt-get install varnish

Please note that this might not be the latest version of Varnish.
If you need a newer version of Varnish for the OS version you are using,
please follow the instructions in the Varnish Book or as shown below.

.. code-block: bash

  $ curl https://repo.varnish-cache.org/ubuntu/GPG-key.txt | apt-key add -
  $ echo "deb https://repo.varnish-cache.org/ubuntu/ trusty varnish-4.0" >> \
  /etc/apt/sources.list.d/varnish-cache.list

If you are installing Varnish Cache 4.1, replace varnish-4.0 for varnish-4.1 in
the command above. Instructions for Debian and Ubuntu are the same.


**Compiling Varnish from source**
---------------------------------

If there are no binary packages available for your system,
or if you want to compile Varnish from source for other reasons, such as personal
interest or anything that counts as a reason, follow these steps:

Download the appropriate release tarball, which you can find on the `repository source`_ .

Alternatively, if you want to hack on Varnish, you should clone our git repository by doing:

.. code-block: bash

  git clone https://github.com/varnishcache/varnish-cache

Requirements
............

A UNIX machine or a Mac

Build dependencies on Debian / Ubuntu
......................................

In order to build Varnish from source you need a number of packages installed.
On a Debian or Ubuntu system these are:

.. code-block: bash

  automake
  autotools-dev
  libedit-dev
  libjemalloc-dev
  libncurses-dev
  libpcre3-dev
  libtool
  pkg-config
  python-docutils
  python-sphinx
  graphviz

Build dependencies on Red Hat / CentOS
......................................

To build Varnish on a Red Hat or CentOS system you need the following packages installed:

.. code-block: bash

  autoconf
  automake
  jemalloc-devel
  libedit-devel
  libtool
  ncurses-devel
  pcre-devel
  pkgconfig
  python-docutils
  python-sphinx
  graphviz


Build dependencies on a SmartOS Zone
....................................

As of SmartOS pkgsrc 2015Q4, install the following packages:

.. code-block: bash

        pkgin in autoconf automake libedit libtool ncurses \
        pcre graphviz py27-sphinx python27 gmake gcc49 \
        pkg-config

Optionally, to pull from a repository:

.. code-block: bash

  pkgin in git


Building Varnish
-----------------

Finally if you have all of the above **dependencies satisfied**. You can move on to
building your Varnish from *scratch*.

.. code-block: bash

  cd varnish-cache
  sh autogen.sh
  sh configure
  make

The configure script takes some arguments, but more likely than not you can forget
about that for now, almost everything in Varnish can be tweaked with runtime parameters.

Before you install, you may want to run the test suite, and make a cup of tea while
it runs, as it usually takes a couple of minutes:

.. code-block: bash

  make check

*Don't worry if* one or two tests fail; some of the tests are a bit too timing
sensitive. (Please tell us which so we can fix them.)

**BUT**

If a **lot of tests fail** and in particular if the **b00000.vtc test fails**,
something is horribly wrong, and you will get nowhere without figuring out what is causing all the chaos.

Good luck!

Installing
..........

And finally, the true test of a **brave heart!**

.. code-block: bash

  sudo make install

- Varnish will now be installed in /usr/local.
- The varnishd binary is in /usr/local/sbin/varnishd.
- To make sure that the necessary links and caches of the most recent shared
    libraries are found, run

.. code-block: bash

  sudo ldconfig

Using source: https://www.varnish-cache.org/docs/trunk/installation/install.html#compiling-varnish-from-source

.. _`products at our website`: https://www.varnish-software.com/products/varnish-plus
.. _`repo.varnish-cache.org`: https://repo.varnish-cache.org
.. _`repository source`: http://repo.varnish-cache.org/source/
