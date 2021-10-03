const Group = require("../models/group")
const Project = require("../models/project")

exports.getData = function (req, res, next) {
    // TODO: Retrieve data of all the groups sorted in non-increasing order of 
    // their group_score. And 10 most recent projects, and current discussion topic.
    // For now, all the groups data is retrieved and shown.
    Group.find().select('-chat').exec()
	.then(groupsData => {
	    Project.find().populate('author_uid', 'name').exec()
		.then(projects => res.status(200).json({
		    message: "Data loaded!",
		    groups: groupsData, 
		    projects: projects
		}))
		.catch(err => next(err))
	})
	.catch(err => next(err));
}
