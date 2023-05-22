import bcrypt from "bcrypt"
import { getRankingData, getUserData, insertSignup } from "../repositories/user.repository.js"

export async function singup(req, res) {
    const {name, email, password} = res.locals
    const encryptedPw = bcrypt.hashSync(password, 10)
    try {
        await insertSignup(name, email, encryptedPw)
        res.sendStatus(201)
    } catch (err) {
        console.log(err.message)
    }

}

export async function getMe (req, res) {
    const {userId} = res.locals
    let visitCountTotal = 0
    try {

        const userReg = await getUserData(userId)

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

export async function ranking(req, res) {
    try {
        const ranking = await getRankingData()

        const body = ranking.rows.map(el=> {
            return {
                id: el.id,
                name: el.name,
                linksCount: el.links,
                visitCount: el.visits
            }
        })

        res.status(200).send(body)
    } catch (err) {
        console.log(err.message)
    }
}