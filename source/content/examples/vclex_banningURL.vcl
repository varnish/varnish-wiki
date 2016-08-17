# banning certain URLs

sub vcl_recv {
        if (req.method == "BAN") {
                # Same ACL check as above:
                if (!client.ip ~ purge) {
                        return(synth(403, "Not allowed."));
                }
                ban("req.http.host == " + req.http.host +
                      " && req.url == " + req.url);

                # Throw a synthetic page so the
                # request won't go to the backend.
                return(synth(200, "Ban added"));
        }
}


# reference : https://www.varnish-cache.org/docs/trunk/users-guide/purging.html
