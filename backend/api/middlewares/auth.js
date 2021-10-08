// TODO: Perform JWT authentication here
const jwt = require("jsonwebtoken");
const User= require("../models/user");


const requireAuth=(req,res,next)=>{
    //require the token from client headers
    const token= req.headers.authorization.split(' ')[1];
    if(token)
    {
    User.findByToken(token,(err, user)=>{
        if(err)
        {
            next(err);
        }
        else
        {    req.user= user;
             next();
        }
    })
   }
   else
   {
       throw Error("User must be logged in");
   }
}
module.exports=requireAuth;