import * as fileMan from "./Token"

export class Vote {

    type:Type
    header:string
    desc:string
    img:string

    choices:string[]

}

export enum Type {
    CHOICE, SELECT
}

import * as fs from "fs"

export var parsedVoteContent = JSON.parse(fs.readFileSync("vote.json", "utf-8"))
if (parsedVoteContent.votes === undefined)
    parsedVoteContent.votes = {}

export function addVote (uniqueid, vote, choice) {
    parsedVoteContent[uniqueid][vote] = choice
    fs.writeFileSync('vote.json', JSON.stringify(parsedVoteContent))
}

export function hasVoted(uniqueid, voteheader) {
    return parsedVoteContent[uniqueid][voteheader] !== undefined
}

export function createVote (vote:Vote) {
    parsedVoteContent.votes[vote.header] = vote
    fs.writeFileSync('vote.json', JSON.stringify(parsedVoteContent))
}

export function closeVote (header: string) {
    delete parsedVoteContent.votes[header]
    fs.writeFileSync('vote.json', JSON.stringify(parsedVoteContent))
}

export function getVotesInVote (header) {
    var votes = []

    Object.keys(parsedVoteContent).forEach(function(key) {
        if (key !== 'votes') {
            if (key[header] !== undefined) {
                votes.push(key[header])
            }
        }
    })

    return votes
}