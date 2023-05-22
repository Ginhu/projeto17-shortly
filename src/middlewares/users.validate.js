import { getUserDataByEmail } from "../repositories/user.repository.js"

export function validateSignup(schema) {
    return (req, res, next) => {
        const {name, email, password, confirmPassword} = req.body
        res.locals.name = name
        res.locals.email = email
        res.locals.password = password
        res.locals.confirmPassword = confirmPassword
        const validation = schema.validate(req.body, { abortEarly: false })

        if (validation.error) {
            const errors = validation.error.details.map(err=>err.message)
            return res.status(422).send(errors)
        }
        next()
    }
}

export function validatePassword(req, res, next) {
    const {password, confirmPassword} = res.locals

    if(password != confirmPassword) return res.sendStatus(422)

    next()
}

export async function validateEmail (req, res, next) {
    const {email} = res.locals

    try {
        const findEmail = await getUserDataByEmail(email)
        if(findEmail.rowCount != 0) return res.sendStatus(409)
        next()
    } catch (err) {
        console.log(err.message)
    }
}