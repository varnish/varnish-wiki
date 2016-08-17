# Called when VCL is loaded, before any requests pass through it.
# Typically used to initialize VMODs.

sub vcl_init {
  new vdir = directors.round_robin();
  vdir.add_backend(server_n);
}
