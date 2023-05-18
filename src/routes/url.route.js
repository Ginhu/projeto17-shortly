import { Router } from "express"
import { validateOwnership, validateShortUrl, validateUrlBody, validateUrlById } from "../middlewares/url.validate.js"
import { validateSession } from "../middlewares/auth.validate.js"
import { deleteUrl, getShortUrl, getUrlById, urlSubmission } from "../controllers/url.controller.js"
import { urlSchema } from "../schemas/url.schema.js"

const urlRouter = Router()

urlRouter.post("/urls/shorten", validateSession, validateUrlBody(urlSchema), urlSubmission)
urlRouter.get("/urls/:id", validateUrlById, getUrlById)
urlRouter.get("/urls/open/:shortUrl", validateShortUrl, getShortUrl)
urlRouter.delete("/urls/:id", validateSession, validateUrlById, validateOwnership, deleteUrl)

export default urlRouter