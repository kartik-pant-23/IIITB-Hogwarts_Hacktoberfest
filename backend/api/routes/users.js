const router = require("express").Router();
const controller = require("../controllers/users");
const requireAuth=require('../middlewares/auth');
router.post('/register', controller.register);
router.post('/login', controller.login);

// TODO: Following requests require JWT authentication
// 1. Token should be sent in the headers, and only authenticated users 
// should have access to the content.
// HINT:- Create a middleware which verifies the token and passes on the _id of user
// if the token is verified, otherwise throws an error.
router.get('/',requireAuth, controller.getCurrentUser);
router.get('/:userId',requireAuth, controller.getUserDetails);
router.patch('/', requireAuth, controller.update);

module.exports = router;