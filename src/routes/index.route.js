import { Router } from "express"
import userRouter from "./user.route.js"
import authRouter from "./auth.route.js"
import urlRouter from "./url.route.js"


const router = Router()

router.use(userRouter)
router.use(authRouter)
router.use(urlRouter)

export default router