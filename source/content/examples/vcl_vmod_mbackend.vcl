import directors;    # load the directors

backend server1 {
    .host = "192.168.0.10";
}
backend server2 {
    .host = "192.168.0.10";
}

sub vcl_init {
    new bar = directors.round_robin();
    bar.add_backend(server1);
    bar.add_backend(server2);
}

sub vcl_recv {
    # send all traffic to the bar director:
    set req.backend_hint = bar.backend();
}
