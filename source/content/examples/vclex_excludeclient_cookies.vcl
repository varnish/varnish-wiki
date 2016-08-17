# include this snippet as part of the vcl_recv in the defaut.vcl file

if (!(req.url ~ "^/login/")) {
    unset req.http.Cookie;
}
