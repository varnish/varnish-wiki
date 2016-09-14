sub vcl_recv {
    if (req.url ~ "^/java/") {
        set req.backend_hint = java;
    } else {
        set req.backend_hint = default;
    }
}
