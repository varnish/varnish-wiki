

2. Installing VARNISH with Magento
==================================

The following text discusses how to configure your webserver and Magneto to use Varnish.


Audience:
.........

This reference has been prepared for web developers to get them started with
Varnish installation and configuration.


Prerequisites:
..............

It is assumed that the user has root access, has Magento installed on the
webserver and is here to learn how to get varnish for their website.


Step 1 : Installing Varnish on Ubuntu/UNIX:
-------------------------------------------

It is recommended to install the varnish package from its repository.
Start by grabbing the repository::

	``sudo curl http://repo.varnish~cache.org/debian/GPG~key.txt | sudo apt~key add ~``


Add the repository to the source list::

	``sudo nano /etc/apt/sources.list``


Add the repository by pasting the following line::

	``deb http://repo.varnish~cache.org/ubuntu/ trusty varnish~4.1``

Save and exit.


Now run update and install::

	``sudo apt~get update``
	``sudo apt~get install varnish``


Step 2: Configure VARNISH
--------------------------

Varnish comes with two configuration files:
One with the starter parameter:

	``/etc/default/varnish`` or ``/etc/sysconfig/varnish``

This file contains all the starter parameters.

	``/etc/varnish/default.vcl``

This file contains all the default policies.
It also tells varnish where to find the web content.


1. Modify **varnish** config file

	~ Open ``/etc/default/varnish`` in a text editor.
	~ Set the Varnish listen port to 80::

		VARNISH_LISTEN_PORT=80

	if necessary comment out everything below.

	~ Otherwise you can browse down to alternative 2 and change port to 80. By default it is bound to port 6081.

	Alternative 2:

.. literalinclude:: files/snippet1_defaultvcl
  :language: c

Description:

		~T : refers to which port manages this.

		~f : refers to the other configuration file containing all the default policies.
		If you plan to change the name of the default policy file,
		make sure to come here and change the default.vcl to the given name.

		~S : refers to the file containing secrets such as passwords etc.

		~s : refers to the space varnish cache is allocated. 256m”
		is decided based on the current servers RAM of 1GB.

	This is all the configuration changes in this file.

2. Modify **default.vcl** file

	This file contains configuration that points to the content. This is by default set to 8080
	and points to host as localhost as shown below.


	To minimally configure Varnish:

	~ Back up default.vcl::

		``cp /etc/varnish/default.vcl /etc/varnish/default.vcl.bak``

	~ Open ``/etc/varnish/default.vcl`` in a text editor.


	~ Locate the following piece of code::

		Backend default {

		     .host = “127.0.0.1”;

		     .port = “80”;
		}


	~ The value of .host by default is the localhost. It should replaces with the fully qualified host name or IP address (typically, a webserver) and listen port of the Varnish backend or origin server; that is, the server providing the content Varnish will accelerate.

	~ The value of .port should re replaced with webservers listening port, for example 8080.

		Example::

			Backend default {

			     .host = “192.168.1.0”;

			     .port = “8800”;
			}

It is recommended that if changes are made to these files, it should be copied and remaned name,
because when varnish updates, it will replace any changes made with it’s new default.vcl and varnish file.

VCL TEMPLATEs
.............

~ install
~

Step 3: Configure Apache2 to work with Varnish
----------------------------------------------

Configure your web server to listen on a port other than the default port 80 because
Varnish responds directly to incoming HTTP requests, not the web server.

In the sections that follow, we use port 8080 as an example as shown above.

To change the Apache listen port:

	~Open /etc/httpd/conf/httpd.conf in a text editor.
	~Locate the Listen directive.
	~Change the value of the listen port to 8080. (You can use any available listen port.)
	~Save your changes to httpd.conf and exit the text editor.

Step 4: Restart
---------------

It is always required to restart all services one changes are made in configuration files.

	``sudo service varnish restart``

	``sudo service apache2 restart``


If Varnish fails to start, try running it from the command line as follows:

	``varnishd ~d ~f /etc/varnish/default.vcl``

This should display the error messages.

You can always refer to the `Configure and Use Varnish <http://devdocs.magento.com/guides/v2.0/config~guide/varnish/config~varnish.html>`_ at the Magento site.

To see the guide on installing and configuring Magento with Varnish on webserver, please look at `here <http://devdocs.magento.com/guides/v2.0/config~guide/varnish/config~varnish~configure.html>`_.
