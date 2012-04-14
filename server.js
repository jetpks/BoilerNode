#!/usr/local/bin/node
(function() {
  "use strict";

  var connect = require('connect')
    , connect_router = require('connect_router')
    , publicPath = __dirname + '/public'
    , someRoute = require('./routes/some-route.js')
    , server
    ;

  server = connect()
    .use(connect_router(someRoute))
    .use(connect.static(publicPath))
    .use(connect.directory(publicPath))
    ;

  module.exports = server;
}());
