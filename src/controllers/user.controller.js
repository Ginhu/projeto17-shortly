import {db} from "../database/database.connection.js"
import bcrypt from "bcrypt"

export async function singup(req, res) {
    const {name, email, password} = res.locals
    const encryptedPw = bcrypt.hashSync(password, 10)
    try {
        await db.query(`INSERT INTO users (name, email, password) VALUES ($1, $2, $3)`, [name, email, encryptedPw])
        res.sendStatus(201)
    } catch (err) {
        console.log(err.message)
    }

}

export async function getMe (req, res) {
    const {userId} = res.locals
    const id = parseInt(userId)
    let visitCountTotal = 0
    try {

        const userReg = await db.query(`SELECT users.*, urls.id AS "urlId", urls.url, urls."shortUrl", urls."visitCount"
        FROM users 
        JOIN urls ON users.id=urls."userId"
        WHERE users.id=$1;`, [userId])

        const urls = userReg.rows.map(el=> {
            visitCountTotal +=el.visitCount
            return {
                id: el.urlId,
                shortUrl: el.shortUrl,
                url: el.url,
                visitCount: el.visitCount
            }
        })

        const body = {
            id: userReg.rows[0].id,
            name: userReg.rows[0].name,
            visitCount: visitCountTotal,
            shortenedUrls: urls
        }

        res.status(200).send(body)
    } catch (err) {
        console.log(err.message)
    }
}