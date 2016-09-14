.. _webTerms:


Web caching Terminologies
=========================

**backend**
The HTTP server varnishd is caching for. This can be any sort of device that
handles HTTP requests, including, but not limited to: a webserver, a CMS, a
load-balancer another varnishd, etc.

**backend response**
The response specifically served from a backend to varnishd. The backend
response may be manipulated in vcl_backend_response.

**body**
The bytes that make up the contents of the object, varnishd does not care if
they are in HTML, XML, JPEG or even EBCDIC, to varnishd they are just bytes.

**client**
The program which sends varnishd an HTTP request, typically a browser, but do
not forget to think about spiders, robots script-kiddies and criminals.

**cache**
A collection of relevant data stored away for reuse.

**cookie:**
it is not just a sweet biscuit anymore. Cookies are actually packets of data sent
by the webserver to a browser and stored there. it is later used to identify the
user when he/she revisits the same server.

**domain:**
basically an area of territory on the internet which can be owned by a user or
company.

**ESI:**
Edge Side Includes. It his a small markup language and helps in handling web
infrastructure scaling..

**header**
An HTTP protocol header, like "Accept-Encoding:".

**hit**
An object Varnish delivers from cache.

**hit rate:**
The rate at which varnish delivers an object from acche.

**HTTP**
Hyper Text Transfer Protocol. It is an application protocol for hypermedia
information systems.

**HTTP2**
HTTP2 is basically the same as HTTP1.1, the major difference is that HTTP2 can
befriend new web applications by speeding up how data is framed (also secured)
and transported between the client and the server.

**master (process)**
One of the two processes in the varnishd program. The master process is a
manager/nanny process which handles configuration, parameters, compilation of
:term:VCL etc. but it does never get near the actual HTTP traffic.

**miss**
An object Varnish fetches from the backend before it is served to the client.
The object may or may not be put in the cache, that depends.

**object**
The (possibly) cached version of a backend response. varnishd receives a
response from the backend and creates an object, from which it may deliver
cached responses to clients. If the object is created as a result of a request
which is passed, it will not be stored for caching.

**optimize**
it is the mechanism of improving the way data is retrieved.

**pass**
An object Varnish does not try to cache, but simply fetches from the backend and
hands to the client.

**pipe**
Varnish just moves the bytes between client and backend, it does not try to
understand what they mean.

**request**
What the client sends to varnishd and varnishd sends to the backend.

**response**
What the backend returns to varnishd and varnishd returns to the client.
When the response is stored in varnishd's cache, we call it an object.

**tag**
A set of characters added to data to identify it individually.

**timeout:**
A predefined interval of time, that has expired.

**traffic:**
The about of requests or responses on the line

**varnishd** (NB: with 'd')
This is the actual Varnish cache program. There is only one program, but when
you run it, you will get two processes: The "master" and the "worker"
(or "child").

**varnishhist**
Eye-candy program showing response time histogram in 1980s ASCII-art style.

**varnishlog**
Program which presents varnish transaction log in native format.

**varnishncsa**
Program which presents varnish transaction log in "NCSA" format.

**varnishstat**
Program which presents varnish statistics counters.

**varnishtest**
Program to test varnishd's behaviour with, simulates backend and client
according to test-scripts.

**varnishtop**
Program which gives real-time "top-X" list view of transaction log.

**webserver**
A webserver is a machine that runs a software that uses HTTP (Hypertext Transfer
Protocol) to serve the files in the form of web pages, in response to their
requests, which are forwarded by their computers' HTTP clients.

**webpage**
A page generated or written from a Web application.

**worker (process)**
The worker process is started and configured by the master process. This is the
process that does all the work you actually want varnish to do. If the worker
dies, the master will try start it again, to keep your website alive.

Varnish Three Letter Acronyms
=============================

You will find use of these acronyms when you are on any of our varnish related
documentation,the main website, book, wiki etc.

**VAV**
Varnish Arg Vector -- Argv parsing.

**VBE**
Varnish Back End -- Code for contacting backends (bin/varnishd/cache_backend.c)

**VBP**
Varnish Backend Polling -- Health checks of backends
(bin/varnishd/cache_backend_poll.c)

**VCA**
Varnish Connection Acceptor -- The code that receives/accepts the TCP
connections (bin/varnishd/cache_acceptor.c)

**VCC**
VCL to C Compiler -- The code that compiles VCL to C code. (lib/libvcl)

**VCL**
Varnish Configuration Language -- The domain-specific programming language used
for configuring a varnishd.

**VCT**
Varnish CType(3) -- Character classification for RFC2616 and XML parsing.

**VDD**
Varnish (Core) Developer Day -- Quarterly invite-only meeting strictly for
Varnish core (C) developers, packagers and VMOD hackers.

**VEV**
Varnish EVent -- library functions to implement a simple event-dispatcher.

**VGB**
Varnish Governing Board -- May or may not exist. If you need to ask, you are not
on it.

**VGC**
Varnish Generated Code -- Code generated by VCC from VCL.

**VIN**
Varnish Instance Naming -- Resolution of -n arguments.

**VLU**
Varnish Line Up -- library functions to collect stream of bytes into lines for
processing. (lib/libvarnish/vlu.c)

**VRE**
Varnish Regular Expression -- library functions for regular expression based
matching and substring replacement. (lib/libvarnish/vre.c)

**VRT**
Varnish Run Time -- functions called from compiled code. (bin/varnishd/cache_vrt.c)

**VRY**
VaRY -- Related to processing of Vary: HTTP headers. (bin/varnishd/cache_vary.c)

**VSL**
Varnish Shared memory Log -- The log written into the shared memory segment for
varnish{log,ncsa,top,hist} to see.

**VSB**
Varnish string Buffer -- a copy of the FreeBSD "sbuf" library, for safe string
handling.

**VSC**
Varnish Statistics Counter -- counters for various stats, exposed via varnishapi.

**VSS**
Varnish Session Stuff -- library functions to wrap DNS/TCP. (lib/libvarnish/vss.c)

**VTC**
Varnish Test Code -- a test-specification for the varnishtest program.

**VTLA**
Varnish Three Letter Acronym -- No rule without an exception.

**VUG**
Varnish User Group meeting -- Half-yearly event where the users and developers
of Varnish Cache gather to share experiences and plan future development.

**VWx**
Varnish Waiter 'x' -- A code module to monitor idle sessions.

**VWE**
Varnish Waiter Epoll -- epoll(2) (linux) based waiter module.

**VWK**
Varnish Waiter Kqueue -- kqueue(2) (freebsd) based waiter module.

**VWP**
Varnish Waiter Poll -- poll(2) based waiter module.

**VWS**
Varnish Waiter Solaris -- Solaris ports(2) based waiter module.
