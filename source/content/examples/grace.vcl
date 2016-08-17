# grace mode

sub vcl_hit {
    if (obj.ttl >= 0s) {
        # normal hit
        return (deliver);
    }
    # We have no fresh fish. Lets look at the stale ones.
    if (std.healthy(req.backend_hint)) {
        # Backend is healthy. Limit age to 10s.
        if (obj.ttl + 10s > 0s) {
            set req.http.grace = "normal(limited)";
            return (deliver);
        } else {
            # No candidate for grace. Fetch a fresh object.
            return(fetch);
        }
    } else {
        # backend is sick - use full grace
        if (obj.ttl + obj.grace > 0s) {
            set req.http.grace = "full";
            return (deliver);
        } else {
            # no graced object.
            return (fetch);
        }
    }
}

sub vcl_backend_response {
    set beresp.ttl = 10s;
    set beresp.grace = 1h;
}

sub vcl_recv {
    # intial state
    set req.http.grace = "none";
}

sub vcl_deliver {
    # copy to resp so we can tell from the outside.
    set resp.http.grace = req.http.grace;
}






# source: https://gist.github.com/perbu/93803707dbcdbc345da0
# blogpost: https://info.varnish-software.com/blog/grace-varnish-4-stale-while-revalidate-semantics-varnish
