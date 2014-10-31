"use strict"
angular = require "angular"
module.exports = angular.module "qpajo.services", []
  .factory "AuthService", ["$http", "SessionService",
                            require "./AuthService.coffee"]
  .factory "StateService", ["$location", require "./stateService.coffee"]
  .service "SessionService", require "./SessionService.coffee"
