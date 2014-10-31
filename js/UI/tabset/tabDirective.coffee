"use strict"
angular = require "angular"
module.exports = ->
  restrict: "E"
  require: "^tabset"
  scope:
    title: "@"
    templateUrl: "@"
  link: (scope, el, attr, tabsetCtrl) ->
    console.log "tab init"
    #console.dir tabsetCtrl
    tabsetCtrl.addTab scope
    scope.select = ->
      tabsetCtrl.selectTab scope
    scope.$watch("selected", ->
      if scope.selected
        console.log "loading template", scope.templateUrl
        tabsetCtrl.setTabTemplate scope.templateUrl
    )
  template: require "./tab.html"
