const Discussion = require("../models/discussion")

exports.getDiscussions = function (req, res, next) {
    Discussion.find().sort({_id: -1}).exec()
    .then((docs) => {
        res.status(200).json({
            count: docs.length,
            data: docs
        })
    })
    .catch(err => next(err));
}

exports.postDiscussion = function (req, res, next) {
    const discussion = Discussion(req.body);
    discussion.save()
    .then((doc) => {
        res.status(200).json({
            message: "Successfully created!",
            data: doc
        })
    })
    .catch(err => next(err));
}