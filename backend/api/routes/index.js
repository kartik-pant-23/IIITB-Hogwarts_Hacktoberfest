const router = require("express").Router();
const controller = require("../controllers/index");

router.get('/', controller.getData);

module.exports = router;
