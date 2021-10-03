const Group = require("../models/group");
const User = require("../models/user");

// Register new user
exports.register = function (req, res, next) {
    // TODO: 
    // 1. Groups are assigned randomly, instead assign groups in such a manner
    // that each group has equal number of members. 
    // 2. With every user registering, increment numOfMembers field in Group Schema.
    Group.find().exec()
        .then(groups => {
            groupNum = Math.floor(Math.random() % 4);
            const user = new User({
                name: req.body.name,
                email: req.body.email,
                password: req.body.password,
                group: groups[groupNum]._id
            });
            user.save()
                .then(createdUser => {
                    createdUser.generateToken((err, token) => {
                        if (err) next(err);
                        else {
			    createdUser.group = groups[groupNum]
                            res.status(200).json({
                                message: "User created!",
				createdUser: createdUser,
                                token: token
                            })
                        }
                    })
                })
                .catch(err => next(err));
        })
        .catch(err => next(err));
}

// Login user
exports.login = function (req, res, next) {
    User.findOne({ email: req.body.email }).select('+password').exec()
        .then(user => {
            if (!user) {
                next({ status: 404, message: "User does not exist!" });
            } else {
                user.comparePassword(req.body.password, function (err, isMatch) {
                    if (!isMatch) {
                        next({ status: 401, message: "Authentication failed!" });
                    } else {
                        user.generateToken(function (err, token) {
                            if (err) next(err);
                            else {
                                return res.status(200).json({
                                    message: "Login successful!",
                                    token: token
                                })
                            }
                        });
                    }
                });
            }
        })
        .catch(err => next(err));
}

// Get a users info after verifying token
exports.getCurrentUser = function (req, res, next) {
    // TDOD: After verifying token you should be able to get _id as req.user._id
    // Use this id to fetch user details.
    res.status(200).json({ message: "Implementation pending!" });
}

// Get user details
exports.getUserDetails = function (req, res, next) {
    User.findOne({ _id: req.params.userId }).exec()
        .then(user => {
            if(!user) next({ status: 404, message: "User does not exist!" });
            else res.status(200).json({ user: user });
        })
        .catch(err => next(err));
}

// Update user details
exports.update = function (req, res, next) {
    // TDOD: After verifying token you should be able to get _id as req.user._id
    // Use this id to fetch and update user details (social media handles).
    res.status(200).json({ message: "Implementation pending!" });
}
