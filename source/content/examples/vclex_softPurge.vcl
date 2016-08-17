sub vcl_hit {
    if (req.method == "PURGE") {
        softpurge.softpurge();
    }
}
