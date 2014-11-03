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
  .controller "qpajo.appCtrl", require "./appCtrl.coffee"
  .config require "./routes.coffee"
  .config ["$logProvider", ($logProvider) ->
    $logProvider.debugEnabled true
  ]
  .run require "./fakeBack.coffee" #for E2E