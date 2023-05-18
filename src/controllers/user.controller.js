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