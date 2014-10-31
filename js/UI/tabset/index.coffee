"use stict"

angular = require "angular"

module.exports = angular.module "tabset", []
  .directive "tabset", require "./tabsetDirective.coffee"
  #.controller "tabsetCtrl", require "./tabsetCtrl.coffee"
  .directive "tab", require "./tabDirective.coffee"