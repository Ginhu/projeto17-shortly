import { Router } from "express"
import { validateEmail, validatePassword, validateSignup } from "../middlewares/users.validate.js"
import { userSchema } from "../schemas/users.schemas.js"
import { getMe, ranking, singup } from "../controllers/user.controller.js"
import { validateSession } from "../middlewares/auth.validate.js"


const userRouter = Router()

userRouter.post("/signup", validateSignup(userSchema), validatePassword, validateEmail, singup)
userRouter.get("/users/me", validateSession, getMe)
userRouter.get("/ranking", ranking)
export default userRouter