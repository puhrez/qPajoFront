"use strict"

require "angular"
require "angular-route/angular-route"

angular.module("qpajo", [
  "ngRoute"
  require("./constants/index.coffee").name
  require("./services/index.coffee").name
  require("./UI/index.coffee").name
  require("./components/index.coffee").name
])
  .controller "qpajo.appCtrl", ["$scope", "USER_ROLES",
                                "AuthService", require "./appCtrl.coffee"]
  .config require "./routes.coffee"