import { nanoid } from "nanoid"
import {db} from "../database/database.connection.js"

export async function urlSubmission (req, res) {
    const {url, userId} = res.locals
    const shortenUrl = nanoid(8)

    try {
        await db.query(`INSERT INTO urls (url, "shortenUrl", "userId") VALUES ($1, $2, $3)`, [url, shortenUrl, userId])
        
        const body = {
            "id": userId,
            "shortenUrl": shortenUrl
        }

        res.status(201).send(body)
    } catch (err) {
        console.log(err.message)
    }
} 