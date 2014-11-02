"use strict"

require "angular"
require "angular-route/angular-route"
require "angular-mocks/angular-mocks"
angular.module("qpajo", [
  "ngRoute"
  require("./constants/index.coffee").name
  require("./services/index.coffee").name
  require("./UI/index.coffee").name
  require("./components/index.coffee").name
  "ngMockE2E"
])
  .controller "qpajo.appCtrl", ["$scope", "USER_ROLES",
                                "AuthService", require "./appCtrl.coffee"]
  .config require "./routes.coffee"
  #.run require "./fakeBack.coffee" #for E2E
