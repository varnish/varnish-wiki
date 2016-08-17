# exclude drupal login url from caching

  if (req.url ~ "^/status\.php$" ||
     req.url ~ "^/update\.php" ||
     req.url ~ "^/install\.php" ||
     req.url ~ "^/admin" ||
     req.url ~ "^/admin/.*$" ||
     req.url ~ "^/user" ||
     req.url ~ "^/user/.*$" ||
     req.url ~ "^/users/.*$" ||
     req.url ~ "^/info/.*$" ||
     req.url ~ "^/flag/.*$" ||
     req.url ~ "^.*/ajax/.*$" ||
     req.url ~ "^.*/ahah/.*$") {
     return (pass);
  }
