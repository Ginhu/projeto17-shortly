import { db } from "../database/database.connection.js";

export function insertSignup(name, email, encryptedPw) {
    return db.query(`INSERT INTO users (name, email, password) VALUES ($1, $2, $3)`, [name, email, encryptedPw])
}

export function getUserData (userId) {
    return db.query(`SELECT users.*, urls.id AS "urlId", urls.url, urls."shortUrl", urls."visitCount"
    FROM users 
    JOIN urls ON users.id=urls."userId"
    WHERE users.id=$1;`, [userId])
}

export function getRankingData() {
    return db.query(`SELECT users.*, COALESCE(SUM("visitCount"),0) AS visits, COUNT("userId") AS Links 
    FROM users 
    LEFT JOIN urls ON users.id=urls."userId" 
    GROUP BY users.id 
    ORDER BY visits DESC 
    LIMIT 10;`)
}

export function getUserDataByEmail(email) {
    return db.query(`SELECT * FROM users WHERE email=$1`, [email])
}