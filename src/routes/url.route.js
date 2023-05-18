import { Router } from "express"
import { validateUrlBody } from "../middlewares/url.validate.js"
import { validateSession } from "../middlewares/auth.validate.js"
import { urlSubmission } from "../controllers/url.controller.js"
import { urlSchema } from "../schemas/url.schema.js"

const urlRouter = Router()

urlRouter.post("/urls/shorten", validateSession, validateUrlBody(urlSchema), urlSubmission)

export default urlRouter