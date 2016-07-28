backend server1 {
        .host = server1;
        .port = "8080";
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
