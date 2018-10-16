varnish-wiki
============

This project is a Varnish Software initiative for the purpose of creating 
better documentation for the general Web Developer and Varnish Community.
The material supports Varnish Cache and Varnish Cache Plus 4.1.

The live site is currently online: https://www.varnish-software.com/wiki/


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

* Python 2.7, pip and friends:
 * easy_install pip
 * pip install sphinx (tested with 1.3.6 and 1.4.8)
 * pip install sphinx_bootstrap_theme
 * pip install pygments (2.2.0 or newer)
* Git (to fetch from and send your changes to Github)  

Using CentOS 7, the steps are:

* sudo yum install python-virtualenv
* virtualenv venv
* source venv/bin/activate
* pip install sphinx sphinx_bootstrap_theme pygments
* make html # In the wiki source directory

Deployment
~~~~~~~~~~

Create the static HTML from the GitHub repo
...........................................

1. git clone https://github.com/varnish/varnish-wiki/
2. See the README.rst (this document): https://github.com/varnish/varnish-wiki/blob/master/README.rst
3. Build the static site by using "make html"
4. Test that it works (specially random links and the search function)

You're done. Now you need to upload this to AWS S3 where the wiki is hosted.

Wiki Hosting in S3
..................

Configuration for this can be see in the Varnish Software Intranet, The HTML wiki is a S3 bucket:

* Bucket: varni.sh-docs
* Public URL: https://www.varnish-software.com/wiki
* S3 URL: http://varni.sh-docs.s3-website.eu-central-1.amazonaws.com
* Access Key ID: [private]
* Secret Access Key: [private]

To manage files in S3 we recommend you use awscli. To install latest version of awscli run:

* easy_install pip
* pip install awscli

To configure aws:

* cat s3
* aws configure
* AWS Access Key ID [********************]:
* AWS Secret Access Key [********************]:
* Default region name [None]: eu-central-1

To list files:

* aws s3 ls s3://varni.sh-docs/wiki/

To delete files:

* aws s3 rm --recursive s3://varni.sh-docs/

To upload files:

* aws s3 cp --recursive --acl public-read /directory-where-you-have-built-the-wiki-root/varnish-wiki/build/html/ s3://varni.sh-docs/wiki/

Copyright
~~~~~~~~

* © 2016-2018, Varnish Software Group

Authors
~~~~~~~

See AUTHORS file

License
~~~~~~

This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/ or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
