#Cookie example
#Collected from: https://fourkitchens.atlassian.net/wiki/display/TECH/Configure+Varnish+3+for+Drupal+7

# this is an example of Varnish 3, needs to be tested for varnish 4

if (req.http.Cookie) {
    # removing these styling and photo cookes from here will allow it to be cached
    if (req.url ~ "(?i)\.(css|js|jpg|jpeg|gif|png|ico)(\?.*)?$") {
        unset req.http.Cookie;
    }

    set req.http.Cookie = ";" + req.http.Cookie;
    set req.http.Cookie = regsuball(req.http.Cookie, "; +", ";");
    set req.http.Cookie = regsuball(req.http.Cookie, ";(SESS[a-z0-9]+|SSESS[a-z0-9]+|NO_CACHE)=", "; \1=");
    set req.http.Cookie = regsuball(req.http.Cookie, ";[^ ][^;]*", "");
    set req.http.Cookie = regsuball(req.http.Cookie, "^[; ]+|[; ]+$", "");

    if (req.http.Cookie == "") {
      # If there are no remaining cookies, remove the cookie header. If there
      # aren't any cookie headers, Varnish's default behavior will be to cache
      # the page.
      unset req.http.Cookie;
    }
    else {
      # If there is any cookies left (a session or NO_CACHE cookie), do not
      # cache the page. Pass it on to Apache directly.
      return (pass);
    }


# removing cookies for static files

sub vcl_backend_response {
    # Remove cookies for stylesheets, scripts and images used throughout the site.
    # Removing cookies will allow Varnish to cache those files. It is uncommon for
    # static files to contain cookies, but it is possible for files generated
    # dynamically by Drupal. Those cookies are unnecessary, but could prevent files
    # from being cached.
    if (bereq.url ~ "(?i)\.(css|js|jpg|jpeg|gif|png|ico)(\?.*)?$") {
        unset beresp.http.set-cookie;
    }
}
