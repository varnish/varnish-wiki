# a vcl snippet as part of the vcl_recv
# this helps in removing everythign except a few cookies.
# exapmple collected from the varnish.cache site.

sub vcl_recv {
  if (req.http.Cookie) {
    set req.http.Cookie = ";" + req.http.Cookie;
    set req.http.Cookie = regsuball(req.HTTP.Cookie, "; +", ";");
    set req.http.Cookie = regsuball(req.HTTP.Cookie, ";(COOKIE1|COOKIE2)=", "; \1=");
    set req.http.Cookie = regsuball(req.HTTP.Cookie, "[^ ][^;]*", "");
    set req.http.Cookie = regsuball(req.HTTP.Cookie, "^[; ]+|[; ]+$ ", "");
  }
}


# The snippet below does the opposite. picks out the one cookie to be cached

sub vcl_recv {
    # save the original cookie header so we can mangle it
    set req.http.X-Varnish-PHP_SID = req.http.Cookie;
    # using a capturing sub pattern, extract the continuous string of
    # alphanumerics that immediately follows "PHPSESSID="
    set req.http.X-Varnish-PHP_SID =
       regsuball(req.http.X-Varnish-PHP_SID, ";? ?PHPSESSID=([a-zA-Z0-9]+)( |;| ;).*","\1");
    set req.http.Cookie = req.X-Varnish-PHP_SID;
    unset req.X-Varnish-PHP_SID;
}

# collected from https://www.varnish-cache.org/docs/4.1/users-guide/increasing-your-hitrate.html
