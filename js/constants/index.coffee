"use strict"
angular = require "angular"
module.exports = angular.module "qpajo.constants", []
  .constant "USER_ROLES", require "./USER_ROLES.coffee"
  .constant "AUTH_EVENTS", require "./AUTH_EVENTS.coffee"