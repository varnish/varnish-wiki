# Exclude from Cache

sub vcl_recv {
 if (req.url ~ "\?" || req.url ~ "\/cug_") {
   return(pass);
 }
}
sub vcl_backend_fetch {
 if (beresp.http.Dispatcher ~ "no-cache"
 || beresp.http.cache-control ~ "(no-cache|private)"
 || beresp.http.pragma ~ "no-cache") {
   set beresp.ttl = 0s;
 }
 else {
   set beresp.ttl = 4w;
 }
}

# http://www.pro-vision.de/content/dam/pro-vision/production/adaptto/2013/adaptto2013-become-happier-by-using-varnish-cache-stefan-maurer-.pdf/_jcr_content/renditions/original./adaptto2013-become-happier-by-using-varnish-cache-stefan-maurer-.pdf
