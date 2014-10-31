"use strict"

angular = require "angular"
module.exports = ->
  class TabSetCtrl
    constructor: (@$scope) ->
      @$scope.templateUrl = ""
      @tabs = @$scope.tabs = []
    selectTab: (tab) ->
      angular.forEach(@tabs, (tab) ->
        tab.selected = false
      )
      tab.selected = true
    setTabTemplate: (templateUrl) ->
      console.log "setting template"
      @$scope.templateUrl = templateUrl
    addTab: (tab) ->
      if @tabs.length == 0
        @selectTab tab
      @tabs.push tab

  console.log "tabset init"
  restrict: "E"
  transclude: true
  controllerAs: "TabsetCtrl"
  controller: ["$scope", ($scope) ->
    new TabSetCtrl($scope)
  ]
  template: require "./tabset.html"

  