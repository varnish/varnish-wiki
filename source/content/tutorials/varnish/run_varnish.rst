.. _run_varnish:

Lets Run Varnish!
=================

Once you have install varnish here are a few tips to help you get started with
running varnish.

Integration
-----------

Where is your varnish running?

1. Varnish is on the same machine as your web-application.
2. Varnish is on a separate machine placed in front of the webserver.
3. Varnish is on a separate machine placed in front of several webservers.
4. Varnish is on several machines integrated to work with multiple backend webservers.

Configuring varnish for 1 is quite simple and easy, but as you continue down that
line, configuration and integration can get quite complex.

Running varnish for different applications is not just about placing varnish in
front of your webserver and expecting it to do everything.

Ofcourse varnish can do magical things without much configuring in varnish.
But only after you have integrated it correctly with your webservers.

As you may already know, different web applications have different requirements.

In order to help you with that we provide some guidelines for each type of
web applications, multiple backend setup etc.

Security
--------

Are you the only person running your varnish?

If you are the only one or all those who have access to varnish are trusted to
the same degree, you don't have to worry about security.

Otherwise, if you have different administration levels, you might want to know
about what services varnish provides for that.

Well varnish provides four level of security:

- Command line arguments
- CLI interfacce
- VCL Programs
- HTTP Requests

Command Line Arguments
......................

Starting/Stopping/Restarting/Reloading varnish from command line requires
adminstrator/sudo permissions.

The important decisions to make are:

- Who should have access to the Command Line Interface?
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

3. t is also possible to configure varnishd for "reverse mode", using the '-M'
argument. In that case varnishd will attempt to open a TCP connection to the
specified address, and initiate a CLI connection to your central Varnish
management facility.

CLI interface authentication
............................

By default the CLI interface is protected with a simple, yet powerful
"Pre Shared Key" authentication method, which does not provide secrecy.

To authenticate and use a CLI connection, you need to know the contents of this
file which was created doing startup and this file contains a random content and
is only accessible to the user who started varnishd , in order to answer the
cryptographic challenge varnishd issues, see Authentication with -S.

If you want to allow other users, local or remote, to be able to access CLI
connections, you must create your own secret file and make it possible for (
only!) these users to read it.

A good way to create the secret file is:

.. code-block:: bash

  dd if=/dev/random of=/etc/varnish_secret count=1


When starting varnishd or varnishadm use `-S` to provide the filename.

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
    Allow inline C in VCL, which would any C code from VCL to be executed by Varnish.

Furthermore you may want to look at and lock down:

syslog_cli_traffic
    Log all CLI commands to syslog(8), so you know what goes on.

vcc_unsafe_path
    Restrict VCL/VMODs to vcl_path and vmod_path

vmod_path
    The directory (or colon separated list of directories) where Varnish will
    will look for modules. This could potentially be used to load rogue modules
    into Varnish.

The CLI Interface
-----------------

The CLI interface in Varnish is very powerful, if you have access to the CLI
interface, you can do almost anything to the Varnish process.

VCL Programs
------------

There are two "dangerous" mechanisms available in VCL code: VMODs and inline-C.
Both of these mechanisms allow execution of arbitrary code and will thus allow a
person to get access to the machine, with the privileges of the child process.

HTTP Requests
-------------

since VCL is a programming language which lets you decide exactly what to do with
HTTP requests, you can also decide to do stupid and potentially dangerous things
with them, including opening yourself up to various kinds of attacks and
subversive activities.

If you have "administrative" HTTP requests, for instance PURGE requests, we
strongly recommend that you restrict them to trusted IP numbers/nets using VCL's
Access control lists (ACLs).

.. _`Authenticating -S`: https://www.varnish-cache.org/docs/trunk/users-guide/run_security.html
