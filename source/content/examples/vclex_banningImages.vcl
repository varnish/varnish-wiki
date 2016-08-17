#banning images with png and jpeg extension

sub vcl_recv{

  ban req.http.host == "example.com" && req.url ~ "\\.png$"
}
