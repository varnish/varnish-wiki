sub vcl_fetch {
       set beresp.ttl = 5s;
}
