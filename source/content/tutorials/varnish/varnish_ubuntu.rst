.. _varnish_ubuntu:

Installing and Configuring Varnish
==================================

The following text discusses how to configure your webserver to use Varnish.
Note that the installation is different for *systemv* and *systemd*.
The following guide is for systemd as many linux distributions are now adopting to
the systemd init system.

Audience:
.........

This reference has been prepared for web developers to get them started with
Varnish installation and configuration.

Step 1 : Installing Varnish on Ubuntu/UNIX:
-------------------------------------------

It is recommended to install the varnish package from its repository.

- Start by grabbing the repository.

- Add the repository to the source list and save.

.. literalinclude:: /content/examples/varnish_install_repo
	:language: bash

- Run Update and Install

.. literalinclude:: /content/examples/update_install_varnish
	:language: bash

Step 2: Configure VARNISH
--------------------------

Varnish comes with two configuration files:

**One with the starter parameter:**

	``/etc/default/varnish``

This file contains all the starter parameters.

**The other is the Default VCL file:**

For systemd the VCL file is directed to in a different manner.
It will be located in:

	``/etc/systemd/system/varnish.service``

which will point to:

	``/etc/varnish/default.vcl``

This default.vcl contains the *default* policies that the *user includes*.
It also tells varnish where to find the web content.
However there is a `builtin.vcl`_ which is always appended to the VCL you define/specify
in this default.vcl.

1. Modify **varnish** config file

	- Open ``/etc/default/varnish`` in a text editor.
	- You will see a code like the one below.

.. literalinclude:: /content/examples/default_varnish_1.vcl
	:language: VCL

Description:

		~T : refers to which port manages this.

		~f : refers to the other configuration file containing all the default policies.
		If you plan to change the name of the default policy file,
		make sure to come here and change the default.vcl to the given name.

		~S : refers to the file containing secrets such as passwords etc.

		~s : refers to the space varnish cache is allocated. 256m”
		is decided based on the current servers RAM of 1GB.


	- Now set the Varnish listen port to 80.
	- Now replace the ``-f`` line with ``-b 95.85.10.242:8080`` as shown below.

.. literalinclude:: /content/examples/default_varnish_2.vcl
	:language: VCL

This is all the configuration changes in this file.

2. Copy the defaults file named **varnish.service** file

	``cp /lib/systemd/system/varnish.service /etc/systemd/system/``

	Edit /etc/systemd/system/varnish.service

	Locate the line containing the port 80 and change it to 8080.

	ExecStart=/usr/sbin/varnishd -a :80 -T localhost:6082 -f /etc/varnish/default.vcl
	-S /etc/varnish/secret -s malloc,256m

	Notice that this file points to the /etc/varnish/default.vcl file.

3. Now Modify **default.vcl** file

	This file contains configuration that points to the content. This is by default
	set to serve at 8080 and points to host as localhost as shown below.

	To minimally configure Varnish:

	- Back up default.vcl

		``cp /etc/varnish/default.vcl /etc/varnish/default.vcl.bak``

	- Open ``/etc/varnish/default.vcl`` in a text editor.

	- Locate the following piece of code

.. literalinclude:: /content/examples/default_vcl.vcl
	:language: VCL

The value of .host by default is the localhost. It should replaces with the fully
qualified host name or IP address (typically, a webserver) and listen port of the
Varnish backend or origin server; that is, the server providing the content
Varnish will accelerate.

The value of .port should re replaced with webservers listening port, for example
8080 as shown below

.. literalinclude:: /content/examples/default_vcl_2.vcl
	:language: VCL

It is recommended that if changes are made to these files, it should be copied
and renamed name, because when varnish updates, it will replace any changes made
with it’s new default.vcl and varnish file.

Now varnish is serving the client at port 80 and listening to the backend at
port 8080.

This is when you can add ready made VCL Templates or recommended plugins for
your web Application (WordPress, Drupal, Magento2)

But before you add any new code you must understand VCL.

Step 3: Configure Apache2 to work with Varnish
----------------------------------------------

Configure your web server to listen on a port other than the default port 80 because
Varnish responds directly to incoming HTTP requests from the client on this port.

Varnish will communicate on a different port with your backend webservers as in
the example above it is port 8080.

In the sections that follow, we use port 8080 as an example as shown above.
If you have more then one backend you can put them on another port such as port
8081, 8082 etc.

To change the Apache listen port:

	~ Open /etc/apache2/ports.conf in a text editor.
	~ Locate the Listen directive.
	~ Change the value of the listen port to 8080. (You can use any available listen port.)
	~ Save your changes to ports.conf and exit the text editor.
	~ Also edit /etc/apache2/sites-available/000-default.conf
	~ Change the VirtualHost port to 8080:
	`<VirtualHost 127.0.0.1:8080>`


Setting up Multiple Backends (Skip this section if you have one Backend)
------------------------------------------------------------------------

If you have more then one backened server, you need to add all those backends in
the default.vcl file as backends and also define how and when each of these backends
should be accessed.

Here is a simple example:

.. literalinclude:: /content/examples/vclex_multiple_backend.vcl
	:language: VCL


Step 4: Restart
---------------

It is always required to restart all services once changes are made in configuration files.

.. literalinclude:: /content/examples/snippet2_restart_systemv
	:language: VCL


Step 5: Testing
---------------

Run

.. code-block:: bash

	http -p Hh localhost

You can also use varnishtest to test your backend as shown below.

.. literalinclude:: /content/examples/vtc/vtc_apacheBackend.vtc
	:language: VCL

replace your backend ip-address and port number.


Step 6: Troubleshooting
-----------------------

If Varnish fails to start, try running it from the command line as follows:

	``varnishd ~d ~f /etc/varnish/default.vcl``

This should display the error messages.


Step 7: The Management Interface
--------------------------------

Varnish has a command line interface (CLI) to control any varnish instance.
- It can be used to reload VCL without restarting.
- Start, stop cache process
- Change configuration parameters without restarting.
- view upto date documentation for parameters etc.
- it can implement a list of management commands in the `varnishadm`
- `varnishadm` establishes a connection to the varnish deamon `varnishd`


.. _`builtin\.vcl`: https://github.com/varnishcache/varnish-cache/blob/master/bin/varnishd/builtin.vcl
