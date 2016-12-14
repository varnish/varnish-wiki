.. _run_varnish:

Let's run Varnish!
=================

Once you have installed Varnish, you can take advantage of a few tips to help you get started with
running it.

Integration
-----------

Where is your Varnish running?

1. Varnish is on the same machine as your web application.
2. Varnish is on a separate machine placed in front of the web server.
3. Varnish is on a separate machine placed in front of several web servers.
4. Varnish is on several machines integrated to work with multiple backend web servers.

Configuring Varnish for 1 is quite simple and easy, but as you continue down that
line, configuration and integration can become quite complex.

Running Varnish for different applications is not just about placing Varnish in
front of your web server and expecting it to do everything.

Of course Varnish can do magical things without much configuration in Varnish.
But only after you have integrated it correctly with your web servers.

As you may already know, different web applications have different requirements.

In order to help you with that, we provide guidelines for each type of
web application, multiple backend setup, etc.

Security
--------

Are you the only person running your Varnish?

If you are the only one or all those who have access to Varnish are trusted to
the same degree, you don't have to worry about security.

Otherwise, if you have different administration levels, you might want to know
about what services Varnish provides for that.

Varnish provides four levels of security:

- Command line arguments
- CLI interface
- VCL programs
- HTTP requests

Command line arguments
......................

Starting/Stopping/Restarting/Reloading Varnish from command line requires
administrator/sudo permissions.

The important decisions to make are:

- Who should have access to the command line Interface?
- Which parameters can they change?
- Will inline-C code be allowed?
- If/how VMODs will be restricted?
- How child processes will be jailed?


CLI access
..........

The command line interface can be accessed in three ways.

varnishd can be told to listen and offer CLI connections on a TCP socket. You can
bind the socket to pretty much anything the kernel will accept:

.. code-block:: bash

  -T 127.0.0.1:631
  -T localhost:9999
  -T 192.168.1.1:34
  -T '[fe80::1]:8082'

1. The default is -T localhost:0 which will pick a random port number,
which varnishadm(8) can learn from the shared memory.

2. You can bind the CLI port to a 'localhost' address, and give remote users
access via a secure connection to the local machine, using ssh/VPN or similar.

3. It is also possible to configure varnishd for "reverse mode", using the '-M'
argument. In that case varnishd will attempt to open a TCP connection to the
specified address, and initiate a CLI connection to your central Varnish
management facility.

CLI interface authentication
............................

By default the CLI interface is protected with a simple, yet powerful
"pre-shared key" authentication method, which does not provide secrecy.

To authenticate and use a CLI connection, you need to know the contents of this
file, which was created during startup and contains random content and
is only accessible to the user who started varnishd, in order to answer the
cryptographic challenge varnishd issues. See Authentication with -S.

If you want to allow other users, local or remote, to be able to access CLI
connections, you must create your own secret file and make it possible for
(only!) those users to read it.

A good way to create the secret file is:

.. code-block:: bash

  dd if=/dev/random of=/etc/varnish_secret count=1


When starting varnishd or varnishadm use `-S` to provide the file name.

Read more about `Authenticating -S`_

Parameters
..........
Parameters can be set from the command line, and made "read-only" (using '-r')
so they cannot subsequently be modified from the CLI interface.

Pretty much any parameter can be used to totally mess up your HTTP service,
but a few listed below can do more damage than others:

cc_command
    Execute arbitrary programs

vcc_allow_inline_c
    Allow inline-C in VCL, which would make any C code from VCL be executed by Varnish.

Furthermore you may want to look at and lock down:

syslog_cli_traffic
    Log all CLI commands to syslog(8), so you know what's going on.

vcc_unsafe_path
    Restrict VCL/VMODs to vcl_path and vmod_path

vmod_path
    The directory (or colon separated list of directories) where Varnish will
    will look for modules. This could potentially be used to load rogue modules
    into Varnish.

The CLI interface
-----------------

The CLI interface in Varnish is very powerful. If you have access to the CLI
interface, you can do almost anything to the Varnish process.

VCL programs
------------

There are two "dangerous" mechanisms available in VCL code: VMODs and inline-C.
Both of these mechanisms allow execution of arbitrary code and will thus allow a
person to get access to the machine, with the privileges of the child process.

HTTP requests
-------------

Since VCL is a programming language which lets you decide exactly what to do with
HTTP requests, you can also decide to do stupid and potentially dangerous things
with them, including opening yourself up to various kinds of attacks and
subversive activities.

If you have "administrative" HTTP requests, for instance PURGE requests, we
strongly recommend that you restrict them to trusted IP numbers/nets using VCL's
access control lists (ACLs).

.. _`Authenticating -S`: https://www.varnish-cache.org/docs/trunk/users-guide/run_security.html
