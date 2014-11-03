"use strict"
angular = require "angular"
module.exports = angular.module "qpajo.services", []
  .factory "AuthService", require "./AuthService.coffee"
  .factory "StateService", require "./stateService.coffee"
  .service "SessionService", require "./SessionService.coffee"
