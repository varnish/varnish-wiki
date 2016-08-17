# Normalize Accept-Language

if (req.http.Accept-Language) {
    if (req.http.Accept-Language ~ "en") {
        set req.http.Accept-Language = "en";
    } elsif (req.http.Accept-Language ~ "de") {
        set req.http.Accept-Language = "de";
    } elsif (req.http.Accept-Language ~ "fr") {
        set req.http.Accept-Language = "fr";
    } else {
        # unknown language. Remove the accept-language header and
        # use the backend default.
        unset req.http.Accept-Language
    }
}
