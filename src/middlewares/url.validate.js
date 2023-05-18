import { db } from "../database/database.connection.js"

export function validateUrlBody (schema) {
    return (req, res, next) => {
        const {url} = req.body
        const validation = schema.validate(req.body, { earlyAbort: false })

        res.locals.url = url

        if(validation.error) {
            const errors = validation.error.details.map(err=>err.message)
            return res.status(422).send(errors)
        }
        next()
    }
}

export async function validateShortUrl (req, res, next) {
    const {shortUrl} = req.params

    try {
        const shortUrlReg = await db.query(`SELECT * FROM urls WHERE "shortUrl"=$1`, [shortUrl])
        if(shortUrlReg.rowCount === 0) return res.sendStatus(404)
        res.locals.urlReg = shortUrlReg.rows[0]

        next()
    } catch (err) {
        console.log(err.message)
    }
} 

export async function validateUrlById (req, res, next) {
    const {id} = req.params

    try {
        const getUrl = await db.query(`SELECT * FROM urls WHERE id=$1`, [id])
        if(getUrl.rowCount === 0) return res.sendStatus(404)

        res.locals.id = id
        res.locals.shortUrl = getUrl.rows[0].shortUrl
        res.locals.url = getUrl.rows[0].url
        res.locals.urlUserId = getUrl.rows[0].userId

        next()
    } catch (err) {
        console.log(err.message)
    }
}

export function validateOwnership (req, res, next) {
    const {userId, urlUserId} = res.locals

    if(userId != urlUserId) return res.sendStatus(401)

    next()
}