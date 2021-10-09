// TODO: Perform JWT authentication here
const jwt = require("jsonwebtoken");
const User = require("../models/user");

const requireAuth = (req, res, next) => {
  //require the token from client headers
  const token = req.headers.authorization.split(" ")[1];
  if (token) {
    User.findByToken(token, (err, user) => {
      if (err) {
        next(err);
      } else {
        if (user) {
          req.user = user;
          next();
        } else {
          res.status(401).json({ message: "Authentication failed!" });
        }
      }
    });
  } else {
    res.status(401).json({ message: "Authentication failed!" });

  }
};
module.exports = requireAuth;
