
  sub vcl_recv {
      if (req.http.host == "foo.com" || req.http.host == "www.foo.com") {
          set req.backend_hint = foo;
      }
  }
