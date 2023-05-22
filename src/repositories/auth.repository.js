import { db } from "../database/database.connection.js";

export function insertSigninData(userId, token) {
    return db.query(`INSERT INTO sessions ("userId", "sessionToken") VALUES ($1, $2)`, [userId, token])
}

export function getSessionDataByToken(token) {
    return db.query(`SELECT * FROM sessions WHERE "sessionToken"=$1`, [token])
}