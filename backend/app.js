const express = require("express");
const app = express();

const indexRoute = require("./api/routes/index");
const usersRoute = require("./api/routes/users");
const groupsRoute = require("./api/routes/groups");
const discussionsRoute = require("./api/routes/discussions");
const projectsRoute = require("./api/routes/projects");

app.use(express.json());
app.use(express.urlencoded({ extended: false }));

const connectDB = require("./api/routes/db_controller");
connectDB();

app.get('/', (req, res) => {
    res.status(200).json({ message: "Server up and running!" })
});
app.use('/home', indexRoute);
app.use('/users', usersRoute);
app.use('/groups', groupsRoute);
app.use('/discussions', discussionsRoute);
app.use('/projects', projectsRoute);

app.use((req, res, next) => {
    var err = Error("Route not implemented!");
    err.status = 404;
    next(err);
});
app.use((err, req, res, next) => {
    console.log({ message: err.message, debug: err });
    res.status(err.status || 500).json({
        status: err.status || 500,
        message: err.message || "Internal Server Error!"
    })
});
module.exports = app;
