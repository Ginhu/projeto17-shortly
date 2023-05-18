import { nanoid } from "nanoid"
import {db} from "../database/database.connection.js"


export async function urlSubmission (req, res) {
    const {url, userId} = res.locals
    const shortUrl = nanoid(8)

    try {
        await db.query(`INSERT INTO urls (url, "shortUrl", "userId") VALUES ($1, $2, $3)`, [url, shortUrl, userId])
        
        const body = {
            "id": userId,
            "shortUrl": shortUrl
        }

        res.status(201).send(body)
    } catch (err) {
        console.log(err.message)
    }
} 

export async function getUrlById (req, res) {
    const {id} = req.params

    try {
        const getUrl = await db.query(`SELECT * FROM urls WHERE id=$1`, [id])
        if(getUrl.rowCount === 0) return res.sendStatus(404)
        const body = {
            id: id,
            shortUrl: getUrl.rows[0].shortUrl,
            url: getUrl.rows[0].url
        }

        res.status(200).send(body)
    } catch (err) {
        console.log(err.message)
    }
}