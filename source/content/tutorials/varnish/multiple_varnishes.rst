
.. _multiple_varnishes:

Dealing with Multiple Varnishes
===============================

If you are considering or already have more than one Varnish cache.
You definitely have a huge network to **manage!**

Having Multiple backends
------------------------

Multiple backends means serving from several servers.
You want Varnish to map all the URL into one single host. There are lot of options.

Lets take a PHP Applciation website and you would like to add a Java application
into it.. Lets say your Java application should handle URL beginning with /java/.

Assuming that you already have a backend running at 8080 and serving content to
user through port 80. This is your default vcl:

.. code-block:: vcl

  backend default {
      .host = "127.0.0.1";
      .port = "8080";
  }

Now lets add a new backend:

.. code-block:: vcl

  backend java {
      .host = "127.0.0.1";
      .port = "8000";
  }

Now we need to tell Varnish where to send the different URL. here is what you
need in your **vcl_recv** :

.. literalinclude:: /content/examples/vcl_backend_hint.vcl
  :language: VCL

As you can see you can define how to choose backends based on really arbitrary data.
if you want to send mobile devices to a different backend, a little bit more of
VCl should do the trick.

.. code-block:: vcl

  if (req.http.User-agent ~ /mobile/)
  ..

If there is no backend defined, varnish uses the default backend. If there is
no backend named default, varnish will use the first backend found in the vcl.

Backends and Virtual Hosts in Varnish
-------------------------------------

Varnish fully supports virtual hosts!

They might however work in a somewhat *counter-intuitive fashion* since they are
never declared explicitly. You have to set up the routing of incoming HTTP requests
in `vcl_recv`. If you want this routing to be done on the basis of virtual hosts,
you just need to inspect req.http.host.

You can have something like this:

.. literalinclude:: /content/examples/vcl_backend_virtualhosts.vcl
  :language: VCL

Note that the first regular expressions will match "foo.com", "www.foo.com",
"zoop.foo.com" and any other host ending in "foo.com".

In this example this is intentional but you might want it to be a bit more tight,
maybe relying on the **==** operator instead, like this:

.. literalinclude:: /content/examples/vcl_backend_virtualhosts2.vcl
  :language: VCL

Directors
---------

You can also group several backend into a group of backends.
These groups are called **directors**. This will give you increased performance
and resilience.

You can define several backends and group them together in a director.
This requires you to load a VMOD, a Varnish module, and then to call certain
actions in vcl_init.:

.. literalinclude:: /content/examples/vcl_vmod_mbackend.vcl
  :language: VCL


This director is a round-robin director. This means the director will distribute
the incoming requests on a round-robin basis. There is also a random director
which distributes requests in a, you guessed it, random fashion. If that is not
enough, you can also write your own director (see Writing a Director).

But what if one of your servers goes down? Can Varnish direct all the requests
to the healthy server? Sure it can. This is where the Health Checks come into
play.

Health Checks
-------------

Lets set up a director with two backends and health checks.
First let us define the backends:

.. literalinclude:: /content/examples/vcl_backend_healthcheck.vcl
  :language: VCL

What is new here is the probe.
In this example Varnish will check the health of each backend every 5 seconds,
timing out after 1 second. Each poll will send a GET request to /.
If 3 out of the last 5 polls succeeded the backend is considered healthy,
otherwise it will be marked as sick.

Refer to the Probes section in the VCL documentation for more information.

Now we define the 'director':

.. code-block:: vcl

  import directors;

  sub vcl_init {
      new vdir = directors.round_robin();
      vdir.add_backend(server1);
      vdir.add_backend(server2);
  }

You use this vdir director as a backend_hint for requests, just like you would
with a simple backend. Varnish will not send traffic to hosts that are marked as
unhealthy.

Varnish can also serve stale content if all the backends are down.
See **Misbehaving servers** in the varnish documentation for more information
on how to enable this.

Please note that Varnish will keep health probes running for all loaded VCLs.
Varnish will coalesce probes that seem identical - so be careful not to change
the probe config if you do a lot of VCL loading. Unloading the VCL will discard
the probes.

source and more details `here`_ .

.. _here: https://www.varnish-cache.org/docs/trunk/users-guide/vcl-backends.html?highlight=multiple%20varnish
