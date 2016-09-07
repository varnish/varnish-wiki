
DAEMON _OPTS="-a :80\
  -T localhost:6082
  -f /etc/varnish/default.vcl
  -s malloc,256m"
  -S /etc/varnish/secret
