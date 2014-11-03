"use strict"

module.exports = ->
  class HeaderCtrl
    constructor: (@$scope, @$rootScope, @$log) ->
      @$log.debug "header init"
      @$scope.model =
        message: if $scope.app.isAuthenticated then "&#5864;" else "Login"
      @$rootScope.$on "auth-login-success", ->
        @$scope.model.message = "&#5864;"
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
