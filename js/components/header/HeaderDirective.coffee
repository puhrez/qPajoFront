"use strict"

module.exports = ->
  class HeaderCtrl
    constructor: (@$scope, @$rootScope, @$log) ->
    openLogin: ->
      @$scope.app.showLogin = true
      @$log.debug "opening login"
  restrict: 'E'
  controllerAs: "HeaderCtrl"
  controller: [
    "$scope",
    "$rootScope",
    "$log", ($scope, $rootScope, $log) ->
      new HeaderCtrl($scope, $rootScope, $log)
  ]
  template: require "./header.html"
