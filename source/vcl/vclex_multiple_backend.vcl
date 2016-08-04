backend server1 {
        .host = server1;
        .port = "8080";

        #these are needed if you also want to do load balancing for your servers
        .max_connections = 250;
        .connect_timeout = 500s;
        # there are more parameters you can add here, check out the Reference.
}

backend server2 {
        .host = server2;
        .port = "8081";
}


sub vcl_rec {
  if (req.url ~ "^/server1") {
          set req.backend_hint = server1;
      } else {
          set req.backend_hint = server2;
      }
}
