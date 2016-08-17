#handling purge requsets

sub vcl_recv{
  ...
  if (req.method == "PURGE") {

    if (req.http.X-Purge-Method == "regex") {

      ban("req.url ~ " + req.url + " &amp;&amp; req.http.host ~ " + req.http.host);

    return (synth(200, "Banned."));

  } else {

    return (purge);

  }
  }
}
