import * as http from "http"

http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/plain'});

    if (req.url.startsWith("/registerifnotexistss")) {

    } else if (req.url.startsWith("/registercode")) {

    } else if (req.url.startsWith("/getcode")) {

    } else if (req.url.startsWith("/registervideoselect")) {

    } else if (req.url.startsWith("/getvideoselect")) {

    }

}).listen(8080);