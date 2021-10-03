const router = require("express").Router();

const controller = require("../controllers/projects");

router.get('/', controller.getAllProjects);
router.post('/', controller.addProject);

module.exports = router;