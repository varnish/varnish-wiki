# exclude wordpress url

if (req.url ~ "wp-admin|wp-login") {

return (pass);

}
