varnish-wiki
============

This project is a Varnish Software initiative for the purpose of creating 
better documentation for the general Web Developer and Varnish Community.
The material supports Varnish Cache and Varnish Cache Plus 4.1.

Requirements
~~~~~~~~~~~~

To follow the tutorials, examples and snippets in this wiki, we recommend
the usage of these versions of Varnish:

* Varnish Cache 4.1
* Varnish Cache Plus 4.1

We did our testing we used Ubuntu LTS 16.04 (Xenial).

Building the wiki
~~~~~~~~~~~~~~~~~

This wiki is a statically generated site. If you want to build it yourself
we recommend you use Ubuntu LTS 16.04 (Xenial) as the OS as well as:

* Python 2.7 and friends:
 * pip
 * sphinx (tested with 1.3.6 and 1.4.8)
 * sphinx_bootstrap_theme
* Git (to fetch from and send your changes to Github)

Optional
........

* Mercurial (Optional, to clone the Pygments repo from Bitbucket)
* Pygments (Optional). You cannot install it with 'pip' as you will need the yet-to-be-released 2.2 which includes VCL lexers thanks to @KristianLyng. Install this by cloning the pygments repo and doing a local (user) install::

        $ hg clone https://bitbucket.org/birkenfeld/pygments-main
        $ cd pygments-main
        $ python setup.py build
        $ python setup.py install --user
  

Copyright
~~~~~~~~

* © 2016-2017, Varnish Software Group

Authors
~~~~~~~

See AUTHORS file

License
~~~~~~

This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/ or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
