vcl 4.0;

backend default {
  .host = "127.0.0.1";  # The domain or IP address of your ExpressionEngine Site
  .port = "8080";       # The port of your EE site. In production, Varnish should be on port 80, so consider changing your Apache server to port 8080
  .probe = {
    .url = "/";
    .timeout = 1000ms;
    .interval = 1s;
    .window = 10;
    .threshold = 8;
    }
}

sub vcl_recv {

  # Forward client's IP to backend
  unset req.http.X-Forwarded-For;
  set req.http.X-Forwarded-For = client.ip;

  # Set the URI of your system directory
  # In this example, we assume your admin interface is in "system", so just ensure it's right for your setup.
  if (req.url ~ "^/system/" ||
    req.url ~ "ACT=" ||
    req.method == "POST" ||
    (req.url ~ "member_box" && req.http.Cookie ~ "exp_sessionid"))
    {
      return (pass);
    }

  unset req.http.Cookie;

    # This is different, read this: https://www.varnish-software.com/blog/grace-varnish-4-stale-while-revalidate-semantics-varnish
    # set req.grace = 1h;

  return(hash);
}

sub vcl_backend_response {

    # Enable ESI includes
  set beresp.do_esi = true;

    # Our cache TTL
  set beresp.ttl = 1m;

    # set beresp.grace = 1h;

  return(deliver);
}
