sub vcl_recv {
    if (req.http.host ~ "foo.com") {
        set req.backend_hint = foo;
    } elsif (req.http.host ~ "bar.com") {
        set req.backend_hint = bar;
    }
}
