import {db} from "../database/database.connection.js"
import {v4 as uuid} from "uuid"

export async function signin(req, res) {
    const {userId} = res.locals
    const token = uuid()
    const resToken = { token: token }

    try {
        await db.query(`INSERT INTO sessions ("userId", "sessionToken") VALUES ($1, $2)`, [userId, token])
        res.status(200).send(resToken)
    } catch (err) {
        console.log(err.message)
    }
}