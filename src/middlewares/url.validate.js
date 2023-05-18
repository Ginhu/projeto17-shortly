export function validateUrlBody (schema) {
    return (req, res, next) => {
        const {url} = req.body
        const validation = schema.validate(req.body, { earlyAbort: false })

        res.locals.url = url
        
        if(validation.error) {
            const errors = validation.error.details.map(err=>err.message)
            return res.status(422).send(errors)
        }
        next()
    }
}

