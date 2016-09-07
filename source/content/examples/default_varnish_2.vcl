DAEMON_OPTS="-a :80 \
  -T localhost:6082 \
  -b 95.85.10.242:8081 \
  -S /etc/varnish/secret \
  -s malloc,256m"
