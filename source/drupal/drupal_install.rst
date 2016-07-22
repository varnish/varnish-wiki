.. _drupal_install:


Installing VARNISH with Drupal
==============================

Varnish is an open source reverse proxy and HTTP accelerating tool. In addition it also provides caching. It is designed for dynamic websites with heavy content and also for heavily consumed APIs. Varnish helps in speeding up a server duirng high traffic durations by standing in front of the webservers and redirecting visitors whenever possible to static pages (cache) and giving them a smoother interface for browsing. The main server is only accessed during active processes when the cache cannot provide.

Varnish is a very powerful HTTP accelerator used by high profile, high traffic websites for load balancing their traffic. A lot of the websites out their are using drupal with Varnish.

This documentation will provide the simplest introduction to using Varnish with drupal.This tutorial is written using a simple drupal website as an example, but its general concepts can be used with larger applications of multiple sites and webservers.


Audience:
----------

This reference has been prepared for web developers to get them started with Varnish installation and configuration.

Prerequisites:
---------------

It is assumed that the user has root access, has LAMP and drupal installed on the server and is here to learn how to get varnish for their website.


Step 1 : Installing Varnish on Ubuntu/UNIX:
-------------------------------------------

It is recommended to install the varnish package from its repository.
Start by grabbing the repository:

	``sudo curl http://repo.varnish-cache.org/debian/GPG-key.txt | sudo apt-key add -``


Add the repository to the source list:

	``sudo nano /etc/apt/sources.list``


Add the repository by pasting the following line:

	``deb http://repo.varnish-cache.org/ubuntu/ trusty varnish-4.1``

Save and exit.


Now run update and install:

	``sudo apt-get update``
	``sudo apt-get install varnish``


Step 2: Configure VARNISH
--------------------------

Varnish comes with two configuration files:
One with the starter parameter:

	``/etc/default/varnish``

This file contains all the starter parameters.

	``/etc/varnish/default.vcl``

This file contains all the default policies. It also tells varnish where to find the web content.

1. Start with the first one;

	``nano /etc/default/varnish``

Here it not bound to web port 80 by default. To make it bound to port 80,
Browse down to Alternative 2 and Change port to 80.

Alternative 2::

	DAEMON _OPTS="-a :80\

		-T localhost:6082

		-f /etc/varnish/default.vcl

		-S /etc/varnish/secret

		-s malloc,256m"

-T : refers to which port manages this.

-f : refers to the other configuration file containing all the default policies. If you plan to change the name of the default policy file, make sure to come here and change the default.vcl to the given name.

-S : refers to the file containing secrets such as passwords etc.

-s : refers to the space varnish cache is allocated. 256m” is decided based on the current servers RAM of 1GB.

This is all the configuration changes in this file.


2. Next we will have a look at the other configuration file;

	``sudo nano /etc/varnish/default.vcl``

This file contains configuration that points to the content. This is by default set to 8080 and points to host as localhost as shown below.

	Backend default {

	     .host = “127.0.0.1”

	     .port = “8080”;

	}

It is recommended that if changes are made to these files, it should be copied and remaned name, because when varnish updates, it will replace any changes made with it’s new default.vcl and varnish file.

Other changes that are recommended based on your sites needs are;

1.the default varnish caching time. It is by default 120 seconds. This can be changed to be a smaller or larger duration.

2.drupal maybe difficult to cache with all its cookies. It is recommended to add a policy that drops cookies sent and fro drupal.



Step 3: Configure Apache2 to work with Varnish
-----------------------------------------------

We have already configured varnish to point at port 8080 for server contents. However the default listening port for apache2 is port 80 which needs to be changed to 8080.


	``sudo nano /etc/apache2/ports.conf``

	``Listen 8008 #listen on port 8080``


In this case the LAMP and Varnish have been cofigured on the same machine for this tutorial. However, if there is more then one webserver running, make sure to make this change on all the webservers and also change the server name.


Step 4: Restart
-------------------
It is always required to restart all services one changes are made in configuration files.

	``sudo service varnish restart``

	``sudo service apache2 restart``
