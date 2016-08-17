backend default  {
.host = "127.0.0.1";
.port = "80";
.max_connections = 1024;
}

backend apache {
.host = "127.0.0.1";
.port = "8080";
.max_connections = 1024;
.first_byte_timeout = 300s;
}

acl purge {
    "localhost";
}

sub  vcl_fetch{

       # strip the cookie before the image is inserted into cache.
       if  (req.url~  "\.(png|gif|jpg|swf|css|js)$")  {
       unset beresp.http.set-cookie;
       }

               ## Remove the X-Forwarded-For header if it exists.
               remove req.http.X-Forwarded-For;

               ## insert the client IP address as X-Forwarded-For. This is the normal IP address of the user.
               set  req.http.X-Forwarded-For  =  req.http.rlnclientipaddr;

               // Dont cache 302 redirects and anything else other than what should be cached
               if  (beresp.status!=  200  &&  beresp.status!=  404)  {
                 set  beresp.ttl=  0s;
                 return  (deliver);
               }

               ## Deliver the content
               return(deliver);
}


## Deliver
sub  vcl_deliver{

               ## We'll be hiding some headers added by Varnish. We want to make sure people are not seeing we're using Varnish.
               ## Since we're not caching (yet), why bother telling people we use it?
               remove resp.http.X-Varnish;
               remove resp.http.Via;
               remove resp.http.Age;

               ## We'd like to hide the X-Powered-By headers. Nobody has to know we can run PHP and have version xyz of it.
               remove resp.http.X-Powered-By;

               if  (obj.hits>  0)  {
                                               set  resp.http.X-Cache  =  "HIT";
               }  else  {
                                               set  resp.http.X-Cache  =  "MISS";
               }

}

sub  vcl_recv{

               if (req.http.Host == "westeros.org" || req.http.Host == "www.westeros.org" || req.http.Host == "testsite.westeros.org" || req.http.Host ~ "hippokrene.com" || req.http.Host ~ "hippoiathanatoi.com" ) {
                   set req.backend = apache;
               }

        if (req.http.Host ~ "hippoiathanatoi\.com") {
           return (pass);
        }

               remove req.http.X-Forwarded-For;
               if (req.http.CF-Connecting-IP) {
                     set req.http.X-Forwarded-For = req.http.CF-Connecting-IP;
               } else {
                     set req.http.X-Forwarded-For = client.ip;
               }

               ## We have to pipe file downloads or varnish may cut off long download times
               if  (req.url~  "files")  {
                                return  (pipe);
               }

               if  (req.request == "PURGE") {
                    if(!client.ip ~ purge) {
                         error 405 "Not allowed.";
                    }
                    return (lookup);
               }

               set  req.http.X-Device  =  "pc";
               if  (req.http.User-Agent  ~  "iPad"  ||  req.http.User-Agent  ~  "iP(hone|od)" ||  req.http.User-Agent  ~  "Android"  ||  req.http.User-Agent  ~  "SymbianOS"  ||  req.http.User-Agent  ~  "^BlackBerry"  ||  req.http.User-Agent  ~  "^SonyEricsson"  ||
               req.http.User-Agent  ~  "^Nokia"  ||  req.http.User-Agent  ~  "^SAMSUNG"  ||  req.http.User-Agent  ~  "^LG")
               {
                 set  req.http.X-Device  =  "mobile";
               }

               if  (req.request==  "POST")  {
                 return  (pass);
               }

               if (req.url~ "/server-status" ) {
                 return (pass);
               }

               if (req.url~ "^/Scripts/ExpressionEngine/valyria" || req.url~ "ACT=") {
                 return (pass);
               }

               if  (req.url~  "(section=markasread|section=login|register)")  {
                 return  (pass);
               }
               else  {
                 // Remove has_js and Google Analytics __* cookies.
                 set  req.http.Cookie  =  regsuball(req.http.Cookie,  "(^|;\s*)(_[_a-z]+|has_js)=[^;]*",  "");
                 // Remove a ";" prefix, if present.
                 set  req.http.Cookie  =  regsub(req.http.Cookie,  "^;\s*",  "");
                 if  (req.http.cookie&&  ((req.http.cookie~ "exp_sessionid") || (req.http.cookie~  "member_id"  &&  req.http.cookie!~  "member_id=(0|-1)")))  {

                                                 if  (req.url~  "\.(png|gif|jpg|swf|css|js)$")  {
                                                                                 return(lookup);
                                                 }
                                                 else                                                    {
                                                                                 return(pass);
                                                 }

                                }
                 else {
                               unset req.http.cookie;
                               set  req.grace=  15s;
                 }

               }

}

sub  vcl_hash{

               if (req.http.cookie&& (req.http.cookie~ "member_id"))
               {
                  hash_data(regsuball(req.http.Cookie, "^.*;? ?PHPSESSID=([a-z0-9]+)( ?|;| ;).*$","\1"));
               }

               hash_data(req.http.host);
               hash_data(req.url);
               hash_data(req.http.X-Device);

               return  (hash);
}

sub  vcl_hit {
        if (req.request == "PURGE") {
        purge;
                error 200 "Purged.";
        }
}

sub  vcl_miss {
        if (req.request == "PURGE") {
        purge;
                error 200 "Purged.";
        }
}

# source: https://justpaste.it/s86e
# Created : 13th March 2016
# Accessed: 16th August 2016
# Posted by: https://ellislab.com/forums/member/18664/
# varnish 3.0
