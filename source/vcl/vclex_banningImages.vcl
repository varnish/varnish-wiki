#banning images with png and jpeg extension

ban req.http.host == "example.com" && req.url ~ "\\.png$"
