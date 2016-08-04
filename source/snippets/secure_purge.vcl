acl purge {
  "localhost";
  server ip address or hostname;
}

...

if (req.method == "PURGE") {

if (client.ip !~ purge) {

return (synth(405));

}
