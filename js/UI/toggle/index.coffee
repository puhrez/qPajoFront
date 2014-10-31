"use strict"

angular = require "angular"

module.exports = angular.module "toggle", []
  .directive "toggle", require "./toggleDirective.coffee"
