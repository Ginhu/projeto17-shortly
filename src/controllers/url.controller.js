import { nanoid } from "nanoid"
import { deleteUrlData, insertUrlData, updateUrlCount } from "../repositories/url.repository.js"


export async function urlSubmission (req, res) {
    const {url, userId} = res.locals
    const shortUrl = nanoid(8)
    const userIdInt = parseInt(userId)
    try {
        await insertUrlData(url, shortUrl, userIdInt)
        
        const body = {
            "id": userId,
            "shortUrl": shortUrl
        }

        res.status(201).send(body)
    } catch (err) {
        console.log(err.message)
    }
} 

export function getUrlById (req, res) {
    const {id, shortUrl, url} = res.locals

    const body = {
        id: id,
        shortUrl: shortUrl,
        url: url
    }

    res.status(200).send(body)
}

export async function getShortUrl (req, res) {
    const {urlReg} = res.locals
    const count = urlReg.visitCount +1
    const id = parseInt(urlReg.id)
    try {
        await updateUrlCount(count, id)
        res.redirect(302, urlReg.url)
    } catch (err) {
        console.log(err.message)
    }
}

export async function deleteUrl (req, res) {
    const {id} = res.locals

    try {
        await deleteUrlData(id)
        res.sendStatus(204)
    } catch (err) {
        console.log(err.message)
    }
}