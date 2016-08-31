.. _varnish:

Get Varnish
===========

You have two choices:

- Install Binary Packages
- Compile It yourself from source code

We have packages for a bunch of operating systems and we have the open source
project available on github.

Installing Varnish with Binary Packages
***************************************

If you just want to get started with installation on your machine.

Requirements
------------

Your choice of Operating System.

Choosing OS
-----------

FreeBSD
.......

Binary package:

.. code-block: c

  pkg_add -r varnish

From source:

.. code-block: c

  cd /usr/ports/varnish && make install clean

Red Hat / CentOS
----------------

Latest version available as prebuilt RPMs (el5 and el6) on repo.varnish-cache.org.

See the online Red Hat installation instructions for more information.

Varnish is included in the EPEL repository, however due to incompatible syntax
changes in newer versions of Varnish, only older versions are available.

We therefore recommend that you install the latest version directly from our repository, as described above.

Debian/Ubuntu
-------------

Varnish is distributed with both Debian and Ubuntu.

Try

.. code-block: c

  sudo apt-get install varnish

Please note that this might not be the latest version of Varnish.
If you need a later version of Varnish, please follow the online installation
instructions for Debian or Ubuntu.

Compiling Varnish from source
*****************************

If there are no binary packages available for your system,
or if you want to compile Varnish from source for other reasons, follow these steps:

Download the appropriate release tarball, which you can find on http://repo.varnish-cache.org/source/ .

Alternatively, if you want to hack on Varnish, you should clone our git repository by doing:

.. code-block: c

  git clone https://github.com/varnishcache/varnish-cache

Requirements
------------

Build dependencies on Debian / Ubuntu
-------------------------------------

In order to build Varnish from source you need a number of packages installed. On a Debian or Ubuntu system these are:

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
---------------------------------------

To build Varnish on a Red Hat or CentOS system you need the following packages installed:

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
------------------------------------

As of SmartOS pkgsrc 2015Q4, install the following packages:

.. code-block: c

        pkgin in autoconf automake libedit libtool ncurses \
        pcre graphviz py27-sphinx python27 gmake gcc49 \
        pkg-config

Optionally, to pull from a repository:

.. code-block: c

  pkgin in git


Building Varnish
----------------

The configuration will need the dependencies above satisfied. Once that is taken care of:

.. code-block: c

  cd varnish-cache
  sh autogen.sh
  sh configure
  make

The configure script takes some arguments, but more likely than not you can
forget about that for now, almost everything in Varnish can be tweaked with run time parameters.

Before you install, you may want to run the test suite, make a cup of tea while it runs, it usually takes a couple of minutes:

.. code-block: c

  make check

Don't worry if one or two tests fail, some of the tests are a bit too timing sensitive (Please tell us which so we can fix them.) but if a lot of them fails, and in particular if the b00000.vtc test fails, something is horribly wrong, and you will get nowhere without figuring out what.

Installing
..........

And finally, the true test of a brave heart:

.. code-block: c

  sudo make install

Varnish will now be installed in /usr/local.
The varnishd binary is in /usr/local/sbin/varnishd.
To make sure that the necessary links and caches of the most recent shared
libraries are found, run

.. code-block: c

  sudo ldconfig

Using Source: https://www.varnish-cache.org/docs/trunk/installation/install.html#compiling-varnish-from-source

.. toctree::
  :hidden:
  :maxdepth: 1

  builtin_vcl
  multiple_varnishes
  run_varnish
  sample_vclTemplate
  troubleshooting_varnish
  varnish_ubuntu
  varnish_test
  varnishCacheVersions
  vcl
  vclex_cacheEx
