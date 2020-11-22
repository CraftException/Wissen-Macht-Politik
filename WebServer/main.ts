console.log("------------------------------------------------------------" +
            "\n" +
    " __          ____  __ _____    __          ________ ____  \n" +
    " \\ \\        / /  \\/  |  __ \\   \\ \\        / /  ____|  _ \\ \n" +
    "  \\ \\  /\\  / /| \\  / | |__) |   \\ \\  /\\  / /| |__  | |_) |\n" +
    "   \\ \\/  \\/ / | |\\/| |  ___/     \\ \\/  \\/ / |  __| |  _ < \n" +
    "    \\  /\\  /  | |  | | |          \\  /\\  /  | |____| |_) |\n" +
    "     \\/  \\/   |_|  |_|_|           \\/  \\/   |______|____/ \n" +
    "                                                          \n" +
    "                                                          \n" +
    "Version: " + process.version + "\n" +
    "Developer: CraftException\n" +
            "------------------------------------------------------------"
            )

console.log("Initializing Services!")

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

    if (req.url.startsWith("/registerifnotexists")) {

        if (query["uniqueid"] === undefined) {
            res.end("-1")
            return
        }

        if (!fileman.exists(query["uniqueid"])) {
            fileman.register(query["uniqueid"])
        }
        res.end("0")

    } else if (req.url.startsWith("/getpoints")) {

        if (query["uniqueid"] === undefined) {
            res.end("-1")
            return
        }

        res.end(fileman.getPlayerPoints(query["uniqueid"]).toString())

    } else if (req.url.startsWith("/registervote")) {
        if (query["secrettoken"] === undefined || secrettoken != query["secrettoken"]) {
            res.end("-1")
            return
        }

        var xVote = new vote.Vote()

        xVote.header = query["header"].toString()
        xVote.desc = query["desc"].toString()

        if (query["type"] === "1") {
            xVote.type = vote.Type.SELECT
        } else {
            xVote.type = vote.Type.CHOICE
            xVote.choices = JSON.parse(query["choices"].toString())
        }

        xVote.img = query["img"].toString()

        vote.createVote(xVote)
        res.end("1")
    } else if (req.url.startsWith("/hasvoted")) {
        if (query["uniqueid"] === undefined || query["voteheader"] === undefined) {
            res.end("-1")
            return
        }

        res.end(vote.hasVoted(query["uniqueid"], query["voteheader"]) + "")
    } else if (req.url.startsWith("/vote")) {
        if (query["uniqueid"] === undefined || query["voteheader"] === undefined) {
            res.end("-1")
            return
        }

        vote.addVote(query["uniqueid"], query["voteheader"], query["choice"]);
        res.end(0)
    } else if (req.url.startsWith("/getvotes")) {
        res.end(JSON.stringify(vote.parsedVoteContent.votes))
    } else if (req.url.startsWith("/getvoter")) {
        res.end(JSON.stringify(vote.parsedVoteContent.vote))
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
        res.end("1")
        fileman.removeToken(query["code"])

    } else if (req.url.startsWith("/addinfo")) {
        if (query["secrettoken"] === undefined || secrettoken != query["secrettoken"]) {
            res.end("-1")
            return
        }

        var xInfo = new info.Info()

        xInfo.header = query["header"].toString()
        xInfo.desc = query["desc"].toString()
        xInfo.img = query["img"].toString()

        info.addInfo(xInfo)
        res.end("1")
    } else if (req.url.startsWith("/getinfo")) {
        res.end(JSON.stringify(info.getInfo()))
    } else {
        res.end("Unknown Request")
    }

}).listen(8081);

console.log("HTTP-Server started! Listening to all Requests on Port 8081")