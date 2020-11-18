import * as http from "http"

import * as url from "url"

import * as fileman from "./Token"
import * as vote from "./Vote"
import * as info from "./Info"

//The Secret Token for accessing Token Managing
const secrettoken = "toor"

http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/plain'});

    var query = url.parse(req.url, true).query

    if (req.url.startsWith("/registerifnotexistss")) {

        if (query["uniqueid"] === undefined) {
            res.end("-1")
            return
        }

        fileman.register(query["uniqueid"])
        res.end("0")

    } else if (req.url.startsWith("/getpoints")) {

        if (query["uniqueid"] === undefined) {
            res.end("-1")
            return
        }

        res.end(fileman.getPlayerPoints(query["uniqueid"]))

    } else if (req.url.startsWith("/registervideoselect")) {

    } else if (req.url.startsWith("/getvideoselect")) {

    } else if (req.url.startsWith("/registercode")) {
        if (query["secrettoken"] === undefined) {
            res.end("-1")
            return
        }

        fileman.createToken(query["code"], query["points"])
        res.end("1")
    } else if (req.url.startsWith("/usecode")) {
        if (query["uniqueid"] === undefined) {
            res.end("-1")
            return
        }

        if (!fileman.tokenIsValid(query["code"])) {
            res.end("-2")
            return
        }

        fileman.setPoints(query["uniqueid"], fileman.getPoints(query["code"]))
        res.end(fileman.getPoints(query["code"]))
        fileman.removeToken(query["code"])

    } else if (req.url.startsWith("/addinfo")) {
        if (query["secrettoken"] === undefined) {
            res.end("-1")
            return
        }

        var info = new info.Info()

        info.header = query["header"]
        info.desc = query["desc"]
        info.img = query["img"]

        info.addInfo(info)
        res.end("1")
    } else if (req.url.startsWith("/getvideoselect")) {
        res.end(info.getInfo())
    }

}).listen(8080);