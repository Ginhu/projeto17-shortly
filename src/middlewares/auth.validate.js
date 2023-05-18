import {db} from "../database/database.connection.js"
import bcrypt from "bcrypt"

export function validateSignin(schema) {
    return (req, res, next) => {
        const { email, password } = req.body
        res.locals.email = email
        res.locals.password = password
        
        const validation = schema.validate(req.body, { abortEarly: false })

        if (validation.error) {
            const errors = validation.error.details.map(err=>err.message)
            return res.status(422).send(errors)
        }
        next()
    }
}

export async function validateEmailPassword (req, res, next) {
    const { email, password } = res.locals

    try {
        const userData = await db.query(`SELECT * FROM users WHERE email=$1`, [email])
        if(userData.rowCount === 0) return res.sendStatus(401)
        if(!bcrypt.compareSync(password, userData.rows[0].password)) res.sendStatus(401)

        res.locals.userId = userData.rows[0].id

        next()
    } catch (err) {
        console.log(err.message)
    }
}

export async function validateSession (req, res, next) {
    const {Authorization} = req.headers
    const token = Authorization?.replace("Bearer ", "")

    try { 
        if(!Authorization) return res.sendStatus(401)
        const session = await db.query(`SELECT * FROM sessions WHERE "sessionToken"=$1`, [token])
        if(session.rowCount === 0) return res.sendStatus(401)
    } catch (err) {
        console.log(err.message)
    }
}