import * as fileMan from "./Token"

export class Info {

    header:string
    desc:string
    img:string

}

import * as fs from "fs"

export var parsedInfoContent = JSON.parse(fs.readFileSync("infos.json", "utf-8"))

export function addInfo (info:Info) {
    parsedInfoContent.push(info)
    fs.writeFileSync('infos.json', JSON.stringify(parsedInfoContent))
}

export function getInfo() {
    return parsedInfoContent
}