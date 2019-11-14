const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

const getHashedPassword = (password) =>{
    
    return new Promise( async (resolve,reject)=>{
         await bcrypt.hash(password, 10, function(err, hash) {
            if(hash)
                resolve(hash)
            else
                reject(err)
        })
    })

}

const confirmPassword = (password,hashedPassword) => {

    return new Promise(async(resolve,reject) => {

        await bcrypt.compare(password,hashedPassword, (err,res) => {

            if(res) {
                resolve(true)
            }
            else 
                reject(false)
        })
    })
}

const verifyJWTToken = (token) => {

    return new Promise((res,rej) => {

        jwt.verify(token,process.env.SECRET, (err, decoded) => {

            if(err) 
                rej(err)
            else 
                res(decoded)
        })
    })
}


const generateJWTUser = (username, age, birthPlace) => {

    const payload = {
        username: username,
        age: age,
        birthPlace: birthPlace
    }
    return jwt.sign(payload,process.env.SECRET)
}

module.exports = getHashedPassword;
module.exports = confirmPassword;
module.exports = verifyJWTToken;
module.exports = generateJWTUser;