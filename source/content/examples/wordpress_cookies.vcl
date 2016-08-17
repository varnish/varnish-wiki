#unsetting wordpress cookies

sub vcl_rec{
  ..

  set req.http.cookie = regsuball(req.http.cookie, "wp-settings-\d+=[^;]+(; )?", "");

  set req.http.cookie = regsuball(req.http.cookie, "wp-settings-time-\d+=[^;]+(; )?", "");

  set req.http.cookie = regsuball(req.http.cookie, "wordpress_test_cookie=[^;]+(; )?", "");

  if (req.http.cookie == "") {

  unset req.http.cookie;
  }
}
