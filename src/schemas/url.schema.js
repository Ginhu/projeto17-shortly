import joi from "joi"

export const urlSchema = joi.object({
    email: joi.string().uri().required( )
})