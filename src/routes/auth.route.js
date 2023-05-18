import { Router } from "express"
import { validateEmailPassword, validateSignin } from "../middlewares/auth.validate.js"
import { authSchema } from "../schemas/auth.schema.js"
import { signin } from "../controllers/auth.controiller.js"

const authRouter = Router()

authRouter.post("/signin", validateSignin(authSchema), validateEmailPassword, signin)

export default authRouter