import * as fs from "fs"
import * as vote from "./Vote"

export var parsedContent = JSON.parse(fs.readFileSync("user.json", "utf-8"))
export var parsedCodeContent = JSON.parse(fs.readFileSync("codes.json", "utf-8"))

export function exists(uniqueid) {
    return parsedContent[uniqueid] !== undefined
}

export function register (uniqueid) {
    parsedContent[uniqueid].count = 1
    vote.parsedVoteContent[uniqueid].votes = []
    fs.writeFileSync('vote.json', JSON.stringify(vote.parsedVoteContent))
    fs.writeFileSync('user.json', JSON.stringify(parsedContent))
}

export function setPoints (uniqueid, count) {
    parsedContent[uniqueid].count = count
    fs.writeFileSync('user.json', JSON.stringify(parsedContent))
}

export function getPlayerPoints (uniqueid) {
    return parsedContent[uniqueid].count
}

export function createToken (code, points) {
    parsedCodeContent[code] = points
    fs.writeFileSync('codes.json', JSON.stringify(parsedCodeContent))
}

export function tokenIsValid (code) {
    return parsedCodeContent[code] !== undefined
}

export function getPoints (code) {
    return parsedCodeContent[code]
}

export function removeToken (code) {
    delete parsedCodeContent[code]
}