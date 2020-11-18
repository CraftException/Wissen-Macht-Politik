import * as fileMan from "./Token"

class Vote {

    type:Type
    header:string
    desc:string
    img:string

    choices:string[]

}

enum Type {
    CHOICE, SELECT
}

import * as fs from "fs"

export var parsedVoteContent = JSON.parse(fs.readFileSync("vote.json", "utf-8"))

export function addVote (uniqueid, vote:Vote, choice:string) {
    fileMan.parsedContent[uniqueid].vote[vote.header] = choice
    fs.writeFileSync('user.json', JSON.stringify(fileMan.parsedContent))
}

export function hasVoted (uniqueid, voteheader) {
    return fileMan.parsedContent[uniqueid].vote[voteheader.header]
}

export function createVote (vote:Vote) {
    parsedVoteContent[vote.header] = vote
    fs.writeFileSync('vote.json', JSON.stringify(parsedVoteContent))
}

export function closeVote (header: string) {
    delete parsedVoteContent[header]
    fs.writeFileSync('vote.json', JSON.stringify(parsedVoteContent))
}