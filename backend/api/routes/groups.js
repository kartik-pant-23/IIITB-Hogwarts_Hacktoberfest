const express = require("express");
const router = express.Router();

const controller = require("../controllers/groups")

// TODO: Following requests require JWT authentication
// 1. Token should be sent in the headers, and only authenticated users 
// should have access to the content.
// HINT:- Create a middleware which verifies the token and passes on the _id of user
// if the token is verified, otherwise throws an error.
router.get('/', controller.getGroups);
router.get('/:groupId', controller.getGroupDetails);

module.exports = router;