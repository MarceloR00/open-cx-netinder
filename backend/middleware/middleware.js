const verifyJWTToken = require('../utils/hash');

const tokenMiddleware = async (req,res,next) => {
    //NOT TRY TO VERIFY TOKEN IF ITS NOT CREATED 
    if(req.path=='/login' || req.path=='/register'){
     next()
    }
    else{
        if(!req.headers.hasOwnProperty('authorization')) {
            res.status(401)
            res.send('API call not authorized, missing token')
        }

        //TODO: add a verification to see if it's not the register or the login requests, these ones dont send token
        //to check that just make a console.log(req) to discover in which property says the request
        else {
            const token = req.headers.authorization.split(' ')[1]

            try {
                const decoded = await verifyJWTToken(token)
                req.user = decoded
                next()
            }

            catch(err) {
                res.status(401)
                res.send('API call not authorized, invalid token')
            }
        }
    }
}

    module.exports = tokenMiddleware;