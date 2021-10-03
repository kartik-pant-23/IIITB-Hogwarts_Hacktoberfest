const Project = require("../models/project");

// Get lists of all added projects
exports.getAllProjects = function (req, res, next) {
	Project.find()
		.sort({ _id: -1 })
		.populate('author_uid', 'name')
		.exec()
		.then((docs) => {
			res.status(200).json({
				message: "Successful!",
				count: docs.length,
				data: docs
			})
		})
		.catch(err => next(err));
}

// Add a new project
exports.addProject = function (req, res, next) {
	// TODO: 
	// 1. Instead of taking user details in the request, fetch it after verifying the token.
	// 2. Increment user's score as well as group's score.
	const {
		project_title,
		project_url,
		banner_url,
		author_year,
		author_uid } = req.body

	const project = new Project({
		project_title: project_title,
		project_url: project_url,
		banner_url: banner_url,
		author_year: author_year,
		author_uid: author_uid
	});

	project.save()
		.then((savedProject) => {
			res.status(200).json({
				message: 'Project saved successfully!',
				data: savedProject
			})
		})
		.catch(err => next(err));

}