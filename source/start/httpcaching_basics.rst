.. _http_caching:

Basic HTTP Caching
==================

The need to understand HTTP caching is a necessity because in today's world,
installing and configuring Varnish doesn't solve all your caching problems.

Every Web service has it's own requirements if what to cache and what no to.
Further down, you will find a checklist for varnish caching.

Defining Caching in your own words
----------------------------------



Advantages of Caching
---------------------







Your Caching Checklist
----------------------

What to cache and what not?

**Cache Friendly Contents**

Contents that do not change frequently.

- Style Sheets, CSS, Some unchanged HTML theme codes
- AJAX and JavaScript files
- Media Files and download contents
- Specific Brandings, Logos, Images that don't change

**Cache Unfriendly Contents**

Contents that should **never** be cached!

- Any kind of personal Information, such as logins, authentications etc.
- Any kind of sensitive data
- Any user specific contents
