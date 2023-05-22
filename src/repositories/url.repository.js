import { db } from "../database/database.connection.js"

export function insertUrlData (url, shortUrl, userIdInt) {
    return db.query(`INSERT INTO urls (url, "shortUrl", "userId") VALUES ($1, $2, $3)`, [url, shortUrl, userIdInt])
}

export function updateUrlCount (count, id) {
    return db.query(`UPDATE urls SET "visitCount"=$1 WHERE id=$2`, [count, id])
}

export function deleteUrlData(id) {
    return db.query(`DELETE FROM urls WHERE id=$1`, [id])
}

export function getShortUrlData(shortUrl) {
    return db.query(`SELECT * FROM urls WHERE "shortUrl"=$1`, [shortUrl])
}

export function getUrlDataById(id) {
    return db.query(`SELECT * FROM urls WHERE id=$1`, [id])
}