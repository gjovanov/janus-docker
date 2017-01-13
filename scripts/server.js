"use strict";

var express = require("express"),
    bodyParser = require("body-parser"),
    errorhandler = require("errorhandler"),
    morgan = require("morgan"),
    fs = require("fs"),
    https = require("https"),
    http = require("http"),
    path = require('path'),
    mime = require('mime');

var options = {
  key: fs.readFileSync(process.env.JANUS_PATH + '/certs/mycert.key'),
  cert: fs.readFileSync(process.env.JANUS_PATH + '/certs/mycert.pem')
};



var app = express();
app.use(errorhandler({
    dumpExceptions: true,
    showStack: true
}));
app.use(morgan("dev"));
app.use(express.static(process.env.JANUS_PATH + "/web"));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
    res.header("Access-Control-Allow-Headers", "origin, content-type");
    if (req.method == "OPTIONS") {
        res.send(200);
    } else {
        next();
    }
});

var httpServer = http.createServer(app).listen(80);
var httpsServer = https.createServer(options, app).listen(443);
