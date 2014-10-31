"use strict"
angular = require "angular"
module.exports = angular.module "qpajo.login.main", []
  .directive "qpajo.login", require "./loginDirective.coffee"
