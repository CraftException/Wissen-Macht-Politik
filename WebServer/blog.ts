import * as fs from "fs"

export var parsedBlogContent = JSON.parse(fs.readFileSync("blog.json", "utf-8"))

if (parsedBlogContent.news === undefined) {
    parsedBlogContent.news = []
    fs.writeFileSync('blog.json', JSON.stringify(parsedBlogContent))
}

if (parsedBlogContent.covid === undefined) {
    parsedBlogContent.covid = []
    fs.writeFileSync('blog.json', JSON.stringify(parsedBlogContent))
}

if (parsedBlogContent.germany === undefined) {
    parsedBlogContent.germany = []
    fs.writeFileSync('blog.json', JSON.stringify(parsedBlogContent))
}

export function getPosts (group) {
    return JSON.stringify(parsedBlogContent[group])
}

export function addBlogPost (group, post:Post) {
    parsedBlogContent[group].push(post)
}

export function deleteBlogPost (group, postheader:string) {
    for (var i = 0; parsedBlogContent[group].length; i++) {
        if (parsedBlogContent[group][i].header === postheader) {
            delete parsedBlogContent[group][i]
        }
    }
}

export class Post {

    header:string
    content:string

    image:string

    author:string
    date:string

}