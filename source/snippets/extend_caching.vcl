# extending caching time

sub vcl_backend_response {

  if (beresp.ttl == 120s) {

    set beresp.ttl = 1h;

}
}
