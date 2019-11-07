import bcrypt from 'bcrypt'
import jwt from 'jsonwebtoken'



export const getHashedPassword = (password) =>{
    
    return new Promise( async (resolve,reject)=>{
         await bcrypt.hash(password, 10, function(err, hash) {
            if(hash)
                resolve(hash)
            else
                reject(err)
        })
    })

}

export const confirmPassword = (password,hashedPassword) => {

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
export const verifyJWTToken = (token) => {

    return new Promise((res,rej) => {

        jwt.verify(token,process.env.SECRET, (err, decoded) => {

            if(err) 
                rej(err)
            else 
                res(decoded)

        })

    })

}


export const generateJWTUser = (username, age, birthPlace) => {

    const payload = {
        username: username,
        age: age,
        birthPlace: birthPlace
    }

    return jwt.sign(payload,process.env.SECRET)
}



