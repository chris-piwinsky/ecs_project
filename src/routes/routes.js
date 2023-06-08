var express = require("express"),
    apiRouter = express();


apiRouter.use("/user", require('./users'));

module.exports = apiRouter;