import bcrypt from "bcrypt"
import { getUserDataByEmail } from "../repositories/user.repository.js"
import { getSessionDataByToken } from "../repositories/auth.repository.js"

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
        const userData = await getUserDataByEmail(email)
        if(userData.rowCount === 0) return res.sendStatus(401)
        if(!bcrypt.compareSync(password, userData.rows[0].password)) res.sendStatus(401)

        res.locals.userId = userData.rows[0].id

        next()
    } catch (err) {
        console.log(err.message)
    }
}

export async function validateSession (req, res, next) {
    const {authorization} = req.headers
    const token = authorization?.replace("Bearer ", "")

    try { 
        if(!authorization) return res.sendStatus(401)
        const session = await getSessionDataByToken(token)
        if(session.rowCount === 0) return res.sendStatus(401)
        res.locals.userId = session.rows[0].userId
    
        next()
    } catch (err) {
        console.log(err.message)
    }
}