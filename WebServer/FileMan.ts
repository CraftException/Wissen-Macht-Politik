import * as fs from "fs"

var parsedContent = fs.readFileSync("data.json")

export function exists(uniqueid) {

    return parsedContent[uniqueid] !== undefined

}

export function register (uniqueid) {
    // @ts-ignore
    parsedContent[uniqueid].count = 1
    // @ts-ignore
    parsedContent[uniqueid].voted = []
}

export function setCode (uniqueid, count) {
    // @ts-ignore
    parsedContent[uniqueid].count = count
}

export function getCode (uniqueid) {
    // @ts-ignore
    return parsedContent[uniqueid].count
}
