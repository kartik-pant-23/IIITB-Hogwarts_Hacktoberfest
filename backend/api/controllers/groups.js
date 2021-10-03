const Group = require("../models/group");
const User = require("../models/user")

// GET data of all groups
exports.getGroups = function (req, res, next) {
	Group.find().exec()
		.then((groups) => {
			res.status(200).json({
				message: "Succesful!",
				data: groups
			})
		})
		.catch(err => next(err));
}

//get the group details
exports.getGroupDetails = function (req, res, next) {
	Group.findById(req.params.groupId)
		.exec()
		.then((group) => {
			if (!group) {
				next({ status: 404, message: 'Group does not exist!' });
			} else {
				User.find({ group: req.params.groupId })
					.sort({ score: -1 })
					.select('_id name score about')
					.exec()
					.then((users) => {
						res.status(200).json({
							message: 'Successful!',
							data: {
								groupDetails: group,
								members: users
							}
						})
					})
					.catch(err => next(err));
			}
		})
		.catch(err => next(err));
}