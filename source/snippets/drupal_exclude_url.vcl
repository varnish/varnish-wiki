# exclude drupal login url from caching

if (req.url ~ "^/status\.php$" ||
    req.url ~ "^/update\.php$" ||
    req.url ~ "^/drupal_admin$" ||
    req.url ~ "^/drupal_admin/.*$" ||
    req.url ~ "^/drupal_user$" ||
    req.url ~ "^/drupal_user/.*$" ||
    req.url ~ "^/flag/.*$") {
       return (pass);
     }) {

    return (pass);
}
