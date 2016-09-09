.. _vcl:

Varnish Configuration Language (VCL)
====================================

One of the key features of Varnish cache, in addition to its performance is the
flexibility of its own configuration language, Varnish Configuration Language
(VCL).


Is VCL worth the learning curve?
--------------------------------

Looking for motivation? Well VCL is easy and very much like C. In fact VCL accepts
In-line C, though that is not recommended. Following our guide and learn VCl is the
way to go!:)

Getting past your fears of coding and learning VCL is considered by us a good choice
because writing or modifying VCL can help you understand Varnish better. Infact
it will give you the independence to do whatever you want with your varnish (at
your wok risk ofcourse!) As you already know, many high-profile websites use varnish,
and if you really take your VCL to the next level, you will be taking a big step
in your career.

How to VCL?
-----------

Basics
......

- Domain Specific Language
- VCL as a finite state machine
- States are sub-routines eg. `sub vcl_recv`
- Varnish includes built-in subroutines, starts with `vcl_` (reserved prefix)
- Varnish has a built-in vcl which is always appended with your custom VCL
  UNLESS you specify not to with a `return (hash)`. This terminates subroutine,
  and DOESNOT append built-in vcl.
- Available features: `functions, legal return actions and variables`_


What is Built-in VCL?
---------------------

The Builtin VCL file named `builtin.vcl` is the VCL configuration Varnish
automatically appends to your VCL file during compilation/loading.

Whenever a new configuration is loaded, the varnishd management process
translates the VCL code to C and compiles it to a shared object which is then
loaded into the server process.

You can view your `built-in vcl` in this location if you are a debian user:

.. code-block:: bash

  cat /usr/share/doc/varnish/builtin.vcl


**Note:** This ``builtin.vcl`` file is just for a varnish user to see what is
present in the builtin file. Edit this vcl doesn't affect anything.
Any vcl you want to add goes in the /etc/varnish/default.vcl

If you want to re-create your own vcl, we recommend you make changes in the
`example.vcl`. You will find that file in this location if you are a debian user:

.. code-block:: bash

  cat /usr/share/doc/varnish/example.vcl


Built-in Subroutines
--------------------

VCL Builtin subroutines are the ones which are pre-defined using the syntax
`vcl_` in the `buildin.vcl` and `default.vcl` (the subroutines here are empty
by default.)


Here is a simplified version of how the VCL works frontend to backend.
Click on the image to see it large and clear.

.. image:: /image/simplified_fsm.svg
  :alt: Sphinx Neo-Hittite
  :align: center
  :width: 400px

(Collected from the Varnish BOOK)


Client Side
...........

**vcl_recv:**

- called at the beginning of a request
- after complete request has been received and parsed
- after a restart
- terminates with `return(action)`
- action types:
    - hash (passes to vcl_hash)
    - pass (passes to vcl_pass)
    - pipe (passes to vcl_pipe)
    - synth(status code, reason):
      synth transition to vcl_synth with resp.status and resp.reason being preset
      to the arguments of synth()
    - purge (control passes through vcl_hash to vcl_purge)

**vcl_pipe:**

- called when entering pipe mode
- this mode passes request to backend
- terminates with `return(action)`
- action types:
    - pipe
    - synth (status code, reason)

**vcl_pass:**

- Called upon entering pass mode
- the request is passed on to the backend
- the backends response is passed on to the client
- but not entered into the cache
- Subsequent requests submitted over the same client connection are
  handled normally.
- terminates with `return(action)`
- action types:
    - fetch (Proceed with pass mode - initiate a backend request)
    - restart
    - synth(status code, reason)

**vcl_hit:**

- called when a cache look-up is successful
- object being hit maybe stale if:
    - It can have a zero or
    - negative ttl with only grace or
    - keep time left
- terminates with `return(action)`
- action types:
    - deliver (delivers the object, if stale then background fetch triggered)
    - miss (refresh the object and pass to vcl_miss)
    - restart
    - synth(status code, reason)

**vcl_miss:**

- called after a cache lookup **if** the requested document was not found in cache
- it decides whether or not to attempt to retrieve the document from the backend.
- terminates with `return(action)`
- action type:
    - fetch
    - pass
    - restart
    - synth (status code, reason)

**vcl_hash:**

- called after vcl_recv to create a hash value for the request
- this key is used further to look up the object in cache.
- terminates only with return(lookup):
    - lookup (looks up the object in cache. passes to whichever subroutine called it)

**vcl_purge:**

- called after the purge has been executed and all its variants have been evited.
- terminates with `return(action)`
- action type:
    - restart
    - synth (status code, reason)

**vcl_synth:**

- Called to deliver a synthetic object.
- never enters cache
- A synthetic object is generated in VCL (NOT fetched from backend
- the objects body is constructed using the `synthetic()` function.
- terminates with `return(action)`
- action type:
    - restart
    - deliver (delivers to client without calling vcl_deliver)

**vcl_deliver:**

- called before any object is delivered to client (except vcl_synth)
- terminates with `return(action)`
- action type:
    - restart
    - deliver
    - synth(status code, reason)


Backend Side
............

**vcl_backend_fetch:**

- Called before sending the backend request.
- usually the request is altered here before it gets to the backend.
- terminates with return(action)
    - fetch
    - abandon (abandons request UNLESS the request was a background fetch,
      then it is passed to vcl_synth)

**vcl_backened_response:**

- Called after the response headers have been successfully retrieved from backend.
- terminates with return(action)
    - deliver
    - abandon
    - retry (increases re-try counter)

**vcl_backened_error:**

- called if backend fetch has failed or if `max_retries` has exceeded
- sythetic obejct is generated in VCL using the `synthetic()` function
- may end up in cache
- terminates with return(action)
    - deliver
    - retry

vcl.load/vcl.discard
....................

**vcl_init:**

- called when vcl is loaded
- before any request passes
- typically called used to initialize VMODs
- terminates with return(action)
    - ok
    - fail

**vcl_fini:**

- called when vcl is discarded, ONLY after ALL request have exited VCL.
- Used to clean up VMODs.
- terminates with return(action)
    - ok (Normal return, VCL will be discarded.)

More details `subroutines here`_

.. _`subroutines here`: https://www.varnish-cache.org/docs/trunk/users-guide/vcl-built-in-subs.html
.. _`functions, legal return actions and variables`: https://www.varnish-cache.org/docs/4.0/reference/vcl.html
