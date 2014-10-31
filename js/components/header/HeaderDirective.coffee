"use strict"

module.exports = ->
  class HeaderCtrl
    constructor: (@$scope) ->
      console.log "header init"
      @$scope.model =
        message: "Sign-in"
    openLogin: ->
      @$scope.app.showLogin = true
      console.log "opening login"
  restrict: 'E'
  controllerAs: "HeaderCtrl"
  controller: ["$scope", ($scope) ->
    new HeaderCtrl($scope)
  ]
  template: require "./header.html"
