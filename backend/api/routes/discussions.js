const router = require("express").Router()

const controller = require("../controllers/discussions");

router.get('/', controller.getDiscussions);
router.post('/', controller.postDiscussion);

module.exports = router