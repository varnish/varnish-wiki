acl purge {
        "localhost";
        "x.x.x.x"/24;
}

sub vcl_recv {
        # this code below allows PURGE from localhost and x.x.x.x

        if (req.method == "PURGE") {
                if (!client.ip ~ purge) {
                        return(synth(405,"Not allowed."));
                }
                return (purge);
        }
}

# Notice the return (purge) this means that this subroutine will end here and
# jump to the next sub routine vcl_hash without appending to the built-in vcl_recv
# To read more on this go to https://www.varnish-cache.org/docs/trunk/users-guide/purging.html
