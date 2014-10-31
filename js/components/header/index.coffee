"use strict"
angular = require "angular"
module.exports = angular.module "qpajo.header.main", []
  .directive "qpajo.header", require "./HeaderDirective.coffee"