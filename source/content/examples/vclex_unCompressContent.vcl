
sub vcl_backend_response {
    if (beresp.http.content-type ~ "text") {
        set beresp.do_gunzip = true;
    }
}
