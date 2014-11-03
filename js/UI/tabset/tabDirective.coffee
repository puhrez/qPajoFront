"use strict"
angular = require "angular"
module.exports = ->
  restrict: "E"
  require: "^tabset"
  scope:
    title: "@"
    templateUrl: "@"
  link: (scope, el, attr, tabsetCtrl) ->
    tabsetCtrl.addTab scope
    scope.select = ->
      tabsetCtrl.selectTab scope
    scope.$watch("selected", ->
      if scope.selected
        tabsetCtrl.setTabTemplate scope.templateUrl
    )
  template: require "./tab.html"
