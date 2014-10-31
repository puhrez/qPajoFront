"use strict"

module.exports = ->
  class ToggleCtrl
    state = "right"
    constructor: (@$scope) ->
      @right = @$scope.right
      @left = @$scope.left
      @bool = @$scope.ctrl.bool
      console.log "toggle init"
    toggle: (e) ->
      side = e.target.className.split(" ")[0]
      if @state isnt side
        @state = side
        @bool = !@bool
        @$scope.ctrl.switch()
  scope:
    right: "="
    left: "="
    ctrl: "="
  restrict: "E"
  controllerAs: "ToggleCtrl"
  controller: ["$scope", ($scope) ->
    new ToggleCtrl($scope)
  ]
  template: require "./toggle.html"