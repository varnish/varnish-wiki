.. _varnish_test:

Testing with VarnishTest
========================

You may not be aware of this, but `varnishest` is an awesome tool!
Varnisttest is a sandbox (testing environment) and it is completely isolated from
the production environment where one can TEST untested code changes and do
all kinds of out of the world expermientation.

Using varnishtest protects your "live" servers, reviewed vcl codes,
other collections of data and/or content from severe changes that could be caused
by your experimental code. But we all know that once in a mission-critical system
phase is quite difficult to revert back.

Varnish comes with varnishtest pre-installed and runs personalized tests for
whatever case you may define. There is also a whole set of pre-defined tests
that you may use for your understanding and testing.

Here is a list of contexts where you can use `varnishtest`:

- Testing your varnish and backend installation
- Configuring your varnish cache Installation
- When writing complex caching policies in VCL
  Such as:
    ~ test a cache invalidation method
    ~ reproduce bugs when filing a report
- When tuning varnish cache
- To define and test modules for varnish cache extensions (VMOD)
- Writing applications that integrate well with Varnish Cache and utilizes all its
  noble characteristics.

The Varnish Test Case Language (VTC)
------------------------------------

This is the language that varnishest understands. The extension used by Varnish
Test Cases files is (.vtc).

Normally, a vtc file describes a scenario with different scripted HTTP-talking
operation, and generally one or more Varnish instances (clients) to test.

Naming Convention
.................

Varnishtest has a whole set of pre-defined tests that you can use if you
can understand what it is doing. It follows a naming convention which will help
you to understand which set is what type of example.

.. literalinclude:: /vtc/vtc_syntax.txt

**Note:** You can use any naming convention to write your test, but a defined
naming convention could help you from re-writing similar tests.

Name the Test
.............

Varnishtest requires that you name the test.
Here is an example below:

.. code-block:: python
  Varnishtest "This is a VarnishTest for Testing"


Defining the Components
-----------------------

Varnishtest requires 3 components to run the test:

- A Server (orgin server)
- A Varnish Cache Instance
- A Client

Declaring the Server
....................

- A Server declaration must start with **s**
- `rxreq` : accepts/recieves requests
- `txresp` : transmits/responds to requests
- `- start` : boots server

Below is an example of declaring a server:

.. literalinclude:: /vtc/example.vtc
  :lines: 4-7


Declaring The Varnish Cache Instance
....................................

- A Varnish Cache Instance declaration must start with **v**
- Instance controlled by the Manager process
- `- start` : forks a child for this instance from the actual cacher process


Below is an example of declaring a Varnish Cache Instance:

.. literalinclude:: /vtc/example.vtc
  :lines: 9

Declaring a Client
..................

- Stimulated Client declaration must start with **c**
- `- run` : starts the client

Below is an example of declaring a Varnish Cache Instance:

.. literalinclude:: /vtc/example.vtc
  :lines: 11-16

In this example, c1 transmits one request and receives one response.

Since Varnish is a proxy instance, the response should be received from the backend
via Varnish Cache (varnish instance in this example case).

- we can see c1 expects varnish in the via HTTP header field.
- The tilde (~) is used as a match operator of regular expressions,
- the exact name of the variable here (eg. resp.http.via) depends on the version
  of varnish installed.

Running the Test
----------------

- To run the test issue the command as shown below:

.. code-block:: c

  varnishtest example.vtc

**Note:** If you are writing your own test, make sure that you point to the
directory of where the test is stored.

If you feel the need toinspect/understand the test better, you can always try the
verbose mode with a `-v` as snown below:

.. code-block:: c

  varnishtest -v example.vtc


Some Resources to look at for `varnishtest`_ :

`Naming Scheme for Varnish Test`_

Another great post on `Smashing Magazine about Varnishtest`_

`Understanding VTC`_

`Varnishtest for Humans`_

.. _`Varnishtest for Humans`: https://github.com/xcir/vtctrans
.. _`varnishtest`: https://www.varnish-cache.org/docs/trunk/reference/varnishtest.html
.. _`Understanding VTC`: https://www.varnish-cache.org/docs/trunk/reference/vtc.html?highlight=varnishtest
.. _`Naming Scheme for Varnish Test`: https://raw.githubusercontent.com/varnish/Varnish-Cache/master/bin/varnishtest/tests/README
.. _`Smashing Magazine about Varnishtest`: https://www.smashingmagazine.com/2016/05/five-simple-steps-test-varnish-cache-deployment-varnishtest/
