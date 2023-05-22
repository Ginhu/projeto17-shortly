import {v4 as uuid} from "uuid"
import { insertSigninData } from "../repositories/auth.repository.js"

export async function signin(req, res) {
    const {userId} = res.locals
    const token = uuid()
    const resToken = { token: token }

    try {
        await insertSigninData(userId, token)
        res.status(200).send(resToken)
    } catch (err) {
        console.log(err.message)
    }
}